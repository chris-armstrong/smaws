open Types
open Service_metadata
open Xml_deserializers
open Xml_serializers
open Smaws_Lib.Xml.Parse

module CompleteMultipartUpload = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : complete_multipart_upload_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.upload_id in
           [ ("uploadId", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.checksum_cr_c32 with
          | Some v -> [ ("x-amz-checksum-crc32", v) ]
          | None -> []);
          (match request.checksum_crc32_c with
          | Some v -> [ ("x-amz-checksum-crc32c", v) ]
          | None -> []);
          (match request.checksum_crc64nvm_e with
          | Some v -> [ ("x-amz-checksum-crc64nvme", v) ]
          | None -> []);
          (match request.checksum_sh_a1 with
          | Some v -> [ ("x-amz-checksum-sha1", v) ]
          | None -> []);
          (match request.checksum_sh_a256 with
          | Some v -> [ ("x-amz-checksum-sha256", v) ]
          | None -> []);
          (match request.checksum_sh_a512 with
          | Some v -> [ ("x-amz-checksum-sha512", v) ]
          | None -> []);
          (match request.checksum_m_d5 with Some v -> [ ("x-amz-checksum-md5", v) ] | None -> []);
          (match request.checksum_xxhas_h64 with
          | Some v -> [ ("x-amz-checksum-xxhash64", v) ]
          | None -> []);
          (match request.checksum_xxhas_h3 with
          | Some v -> [ ("x-amz-checksum-xxhash3", v) ]
          | None -> []);
          (match request.checksum_xxhas_h128 with
          | Some v -> [ ("x-amz-checksum-xxhash128", v) ]
          | None -> []);
          (match request.checksum_type with
          | Some v ->
              [
                ( "x-amz-checksum-type",
                  (fun (v : checksum_type) ->
                    match v with COMPOSITE -> "COMPOSITE" | FULL_OBJECT -> "FULL_OBJECT")
                    v );
              ]
          | None -> []);
          (match request.mpu_object_size with
          | Some v ->
              [ ("x-amz-mp-object-size", (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.if_match with Some v -> [ ("If-Match", v) ] | None -> []);
          (match request.if_none_match with Some v -> [ ("If-None-Match", v) ] | None -> []);
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.sse_customer_key with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.multipart_upload with
      | Some v ->
          Some
            (let w = Smaws_Lib.Xml.Write.make () in
             Smaws_Lib.Xml.Write.element w "CompleteMultipartUpload"
               ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
                 completed_multipart_upload_to_xml w v);
             ("application/xml", Smaws_Lib.Xml.Write.to_string w))
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"CompleteMultipartUpload" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_location = ref None in
            let r_bucket = ref None in
            let r_key = ref None in
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
            Structure.scanSequence i
              [
                "Location";
                "Bucket";
                "Key";
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
              ] (fun tag _ ->
                match tag with
                | "Location" ->
                    r_location :=
                      Some (Read.sequence i "Location" (fun i attrs -> location_of_xml i attrs) ())
                | "Bucket" ->
                    r_bucket :=
                      Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
                | "Key" ->
                    r_key :=
                      Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
                | "ETag" ->
                    r_e_tag :=
                      Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
                | "ChecksumCRC32" ->
                    r_checksum_cr_c32 :=
                      Some
                        (Read.sequence i "ChecksumCRC32"
                           (fun i attrs -> checksum_cr_c32_of_xml i attrs)
                           ())
                | "ChecksumCRC32C" ->
                    r_checksum_crc32_c :=
                      Some
                        (Read.sequence i "ChecksumCRC32C"
                           (fun i attrs -> checksum_crc32_c_of_xml i attrs)
                           ())
                | "ChecksumCRC64NVME" ->
                    r_checksum_crc64nvm_e :=
                      Some
                        (Read.sequence i "ChecksumCRC64NVME"
                           (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                           ())
                | "ChecksumSHA1" ->
                    r_checksum_sh_a1 :=
                      Some
                        (Read.sequence i "ChecksumSHA1"
                           (fun i attrs -> checksum_sh_a1_of_xml i attrs)
                           ())
                | "ChecksumSHA256" ->
                    r_checksum_sh_a256 :=
                      Some
                        (Read.sequence i "ChecksumSHA256"
                           (fun i attrs -> checksum_sh_a256_of_xml i attrs)
                           ())
                | "ChecksumSHA512" ->
                    r_checksum_sh_a512 :=
                      Some
                        (Read.sequence i "ChecksumSHA512"
                           (fun i attrs -> checksum_sh_a512_of_xml i attrs)
                           ())
                | "ChecksumMD5" ->
                    r_checksum_m_d5 :=
                      Some
                        (Read.sequence i "ChecksumMD5"
                           (fun i attrs -> checksum_m_d5_of_xml i attrs)
                           ())
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
                      Some
                        (Read.sequence i "ChecksumType"
                           (fun i attrs -> checksum_type_of_xml i attrs)
                           ())
                | _ -> Read.skip_element i);
            ({
               location = ( ! ) r_location;
               bucket = ( ! ) r_bucket;
               key = ( ! ) r_key;
               expiration = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-expiration";
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
               server_side_encryption =
                 Option.map
                   (fun s ->
                     (match s with
                      | "AES256" -> AES256
                      | "aws:fsx" -> Aws_fsx
                      | "aws:kms" -> Aws_kms
                      | "aws:kms:dsse" -> Aws_kms_dsse
                      | _ -> failwith "unknown enum value"
                       : server_side_encryption))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption");
               version_id = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-version-id";
               ssekms_key_id =
                 Smaws_Lib.Protocols.RestXml.header_value headers
                   "x-amz-server-side-encryption-aws-kms-key-id";
               bucket_key_enabled =
                 Option.map
                   (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
                   (Smaws_Lib.Protocols.RestXml.header_value headers
                      "x-amz-server-side-encryption-bucket-key-enabled");
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
             }
              : complete_multipart_upload_output)))
      ~error_deserializer
end

module CopyObject = struct
  let error_to_string = function
    | `ObjectNotInActiveTierError _ -> "com.amazonaws.s3#ObjectNotInActiveTierError"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "ObjectNotInActiveTierError" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> object_not_in_active_tier_error_of_xml i attrs)
        with
        | Ok s -> `ObjectNotInActiveTierError s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : copy_object_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?x-id=CopyObject"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.ac_l with
          | Some v ->
              [
                ( "x-amz-acl",
                  (fun (v : object_canned_ac_l) ->
                    match v with
                    | Private -> "private"
                    | Public_read -> "public-read"
                    | Public_read_write -> "public-read-write"
                    | Authenticated_read -> "authenticated-read"
                    | Aws_exec_read -> "aws-exec-read"
                    | Bucket_owner_read -> "bucket-owner-read"
                    | Bucket_owner_full_control -> "bucket-owner-full-control")
                    v );
              ]
          | None -> []);
          (match request.cache_control with Some v -> [ ("Cache-Control", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.content_disposition with
          | Some v -> [ ("Content-Disposition", v) ]
          | None -> []);
          (match request.content_encoding with Some v -> [ ("Content-Encoding", v) ] | None -> []);
          (match request.content_language with Some v -> [ ("Content-Language", v) ] | None -> []);
          (match request.content_type with Some v -> [ ("Content-Type", v) ] | None -> []);
          (let v = request.copy_source in
           [ ("x-amz-copy-source", v) ]);
          (match request.copy_source_if_match with
          | Some v -> [ ("x-amz-copy-source-if-match", v) ]
          | None -> []);
          (match request.copy_source_if_modified_since with
          | Some v ->
              [
                ( "x-amz-copy-source-if-modified-since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.copy_source_if_none_match with
          | Some v -> [ ("x-amz-copy-source-if-none-match", v) ]
          | None -> []);
          (match request.copy_source_if_unmodified_since with
          | Some v ->
              [
                ( "x-amz-copy-source-if-unmodified-since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.expires with Some v -> [ ("Expires", v) ] | None -> []);
          (match request.grant_full_control with
          | Some v -> [ ("x-amz-grant-full-control", v) ]
          | None -> []);
          (match request.grant_read with Some v -> [ ("x-amz-grant-read", v) ] | None -> []);
          (match request.grant_read_ac_p with
          | Some v -> [ ("x-amz-grant-read-acp", v) ]
          | None -> []);
          (match request.grant_write_ac_p with
          | Some v -> [ ("x-amz-grant-write-acp", v) ]
          | None -> []);
          (match request.if_match with Some v -> [ ("If-Match", v) ] | None -> []);
          (match request.if_none_match with Some v -> [ ("If-None-Match", v) ] | None -> []);
          (match request.metadata_directive with
          | Some v ->
              [
                ( "x-amz-metadata-directive",
                  (fun (v : metadata_directive) ->
                    match v with COPY -> "COPY" | REPLACE -> "REPLACE")
                    v );
              ]
          | None -> []);
          (match request.tagging_directive with
          | Some v ->
              [
                ( "x-amz-tagging-directive",
                  (fun (v : tagging_directive) ->
                    match v with COPY -> "COPY" | REPLACE -> "REPLACE")
                    v );
              ]
          | None -> []);
          (match request.annotation_directive with
          | Some v ->
              [
                ( "x-amz-object-annotation-directive",
                  (fun (v : annotation_directive) ->
                    match v with COPY -> "COPY" | EXCLUDE -> "EXCLUDE")
                    v );
              ]
          | None -> []);
          (match request.server_side_encryption with
          | Some v ->
              [
                ( "x-amz-server-side-encryption",
                  (fun (v : server_side_encryption) ->
                    match v with
                    | AES256 -> "AES256"
                    | Aws_fsx -> "aws:fsx"
                    | Aws_kms -> "aws:kms"
                    | Aws_kms_dsse -> "aws:kms:dsse")
                    v );
              ]
          | None -> []);
          (match request.storage_class with
          | Some v ->
              [
                ( "x-amz-storage-class",
                  (fun (v : storage_class) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.website_redirect_location with
          | Some v -> [ ("x-amz-website-redirect-location", v) ]
          | None -> []);
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.sse_customer_key with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.ssekms_key_id with
          | Some v -> [ ("x-amz-server-side-encryption-aws-kms-key-id", v) ]
          | None -> []);
          (match request.ssekms_encryption_context with
          | Some v -> [ ("x-amz-server-side-encryption-context", v) ]
          | None -> []);
          (match request.bucket_key_enabled with
          | Some v ->
              [ ("x-amz-server-side-encryption-bucket-key-enabled", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.copy_source_sse_customer_algorithm with
          | Some v -> [ ("x-amz-copy-source-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.copy_source_sse_customer_key with
          | Some v -> [ ("x-amz-copy-source-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.copy_source_sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-copy-source-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.tagging with Some v -> [ ("x-amz-tagging", v) ] | None -> []);
          (match request.object_lock_mode with
          | Some v ->
              [
                ( "x-amz-object-lock-mode",
                  (fun (v : object_lock_mode) ->
                    match v with GOVERNANCE -> "GOVERNANCE" | COMPLIANCE -> "COMPLIANCE")
                    v );
              ]
          | None -> []);
          (match request.object_lock_retain_until_date with
          | Some v ->
              [
                ( "x-amz-object-lock-retain-until-date",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v) v );
              ]
          | None -> []);
          (match request.object_lock_legal_hold_status with
          | Some v ->
              [
                ( "x-amz-object-lock-legal-hold",
                  (fun (v : object_lock_legal_hold_status) ->
                    match v with ON -> "ON" | OFF -> "OFF")
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.expected_source_bucket_owner with
          | Some v -> [ ("x-amz-source-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers =
      List.concat [ (match request.metadata with Some v -> [ ("x-amz-meta-", v) ] | None -> []) ]
    in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"CopyObject" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
                       | "ETag" ->
                           r_e_tag :=
                             Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
                       | "LastModified" ->
                           r_last_modified :=
                             Some
                               (Read.sequence i "LastModified"
                                  (fun i attrs -> last_modified_of_xml i attrs)
                                  ())
                       | "ChecksumType" ->
                           r_checksum_type :=
                             Some
                               (Read.sequence i "ChecksumType"
                                  (fun i attrs -> checksum_type_of_xml i attrs)
                                  ())
                       | "ChecksumCRC32" ->
                           r_checksum_cr_c32 :=
                             Some
                               (Read.sequence i "ChecksumCRC32"
                                  (fun i attrs -> checksum_cr_c32_of_xml i attrs)
                                  ())
                       | "ChecksumCRC32C" ->
                           r_checksum_crc32_c :=
                             Some
                               (Read.sequence i "ChecksumCRC32C"
                                  (fun i attrs -> checksum_crc32_c_of_xml i attrs)
                                  ())
                       | "ChecksumCRC64NVME" ->
                           r_checksum_crc64nvm_e :=
                             Some
                               (Read.sequence i "ChecksumCRC64NVME"
                                  (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                                  ())
                       | "ChecksumSHA1" ->
                           r_checksum_sh_a1 :=
                             Some
                               (Read.sequence i "ChecksumSHA1"
                                  (fun i attrs -> checksum_sh_a1_of_xml i attrs)
                                  ())
                       | "ChecksumSHA256" ->
                           r_checksum_sh_a256 :=
                             Some
                               (Read.sequence i "ChecksumSHA256"
                                  (fun i attrs -> checksum_sh_a256_of_xml i attrs)
                                  ())
                       | "ChecksumSHA512" ->
                           r_checksum_sh_a512 :=
                             Some
                               (Read.sequence i "ChecksumSHA512"
                                  (fun i attrs -> checksum_sh_a512_of_xml i attrs)
                                  ())
                       | "ChecksumMD5" ->
                           r_checksum_m_d5 :=
                             Some
                               (Read.sequence i "ChecksumMD5"
                                  (fun i attrs -> checksum_m_d5_of_xml i attrs)
                                  ())
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
                     : copy_object_result))))
        in
        ({
           copy_object_result = payload_val;
           expiration = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-expiration";
           copy_source_version_id =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-copy-source-version-id";
           version_id = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-version-id";
           server_side_encryption =
             Option.map
               (fun s ->
                 (match s with
                  | "AES256" -> AES256
                  | "aws:fsx" -> Aws_fsx
                  | "aws:kms" -> Aws_kms
                  | "aws:kms:dsse" -> Aws_kms_dsse
                  | _ -> failwith "unknown enum value"
                   : server_side_encryption))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption");
           sse_customer_algorithm =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-algorithm";
           sse_customer_key_m_d5 =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-key-MD5";
           ssekms_key_id =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-aws-kms-key-id";
           ssekms_encryption_context =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption-context";
           bucket_key_enabled =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers
                  "x-amz-server-side-encryption-bucket-key-enabled");
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : copy_object_output))
      ~error_deserializer
end

module CreateBucket = struct
  let error_to_string = function
    | `BucketAlreadyExists _ -> "com.amazonaws.s3#BucketAlreadyExists"
    | `BucketAlreadyOwnedByYou _ -> "com.amazonaws.s3#BucketAlreadyOwnedByYou"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "BucketAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> bucket_already_exists_of_xml i attrs)
        with
        | Ok s -> `BucketAlreadyExists s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "BucketAlreadyOwnedByYou" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> bucket_already_owned_by_you_of_xml i attrs)
        with
        | Ok s -> `BucketAlreadyOwnedByYou s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : create_bucket_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.ac_l with
          | Some v ->
              [
                ( "x-amz-acl",
                  (fun (v : bucket_canned_ac_l) ->
                    match v with
                    | Private -> "private"
                    | Public_read -> "public-read"
                    | Public_read_write -> "public-read-write"
                    | Authenticated_read -> "authenticated-read")
                    v );
              ]
          | None -> []);
          (match request.grant_full_control with
          | Some v -> [ ("x-amz-grant-full-control", v) ]
          | None -> []);
          (match request.grant_read with Some v -> [ ("x-amz-grant-read", v) ] | None -> []);
          (match request.grant_read_ac_p with
          | Some v -> [ ("x-amz-grant-read-acp", v) ]
          | None -> []);
          (match request.grant_write with Some v -> [ ("x-amz-grant-write", v) ] | None -> []);
          (match request.grant_write_ac_p with
          | Some v -> [ ("x-amz-grant-write-acp", v) ]
          | None -> []);
          (match request.object_lock_enabled_for_bucket with
          | Some v -> [ ("x-amz-bucket-object-lock-enabled", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.object_ownership with
          | Some v ->
              [
                ( "x-amz-object-ownership",
                  (fun (v : object_ownership) ->
                    match v with
                    | BucketOwnerPreferred -> "BucketOwnerPreferred"
                    | ObjectWriter -> "ObjectWriter"
                    | BucketOwnerEnforced -> "BucketOwnerEnforced")
                    v );
              ]
          | None -> []);
          (match request.bucket_namespace with
          | Some v ->
              [
                ( "x-amz-bucket-namespace",
                  (fun (v : bucket_namespace) ->
                    match v with ACCOUNT_REGIONAL -> "account-regional" | GLOBAL -> "global")
                    v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.create_bucket_configuration with
      | Some v ->
          Some
            (let w = Smaws_Lib.Xml.Write.make () in
             Smaws_Lib.Xml.Write.element w "CreateBucketConfiguration"
               ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
                 create_bucket_configuration_to_xml w v);
             ("application/xml", Smaws_Lib.Xml.Write.to_string w))
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"CreateBucket" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           location = Smaws_Lib.Protocols.RestXml.header_value headers "Location";
           bucket_arn = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-bucket-arn";
         }
          : create_bucket_output))
      ~error_deserializer
end

module CreateBucketMetadataConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : create_bucket_metadata_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?metadataConfiguration"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.metadata_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "MetadataConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             metadata_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"CreateBucketMetadataConfiguration" ~service
      ~context ~method_:`POST ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module CreateBucketMetadataTableConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : create_bucket_metadata_table_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?metadataTable"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.metadata_table_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "MetadataTableConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             metadata_table_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"CreateBucketMetadataTableConfiguration"
      ~service ~context ~method_:`POST ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module CreateMultipartUpload = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : create_multipart_upload_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?uploads"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.ac_l with
          | Some v ->
              [
                ( "x-amz-acl",
                  (fun (v : object_canned_ac_l) ->
                    match v with
                    | Private -> "private"
                    | Public_read -> "public-read"
                    | Public_read_write -> "public-read-write"
                    | Authenticated_read -> "authenticated-read"
                    | Aws_exec_read -> "aws-exec-read"
                    | Bucket_owner_read -> "bucket-owner-read"
                    | Bucket_owner_full_control -> "bucket-owner-full-control")
                    v );
              ]
          | None -> []);
          (match request.cache_control with Some v -> [ ("Cache-Control", v) ] | None -> []);
          (match request.content_disposition with
          | Some v -> [ ("Content-Disposition", v) ]
          | None -> []);
          (match request.content_encoding with Some v -> [ ("Content-Encoding", v) ] | None -> []);
          (match request.content_language with Some v -> [ ("Content-Language", v) ] | None -> []);
          (match request.content_type with Some v -> [ ("Content-Type", v) ] | None -> []);
          (match request.expires with Some v -> [ ("Expires", v) ] | None -> []);
          (match request.grant_full_control with
          | Some v -> [ ("x-amz-grant-full-control", v) ]
          | None -> []);
          (match request.grant_read with Some v -> [ ("x-amz-grant-read", v) ] | None -> []);
          (match request.grant_read_ac_p with
          | Some v -> [ ("x-amz-grant-read-acp", v) ]
          | None -> []);
          (match request.grant_write_ac_p with
          | Some v -> [ ("x-amz-grant-write-acp", v) ]
          | None -> []);
          (match request.server_side_encryption with
          | Some v ->
              [
                ( "x-amz-server-side-encryption",
                  (fun (v : server_side_encryption) ->
                    match v with
                    | AES256 -> "AES256"
                    | Aws_fsx -> "aws:fsx"
                    | Aws_kms -> "aws:kms"
                    | Aws_kms_dsse -> "aws:kms:dsse")
                    v );
              ]
          | None -> []);
          (match request.storage_class with
          | Some v ->
              [
                ( "x-amz-storage-class",
                  (fun (v : storage_class) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.website_redirect_location with
          | Some v -> [ ("x-amz-website-redirect-location", v) ]
          | None -> []);
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.sse_customer_key with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.ssekms_key_id with
          | Some v -> [ ("x-amz-server-side-encryption-aws-kms-key-id", v) ]
          | None -> []);
          (match request.ssekms_encryption_context with
          | Some v -> [ ("x-amz-server-side-encryption-context", v) ]
          | None -> []);
          (match request.bucket_key_enabled with
          | Some v ->
              [ ("x-amz-server-side-encryption-bucket-key-enabled", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.tagging with Some v -> [ ("x-amz-tagging", v) ] | None -> []);
          (match request.object_lock_mode with
          | Some v ->
              [
                ( "x-amz-object-lock-mode",
                  (fun (v : object_lock_mode) ->
                    match v with GOVERNANCE -> "GOVERNANCE" | COMPLIANCE -> "COMPLIANCE")
                    v );
              ]
          | None -> []);
          (match request.object_lock_retain_until_date with
          | Some v ->
              [
                ( "x-amz-object-lock-retain-until-date",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v) v );
              ]
          | None -> []);
          (match request.object_lock_legal_hold_status with
          | Some v ->
              [
                ( "x-amz-object-lock-legal-hold",
                  (fun (v : object_lock_legal_hold_status) ->
                    match v with ON -> "ON" | OFF -> "OFF")
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.checksum_type with
          | Some v ->
              [
                ( "x-amz-checksum-type",
                  (fun (v : checksum_type) ->
                    match v with COMPOSITE -> "COMPOSITE" | FULL_OBJECT -> "FULL_OBJECT")
                    v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers =
      List.concat [ (match request.metadata with Some v -> [ ("x-amz-meta-", v) ] | None -> []) ]
    in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"CreateMultipartUpload" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_bucket = ref None in
            let r_key = ref None in
            let r_upload_id = ref None in
            Structure.scanSequence i [ "Bucket"; "Key"; "UploadId" ] (fun tag _ ->
                match tag with
                | "Bucket" ->
                    r_bucket :=
                      Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
                | "Key" ->
                    r_key :=
                      Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
                | "UploadId" ->
                    r_upload_id :=
                      Some
                        (Read.sequence i "UploadId"
                           (fun i attrs -> multipart_upload_id_of_xml i attrs)
                           ())
                | _ -> Read.skip_element i);
            ({
               abort_date =
                 Option.map
                   (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string s)
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-abort-date");
               abort_rule_id =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-abort-rule-id";
               bucket = ( ! ) r_bucket;
               key = ( ! ) r_key;
               upload_id = ( ! ) r_upload_id;
               server_side_encryption =
                 Option.map
                   (fun s ->
                     (match s with
                      | "AES256" -> AES256
                      | "aws:fsx" -> Aws_fsx
                      | "aws:kms" -> Aws_kms
                      | "aws:kms:dsse" -> Aws_kms_dsse
                      | _ -> failwith "unknown enum value"
                       : server_side_encryption))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption");
               sse_customer_algorithm =
                 Smaws_Lib.Protocols.RestXml.header_value headers
                   "x-amz-server-side-encryption-customer-algorithm";
               sse_customer_key_m_d5 =
                 Smaws_Lib.Protocols.RestXml.header_value headers
                   "x-amz-server-side-encryption-customer-key-MD5";
               ssekms_key_id =
                 Smaws_Lib.Protocols.RestXml.header_value headers
                   "x-amz-server-side-encryption-aws-kms-key-id";
               ssekms_encryption_context =
                 Smaws_Lib.Protocols.RestXml.header_value headers
                   "x-amz-server-side-encryption-context";
               bucket_key_enabled =
                 Option.map
                   (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
                   (Smaws_Lib.Protocols.RestXml.header_value headers
                      "x-amz-server-side-encryption-bucket-key-enabled");
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
               checksum_algorithm =
                 Option.map
                   (fun s ->
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
                       : checksum_algorithm))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-algorithm");
               checksum_type =
                 Option.map
                   (fun s ->
                     (match s with
                      | "COMPOSITE" -> COMPOSITE
                      | "FULL_OBJECT" -> FULL_OBJECT
                      | _ -> failwith "unknown enum value"
                       : checksum_type))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-type");
             }
              : create_multipart_upload_output)))
      ~error_deserializer
end

module CreateSession = struct
  let error_to_string = function
    | `NoSuchBucket _ -> "com.amazonaws.s3#NoSuchBucket"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "NoSuchBucket" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_bucket_of_xml i attrs)
        with
        | Ok s -> `NoSuchBucket s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : create_session_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?session"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.session_mode with
          | Some v ->
              [
                ( "x-amz-create-session-mode",
                  (fun (v : session_mode) ->
                    match v with ReadOnly -> "ReadOnly" | ReadWrite -> "ReadWrite")
                    v );
              ]
          | None -> []);
          (match request.server_side_encryption with
          | Some v ->
              [
                ( "x-amz-server-side-encryption",
                  (fun (v : server_side_encryption) ->
                    match v with
                    | AES256 -> "AES256"
                    | Aws_fsx -> "aws:fsx"
                    | Aws_kms -> "aws:kms"
                    | Aws_kms_dsse -> "aws:kms:dsse")
                    v );
              ]
          | None -> []);
          (match request.ssekms_key_id with
          | Some v -> [ ("x-amz-server-side-encryption-aws-kms-key-id", v) ]
          | None -> []);
          (match request.ssekms_encryption_context with
          | Some v -> [ ("x-amz-server-side-encryption-context", v) ]
          | None -> []);
          (match request.bucket_key_enabled with
          | Some v ->
              [ ("x-amz-server-side-encryption-bucket-key-enabled", (fun v -> string_of_bool v) v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"CreateSession" ~service ~context ~method_:`GET
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_credentials = ref None in
            Structure.scanSequence i [ "Credentials" ] (fun tag _ ->
                match tag with
                | "Credentials" ->
                    r_credentials :=
                      Some
                        (Read.sequence i "Credentials"
                           (fun i attrs -> session_credentials_of_xml i attrs)
                           ())
                | _ -> Read.skip_element i);
            ({
               server_side_encryption =
                 Option.map
                   (fun s ->
                     (match s with
                      | "AES256" -> AES256
                      | "aws:fsx" -> Aws_fsx
                      | "aws:kms" -> Aws_kms
                      | "aws:kms:dsse" -> Aws_kms_dsse
                      | _ -> failwith "unknown enum value"
                       : server_side_encryption))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption");
               ssekms_key_id =
                 Smaws_Lib.Protocols.RestXml.header_value headers
                   "x-amz-server-side-encryption-aws-kms-key-id";
               ssekms_encryption_context =
                 Smaws_Lib.Protocols.RestXml.header_value headers
                   "x-amz-server-side-encryption-context";
               bucket_key_enabled =
                 Option.map
                   (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
                   (Smaws_Lib.Protocols.RestXml.header_value headers
                      "x-amz-server-side-encryption-bucket-key-enabled");
               credentials = required "Credentials" (( ! ) r_credentials) i;
             }
              : create_session_output)))
      ~error_deserializer
end

module DeleteBucket = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucket" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketAnalyticsConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_analytics_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?analytics"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketAnalyticsConfiguration" ~service
      ~context ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketCors = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_cors_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?cors"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketCors" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketEncryption = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_encryption_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?encryption"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketEncryption" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketIntelligentTieringConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_intelligent_tiering_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?intelligent-tiering"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketIntelligentTieringConfiguration"
      ~service ~context ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketInventoryConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_inventory_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?inventory"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketInventoryConfiguration" ~service
      ~context ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketLifecycle = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_lifecycle_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?lifecycle"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketLifecycle" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketMetadataConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_metadata_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?metadataConfiguration"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketMetadataConfiguration" ~service
      ~context ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketMetadataTableConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_metadata_table_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?metadataTable"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketMetadataTableConfiguration"
      ~service ~context ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketMetricsConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_metrics_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?metrics"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketMetricsConfiguration" ~service
      ~context ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketOwnershipControls = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_ownership_controls_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?ownershipControls"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketOwnershipControls" ~service
      ~context ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_policy_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?policy"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketPolicy" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketReplication = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_replication_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?replication"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketReplication" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketTagging = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_tagging_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?tagging"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketTagging" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteBucketWebsite = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_bucket_website_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?website"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteBucketWebsite" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DeleteObject = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_object_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?x-id=DeleteObject"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.mf_a with Some v -> [ ("x-amz-mfa", v) ] | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.bypass_governance_retention with
          | Some v -> [ ("x-amz-bypass-governance-retention", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.if_match with Some v -> [ ("If-Match", v) ] | None -> []);
          (match request.if_match_last_modified_time with
          | Some v ->
              [
                ( "x-amz-if-match-last-modified-time",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.if_match_size with
          | Some v ->
              [ ("x-amz-if-match-size", (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteObject" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           delete_marker =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-delete-marker");
           version_id = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-version-id";
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : delete_object_output))
      ~error_deserializer
end

module DeleteObjectAnnotation = struct
  let error_to_string = function
    | `NoSuchBucket _ -> "com.amazonaws.s3#NoSuchBucket"
    | `NoSuchKey _ -> "com.amazonaws.s3#NoSuchKey"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "NoSuchBucket" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_bucket_of_xml i attrs)
        with
        | Ok s -> `NoSuchBucket s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchKey" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_key_of_xml i attrs)
        with
        | Ok s -> `NoSuchKey s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : delete_object_annotation_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?annotation"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.annotation_name in
           [ ("annotationName", [ v ]) ]);
          (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.object_if_match with
          | Some v -> [ ("x-amz-object-if-match", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteObjectAnnotation" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           object_version_id =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-object-version-id";
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : delete_object_annotation_output))
      ~error_deserializer
end

module DeleteObjects = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_objects_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?delete"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.mf_a with Some v -> [ ("x-amz-mfa", v) ] | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.bypass_governance_retention with
          | Some v -> [ ("x-amz-bypass-governance-retention", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.delete in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "Delete" ~ns:"http://s3.amazonaws.com/doc/2006-03-01/"
           (fun w -> delete_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteObjects" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_deleted = ref None in
            let r_errors = ref None in
            Structure.scanSequence i [ "Deleted"; "Error" ] (fun tag _ ->
                match tag with
                | "Deleted" ->
                    r_deleted :=
                      Some
                        (Read.sequences i "Deleted"
                           (fun i attrs -> deleted_object_of_xml i attrs)
                           ())
                | "Error" ->
                    r_errors :=
                      Some (Read.sequences i "Error" (fun i attrs -> error_of_xml i attrs) ())
                | _ -> Read.skip_element i);
            ({
               deleted = ( ! ) r_deleted;
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
               errors = ( ! ) r_errors;
             }
              : delete_objects_output)))
      ~error_deserializer
end

module DeleteObjectTagging = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_object_tagging_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?tagging"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeleteObjectTagging" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({ version_id = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-version-id" }
          : delete_object_tagging_output))
      ~error_deserializer
end

module DeletePublicAccessBlock = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : delete_public_access_block_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?publicAccessBlock"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DeletePublicAccessBlock" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module GetBucketAbac = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_abac_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?abac"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketAbac" ~service ~context ~method_:`GET
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_status = ref None in
                   Structure.scanSequence i [ "Status" ] (fun tag _ ->
                       match tag with
                       | "Status" ->
                           r_status :=
                             Some
                               (Read.sequence i "Status"
                                  (fun i attrs -> bucket_abac_status_of_xml i attrs)
                                  ())
                       | _ -> Read.skip_element i);
                   ({ status = ( ! ) r_status } : abac_status))))
        in
        ({ abac_status = payload_val } : get_bucket_abac_output))
      ~error_deserializer
end

module GetBucketAccelerateConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_accelerate_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?accelerate"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketAccelerateConfiguration" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_status = ref None in
            Structure.scanSequence i [ "Status" ] (fun tag _ ->
                match tag with
                | "Status" ->
                    r_status :=
                      Some
                        (Read.sequence i "Status"
                           (fun i attrs -> bucket_accelerate_status_of_xml i attrs)
                           ())
                | _ -> Read.skip_element i);
            ({
               status = ( ! ) r_status;
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
             }
              : get_bucket_accelerate_configuration_output)))
      ~error_deserializer
end

module GetBucketAcl = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_acl_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?acl"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketAcl" ~service ~context ~method_:`GET
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_owner = ref None in
            let r_grants = ref None in
            Structure.scanSequence i [ "Owner"; "AccessControlList" ] (fun tag _ ->
                match tag with
                | "Owner" ->
                    r_owner :=
                      Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
                | "AccessControlList" ->
                    r_grants :=
                      Some
                        (Read.sequence i "AccessControlList"
                           (fun i attrs ->
                             Read.sequences i "Grant" (fun i attrs -> grant_of_xml i attrs) ())
                           ())
                | _ -> Read.skip_element i);
            ({ owner = ( ! ) r_owner; grants = ( ! ) r_grants } : get_bucket_acl_output)))
      ~error_deserializer
end

module GetBucketAnalyticsConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_analytics_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/{Bucket}?analytics&x-id=GetBucketAnalyticsConfiguration"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketAnalyticsConfiguration" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_id = ref None in
                   let r_filter = ref None in
                   let r_storage_class_analysis = ref None in
                   Structure.scanSequence i [ "Id"; "Filter"; "StorageClassAnalysis" ] (fun tag _ ->
                       match tag with
                       | "Id" ->
                           r_id :=
                             Some
                               (Read.sequence i "Id"
                                  (fun i attrs -> analytics_id_of_xml i attrs)
                                  ())
                       | "Filter" ->
                           r_filter :=
                             Some
                               (Read.sequence i "Filter"
                                  (fun i attrs -> analytics_filter_of_xml i attrs)
                                  ())
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
                      storage_class_analysis =
                        required "StorageClassAnalysis" (( ! ) r_storage_class_analysis) i;
                    }
                     : analytics_configuration))))
        in
        ({ analytics_configuration = payload_val } : get_bucket_analytics_configuration_output))
      ~error_deserializer
end

module GetBucketCors = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_cors_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?cors"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketCors" ~service ~context ~method_:`GET
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_cors_rules = ref None in
            Structure.scanSequence i [ "CORSRule" ] (fun tag _ ->
                match tag with
                | "CORSRule" ->
                    r_cors_rules :=
                      Some
                        (Read.sequences i "CORSRule" (fun i attrs -> cors_rule_of_xml i attrs) ())
                | _ -> Read.skip_element i);
            ({ cors_rules = ( ! ) r_cors_rules } : get_bucket_cors_output)))
      ~error_deserializer
end

module GetBucketEncryption = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_encryption_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?encryption"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketEncryption" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
                   ({ rules = required "Rule" (( ! ) r_rules) i }
                     : server_side_encryption_configuration))))
        in
        ({ server_side_encryption_configuration = payload_val } : get_bucket_encryption_output))
      ~error_deserializer
end

module GetBucketIntelligentTieringConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_intelligent_tiering_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/{Bucket}?intelligent-tiering&x-id=GetBucketIntelligentTieringConfiguration"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketIntelligentTieringConfiguration"
      ~service ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_id = ref None in
                   let r_filter = ref None in
                   let r_status = ref None in
                   let r_tierings = ref None in
                   Structure.scanSequence i [ "Id"; "Filter"; "Status"; "Tiering" ] (fun tag _ ->
                       match tag with
                       | "Id" ->
                           r_id :=
                             Some
                               (Read.sequence i "Id"
                                  (fun i attrs -> intelligent_tiering_id_of_xml i attrs)
                                  ())
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
                           r_tierings :=
                             Some
                               (Read.sequences i "Tiering"
                                  (fun i attrs -> tiering_of_xml i attrs)
                                  ())
                       | _ -> Read.skip_element i);
                   ({
                      id = required "Id" (( ! ) r_id) i;
                      filter = ( ! ) r_filter;
                      status = required "Status" (( ! ) r_status) i;
                      tierings = required "Tiering" (( ! ) r_tierings) i;
                    }
                     : intelligent_tiering_configuration))))
        in
        ({ intelligent_tiering_configuration = payload_val }
          : get_bucket_intelligent_tiering_configuration_output))
      ~error_deserializer
end

module GetBucketInventoryConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_inventory_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/{Bucket}?inventory&x-id=GetBucketInventoryConfiguration"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketInventoryConfiguration" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
                             Some
                               (Read.sequence i "IsEnabled"
                                  (fun i attrs -> is_enabled_of_xml i attrs)
                                  ())
                       | "Filter" ->
                           r_filter :=
                             Some
                               (Read.sequence i "Filter"
                                  (fun i attrs -> inventory_filter_of_xml i attrs)
                                  ())
                       | "Id" ->
                           r_id :=
                             Some
                               (Read.sequence i "Id"
                                  (fun i attrs -> inventory_id_of_xml i attrs)
                                  ())
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
                             Some
                               (Read.sequence i "Schedule"
                                  (fun i attrs -> inventory_schedule_of_xml i attrs)
                                  ())
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
                     : inventory_configuration))))
        in
        ({ inventory_configuration = payload_val } : get_bucket_inventory_configuration_output))
      ~error_deserializer
end

module GetBucketLifecycleConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_lifecycle_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?lifecycle"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketLifecycleConfiguration" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_rules = ref None in
            Structure.scanSequence i [ "Rule" ] (fun tag _ ->
                match tag with
                | "Rule" ->
                    r_rules :=
                      Some
                        (Read.sequences i "Rule" (fun i attrs -> lifecycle_rule_of_xml i attrs) ())
                | _ -> Read.skip_element i);
            ({
               rules = ( ! ) r_rules;
               transition_default_minimum_object_size =
                 Option.map
                   (fun s ->
                     (match s with
                      | "varies_by_storage_class" -> Varies_by_storage_class
                      | "all_storage_classes_128K" -> All_storage_classes_128K
                      | _ -> failwith "unknown enum value"
                       : transition_default_minimum_object_size))
                   (Smaws_Lib.Protocols.RestXml.header_value headers
                      "x-amz-transition-default-minimum-object-size");
             }
              : get_bucket_lifecycle_configuration_output)))
      ~error_deserializer
end

module GetBucketLocation = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_location_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?location"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketLocation" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
            ({ location_constraint = ( ! ) r_location_constraint } : get_bucket_location_output)))
      ~error_deserializer
end

module GetBucketLogging = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_logging_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?logging"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketLogging" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_logging_enabled = ref None in
            Structure.scanSequence i [ "LoggingEnabled" ] (fun tag _ ->
                match tag with
                | "LoggingEnabled" ->
                    r_logging_enabled :=
                      Some
                        (Read.sequence i "LoggingEnabled"
                           (fun i attrs -> logging_enabled_of_xml i attrs)
                           ())
                | _ -> Read.skip_element i);
            ({ logging_enabled = ( ! ) r_logging_enabled } : get_bucket_logging_output)))
      ~error_deserializer
end

module GetBucketMetadataConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_metadata_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?metadataConfiguration"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketMetadataConfiguration" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
                        required "MetadataConfigurationResult"
                          (( ! ) r_metadata_configuration_result)
                          i;
                    }
                     : get_bucket_metadata_configuration_result))))
        in
        ({ get_bucket_metadata_configuration_result = payload_val }
          : get_bucket_metadata_configuration_output))
      ~error_deserializer
end

module GetBucketMetadataTableConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_metadata_table_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?metadataTable"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketMetadataTableConfiguration" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_metadata_table_configuration_result = ref None in
                   let r_status = ref None in
                   let r_error = ref None in
                   Structure.scanSequence i
                     [ "MetadataTableConfigurationResult"; "Status"; "Error" ] (fun tag _ ->
                       match tag with
                       | "MetadataTableConfigurationResult" ->
                           r_metadata_table_configuration_result :=
                             Some
                               (Read.sequence i "MetadataTableConfigurationResult"
                                  (fun i attrs ->
                                    metadata_table_configuration_result_of_xml i attrs)
                                  ())
                       | "Status" ->
                           r_status :=
                             Some
                               (Read.sequence i "Status"
                                  (fun i attrs -> metadata_table_status_of_xml i attrs)
                                  ())
                       | "Error" ->
                           r_error :=
                             Some
                               (Read.sequence i "Error"
                                  (fun i attrs -> error_details_of_xml i attrs)
                                  ())
                       | _ -> Read.skip_element i);
                   ({
                      metadata_table_configuration_result =
                        required "MetadataTableConfigurationResult"
                          (( ! ) r_metadata_table_configuration_result)
                          i;
                      status = required "Status" (( ! ) r_status) i;
                      error = ( ! ) r_error;
                    }
                     : get_bucket_metadata_table_configuration_result))))
        in
        ({ get_bucket_metadata_table_configuration_result = payload_val }
          : get_bucket_metadata_table_configuration_output))
      ~error_deserializer
end

module GetBucketMetricsConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_metrics_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/{Bucket}?metrics&x-id=GetBucketMetricsConfiguration"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketMetricsConfiguration" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_id = ref None in
                   let r_filter = ref None in
                   Structure.scanSequence i [ "Id"; "Filter" ] (fun tag _ ->
                       match tag with
                       | "Id" ->
                           r_id :=
                             Some
                               (Read.sequence i "Id" (fun i attrs -> metrics_id_of_xml i attrs) ())
                       | "Filter" ->
                           r_filter :=
                             Some
                               (Read.sequence i "Filter"
                                  (fun i attrs -> metrics_filter_of_xml i attrs)
                                  ())
                       | _ -> Read.skip_element i);
                   ({ id = required "Id" (( ! ) r_id) i; filter = ( ! ) r_filter }
                     : metrics_configuration))))
        in
        ({ metrics_configuration = payload_val } : get_bucket_metrics_configuration_output))
      ~error_deserializer
end

module GetBucketNotificationConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_notification_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?notification"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketNotificationConfiguration" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
              : notification_configuration)))
      ~error_deserializer
end

module GetBucketOwnershipControls = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_ownership_controls_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?ownershipControls"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketOwnershipControls" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_rules = ref None in
                   Structure.scanSequence i [ "Rule" ] (fun tag _ ->
                       match tag with
                       | "Rule" ->
                           r_rules :=
                             Some
                               (Read.sequences i "Rule"
                                  (fun i attrs -> ownership_controls_rule_of_xml i attrs)
                                  ())
                       | _ -> Read.skip_element i);
                   ({ rules = required "Rule" (( ! ) r_rules) i } : ownership_controls))))
        in
        ({ ownership_controls = payload_val } : get_bucket_ownership_controls_output))
      ~error_deserializer
end

module GetBucketPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_policy_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?policy"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketPolicy" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({ policy = (if String.equal body "" then None else Some body) } : get_bucket_policy_output))
      ~error_deserializer
end

module GetBucketPolicyStatus = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_policy_status_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?policyStatus"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketPolicyStatus" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_is_public = ref None in
                   Structure.scanSequence i [ "IsPublic" ] (fun tag _ ->
                       match tag with
                       | "IsPublic" ->
                           r_is_public :=
                             Some
                               (Read.sequence i "IsPublic"
                                  (fun i attrs -> is_public_of_xml i attrs)
                                  ())
                       | _ -> Read.skip_element i);
                   ({ is_public = ( ! ) r_is_public } : policy_status))))
        in
        ({ policy_status = payload_val } : get_bucket_policy_status_output))
      ~error_deserializer
end

module GetBucketReplication = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_replication_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?replication"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketReplication" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_role = ref None in
                   let r_rules = ref None in
                   Structure.scanSequence i [ "Role"; "Rule" ] (fun tag _ ->
                       match tag with
                       | "Role" ->
                           r_role :=
                             Some (Read.sequence i "Role" (fun i attrs -> role_of_xml i attrs) ())
                       | "Rule" ->
                           r_rules :=
                             Some
                               (Read.sequences i "Rule"
                                  (fun i attrs -> replication_rule_of_xml i attrs)
                                  ())
                       | _ -> Read.skip_element i);
                   ({
                      role = required "Role" (( ! ) r_role) i;
                      rules = required "Rule" (( ! ) r_rules) i;
                    }
                     : replication_configuration))))
        in
        ({ replication_configuration = payload_val } : get_bucket_replication_output))
      ~error_deserializer
end

module GetBucketRequestPayment = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_request_payment_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?requestPayment"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketRequestPayment" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_payer = ref None in
            Structure.scanSequence i [ "Payer" ] (fun tag _ ->
                match tag with
                | "Payer" ->
                    r_payer :=
                      Some (Read.sequence i "Payer" (fun i attrs -> payer_of_xml i attrs) ())
                | _ -> Read.skip_element i);
            ({ payer = ( ! ) r_payer } : get_bucket_request_payment_output)))
      ~error_deserializer
end

module GetBucketTagging = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_tagging_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?tagging"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketTagging" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_tag_set = ref None in
            Structure.scanSequence i [ "TagSet" ] (fun tag _ ->
                match tag with
                | "TagSet" ->
                    r_tag_set :=
                      Some
                        (Read.sequence i "TagSet"
                           (fun i attrs ->
                             Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
                           ())
                | _ -> Read.skip_element i);
            ({ tag_set = required "TagSet" (( ! ) r_tag_set) i } : get_bucket_tagging_output)))
      ~error_deserializer
end

module GetBucketVersioning = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_versioning_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?versioning"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketVersioning" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_status = ref None in
            let r_mfa_delete = ref None in
            Structure.scanSequence i [ "Status"; "MfaDelete" ] (fun tag _ ->
                match tag with
                | "Status" ->
                    r_status :=
                      Some
                        (Read.sequence i "Status"
                           (fun i attrs -> bucket_versioning_status_of_xml i attrs)
                           ())
                | "MfaDelete" ->
                    r_mfa_delete :=
                      Some
                        (Read.sequence i "MfaDelete"
                           (fun i attrs -> mfa_delete_status_of_xml i attrs)
                           ())
                | _ -> Read.skip_element i);
            ({ status = ( ! ) r_status; mfa_delete = ( ! ) r_mfa_delete }
              : get_bucket_versioning_output)))
      ~error_deserializer
end

module GetBucketWebsite = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_bucket_website_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?website"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetBucketWebsite" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_redirect_all_requests_to = ref None in
            let r_index_document = ref None in
            let r_error_document = ref None in
            let r_routing_rules = ref None in
            Structure.scanSequence i
              [ "RedirectAllRequestsTo"; "IndexDocument"; "ErrorDocument"; "RoutingRules" ]
              (fun tag _ ->
                match tag with
                | "RedirectAllRequestsTo" ->
                    r_redirect_all_requests_to :=
                      Some
                        (Read.sequence i "RedirectAllRequestsTo"
                           (fun i attrs -> redirect_all_requests_to_of_xml i attrs)
                           ())
                | "IndexDocument" ->
                    r_index_document :=
                      Some
                        (Read.sequence i "IndexDocument"
                           (fun i attrs -> index_document_of_xml i attrs)
                           ())
                | "ErrorDocument" ->
                    r_error_document :=
                      Some
                        (Read.sequence i "ErrorDocument"
                           (fun i attrs -> error_document_of_xml i attrs)
                           ())
                | "RoutingRules" ->
                    r_routing_rules :=
                      Some
                        (Read.sequence i "RoutingRules"
                           (fun i attrs ->
                             Read.sequences i "RoutingRule"
                               (fun i attrs -> routing_rule_of_xml i attrs)
                               ())
                           ())
                | _ -> Read.skip_element i);
            ({
               redirect_all_requests_to = ( ! ) r_redirect_all_requests_to;
               index_document = ( ! ) r_index_document;
               error_document = ( ! ) r_error_document;
               routing_rules = ( ! ) r_routing_rules;
             }
              : get_bucket_website_output)))
      ~error_deserializer
end

module GetObject = struct
  let error_to_string = function
    | `InvalidObjectState _ -> "com.amazonaws.s3#InvalidObjectState"
    | `NoSuchKey _ -> "com.amazonaws.s3#NoSuchKey"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "InvalidObjectState" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> invalid_object_state_of_xml i attrs)
        with
        | Ok s -> `InvalidObjectState s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchKey" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_key_of_xml i attrs)
        with
        | Ok s -> `NoSuchKey s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : get_object_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?x-id=GetObject"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.response_cache_control with
          | Some v -> [ ("response-cache-control", [ v ]) ]
          | None -> []);
          (match request.response_content_disposition with
          | Some v -> [ ("response-content-disposition", [ v ]) ]
          | None -> []);
          (match request.response_content_encoding with
          | Some v -> [ ("response-content-encoding", [ v ]) ]
          | None -> []);
          (match request.response_content_language with
          | Some v -> [ ("response-content-language", [ v ]) ]
          | None -> []);
          (match request.response_content_type with
          | Some v -> [ ("response-content-type", [ v ]) ]
          | None -> []);
          (match request.response_expires with
          | Some v ->
              [
                ( "response-expires",
                  [
                    (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)
                      v;
                  ] );
              ]
          | None -> []);
          (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []);
          (match request.part_number with
          | Some v -> [ ("partNumber", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.if_match with Some v -> [ ("If-Match", v) ] | None -> []);
          (match request.if_modified_since with
          | Some v ->
              [
                ( "If-Modified-Since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.if_none_match with Some v -> [ ("If-None-Match", v) ] | None -> []);
          (match request.if_unmodified_since with
          | Some v ->
              [
                ( "If-Unmodified-Since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.range with Some v -> [ ("Range", v) ] | None -> []);
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.sse_customer_key with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.checksum_mode with
          | Some v ->
              [
                ( "x-amz-checksum-mode",
                  (fun (v : checksum_mode) -> match v with ENABLED -> "ENABLED") v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetObject" ~service ~context ~method_:`GET ~uri
      ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           body =
             (if String.equal body "" then None else Some (Smaws_Lib.CoreTypes.Blob.of_string body));
           delete_marker =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-delete-marker");
           accept_ranges = Smaws_Lib.Protocols.RestXml.header_value headers "accept-ranges";
           expiration = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-expiration";
           restore = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-restore";
           last_modified =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "Last-Modified");
           content_length =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.long_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "Content-Length");
           e_tag = Smaws_Lib.Protocols.RestXml.header_value headers "ETag";
           checksum_cr_c32 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32";
           checksum_crc32_c =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32c";
           checksum_crc64nvm_e =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc64nvme";
           checksum_sh_a1 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha1";
           checksum_sh_a256 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha256";
           checksum_sh_a512 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha512";
           checksum_m_d5 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-md5";
           checksum_xxhas_h64 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash64";
           checksum_xxhas_h3 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash3";
           checksum_xxhas_h128 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash128";
           checksum_type =
             Option.map
               (fun s ->
                 (match s with
                  | "COMPOSITE" -> COMPOSITE
                  | "FULL_OBJECT" -> FULL_OBJECT
                  | _ -> failwith "unknown enum value"
                   : checksum_type))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-type");
           missing_meta =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.int_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-missing-meta");
           version_id = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-version-id";
           cache_control = Smaws_Lib.Protocols.RestXml.header_value headers "Cache-Control";
           content_disposition =
             Smaws_Lib.Protocols.RestXml.header_value headers "Content-Disposition";
           content_encoding = Smaws_Lib.Protocols.RestXml.header_value headers "Content-Encoding";
           content_language = Smaws_Lib.Protocols.RestXml.header_value headers "Content-Language";
           content_range = Smaws_Lib.Protocols.RestXml.header_value headers "Content-Range";
           content_type = Smaws_Lib.Protocols.RestXml.header_value headers "Content-Type";
           expires = Smaws_Lib.Protocols.RestXml.header_value headers "Expires";
           website_redirect_location =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-website-redirect-location";
           server_side_encryption =
             Option.map
               (fun s ->
                 (match s with
                  | "AES256" -> AES256
                  | "aws:fsx" -> Aws_fsx
                  | "aws:kms" -> Aws_kms
                  | "aws:kms:dsse" -> Aws_kms_dsse
                  | _ -> failwith "unknown enum value"
                   : server_side_encryption))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption");
           metadata =
             Some (Smaws_Lib.Protocols.RestXml.prefix_headers ~prefix:"x-amz-meta-" headers);
           sse_customer_algorithm =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-algorithm";
           sse_customer_key_m_d5 =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-key-MD5";
           ssekms_key_id =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-aws-kms-key-id";
           bucket_key_enabled =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers
                  "x-amz-server-side-encryption-bucket-key-enabled");
           storage_class =
             Option.map
               (fun s ->
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
                   : storage_class))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-storage-class");
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
           replication_status =
             Option.map
               (fun s ->
                 (match s with
                  | "COMPLETE" -> COMPLETE
                  | "PENDING" -> PENDING
                  | "FAILED" -> FAILED
                  | "REPLICA" -> REPLICA
                  | "COMPLETED" -> COMPLETED
                  | _ -> failwith "unknown enum value"
                   : replication_status))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-replication-status");
           parts_count =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.int_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-mp-parts-count");
           tag_count =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.int_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-tagging-count");
           object_lock_mode =
             Option.map
               (fun s ->
                 (match s with
                  | "GOVERNANCE" -> GOVERNANCE
                  | "COMPLIANCE" -> COMPLIANCE
                  | _ -> failwith "unknown enum value"
                   : object_lock_mode))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-object-lock-mode");
           object_lock_retain_until_date =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers
                  "x-amz-object-lock-retain-until-date");
           object_lock_legal_hold_status =
             Option.map
               (fun s ->
                 (match s with "ON" -> ON | "OFF" -> OFF | _ -> failwith "unknown enum value"
                   : object_lock_legal_hold_status))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-object-lock-legal-hold");
         }
          : get_object_output))
      ~error_deserializer
end

module GetObjectAcl = struct
  let error_to_string = function
    | `NoSuchKey _ -> "com.amazonaws.s3#NoSuchKey"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "NoSuchKey" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_key_of_xml i attrs)
        with
        | Ok s -> `NoSuchKey s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : get_object_acl_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?acl"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetObjectAcl" ~service ~context ~method_:`GET
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_owner = ref None in
            let r_grants = ref None in
            Structure.scanSequence i [ "Owner"; "AccessControlList" ] (fun tag _ ->
                match tag with
                | "Owner" ->
                    r_owner :=
                      Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
                | "AccessControlList" ->
                    r_grants :=
                      Some
                        (Read.sequence i "AccessControlList"
                           (fun i attrs ->
                             Read.sequences i "Grant" (fun i attrs -> grant_of_xml i attrs) ())
                           ())
                | _ -> Read.skip_element i);
            ({
               owner = ( ! ) r_owner;
               grants = ( ! ) r_grants;
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
             }
              : get_object_acl_output)))
      ~error_deserializer
end

module GetObjectAnnotation = struct
  let error_to_string = function
    | `NoSuchAnnotation _ -> "com.amazonaws.s3#NoSuchAnnotation"
    | `NoSuchBucket _ -> "com.amazonaws.s3#NoSuchBucket"
    | `NoSuchKey _ -> "com.amazonaws.s3#NoSuchKey"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "NoSuchAnnotation" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_annotation_of_xml i attrs)
        with
        | Ok s -> `NoSuchAnnotation s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchBucket" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_bucket_of_xml i attrs)
        with
        | Ok s -> `NoSuchBucket s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchKey" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_key_of_xml i attrs)
        with
        | Ok s -> `NoSuchKey s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : get_object_annotation_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/{Bucket}/{Key+}?annotation&x-id=GetObjectAnnotation"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.annotation_name in
           [ ("annotationName", [ v ]) ]);
          (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.checksum_mode with
          | Some v ->
              [
                ( "x-amz-checksum-mode",
                  (fun (v : checksum_mode) -> match v with ENABLED -> "ENABLED") v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetObjectAnnotation" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           annotation_payload =
             (if String.equal body "" then None else Some (Smaws_Lib.CoreTypes.Blob.of_string body));
           object_version_id =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-object-version-id";
           last_modified =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "Last-Modified");
           content_length =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.long_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "Content-Length");
           e_tag = Smaws_Lib.Protocols.RestXml.header_value headers "ETag";
           checksum_cr_c32 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32";
           checksum_crc32_c =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32c";
           checksum_crc64nvm_e =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc64nvme";
           checksum_sh_a1 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha1";
           checksum_sh_a256 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha256";
           checksum_sh_a512 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha512";
           checksum_m_d5 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-md5";
           checksum_xxhas_h64 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash64";
           checksum_xxhas_h3 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash3";
           checksum_xxhas_h128 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash128";
           checksum_type =
             Option.map
               (fun s ->
                 (match s with
                  | "COMPOSITE" -> COMPOSITE
                  | "FULL_OBJECT" -> FULL_OBJECT
                  | _ -> failwith "unknown enum value"
                   : checksum_type))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-type");
           server_side_encryption =
             Option.map
               (fun s ->
                 (match s with
                  | "AES256" -> AES256
                  | "aws:fsx" -> Aws_fsx
                  | "aws:kms" -> Aws_kms
                  | "aws:kms:dsse" -> Aws_kms_dsse
                  | _ -> failwith "unknown enum value"
                   : server_side_encryption))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption");
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
           replication_status =
             Option.map
               (fun s ->
                 (match s with
                  | "COMPLETE" -> COMPLETE
                  | "PENDING" -> PENDING
                  | "FAILED" -> FAILED
                  | "REPLICA" -> REPLICA
                  | "COMPLETED" -> COMPLETED
                  | _ -> failwith "unknown enum value"
                   : replication_status))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-replication-status");
         }
          : get_object_annotation_output))
      ~error_deserializer
end

module GetObjectAttributes = struct
  let error_to_string = function
    | `NoSuchKey _ -> "com.amazonaws.s3#NoSuchKey"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "NoSuchKey" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_key_of_xml i attrs)
        with
        | Ok s -> `NoSuchKey s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : get_object_attributes_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?attributes"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.max_parts with
          | Some v -> [ ("x-amz-max-parts", (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.part_number_marker with
          | Some v -> [ ("x-amz-part-number-marker", v) ]
          | None -> []);
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.sse_customer_key with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (let v = request.object_attributes in
           [
             ( "x-amz-object-attributes",
               String.concat ", "
                 (List.map
                    (fun (v : object_attributes) ->
                      match v with
                      | ETAG -> "ETag"
                      | CHECKSUM -> "Checksum"
                      | OBJECT_PARTS -> "ObjectParts"
                      | STORAGE_CLASS -> "StorageClass"
                      | OBJECT_SIZE -> "ObjectSize")
                    v) );
           ]);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetObjectAttributes" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_e_tag = ref None in
            let r_checksum = ref None in
            let r_object_parts = ref None in
            let r_storage_class = ref None in
            let r_object_size = ref None in
            Structure.scanSequence i
              [ "ETag"; "Checksum"; "ObjectParts"; "StorageClass"; "ObjectSize" ] (fun tag _ ->
                match tag with
                | "ETag" ->
                    r_e_tag :=
                      Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
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
                      Some
                        (Read.sequence i "StorageClass"
                           (fun i attrs -> storage_class_of_xml i attrs)
                           ())
                | "ObjectSize" ->
                    r_object_size :=
                      Some
                        (Read.sequence i "ObjectSize"
                           (fun i attrs -> object_size_of_xml i attrs)
                           ())
                | _ -> Read.skip_element i);
            ({
               delete_marker =
                 Option.map
                   (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-delete-marker");
               last_modified =
                 Option.map
                   (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string s)
                   (Smaws_Lib.Protocols.RestXml.header_value headers "Last-Modified");
               version_id = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-version-id";
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
               e_tag = ( ! ) r_e_tag;
               checksum = ( ! ) r_checksum;
               object_parts = ( ! ) r_object_parts;
               storage_class = ( ! ) r_storage_class;
               object_size = ( ! ) r_object_size;
             }
              : get_object_attributes_output)))
      ~error_deserializer
end

module GetObjectLegalHold = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_object_legal_hold_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?legal-hold"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetObjectLegalHold" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
                   ({ status = ( ! ) r_status } : object_lock_legal_hold))))
        in
        ({ legal_hold = payload_val } : get_object_legal_hold_output))
      ~error_deserializer
end

module GetObjectLockConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_object_lock_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?object-lock"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetObjectLockConfiguration" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
                             Some
                               (Read.sequence i "Rule"
                                  (fun i attrs -> object_lock_rule_of_xml i attrs)
                                  ())
                       | _ -> Read.skip_element i);
                   ({ object_lock_enabled = ( ! ) r_object_lock_enabled; rule = ( ! ) r_rule }
                     : object_lock_configuration))))
        in
        ({ object_lock_configuration = payload_val } : get_object_lock_configuration_output))
      ~error_deserializer
end

module GetObjectRetention = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_object_retention_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?retention"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetObjectRetention" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_mode = ref None in
                   let r_retain_until_date = ref None in
                   Structure.scanSequence i [ "Mode"; "RetainUntilDate" ] (fun tag _ ->
                       match tag with
                       | "Mode" ->
                           r_mode :=
                             Some
                               (Read.sequence i "Mode"
                                  (fun i attrs -> object_lock_retention_mode_of_xml i attrs)
                                  ())
                       | "RetainUntilDate" ->
                           r_retain_until_date :=
                             Some
                               (Read.sequence i "RetainUntilDate"
                                  (fun i attrs -> date_of_xml i attrs)
                                  ())
                       | _ -> Read.skip_element i);
                   ({ mode = ( ! ) r_mode; retain_until_date = ( ! ) r_retain_until_date }
                     : object_lock_retention))))
        in
        ({ retention = payload_val } : get_object_retention_output))
      ~error_deserializer
end

module GetObjectTagging = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_object_tagging_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?tagging"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetObjectTagging" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_tag_set = ref None in
            Structure.scanSequence i [ "TagSet" ] (fun tag _ ->
                match tag with
                | "TagSet" ->
                    r_tag_set :=
                      Some
                        (Read.sequence i "TagSet"
                           (fun i attrs ->
                             Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
                           ())
                | _ -> Read.skip_element i);
            ({
               version_id = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-version-id";
               tag_set = required "TagSet" (( ! ) r_tag_set) i;
             }
              : get_object_tagging_output)))
      ~error_deserializer
end

module GetObjectTorrent = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_object_torrent_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?torrent"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetObjectTorrent" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           body =
             (if String.equal body "" then None else Some (Smaws_Lib.CoreTypes.Blob.of_string body));
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : get_object_torrent_output))
      ~error_deserializer
end

module GetPublicAccessBlock = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : get_public_access_block_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?publicAccessBlock"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GetPublicAccessBlock" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_block_public_acls = ref None in
                   let r_ignore_public_acls = ref None in
                   let r_block_public_policy = ref None in
                   let r_restrict_public_buckets = ref None in
                   Structure.scanSequence i
                     [
                       "BlockPublicAcls";
                       "IgnorePublicAcls";
                       "BlockPublicPolicy";
                       "RestrictPublicBuckets";
                     ] (fun tag _ ->
                       match tag with
                       | "BlockPublicAcls" ->
                           r_block_public_acls :=
                             Some
                               (Read.sequence i "BlockPublicAcls"
                                  (fun i attrs -> setting_of_xml i attrs)
                                  ())
                       | "IgnorePublicAcls" ->
                           r_ignore_public_acls :=
                             Some
                               (Read.sequence i "IgnorePublicAcls"
                                  (fun i attrs -> setting_of_xml i attrs)
                                  ())
                       | "BlockPublicPolicy" ->
                           r_block_public_policy :=
                             Some
                               (Read.sequence i "BlockPublicPolicy"
                                  (fun i attrs -> setting_of_xml i attrs)
                                  ())
                       | "RestrictPublicBuckets" ->
                           r_restrict_public_buckets :=
                             Some
                               (Read.sequence i "RestrictPublicBuckets"
                                  (fun i attrs -> setting_of_xml i attrs)
                                  ())
                       | _ -> Read.skip_element i);
                   ({
                      block_public_acls = ( ! ) r_block_public_acls;
                      ignore_public_acls = ( ! ) r_ignore_public_acls;
                      block_public_policy = ( ! ) r_block_public_policy;
                      restrict_public_buckets = ( ! ) r_restrict_public_buckets;
                    }
                     : public_access_block_configuration))))
        in
        ({ public_access_block_configuration = payload_val } : get_public_access_block_output))
      ~error_deserializer
end

module HeadBucket = struct
  let error_to_string = function
    | `NotFound _ -> "com.amazonaws.s3#NotFound"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> not_found_of_xml i attrs)
        with
        | Ok s -> `NotFound s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : head_bucket_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HeadBucket" ~service ~context ~method_:`HEAD
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           bucket_arn = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-bucket-arn";
           bucket_location_type =
             Option.map
               (fun s ->
                 (match s with
                  | "AvailabilityZone" -> AvailabilityZone
                  | "LocalZone" -> LocalZone
                  | _ -> failwith "unknown enum value"
                   : location_type))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-bucket-location-type");
           bucket_location_name =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-bucket-location-name";
           bucket_region = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-bucket-region";
           access_point_alias =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-access-point-alias");
         }
          : head_bucket_output))
      ~error_deserializer
end

module HeadObject = struct
  let error_to_string = function
    | `NotFound _ -> "com.amazonaws.s3#NotFound"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> not_found_of_xml i attrs)
        with
        | Ok s -> `NotFound s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : head_object_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.response_cache_control with
          | Some v -> [ ("response-cache-control", [ v ]) ]
          | None -> []);
          (match request.response_content_disposition with
          | Some v -> [ ("response-content-disposition", [ v ]) ]
          | None -> []);
          (match request.response_content_encoding with
          | Some v -> [ ("response-content-encoding", [ v ]) ]
          | None -> []);
          (match request.response_content_language with
          | Some v -> [ ("response-content-language", [ v ]) ]
          | None -> []);
          (match request.response_content_type with
          | Some v -> [ ("response-content-type", [ v ]) ]
          | None -> []);
          (match request.response_expires with
          | Some v ->
              [
                ( "response-expires",
                  [
                    (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)
                      v;
                  ] );
              ]
          | None -> []);
          (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []);
          (match request.part_number with
          | Some v -> [ ("partNumber", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.if_match with Some v -> [ ("If-Match", v) ] | None -> []);
          (match request.if_modified_since with
          | Some v ->
              [
                ( "If-Modified-Since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.if_none_match with Some v -> [ ("If-None-Match", v) ] | None -> []);
          (match request.if_unmodified_since with
          | Some v ->
              [
                ( "If-Unmodified-Since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.range with Some v -> [ ("Range", v) ] | None -> []);
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.sse_customer_key with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.checksum_mode with
          | Some v ->
              [
                ( "x-amz-checksum-mode",
                  (fun (v : checksum_mode) -> match v with ENABLED -> "ENABLED") v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HeadObject" ~service ~context ~method_:`HEAD
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           delete_marker =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-delete-marker");
           accept_ranges = Smaws_Lib.Protocols.RestXml.header_value headers "accept-ranges";
           expiration = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-expiration";
           restore = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-restore";
           archive_status =
             Option.map
               (fun s ->
                 (match s with
                  | "ARCHIVE_ACCESS" -> ARCHIVE_ACCESS
                  | "DEEP_ARCHIVE_ACCESS" -> DEEP_ARCHIVE_ACCESS
                  | _ -> failwith "unknown enum value"
                   : archive_status))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-archive-status");
           last_modified =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "Last-Modified");
           content_length =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.long_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "Content-Length");
           checksum_cr_c32 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32";
           checksum_crc32_c =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32c";
           checksum_crc64nvm_e =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc64nvme";
           checksum_sh_a1 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha1";
           checksum_sh_a256 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha256";
           checksum_sh_a512 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha512";
           checksum_m_d5 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-md5";
           checksum_xxhas_h64 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash64";
           checksum_xxhas_h3 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash3";
           checksum_xxhas_h128 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash128";
           checksum_type =
             Option.map
               (fun s ->
                 (match s with
                  | "COMPOSITE" -> COMPOSITE
                  | "FULL_OBJECT" -> FULL_OBJECT
                  | _ -> failwith "unknown enum value"
                   : checksum_type))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-type");
           e_tag = Smaws_Lib.Protocols.RestXml.header_value headers "ETag";
           missing_meta =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.int_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-missing-meta");
           version_id = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-version-id";
           cache_control = Smaws_Lib.Protocols.RestXml.header_value headers "Cache-Control";
           content_disposition =
             Smaws_Lib.Protocols.RestXml.header_value headers "Content-Disposition";
           content_encoding = Smaws_Lib.Protocols.RestXml.header_value headers "Content-Encoding";
           content_language = Smaws_Lib.Protocols.RestXml.header_value headers "Content-Language";
           content_type = Smaws_Lib.Protocols.RestXml.header_value headers "Content-Type";
           content_range = Smaws_Lib.Protocols.RestXml.header_value headers "Content-Range";
           expires = Smaws_Lib.Protocols.RestXml.header_value headers "Expires";
           website_redirect_location =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-website-redirect-location";
           server_side_encryption =
             Option.map
               (fun s ->
                 (match s with
                  | "AES256" -> AES256
                  | "aws:fsx" -> Aws_fsx
                  | "aws:kms" -> Aws_kms
                  | "aws:kms:dsse" -> Aws_kms_dsse
                  | _ -> failwith "unknown enum value"
                   : server_side_encryption))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption");
           metadata =
             Some (Smaws_Lib.Protocols.RestXml.prefix_headers ~prefix:"x-amz-meta-" headers);
           sse_customer_algorithm =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-algorithm";
           sse_customer_key_m_d5 =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-key-MD5";
           ssekms_key_id =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-aws-kms-key-id";
           bucket_key_enabled =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers
                  "x-amz-server-side-encryption-bucket-key-enabled");
           storage_class =
             Option.map
               (fun s ->
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
                   : storage_class))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-storage-class");
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
           replication_status =
             Option.map
               (fun s ->
                 (match s with
                  | "COMPLETE" -> COMPLETE
                  | "PENDING" -> PENDING
                  | "FAILED" -> FAILED
                  | "REPLICA" -> REPLICA
                  | "COMPLETED" -> COMPLETED
                  | _ -> failwith "unknown enum value"
                   : replication_status))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-replication-status");
           parts_count =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.int_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-mp-parts-count");
           tag_count =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.int_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-tagging-count");
           object_lock_mode =
             Option.map
               (fun s ->
                 (match s with
                  | "GOVERNANCE" -> GOVERNANCE
                  | "COMPLIANCE" -> COMPLIANCE
                  | _ -> failwith "unknown enum value"
                   : object_lock_mode))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-object-lock-mode");
           object_lock_retain_until_date =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers
                  "x-amz-object-lock-retain-until-date");
           object_lock_legal_hold_status =
             Option.map
               (fun s ->
                 (match s with "ON" -> ON | "OFF" -> OFF | _ -> failwith "unknown enum value"
                   : object_lock_legal_hold_status))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-object-lock-legal-hold");
         }
          : head_object_output))
      ~error_deserializer
end

module ListBucketAnalyticsConfigurations = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : list_bucket_analytics_configurations_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/{Bucket}?analytics&x-id=ListBucketAnalyticsConfigurations"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.continuation_token with
          | Some v -> [ ("continuation-token", [ v ]) ]
          | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListBucketAnalyticsConfigurations" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_is_truncated = ref None in
            let r_continuation_token = ref None in
            let r_next_continuation_token = ref None in
            let r_analytics_configuration_list = ref None in
            Structure.scanSequence i
              [
                "IsTruncated";
                "ContinuationToken";
                "NextContinuationToken";
                "AnalyticsConfiguration";
              ] (fun tag _ ->
                match tag with
                | "IsTruncated" ->
                    r_is_truncated :=
                      Some
                        (Read.sequence i "IsTruncated"
                           (fun i attrs -> is_truncated_of_xml i attrs)
                           ())
                | "ContinuationToken" ->
                    r_continuation_token :=
                      Some
                        (Read.sequence i "ContinuationToken"
                           (fun i attrs -> token_of_xml i attrs)
                           ())
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
              : list_bucket_analytics_configurations_output)))
      ~error_deserializer
end

module ListBucketIntelligentTieringConfigurations = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : list_bucket_intelligent_tiering_configurations_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/{Bucket}?intelligent-tiering&x-id=ListBucketIntelligentTieringConfigurations"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.continuation_token with
          | Some v -> [ ("continuation-token", [ v ]) ]
          | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListBucketIntelligentTieringConfigurations"
      ~service ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_is_truncated = ref None in
            let r_continuation_token = ref None in
            let r_next_continuation_token = ref None in
            let r_intelligent_tiering_configuration_list = ref None in
            Structure.scanSequence i
              [
                "IsTruncated";
                "ContinuationToken";
                "NextContinuationToken";
                "IntelligentTieringConfiguration";
              ] (fun tag _ ->
                match tag with
                | "IsTruncated" ->
                    r_is_truncated :=
                      Some
                        (Read.sequence i "IsTruncated"
                           (fun i attrs -> is_truncated_of_xml i attrs)
                           ())
                | "ContinuationToken" ->
                    r_continuation_token :=
                      Some
                        (Read.sequence i "ContinuationToken"
                           (fun i attrs -> token_of_xml i attrs)
                           ())
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
               intelligent_tiering_configuration_list =
                 ( ! ) r_intelligent_tiering_configuration_list;
             }
              : list_bucket_intelligent_tiering_configurations_output)))
      ~error_deserializer
end

module ListBucketInventoryConfigurations = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : list_bucket_inventory_configurations_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/{Bucket}?inventory&x-id=ListBucketInventoryConfigurations"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.continuation_token with
          | Some v -> [ ("continuation-token", [ v ]) ]
          | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListBucketInventoryConfigurations" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_continuation_token = ref None in
            let r_inventory_configuration_list = ref None in
            let r_is_truncated = ref None in
            let r_next_continuation_token = ref None in
            Structure.scanSequence i
              [
                "ContinuationToken";
                "InventoryConfiguration";
                "IsTruncated";
                "NextContinuationToken";
              ] (fun tag _ ->
                match tag with
                | "ContinuationToken" ->
                    r_continuation_token :=
                      Some
                        (Read.sequence i "ContinuationToken"
                           (fun i attrs -> token_of_xml i attrs)
                           ())
                | "InventoryConfiguration" ->
                    r_inventory_configuration_list :=
                      Some
                        (Read.sequences i "InventoryConfiguration"
                           (fun i attrs -> inventory_configuration_of_xml i attrs)
                           ())
                | "IsTruncated" ->
                    r_is_truncated :=
                      Some
                        (Read.sequence i "IsTruncated"
                           (fun i attrs -> is_truncated_of_xml i attrs)
                           ())
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
              : list_bucket_inventory_configurations_output)))
      ~error_deserializer
end

module ListBucketMetricsConfigurations = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : list_bucket_metrics_configurations_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/{Bucket}?metrics&x-id=ListBucketMetricsConfigurations"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.continuation_token with
          | Some v -> [ ("continuation-token", [ v ]) ]
          | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListBucketMetricsConfigurations" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_is_truncated = ref None in
            let r_continuation_token = ref None in
            let r_next_continuation_token = ref None in
            let r_metrics_configuration_list = ref None in
            Structure.scanSequence i
              [
                "IsTruncated"; "ContinuationToken"; "NextContinuationToken"; "MetricsConfiguration";
              ] (fun tag _ ->
                match tag with
                | "IsTruncated" ->
                    r_is_truncated :=
                      Some
                        (Read.sequence i "IsTruncated"
                           (fun i attrs -> is_truncated_of_xml i attrs)
                           ())
                | "ContinuationToken" ->
                    r_continuation_token :=
                      Some
                        (Read.sequence i "ContinuationToken"
                           (fun i attrs -> token_of_xml i attrs)
                           ())
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
              : list_bucket_metrics_configurations_output)))
      ~error_deserializer
end

module ListBuckets = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : list_buckets_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/?x-id=ListBuckets" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.max_buckets with
          | Some v -> [ ("max-buckets", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.continuation_token with
          | Some v -> [ ("continuation-token", [ v ]) ]
          | None -> []);
          (match request.prefix with Some v -> [ ("prefix", [ v ]) ] | None -> []);
          (match request.bucket_region with Some v -> [ ("bucket-region", [ v ]) ] | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = [] in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListBuckets" ~service ~context ~method_:`GET
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_buckets = ref None in
            let r_owner = ref None in
            let r_continuation_token = ref None in
            let r_prefix = ref None in
            Structure.scanSequence i [ "Buckets"; "Owner"; "ContinuationToken"; "Prefix" ]
              (fun tag _ ->
                match tag with
                | "Buckets" ->
                    r_buckets :=
                      Some
                        (Read.sequence i "Buckets"
                           (fun i attrs ->
                             Read.sequences i "Bucket" (fun i attrs -> bucket_of_xml i attrs) ())
                           ())
                | "Owner" ->
                    r_owner :=
                      Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
                | "ContinuationToken" ->
                    r_continuation_token :=
                      Some
                        (Read.sequence i "ContinuationToken"
                           (fun i attrs -> next_token_of_xml i attrs)
                           ())
                | "Prefix" ->
                    r_prefix :=
                      Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
                | _ -> Read.skip_element i);
            ({
               buckets = ( ! ) r_buckets;
               owner = ( ! ) r_owner;
               continuation_token = ( ! ) r_continuation_token;
               prefix = ( ! ) r_prefix;
             }
              : list_buckets_output)))
      ~error_deserializer
end

module ListDirectoryBuckets = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : list_directory_buckets_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/?x-id=ListDirectoryBuckets" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.continuation_token with
          | Some v -> [ ("continuation-token", [ v ]) ]
          | None -> []);
          (match request.max_directory_buckets with
          | Some v -> [ ("max-directory-buckets", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = [] in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListDirectoryBuckets" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
              : list_directory_buckets_output)))
      ~error_deserializer
end

module ListMultipartUploads = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : list_multipart_uploads_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?uploads"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.delimiter with Some v -> [ ("delimiter", [ v ]) ] | None -> []);
          (match request.encoding_type with
          | Some v ->
              [ ("encoding-type", [ (fun (v : encoding_type) -> match v with Url -> "url") v ]) ]
          | None -> []);
          (match request.key_marker with Some v -> [ ("key-marker", [ v ]) ] | None -> []);
          (match request.max_uploads with
          | Some v -> [ ("max-uploads", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.prefix with Some v -> [ ("prefix", [ v ]) ] | None -> []);
          (match request.upload_id_marker with
          | Some v -> [ ("upload-id-marker", [ v ]) ]
          | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListMultipartUploads" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
              ] (fun tag _ ->
                match tag with
                | "Bucket" ->
                    r_bucket :=
                      Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
                | "KeyMarker" ->
                    r_key_marker :=
                      Some
                        (Read.sequence i "KeyMarker" (fun i attrs -> key_marker_of_xml i attrs) ())
                | "UploadIdMarker" ->
                    r_upload_id_marker :=
                      Some
                        (Read.sequence i "UploadIdMarker"
                           (fun i attrs -> upload_id_marker_of_xml i attrs)
                           ())
                | "NextKeyMarker" ->
                    r_next_key_marker :=
                      Some
                        (Read.sequence i "NextKeyMarker"
                           (fun i attrs -> next_key_marker_of_xml i attrs)
                           ())
                | "Prefix" ->
                    r_prefix :=
                      Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
                | "Delimiter" ->
                    r_delimiter :=
                      Some
                        (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
                | "NextUploadIdMarker" ->
                    r_next_upload_id_marker :=
                      Some
                        (Read.sequence i "NextUploadIdMarker"
                           (fun i attrs -> next_upload_id_marker_of_xml i attrs)
                           ())
                | "MaxUploads" ->
                    r_max_uploads :=
                      Some
                        (Read.sequence i "MaxUploads"
                           (fun i attrs -> max_uploads_of_xml i attrs)
                           ())
                | "IsTruncated" ->
                    r_is_truncated :=
                      Some
                        (Read.sequence i "IsTruncated"
                           (fun i attrs -> is_truncated_of_xml i attrs)
                           ())
                | "Upload" ->
                    r_uploads :=
                      Some
                        (Read.sequences i "Upload"
                           (fun i attrs -> multipart_upload_of_xml i attrs)
                           ())
                | "CommonPrefixes" ->
                    r_common_prefixes :=
                      Some
                        (Read.sequences i "CommonPrefixes"
                           (fun i attrs -> common_prefix_of_xml i attrs)
                           ())
                | "EncodingType" ->
                    r_encoding_type :=
                      Some
                        (Read.sequence i "EncodingType"
                           (fun i attrs -> encoding_type_of_xml i attrs)
                           ())
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
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
             }
              : list_multipart_uploads_output)))
      ~error_deserializer
end

module ListObjectAnnotations = struct
  let error_to_string = function
    | `InvalidPrefix _ -> "com.amazonaws.s3#InvalidPrefix"
    | `NoSuchBucket _ -> "com.amazonaws.s3#NoSuchBucket"
    | `NoSuchKey _ -> "com.amazonaws.s3#NoSuchKey"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "InvalidPrefix" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> invalid_prefix_of_xml i attrs)
        with
        | Ok s -> `InvalidPrefix s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchBucket" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_bucket_of_xml i attrs)
        with
        | Ok s -> `NoSuchBucket s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchKey" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_key_of_xml i attrs)
        with
        | Ok s -> `NoSuchKey s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : list_object_annotations_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/{Bucket}/{Key+}?annotation&x-id=ListObjectAnnotations"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []);
          (match request.max_annotation_results with
          | Some v -> [ ("max-annotation-results", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.annotation_prefix with
          | Some v -> [ ("annotation-prefix", [ v ]) ]
          | None -> []);
          (match request.continuation_token with
          | Some v -> [ ("continuation-token", [ v ]) ]
          | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListObjectAnnotations" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_annotations = ref None in
            let r_bucket = ref None in
            let r_key = ref None in
            let r_annotation_prefix = ref None in
            let r_max_annotation_results = ref None in
            let r_annotation_count = ref None in
            let r_continuation_token = ref None in
            let r_next_continuation_token = ref None in
            Structure.scanSequence i
              [
                "Annotations";
                "Bucket";
                "Key";
                "AnnotationPrefix";
                "MaxAnnotationResults";
                "AnnotationCount";
                "ContinuationToken";
                "NextContinuationToken";
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
                    r_bucket :=
                      Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
                | "Key" ->
                    r_key :=
                      Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
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
                      Some
                        (Read.sequence i "ContinuationToken"
                           (fun i attrs -> token_of_xml i attrs)
                           ())
                | "NextContinuationToken" ->
                    r_next_continuation_token :=
                      Some
                        (Read.sequence i "NextContinuationToken"
                           (fun i attrs -> next_token_of_xml i attrs)
                           ())
                | _ -> Read.skip_element i);
            ({
               annotations = ( ! ) r_annotations;
               bucket = ( ! ) r_bucket;
               key = ( ! ) r_key;
               object_version_id =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-object-version-id";
               annotation_prefix = ( ! ) r_annotation_prefix;
               max_annotation_results = ( ! ) r_max_annotation_results;
               annotation_count = ( ! ) r_annotation_count;
               continuation_token = ( ! ) r_continuation_token;
               next_continuation_token = ( ! ) r_next_continuation_token;
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
             }
              : list_object_annotations_output)))
      ~error_deserializer
end

module ListObjects = struct
  let error_to_string = function
    | `NoSuchBucket _ -> "com.amazonaws.s3#NoSuchBucket"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "NoSuchBucket" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_bucket_of_xml i attrs)
        with
        | Ok s -> `NoSuchBucket s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : list_objects_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.delimiter with Some v -> [ ("delimiter", [ v ]) ] | None -> []);
          (match request.encoding_type with
          | Some v ->
              [ ("encoding-type", [ (fun (v : encoding_type) -> match v with Url -> "url") v ]) ]
          | None -> []);
          (match request.marker with Some v -> [ ("marker", [ v ]) ] | None -> []);
          (match request.max_keys with
          | Some v -> [ ("max-keys", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.prefix with Some v -> [ ("prefix", [ v ]) ] | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.optional_object_attributes with
          | Some v ->
              [
                ( "x-amz-optional-object-attributes",
                  String.concat ", "
                    (List.map
                       (fun (v : optional_object_attributes) ->
                         match v with RESTORE_STATUS -> "RestoreStatus")
                       v) );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListObjects" ~service ~context ~method_:`GET
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
              ] (fun tag _ ->
                match tag with
                | "IsTruncated" ->
                    r_is_truncated :=
                      Some
                        (Read.sequence i "IsTruncated"
                           (fun i attrs -> is_truncated_of_xml i attrs)
                           ())
                | "Marker" ->
                    r_marker :=
                      Some (Read.sequence i "Marker" (fun i attrs -> marker_of_xml i attrs) ())
                | "NextMarker" ->
                    r_next_marker :=
                      Some
                        (Read.sequence i "NextMarker"
                           (fun i attrs -> next_marker_of_xml i attrs)
                           ())
                | "Contents" ->
                    r_contents :=
                      Some (Read.sequences i "Contents" (fun i attrs -> object__of_xml i attrs) ())
                | "Name" ->
                    r_name :=
                      Some (Read.sequence i "Name" (fun i attrs -> bucket_name_of_xml i attrs) ())
                | "Prefix" ->
                    r_prefix :=
                      Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
                | "Delimiter" ->
                    r_delimiter :=
                      Some
                        (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
                | "MaxKeys" ->
                    r_max_keys :=
                      Some (Read.sequence i "MaxKeys" (fun i attrs -> max_keys_of_xml i attrs) ())
                | "CommonPrefixes" ->
                    r_common_prefixes :=
                      Some
                        (Read.sequences i "CommonPrefixes"
                           (fun i attrs -> common_prefix_of_xml i attrs)
                           ())
                | "EncodingType" ->
                    r_encoding_type :=
                      Some
                        (Read.sequence i "EncodingType"
                           (fun i attrs -> encoding_type_of_xml i attrs)
                           ())
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
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
             }
              : list_objects_output)))
      ~error_deserializer
end

module ListObjectsV2 = struct
  let error_to_string = function
    | `NoSuchBucket _ -> "com.amazonaws.s3#NoSuchBucket"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "NoSuchBucket" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_bucket_of_xml i attrs)
        with
        | Ok s -> `NoSuchBucket s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : list_objects_v2_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?list-type=2"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.delimiter with Some v -> [ ("delimiter", [ v ]) ] | None -> []);
          (match request.encoding_type with
          | Some v ->
              [ ("encoding-type", [ (fun (v : encoding_type) -> match v with Url -> "url") v ]) ]
          | None -> []);
          (match request.max_keys with
          | Some v -> [ ("max-keys", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.prefix with Some v -> [ ("prefix", [ v ]) ] | None -> []);
          (match request.continuation_token with
          | Some v -> [ ("continuation-token", [ v ]) ]
          | None -> []);
          (match request.fetch_owner with
          | Some v -> [ ("fetch-owner", [ (fun v -> string_of_bool v) v ]) ]
          | None -> []);
          (match request.start_after with Some v -> [ ("start-after", [ v ]) ] | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.optional_object_attributes with
          | Some v ->
              [
                ( "x-amz-optional-object-attributes",
                  String.concat ", "
                    (List.map
                       (fun (v : optional_object_attributes) ->
                         match v with RESTORE_STATUS -> "RestoreStatus")
                       v) );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListObjectsV2" ~service ~context ~method_:`GET
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
              ] (fun tag _ ->
                match tag with
                | "IsTruncated" ->
                    r_is_truncated :=
                      Some
                        (Read.sequence i "IsTruncated"
                           (fun i attrs -> is_truncated_of_xml i attrs)
                           ())
                | "Contents" ->
                    r_contents :=
                      Some (Read.sequences i "Contents" (fun i attrs -> object__of_xml i attrs) ())
                | "Name" ->
                    r_name :=
                      Some (Read.sequence i "Name" (fun i attrs -> bucket_name_of_xml i attrs) ())
                | "Prefix" ->
                    r_prefix :=
                      Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
                | "Delimiter" ->
                    r_delimiter :=
                      Some
                        (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
                | "MaxKeys" ->
                    r_max_keys :=
                      Some (Read.sequence i "MaxKeys" (fun i attrs -> max_keys_of_xml i attrs) ())
                | "CommonPrefixes" ->
                    r_common_prefixes :=
                      Some
                        (Read.sequences i "CommonPrefixes"
                           (fun i attrs -> common_prefix_of_xml i attrs)
                           ())
                | "EncodingType" ->
                    r_encoding_type :=
                      Some
                        (Read.sequence i "EncodingType"
                           (fun i attrs -> encoding_type_of_xml i attrs)
                           ())
                | "KeyCount" ->
                    r_key_count :=
                      Some (Read.sequence i "KeyCount" (fun i attrs -> key_count_of_xml i attrs) ())
                | "ContinuationToken" ->
                    r_continuation_token :=
                      Some
                        (Read.sequence i "ContinuationToken"
                           (fun i attrs -> token_of_xml i attrs)
                           ())
                | "NextContinuationToken" ->
                    r_next_continuation_token :=
                      Some
                        (Read.sequence i "NextContinuationToken"
                           (fun i attrs -> next_token_of_xml i attrs)
                           ())
                | "StartAfter" ->
                    r_start_after :=
                      Some
                        (Read.sequence i "StartAfter"
                           (fun i attrs -> start_after_of_xml i attrs)
                           ())
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
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
             }
              : list_objects_v2_output)))
      ~error_deserializer
end

module ListObjectVersions = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : list_object_versions_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?versions"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.delimiter with Some v -> [ ("delimiter", [ v ]) ] | None -> []);
          (match request.encoding_type with
          | Some v ->
              [ ("encoding-type", [ (fun (v : encoding_type) -> match v with Url -> "url") v ]) ]
          | None -> []);
          (match request.key_marker with Some v -> [ ("key-marker", [ v ]) ] | None -> []);
          (match request.max_keys with
          | Some v -> [ ("max-keys", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.prefix with Some v -> [ ("prefix", [ v ]) ] | None -> []);
          (match request.version_id_marker with
          | Some v -> [ ("version-id-marker", [ v ]) ]
          | None -> []);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.optional_object_attributes with
          | Some v ->
              [
                ( "x-amz-optional-object-attributes",
                  String.concat ", "
                    (List.map
                       (fun (v : optional_object_attributes) ->
                         match v with RESTORE_STATUS -> "RestoreStatus")
                       v) );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListObjectVersions" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
              ] (fun tag _ ->
                match tag with
                | "IsTruncated" ->
                    r_is_truncated :=
                      Some
                        (Read.sequence i "IsTruncated"
                           (fun i attrs -> is_truncated_of_xml i attrs)
                           ())
                | "KeyMarker" ->
                    r_key_marker :=
                      Some
                        (Read.sequence i "KeyMarker" (fun i attrs -> key_marker_of_xml i attrs) ())
                | "VersionIdMarker" ->
                    r_version_id_marker :=
                      Some
                        (Read.sequence i "VersionIdMarker"
                           (fun i attrs -> version_id_marker_of_xml i attrs)
                           ())
                | "NextKeyMarker" ->
                    r_next_key_marker :=
                      Some
                        (Read.sequence i "NextKeyMarker"
                           (fun i attrs -> next_key_marker_of_xml i attrs)
                           ())
                | "NextVersionIdMarker" ->
                    r_next_version_id_marker :=
                      Some
                        (Read.sequence i "NextVersionIdMarker"
                           (fun i attrs -> next_version_id_marker_of_xml i attrs)
                           ())
                | "Version" ->
                    r_versions :=
                      Some
                        (Read.sequences i "Version"
                           (fun i attrs -> object_version_of_xml i attrs)
                           ())
                | "DeleteMarker" ->
                    r_delete_markers :=
                      Some
                        (Read.sequences i "DeleteMarker"
                           (fun i attrs -> delete_marker_entry_of_xml i attrs)
                           ())
                | "Name" ->
                    r_name :=
                      Some (Read.sequence i "Name" (fun i attrs -> bucket_name_of_xml i attrs) ())
                | "Prefix" ->
                    r_prefix :=
                      Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
                | "Delimiter" ->
                    r_delimiter :=
                      Some
                        (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
                | "MaxKeys" ->
                    r_max_keys :=
                      Some (Read.sequence i "MaxKeys" (fun i attrs -> max_keys_of_xml i attrs) ())
                | "CommonPrefixes" ->
                    r_common_prefixes :=
                      Some
                        (Read.sequences i "CommonPrefixes"
                           (fun i attrs -> common_prefix_of_xml i attrs)
                           ())
                | "EncodingType" ->
                    r_encoding_type :=
                      Some
                        (Read.sequence i "EncodingType"
                           (fun i attrs -> encoding_type_of_xml i attrs)
                           ())
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
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
             }
              : list_object_versions_output)))
      ~error_deserializer
end

module ListParts = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : list_parts_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?x-id=ListParts"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.max_parts with
          | Some v -> [ ("max-parts", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.part_number_marker with
          | Some v -> [ ("part-number-marker", [ v ]) ]
          | None -> []);
          (let v = request.upload_id in
           [ ("uploadId", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.sse_customer_key with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ListParts" ~service ~context ~method_:`GET ~uri
      ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
            let r_checksum_algorithm = ref None in
            let r_checksum_type = ref None in
            Structure.scanSequence i
              [
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
                "ChecksumAlgorithm";
                "ChecksumType";
              ] (fun tag _ ->
                match tag with
                | "Bucket" ->
                    r_bucket :=
                      Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
                | "Key" ->
                    r_key :=
                      Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
                | "UploadId" ->
                    r_upload_id :=
                      Some
                        (Read.sequence i "UploadId"
                           (fun i attrs -> multipart_upload_id_of_xml i attrs)
                           ())
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
                      Some
                        (Read.sequence i "IsTruncated"
                           (fun i attrs -> is_truncated_of_xml i attrs)
                           ())
                | "Part" ->
                    r_parts :=
                      Some (Read.sequences i "Part" (fun i attrs -> part_of_xml i attrs) ())
                | "Initiator" ->
                    r_initiator :=
                      Some
                        (Read.sequence i "Initiator" (fun i attrs -> initiator_of_xml i attrs) ())
                | "Owner" ->
                    r_owner :=
                      Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
                | "StorageClass" ->
                    r_storage_class :=
                      Some
                        (Read.sequence i "StorageClass"
                           (fun i attrs -> storage_class_of_xml i attrs)
                           ())
                | "ChecksumAlgorithm" ->
                    r_checksum_algorithm :=
                      Some
                        (Read.sequence i "ChecksumAlgorithm"
                           (fun i attrs -> checksum_algorithm_of_xml i attrs)
                           ())
                | "ChecksumType" ->
                    r_checksum_type :=
                      Some
                        (Read.sequence i "ChecksumType"
                           (fun i attrs -> checksum_type_of_xml i attrs)
                           ())
                | _ -> Read.skip_element i);
            ({
               abort_date =
                 Option.map
                   (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string s)
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-abort-date");
               abort_rule_id =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-abort-rule-id";
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
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
               checksum_algorithm = ( ! ) r_checksum_algorithm;
               checksum_type = ( ! ) r_checksum_type;
             }
              : list_parts_output)))
      ~error_deserializer
end

module PutBucketAbac = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_abac_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?abac"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.abac_status in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "AbacStatus" ~ns:"http://s3.amazonaws.com/doc/2006-03-01/"
           (fun w -> abac_status_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketAbac" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketAccelerateConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_accelerate_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?accelerate"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.accelerate_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "AccelerateConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             accelerate_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketAccelerateConfiguration" ~service
      ~context ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketAcl = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_acl_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?acl"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.ac_l with
          | Some v ->
              [
                ( "x-amz-acl",
                  (fun (v : bucket_canned_ac_l) ->
                    match v with
                    | Private -> "private"
                    | Public_read -> "public-read"
                    | Public_read_write -> "public-read-write"
                    | Authenticated_read -> "authenticated-read")
                    v );
              ]
          | None -> []);
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.grant_full_control with
          | Some v -> [ ("x-amz-grant-full-control", v) ]
          | None -> []);
          (match request.grant_read with Some v -> [ ("x-amz-grant-read", v) ] | None -> []);
          (match request.grant_read_ac_p with
          | Some v -> [ ("x-amz-grant-read-acp", v) ]
          | None -> []);
          (match request.grant_write with Some v -> [ ("x-amz-grant-write", v) ] | None -> []);
          (match request.grant_write_ac_p with
          | Some v -> [ ("x-amz-grant-write-acp", v) ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.access_control_policy with
      | Some v ->
          Some
            (let w = Smaws_Lib.Xml.Write.make () in
             Smaws_Lib.Xml.Write.element w "AccessControlPolicy"
               ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
                 access_control_policy_to_xml w v);
             ("application/xml", Smaws_Lib.Xml.Write.to_string w))
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketAcl" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketAnalyticsConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_analytics_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?analytics"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.analytics_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "AnalyticsConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             analytics_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketAnalyticsConfiguration" ~service
      ~context ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketCors = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_cors_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?cors"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.cors_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "CORSConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w -> cors_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketCors" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketEncryption = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_encryption_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?encryption"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.server_side_encryption_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "ServerSideEncryptionConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             server_side_encryption_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketEncryption" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketIntelligentTieringConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_intelligent_tiering_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?intelligent-tiering"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.intelligent_tiering_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "IntelligentTieringConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             intelligent_tiering_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketIntelligentTieringConfiguration"
      ~service ~context ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketInventoryConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_inventory_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?inventory"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.inventory_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "InventoryConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             inventory_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketInventoryConfiguration" ~service
      ~context ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketLifecycleConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_lifecycle_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?lifecycle"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.transition_default_minimum_object_size with
          | Some v ->
              [
                ( "x-amz-transition-default-minimum-object-size",
                  (fun (v : transition_default_minimum_object_size) ->
                    match v with
                    | Varies_by_storage_class -> "varies_by_storage_class"
                    | All_storage_classes_128K -> "all_storage_classes_128K")
                    v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.lifecycle_configuration with
      | Some v ->
          Some
            (let w = Smaws_Lib.Xml.Write.make () in
             Smaws_Lib.Xml.Write.element w "LifecycleConfiguration"
               ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
                 bucket_lifecycle_configuration_to_xml w v);
             ("application/xml", Smaws_Lib.Xml.Write.to_string w))
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketLifecycleConfiguration" ~service
      ~context ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           transition_default_minimum_object_size =
             Option.map
               (fun s ->
                 (match s with
                  | "varies_by_storage_class" -> Varies_by_storage_class
                  | "all_storage_classes_128K" -> All_storage_classes_128K
                  | _ -> failwith "unknown enum value"
                   : transition_default_minimum_object_size))
               (Smaws_Lib.Protocols.RestXml.header_value headers
                  "x-amz-transition-default-minimum-object-size");
         }
          : put_bucket_lifecycle_configuration_output))
      ~error_deserializer
end

module PutBucketLogging = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_logging_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?logging"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.bucket_logging_status in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "BucketLoggingStatus"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w -> bucket_logging_status_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketLogging" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketMetricsConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_metrics_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?metrics"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.id in
           [ ("id", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.metrics_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "MetricsConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w -> metrics_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketMetricsConfiguration" ~service
      ~context ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketNotificationConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_notification_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?notification"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.skip_destination_validation with
          | Some v -> [ ("x-amz-skip-destination-validation", (fun v -> string_of_bool v) v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.notification_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "NotificationConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             notification_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketNotificationConfiguration" ~service
      ~context ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketOwnershipControls = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_ownership_controls_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?ownershipControls"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.ownership_controls in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "OwnershipControls"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w -> ownership_controls_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketOwnershipControls" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_policy_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?policy"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.confirm_remove_self_bucket_access with
          | Some v -> [ ("x-amz-confirm-remove-self-bucket-access", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.policy in
      Some ("text/plain", v)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketPolicy" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketReplication = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_replication_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?replication"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.token with
          | Some v -> [ ("x-amz-bucket-object-lock-token", v) ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.replication_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "ReplicationConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             replication_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketReplication" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketRequestPayment = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_request_payment_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?requestPayment"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.request_payment_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "RequestPaymentConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             request_payment_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketRequestPayment" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketTagging = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_tagging_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?tagging"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.tagging in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "Tagging" ~ns:"http://s3.amazonaws.com/doc/2006-03-01/"
           (fun w -> tagging_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketTagging" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketVersioning = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_versioning_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?versioning"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.mf_a with Some v -> [ ("x-amz-mfa", v) ] | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.versioning_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "VersioningConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             versioning_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketVersioning" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutBucketWebsite = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_bucket_website_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?website"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.website_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "WebsiteConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w -> website_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutBucketWebsite" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutObject = struct
  let error_to_string = function
    | `EncryptionTypeMismatch _ -> "com.amazonaws.s3#EncryptionTypeMismatch"
    | `InvalidRequest _ -> "com.amazonaws.s3#InvalidRequest"
    | `InvalidWriteOffset _ -> "com.amazonaws.s3#InvalidWriteOffset"
    | `TooManyParts _ -> "com.amazonaws.s3#TooManyParts"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "EncryptionTypeMismatch" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> encryption_type_mismatch_of_xml i attrs)
        with
        | Ok s -> `EncryptionTypeMismatch s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRequest" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> invalid_request_of_xml i attrs)
        with
        | Ok s -> `InvalidRequest s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "InvalidWriteOffset" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> invalid_write_offset_of_xml i attrs)
        with
        | Ok s -> `InvalidWriteOffset s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "TooManyParts" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> too_many_parts_of_xml i attrs)
        with
        | Ok s -> `TooManyParts s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : put_object_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?x-id=PutObject"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.ac_l with
          | Some v ->
              [
                ( "x-amz-acl",
                  (fun (v : object_canned_ac_l) ->
                    match v with
                    | Private -> "private"
                    | Public_read -> "public-read"
                    | Public_read_write -> "public-read-write"
                    | Authenticated_read -> "authenticated-read"
                    | Aws_exec_read -> "aws-exec-read"
                    | Bucket_owner_read -> "bucket-owner-read"
                    | Bucket_owner_full_control -> "bucket-owner-full-control")
                    v );
              ]
          | None -> []);
          (match request.cache_control with Some v -> [ ("Cache-Control", v) ] | None -> []);
          (match request.content_disposition with
          | Some v -> [ ("Content-Disposition", v) ]
          | None -> []);
          (match request.content_encoding with Some v -> [ ("Content-Encoding", v) ] | None -> []);
          (match request.content_language with Some v -> [ ("Content-Language", v) ] | None -> []);
          (match request.content_length with
          | Some v -> [ ("Content-Length", (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) v) ]
          | None -> []);
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.content_type with Some v -> [ ("Content-Type", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.checksum_cr_c32 with
          | Some v -> [ ("x-amz-checksum-crc32", v) ]
          | None -> []);
          (match request.checksum_crc32_c with
          | Some v -> [ ("x-amz-checksum-crc32c", v) ]
          | None -> []);
          (match request.checksum_crc64nvm_e with
          | Some v -> [ ("x-amz-checksum-crc64nvme", v) ]
          | None -> []);
          (match request.checksum_sh_a1 with
          | Some v -> [ ("x-amz-checksum-sha1", v) ]
          | None -> []);
          (match request.checksum_sh_a256 with
          | Some v -> [ ("x-amz-checksum-sha256", v) ]
          | None -> []);
          (match request.checksum_sh_a512 with
          | Some v -> [ ("x-amz-checksum-sha512", v) ]
          | None -> []);
          (match request.checksum_m_d5 with Some v -> [ ("x-amz-checksum-md5", v) ] | None -> []);
          (match request.checksum_xxhas_h64 with
          | Some v -> [ ("x-amz-checksum-xxhash64", v) ]
          | None -> []);
          (match request.checksum_xxhas_h3 with
          | Some v -> [ ("x-amz-checksum-xxhash3", v) ]
          | None -> []);
          (match request.checksum_xxhas_h128 with
          | Some v -> [ ("x-amz-checksum-xxhash128", v) ]
          | None -> []);
          (match request.expires with Some v -> [ ("Expires", v) ] | None -> []);
          (match request.if_match with Some v -> [ ("If-Match", v) ] | None -> []);
          (match request.if_none_match with Some v -> [ ("If-None-Match", v) ] | None -> []);
          (match request.grant_full_control with
          | Some v -> [ ("x-amz-grant-full-control", v) ]
          | None -> []);
          (match request.grant_read with Some v -> [ ("x-amz-grant-read", v) ] | None -> []);
          (match request.grant_read_ac_p with
          | Some v -> [ ("x-amz-grant-read-acp", v) ]
          | None -> []);
          (match request.grant_write_ac_p with
          | Some v -> [ ("x-amz-grant-write-acp", v) ]
          | None -> []);
          (match request.write_offset_bytes with
          | Some v ->
              [ ("x-amz-write-offset-bytes", (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) v) ]
          | None -> []);
          (match request.server_side_encryption with
          | Some v ->
              [
                ( "x-amz-server-side-encryption",
                  (fun (v : server_side_encryption) ->
                    match v with
                    | AES256 -> "AES256"
                    | Aws_fsx -> "aws:fsx"
                    | Aws_kms -> "aws:kms"
                    | Aws_kms_dsse -> "aws:kms:dsse")
                    v );
              ]
          | None -> []);
          (match request.storage_class with
          | Some v ->
              [
                ( "x-amz-storage-class",
                  (fun (v : storage_class) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.website_redirect_location with
          | Some v -> [ ("x-amz-website-redirect-location", v) ]
          | None -> []);
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.sse_customer_key with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.ssekms_key_id with
          | Some v -> [ ("x-amz-server-side-encryption-aws-kms-key-id", v) ]
          | None -> []);
          (match request.ssekms_encryption_context with
          | Some v -> [ ("x-amz-server-side-encryption-context", v) ]
          | None -> []);
          (match request.bucket_key_enabled with
          | Some v ->
              [ ("x-amz-server-side-encryption-bucket-key-enabled", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.tagging with Some v -> [ ("x-amz-tagging", v) ] | None -> []);
          (match request.object_lock_mode with
          | Some v ->
              [
                ( "x-amz-object-lock-mode",
                  (fun (v : object_lock_mode) ->
                    match v with GOVERNANCE -> "GOVERNANCE" | COMPLIANCE -> "COMPLIANCE")
                    v );
              ]
          | None -> []);
          (match request.object_lock_retain_until_date with
          | Some v ->
              [
                ( "x-amz-object-lock-retain-until-date",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v) v );
              ]
          | None -> []);
          (match request.object_lock_legal_hold_status with
          | Some v ->
              [
                ( "x-amz-object-lock-legal-hold",
                  (fun (v : object_lock_legal_hold_status) ->
                    match v with ON -> "ON" | OFF -> "OFF")
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers =
      List.concat [ (match request.metadata with Some v -> [ ("x-amz-meta-", v) ] | None -> []) ]
    in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.body with
      | Some v -> Some ("application/octet-stream", Bytes.to_string v)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutObject" ~service ~context ~method_:`PUT ~uri
      ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           expiration = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-expiration";
           e_tag = Smaws_Lib.Protocols.RestXml.header_value headers "ETag";
           checksum_cr_c32 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32";
           checksum_crc32_c =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32c";
           checksum_crc64nvm_e =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc64nvme";
           checksum_sh_a1 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha1";
           checksum_sh_a256 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha256";
           checksum_sh_a512 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha512";
           checksum_m_d5 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-md5";
           checksum_xxhas_h64 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash64";
           checksum_xxhas_h3 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash3";
           checksum_xxhas_h128 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash128";
           checksum_type =
             Option.map
               (fun s ->
                 (match s with
                  | "COMPOSITE" -> COMPOSITE
                  | "FULL_OBJECT" -> FULL_OBJECT
                  | _ -> failwith "unknown enum value"
                   : checksum_type))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-type");
           server_side_encryption =
             Option.map
               (fun s ->
                 (match s with
                  | "AES256" -> AES256
                  | "aws:fsx" -> Aws_fsx
                  | "aws:kms" -> Aws_kms
                  | "aws:kms:dsse" -> Aws_kms_dsse
                  | _ -> failwith "unknown enum value"
                   : server_side_encryption))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption");
           version_id = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-version-id";
           sse_customer_algorithm =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-algorithm";
           sse_customer_key_m_d5 =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-key-MD5";
           ssekms_key_id =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-aws-kms-key-id";
           ssekms_encryption_context =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption-context";
           bucket_key_enabled =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers
                  "x-amz-server-side-encryption-bucket-key-enabled");
           size =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.long_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-object-size");
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : put_object_output))
      ~error_deserializer
end

module PutObjectAcl = struct
  let error_to_string = function
    | `NoSuchKey _ -> "com.amazonaws.s3#NoSuchKey"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "NoSuchKey" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_key_of_xml i attrs)
        with
        | Ok s -> `NoSuchKey s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : put_object_acl_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?acl"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.ac_l with
          | Some v ->
              [
                ( "x-amz-acl",
                  (fun (v : object_canned_ac_l) ->
                    match v with
                    | Private -> "private"
                    | Public_read -> "public-read"
                    | Public_read_write -> "public-read-write"
                    | Authenticated_read -> "authenticated-read"
                    | Aws_exec_read -> "aws-exec-read"
                    | Bucket_owner_read -> "bucket-owner-read"
                    | Bucket_owner_full_control -> "bucket-owner-full-control")
                    v );
              ]
          | None -> []);
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.grant_full_control with
          | Some v -> [ ("x-amz-grant-full-control", v) ]
          | None -> []);
          (match request.grant_read with Some v -> [ ("x-amz-grant-read", v) ] | None -> []);
          (match request.grant_read_ac_p with
          | Some v -> [ ("x-amz-grant-read-acp", v) ]
          | None -> []);
          (match request.grant_write with Some v -> [ ("x-amz-grant-write", v) ] | None -> []);
          (match request.grant_write_ac_p with
          | Some v -> [ ("x-amz-grant-write-acp", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.access_control_policy with
      | Some v ->
          Some
            (let w = Smaws_Lib.Xml.Write.make () in
             Smaws_Lib.Xml.Write.element w "AccessControlPolicy"
               ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
                 access_control_policy_to_xml w v);
             ("application/xml", Smaws_Lib.Xml.Write.to_string w))
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutObjectAcl" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : put_object_acl_output))
      ~error_deserializer
end

module PutObjectAnnotation = struct
  let error_to_string = function
    | `AnnotationLimitExceeded _ -> "com.amazonaws.s3#AnnotationLimitExceeded"
    | `AnnotationNameTooLong _ -> "com.amazonaws.s3#AnnotationNameTooLong"
    | `InvalidAnnotationName _ -> "com.amazonaws.s3#InvalidAnnotationName"
    | `InvalidRequest _ -> "com.amazonaws.s3#InvalidRequest"
    | `NoSuchBucket _ -> "com.amazonaws.s3#NoSuchBucket"
    | `NoSuchKey _ -> "com.amazonaws.s3#NoSuchKey"
    | `UnsupportedMediaType _ -> "com.amazonaws.s3#UnsupportedMediaType"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "AnnotationLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> annotation_limit_exceeded_of_xml i attrs)
        with
        | Ok s -> `AnnotationLimitExceeded s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "AnnotationNameTooLong" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> annotation_name_too_long_of_xml i attrs)
        with
        | Ok s -> `AnnotationNameTooLong s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "InvalidAnnotationName" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> invalid_annotation_name_of_xml i attrs)
        with
        | Ok s -> `InvalidAnnotationName s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRequest" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> invalid_request_of_xml i attrs)
        with
        | Ok s -> `InvalidRequest s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchBucket" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_bucket_of_xml i attrs)
        with
        | Ok s -> `NoSuchBucket s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchKey" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_key_of_xml i attrs)
        with
        | Ok s -> `NoSuchKey s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedMediaType" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> unsupported_media_type_of_xml i attrs)
        with
        | Ok s -> `UnsupportedMediaType s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : put_object_annotation_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?annotation"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []);
          (let v = request.annotation_name in
           [ ("annotationName", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.object_if_match with
          | Some v -> [ ("x-amz-object-if-match", v) ]
          | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.checksum_cr_c32 with
          | Some v -> [ ("x-amz-checksum-crc32", v) ]
          | None -> []);
          (match request.checksum_crc32_c with
          | Some v -> [ ("x-amz-checksum-crc32c", v) ]
          | None -> []);
          (match request.checksum_crc64nvm_e with
          | Some v -> [ ("x-amz-checksum-crc64nvme", v) ]
          | None -> []);
          (match request.checksum_sh_a1 with
          | Some v -> [ ("x-amz-checksum-sha1", v) ]
          | None -> []);
          (match request.checksum_sh_a256 with
          | Some v -> [ ("x-amz-checksum-sha256", v) ]
          | None -> []);
          (match request.checksum_sh_a512 with
          | Some v -> [ ("x-amz-checksum-sha512", v) ]
          | None -> []);
          (match request.checksum_m_d5 with Some v -> [ ("x-amz-checksum-md5", v) ] | None -> []);
          (match request.checksum_xxhas_h64 with
          | Some v -> [ ("x-amz-checksum-xxhash64", v) ]
          | None -> []);
          (match request.checksum_xxhas_h3 with
          | Some v -> [ ("x-amz-checksum-xxhash3", v) ]
          | None -> []);
          (match request.checksum_xxhas_h128 with
          | Some v -> [ ("x-amz-checksum-xxhash128", v) ]
          | None -> []);
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.annotation_payload in
      Some ("application/octet-stream", Bytes.to_string v)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutObjectAnnotation" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_key = ref None in
            let r_annotation_name = ref None in
            Structure.scanSequence i [ "Key"; "AnnotationName" ] (fun tag _ ->
                match tag with
                | "Key" ->
                    r_key :=
                      Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
                | "AnnotationName" ->
                    r_annotation_name :=
                      Some
                        (Read.sequence i "AnnotationName"
                           (fun i attrs -> annotation_name_of_xml i attrs)
                           ())
                | _ -> Read.skip_element i);
            ({
               key = ( ! ) r_key;
               annotation_name = ( ! ) r_annotation_name;
               object_version_id =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-object-version-id";
               e_tag = Smaws_Lib.Protocols.RestXml.header_value headers "ETag";
               checksum_cr_c32 =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32";
               checksum_crc32_c =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32c";
               checksum_crc64nvm_e =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc64nvme";
               checksum_sh_a1 =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha1";
               checksum_sh_a256 =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha256";
               checksum_sh_a512 =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha512";
               checksum_m_d5 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-md5";
               checksum_xxhas_h64 =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash64";
               checksum_xxhas_h3 =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash3";
               checksum_xxhas_h128 =
                 Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash128";
               checksum_type =
                 Option.map
                   (fun s ->
                     (match s with
                      | "COMPOSITE" -> COMPOSITE
                      | "FULL_OBJECT" -> FULL_OBJECT
                      | _ -> failwith "unknown enum value"
                       : checksum_type))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-type");
               server_side_encryption =
                 Option.map
                   (fun s ->
                     (match s with
                      | "AES256" -> AES256
                      | "aws:fsx" -> Aws_fsx
                      | "aws:kms" -> Aws_kms
                      | "aws:kms:dsse" -> Aws_kms_dsse
                      | _ -> failwith "unknown enum value"
                       : server_side_encryption))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption");
               request_charged =
                 Option.map
                   (fun s ->
                     (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                       : request_charged))
                   (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
             }
              : put_object_annotation_output)))
      ~error_deserializer
end

module PutObjectLegalHold = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_object_legal_hold_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?legal-hold"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.legal_hold with
      | Some v ->
          Some
            (let w = Smaws_Lib.Xml.Write.make () in
             Smaws_Lib.Xml.Write.element w "LegalHold" ~ns:"http://s3.amazonaws.com/doc/2006-03-01/"
               (fun w -> object_lock_legal_hold_to_xml w v);
             ("application/xml", Smaws_Lib.Xml.Write.to_string w))
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutObjectLegalHold" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : put_object_legal_hold_output))
      ~error_deserializer
end

module PutObjectLockConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_object_lock_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?object-lock"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.token with
          | Some v -> [ ("x-amz-bucket-object-lock-token", v) ]
          | None -> []);
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.object_lock_configuration with
      | Some v ->
          Some
            (let w = Smaws_Lib.Xml.Write.make () in
             Smaws_Lib.Xml.Write.element w "ObjectLockConfiguration"
               ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
                 object_lock_configuration_to_xml w v);
             ("application/xml", Smaws_Lib.Xml.Write.to_string w))
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutObjectLockConfiguration" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : put_object_lock_configuration_output))
      ~error_deserializer
end

module PutObjectRetention = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_object_retention_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?retention"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.bypass_governance_retention with
          | Some v -> [ ("x-amz-bypass-governance-retention", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.retention with
      | Some v ->
          Some
            (let w = Smaws_Lib.Xml.Write.make () in
             Smaws_Lib.Xml.Write.element w "Retention" ~ns:"http://s3.amazonaws.com/doc/2006-03-01/"
               (fun w -> object_lock_retention_to_xml w v);
             ("application/xml", Smaws_Lib.Xml.Write.to_string w))
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutObjectRetention" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : put_object_retention_output))
      ~error_deserializer
end

module PutObjectTagging = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_object_tagging_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?tagging"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.tagging in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "Tagging" ~ns:"http://s3.amazonaws.com/doc/2006-03-01/"
           (fun w -> tagging_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutObjectTagging" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({ version_id = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-version-id" }
          : put_object_tagging_output))
      ~error_deserializer
end

module PutPublicAccessBlock = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : put_public_access_block_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?publicAccessBlock"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.public_access_block_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "PublicAccessBlockConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             public_access_block_configuration_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutPublicAccessBlock" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module RenameObject = struct
  let error_to_string = function
    | `IdempotencyParameterMismatch _ -> "com.amazonaws.s3#IdempotencyParameterMismatch"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "IdempotencyParameterMismatch" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> idempotency_parameter_mismatch_of_xml i attrs)
        with
        | Ok s -> `IdempotencyParameterMismatch s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : rename_object_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?renameObject"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let request =
      {
        bucket = request.bucket;
        key = request.key;
        rename_source = request.rename_source;
        destination_if_match = request.destination_if_match;
        destination_if_none_match = request.destination_if_none_match;
        destination_if_modified_since = request.destination_if_modified_since;
        destination_if_unmodified_since = request.destination_if_unmodified_since;
        source_if_match = request.source_if_match;
        source_if_none_match = request.source_if_none_match;
        source_if_modified_since = request.source_if_modified_since;
        source_if_unmodified_since = request.source_if_unmodified_since;
        client_token =
          (match request.client_token with
          | Some t -> Some t
          | None -> Some (Smaws_Lib.Uuid.generate ()));
      }
    in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (let v = request.rename_source in
           [ ("x-amz-rename-source", v) ]);
          (match request.destination_if_match with Some v -> [ ("If-Match", v) ] | None -> []);
          (match request.destination_if_none_match with
          | Some v -> [ ("If-None-Match", v) ]
          | None -> []);
          (match request.destination_if_modified_since with
          | Some v ->
              [
                ( "If-Modified-Since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.destination_if_unmodified_since with
          | Some v ->
              [
                ( "If-Unmodified-Since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.source_if_match with
          | Some v -> [ ("x-amz-rename-source-if-match", v) ]
          | None -> []);
          (match request.source_if_none_match with
          | Some v -> [ ("x-amz-rename-source-if-none-match", v) ]
          | None -> []);
          (match request.source_if_modified_since with
          | Some v ->
              [
                ( "x-amz-rename-source-if-modified-since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.source_if_unmodified_since with
          | Some v ->
              [
                ( "x-amz-rename-source-if-unmodified-since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.client_token with Some v -> [ ("x-amz-client-token", v) ] | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"RenameObject" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module RestoreObject = struct
  let error_to_string = function
    | `ObjectAlreadyInActiveTierError _ -> "com.amazonaws.s3#ObjectAlreadyInActiveTierError"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "ObjectAlreadyInActiveTierError" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> object_already_in_active_tier_error_of_xml i attrs)
        with
        | Ok s -> `ObjectAlreadyInActiveTierError s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : restore_object_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?restore"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.restore_request with
      | Some v ->
          Some
            (let w = Smaws_Lib.Xml.Write.make () in
             Smaws_Lib.Xml.Write.element w "RestoreRequest"
               ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w -> restore_request_to_xml w v);
             ("application/xml", Smaws_Lib.Xml.Write.to_string w))
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"RestoreObject" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
           restore_output_path =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-restore-output-path";
         }
          : restore_object_output))
      ~error_deserializer
end

module SelectObjectContent = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : select_object_content_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?select&select-type=2"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.sse_customer_key with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "SelectObjectContentRequest"
        ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
          select_object_content_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"SelectObjectContent" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   select_object_content_event_stream_of_xml i attrs)))
        in
        ({ payload = payload_val } : select_object_content_output))
      ~error_deserializer
end

module UpdateBucketMetadataAnnotationTableConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : update_bucket_metadata_annotation_table_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?metadataAnnotationTable"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.annotation_table_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "AnnotationTableConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             annotation_table_configuration_updates_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request
      ~shape_name:"UpdateBucketMetadataAnnotationTableConfiguration" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module UpdateBucketMetadataInventoryTableConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : update_bucket_metadata_inventory_table_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?metadataInventoryTable"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.inventory_table_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "InventoryTableConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             inventory_table_configuration_updates_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request
      ~shape_name:"UpdateBucketMetadataInventoryTableConfiguration" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module UpdateBucketMetadataJournalTableConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : update_bucket_metadata_journal_table_configuration_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}?metadataJournalTable"
        ~labels:[ ("Bucket", request.bucket, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.journal_table_configuration in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "JournalTableConfiguration"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w ->
             journal_table_configuration_updates_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"UpdateBucketMetadataJournalTableConfiguration"
      ~service ~context ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module UpdateObjectEncryption = struct
  let error_to_string = function
    | `AccessDenied _ -> "com.amazonaws.s3#AccessDenied"
    | `InvalidRequest _ -> "com.amazonaws.s3#InvalidRequest"
    | `NoSuchKey _ -> "com.amazonaws.s3#NoSuchKey"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "AccessDenied" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> access_denied_of_xml i attrs)
        with
        | Ok s -> `AccessDenied s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRequest" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> invalid_request_of_xml i attrs)
        with
        | Ok s -> `InvalidRequest s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchKey" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_key_of_xml i attrs)
        with
        | Ok s -> `NoSuchKey s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : update_object_encryption_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?encryption"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [ (match request.version_id with Some v -> [ ("versionId", [ v ]) ] | None -> []) ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let v = request.object_encryption in
      Some
        (let w = Smaws_Lib.Xml.Write.make () in
         Smaws_Lib.Xml.Write.element w "ObjectEncryption"
           ~ns:"http://s3.amazonaws.com/doc/2006-03-01/" (fun w -> object_encryption_to_xml w v);
         ("application/xml", Smaws_Lib.Xml.Write.to_string w))
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"UpdateObjectEncryption" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : update_object_encryption_response))
      ~error_deserializer
end

module UploadPart = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : upload_part_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?x-id=UploadPart"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.part_number in
           [ ("partNumber", [ (fun v -> string_of_int v) v ]) ]);
          (let v = request.upload_id in
           [ ("uploadId", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.content_length with
          | Some v -> [ ("Content-Length", (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) v) ]
          | None -> []);
          (match request.content_m_d5 with Some v -> [ ("Content-MD5", v) ] | None -> []);
          (match request.checksum_algorithm with
          | Some v ->
              [
                ( "x-amz-sdk-checksum-algorithm",
                  (fun (v : checksum_algorithm) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.checksum_cr_c32 with
          | Some v -> [ ("x-amz-checksum-crc32", v) ]
          | None -> []);
          (match request.checksum_crc32_c with
          | Some v -> [ ("x-amz-checksum-crc32c", v) ]
          | None -> []);
          (match request.checksum_crc64nvm_e with
          | Some v -> [ ("x-amz-checksum-crc64nvme", v) ]
          | None -> []);
          (match request.checksum_sh_a1 with
          | Some v -> [ ("x-amz-checksum-sha1", v) ]
          | None -> []);
          (match request.checksum_sh_a256 with
          | Some v -> [ ("x-amz-checksum-sha256", v) ]
          | None -> []);
          (match request.checksum_sh_a512 with
          | Some v -> [ ("x-amz-checksum-sha512", v) ]
          | None -> []);
          (match request.checksum_m_d5 with Some v -> [ ("x-amz-checksum-md5", v) ] | None -> []);
          (match request.checksum_xxhas_h64 with
          | Some v -> [ ("x-amz-checksum-xxhash64", v) ]
          | None -> []);
          (match request.checksum_xxhas_h3 with
          | Some v -> [ ("x-amz-checksum-xxhash3", v) ]
          | None -> []);
          (match request.checksum_xxhas_h128 with
          | Some v -> [ ("x-amz-checksum-xxhash128", v) ]
          | None -> []);
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.sse_customer_key with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.body with
      | Some v -> Some ("application/octet-stream", Bytes.to_string v)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"UploadPart" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           server_side_encryption =
             Option.map
               (fun s ->
                 (match s with
                  | "AES256" -> AES256
                  | "aws:fsx" -> Aws_fsx
                  | "aws:kms" -> Aws_kms
                  | "aws:kms:dsse" -> Aws_kms_dsse
                  | _ -> failwith "unknown enum value"
                   : server_side_encryption))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption");
           e_tag = Smaws_Lib.Protocols.RestXml.header_value headers "ETag";
           checksum_cr_c32 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32";
           checksum_crc32_c =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc32c";
           checksum_crc64nvm_e =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-crc64nvme";
           checksum_sh_a1 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha1";
           checksum_sh_a256 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha256";
           checksum_sh_a512 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-sha512";
           checksum_m_d5 = Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-md5";
           checksum_xxhas_h64 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash64";
           checksum_xxhas_h3 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash3";
           checksum_xxhas_h128 =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-checksum-xxhash128";
           sse_customer_algorithm =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-algorithm";
           sse_customer_key_m_d5 =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-key-MD5";
           ssekms_key_id =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-aws-kms-key-id";
           bucket_key_enabled =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers
                  "x-amz-server-side-encryption-bucket-key-enabled");
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : upload_part_output))
      ~error_deserializer
end

module UploadPartCopy = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : upload_part_copy_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/{Bucket}/{Key+}?x-id=UploadPartCopy"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.part_number in
           [ ("partNumber", [ (fun v -> string_of_int v) v ]) ]);
          (let v = request.upload_id in
           [ ("uploadId", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (let v = request.copy_source in
           [ ("x-amz-copy-source", v) ]);
          (match request.copy_source_if_match with
          | Some v -> [ ("x-amz-copy-source-if-match", v) ]
          | None -> []);
          (match request.copy_source_if_modified_since with
          | Some v ->
              [
                ( "x-amz-copy-source-if-modified-since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.copy_source_if_none_match with
          | Some v -> [ ("x-amz-copy-source-if-none-match", v) ]
          | None -> []);
          (match request.copy_source_if_unmodified_since with
          | Some v ->
              [
                ( "x-amz-copy-source-if-unmodified-since",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.copy_source_range with
          | Some v -> [ ("x-amz-copy-source-range", v) ]
          | None -> []);
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.sse_customer_key with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.copy_source_sse_customer_algorithm with
          | Some v -> [ ("x-amz-copy-source-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.copy_source_sse_customer_key with
          | Some v -> [ ("x-amz-copy-source-server-side-encryption-customer-key", v) ]
          | None -> []);
          (match request.copy_source_sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-copy-source-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.expected_source_bucket_owner with
          | Some v -> [ ("x-amz-source-expected-bucket-owner", v) ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"UploadPartCopy" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
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
                       | "ETag" ->
                           r_e_tag :=
                             Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
                       | "LastModified" ->
                           r_last_modified :=
                             Some
                               (Read.sequence i "LastModified"
                                  (fun i attrs -> last_modified_of_xml i attrs)
                                  ())
                       | "ChecksumCRC32" ->
                           r_checksum_cr_c32 :=
                             Some
                               (Read.sequence i "ChecksumCRC32"
                                  (fun i attrs -> checksum_cr_c32_of_xml i attrs)
                                  ())
                       | "ChecksumCRC32C" ->
                           r_checksum_crc32_c :=
                             Some
                               (Read.sequence i "ChecksumCRC32C"
                                  (fun i attrs -> checksum_crc32_c_of_xml i attrs)
                                  ())
                       | "ChecksumCRC64NVME" ->
                           r_checksum_crc64nvm_e :=
                             Some
                               (Read.sequence i "ChecksumCRC64NVME"
                                  (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                                  ())
                       | "ChecksumSHA1" ->
                           r_checksum_sh_a1 :=
                             Some
                               (Read.sequence i "ChecksumSHA1"
                                  (fun i attrs -> checksum_sh_a1_of_xml i attrs)
                                  ())
                       | "ChecksumSHA256" ->
                           r_checksum_sh_a256 :=
                             Some
                               (Read.sequence i "ChecksumSHA256"
                                  (fun i attrs -> checksum_sh_a256_of_xml i attrs)
                                  ())
                       | "ChecksumSHA512" ->
                           r_checksum_sh_a512 :=
                             Some
                               (Read.sequence i "ChecksumSHA512"
                                  (fun i attrs -> checksum_sh_a512_of_xml i attrs)
                                  ())
                       | "ChecksumMD5" ->
                           r_checksum_m_d5 :=
                             Some
                               (Read.sequence i "ChecksumMD5"
                                  (fun i attrs -> checksum_m_d5_of_xml i attrs)
                                  ())
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
                     : copy_part_result))))
        in
        ({
           copy_part_result = payload_val;
           copy_source_version_id =
             Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-copy-source-version-id";
           server_side_encryption =
             Option.map
               (fun s ->
                 (match s with
                  | "AES256" -> AES256
                  | "aws:fsx" -> Aws_fsx
                  | "aws:kms" -> Aws_kms
                  | "aws:kms:dsse" -> Aws_kms_dsse
                  | _ -> failwith "unknown enum value"
                   : server_side_encryption))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-server-side-encryption");
           sse_customer_algorithm =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-algorithm";
           sse_customer_key_m_d5 =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-customer-key-MD5";
           ssekms_key_id =
             Smaws_Lib.Protocols.RestXml.header_value headers
               "x-amz-server-side-encryption-aws-kms-key-id";
           bucket_key_enabled =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers
                  "x-amz-server-side-encryption-bucket-key-enabled");
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : upload_part_copy_output))
      ~error_deserializer
end

module WriteGetObjectResponse = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string
  let error_deserializer = Smaws_Lib.Protocols.RestXml.Errors.default_error_deserializer

  let request context (request : write_get_object_response_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/WriteGetObjectResponse" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri =
      Smaws_Lib.Http_bindings.substitute_host_prefix ~host_prefix:"{RequestRoute}."
        ~labels:[ ("RequestRoute", request.request_route) ]
        uri
    in
    let named_params = [] in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (let v = request.request_route in
           [ ("x-amz-request-route", v) ]);
          (let v = request.request_token in
           [ ("x-amz-request-token", v) ]);
          (match request.status_code with
          | Some v -> [ ("x-amz-fwd-status", (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.error_code with Some v -> [ ("x-amz-fwd-error-code", v) ] | None -> []);
          (match request.error_message with
          | Some v -> [ ("x-amz-fwd-error-message", v) ]
          | None -> []);
          (match request.accept_ranges with
          | Some v -> [ ("x-amz-fwd-header-accept-ranges", v) ]
          | None -> []);
          (match request.cache_control with
          | Some v -> [ ("x-amz-fwd-header-Cache-Control", v) ]
          | None -> []);
          (match request.content_disposition with
          | Some v -> [ ("x-amz-fwd-header-Content-Disposition", v) ]
          | None -> []);
          (match request.content_encoding with
          | Some v -> [ ("x-amz-fwd-header-Content-Encoding", v) ]
          | None -> []);
          (match request.content_language with
          | Some v -> [ ("x-amz-fwd-header-Content-Language", v) ]
          | None -> []);
          (match request.content_length with
          | Some v -> [ ("Content-Length", (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) v) ]
          | None -> []);
          (match request.content_range with
          | Some v -> [ ("x-amz-fwd-header-Content-Range", v) ]
          | None -> []);
          (match request.content_type with
          | Some v -> [ ("x-amz-fwd-header-Content-Type", v) ]
          | None -> []);
          (match request.checksum_cr_c32 with
          | Some v -> [ ("x-amz-fwd-header-x-amz-checksum-crc32", v) ]
          | None -> []);
          (match request.checksum_crc32_c with
          | Some v -> [ ("x-amz-fwd-header-x-amz-checksum-crc32c", v) ]
          | None -> []);
          (match request.checksum_crc64nvm_e with
          | Some v -> [ ("x-amz-fwd-header-x-amz-checksum-crc64nvme", v) ]
          | None -> []);
          (match request.checksum_sh_a1 with
          | Some v -> [ ("x-amz-fwd-header-x-amz-checksum-sha1", v) ]
          | None -> []);
          (match request.checksum_sh_a256 with
          | Some v -> [ ("x-amz-fwd-header-x-amz-checksum-sha256", v) ]
          | None -> []);
          (match request.checksum_sh_a512 with
          | Some v -> [ ("x-amz-fwd-header-x-amz-checksum-sha512", v) ]
          | None -> []);
          (match request.checksum_m_d5 with
          | Some v -> [ ("x-amz-fwd-header-x-amz-checksum-md5", v) ]
          | None -> []);
          (match request.checksum_xxhas_h64 with
          | Some v -> [ ("x-amz-fwd-header-x-amz-checksum-xxhash64", v) ]
          | None -> []);
          (match request.checksum_xxhas_h3 with
          | Some v -> [ ("x-amz-fwd-header-x-amz-checksum-xxhash3", v) ]
          | None -> []);
          (match request.checksum_xxhas_h128 with
          | Some v -> [ ("x-amz-fwd-header-x-amz-checksum-xxhash128", v) ]
          | None -> []);
          (match request.delete_marker with
          | Some v -> [ ("x-amz-fwd-header-x-amz-delete-marker", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.e_tag with Some v -> [ ("x-amz-fwd-header-ETag", v) ] | None -> []);
          (match request.expires with Some v -> [ ("x-amz-fwd-header-Expires", v) ] | None -> []);
          (match request.expiration with
          | Some v -> [ ("x-amz-fwd-header-x-amz-expiration", v) ]
          | None -> []);
          (match request.last_modified with
          | Some v ->
              [
                ( "x-amz-fwd-header-Last-Modified",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.missing_meta with
          | Some v -> [ ("x-amz-fwd-header-x-amz-missing-meta", (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.object_lock_mode with
          | Some v ->
              [
                ( "x-amz-fwd-header-x-amz-object-lock-mode",
                  (fun (v : object_lock_mode) ->
                    match v with GOVERNANCE -> "GOVERNANCE" | COMPLIANCE -> "COMPLIANCE")
                    v );
              ]
          | None -> []);
          (match request.object_lock_legal_hold_status with
          | Some v ->
              [
                ( "x-amz-fwd-header-x-amz-object-lock-legal-hold",
                  (fun (v : object_lock_legal_hold_status) ->
                    match v with ON -> "ON" | OFF -> "OFF")
                    v );
              ]
          | None -> []);
          (match request.object_lock_retain_until_date with
          | Some v ->
              [
                ( "x-amz-fwd-header-x-amz-object-lock-retain-until-date",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v) v );
              ]
          | None -> []);
          (match request.parts_count with
          | Some v -> [ ("x-amz-fwd-header-x-amz-mp-parts-count", (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.replication_status with
          | Some v ->
              [
                ( "x-amz-fwd-header-x-amz-replication-status",
                  (fun (v : replication_status) ->
                    match v with
                    | COMPLETE -> "COMPLETE"
                    | PENDING -> "PENDING"
                    | FAILED -> "FAILED"
                    | REPLICA -> "REPLICA"
                    | COMPLETED -> "COMPLETED")
                    v );
              ]
          | None -> []);
          (match request.request_charged with
          | Some v ->
              [
                ( "x-amz-fwd-header-x-amz-request-charged",
                  (fun (v : request_charged) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.restore with
          | Some v -> [ ("x-amz-fwd-header-x-amz-restore", v) ]
          | None -> []);
          (match request.server_side_encryption with
          | Some v ->
              [
                ( "x-amz-fwd-header-x-amz-server-side-encryption",
                  (fun (v : server_side_encryption) ->
                    match v with
                    | AES256 -> "AES256"
                    | Aws_fsx -> "aws:fsx"
                    | Aws_kms -> "aws:kms"
                    | Aws_kms_dsse -> "aws:kms:dsse")
                    v );
              ]
          | None -> []);
          (match request.sse_customer_algorithm with
          | Some v -> [ ("x-amz-fwd-header-x-amz-server-side-encryption-customer-algorithm", v) ]
          | None -> []);
          (match request.ssekms_key_id with
          | Some v -> [ ("x-amz-fwd-header-x-amz-server-side-encryption-aws-kms-key-id", v) ]
          | None -> []);
          (match request.sse_customer_key_m_d5 with
          | Some v -> [ ("x-amz-fwd-header-x-amz-server-side-encryption-customer-key-MD5", v) ]
          | None -> []);
          (match request.storage_class with
          | Some v ->
              [
                ( "x-amz-fwd-header-x-amz-storage-class",
                  (fun (v : storage_class) ->
                    match v with
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
                    v );
              ]
          | None -> []);
          (match request.tag_count with
          | Some v -> [ ("x-amz-fwd-header-x-amz-tagging-count", (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.version_id with
          | Some v -> [ ("x-amz-fwd-header-x-amz-version-id", v) ]
          | None -> []);
          (match request.bucket_key_enabled with
          | Some v ->
              [
                ( "x-amz-fwd-header-x-amz-server-side-encryption-bucket-key-enabled",
                  (fun v -> string_of_bool v) v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers =
      List.concat [ (match request.metadata with Some v -> [ ("x-amz-meta-", v) ] | None -> []) ]
    in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.body with
      | Some v -> Some ("application/octet-stream", Bytes.to_string v)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"WriteGetObjectResponse" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module AbortMultipartUpload = struct
  let error_to_string = function
    | `NoSuchUpload _ -> "com.amazonaws.s3#NoSuchUpload"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "NoSuchUpload" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~noErrorWrapping:true
            ~structParser:(fun i attrs -> no_such_upload_of_xml i attrs)
        with
        | Ok s -> `NoSuchUpload s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : abort_multipart_upload_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/{Bucket}/{Key+}?x-id=AbortMultipartUpload"
        ~labels:[ ("Bucket", request.bucket, false); ("Key", request.key, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let named_params =
      List.concat
        [
          (let v = request.upload_id in
           [ ("uploadId", [ v ]) ]);
        ]
    in
    let map_params = [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.request_payer with
          | Some v ->
              [
                ( "x-amz-request-payer",
                  (fun (v : request_payer) -> match v with Requester -> "requester") v );
              ]
          | None -> []);
          (match request.expected_bucket_owner with
          | Some v -> [ ("x-amz-expected-bucket-owner", v) ]
          | None -> []);
          (match request.if_match_initiated_time with
          | Some v ->
              [
                ( "x-amz-if-match-initiated-time",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"AbortMultipartUpload" ~service ~context
      ~method_:`DELETE ~uri ~query ~headers ~body ~noErrorWrapping:true
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           request_charged =
             Option.map
               (fun s ->
                 (match s with "requester" -> Requester | _ -> failwith "unknown enum value"
                   : request_charged))
               (Smaws_Lib.Protocols.RestXml.header_value headers "x-amz-request-charged");
         }
          : abort_multipart_upload_output))
      ~error_deserializer
end
