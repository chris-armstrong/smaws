open Types

let unit_of_xml _ = ()
let unrecognized_public_key_encoding_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let unrecognized_public_key_encoding_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> unrecognized_public_key_encoding_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : unrecognized_public_key_encoding_exception)

let no_such_entity_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let no_such_entity_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> no_such_entity_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : no_such_entity_exception)

let limit_exceeded_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> limit_exceeded_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : limit_exceeded_exception)

let invalid_public_key_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let invalid_public_key_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> invalid_public_key_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_public_key_exception)

let duplicate_ssh_public_key_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let duplicate_ssh_public_key_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> duplicate_ssh_public_key_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : duplicate_ssh_public_key_exception)

let date_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let status_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Active" -> Active
   | "Inactive" -> Inactive
   | "Expired" -> Expired
   | _ -> failwith "unknown enum value"
    : status_type)

let public_key_material_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let public_key_fingerprint_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let public_key_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let user_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let ssh_public_key_of_xml i =
  let r_user_name = ref None in
  let r_ssh_public_key_id = ref None in
  let r_fingerprint = ref None in
  let r_ssh_public_key_body = ref None in
  let r_status = ref None in
  let r_upload_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UserName"; "SSHPublicKeyId"; "Fingerprint"; "SSHPublicKeyBody"; "Status"; "UploadDate" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "SSHPublicKeyId" ->
          r_ssh_public_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSHPublicKeyId"
                 (fun i _ -> public_key_id_type_of_xml i)
                 ())
      | "Fingerprint" ->
          r_fingerprint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Fingerprint"
                 (fun i _ -> public_key_fingerprint_type_of_xml i)
                 ())
      | "SSHPublicKeyBody" ->
          r_ssh_public_key_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSHPublicKeyBody"
                 (fun i _ -> public_key_material_type_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> status_type_of_xml i) ())
      | "UploadDate" ->
          r_upload_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UploadDate" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     ssh_public_key_id = Smaws_Lib.Xml.Parse.required "SSHPublicKeyId" (( ! ) r_ssh_public_key_id) i;
     fingerprint = Smaws_Lib.Xml.Parse.required "Fingerprint" (( ! ) r_fingerprint) i;
     ssh_public_key_body =
       Smaws_Lib.Xml.Parse.required "SSHPublicKeyBody" (( ! ) r_ssh_public_key_body) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     upload_date = ( ! ) r_upload_date;
   }
    : ssh_public_key)

let upload_ssh_public_key_response_of_xml i =
  let r_ssh_public_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SSHPublicKey" ] (fun tag _ ->
      match tag with
      | "SSHPublicKey" ->
          r_ssh_public_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSHPublicKey"
                 (fun i _ -> ssh_public_key_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ ssh_public_key = ( ! ) r_ssh_public_key } : upload_ssh_public_key_response)

let upload_ssh_public_key_request_of_xml i =
  let r_user_name = ref None in
  let r_ssh_public_key_body = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "SSHPublicKeyBody" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "SSHPublicKeyBody" ->
          r_ssh_public_key_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSHPublicKeyBody"
                 (fun i _ -> public_key_material_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     ssh_public_key_body =
       Smaws_Lib.Xml.Parse.required "SSHPublicKeyBody" (( ! ) r_ssh_public_key_body) i;
   }
    : upload_ssh_public_key_request)

let service_failure_exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let service_failure_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> service_failure_exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : service_failure_exception)

let malformed_certificate_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let malformed_certificate_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> malformed_certificate_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : malformed_certificate_exception)

let invalid_certificate_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let invalid_certificate_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> invalid_certificate_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_certificate_exception)

let entity_already_exists_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let entity_already_exists_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> entity_already_exists_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : entity_already_exists_exception)

let duplicate_certificate_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let duplicate_certificate_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> duplicate_certificate_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : duplicate_certificate_exception)

let concurrent_modification_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let concurrent_modification_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> concurrent_modification_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : concurrent_modification_exception)

let certificate_body_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let certificate_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let signing_certificate_of_xml i =
  let r_user_name = ref None in
  let r_certificate_id = ref None in
  let r_certificate_body = ref None in
  let r_status = ref None in
  let r_upload_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UserName"; "CertificateId"; "CertificateBody"; "Status"; "UploadDate" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "CertificateId" ->
          r_certificate_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateId"
                 (fun i _ -> certificate_id_type_of_xml i)
                 ())
      | "CertificateBody" ->
          r_certificate_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateBody"
                 (fun i _ -> certificate_body_type_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> status_type_of_xml i) ())
      | "UploadDate" ->
          r_upload_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UploadDate" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     certificate_id = Smaws_Lib.Xml.Parse.required "CertificateId" (( ! ) r_certificate_id) i;
     certificate_body = Smaws_Lib.Xml.Parse.required "CertificateBody" (( ! ) r_certificate_body) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     upload_date = ( ! ) r_upload_date;
   }
    : signing_certificate)

let upload_signing_certificate_response_of_xml i =
  let r_certificate = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Certificate" ] (fun tag _ ->
      match tag with
      | "Certificate" ->
          r_certificate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Certificate"
                 (fun i _ -> signing_certificate_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ certificate = Smaws_Lib.Xml.Parse.required "Certificate" (( ! ) r_certificate) i }
    : upload_signing_certificate_response)

let existing_user_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let upload_signing_certificate_request_of_xml i =
  let r_user_name = ref None in
  let r_certificate_body = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "CertificateBody" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "CertificateBody" ->
          r_certificate_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateBody"
                 (fun i _ -> certificate_body_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     certificate_body = Smaws_Lib.Xml.Parse.required "CertificateBody" (( ! ) r_certificate_body) i;
   }
    : upload_signing_certificate_request)

let key_pair_mismatch_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let key_pair_mismatch_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> key_pair_mismatch_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : key_pair_mismatch_exception)

let invalid_input_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let invalid_input_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> invalid_input_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_input_exception)

let tag_value_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_key_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_of_xml i =
  let r_key = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Key"; "Value" ] (fun tag _ ->
      match tag with
      | "Key" ->
          r_key :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_type_of_xml i) ())
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i;
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
   }
    : tag)

let tag_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let arn_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let server_certificate_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let path_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let server_certificate_metadata_of_xml i =
  let r_path = ref None in
  let r_server_certificate_name = ref None in
  let r_server_certificate_id = ref None in
  let r_arn = ref None in
  let r_upload_date = ref None in
  let r_expiration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Path"; "ServerCertificateName"; "ServerCertificateId"; "Arn"; "UploadDate"; "Expiration" ]
    (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "ServerCertificateName" ->
          r_server_certificate_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateName"
                 (fun i _ -> server_certificate_name_type_of_xml i)
                 ())
      | "ServerCertificateId" ->
          r_server_certificate_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateId"
                 (fun i _ -> id_type_of_xml i)
                 ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "UploadDate" ->
          r_upload_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UploadDate" (fun i _ -> date_type_of_xml i) ())
      | "Expiration" ->
          r_expiration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expiration" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = Smaws_Lib.Xml.Parse.required "Path" (( ! ) r_path) i;
     server_certificate_name =
       Smaws_Lib.Xml.Parse.required "ServerCertificateName" (( ! ) r_server_certificate_name) i;
     server_certificate_id =
       Smaws_Lib.Xml.Parse.required "ServerCertificateId" (( ! ) r_server_certificate_id) i;
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
     upload_date = ( ! ) r_upload_date;
     expiration = ( ! ) r_expiration;
   }
    : server_certificate_metadata)

let upload_server_certificate_response_of_xml i =
  let r_server_certificate_metadata = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerCertificateMetadata"; "Tags" ] (fun tag _ ->
      match tag with
      | "ServerCertificateMetadata" ->
          r_server_certificate_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateMetadata"
                 (fun i _ -> server_certificate_metadata_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ server_certificate_metadata = ( ! ) r_server_certificate_metadata; tags = ( ! ) r_tags }
    : upload_server_certificate_response)

let certificate_chain_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let private_key_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let upload_server_certificate_request_of_xml i =
  let r_path = ref None in
  let r_server_certificate_name = ref None in
  let r_certificate_body = ref None in
  let r_private_key = ref None in
  let r_certificate_chain = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Path"; "ServerCertificateName"; "CertificateBody"; "PrivateKey"; "CertificateChain"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "ServerCertificateName" ->
          r_server_certificate_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateName"
                 (fun i _ -> server_certificate_name_type_of_xml i)
                 ())
      | "CertificateBody" ->
          r_certificate_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateBody"
                 (fun i _ -> certificate_body_type_of_xml i)
                 ())
      | "PrivateKey" ->
          r_private_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrivateKey"
                 (fun i _ -> private_key_type_of_xml i)
                 ())
      | "CertificateChain" ->
          r_certificate_chain :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateChain"
                 (fun i _ -> certificate_chain_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = ( ! ) r_path;
     server_certificate_name =
       Smaws_Lib.Xml.Parse.required "ServerCertificateName" (( ! ) r_server_certificate_name) i;
     certificate_body = Smaws_Lib.Xml.Parse.required "CertificateBody" (( ! ) r_certificate_body) i;
     private_key = Smaws_Lib.Xml.Parse.required "PrivateKey" (( ! ) r_private_key) i;
     certificate_chain = ( ! ) r_certificate_chain;
     tags = ( ! ) r_tags;
   }
    : upload_server_certificate_request)

let entity_temporarily_unmodifiable_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let entity_temporarily_unmodifiable_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> entity_temporarily_unmodifiable_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : entity_temporarily_unmodifiable_exception)

let update_user_request_of_xml i =
  let r_user_name = ref None in
  let r_new_path = ref None in
  let r_new_user_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "NewPath"; "NewUserName" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "NewPath" ->
          r_new_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NewPath" (fun i _ -> path_type_of_xml i) ())
      | "NewUserName" ->
          r_new_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewUserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     new_path = ( ! ) r_new_path;
     new_user_name = ( ! ) r_new_user_name;
   }
    : update_user_request)

let update_ssh_public_key_request_of_xml i =
  let r_user_name = ref None in
  let r_ssh_public_key_id = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "SSHPublicKeyId"; "Status" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "SSHPublicKeyId" ->
          r_ssh_public_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSHPublicKeyId"
                 (fun i _ -> public_key_id_type_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> status_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     ssh_public_key_id = Smaws_Lib.Xml.Parse.required "SSHPublicKeyId" (( ! ) r_ssh_public_key_id) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : update_ssh_public_key_request)

let update_signing_certificate_request_of_xml i =
  let r_user_name = ref None in
  let r_certificate_id = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "CertificateId"; "Status" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "CertificateId" ->
          r_certificate_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateId"
                 (fun i _ -> certificate_id_type_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> status_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     certificate_id = Smaws_Lib.Xml.Parse.required "CertificateId" (( ! ) r_certificate_id) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : update_signing_certificate_request)

let service_specific_credential_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_service_specific_credential_request_of_xml i =
  let r_user_name = ref None in
  let r_service_specific_credential_id = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UserName"; "ServiceSpecificCredentialId"; "Status" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "ServiceSpecificCredentialId" ->
          r_service_specific_credential_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceSpecificCredentialId"
                 (fun i _ -> service_specific_credential_id_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> status_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     service_specific_credential_id =
       Smaws_Lib.Xml.Parse.required "ServiceSpecificCredentialId"
         (( ! ) r_service_specific_credential_id)
         i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : update_service_specific_credential_request)

let update_server_certificate_request_of_xml i =
  let r_server_certificate_name = ref None in
  let r_new_path = ref None in
  let r_new_server_certificate_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ServerCertificateName"; "NewPath"; "NewServerCertificateName" ] (fun tag _ ->
      match tag with
      | "ServerCertificateName" ->
          r_server_certificate_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateName"
                 (fun i _ -> server_certificate_name_type_of_xml i)
                 ())
      | "NewPath" ->
          r_new_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NewPath" (fun i _ -> path_type_of_xml i) ())
      | "NewServerCertificateName" ->
          r_new_server_certificate_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewServerCertificateName"
                 (fun i _ -> server_certificate_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     server_certificate_name =
       Smaws_Lib.Xml.Parse.required "ServerCertificateName" (( ! ) r_server_certificate_name) i;
     new_path = ( ! ) r_new_path;
     new_server_certificate_name = ( ! ) r_new_server_certificate_name;
   }
    : update_server_certificate_request)

let update_saml_provider_response_of_xml i =
  let r_saml_provider_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SAMLProviderArn" ] (fun tag _ ->
      match tag with
      | "SAMLProviderArn" ->
          r_saml_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ saml_provider_arn = ( ! ) r_saml_provider_arn } : update_saml_provider_response)

let private_key_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let assertion_encryption_mode_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Required" -> Required | "Allowed" -> Allowed | _ -> failwith "unknown enum value"
    : assertion_encryption_mode_type)

let saml_metadata_document_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_saml_provider_request_of_xml i =
  let r_saml_metadata_document = ref None in
  let r_saml_provider_arn = ref None in
  let r_assertion_encryption_mode = ref None in
  let r_add_private_key = ref None in
  let r_remove_private_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SAMLMetadataDocument";
      "SAMLProviderArn";
      "AssertionEncryptionMode";
      "AddPrivateKey";
      "RemovePrivateKey";
    ] (fun tag _ ->
      match tag with
      | "SAMLMetadataDocument" ->
          r_saml_metadata_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLMetadataDocument"
                 (fun i _ -> saml_metadata_document_type_of_xml i)
                 ())
      | "SAMLProviderArn" ->
          r_saml_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "AssertionEncryptionMode" ->
          r_assertion_encryption_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssertionEncryptionMode"
                 (fun i _ -> assertion_encryption_mode_type_of_xml i)
                 ())
      | "AddPrivateKey" ->
          r_add_private_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AddPrivateKey"
                 (fun i _ -> private_key_type_of_xml i)
                 ())
      | "RemovePrivateKey" ->
          r_remove_private_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemovePrivateKey"
                 (fun i _ -> private_key_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     saml_metadata_document = ( ! ) r_saml_metadata_document;
     saml_provider_arn =
       Smaws_Lib.Xml.Parse.required "SAMLProviderArn" (( ! ) r_saml_provider_arn) i;
     assertion_encryption_mode = ( ! ) r_assertion_encryption_mode;
     add_private_key = ( ! ) r_add_private_key;
     remove_private_key = ( ! ) r_remove_private_key;
   }
    : update_saml_provider_request)

let unmodifiable_entity_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let unmodifiable_entity_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> unmodifiable_entity_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : unmodifiable_entity_exception)

let string_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let role_last_used_of_xml i =
  let r_last_used_date = ref None in
  let r_region = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LastUsedDate"; "Region" ] (fun tag _ ->
      match tag with
      | "LastUsedDate" ->
          r_last_used_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUsedDate"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "Region" ->
          r_region :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Region" (fun i _ -> string_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ last_used_date = ( ! ) r_last_used_date; region = ( ! ) r_region } : role_last_used)

let permissions_boundary_attachment_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "PermissionsBoundaryPolicy" -> Policy | _ -> failwith "unknown enum value"
    : permissions_boundary_attachment_type)

let attached_permissions_boundary_of_xml i =
  let r_permissions_boundary_type = ref None in
  let r_permissions_boundary_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PermissionsBoundaryType"; "PermissionsBoundaryArn" ] (fun tag _ ->
      match tag with
      | "PermissionsBoundaryType" ->
          r_permissions_boundary_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundaryType"
                 (fun i _ -> permissions_boundary_attachment_type_of_xml i)
                 ())
      | "PermissionsBoundaryArn" ->
          r_permissions_boundary_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundaryArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     permissions_boundary_type = ( ! ) r_permissions_boundary_type;
     permissions_boundary_arn = ( ! ) r_permissions_boundary_arn;
   }
    : attached_permissions_boundary)

let role_max_session_duration_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let role_description_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let policy_document_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let role_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let role_of_xml i =
  let r_path = ref None in
  let r_role_name = ref None in
  let r_role_id = ref None in
  let r_arn = ref None in
  let r_create_date = ref None in
  let r_assume_role_policy_document = ref None in
  let r_description = ref None in
  let r_max_session_duration = ref None in
  let r_permissions_boundary = ref None in
  let r_tags = ref None in
  let r_role_last_used = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Path";
      "RoleName";
      "RoleId";
      "Arn";
      "CreateDate";
      "AssumeRolePolicyDocument";
      "Description";
      "MaxSessionDuration";
      "PermissionsBoundary";
      "Tags";
      "RoleLastUsed";
    ] (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "RoleId" ->
          r_role_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleId" (fun i _ -> id_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "AssumeRolePolicyDocument" ->
          r_assume_role_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssumeRolePolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> role_description_type_of_xml i)
                 ())
      | "MaxSessionDuration" ->
          r_max_session_duration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSessionDuration"
                 (fun i _ -> role_max_session_duration_type_of_xml i)
                 ())
      | "PermissionsBoundary" ->
          r_permissions_boundary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundary"
                 (fun i _ -> attached_permissions_boundary_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "RoleLastUsed" ->
          r_role_last_used :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleLastUsed"
                 (fun i _ -> role_last_used_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = Smaws_Lib.Xml.Parse.required "Path" (( ! ) r_path) i;
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     role_id = Smaws_Lib.Xml.Parse.required "RoleId" (( ! ) r_role_id) i;
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
     create_date = Smaws_Lib.Xml.Parse.required "CreateDate" (( ! ) r_create_date) i;
     assume_role_policy_document = ( ! ) r_assume_role_policy_document;
     description = ( ! ) r_description;
     max_session_duration = ( ! ) r_max_session_duration;
     permissions_boundary = ( ! ) r_permissions_boundary;
     tags = ( ! ) r_tags;
     role_last_used = ( ! ) r_role_last_used;
   }
    : role)

let update_role_description_response_of_xml i =
  let r_role = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Role" ] (fun tag _ ->
      match tag with
      | "Role" ->
          r_role := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Role" (fun i _ -> role_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ role = ( ! ) r_role } : update_role_description_response)

let update_role_description_request_of_xml i =
  let r_role_name = ref None in
  let r_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "Description" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> role_description_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
   }
    : update_role_description_request)

let update_role_response_of_xml i = ()

let update_role_request_of_xml i =
  let r_role_name = ref None in
  let r_description = ref None in
  let r_max_session_duration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "Description"; "MaxSessionDuration" ]
    (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> role_description_type_of_xml i)
                 ())
      | "MaxSessionDuration" ->
          r_max_session_duration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSessionDuration"
                 (fun i _ -> role_max_session_duration_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     description = ( ! ) r_description;
     max_session_duration = ( ! ) r_max_session_duration;
   }
    : update_role_request)

let thumbprint_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let thumbprint_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> thumbprint_type_of_xml i) ()

let update_open_id_connect_provider_thumbprint_request_of_xml i =
  let r_open_id_connect_provider_arn = ref None in
  let r_thumbprint_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OpenIDConnectProviderArn"; "ThumbprintList" ]
    (fun tag _ ->
      match tag with
      | "OpenIDConnectProviderArn" ->
          r_open_id_connect_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OpenIDConnectProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "ThumbprintList" ->
          r_thumbprint_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ThumbprintList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> thumbprint_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     open_id_connect_provider_arn =
       Smaws_Lib.Xml.Parse.required "OpenIDConnectProviderArn"
         (( ! ) r_open_id_connect_provider_arn)
         i;
     thumbprint_list = Smaws_Lib.Xml.Parse.required "ThumbprintList" (( ! ) r_thumbprint_list) i;
   }
    : update_open_id_connect_provider_thumbprint_request)

let password_policy_violation_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let password_policy_violation_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> password_policy_violation_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : password_policy_violation_exception)

let boolean_object_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let password_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_login_profile_request_of_xml i =
  let r_user_name = ref None in
  let r_password = ref None in
  let r_password_reset_required = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "Password"; "PasswordResetRequired" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "Password" ->
          r_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Password"
                 (fun i _ -> password_type_of_xml i)
                 ())
      | "PasswordResetRequired" ->
          r_password_reset_required :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PasswordResetRequired"
                 (fun i _ -> boolean_object_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     password = ( ! ) r_password;
     password_reset_required = ( ! ) r_password_reset_required;
   }
    : update_login_profile_request)

let group_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_group_request_of_xml i =
  let r_group_name = ref None in
  let r_new_path = ref None in
  let r_new_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "NewPath"; "NewGroupName" ]
    (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "NewPath" ->
          r_new_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NewPath" (fun i _ -> path_type_of_xml i) ())
      | "NewGroupName" ->
          r_new_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewGroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     new_path = ( ! ) r_new_path;
     new_group_name = ( ! ) r_new_group_name;
   }
    : update_group_request)

let notes_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let delegation_request_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_delegation_request_request_of_xml i =
  let r_delegation_request_id = ref None in
  let r_notes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DelegationRequestId"; "Notes" ] (fun tag _ ->
      match tag with
      | "DelegationRequestId" ->
          r_delegation_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DelegationRequestId"
                 (fun i _ -> delegation_request_id_type_of_xml i)
                 ())
      | "Notes" ->
          r_notes :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Notes" (fun i _ -> notes_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delegation_request_id =
       Smaws_Lib.Xml.Parse.required "DelegationRequestId" (( ! ) r_delegation_request_id) i;
     notes = ( ! ) r_notes;
   }
    : update_delegation_request_request)

let malformed_policy_document_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let malformed_policy_document_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> malformed_policy_document_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : malformed_policy_document_exception)

let update_assume_role_policy_request_of_xml i =
  let r_role_name = ref None in
  let r_policy_document = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "PolicyDocument" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "PolicyDocument" ->
          r_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     policy_document = Smaws_Lib.Xml.Parse.required "PolicyDocument" (( ! ) r_policy_document) i;
   }
    : update_assume_role_policy_request)

let password_reuse_prevention_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_password_age_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let boolean_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let minimum_password_length_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let update_account_password_policy_request_of_xml i =
  let r_minimum_password_length = ref None in
  let r_require_symbols = ref None in
  let r_require_numbers = ref None in
  let r_require_uppercase_characters = ref None in
  let r_require_lowercase_characters = ref None in
  let r_allow_users_to_change_password = ref None in
  let r_max_password_age = ref None in
  let r_password_reuse_prevention = ref None in
  let r_hard_expiry = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MinimumPasswordLength";
      "RequireSymbols";
      "RequireNumbers";
      "RequireUppercaseCharacters";
      "RequireLowercaseCharacters";
      "AllowUsersToChangePassword";
      "MaxPasswordAge";
      "PasswordReusePrevention";
      "HardExpiry";
    ] (fun tag _ ->
      match tag with
      | "MinimumPasswordLength" ->
          r_minimum_password_length :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinimumPasswordLength"
                 (fun i _ -> minimum_password_length_type_of_xml i)
                 ())
      | "RequireSymbols" ->
          r_require_symbols :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequireSymbols"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "RequireNumbers" ->
          r_require_numbers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequireNumbers"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "RequireUppercaseCharacters" ->
          r_require_uppercase_characters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequireUppercaseCharacters"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "RequireLowercaseCharacters" ->
          r_require_lowercase_characters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequireLowercaseCharacters"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "AllowUsersToChangePassword" ->
          r_allow_users_to_change_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowUsersToChangePassword"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "MaxPasswordAge" ->
          r_max_password_age :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxPasswordAge"
                 (fun i _ -> max_password_age_type_of_xml i)
                 ())
      | "PasswordReusePrevention" ->
          r_password_reuse_prevention :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PasswordReusePrevention"
                 (fun i _ -> password_reuse_prevention_type_of_xml i)
                 ())
      | "HardExpiry" ->
          r_hard_expiry :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HardExpiry"
                 (fun i _ -> boolean_object_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     minimum_password_length = ( ! ) r_minimum_password_length;
     require_symbols = ( ! ) r_require_symbols;
     require_numbers = ( ! ) r_require_numbers;
     require_uppercase_characters = ( ! ) r_require_uppercase_characters;
     require_lowercase_characters = ( ! ) r_require_lowercase_characters;
     allow_users_to_change_password = ( ! ) r_allow_users_to_change_password;
     max_password_age = ( ! ) r_max_password_age;
     password_reuse_prevention = ( ! ) r_password_reuse_prevention;
     hard_expiry = ( ! ) r_hard_expiry;
   }
    : update_account_password_policy_request)

let access_key_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_access_key_request_of_xml i =
  let r_user_name = ref None in
  let r_access_key_id = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "AccessKeyId"; "Status" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "AccessKeyId" ->
          r_access_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKeyId"
                 (fun i _ -> access_key_id_type_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> status_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     access_key_id = Smaws_Lib.Xml.Parse.required "AccessKeyId" (( ! ) r_access_key_id) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : update_access_key_request)

let tag_key_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_type_of_xml i) ()

let untag_user_request_of_xml i =
  let r_user_name = ref None in
  let r_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "TagKeys" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_key_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
   }
    : untag_user_request)

let untag_server_certificate_request_of_xml i =
  let r_server_certificate_name = ref None in
  let r_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerCertificateName"; "TagKeys" ] (fun tag _ ->
      match tag with
      | "ServerCertificateName" ->
          r_server_certificate_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateName"
                 (fun i _ -> server_certificate_name_type_of_xml i)
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_key_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     server_certificate_name =
       Smaws_Lib.Xml.Parse.required "ServerCertificateName" (( ! ) r_server_certificate_name) i;
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
   }
    : untag_server_certificate_request)

let untag_saml_provider_request_of_xml i =
  let r_saml_provider_arn = ref None in
  let r_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SAMLProviderArn"; "TagKeys" ] (fun tag _ ->
      match tag with
      | "SAMLProviderArn" ->
          r_saml_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_key_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     saml_provider_arn =
       Smaws_Lib.Xml.Parse.required "SAMLProviderArn" (( ! ) r_saml_provider_arn) i;
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
   }
    : untag_saml_provider_request)

let untag_role_request_of_xml i =
  let r_role_name = ref None in
  let r_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "TagKeys" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_key_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
   }
    : untag_role_request)

let untag_policy_request_of_xml i =
  let r_policy_arn = ref None in
  let r_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyArn"; "TagKeys" ] (fun tag _ ->
      match tag with
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_key_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
   }
    : untag_policy_request)

let untag_open_id_connect_provider_request_of_xml i =
  let r_open_id_connect_provider_arn = ref None in
  let r_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OpenIDConnectProviderArn"; "TagKeys" ]
    (fun tag _ ->
      match tag with
      | "OpenIDConnectProviderArn" ->
          r_open_id_connect_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OpenIDConnectProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_key_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     open_id_connect_provider_arn =
       Smaws_Lib.Xml.Parse.required "OpenIDConnectProviderArn"
         (( ! ) r_open_id_connect_provider_arn)
         i;
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
   }
    : untag_open_id_connect_provider_request)

let serial_number_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let untag_mfa_device_request_of_xml i =
  let r_serial_number = ref None in
  let r_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SerialNumber"; "TagKeys" ] (fun tag _ ->
      match tag with
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_key_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serial_number = Smaws_Lib.Xml.Parse.required "SerialNumber" (( ! ) r_serial_number) i;
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
   }
    : untag_mfa_device_request)

let instance_profile_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let untag_instance_profile_request_of_xml i =
  let r_instance_profile_name = ref None in
  let r_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfileName"; "TagKeys" ] (fun tag _ ->
      match tag with
      | "InstanceProfileName" ->
          r_instance_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfileName"
                 (fun i _ -> instance_profile_name_type_of_xml i)
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_key_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profile_name =
       Smaws_Lib.Xml.Parse.required "InstanceProfileName" (( ! ) r_instance_profile_name) i;
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
   }
    : untag_instance_profile_request)

let tag_user_request_of_xml i =
  let r_user_name = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "Tags" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
   }
    : tag_user_request)

let tag_server_certificate_request_of_xml i =
  let r_server_certificate_name = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerCertificateName"; "Tags" ] (fun tag _ ->
      match tag with
      | "ServerCertificateName" ->
          r_server_certificate_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateName"
                 (fun i _ -> server_certificate_name_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     server_certificate_name =
       Smaws_Lib.Xml.Parse.required "ServerCertificateName" (( ! ) r_server_certificate_name) i;
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
   }
    : tag_server_certificate_request)

let tag_saml_provider_request_of_xml i =
  let r_saml_provider_arn = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SAMLProviderArn"; "Tags" ] (fun tag _ ->
      match tag with
      | "SAMLProviderArn" ->
          r_saml_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     saml_provider_arn =
       Smaws_Lib.Xml.Parse.required "SAMLProviderArn" (( ! ) r_saml_provider_arn) i;
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
   }
    : tag_saml_provider_request)

let tag_role_request_of_xml i =
  let r_role_name = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "Tags" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
   }
    : tag_role_request)

let tag_policy_request_of_xml i =
  let r_policy_arn = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyArn"; "Tags" ] (fun tag _ ->
      match tag with
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
   }
    : tag_policy_request)

let tag_open_id_connect_provider_request_of_xml i =
  let r_open_id_connect_provider_arn = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OpenIDConnectProviderArn"; "Tags" ] (fun tag _ ->
      match tag with
      | "OpenIDConnectProviderArn" ->
          r_open_id_connect_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OpenIDConnectProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     open_id_connect_provider_arn =
       Smaws_Lib.Xml.Parse.required "OpenIDConnectProviderArn"
         (( ! ) r_open_id_connect_provider_arn)
         i;
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
   }
    : tag_open_id_connect_provider_request)

let tag_mfa_device_request_of_xml i =
  let r_serial_number = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SerialNumber"; "Tags" ] (fun tag _ ->
      match tag with
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serial_number = Smaws_Lib.Xml.Parse.required "SerialNumber" (( ! ) r_serial_number) i;
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
   }
    : tag_mfa_device_request)

let tag_instance_profile_request_of_xml i =
  let r_instance_profile_name = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfileName"; "Tags" ] (fun tag _ ->
      match tag with
      | "InstanceProfileName" ->
          r_instance_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfileName"
                 (fun i _ -> instance_profile_name_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profile_name =
       Smaws_Lib.Xml.Parse.required "InstanceProfileName" (( ! ) r_instance_profile_name) i;
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
   }
    : tag_instance_profile_request)

let policy_evaluation_error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_evaluation_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> policy_evaluation_error_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : policy_evaluation_exception)

let response_marker_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let permissions_boundary_decision_detail_of_xml i =
  let r_allowed_by_permissions_boundary = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AllowedByPermissionsBoundary" ] (fun tag _ ->
      match tag with
      | "AllowedByPermissionsBoundary" ->
          r_allowed_by_permissions_boundary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedByPermissionsBoundary"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ allowed_by_permissions_boundary = ( ! ) r_allowed_by_permissions_boundary }
    : permissions_boundary_decision_detail)

let policy_evaluation_decision_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "allowed" -> ALLOWED
   | "explicitDeny" -> EXPLICIT_DENY
   | "implicitDeny" -> IMPLICIT_DENY
   | _ -> failwith "unknown enum value"
    : policy_evaluation_decision_type)

let eval_decision_source_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let eval_decision_details_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k =
        Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> eval_decision_source_type_of_xml i) ()
      in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> policy_evaluation_decision_type_of_xml i)
          ()
      in
      (k, v))
    ()

let context_key_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let context_key_names_result_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> context_key_name_type_of_xml i) ()

let column_number_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let line_number_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let position_of_xml i =
  let r_line = ref None in
  let r_column = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Line"; "Column" ] (fun tag _ ->
      match tag with
      | "Line" ->
          r_line :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Line" (fun i _ -> line_number_of_xml i) ())
      | "Column" ->
          r_column :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Column" (fun i _ -> column_number_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ line = ( ! ) r_line; column = ( ! ) r_column } : position)

let policy_source_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "user" -> USER
   | "group" -> GROUP
   | "role" -> ROLE
   | "aws-managed" -> AWS_MANAGED
   | "user-managed" -> USER_MANAGED
   | "resource" -> RESOURCE
   | "none" -> NONE
   | _ -> failwith "unknown enum value"
    : policy_source_type)

let policy_identifier_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let statement_of_xml i =
  let r_source_policy_id = ref None in
  let r_source_policy_type = ref None in
  let r_start_position = ref None in
  let r_end_position = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourcePolicyId"; "SourcePolicyType"; "StartPosition"; "EndPosition" ] (fun tag _ ->
      match tag with
      | "SourcePolicyId" ->
          r_source_policy_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourcePolicyId"
                 (fun i _ -> policy_identifier_type_of_xml i)
                 ())
      | "SourcePolicyType" ->
          r_source_policy_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourcePolicyType"
                 (fun i _ -> policy_source_type_of_xml i)
                 ())
      | "StartPosition" ->
          r_start_position :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartPosition"
                 (fun i _ -> position_of_xml i)
                 ())
      | "EndPosition" ->
          r_end_position :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndPosition" (fun i _ -> position_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_policy_id = ( ! ) r_source_policy_id;
     source_policy_type = ( ! ) r_source_policy_type;
     start_position = ( ! ) r_start_position;
     end_position = ( ! ) r_end_position;
   }
    : statement)

let statement_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> statement_of_xml i) ()

let resource_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_specific_result_of_xml i =
  let r_eval_resource_name = ref None in
  let r_eval_resource_decision = ref None in
  let r_matched_statements = ref None in
  let r_missing_context_values = ref None in
  let r_eval_decision_details = ref None in
  let r_permissions_boundary_decision_detail = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EvalResourceName";
      "EvalResourceDecision";
      "MatchedStatements";
      "MissingContextValues";
      "EvalDecisionDetails";
      "PermissionsBoundaryDecisionDetail";
    ] (fun tag _ ->
      match tag with
      | "EvalResourceName" ->
          r_eval_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvalResourceName"
                 (fun i _ -> resource_name_type_of_xml i)
                 ())
      | "EvalResourceDecision" ->
          r_eval_resource_decision :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvalResourceDecision"
                 (fun i _ -> policy_evaluation_decision_type_of_xml i)
                 ())
      | "MatchedStatements" ->
          r_matched_statements :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MatchedStatements"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> statement_of_xml i) ())
                 ())
      | "MissingContextValues" ->
          r_missing_context_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MissingContextValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> context_key_name_type_of_xml i)
                     ())
                 ())
      | "EvalDecisionDetails" ->
          r_eval_decision_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvalDecisionDetails"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> eval_decision_source_type_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> policy_evaluation_decision_type_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "PermissionsBoundaryDecisionDetail" ->
          r_permissions_boundary_decision_detail :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundaryDecisionDetail"
                 (fun i _ -> permissions_boundary_decision_detail_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     eval_resource_name =
       Smaws_Lib.Xml.Parse.required "EvalResourceName" (( ! ) r_eval_resource_name) i;
     eval_resource_decision =
       Smaws_Lib.Xml.Parse.required "EvalResourceDecision" (( ! ) r_eval_resource_decision) i;
     matched_statements = ( ! ) r_matched_statements;
     missing_context_values = ( ! ) r_missing_context_values;
     eval_decision_details = ( ! ) r_eval_decision_details;
     permissions_boundary_decision_detail = ( ! ) r_permissions_boundary_decision_detail;
   }
    : resource_specific_result)

let resource_specific_result_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_specific_result_of_xml i) ()

let organizations_decision_detail_of_xml i =
  let r_allowed_by_organizations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AllowedByOrganizations" ] (fun tag _ ->
      match tag with
      | "AllowedByOrganizations" ->
          r_allowed_by_organizations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedByOrganizations"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ allowed_by_organizations = ( ! ) r_allowed_by_organizations } : organizations_decision_detail)

let action_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let evaluation_result_of_xml i =
  let r_eval_action_name = ref None in
  let r_eval_resource_name = ref None in
  let r_eval_decision = ref None in
  let r_matched_statements = ref None in
  let r_missing_context_values = ref None in
  let r_organizations_decision_detail = ref None in
  let r_permissions_boundary_decision_detail = ref None in
  let r_eval_decision_details = ref None in
  let r_resource_specific_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EvalActionName";
      "EvalResourceName";
      "EvalDecision";
      "MatchedStatements";
      "MissingContextValues";
      "OrganizationsDecisionDetail";
      "PermissionsBoundaryDecisionDetail";
      "EvalDecisionDetails";
      "ResourceSpecificResults";
    ] (fun tag _ ->
      match tag with
      | "EvalActionName" ->
          r_eval_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvalActionName"
                 (fun i _ -> action_name_type_of_xml i)
                 ())
      | "EvalResourceName" ->
          r_eval_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvalResourceName"
                 (fun i _ -> resource_name_type_of_xml i)
                 ())
      | "EvalDecision" ->
          r_eval_decision :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvalDecision"
                 (fun i _ -> policy_evaluation_decision_type_of_xml i)
                 ())
      | "MatchedStatements" ->
          r_matched_statements :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MatchedStatements"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> statement_of_xml i) ())
                 ())
      | "MissingContextValues" ->
          r_missing_context_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MissingContextValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> context_key_name_type_of_xml i)
                     ())
                 ())
      | "OrganizationsDecisionDetail" ->
          r_organizations_decision_detail :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationsDecisionDetail"
                 (fun i _ -> organizations_decision_detail_of_xml i)
                 ())
      | "PermissionsBoundaryDecisionDetail" ->
          r_permissions_boundary_decision_detail :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundaryDecisionDetail"
                 (fun i _ -> permissions_boundary_decision_detail_of_xml i)
                 ())
      | "EvalDecisionDetails" ->
          r_eval_decision_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvalDecisionDetails"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> eval_decision_source_type_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> policy_evaluation_decision_type_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "ResourceSpecificResults" ->
          r_resource_specific_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceSpecificResults"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_specific_result_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     eval_action_name = Smaws_Lib.Xml.Parse.required "EvalActionName" (( ! ) r_eval_action_name) i;
     eval_resource_name = ( ! ) r_eval_resource_name;
     eval_decision = Smaws_Lib.Xml.Parse.required "EvalDecision" (( ! ) r_eval_decision) i;
     matched_statements = ( ! ) r_matched_statements;
     missing_context_values = ( ! ) r_missing_context_values;
     organizations_decision_detail = ( ! ) r_organizations_decision_detail;
     permissions_boundary_decision_detail = ( ! ) r_permissions_boundary_decision_detail;
     eval_decision_details = ( ! ) r_eval_decision_details;
     resource_specific_results = ( ! ) r_resource_specific_results;
   }
    : evaluation_result)

let evaluation_results_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> evaluation_result_of_xml i) ()

let simulate_policy_response_of_xml i =
  let r_evaluation_results = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EvaluationResults"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "EvaluationResults" ->
          r_evaluation_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EvaluationResults"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> evaluation_result_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     evaluation_results = ( ! ) r_evaluation_results;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : simulate_policy_response)

let marker_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let max_items_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resource_handling_option_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let context_key_type_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "string" -> STRING
   | "stringList" -> STRING_LIST
   | "numeric" -> NUMERIC
   | "numericList" -> NUMERIC_LIST
   | "boolean" -> BOOLEAN
   | "booleanList" -> BOOLEAN_LIST
   | "ip" -> IP
   | "ipList" -> IP_LIST
   | "binary" -> BINARY
   | "binaryList" -> BINARY_LIST
   | "date" -> DATE
   | "dateList" -> DATE_LIST
   | _ -> failwith "unknown enum value"
    : context_key_type_enum)

let context_key_value_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let context_key_value_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> context_key_value_type_of_xml i) ()

let context_entry_of_xml i =
  let r_context_key_name = ref None in
  let r_context_key_values = ref None in
  let r_context_key_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ContextKeyName"; "ContextKeyValues"; "ContextKeyType" ] (fun tag _ ->
      match tag with
      | "ContextKeyName" ->
          r_context_key_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ContextKeyName"
                 (fun i _ -> context_key_name_type_of_xml i)
                 ())
      | "ContextKeyValues" ->
          r_context_key_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ContextKeyValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> context_key_value_type_of_xml i)
                     ())
                 ())
      | "ContextKeyType" ->
          r_context_key_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ContextKeyType"
                 (fun i _ -> context_key_type_enum_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     context_key_name = ( ! ) r_context_key_name;
     context_key_values = ( ! ) r_context_key_values;
     context_key_type = ( ! ) r_context_key_type;
   }
    : context_entry)

let context_entry_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> context_entry_of_xml i) ()

let resource_name_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_name_type_of_xml i) ()

let action_name_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> action_name_type_of_xml i) ()

let simulation_policy_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_document_type_of_xml i) ()

let simulate_principal_policy_request_of_xml i =
  let r_policy_source_arn = ref None in
  let r_policy_input_list = ref None in
  let r_permissions_boundary_policy_input_list = ref None in
  let r_action_names = ref None in
  let r_resource_arns = ref None in
  let r_resource_policy = ref None in
  let r_resource_owner = ref None in
  let r_caller_arn = ref None in
  let r_context_entries = ref None in
  let r_resource_handling_option = ref None in
  let r_max_items = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PolicySourceArn";
      "PolicyInputList";
      "PermissionsBoundaryPolicyInputList";
      "ActionNames";
      "ResourceArns";
      "ResourcePolicy";
      "ResourceOwner";
      "CallerArn";
      "ContextEntries";
      "ResourceHandlingOption";
      "MaxItems";
      "Marker";
    ] (fun tag _ ->
      match tag with
      | "PolicySourceArn" ->
          r_policy_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicySourceArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "PolicyInputList" ->
          r_policy_input_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyInputList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_document_type_of_xml i)
                     ())
                 ())
      | "PermissionsBoundaryPolicyInputList" ->
          r_permissions_boundary_policy_input_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundaryPolicyInputList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_document_type_of_xml i)
                     ())
                 ())
      | "ActionNames" ->
          r_action_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> action_name_type_of_xml i)
                     ())
                 ())
      | "ResourceArns" ->
          r_resource_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_type_of_xml i)
                     ())
                 ())
      | "ResourcePolicy" ->
          r_resource_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcePolicy"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | "ResourceOwner" ->
          r_resource_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceOwner"
                 (fun i _ -> resource_name_type_of_xml i)
                 ())
      | "CallerArn" ->
          r_caller_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CallerArn"
                 (fun i _ -> resource_name_type_of_xml i)
                 ())
      | "ContextEntries" ->
          r_context_entries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ContextEntries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> context_entry_of_xml i)
                     ())
                 ())
      | "ResourceHandlingOption" ->
          r_resource_handling_option :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceHandlingOption"
                 (fun i _ -> resource_handling_option_type_of_xml i)
                 ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_source_arn =
       Smaws_Lib.Xml.Parse.required "PolicySourceArn" (( ! ) r_policy_source_arn) i;
     policy_input_list = ( ! ) r_policy_input_list;
     permissions_boundary_policy_input_list = ( ! ) r_permissions_boundary_policy_input_list;
     action_names = Smaws_Lib.Xml.Parse.required "ActionNames" (( ! ) r_action_names) i;
     resource_arns = ( ! ) r_resource_arns;
     resource_policy = ( ! ) r_resource_policy;
     resource_owner = ( ! ) r_resource_owner;
     caller_arn = ( ! ) r_caller_arn;
     context_entries = ( ! ) r_context_entries;
     resource_handling_option = ( ! ) r_resource_handling_option;
     max_items = ( ! ) r_max_items;
     marker = ( ! ) r_marker;
   }
    : simulate_principal_policy_request)

let simulate_custom_policy_request_of_xml i =
  let r_policy_input_list = ref None in
  let r_permissions_boundary_policy_input_list = ref None in
  let r_action_names = ref None in
  let r_resource_arns = ref None in
  let r_resource_policy = ref None in
  let r_resource_owner = ref None in
  let r_caller_arn = ref None in
  let r_context_entries = ref None in
  let r_resource_handling_option = ref None in
  let r_max_items = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PolicyInputList";
      "PermissionsBoundaryPolicyInputList";
      "ActionNames";
      "ResourceArns";
      "ResourcePolicy";
      "ResourceOwner";
      "CallerArn";
      "ContextEntries";
      "ResourceHandlingOption";
      "MaxItems";
      "Marker";
    ] (fun tag _ ->
      match tag with
      | "PolicyInputList" ->
          r_policy_input_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyInputList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_document_type_of_xml i)
                     ())
                 ())
      | "PermissionsBoundaryPolicyInputList" ->
          r_permissions_boundary_policy_input_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundaryPolicyInputList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_document_type_of_xml i)
                     ())
                 ())
      | "ActionNames" ->
          r_action_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> action_name_type_of_xml i)
                     ())
                 ())
      | "ResourceArns" ->
          r_resource_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_name_type_of_xml i)
                     ())
                 ())
      | "ResourcePolicy" ->
          r_resource_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcePolicy"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | "ResourceOwner" ->
          r_resource_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceOwner"
                 (fun i _ -> resource_name_type_of_xml i)
                 ())
      | "CallerArn" ->
          r_caller_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CallerArn"
                 (fun i _ -> resource_name_type_of_xml i)
                 ())
      | "ContextEntries" ->
          r_context_entries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ContextEntries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> context_entry_of_xml i)
                     ())
                 ())
      | "ResourceHandlingOption" ->
          r_resource_handling_option :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceHandlingOption"
                 (fun i _ -> resource_handling_option_type_of_xml i)
                 ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_input_list =
       Smaws_Lib.Xml.Parse.required "PolicyInputList" (( ! ) r_policy_input_list) i;
     permissions_boundary_policy_input_list = ( ! ) r_permissions_boundary_policy_input_list;
     action_names = Smaws_Lib.Xml.Parse.required "ActionNames" (( ! ) r_action_names) i;
     resource_arns = ( ! ) r_resource_arns;
     resource_policy = ( ! ) r_resource_policy;
     resource_owner = ( ! ) r_resource_owner;
     caller_arn = ( ! ) r_caller_arn;
     context_entries = ( ! ) r_context_entries;
     resource_handling_option = ( ! ) r_resource_handling_option;
     max_items = ( ! ) r_max_items;
     marker = ( ! ) r_marker;
   }
    : simulate_custom_policy_request)

let global_endpoint_token_version_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "v1Token" -> V1Token | "v2Token" -> V2Token | _ -> failwith "unknown enum value"
    : global_endpoint_token_version)

let set_security_token_service_preferences_request_of_xml i =
  let r_global_endpoint_token_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalEndpointTokenVersion" ] (fun tag _ ->
      match tag with
      | "GlobalEndpointTokenVersion" ->
          r_global_endpoint_token_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalEndpointTokenVersion"
                 (fun i _ -> global_endpoint_token_version_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_endpoint_token_version =
       Smaws_Lib.Xml.Parse.required "GlobalEndpointTokenVersion"
         (( ! ) r_global_endpoint_token_version)
         i;
   }
    : set_security_token_service_preferences_request)

let policy_version_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let set_default_policy_version_request_of_xml i =
  let r_policy_arn = ref None in
  let r_version_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyArn"; "VersionId" ] (fun tag _ ->
      match tag with
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> policy_version_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
     version_id = Smaws_Lib.Xml.Parse.required "VersionId" (( ! ) r_version_id) i;
   }
    : set_default_policy_version_request)

let send_delegation_token_request_of_xml i =
  let r_delegation_request_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DelegationRequestId" ] (fun tag _ ->
      match tag with
      | "DelegationRequestId" ->
          r_delegation_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DelegationRequestId"
                 (fun i _ -> delegation_request_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delegation_request_id =
       Smaws_Lib.Xml.Parse.required "DelegationRequestId" (( ! ) r_delegation_request_id) i;
   }
    : send_delegation_token_request)

let invalid_authentication_code_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let invalid_authentication_code_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> invalid_authentication_code_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_authentication_code_exception)

let authentication_code_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resync_mfa_device_request_of_xml i =
  let r_user_name = ref None in
  let r_serial_number = ref None in
  let r_authentication_code1 = ref None in
  let r_authentication_code2 = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UserName"; "SerialNumber"; "AuthenticationCode1"; "AuthenticationCode2" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | "AuthenticationCode1" ->
          r_authentication_code1 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationCode1"
                 (fun i _ -> authentication_code_type_of_xml i)
                 ())
      | "AuthenticationCode2" ->
          r_authentication_code2 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationCode2"
                 (fun i _ -> authentication_code_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     serial_number = Smaws_Lib.Xml.Parse.required "SerialNumber" (( ! ) r_serial_number) i;
     authentication_code1 =
       Smaws_Lib.Xml.Parse.required "AuthenticationCode1" (( ! ) r_authentication_code1) i;
     authentication_code2 =
       Smaws_Lib.Xml.Parse.required "AuthenticationCode2" (( ! ) r_authentication_code2) i;
   }
    : resync_mfa_device_request)

let service_credential_secret_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let service_credential_alias_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let service_password_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let service_user_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let service_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let service_specific_credential_of_xml i =
  let r_create_date = ref None in
  let r_expiration_date = ref None in
  let r_service_name = ref None in
  let r_service_user_name = ref None in
  let r_service_password = ref None in
  let r_service_credential_alias = ref None in
  let r_service_credential_secret = ref None in
  let r_service_specific_credential_id = ref None in
  let r_user_name = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CreateDate";
      "ExpirationDate";
      "ServiceName";
      "ServiceUserName";
      "ServicePassword";
      "ServiceCredentialAlias";
      "ServiceCredentialSecret";
      "ServiceSpecificCredentialId";
      "UserName";
      "Status";
    ] (fun tag _ ->
      match tag with
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "ExpirationDate" ->
          r_expiration_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpirationDate"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "ServiceName" ->
          r_service_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceName"
                 (fun i _ -> service_name_of_xml i)
                 ())
      | "ServiceUserName" ->
          r_service_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUserName"
                 (fun i _ -> service_user_name_of_xml i)
                 ())
      | "ServicePassword" ->
          r_service_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServicePassword"
                 (fun i _ -> service_password_of_xml i)
                 ())
      | "ServiceCredentialAlias" ->
          r_service_credential_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceCredentialAlias"
                 (fun i _ -> service_credential_alias_of_xml i)
                 ())
      | "ServiceCredentialSecret" ->
          r_service_credential_secret :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceCredentialSecret"
                 (fun i _ -> service_credential_secret_of_xml i)
                 ())
      | "ServiceSpecificCredentialId" ->
          r_service_specific_credential_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceSpecificCredentialId"
                 (fun i _ -> service_specific_credential_id_of_xml i)
                 ())
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> status_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     create_date = Smaws_Lib.Xml.Parse.required "CreateDate" (( ! ) r_create_date) i;
     expiration_date = ( ! ) r_expiration_date;
     service_name = Smaws_Lib.Xml.Parse.required "ServiceName" (( ! ) r_service_name) i;
     service_user_name = ( ! ) r_service_user_name;
     service_password = ( ! ) r_service_password;
     service_credential_alias = ( ! ) r_service_credential_alias;
     service_credential_secret = ( ! ) r_service_credential_secret;
     service_specific_credential_id =
       Smaws_Lib.Xml.Parse.required "ServiceSpecificCredentialId"
         (( ! ) r_service_specific_credential_id)
         i;
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : service_specific_credential)

let reset_service_specific_credential_response_of_xml i =
  let r_service_specific_credential = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServiceSpecificCredential" ] (fun tag _ ->
      match tag with
      | "ServiceSpecificCredential" ->
          r_service_specific_credential :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceSpecificCredential"
                 (fun i _ -> service_specific_credential_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ service_specific_credential = ( ! ) r_service_specific_credential }
    : reset_service_specific_credential_response)

let reset_service_specific_credential_request_of_xml i =
  let r_user_name = ref None in
  let r_service_specific_credential_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "ServiceSpecificCredentialId" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "ServiceSpecificCredentialId" ->
          r_service_specific_credential_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceSpecificCredentialId"
                 (fun i _ -> service_specific_credential_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     service_specific_credential_id =
       Smaws_Lib.Xml.Parse.required "ServiceSpecificCredentialId"
         (( ! ) r_service_specific_credential_id)
         i;
   }
    : reset_service_specific_credential_request)

let remove_user_from_group_request_of_xml i =
  let r_group_name = ref None in
  let r_user_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "UserName" ] (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
   }
    : remove_user_from_group_request)

let remove_role_from_instance_profile_request_of_xml i =
  let r_instance_profile_name = ref None in
  let r_role_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfileName"; "RoleName" ] (fun tag _ ->
      match tag with
      | "InstanceProfileName" ->
          r_instance_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfileName"
                 (fun i _ -> instance_profile_name_type_of_xml i)
                 ())
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profile_name =
       Smaws_Lib.Xml.Parse.required "InstanceProfileName" (( ! ) r_instance_profile_name) i;
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
   }
    : remove_role_from_instance_profile_request)

let client_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let remove_client_id_from_open_id_connect_provider_request_of_xml i =
  let r_open_id_connect_provider_arn = ref None in
  let r_client_i_d = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OpenIDConnectProviderArn"; "ClientID" ]
    (fun tag _ ->
      match tag with
      | "OpenIDConnectProviderArn" ->
          r_open_id_connect_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OpenIDConnectProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "ClientID" ->
          r_client_i_d :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientID"
                 (fun i _ -> client_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     open_id_connect_provider_arn =
       Smaws_Lib.Xml.Parse.required "OpenIDConnectProviderArn"
         (( ! ) r_open_id_connect_provider_arn)
         i;
     client_i_d = Smaws_Lib.Xml.Parse.required "ClientID" (( ! ) r_client_i_d) i;
   }
    : remove_client_id_from_open_id_connect_provider_request)

let reject_delegation_request_request_of_xml i =
  let r_delegation_request_id = ref None in
  let r_notes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DelegationRequestId"; "Notes" ] (fun tag _ ->
      match tag with
      | "DelegationRequestId" ->
          r_delegation_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DelegationRequestId"
                 (fun i _ -> delegation_request_id_type_of_xml i)
                 ())
      | "Notes" ->
          r_notes :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Notes" (fun i _ -> notes_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delegation_request_id =
       Smaws_Lib.Xml.Parse.required "DelegationRequestId" (( ! ) r_delegation_request_id) i;
     notes = ( ! ) r_notes;
   }
    : reject_delegation_request_request)

let policy_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let put_user_policy_request_of_xml i =
  let r_user_name = ref None in
  let r_policy_name = ref None in
  let r_policy_document = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "PolicyName"; "PolicyDocument" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "PolicyDocument" ->
          r_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     policy_document = Smaws_Lib.Xml.Parse.required "PolicyDocument" (( ! ) r_policy_document) i;
   }
    : put_user_policy_request)

let policy_not_attachable_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_not_attachable_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> policy_not_attachable_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : policy_not_attachable_exception)

let put_user_permissions_boundary_request_of_xml i =
  let r_user_name = ref None in
  let r_permissions_boundary = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "PermissionsBoundary" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "PermissionsBoundary" ->
          r_permissions_boundary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundary"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     permissions_boundary =
       Smaws_Lib.Xml.Parse.required "PermissionsBoundary" (( ! ) r_permissions_boundary) i;
   }
    : put_user_permissions_boundary_request)

let put_role_policy_request_of_xml i =
  let r_role_name = ref None in
  let r_policy_name = ref None in
  let r_policy_document = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "PolicyName"; "PolicyDocument" ]
    (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "PolicyDocument" ->
          r_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     policy_document = Smaws_Lib.Xml.Parse.required "PolicyDocument" (( ! ) r_policy_document) i;
   }
    : put_role_policy_request)

let put_role_permissions_boundary_request_of_xml i =
  let r_role_name = ref None in
  let r_permissions_boundary = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "PermissionsBoundary" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "PermissionsBoundary" ->
          r_permissions_boundary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundary"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     permissions_boundary =
       Smaws_Lib.Xml.Parse.required "PermissionsBoundary" (( ! ) r_permissions_boundary) i;
   }
    : put_role_permissions_boundary_request)

let put_group_policy_request_of_xml i =
  let r_group_name = ref None in
  let r_policy_name = ref None in
  let r_policy_document = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "PolicyName"; "PolicyDocument" ]
    (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "PolicyDocument" ->
          r_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     policy_document = Smaws_Lib.Xml.Parse.required "PolicyDocument" (( ! ) r_policy_document) i;
   }
    : put_group_policy_request)

let user_of_xml i =
  let r_path = ref None in
  let r_user_name = ref None in
  let r_user_id = ref None in
  let r_arn = ref None in
  let r_create_date = ref None in
  let r_password_last_used = ref None in
  let r_permissions_boundary = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Path";
      "UserName";
      "UserId";
      "Arn";
      "CreateDate";
      "PasswordLastUsed";
      "PermissionsBoundary";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "UserId" ->
          r_user_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UserId" (fun i _ -> id_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "PasswordLastUsed" ->
          r_password_last_used :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PasswordLastUsed"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "PermissionsBoundary" ->
          r_permissions_boundary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundary"
                 (fun i _ -> attached_permissions_boundary_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = Smaws_Lib.Xml.Parse.required "Path" (( ! ) r_path) i;
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     user_id = Smaws_Lib.Xml.Parse.required "UserId" (( ! ) r_user_id) i;
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
     create_date = Smaws_Lib.Xml.Parse.required "CreateDate" (( ! ) r_create_date) i;
     password_last_used = ( ! ) r_password_last_used;
     permissions_boundary = ( ! ) r_permissions_boundary;
     tags = ( ! ) r_tags;
   }
    : user)

let bootstrap_datum_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.blob_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let virtual_mfa_device_of_xml i =
  let r_serial_number = ref None in
  let r_base32_string_seed = ref None in
  let r_qr_code_pn_g = ref None in
  let r_user = ref None in
  let r_enable_date = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SerialNumber"; "Base32StringSeed"; "QRCodePNG"; "User"; "EnableDate"; "Tags" ] (fun tag _ ->
      match tag with
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | "Base32StringSeed" ->
          r_base32_string_seed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Base32StringSeed"
                 (fun i _ -> bootstrap_datum_of_xml i)
                 ())
      | "QRCodePNG" ->
          r_qr_code_pn_g :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QRCodePNG"
                 (fun i _ -> bootstrap_datum_of_xml i)
                 ())
      | "User" ->
          r_user := Some (Smaws_Lib.Xml.Parse.Read.sequence i "User" (fun i _ -> user_of_xml i) ())
      | "EnableDate" ->
          r_enable_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableDate" (fun i _ -> date_type_of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serial_number = Smaws_Lib.Xml.Parse.required "SerialNumber" (( ! ) r_serial_number) i;
     base32_string_seed = ( ! ) r_base32_string_seed;
     qr_code_pn_g = ( ! ) r_qr_code_pn_g;
     user = ( ! ) r_user;
     enable_date = ( ! ) r_enable_date;
     tags = ( ! ) r_tags;
   }
    : virtual_mfa_device)

let virtual_mfa_device_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> virtual_mfa_device_of_xml i) ()

let list_virtual_mfa_devices_response_of_xml i =
  let r_virtual_mfa_devices = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VirtualMFADevices"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "VirtualMFADevices" ->
          r_virtual_mfa_devices :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VirtualMFADevices"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> virtual_mfa_device_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     virtual_mfa_devices =
       Smaws_Lib.Xml.Parse.required "VirtualMFADevices" (( ! ) r_virtual_mfa_devices) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_virtual_mfa_devices_response)

let assignment_status_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Assigned" -> Assigned
   | "Unassigned" -> Unassigned
   | "Any" -> Any
   | _ -> failwith "unknown enum value"
    : assignment_status_type)

let list_virtual_mfa_devices_request_of_xml i =
  let r_assignment_status = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AssignmentStatus"; "Marker"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "AssignmentStatus" ->
          r_assignment_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssignmentStatus"
                 (fun i _ -> assignment_status_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     assignment_status = ( ! ) r_assignment_status;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_virtual_mfa_devices_request)

let list_user_tags_response_of_xml i =
  let r_tags = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_user_tags_response)

let list_user_tags_request_of_xml i =
  let r_user_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_user_tags_request)

let user_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_of_xml i) ()

let list_users_response_of_xml i =
  let r_users = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Users"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Users" ->
          r_users :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Users"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     users = Smaws_Lib.Xml.Parse.required "Users" (( ! ) r_users) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_users_response)

let path_prefix_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let list_users_request_of_xml i =
  let r_path_prefix = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PathPrefix"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "PathPrefix" ->
          r_path_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PathPrefix"
                 (fun i _ -> path_prefix_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ path_prefix = ( ! ) r_path_prefix; marker = ( ! ) r_marker; max_items = ( ! ) r_max_items }
    : list_users_request)

let policy_name_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_name_type_of_xml i) ()

let list_user_policies_response_of_xml i =
  let r_policy_names = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyNames"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_name_type_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_names = Smaws_Lib.Xml.Parse.required "PolicyNames" (( ! ) r_policy_names) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_user_policies_response)

let list_user_policies_request_of_xml i =
  let r_user_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_user_policies_request)

let ssh_public_key_metadata_of_xml i =
  let r_user_name = ref None in
  let r_ssh_public_key_id = ref None in
  let r_status = ref None in
  let r_upload_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UserName"; "SSHPublicKeyId"; "Status"; "UploadDate" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "SSHPublicKeyId" ->
          r_ssh_public_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSHPublicKeyId"
                 (fun i _ -> public_key_id_type_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> status_type_of_xml i) ())
      | "UploadDate" ->
          r_upload_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UploadDate" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     ssh_public_key_id = Smaws_Lib.Xml.Parse.required "SSHPublicKeyId" (( ! ) r_ssh_public_key_id) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     upload_date = Smaws_Lib.Xml.Parse.required "UploadDate" (( ! ) r_upload_date) i;
   }
    : ssh_public_key_metadata)

let ssh_public_key_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> ssh_public_key_metadata_of_xml i) ()

let list_ssh_public_keys_response_of_xml i =
  let r_ssh_public_keys = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SSHPublicKeys"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "SSHPublicKeys" ->
          r_ssh_public_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSHPublicKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> ssh_public_key_metadata_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     ssh_public_keys = ( ! ) r_ssh_public_keys;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_ssh_public_keys_response)

let list_ssh_public_keys_request_of_xml i =
  let r_user_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = ( ! ) r_user_name; marker = ( ! ) r_marker; max_items = ( ! ) r_max_items }
    : list_ssh_public_keys_request)

let certificate_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> signing_certificate_of_xml i) ()

let list_signing_certificates_response_of_xml i =
  let r_certificates = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Certificates"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "Certificates" ->
          r_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Certificates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> signing_certificate_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     certificates = Smaws_Lib.Xml.Parse.required "Certificates" (( ! ) r_certificates) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_signing_certificates_response)

let list_signing_certificates_request_of_xml i =
  let r_user_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = ( ! ) r_user_name; marker = ( ! ) r_marker; max_items = ( ! ) r_max_items }
    : list_signing_certificates_request)

let service_not_supported_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let service_not_supported_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> service_not_supported_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : service_not_supported_exception)

let service_specific_credential_metadata_of_xml i =
  let r_user_name = ref None in
  let r_status = ref None in
  let r_service_user_name = ref None in
  let r_service_credential_alias = ref None in
  let r_create_date = ref None in
  let r_expiration_date = ref None in
  let r_service_specific_credential_id = ref None in
  let r_service_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "UserName";
      "Status";
      "ServiceUserName";
      "ServiceCredentialAlias";
      "CreateDate";
      "ExpirationDate";
      "ServiceSpecificCredentialId";
      "ServiceName";
    ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> status_type_of_xml i) ())
      | "ServiceUserName" ->
          r_service_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUserName"
                 (fun i _ -> service_user_name_of_xml i)
                 ())
      | "ServiceCredentialAlias" ->
          r_service_credential_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceCredentialAlias"
                 (fun i _ -> service_credential_alias_of_xml i)
                 ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "ExpirationDate" ->
          r_expiration_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpirationDate"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "ServiceSpecificCredentialId" ->
          r_service_specific_credential_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceSpecificCredentialId"
                 (fun i _ -> service_specific_credential_id_of_xml i)
                 ())
      | "ServiceName" ->
          r_service_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceName"
                 (fun i _ -> service_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     service_user_name = ( ! ) r_service_user_name;
     service_credential_alias = ( ! ) r_service_credential_alias;
     create_date = Smaws_Lib.Xml.Parse.required "CreateDate" (( ! ) r_create_date) i;
     expiration_date = ( ! ) r_expiration_date;
     service_specific_credential_id =
       Smaws_Lib.Xml.Parse.required "ServiceSpecificCredentialId"
         (( ! ) r_service_specific_credential_id)
         i;
     service_name = Smaws_Lib.Xml.Parse.required "ServiceName" (( ! ) r_service_name) i;
   }
    : service_specific_credential_metadata)

let service_specific_credentials_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> service_specific_credential_metadata_of_xml i)
    ()

let list_service_specific_credentials_response_of_xml i =
  let r_service_specific_credentials = ref None in
  let r_marker = ref None in
  let r_is_truncated = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ServiceSpecificCredentials"; "Marker"; "IsTruncated" ] (fun tag _ ->
      match tag with
      | "ServiceSpecificCredentials" ->
          r_service_specific_credentials :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceSpecificCredentials"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> service_specific_credential_metadata_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     service_specific_credentials = ( ! ) r_service_specific_credentials;
     marker = ( ! ) r_marker;
     is_truncated = ( ! ) r_is_truncated;
   }
    : list_service_specific_credentials_response)

let all_users_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_service_specific_credentials_request_of_xml i =
  let r_user_name = ref None in
  let r_service_name = ref None in
  let r_all_users = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UserName"; "ServiceName"; "AllUsers"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "ServiceName" ->
          r_service_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceName"
                 (fun i _ -> service_name_of_xml i)
                 ())
      | "AllUsers" ->
          r_all_users :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AllUsers" (fun i _ -> all_users_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     service_name = ( ! ) r_service_name;
     all_users = ( ! ) r_all_users;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_service_specific_credentials_request)

let list_server_certificate_tags_response_of_xml i =
  let r_tags = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_server_certificate_tags_response)

let list_server_certificate_tags_request_of_xml i =
  let r_server_certificate_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerCertificateName"; "Marker"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "ServerCertificateName" ->
          r_server_certificate_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateName"
                 (fun i _ -> server_certificate_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     server_certificate_name =
       Smaws_Lib.Xml.Parse.required "ServerCertificateName" (( ! ) r_server_certificate_name) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_server_certificate_tags_request)

let server_certificate_metadata_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> server_certificate_metadata_of_xml i) ()

let list_server_certificates_response_of_xml i =
  let r_server_certificate_metadata_list = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ServerCertificateMetadataList"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "ServerCertificateMetadataList" ->
          r_server_certificate_metadata_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateMetadataList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> server_certificate_metadata_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     server_certificate_metadata_list =
       Smaws_Lib.Xml.Parse.required "ServerCertificateMetadataList"
         (( ! ) r_server_certificate_metadata_list)
         i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_server_certificates_response)

let list_server_certificates_request_of_xml i =
  let r_path_prefix = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PathPrefix"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "PathPrefix" ->
          r_path_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PathPrefix"
                 (fun i _ -> path_prefix_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ path_prefix = ( ! ) r_path_prefix; marker = ( ! ) r_marker; max_items = ( ! ) r_max_items }
    : list_server_certificates_request)

let list_saml_provider_tags_response_of_xml i =
  let r_tags = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_saml_provider_tags_response)

let list_saml_provider_tags_request_of_xml i =
  let r_saml_provider_arn = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SAMLProviderArn"; "Marker"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "SAMLProviderArn" ->
          r_saml_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     saml_provider_arn =
       Smaws_Lib.Xml.Parse.required "SAMLProviderArn" (( ! ) r_saml_provider_arn) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_saml_provider_tags_request)

let saml_provider_list_entry_of_xml i =
  let r_arn = ref None in
  let r_valid_until = ref None in
  let r_create_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Arn"; "ValidUntil"; "CreateDate" ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "ValidUntil" ->
          r_valid_until :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidUntil" (fun i _ -> date_type_of_xml i) ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ arn = ( ! ) r_arn; valid_until = ( ! ) r_valid_until; create_date = ( ! ) r_create_date }
    : saml_provider_list_entry)

let saml_provider_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> saml_provider_list_entry_of_xml i) ()

let list_saml_providers_response_of_xml i =
  let r_saml_provider_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SAMLProviderList" ] (fun tag _ ->
      match tag with
      | "SAMLProviderList" ->
          r_saml_provider_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLProviderList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> saml_provider_list_entry_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ saml_provider_list = ( ! ) r_saml_provider_list } : list_saml_providers_response)

let list_saml_providers_request_of_xml i = ()

let list_role_tags_response_of_xml i =
  let r_tags = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_role_tags_response)

let list_role_tags_request_of_xml i =
  let r_role_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_role_tags_request)

let role_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> role_of_xml i) ()

let list_roles_response_of_xml i =
  let r_roles = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Roles"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Roles" ->
          r_roles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Roles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> role_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     roles = Smaws_Lib.Xml.Parse.required "Roles" (( ! ) r_roles) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_roles_response)

let list_roles_request_of_xml i =
  let r_path_prefix = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PathPrefix"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "PathPrefix" ->
          r_path_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PathPrefix"
                 (fun i _ -> path_prefix_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ path_prefix = ( ! ) r_path_prefix; marker = ( ! ) r_marker; max_items = ( ! ) r_max_items }
    : list_roles_request)

let list_role_policies_response_of_xml i =
  let r_policy_names = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyNames"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_name_type_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_names = Smaws_Lib.Xml.Parse.required "PolicyNames" (( ! ) r_policy_names) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_role_policies_response)

let list_role_policies_request_of_xml i =
  let r_role_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_role_policies_request)

let policy_version_of_xml i =
  let r_document = ref None in
  let r_version_id = ref None in
  let r_is_default_version = ref None in
  let r_create_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Document"; "VersionId"; "IsDefaultVersion"; "CreateDate" ] (fun tag _ ->
      match tag with
      | "Document" ->
          r_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Document"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> policy_version_id_type_of_xml i)
                 ())
      | "IsDefaultVersion" ->
          r_is_default_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsDefaultVersion"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     document = ( ! ) r_document;
     version_id = ( ! ) r_version_id;
     is_default_version = ( ! ) r_is_default_version;
     create_date = ( ! ) r_create_date;
   }
    : policy_version)

let policy_document_version_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_version_of_xml i) ()

let list_policy_versions_response_of_xml i =
  let r_versions = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Versions"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Versions" ->
          r_versions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Versions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_version_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ versions = ( ! ) r_versions; is_truncated = ( ! ) r_is_truncated; marker = ( ! ) r_marker }
    : list_policy_versions_response)

let list_policy_versions_request_of_xml i =
  let r_policy_arn = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyArn"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_policy_versions_request)

let list_policy_tags_response_of_xml i =
  let r_tags = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_policy_tags_response)

let list_policy_tags_request_of_xml i =
  let r_policy_arn = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyArn"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_policy_tags_request)

let entity_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_owner_entity_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "USER" -> USER
   | "ROLE" -> ROLE
   | "GROUP" -> GROUP
   | _ -> failwith "unknown enum value"
    : policy_owner_entity_type)

let policy_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "INLINE" -> INLINE | "MANAGED" -> MANAGED | _ -> failwith "unknown enum value"
    : policy_type)

let policy_granting_service_access_of_xml i =
  let r_policy_name = ref None in
  let r_policy_type = ref None in
  let r_policy_arn = ref None in
  let r_entity_type = ref None in
  let r_entity_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PolicyName"; "PolicyType"; "PolicyArn"; "EntityType"; "EntityName" ] (fun tag _ ->
      match tag with
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "PolicyType" ->
          r_policy_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyType"
                 (fun i _ -> policy_type_of_xml i)
                 ())
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | "EntityType" ->
          r_entity_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EntityType"
                 (fun i _ -> policy_owner_entity_type_of_xml i)
                 ())
      | "EntityName" ->
          r_entity_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EntityName"
                 (fun i _ -> entity_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     policy_type = Smaws_Lib.Xml.Parse.required "PolicyType" (( ! ) r_policy_type) i;
     policy_arn = ( ! ) r_policy_arn;
     entity_type = ( ! ) r_entity_type;
     entity_name = ( ! ) r_entity_name;
   }
    : policy_granting_service_access)

let policy_granting_service_access_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> policy_granting_service_access_of_xml i)
    ()

let service_namespace_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let list_policies_granting_service_access_entry_of_xml i =
  let r_service_namespace = ref None in
  let r_policies = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServiceNamespace"; "Policies" ] (fun tag _ ->
      match tag with
      | "ServiceNamespace" ->
          r_service_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceNamespace"
                 (fun i _ -> service_namespace_type_of_xml i)
                 ())
      | "Policies" ->
          r_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Policies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_granting_service_access_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ service_namespace = ( ! ) r_service_namespace; policies = ( ! ) r_policies }
    : list_policies_granting_service_access_entry)

let list_policy_granting_service_access_response_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> list_policies_granting_service_access_entry_of_xml i)
    ()

let list_policies_granting_service_access_response_of_xml i =
  let r_policies_granting_service_access = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PoliciesGrantingServiceAccess"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "PoliciesGrantingServiceAccess" ->
          r_policies_granting_service_access :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PoliciesGrantingServiceAccess"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> list_policies_granting_service_access_entry_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policies_granting_service_access =
       Smaws_Lib.Xml.Parse.required "PoliciesGrantingServiceAccess"
         (( ! ) r_policies_granting_service_access)
         i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_policies_granting_service_access_response)

let service_namespace_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> service_namespace_type_of_xml i) ()

let list_policies_granting_service_access_request_of_xml i =
  let r_marker = ref None in
  let r_arn = ref None in
  let r_service_namespaces = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "Arn"; "ServiceNamespaces" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "ServiceNamespaces" ->
          r_service_namespaces :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceNamespaces"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> service_namespace_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
     service_namespaces =
       Smaws_Lib.Xml.Parse.required "ServiceNamespaces" (( ! ) r_service_namespaces) i;
   }
    : list_policies_granting_service_access_request)

let policy_description_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let attachment_count_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let policy_path_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_of_xml i =
  let r_policy_name = ref None in
  let r_policy_id = ref None in
  let r_arn = ref None in
  let r_path = ref None in
  let r_default_version_id = ref None in
  let r_attachment_count = ref None in
  let r_permissions_boundary_usage_count = ref None in
  let r_is_attachable = ref None in
  let r_description = ref None in
  let r_create_date = ref None in
  let r_update_date = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PolicyName";
      "PolicyId";
      "Arn";
      "Path";
      "DefaultVersionId";
      "AttachmentCount";
      "PermissionsBoundaryUsageCount";
      "IsAttachable";
      "Description";
      "CreateDate";
      "UpdateDate";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "PolicyId" ->
          r_policy_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyId" (fun i _ -> id_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "Path" ->
          r_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> policy_path_type_of_xml i) ())
      | "DefaultVersionId" ->
          r_default_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultVersionId"
                 (fun i _ -> policy_version_id_type_of_xml i)
                 ())
      | "AttachmentCount" ->
          r_attachment_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttachmentCount"
                 (fun i _ -> attachment_count_type_of_xml i)
                 ())
      | "PermissionsBoundaryUsageCount" ->
          r_permissions_boundary_usage_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundaryUsageCount"
                 (fun i _ -> attachment_count_type_of_xml i)
                 ())
      | "IsAttachable" ->
          r_is_attachable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsAttachable"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> policy_description_type_of_xml i)
                 ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "UpdateDate" ->
          r_update_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateDate" (fun i _ -> date_type_of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_name = ( ! ) r_policy_name;
     policy_id = ( ! ) r_policy_id;
     arn = ( ! ) r_arn;
     path = ( ! ) r_path;
     default_version_id = ( ! ) r_default_version_id;
     attachment_count = ( ! ) r_attachment_count;
     permissions_boundary_usage_count = ( ! ) r_permissions_boundary_usage_count;
     is_attachable = ( ! ) r_is_attachable;
     description = ( ! ) r_description;
     create_date = ( ! ) r_create_date;
     update_date = ( ! ) r_update_date;
     tags = ( ! ) r_tags;
   }
    : policy)

let policy_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_of_xml i) ()

let list_policies_response_of_xml i =
  let r_policies = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Policies"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Policies" ->
          r_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Policies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policies = ( ! ) r_policies; is_truncated = ( ! ) r_is_truncated; marker = ( ! ) r_marker }
    : list_policies_response)

let policy_usage_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PermissionsPolicy" -> PermissionsPolicy
   | "PermissionsBoundary" -> PermissionsBoundary
   | _ -> failwith "unknown enum value"
    : policy_usage_type)

let policy_scope_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "All" -> All
   | "AWS" -> AWS
   | "Local" -> Local
   | _ -> failwith "unknown enum value"
    : policy_scope_type)

let list_policies_request_of_xml i =
  let r_scope = ref None in
  let r_only_attached = ref None in
  let r_path_prefix = ref None in
  let r_policy_usage_filter = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Scope"; "OnlyAttached"; "PathPrefix"; "PolicyUsageFilter"; "Marker"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "Scope" ->
          r_scope :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Scope"
                 (fun i _ -> policy_scope_type_of_xml i)
                 ())
      | "OnlyAttached" ->
          r_only_attached :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnlyAttached"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "PathPrefix" ->
          r_path_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PathPrefix"
                 (fun i _ -> policy_path_type_of_xml i)
                 ())
      | "PolicyUsageFilter" ->
          r_policy_usage_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyUsageFilter"
                 (fun i _ -> policy_usage_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scope = ( ! ) r_scope;
     only_attached = ( ! ) r_only_attached;
     path_prefix = ( ! ) r_path_prefix;
     policy_usage_filter = ( ! ) r_policy_usage_filter;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_policies_request)

let exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let service_access_not_enabled_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : service_access_not_enabled_exception)

let organization_not_in_all_features_mode_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : organization_not_in_all_features_mode_exception)

let organization_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : organization_not_found_exception)

let account_not_management_or_delegated_administrator_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : account_not_management_or_delegated_administrator_exception)

let feature_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "RootCredentialsManagement" -> ROOT_CREDENTIALS_MANAGEMENT
   | "RootSessions" -> ROOT_SESSIONS
   | _ -> failwith "unknown enum value"
    : feature_type)

let features_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> feature_type_of_xml i) ()

let organization_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let list_organizations_features_response_of_xml i =
  let r_organization_id = ref None in
  let r_enabled_features = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OrganizationId"; "EnabledFeatures" ] (fun tag _ ->
      match tag with
      | "OrganizationId" ->
          r_organization_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationId"
                 (fun i _ -> organization_id_type_of_xml i)
                 ())
      | "EnabledFeatures" ->
          r_enabled_features :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnabledFeatures"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> feature_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ organization_id = ( ! ) r_organization_id; enabled_features = ( ! ) r_enabled_features }
    : list_organizations_features_response)

let list_organizations_features_request_of_xml i = ()

let list_open_id_connect_provider_tags_response_of_xml i =
  let r_tags = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_open_id_connect_provider_tags_response)

let list_open_id_connect_provider_tags_request_of_xml i =
  let r_open_id_connect_provider_arn = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OpenIDConnectProviderArn"; "Marker"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "OpenIDConnectProviderArn" ->
          r_open_id_connect_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OpenIDConnectProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     open_id_connect_provider_arn =
       Smaws_Lib.Xml.Parse.required "OpenIDConnectProviderArn"
         (( ! ) r_open_id_connect_provider_arn)
         i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_open_id_connect_provider_tags_request)

let open_id_connect_provider_list_entry_of_xml i =
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Arn" ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ arn = ( ! ) r_arn } : open_id_connect_provider_list_entry)

let open_id_connect_provider_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> open_id_connect_provider_list_entry_of_xml i)
    ()

let list_open_id_connect_providers_response_of_xml i =
  let r_open_id_connect_provider_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OpenIDConnectProviderList" ] (fun tag _ ->
      match tag with
      | "OpenIDConnectProviderList" ->
          r_open_id_connect_provider_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OpenIDConnectProviderList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> open_id_connect_provider_list_entry_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ open_id_connect_provider_list = ( ! ) r_open_id_connect_provider_list }
    : list_open_id_connect_providers_response)

let list_open_id_connect_providers_request_of_xml i = ()

let list_mfa_device_tags_response_of_xml i =
  let r_tags = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_mfa_device_tags_response)

let list_mfa_device_tags_request_of_xml i =
  let r_serial_number = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SerialNumber"; "Marker"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serial_number = Smaws_Lib.Xml.Parse.required "SerialNumber" (( ! ) r_serial_number) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_mfa_device_tags_request)

let mfa_device_of_xml i =
  let r_user_name = ref None in
  let r_serial_number = ref None in
  let r_enable_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "SerialNumber"; "EnableDate" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | "EnableDate" ->
          r_enable_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableDate" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     serial_number = Smaws_Lib.Xml.Parse.required "SerialNumber" (( ! ) r_serial_number) i;
     enable_date = Smaws_Lib.Xml.Parse.required "EnableDate" (( ! ) r_enable_date) i;
   }
    : mfa_device)

let mfa_device_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> mfa_device_of_xml i) ()

let list_mfa_devices_response_of_xml i =
  let r_mfa_devices = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MFADevices"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "MFADevices" ->
          r_mfa_devices :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MFADevices"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> mfa_device_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     mfa_devices = Smaws_Lib.Xml.Parse.required "MFADevices" (( ! ) r_mfa_devices) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_mfa_devices_response)

let list_mfa_devices_request_of_xml i =
  let r_user_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = ( ! ) r_user_name; marker = ( ! ) r_marker; max_items = ( ! ) r_max_items }
    : list_mfa_devices_request)

let list_instance_profile_tags_response_of_xml i =
  let r_tags = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_instance_profile_tags_response)

let list_instance_profile_tags_request_of_xml i =
  let r_instance_profile_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfileName"; "Marker"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "InstanceProfileName" ->
          r_instance_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfileName"
                 (fun i _ -> instance_profile_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profile_name =
       Smaws_Lib.Xml.Parse.required "InstanceProfileName" (( ! ) r_instance_profile_name) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_instance_profile_tags_request)

let instance_profile_of_xml i =
  let r_path = ref None in
  let r_instance_profile_name = ref None in
  let r_instance_profile_id = ref None in
  let r_arn = ref None in
  let r_create_date = ref None in
  let r_roles = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Path"; "InstanceProfileName"; "InstanceProfileId"; "Arn"; "CreateDate"; "Roles"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "InstanceProfileName" ->
          r_instance_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfileName"
                 (fun i _ -> instance_profile_name_type_of_xml i)
                 ())
      | "InstanceProfileId" ->
          r_instance_profile_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfileId"
                 (fun i _ -> id_type_of_xml i)
                 ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "Roles" ->
          r_roles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Roles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> role_of_xml i) ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = Smaws_Lib.Xml.Parse.required "Path" (( ! ) r_path) i;
     instance_profile_name =
       Smaws_Lib.Xml.Parse.required "InstanceProfileName" (( ! ) r_instance_profile_name) i;
     instance_profile_id =
       Smaws_Lib.Xml.Parse.required "InstanceProfileId" (( ! ) r_instance_profile_id) i;
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
     create_date = Smaws_Lib.Xml.Parse.required "CreateDate" (( ! ) r_create_date) i;
     roles = Smaws_Lib.Xml.Parse.required "Roles" (( ! ) r_roles) i;
     tags = ( ! ) r_tags;
   }
    : instance_profile)

let instance_profile_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_profile_of_xml i) ()

let list_instance_profiles_for_role_response_of_xml i =
  let r_instance_profiles = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfiles"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "InstanceProfiles" ->
          r_instance_profiles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfiles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instance_profile_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profiles =
       Smaws_Lib.Xml.Parse.required "InstanceProfiles" (( ! ) r_instance_profiles) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_instance_profiles_for_role_response)

let list_instance_profiles_for_role_request_of_xml i =
  let r_role_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_instance_profiles_for_role_request)

let list_instance_profiles_response_of_xml i =
  let r_instance_profiles = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfiles"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "InstanceProfiles" ->
          r_instance_profiles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfiles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instance_profile_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profiles =
       Smaws_Lib.Xml.Parse.required "InstanceProfiles" (( ! ) r_instance_profiles) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_instance_profiles_response)

let list_instance_profiles_request_of_xml i =
  let r_path_prefix = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PathPrefix"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "PathPrefix" ->
          r_path_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PathPrefix"
                 (fun i _ -> path_prefix_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ path_prefix = ( ! ) r_path_prefix; marker = ( ! ) r_marker; max_items = ( ! ) r_max_items }
    : list_instance_profiles_request)

let group_of_xml i =
  let r_path = ref None in
  let r_group_name = ref None in
  let r_group_id = ref None in
  let r_arn = ref None in
  let r_create_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Path"; "GroupName"; "GroupId"; "Arn"; "CreateDate" ] (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "GroupId" ->
          r_group_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "GroupId" (fun i _ -> id_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = Smaws_Lib.Xml.Parse.required "Path" (( ! ) r_path) i;
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     group_id = Smaws_Lib.Xml.Parse.required "GroupId" (( ! ) r_group_id) i;
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
     create_date = Smaws_Lib.Xml.Parse.required "CreateDate" (( ! ) r_create_date) i;
   }
    : group)

let group_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> group_of_xml i) ()

let list_groups_for_user_response_of_xml i =
  let r_groups = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Groups"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Groups" ->
          r_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Groups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> group_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     groups = Smaws_Lib.Xml.Parse.required "Groups" (( ! ) r_groups) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_groups_for_user_response)

let list_groups_for_user_request_of_xml i =
  let r_user_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_groups_for_user_request)

let list_groups_response_of_xml i =
  let r_groups = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Groups"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "Groups" ->
          r_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Groups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> group_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     groups = Smaws_Lib.Xml.Parse.required "Groups" (( ! ) r_groups) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_groups_response)

let list_groups_request_of_xml i =
  let r_path_prefix = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PathPrefix"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "PathPrefix" ->
          r_path_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PathPrefix"
                 (fun i _ -> path_prefix_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ path_prefix = ( ! ) r_path_prefix; marker = ( ! ) r_marker; max_items = ( ! ) r_max_items }
    : list_groups_request)

let list_group_policies_response_of_xml i =
  let r_policy_names = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyNames"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_name_type_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_names = Smaws_Lib.Xml.Parse.required "PolicyNames" (( ! ) r_policy_names) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_group_policies_response)

let list_group_policies_request_of_xml i =
  let r_group_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_group_policies_request)

let policy_role_of_xml i =
  let r_role_name = ref None in
  let r_role_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "RoleId" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "RoleId" ->
          r_role_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleId" (fun i _ -> id_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ role_name = ( ! ) r_role_name; role_id = ( ! ) r_role_id } : policy_role)

let policy_role_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_role_of_xml i) ()

let policy_user_of_xml i =
  let r_user_name = ref None in
  let r_user_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "UserId" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "UserId" ->
          r_user_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UserId" (fun i _ -> id_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = ( ! ) r_user_name; user_id = ( ! ) r_user_id } : policy_user)

let policy_user_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_user_of_xml i) ()

let policy_group_of_xml i =
  let r_group_name = ref None in
  let r_group_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "GroupId" ] (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "GroupId" ->
          r_group_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "GroupId" (fun i _ -> id_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ group_name = ( ! ) r_group_name; group_id = ( ! ) r_group_id } : policy_group)

let policy_group_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_group_of_xml i) ()

let list_entities_for_policy_response_of_xml i =
  let r_policy_groups = ref None in
  let r_policy_users = ref None in
  let r_policy_roles = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PolicyGroups"; "PolicyUsers"; "PolicyRoles"; "IsTruncated"; "Marker" ] (fun tag _ ->
      match tag with
      | "PolicyGroups" ->
          r_policy_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_group_of_xml i)
                     ())
                 ())
      | "PolicyUsers" ->
          r_policy_users :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyUsers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_user_of_xml i)
                     ())
                 ())
      | "PolicyRoles" ->
          r_policy_roles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyRoles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_role_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_groups = ( ! ) r_policy_groups;
     policy_users = ( ! ) r_policy_users;
     policy_roles = ( ! ) r_policy_roles;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_entities_for_policy_response)

let entity_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "User" -> User
   | "Role" -> Role
   | "Group" -> Group
   | "LocalManagedPolicy" -> LocalManagedPolicy
   | "AWSManagedPolicy" -> AWSManagedPolicy
   | _ -> failwith "unknown enum value"
    : entity_type)

let list_entities_for_policy_request_of_xml i =
  let r_policy_arn = ref None in
  let r_entity_filter = ref None in
  let r_path_prefix = ref None in
  let r_policy_usage_filter = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PolicyArn"; "EntityFilter"; "PathPrefix"; "PolicyUsageFilter"; "Marker"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | "EntityFilter" ->
          r_entity_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EntityFilter"
                 (fun i _ -> entity_type_of_xml i)
                 ())
      | "PathPrefix" ->
          r_path_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PathPrefix" (fun i _ -> path_type_of_xml i) ())
      | "PolicyUsageFilter" ->
          r_policy_usage_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyUsageFilter"
                 (fun i _ -> policy_usage_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
     entity_filter = ( ! ) r_entity_filter;
     path_prefix = ( ! ) r_path_prefix;
     policy_usage_filter = ( ! ) r_policy_usage_filter;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_entities_for_policy_request)

let redirect_url_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let session_duration_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let requestor_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let account_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let state_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "UNASSIGNED" -> UNASSIGNED
   | "ASSIGNED" -> ASSIGNED
   | "PENDING_APPROVAL" -> PENDING_APPROVAL
   | "FINALIZED" -> FINALIZED
   | "ACCEPTED" -> ACCEPTED
   | "REJECTED" -> REJECTED
   | "EXPIRED" -> EXPIRED
   | _ -> failwith "unknown enum value"
    : state_type)

let owner_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let role_permission_restriction_arn_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> arn_type_of_xml i) ()

let permission_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_parameter_type_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "string" -> STRING
   | "stringList" -> STRING_LIST
   | _ -> failwith "unknown enum value"
    : policy_parameter_type_enum)

let policy_parameter_value_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_parameter_values_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_parameter_value_type_of_xml i) ()

let policy_parameter_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_parameter_of_xml i =
  let r_name = ref None in
  let r_values = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Values"; "Type" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> policy_parameter_name_type_of_xml i)
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_parameter_value_type_of_xml i)
                     ())
                 ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> policy_parameter_type_enum_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; values = ( ! ) r_values; type_ = ( ! ) r_type_ } : policy_parameter)

let policy_parameter_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_parameter_of_xml i) ()

let delegation_permission_of_xml i =
  let r_policy_template_arn = ref None in
  let r_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyTemplateArn"; "Parameters" ] (fun tag _ ->
      match tag with
      | "PolicyTemplateArn" ->
          r_policy_template_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyTemplateArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_parameter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_template_arn = ( ! ) r_policy_template_arn; parameters = ( ! ) r_parameters }
    : delegation_permission)

let request_message_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let delegation_request_description_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let delegation_request_of_xml i =
  let r_delegation_request_id = ref None in
  let r_owner_account_id = ref None in
  let r_description = ref None in
  let r_request_message = ref None in
  let r_permissions = ref None in
  let r_permission_policy = ref None in
  let r_role_permission_restriction_arns = ref None in
  let r_owner_id = ref None in
  let r_approver_id = ref None in
  let r_state = ref None in
  let r_expiration_time = ref None in
  let r_requestor_id = ref None in
  let r_requestor_name = ref None in
  let r_create_date = ref None in
  let r_session_duration = ref None in
  let r_redirect_url = ref None in
  let r_notes = ref None in
  let r_rejection_reason = ref None in
  let r_only_send_by_owner = ref None in
  let r_updated_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DelegationRequestId";
      "OwnerAccountId";
      "Description";
      "RequestMessage";
      "Permissions";
      "PermissionPolicy";
      "RolePermissionRestrictionArns";
      "OwnerId";
      "ApproverId";
      "State";
      "ExpirationTime";
      "RequestorId";
      "RequestorName";
      "CreateDate";
      "SessionDuration";
      "RedirectUrl";
      "Notes";
      "RejectionReason";
      "OnlySendByOwner";
      "UpdatedTime";
    ] (fun tag _ ->
      match tag with
      | "DelegationRequestId" ->
          r_delegation_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DelegationRequestId"
                 (fun i _ -> delegation_request_id_type_of_xml i)
                 ())
      | "OwnerAccountId" ->
          r_owner_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerAccountId"
                 (fun i _ -> account_id_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> delegation_request_description_type_of_xml i)
                 ())
      | "RequestMessage" ->
          r_request_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestMessage"
                 (fun i _ -> request_message_type_of_xml i)
                 ())
      | "Permissions" ->
          r_permissions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Permissions"
                 (fun i _ -> delegation_permission_of_xml i)
                 ())
      | "PermissionPolicy" ->
          r_permission_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionPolicy"
                 (fun i _ -> permission_type_of_xml i)
                 ())
      | "RolePermissionRestrictionArns" ->
          r_role_permission_restriction_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RolePermissionRestrictionArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> arn_type_of_xml i) ())
                 ())
      | "OwnerId" ->
          r_owner_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerId" (fun i _ -> owner_id_type_of_xml i) ())
      | "ApproverId" ->
          r_approver_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApproverId" (fun i _ -> arn_type_of_xml i) ())
      | "State" ->
          r_state :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "State" (fun i _ -> state_type_of_xml i) ())
      | "ExpirationTime" ->
          r_expiration_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpirationTime"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "RequestorId" ->
          r_requestor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestorId"
                 (fun i _ -> account_id_type_of_xml i)
                 ())
      | "RequestorName" ->
          r_requestor_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestorName"
                 (fun i _ -> requestor_name_type_of_xml i)
                 ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "SessionDuration" ->
          r_session_duration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SessionDuration"
                 (fun i _ -> session_duration_type_of_xml i)
                 ())
      | "RedirectUrl" ->
          r_redirect_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedirectUrl"
                 (fun i _ -> redirect_url_type_of_xml i)
                 ())
      | "Notes" ->
          r_notes :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Notes" (fun i _ -> notes_type_of_xml i) ())
      | "RejectionReason" ->
          r_rejection_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RejectionReason"
                 (fun i _ -> notes_type_of_xml i)
                 ())
      | "OnlySendByOwner" ->
          r_only_send_by_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnlySendByOwner"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "UpdatedTime" ->
          r_updated_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdatedTime" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delegation_request_id = ( ! ) r_delegation_request_id;
     owner_account_id = ( ! ) r_owner_account_id;
     description = ( ! ) r_description;
     request_message = ( ! ) r_request_message;
     permissions = ( ! ) r_permissions;
     permission_policy = ( ! ) r_permission_policy;
     role_permission_restriction_arns = ( ! ) r_role_permission_restriction_arns;
     owner_id = ( ! ) r_owner_id;
     approver_id = ( ! ) r_approver_id;
     state = ( ! ) r_state;
     expiration_time = ( ! ) r_expiration_time;
     requestor_id = ( ! ) r_requestor_id;
     requestor_name = ( ! ) r_requestor_name;
     create_date = ( ! ) r_create_date;
     session_duration = ( ! ) r_session_duration;
     redirect_url = ( ! ) r_redirect_url;
     notes = ( ! ) r_notes;
     rejection_reason = ( ! ) r_rejection_reason;
     only_send_by_owner = ( ! ) r_only_send_by_owner;
     updated_time = ( ! ) r_updated_time;
   }
    : delegation_request)

let delegation_requests_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> delegation_request_of_xml i) ()

let list_delegation_requests_response_of_xml i =
  let r_delegation_requests = ref None in
  let r_marker = ref None in
  let r_is_truncated = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DelegationRequests"; "Marker"; "isTruncated" ]
    (fun tag _ ->
      match tag with
      | "DelegationRequests" ->
          r_delegation_requests :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DelegationRequests"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> delegation_request_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "isTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "isTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delegation_requests = ( ! ) r_delegation_requests;
     marker = ( ! ) r_marker;
     is_truncated = ( ! ) r_is_truncated;
   }
    : list_delegation_requests_response)

let list_delegation_requests_request_of_xml i =
  let r_owner_id = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OwnerId"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "OwnerId" ->
          r_owner_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerId" (fun i _ -> owner_id_type_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ owner_id = ( ! ) r_owner_id; marker = ( ! ) r_marker; max_items = ( ! ) r_max_items }
    : list_delegation_requests_request)

let attached_policy_of_xml i =
  let r_policy_name = ref None in
  let r_policy_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyName"; "PolicyArn" ] (fun tag _ ->
      match tag with
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_name = ( ! ) r_policy_name; policy_arn = ( ! ) r_policy_arn } : attached_policy)

let attached_policies_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> attached_policy_of_xml i) ()

let list_attached_user_policies_response_of_xml i =
  let r_attached_policies = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AttachedPolicies"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "AttachedPolicies" ->
          r_attached_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttachedPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> attached_policy_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attached_policies = ( ! ) r_attached_policies;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_attached_user_policies_response)

let list_attached_user_policies_request_of_xml i =
  let r_user_name = ref None in
  let r_path_prefix = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "PathPrefix"; "Marker"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "PathPrefix" ->
          r_path_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PathPrefix"
                 (fun i _ -> policy_path_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     path_prefix = ( ! ) r_path_prefix;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_attached_user_policies_request)

let list_attached_role_policies_response_of_xml i =
  let r_attached_policies = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AttachedPolicies"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "AttachedPolicies" ->
          r_attached_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttachedPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> attached_policy_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attached_policies = ( ! ) r_attached_policies;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_attached_role_policies_response)

let list_attached_role_policies_request_of_xml i =
  let r_role_name = ref None in
  let r_path_prefix = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "PathPrefix"; "Marker"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "PathPrefix" ->
          r_path_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PathPrefix"
                 (fun i _ -> policy_path_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     path_prefix = ( ! ) r_path_prefix;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_attached_role_policies_request)

let list_attached_group_policies_response_of_xml i =
  let r_attached_policies = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AttachedPolicies"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "AttachedPolicies" ->
          r_attached_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttachedPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> attached_policy_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attached_policies = ( ! ) r_attached_policies;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_attached_group_policies_response)

let list_attached_group_policies_request_of_xml i =
  let r_group_name = ref None in
  let r_path_prefix = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "PathPrefix"; "Marker"; "MaxItems" ]
    (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "PathPrefix" ->
          r_path_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PathPrefix"
                 (fun i _ -> policy_path_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     path_prefix = ( ! ) r_path_prefix;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : list_attached_group_policies_request)

let account_alias_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let account_alias_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_alias_type_of_xml i) ()

let list_account_aliases_response_of_xml i =
  let r_account_aliases = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccountAliases"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "AccountAliases" ->
          r_account_aliases :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountAliases"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> account_alias_type_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     account_aliases = Smaws_Lib.Xml.Parse.required "AccountAliases" (( ! ) r_account_aliases) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_account_aliases_response)

let list_account_aliases_request_of_xml i =
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; max_items = ( ! ) r_max_items } : list_account_aliases_request)

let access_key_metadata_of_xml i =
  let r_user_name = ref None in
  let r_access_key_id = ref None in
  let r_status = ref None in
  let r_create_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "AccessKeyId"; "Status"; "CreateDate" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "AccessKeyId" ->
          r_access_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKeyId"
                 (fun i _ -> access_key_id_type_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> status_type_of_xml i) ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     access_key_id = ( ! ) r_access_key_id;
     status = ( ! ) r_status;
     create_date = ( ! ) r_create_date;
   }
    : access_key_metadata)

let access_key_metadata_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> access_key_metadata_of_xml i) ()

let list_access_keys_response_of_xml i =
  let r_access_key_metadata = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccessKeyMetadata"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "AccessKeyMetadata" ->
          r_access_key_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKeyMetadata"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> access_key_metadata_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     access_key_metadata =
       Smaws_Lib.Xml.Parse.required "AccessKeyMetadata" (( ! ) r_access_key_metadata) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : list_access_keys_response)

let list_access_keys_request_of_xml i =
  let r_user_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = ( ! ) r_user_name; marker = ( ! ) r_marker; max_items = ( ! ) r_max_items }
    : list_access_keys_request)

let get_user_policy_response_of_xml i =
  let r_user_name = ref None in
  let r_policy_name = ref None in
  let r_policy_document = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "PolicyName"; "PolicyDocument" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "PolicyDocument" ->
          r_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     policy_document = Smaws_Lib.Xml.Parse.required "PolicyDocument" (( ! ) r_policy_document) i;
   }
    : get_user_policy_response)

let get_user_policy_request_of_xml i =
  let r_user_name = ref None in
  let r_policy_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "PolicyName" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
   }
    : get_user_policy_request)

let get_user_response_of_xml i =
  let r_user = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "User" ] (fun tag _ ->
      match tag with
      | "User" ->
          r_user := Some (Smaws_Lib.Xml.Parse.Read.sequence i "User" (fun i _ -> user_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user = Smaws_Lib.Xml.Parse.required "User" (( ! ) r_user) i } : get_user_response)

let get_user_request_of_xml i =
  let r_user_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = ( ! ) r_user_name } : get_user_request)

let get_ssh_public_key_response_of_xml i =
  let r_ssh_public_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SSHPublicKey" ] (fun tag _ ->
      match tag with
      | "SSHPublicKey" ->
          r_ssh_public_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSHPublicKey"
                 (fun i _ -> ssh_public_key_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ ssh_public_key = ( ! ) r_ssh_public_key } : get_ssh_public_key_response)

let encoding_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "SSH" -> SSH | "PEM" -> PEM | _ -> failwith "unknown enum value" : encoding_type)

let get_ssh_public_key_request_of_xml i =
  let r_user_name = ref None in
  let r_ssh_public_key_id = ref None in
  let r_encoding = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "SSHPublicKeyId"; "Encoding" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "SSHPublicKeyId" ->
          r_ssh_public_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSHPublicKeyId"
                 (fun i _ -> public_key_id_type_of_xml i)
                 ())
      | "Encoding" ->
          r_encoding :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Encoding"
                 (fun i _ -> encoding_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     ssh_public_key_id = Smaws_Lib.Xml.Parse.required "SSHPublicKeyId" (( ! ) r_ssh_public_key_id) i;
     encoding = Smaws_Lib.Xml.Parse.required "Encoding" (( ! ) r_encoding) i;
   }
    : get_ssh_public_key_request)

let arn_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> arn_type_of_xml i) ()

let region_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let role_usage_type_of_xml i =
  let r_region = ref None in
  let r_resources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Region"; "Resources" ] (fun tag _ ->
      match tag with
      | "Region" ->
          r_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Region"
                 (fun i _ -> region_name_type_of_xml i)
                 ())
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> arn_type_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ region = ( ! ) r_region; resources = ( ! ) r_resources } : role_usage_type)

let role_usage_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> role_usage_type_of_xml i) ()

let reason_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let deletion_task_failure_reason_type_of_xml i =
  let r_reason = ref None in
  let r_role_usage_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Reason"; "RoleUsageList" ] (fun tag _ ->
      match tag with
      | "Reason" ->
          r_reason :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Reason" (fun i _ -> reason_type_of_xml i) ())
      | "RoleUsageList" ->
          r_role_usage_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleUsageList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> role_usage_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ reason = ( ! ) r_reason; role_usage_list = ( ! ) r_role_usage_list }
    : deletion_task_failure_reason_type)

let deletion_task_status_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SUCCEEDED" -> SUCCEEDED
   | "IN_PROGRESS" -> IN_PROGRESS
   | "FAILED" -> FAILED
   | "NOT_STARTED" -> NOT_STARTED
   | _ -> failwith "unknown enum value"
    : deletion_task_status_type)

let get_service_linked_role_deletion_status_response_of_xml i =
  let r_status = ref None in
  let r_reason = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "Reason" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> deletion_task_status_type_of_xml i)
                 ())
      | "Reason" ->
          r_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Reason"
                 (fun i _ -> deletion_task_failure_reason_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i; reason = ( ! ) r_reason }
    : get_service_linked_role_deletion_status_response)

let deletion_task_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_service_linked_role_deletion_status_request_of_xml i =
  let r_deletion_task_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DeletionTaskId" ] (fun tag _ ->
      match tag with
      | "DeletionTaskId" ->
          r_deletion_task_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionTaskId"
                 (fun i _ -> deletion_task_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ deletion_task_id = Smaws_Lib.Xml.Parse.required "DeletionTaskId" (( ! ) r_deletion_task_id) i }
    : get_service_linked_role_deletion_status_request)

let error_details_of_xml i =
  let r_message = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "Code" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string_type_of_xml i) ())
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> string_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i;
     code = Smaws_Lib.Xml.Parse.required "Code" (( ! ) r_code) i;
   }
    : error_details)

let entity_info_of_xml i =
  let r_arn = ref None in
  let r_name = ref None in
  let r_type_ = ref None in
  let r_id = ref None in
  let r_path = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Arn"; "Name"; "Type"; "Id"; "Path" ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> user_name_type_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> policy_owner_entity_type_of_xml i)
                 ())
      | "Id" ->
          r_id := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> id_type_of_xml i) ())
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     type_ = Smaws_Lib.Xml.Parse.required "Type" (( ! ) r_type_) i;
     id = Smaws_Lib.Xml.Parse.required "Id" (( ! ) r_id) i;
     path = ( ! ) r_path;
   }
    : entity_info)

let entity_details_of_xml i =
  let r_entity_info = ref None in
  let r_last_authenticated = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EntityInfo"; "LastAuthenticated" ] (fun tag _ ->
      match tag with
      | "EntityInfo" ->
          r_entity_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EntityInfo"
                 (fun i _ -> entity_info_of_xml i)
                 ())
      | "LastAuthenticated" ->
          r_last_authenticated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastAuthenticated"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     entity_info = Smaws_Lib.Xml.Parse.required "EntityInfo" (( ! ) r_entity_info) i;
     last_authenticated = ( ! ) r_last_authenticated;
   }
    : entity_details)

let entity_details_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> entity_details_of_xml i) ()

let job_status_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "IN_PROGRESS" -> IN_PROGRESS
   | "COMPLETED" -> COMPLETED
   | "FAILED" -> FAILED
   | _ -> failwith "unknown enum value"
    : job_status_type)

let get_service_last_accessed_details_with_entities_response_of_xml i =
  let r_job_status = ref None in
  let r_job_creation_date = ref None in
  let r_job_completion_date = ref None in
  let r_entity_details_list = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  let r_error = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "JobStatus";
      "JobCreationDate";
      "JobCompletionDate";
      "EntityDetailsList";
      "IsTruncated";
      "Marker";
      "Error";
    ] (fun tag _ ->
      match tag with
      | "JobStatus" ->
          r_job_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JobStatus"
                 (fun i _ -> job_status_type_of_xml i)
                 ())
      | "JobCreationDate" ->
          r_job_creation_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JobCreationDate"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "JobCompletionDate" ->
          r_job_completion_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JobCompletionDate"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "EntityDetailsList" ->
          r_entity_details_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EntityDetailsList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> entity_details_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | "Error" ->
          r_error :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Error" (fun i _ -> error_details_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     job_status = Smaws_Lib.Xml.Parse.required "JobStatus" (( ! ) r_job_status) i;
     job_creation_date =
       Smaws_Lib.Xml.Parse.required "JobCreationDate" (( ! ) r_job_creation_date) i;
     job_completion_date =
       Smaws_Lib.Xml.Parse.required "JobCompletionDate" (( ! ) r_job_completion_date) i;
     entity_details_list =
       Smaws_Lib.Xml.Parse.required "EntityDetailsList" (( ! ) r_entity_details_list) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
     error = ( ! ) r_error;
   }
    : get_service_last_accessed_details_with_entities_response)

let job_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_service_last_accessed_details_with_entities_request_of_xml i =
  let r_job_id = ref None in
  let r_service_namespace = ref None in
  let r_max_items = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "JobId"; "ServiceNamespace"; "MaxItems"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "JobId" ->
          r_job_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "JobId" (fun i _ -> job_id_type_of_xml i) ())
      | "ServiceNamespace" ->
          r_service_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceNamespace"
                 (fun i _ -> service_namespace_type_of_xml i)
                 ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     job_id = Smaws_Lib.Xml.Parse.required "JobId" (( ! ) r_job_id) i;
     service_namespace =
       Smaws_Lib.Xml.Parse.required "ServiceNamespace" (( ! ) r_service_namespace) i;
     max_items = ( ! ) r_max_items;
     marker = ( ! ) r_marker;
   }
    : get_service_last_accessed_details_with_entities_request)

let tracked_action_last_accessed_of_xml i =
  let r_action_name = ref None in
  let r_last_accessed_entity = ref None in
  let r_last_accessed_time = ref None in
  let r_last_accessed_region = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ActionName"; "LastAccessedEntity"; "LastAccessedTime"; "LastAccessedRegion" ] (fun tag _ ->
      match tag with
      | "ActionName" ->
          r_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionName"
                 (fun i _ -> string_type_of_xml i)
                 ())
      | "LastAccessedEntity" ->
          r_last_accessed_entity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastAccessedEntity"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "LastAccessedTime" ->
          r_last_accessed_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastAccessedTime"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "LastAccessedRegion" ->
          r_last_accessed_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastAccessedRegion"
                 (fun i _ -> string_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     action_name = ( ! ) r_action_name;
     last_accessed_entity = ( ! ) r_last_accessed_entity;
     last_accessed_time = ( ! ) r_last_accessed_time;
     last_accessed_region = ( ! ) r_last_accessed_region;
   }
    : tracked_action_last_accessed)

let tracked_actions_last_accessed_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> tracked_action_last_accessed_of_xml i)
    ()

let integer_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let service_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let service_last_accessed_of_xml i =
  let r_service_name = ref None in
  let r_last_authenticated = ref None in
  let r_service_namespace = ref None in
  let r_last_authenticated_entity = ref None in
  let r_last_authenticated_region = ref None in
  let r_total_authenticated_entities = ref None in
  let r_tracked_actions_last_accessed = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ServiceName";
      "LastAuthenticated";
      "ServiceNamespace";
      "LastAuthenticatedEntity";
      "LastAuthenticatedRegion";
      "TotalAuthenticatedEntities";
      "TrackedActionsLastAccessed";
    ] (fun tag _ ->
      match tag with
      | "ServiceName" ->
          r_service_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceName"
                 (fun i _ -> service_name_type_of_xml i)
                 ())
      | "LastAuthenticated" ->
          r_last_authenticated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastAuthenticated"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "ServiceNamespace" ->
          r_service_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceNamespace"
                 (fun i _ -> service_namespace_type_of_xml i)
                 ())
      | "LastAuthenticatedEntity" ->
          r_last_authenticated_entity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastAuthenticatedEntity"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "LastAuthenticatedRegion" ->
          r_last_authenticated_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastAuthenticatedRegion"
                 (fun i _ -> string_type_of_xml i)
                 ())
      | "TotalAuthenticatedEntities" ->
          r_total_authenticated_entities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalAuthenticatedEntities"
                 (fun i _ -> integer_type_of_xml i)
                 ())
      | "TrackedActionsLastAccessed" ->
          r_tracked_actions_last_accessed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrackedActionsLastAccessed"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tracked_action_last_accessed_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     service_name = Smaws_Lib.Xml.Parse.required "ServiceName" (( ! ) r_service_name) i;
     last_authenticated = ( ! ) r_last_authenticated;
     service_namespace =
       Smaws_Lib.Xml.Parse.required "ServiceNamespace" (( ! ) r_service_namespace) i;
     last_authenticated_entity = ( ! ) r_last_authenticated_entity;
     last_authenticated_region = ( ! ) r_last_authenticated_region;
     total_authenticated_entities = ( ! ) r_total_authenticated_entities;
     tracked_actions_last_accessed = ( ! ) r_tracked_actions_last_accessed;
   }
    : service_last_accessed)

let services_last_accessed_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> service_last_accessed_of_xml i) ()

let access_advisor_usage_granularity_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SERVICE_LEVEL" -> SERVICE_LEVEL
   | "ACTION_LEVEL" -> ACTION_LEVEL
   | _ -> failwith "unknown enum value"
    : access_advisor_usage_granularity_type)

let get_service_last_accessed_details_response_of_xml i =
  let r_job_status = ref None in
  let r_job_type = ref None in
  let r_job_creation_date = ref None in
  let r_services_last_accessed = ref None in
  let r_job_completion_date = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  let r_error = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "JobStatus";
      "JobType";
      "JobCreationDate";
      "ServicesLastAccessed";
      "JobCompletionDate";
      "IsTruncated";
      "Marker";
      "Error";
    ] (fun tag _ ->
      match tag with
      | "JobStatus" ->
          r_job_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JobStatus"
                 (fun i _ -> job_status_type_of_xml i)
                 ())
      | "JobType" ->
          r_job_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JobType"
                 (fun i _ -> access_advisor_usage_granularity_type_of_xml i)
                 ())
      | "JobCreationDate" ->
          r_job_creation_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JobCreationDate"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "ServicesLastAccessed" ->
          r_services_last_accessed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServicesLastAccessed"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> service_last_accessed_of_xml i)
                     ())
                 ())
      | "JobCompletionDate" ->
          r_job_completion_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JobCompletionDate"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | "Error" ->
          r_error :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Error" (fun i _ -> error_details_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     job_status = Smaws_Lib.Xml.Parse.required "JobStatus" (( ! ) r_job_status) i;
     job_type = ( ! ) r_job_type;
     job_creation_date =
       Smaws_Lib.Xml.Parse.required "JobCreationDate" (( ! ) r_job_creation_date) i;
     services_last_accessed =
       Smaws_Lib.Xml.Parse.required "ServicesLastAccessed" (( ! ) r_services_last_accessed) i;
     job_completion_date =
       Smaws_Lib.Xml.Parse.required "JobCompletionDate" (( ! ) r_job_completion_date) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
     error = ( ! ) r_error;
   }
    : get_service_last_accessed_details_response)

let get_service_last_accessed_details_request_of_xml i =
  let r_job_id = ref None in
  let r_max_items = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "JobId"; "MaxItems"; "Marker" ] (fun tag _ ->
      match tag with
      | "JobId" ->
          r_job_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "JobId" (fun i _ -> job_id_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     job_id = Smaws_Lib.Xml.Parse.required "JobId" (( ! ) r_job_id) i;
     max_items = ( ! ) r_max_items;
     marker = ( ! ) r_marker;
   }
    : get_service_last_accessed_details_request)

let server_certificate_of_xml i =
  let r_server_certificate_metadata = ref None in
  let r_certificate_body = ref None in
  let r_certificate_chain = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ServerCertificateMetadata"; "CertificateBody"; "CertificateChain"; "Tags" ] (fun tag _ ->
      match tag with
      | "ServerCertificateMetadata" ->
          r_server_certificate_metadata :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateMetadata"
                 (fun i _ -> server_certificate_metadata_of_xml i)
                 ())
      | "CertificateBody" ->
          r_certificate_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateBody"
                 (fun i _ -> certificate_body_type_of_xml i)
                 ())
      | "CertificateChain" ->
          r_certificate_chain :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateChain"
                 (fun i _ -> certificate_chain_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     server_certificate_metadata =
       Smaws_Lib.Xml.Parse.required "ServerCertificateMetadata"
         (( ! ) r_server_certificate_metadata)
         i;
     certificate_body = Smaws_Lib.Xml.Parse.required "CertificateBody" (( ! ) r_certificate_body) i;
     certificate_chain = ( ! ) r_certificate_chain;
     tags = ( ! ) r_tags;
   }
    : server_certificate)

let get_server_certificate_response_of_xml i =
  let r_server_certificate = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerCertificate" ] (fun tag _ ->
      match tag with
      | "ServerCertificate" ->
          r_server_certificate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificate"
                 (fun i _ -> server_certificate_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     server_certificate =
       Smaws_Lib.Xml.Parse.required "ServerCertificate" (( ! ) r_server_certificate) i;
   }
    : get_server_certificate_response)

let get_server_certificate_request_of_xml i =
  let r_server_certificate_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerCertificateName" ] (fun tag _ ->
      match tag with
      | "ServerCertificateName" ->
          r_server_certificate_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateName"
                 (fun i _ -> server_certificate_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     server_certificate_name =
       Smaws_Lib.Xml.Parse.required "ServerCertificateName" (( ! ) r_server_certificate_name) i;
   }
    : get_server_certificate_request)

let saml_private_key_of_xml i =
  let r_key_id = ref None in
  let r_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "KeyId"; "Timestamp" ] (fun tag _ ->
      match tag with
      | "KeyId" ->
          r_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KeyId"
                 (fun i _ -> private_key_id_type_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ key_id = ( ! ) r_key_id; timestamp = ( ! ) r_timestamp } : saml_private_key)

let private_key_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> saml_private_key_of_xml i) ()

let get_saml_provider_response_of_xml i =
  let r_saml_provider_uui_d = ref None in
  let r_saml_metadata_document = ref None in
  let r_create_date = ref None in
  let r_valid_until = ref None in
  let r_tags = ref None in
  let r_assertion_encryption_mode = ref None in
  let r_private_key_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SAMLProviderUUID";
      "SAMLMetadataDocument";
      "CreateDate";
      "ValidUntil";
      "Tags";
      "AssertionEncryptionMode";
      "PrivateKeyList";
    ] (fun tag _ ->
      match tag with
      | "SAMLProviderUUID" ->
          r_saml_provider_uui_d :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLProviderUUID"
                 (fun i _ -> private_key_id_type_of_xml i)
                 ())
      | "SAMLMetadataDocument" ->
          r_saml_metadata_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLMetadataDocument"
                 (fun i _ -> saml_metadata_document_type_of_xml i)
                 ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "ValidUntil" ->
          r_valid_until :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidUntil" (fun i _ -> date_type_of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "AssertionEncryptionMode" ->
          r_assertion_encryption_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssertionEncryptionMode"
                 (fun i _ -> assertion_encryption_mode_type_of_xml i)
                 ())
      | "PrivateKeyList" ->
          r_private_key_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrivateKeyList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> saml_private_key_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     saml_provider_uui_d = ( ! ) r_saml_provider_uui_d;
     saml_metadata_document = ( ! ) r_saml_metadata_document;
     create_date = ( ! ) r_create_date;
     valid_until = ( ! ) r_valid_until;
     tags = ( ! ) r_tags;
     assertion_encryption_mode = ( ! ) r_assertion_encryption_mode;
     private_key_list = ( ! ) r_private_key_list;
   }
    : get_saml_provider_response)

let get_saml_provider_request_of_xml i =
  let r_saml_provider_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SAMLProviderArn" ] (fun tag _ ->
      match tag with
      | "SAMLProviderArn" ->
          r_saml_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     saml_provider_arn =
       Smaws_Lib.Xml.Parse.required "SAMLProviderArn" (( ! ) r_saml_provider_arn) i;
   }
    : get_saml_provider_request)

let get_role_policy_response_of_xml i =
  let r_role_name = ref None in
  let r_policy_name = ref None in
  let r_policy_document = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "PolicyName"; "PolicyDocument" ]
    (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "PolicyDocument" ->
          r_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     policy_document = Smaws_Lib.Xml.Parse.required "PolicyDocument" (( ! ) r_policy_document) i;
   }
    : get_role_policy_response)

let get_role_policy_request_of_xml i =
  let r_role_name = ref None in
  let r_policy_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "PolicyName" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
   }
    : get_role_policy_request)

let get_role_response_of_xml i =
  let r_role = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Role" ] (fun tag _ ->
      match tag with
      | "Role" ->
          r_role := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Role" (fun i _ -> role_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ role = Smaws_Lib.Xml.Parse.required "Role" (( ! ) r_role) i } : get_role_response)

let get_role_request_of_xml i =
  let r_role_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i } : get_role_request)

let get_policy_version_response_of_xml i =
  let r_policy_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyVersion" ] (fun tag _ ->
      match tag with
      | "PolicyVersion" ->
          r_policy_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyVersion"
                 (fun i _ -> policy_version_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_version = ( ! ) r_policy_version } : get_policy_version_response)

let get_policy_version_request_of_xml i =
  let r_policy_arn = ref None in
  let r_version_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyArn"; "VersionId" ] (fun tag _ ->
      match tag with
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> policy_version_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
     version_id = Smaws_Lib.Xml.Parse.required "VersionId" (( ! ) r_version_id) i;
   }
    : get_policy_version_request)

let get_policy_response_of_xml i =
  let r_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Policy" ] (fun tag _ ->
      match tag with
      | "Policy" ->
          r_policy :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Policy" (fun i _ -> policy_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy = ( ! ) r_policy } : get_policy_response)

let get_policy_request_of_xml i =
  let r_policy_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyArn" ] (fun tag _ ->
      match tag with
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i }
    : get_policy_request)

let feature_disabled_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let feature_disabled_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> feature_disabled_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : feature_disabled_exception)

let get_outbound_web_identity_federation_info_response_of_xml i =
  let r_issuer_identifier = ref None in
  let r_jwt_vending_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IssuerIdentifier"; "JwtVendingEnabled" ]
    (fun tag _ ->
      match tag with
      | "IssuerIdentifier" ->
          r_issuer_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IssuerIdentifier"
                 (fun i _ -> string_type_of_xml i)
                 ())
      | "JwtVendingEnabled" ->
          r_jwt_vending_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JwtVendingEnabled"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     issuer_identifier = ( ! ) r_issuer_identifier;
     jwt_vending_enabled = ( ! ) r_jwt_vending_enabled;
   }
    : get_outbound_web_identity_federation_info_response)

let organizations_entity_path_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let access_detail_of_xml i =
  let r_service_name = ref None in
  let r_service_namespace = ref None in
  let r_region = ref None in
  let r_entity_path = ref None in
  let r_last_authenticated_time = ref None in
  let r_total_authenticated_entities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ServiceName";
      "ServiceNamespace";
      "Region";
      "EntityPath";
      "LastAuthenticatedTime";
      "TotalAuthenticatedEntities";
    ] (fun tag _ ->
      match tag with
      | "ServiceName" ->
          r_service_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceName"
                 (fun i _ -> service_name_type_of_xml i)
                 ())
      | "ServiceNamespace" ->
          r_service_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceNamespace"
                 (fun i _ -> service_namespace_type_of_xml i)
                 ())
      | "Region" ->
          r_region :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Region" (fun i _ -> string_type_of_xml i) ())
      | "EntityPath" ->
          r_entity_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EntityPath"
                 (fun i _ -> organizations_entity_path_type_of_xml i)
                 ())
      | "LastAuthenticatedTime" ->
          r_last_authenticated_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastAuthenticatedTime"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "TotalAuthenticatedEntities" ->
          r_total_authenticated_entities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalAuthenticatedEntities"
                 (fun i _ -> integer_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     service_name = Smaws_Lib.Xml.Parse.required "ServiceName" (( ! ) r_service_name) i;
     service_namespace =
       Smaws_Lib.Xml.Parse.required "ServiceNamespace" (( ! ) r_service_namespace) i;
     region = ( ! ) r_region;
     entity_path = ( ! ) r_entity_path;
     last_authenticated_time = ( ! ) r_last_authenticated_time;
     total_authenticated_entities = ( ! ) r_total_authenticated_entities;
   }
    : access_detail)

let access_details_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> access_detail_of_xml i) ()

let get_organizations_access_report_response_of_xml i =
  let r_job_status = ref None in
  let r_job_creation_date = ref None in
  let r_job_completion_date = ref None in
  let r_number_of_services_accessible = ref None in
  let r_number_of_services_not_accessed = ref None in
  let r_access_details = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  let r_error_details = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "JobStatus";
      "JobCreationDate";
      "JobCompletionDate";
      "NumberOfServicesAccessible";
      "NumberOfServicesNotAccessed";
      "AccessDetails";
      "IsTruncated";
      "Marker";
      "ErrorDetails";
    ] (fun tag _ ->
      match tag with
      | "JobStatus" ->
          r_job_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JobStatus"
                 (fun i _ -> job_status_type_of_xml i)
                 ())
      | "JobCreationDate" ->
          r_job_creation_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JobCreationDate"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "JobCompletionDate" ->
          r_job_completion_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JobCompletionDate"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "NumberOfServicesAccessible" ->
          r_number_of_services_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfServicesAccessible"
                 (fun i _ -> integer_type_of_xml i)
                 ())
      | "NumberOfServicesNotAccessed" ->
          r_number_of_services_not_accessed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfServicesNotAccessed"
                 (fun i _ -> integer_type_of_xml i)
                 ())
      | "AccessDetails" ->
          r_access_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessDetails"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> access_detail_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "ErrorDetails" ->
          r_error_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorDetails"
                 (fun i _ -> error_details_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     job_status = Smaws_Lib.Xml.Parse.required "JobStatus" (( ! ) r_job_status) i;
     job_creation_date =
       Smaws_Lib.Xml.Parse.required "JobCreationDate" (( ! ) r_job_creation_date) i;
     job_completion_date = ( ! ) r_job_completion_date;
     number_of_services_accessible = ( ! ) r_number_of_services_accessible;
     number_of_services_not_accessed = ( ! ) r_number_of_services_not_accessed;
     access_details = ( ! ) r_access_details;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
     error_details = ( ! ) r_error_details;
   }
    : get_organizations_access_report_response)

let sort_key_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SERVICE_NAMESPACE_ASCENDING" -> SERVICE_NAMESPACE_ASCENDING
   | "SERVICE_NAMESPACE_DESCENDING" -> SERVICE_NAMESPACE_DESCENDING
   | "LAST_AUTHENTICATED_TIME_ASCENDING" -> LAST_AUTHENTICATED_TIME_ASCENDING
   | "LAST_AUTHENTICATED_TIME_DESCENDING" -> LAST_AUTHENTICATED_TIME_DESCENDING
   | _ -> failwith "unknown enum value"
    : sort_key_type)

let get_organizations_access_report_request_of_xml i =
  let r_job_id = ref None in
  let r_max_items = ref None in
  let r_marker = ref None in
  let r_sort_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "JobId"; "MaxItems"; "Marker"; "SortKey" ]
    (fun tag _ ->
      match tag with
      | "JobId" ->
          r_job_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "JobId" (fun i _ -> job_id_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "SortKey" ->
          r_sort_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortKey" (fun i _ -> sort_key_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     job_id = Smaws_Lib.Xml.Parse.required "JobId" (( ! ) r_job_id) i;
     max_items = ( ! ) r_max_items;
     marker = ( ! ) r_marker;
     sort_key = ( ! ) r_sort_key;
   }
    : get_organizations_access_report_request)

let client_id_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> client_id_type_of_xml i) ()

let open_id_connect_provider_url_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_open_id_connect_provider_response_of_xml i =
  let r_url = ref None in
  let r_client_id_list = ref None in
  let r_thumbprint_list = ref None in
  let r_create_date = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Url"; "ClientIDList"; "ThumbprintList"; "CreateDate"; "Tags" ] (fun tag _ ->
      match tag with
      | "Url" ->
          r_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Url"
                 (fun i _ -> open_id_connect_provider_url_type_of_xml i)
                 ())
      | "ClientIDList" ->
          r_client_id_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientIDList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> client_id_type_of_xml i)
                     ())
                 ())
      | "ThumbprintList" ->
          r_thumbprint_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ThumbprintList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> thumbprint_type_of_xml i)
                     ())
                 ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     url = ( ! ) r_url;
     client_id_list = ( ! ) r_client_id_list;
     thumbprint_list = ( ! ) r_thumbprint_list;
     create_date = ( ! ) r_create_date;
     tags = ( ! ) r_tags;
   }
    : get_open_id_connect_provider_response)

let get_open_id_connect_provider_request_of_xml i =
  let r_open_id_connect_provider_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OpenIDConnectProviderArn" ] (fun tag _ ->
      match tag with
      | "OpenIDConnectProviderArn" ->
          r_open_id_connect_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OpenIDConnectProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     open_id_connect_provider_arn =
       Smaws_Lib.Xml.Parse.required "OpenIDConnectProviderArn"
         (( ! ) r_open_id_connect_provider_arn)
         i;
   }
    : get_open_id_connect_provider_request)

let certification_value_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let certification_key_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let certification_map_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k =
        Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> certification_key_type_of_xml i) ()
      in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> certification_value_type_of_xml i)
          ()
      in
      (k, v))
    ()

let get_mfa_device_response_of_xml i =
  let r_user_name = ref None in
  let r_serial_number = ref None in
  let r_enable_date = ref None in
  let r_certifications = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UserName"; "SerialNumber"; "EnableDate"; "Certifications" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | "EnableDate" ->
          r_enable_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableDate" (fun i _ -> date_type_of_xml i) ())
      | "Certifications" ->
          r_certifications :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Certifications"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> certification_key_type_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> certification_value_type_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     serial_number = Smaws_Lib.Xml.Parse.required "SerialNumber" (( ! ) r_serial_number) i;
     enable_date = ( ! ) r_enable_date;
     certifications = ( ! ) r_certifications;
   }
    : get_mfa_device_response)

let get_mfa_device_request_of_xml i =
  let r_serial_number = ref None in
  let r_user_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SerialNumber"; "UserName" ] (fun tag _ ->
      match tag with
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serial_number = Smaws_Lib.Xml.Parse.required "SerialNumber" (( ! ) r_serial_number) i;
     user_name = ( ! ) r_user_name;
   }
    : get_mfa_device_request)

let login_profile_of_xml i =
  let r_user_name = ref None in
  let r_create_date = ref None in
  let r_password_reset_required = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "CreateDate"; "PasswordResetRequired" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "PasswordResetRequired" ->
          r_password_reset_required :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PasswordResetRequired"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     create_date = Smaws_Lib.Xml.Parse.required "CreateDate" (( ! ) r_create_date) i;
     password_reset_required = ( ! ) r_password_reset_required;
   }
    : login_profile)

let get_login_profile_response_of_xml i =
  let r_login_profile = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoginProfile" ] (fun tag _ ->
      match tag with
      | "LoginProfile" ->
          r_login_profile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoginProfile"
                 (fun i _ -> login_profile_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ login_profile = Smaws_Lib.Xml.Parse.required "LoginProfile" (( ! ) r_login_profile) i }
    : get_login_profile_response)

let get_login_profile_request_of_xml i =
  let r_user_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = ( ! ) r_user_name } : get_login_profile_request)

let get_instance_profile_response_of_xml i =
  let r_instance_profile = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfile" ] (fun tag _ ->
      match tag with
      | "InstanceProfile" ->
          r_instance_profile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfile"
                 (fun i _ -> instance_profile_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profile = Smaws_Lib.Xml.Parse.required "InstanceProfile" (( ! ) r_instance_profile) i;
   }
    : get_instance_profile_response)

let get_instance_profile_request_of_xml i =
  let r_instance_profile_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfileName" ] (fun tag _ ->
      match tag with
      | "InstanceProfileName" ->
          r_instance_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfileName"
                 (fun i _ -> instance_profile_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profile_name =
       Smaws_Lib.Xml.Parse.required "InstanceProfileName" (( ! ) r_instance_profile_name) i;
   }
    : get_instance_profile_request)

let summary_state_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "AVAILABLE" -> AVAILABLE
   | "NOT_AVAILABLE" -> NOT_AVAILABLE
   | "NOT_SUPPORTED" -> NOT_SUPPORTED
   | "FAILED" -> FAILED
   | _ -> failwith "unknown enum value"
    : summary_state_type)

let locale_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let summary_content_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_human_readable_summary_response_of_xml i =
  let r_summary_content = ref None in
  let r_locale = ref None in
  let r_summary_state = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SummaryContent"; "Locale"; "SummaryState" ]
    (fun tag _ ->
      match tag with
      | "SummaryContent" ->
          r_summary_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SummaryContent"
                 (fun i _ -> summary_content_type_of_xml i)
                 ())
      | "Locale" ->
          r_locale :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Locale" (fun i _ -> locale_type_of_xml i) ())
      | "SummaryState" ->
          r_summary_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SummaryState"
                 (fun i _ -> summary_state_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     summary_content = ( ! ) r_summary_content;
     locale = ( ! ) r_locale;
     summary_state = ( ! ) r_summary_state;
   }
    : get_human_readable_summary_response)

let get_human_readable_summary_request_of_xml i =
  let r_entity_arn = ref None in
  let r_locale = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EntityArn"; "Locale" ] (fun tag _ ->
      match tag with
      | "EntityArn" ->
          r_entity_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EntityArn" (fun i _ -> arn_type_of_xml i) ())
      | "Locale" ->
          r_locale :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Locale" (fun i _ -> locale_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     entity_arn = Smaws_Lib.Xml.Parse.required "EntityArn" (( ! ) r_entity_arn) i;
     locale = ( ! ) r_locale;
   }
    : get_human_readable_summary_request)

let get_group_policy_response_of_xml i =
  let r_group_name = ref None in
  let r_policy_name = ref None in
  let r_policy_document = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "PolicyName"; "PolicyDocument" ]
    (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "PolicyDocument" ->
          r_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     policy_document = Smaws_Lib.Xml.Parse.required "PolicyDocument" (( ! ) r_policy_document) i;
   }
    : get_group_policy_response)

let get_group_policy_request_of_xml i =
  let r_group_name = ref None in
  let r_policy_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "PolicyName" ] (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
   }
    : get_group_policy_request)

let get_group_response_of_xml i =
  let r_group = ref None in
  let r_users = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Group"; "Users"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "Group" ->
          r_group :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Group" (fun i _ -> group_of_xml i) ())
      | "Users" ->
          r_users :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Users"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_of_xml i) ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group = Smaws_Lib.Xml.Parse.required "Group" (( ! ) r_group) i;
     users = Smaws_Lib.Xml.Parse.required "Users" (( ! ) r_users) i;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : get_group_response)

let get_group_request_of_xml i =
  let r_group_name = ref None in
  let r_marker = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "Marker"; "MaxItems" ] (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     marker = ( ! ) r_marker;
     max_items = ( ! ) r_max_items;
   }
    : get_group_request)

let permission_check_result_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ALLOWED" -> ALLOWED
   | "DENIED" -> DENIED
   | "UNSURE" -> UNSURE
   | _ -> failwith "unknown enum value"
    : permission_check_result_type)

let permission_check_status_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "COMPLETE" -> COMPLETE
   | "IN_PROGRESS" -> IN_PROGRESS
   | "FAILED" -> FAILED
   | _ -> failwith "unknown enum value"
    : permission_check_status_type)

let get_delegation_request_response_of_xml i =
  let r_delegation_request = ref None in
  let r_permission_check_status = ref None in
  let r_permission_check_result = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DelegationRequest"; "PermissionCheckStatus"; "PermissionCheckResult" ] (fun tag _ ->
      match tag with
      | "DelegationRequest" ->
          r_delegation_request :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DelegationRequest"
                 (fun i _ -> delegation_request_of_xml i)
                 ())
      | "PermissionCheckStatus" ->
          r_permission_check_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionCheckStatus"
                 (fun i _ -> permission_check_status_type_of_xml i)
                 ())
      | "PermissionCheckResult" ->
          r_permission_check_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionCheckResult"
                 (fun i _ -> permission_check_result_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delegation_request = ( ! ) r_delegation_request;
     permission_check_status = ( ! ) r_permission_check_status;
     permission_check_result = ( ! ) r_permission_check_result;
   }
    : get_delegation_request_response)

let get_delegation_request_request_of_xml i =
  let r_delegation_request_id = ref None in
  let r_delegation_permission_check = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DelegationRequestId"; "DelegationPermissionCheck" ] (fun tag _ ->
      match tag with
      | "DelegationRequestId" ->
          r_delegation_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DelegationRequestId"
                 (fun i _ -> delegation_request_id_type_of_xml i)
                 ())
      | "DelegationPermissionCheck" ->
          r_delegation_permission_check :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DelegationPermissionCheck"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delegation_request_id =
       Smaws_Lib.Xml.Parse.required "DelegationRequestId" (( ! ) r_delegation_request_id) i;
     delegation_permission_check = ( ! ) r_delegation_permission_check;
   }
    : get_delegation_request_request)

let credential_report_not_ready_exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let credential_report_not_ready_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> credential_report_not_ready_exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : credential_report_not_ready_exception)

let credential_report_not_present_exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let credential_report_not_present_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> credential_report_not_present_exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : credential_report_not_present_exception)

let credential_report_expired_exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let credential_report_expired_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> credential_report_expired_exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : credential_report_expired_exception)

let report_format_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "text/csv" -> Text_csv | _ -> failwith "unknown enum value" : report_format_type)

let report_content_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.blob_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let get_credential_report_response_of_xml i =
  let r_content = ref None in
  let r_report_format = ref None in
  let r_generated_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Content"; "ReportFormat"; "GeneratedTime" ]
    (fun tag _ ->
      match tag with
      | "Content" ->
          r_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Content"
                 (fun i _ -> report_content_type_of_xml i)
                 ())
      | "ReportFormat" ->
          r_report_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReportFormat"
                 (fun i _ -> report_format_type_of_xml i)
                 ())
      | "GeneratedTime" ->
          r_generated_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTime"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     content = ( ! ) r_content;
     report_format = ( ! ) r_report_format;
     generated_time = ( ! ) r_generated_time;
   }
    : get_credential_report_response)

let get_context_keys_for_policy_response_of_xml i =
  let r_context_key_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ContextKeyNames" ] (fun tag _ ->
      match tag with
      | "ContextKeyNames" ->
          r_context_key_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ContextKeyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> context_key_name_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ context_key_names = ( ! ) r_context_key_names } : get_context_keys_for_policy_response)

let get_context_keys_for_principal_policy_request_of_xml i =
  let r_policy_source_arn = ref None in
  let r_policy_input_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicySourceArn"; "PolicyInputList" ]
    (fun tag _ ->
      match tag with
      | "PolicySourceArn" ->
          r_policy_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicySourceArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "PolicyInputList" ->
          r_policy_input_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyInputList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_document_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_source_arn =
       Smaws_Lib.Xml.Parse.required "PolicySourceArn" (( ! ) r_policy_source_arn) i;
     policy_input_list = ( ! ) r_policy_input_list;
   }
    : get_context_keys_for_principal_policy_request)

let get_context_keys_for_custom_policy_request_of_xml i =
  let r_policy_input_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyInputList" ] (fun tag _ ->
      match tag with
      | "PolicyInputList" ->
          r_policy_input_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyInputList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_document_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_input_list =
       Smaws_Lib.Xml.Parse.required "PolicyInputList" (( ! ) r_policy_input_list) i;
   }
    : get_context_keys_for_custom_policy_request)

let summary_value_type_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let summary_key_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Users" -> Users
   | "UsersQuota" -> UsersQuota
   | "Groups" -> Groups
   | "GroupsQuota" -> GroupsQuota
   | "ServerCertificates" -> ServerCertificates
   | "ServerCertificatesQuota" -> ServerCertificatesQuota
   | "UserPolicySizeQuota" -> UserPolicySizeQuota
   | "GroupPolicySizeQuota" -> GroupPolicySizeQuota
   | "GroupsPerUserQuota" -> GroupsPerUserQuota
   | "SigningCertificatesPerUserQuota" -> SigningCertificatesPerUserQuota
   | "AccessKeysPerUserQuota" -> AccessKeysPerUserQuota
   | "MFADevices" -> MFADevices
   | "MFADevicesInUse" -> MFADevicesInUse
   | "AccountMFAEnabled" -> AccountMFAEnabled
   | "AccountAccessKeysPresent" -> AccountAccessKeysPresent
   | "AccountPasswordPresent" -> AccountPasswordPresent
   | "AccountSigningCertificatesPresent" -> AccountSigningCertificatesPresent
   | "AttachedPoliciesPerGroupQuota" -> AttachedPoliciesPerGroupQuota
   | "AttachedPoliciesPerRoleQuota" -> AttachedPoliciesPerRoleQuota
   | "AttachedPoliciesPerUserQuota" -> AttachedPoliciesPerUserQuota
   | "Policies" -> Policies
   | "PoliciesQuota" -> PoliciesQuota
   | "PolicySizeQuota" -> PolicySizeQuota
   | "PolicyVersionsInUse" -> PolicyVersionsInUse
   | "PolicyVersionsInUseQuota" -> PolicyVersionsInUseQuota
   | "VersionsPerPolicyQuota" -> VersionsPerPolicyQuota
   | "GlobalEndpointTokenVersion" -> GlobalEndpointTokenVersion
   | "AssumeRolePolicySizeQuota" -> AssumeRolePolicySizeQuota
   | "InstanceProfiles" -> InstanceProfiles
   | "InstanceProfilesQuota" -> InstanceProfilesQuota
   | "Providers" -> Providers
   | "RolePolicySizeQuota" -> RolePolicySizeQuota
   | "Roles" -> Roles
   | "RolesQuota" -> RolesQuota
   | _ -> failwith "unknown enum value"
    : summary_key_type)

let summary_map_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> summary_key_type_of_xml i) () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> summary_value_type_of_xml i) ()
      in
      (k, v))
    ()

let get_account_summary_response_of_xml i =
  let r_summary_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SummaryMap" ] (fun tag _ ->
      match tag with
      | "SummaryMap" ->
          r_summary_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SummaryMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> summary_key_type_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> summary_value_type_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ summary_map = ( ! ) r_summary_map } : get_account_summary_response)

let password_policy_of_xml i =
  let r_minimum_password_length = ref None in
  let r_require_symbols = ref None in
  let r_require_numbers = ref None in
  let r_require_uppercase_characters = ref None in
  let r_require_lowercase_characters = ref None in
  let r_allow_users_to_change_password = ref None in
  let r_expire_passwords = ref None in
  let r_max_password_age = ref None in
  let r_password_reuse_prevention = ref None in
  let r_hard_expiry = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MinimumPasswordLength";
      "RequireSymbols";
      "RequireNumbers";
      "RequireUppercaseCharacters";
      "RequireLowercaseCharacters";
      "AllowUsersToChangePassword";
      "ExpirePasswords";
      "MaxPasswordAge";
      "PasswordReusePrevention";
      "HardExpiry";
    ] (fun tag _ ->
      match tag with
      | "MinimumPasswordLength" ->
          r_minimum_password_length :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinimumPasswordLength"
                 (fun i _ -> minimum_password_length_type_of_xml i)
                 ())
      | "RequireSymbols" ->
          r_require_symbols :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequireSymbols"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "RequireNumbers" ->
          r_require_numbers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequireNumbers"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "RequireUppercaseCharacters" ->
          r_require_uppercase_characters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequireUppercaseCharacters"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "RequireLowercaseCharacters" ->
          r_require_lowercase_characters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequireLowercaseCharacters"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "AllowUsersToChangePassword" ->
          r_allow_users_to_change_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowUsersToChangePassword"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "ExpirePasswords" ->
          r_expire_passwords :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpirePasswords"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "MaxPasswordAge" ->
          r_max_password_age :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxPasswordAge"
                 (fun i _ -> max_password_age_type_of_xml i)
                 ())
      | "PasswordReusePrevention" ->
          r_password_reuse_prevention :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PasswordReusePrevention"
                 (fun i _ -> password_reuse_prevention_type_of_xml i)
                 ())
      | "HardExpiry" ->
          r_hard_expiry :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HardExpiry"
                 (fun i _ -> boolean_object_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     minimum_password_length = ( ! ) r_minimum_password_length;
     require_symbols = ( ! ) r_require_symbols;
     require_numbers = ( ! ) r_require_numbers;
     require_uppercase_characters = ( ! ) r_require_uppercase_characters;
     require_lowercase_characters = ( ! ) r_require_lowercase_characters;
     allow_users_to_change_password = ( ! ) r_allow_users_to_change_password;
     expire_passwords = ( ! ) r_expire_passwords;
     max_password_age = ( ! ) r_max_password_age;
     password_reuse_prevention = ( ! ) r_password_reuse_prevention;
     hard_expiry = ( ! ) r_hard_expiry;
   }
    : password_policy)

let get_account_password_policy_response_of_xml i =
  let r_password_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PasswordPolicy" ] (fun tag _ ->
      match tag with
      | "PasswordPolicy" ->
          r_password_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PasswordPolicy"
                 (fun i _ -> password_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ password_policy = Smaws_Lib.Xml.Parse.required "PasswordPolicy" (( ! ) r_password_policy) i }
    : get_account_password_policy_response)

let managed_policy_detail_of_xml i =
  let r_policy_name = ref None in
  let r_policy_id = ref None in
  let r_arn = ref None in
  let r_path = ref None in
  let r_default_version_id = ref None in
  let r_attachment_count = ref None in
  let r_permissions_boundary_usage_count = ref None in
  let r_is_attachable = ref None in
  let r_description = ref None in
  let r_create_date = ref None in
  let r_update_date = ref None in
  let r_policy_version_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PolicyName";
      "PolicyId";
      "Arn";
      "Path";
      "DefaultVersionId";
      "AttachmentCount";
      "PermissionsBoundaryUsageCount";
      "IsAttachable";
      "Description";
      "CreateDate";
      "UpdateDate";
      "PolicyVersionList";
    ] (fun tag _ ->
      match tag with
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "PolicyId" ->
          r_policy_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyId" (fun i _ -> id_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "Path" ->
          r_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> policy_path_type_of_xml i) ())
      | "DefaultVersionId" ->
          r_default_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultVersionId"
                 (fun i _ -> policy_version_id_type_of_xml i)
                 ())
      | "AttachmentCount" ->
          r_attachment_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttachmentCount"
                 (fun i _ -> attachment_count_type_of_xml i)
                 ())
      | "PermissionsBoundaryUsageCount" ->
          r_permissions_boundary_usage_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundaryUsageCount"
                 (fun i _ -> attachment_count_type_of_xml i)
                 ())
      | "IsAttachable" ->
          r_is_attachable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsAttachable"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> policy_description_type_of_xml i)
                 ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "UpdateDate" ->
          r_update_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateDate" (fun i _ -> date_type_of_xml i) ())
      | "PolicyVersionList" ->
          r_policy_version_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyVersionList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_version_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_name = ( ! ) r_policy_name;
     policy_id = ( ! ) r_policy_id;
     arn = ( ! ) r_arn;
     path = ( ! ) r_path;
     default_version_id = ( ! ) r_default_version_id;
     attachment_count = ( ! ) r_attachment_count;
     permissions_boundary_usage_count = ( ! ) r_permissions_boundary_usage_count;
     is_attachable = ( ! ) r_is_attachable;
     description = ( ! ) r_description;
     create_date = ( ! ) r_create_date;
     update_date = ( ! ) r_update_date;
     policy_version_list = ( ! ) r_policy_version_list;
   }
    : managed_policy_detail)

let managed_policy_detail_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> managed_policy_detail_of_xml i) ()

let policy_detail_of_xml i =
  let r_policy_name = ref None in
  let r_policy_document = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyName"; "PolicyDocument" ] (fun tag _ ->
      match tag with
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "PolicyDocument" ->
          r_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_name = ( ! ) r_policy_name; policy_document = ( ! ) r_policy_document } : policy_detail)

let policy_detail_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_detail_of_xml i) ()

let role_detail_of_xml i =
  let r_path = ref None in
  let r_role_name = ref None in
  let r_role_id = ref None in
  let r_arn = ref None in
  let r_create_date = ref None in
  let r_assume_role_policy_document = ref None in
  let r_instance_profile_list = ref None in
  let r_role_policy_list = ref None in
  let r_attached_managed_policies = ref None in
  let r_permissions_boundary = ref None in
  let r_tags = ref None in
  let r_role_last_used = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Path";
      "RoleName";
      "RoleId";
      "Arn";
      "CreateDate";
      "AssumeRolePolicyDocument";
      "InstanceProfileList";
      "RolePolicyList";
      "AttachedManagedPolicies";
      "PermissionsBoundary";
      "Tags";
      "RoleLastUsed";
    ] (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "RoleId" ->
          r_role_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleId" (fun i _ -> id_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "AssumeRolePolicyDocument" ->
          r_assume_role_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssumeRolePolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | "InstanceProfileList" ->
          r_instance_profile_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfileList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instance_profile_of_xml i)
                     ())
                 ())
      | "RolePolicyList" ->
          r_role_policy_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RolePolicyList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_detail_of_xml i)
                     ())
                 ())
      | "AttachedManagedPolicies" ->
          r_attached_managed_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttachedManagedPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> attached_policy_of_xml i)
                     ())
                 ())
      | "PermissionsBoundary" ->
          r_permissions_boundary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundary"
                 (fun i _ -> attached_permissions_boundary_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "RoleLastUsed" ->
          r_role_last_used :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleLastUsed"
                 (fun i _ -> role_last_used_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = ( ! ) r_path;
     role_name = ( ! ) r_role_name;
     role_id = ( ! ) r_role_id;
     arn = ( ! ) r_arn;
     create_date = ( ! ) r_create_date;
     assume_role_policy_document = ( ! ) r_assume_role_policy_document;
     instance_profile_list = ( ! ) r_instance_profile_list;
     role_policy_list = ( ! ) r_role_policy_list;
     attached_managed_policies = ( ! ) r_attached_managed_policies;
     permissions_boundary = ( ! ) r_permissions_boundary;
     tags = ( ! ) r_tags;
     role_last_used = ( ! ) r_role_last_used;
   }
    : role_detail)

let role_detail_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> role_detail_of_xml i) ()

let group_detail_of_xml i =
  let r_path = ref None in
  let r_group_name = ref None in
  let r_group_id = ref None in
  let r_arn = ref None in
  let r_create_date = ref None in
  let r_group_policy_list = ref None in
  let r_attached_managed_policies = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Path";
      "GroupName";
      "GroupId";
      "Arn";
      "CreateDate";
      "GroupPolicyList";
      "AttachedManagedPolicies";
    ] (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "GroupId" ->
          r_group_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "GroupId" (fun i _ -> id_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "GroupPolicyList" ->
          r_group_policy_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupPolicyList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_detail_of_xml i)
                     ())
                 ())
      | "AttachedManagedPolicies" ->
          r_attached_managed_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttachedManagedPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> attached_policy_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = ( ! ) r_path;
     group_name = ( ! ) r_group_name;
     group_id = ( ! ) r_group_id;
     arn = ( ! ) r_arn;
     create_date = ( ! ) r_create_date;
     group_policy_list = ( ! ) r_group_policy_list;
     attached_managed_policies = ( ! ) r_attached_managed_policies;
   }
    : group_detail)

let group_detail_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> group_detail_of_xml i) ()

let group_name_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> group_name_type_of_xml i) ()

let user_detail_of_xml i =
  let r_path = ref None in
  let r_user_name = ref None in
  let r_user_id = ref None in
  let r_arn = ref None in
  let r_create_date = ref None in
  let r_user_policy_list = ref None in
  let r_group_list = ref None in
  let r_attached_managed_policies = ref None in
  let r_permissions_boundary = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Path";
      "UserName";
      "UserId";
      "Arn";
      "CreateDate";
      "UserPolicyList";
      "GroupList";
      "AttachedManagedPolicies";
      "PermissionsBoundary";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "UserId" ->
          r_user_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UserId" (fun i _ -> id_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | "UserPolicyList" ->
          r_user_policy_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserPolicyList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_detail_of_xml i)
                     ())
                 ())
      | "GroupList" ->
          r_group_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> group_name_type_of_xml i)
                     ())
                 ())
      | "AttachedManagedPolicies" ->
          r_attached_managed_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttachedManagedPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> attached_policy_of_xml i)
                     ())
                 ())
      | "PermissionsBoundary" ->
          r_permissions_boundary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundary"
                 (fun i _ -> attached_permissions_boundary_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = ( ! ) r_path;
     user_name = ( ! ) r_user_name;
     user_id = ( ! ) r_user_id;
     arn = ( ! ) r_arn;
     create_date = ( ! ) r_create_date;
     user_policy_list = ( ! ) r_user_policy_list;
     group_list = ( ! ) r_group_list;
     attached_managed_policies = ( ! ) r_attached_managed_policies;
     permissions_boundary = ( ! ) r_permissions_boundary;
     tags = ( ! ) r_tags;
   }
    : user_detail)

let user_detail_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_detail_of_xml i) ()

let get_account_authorization_details_response_of_xml i =
  let r_user_detail_list = ref None in
  let r_group_detail_list = ref None in
  let r_role_detail_list = ref None in
  let r_policies = ref None in
  let r_is_truncated = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UserDetailList"; "GroupDetailList"; "RoleDetailList"; "Policies"; "IsTruncated"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "UserDetailList" ->
          r_user_detail_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserDetailList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> user_detail_of_xml i)
                     ())
                 ())
      | "GroupDetailList" ->
          r_group_detail_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupDetailList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> group_detail_of_xml i)
                     ())
                 ())
      | "RoleDetailList" ->
          r_role_detail_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleDetailList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> role_detail_of_xml i)
                     ())
                 ())
      | "Policies" ->
          r_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Policies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> managed_policy_detail_of_xml i)
                     ())
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsTruncated"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Marker"
                 (fun i _ -> response_marker_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_detail_list = ( ! ) r_user_detail_list;
     group_detail_list = ( ! ) r_group_detail_list;
     role_detail_list = ( ! ) r_role_detail_list;
     policies = ( ! ) r_policies;
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
   }
    : get_account_authorization_details_response)

let entity_list_type_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> entity_type_of_xml i) ()

let get_account_authorization_details_request_of_xml i =
  let r_filter = ref None in
  let r_max_items = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Filter"; "MaxItems"; "Marker" ] (fun tag _ ->
      match tag with
      | "Filter" ->
          r_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filter"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> entity_type_of_xml i)
                     ())
                 ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> max_items_type_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ filter = ( ! ) r_filter; max_items = ( ! ) r_max_items; marker = ( ! ) r_marker }
    : get_account_authorization_details_request)

let access_key_last_used_of_xml i =
  let r_last_used_date = ref None in
  let r_service_name = ref None in
  let r_region = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LastUsedDate"; "ServiceName"; "Region" ]
    (fun tag _ ->
      match tag with
      | "LastUsedDate" ->
          r_last_used_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUsedDate"
                 (fun i _ -> date_type_of_xml i)
                 ())
      | "ServiceName" ->
          r_service_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceName"
                 (fun i _ -> string_type_of_xml i)
                 ())
      | "Region" ->
          r_region :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Region" (fun i _ -> string_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     last_used_date = ( ! ) r_last_used_date;
     service_name = Smaws_Lib.Xml.Parse.required "ServiceName" (( ! ) r_service_name) i;
     region = Smaws_Lib.Xml.Parse.required "Region" (( ! ) r_region) i;
   }
    : access_key_last_used)

let get_access_key_last_used_response_of_xml i =
  let r_user_name = ref None in
  let r_access_key_last_used = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "AccessKeyLastUsed" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "AccessKeyLastUsed" ->
          r_access_key_last_used :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKeyLastUsed"
                 (fun i _ -> access_key_last_used_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = ( ! ) r_user_name; access_key_last_used = ( ! ) r_access_key_last_used }
    : get_access_key_last_used_response)

let get_access_key_last_used_request_of_xml i =
  let r_access_key_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccessKeyId" ] (fun tag _ ->
      match tag with
      | "AccessKeyId" ->
          r_access_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKeyId"
                 (fun i _ -> access_key_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ access_key_id = Smaws_Lib.Xml.Parse.required "AccessKeyId" (( ! ) r_access_key_id) i }
    : get_access_key_last_used_request)

let generate_service_last_accessed_details_response_of_xml i =
  let r_job_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "JobId" ] (fun tag _ ->
      match tag with
      | "JobId" ->
          r_job_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "JobId" (fun i _ -> job_id_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ job_id = ( ! ) r_job_id } : generate_service_last_accessed_details_response)

let generate_service_last_accessed_details_request_of_xml i =
  let r_arn = ref None in
  let r_granularity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Arn"; "Granularity" ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_type_of_xml i) ())
      | "Granularity" ->
          r_granularity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Granularity"
                 (fun i _ -> access_advisor_usage_granularity_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i; granularity = ( ! ) r_granularity }
    : generate_service_last_accessed_details_request)

let report_generation_limit_exceeded_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let report_generation_limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> report_generation_limit_exceeded_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : report_generation_limit_exceeded_exception)

let generate_organizations_access_report_response_of_xml i =
  let r_job_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "JobId" ] (fun tag _ ->
      match tag with
      | "JobId" ->
          r_job_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "JobId" (fun i _ -> job_id_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ job_id = ( ! ) r_job_id } : generate_organizations_access_report_response)

let organizations_policy_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let generate_organizations_access_report_request_of_xml i =
  let r_entity_path = ref None in
  let r_organizations_policy_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EntityPath"; "OrganizationsPolicyId" ]
    (fun tag _ ->
      match tag with
      | "EntityPath" ->
          r_entity_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EntityPath"
                 (fun i _ -> organizations_entity_path_type_of_xml i)
                 ())
      | "OrganizationsPolicyId" ->
          r_organizations_policy_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationsPolicyId"
                 (fun i _ -> organizations_policy_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     entity_path = Smaws_Lib.Xml.Parse.required "EntityPath" (( ! ) r_entity_path) i;
     organizations_policy_id = ( ! ) r_organizations_policy_id;
   }
    : generate_organizations_access_report_request)

let report_state_description_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let report_state_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "STARTED" -> STARTED
   | "INPROGRESS" -> INPROGRESS
   | "COMPLETE" -> COMPLETE
   | _ -> failwith "unknown enum value"
    : report_state_type)

let generate_credential_report_response_of_xml i =
  let r_state = ref None in
  let r_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "State"; "Description" ] (fun tag _ ->
      match tag with
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> report_state_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> report_state_description_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ state = ( ! ) r_state; description = ( ! ) r_description }
    : generate_credential_report_response)

let feature_enabled_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let feature_enabled_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> feature_enabled_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : feature_enabled_exception)

let enable_outbound_web_identity_federation_response_of_xml i =
  let r_issuer_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IssuerIdentifier" ] (fun tag _ ->
      match tag with
      | "IssuerIdentifier" ->
          r_issuer_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IssuerIdentifier"
                 (fun i _ -> string_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ issuer_identifier = ( ! ) r_issuer_identifier }
    : enable_outbound_web_identity_federation_response)

let caller_is_not_management_account_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : caller_is_not_management_account_exception)

let enable_organizations_root_sessions_response_of_xml i =
  let r_organization_id = ref None in
  let r_enabled_features = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OrganizationId"; "EnabledFeatures" ] (fun tag _ ->
      match tag with
      | "OrganizationId" ->
          r_organization_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationId"
                 (fun i _ -> organization_id_type_of_xml i)
                 ())
      | "EnabledFeatures" ->
          r_enabled_features :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnabledFeatures"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> feature_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ organization_id = ( ! ) r_organization_id; enabled_features = ( ! ) r_enabled_features }
    : enable_organizations_root_sessions_response)

let enable_organizations_root_sessions_request_of_xml i = ()

let enable_organizations_root_credentials_management_response_of_xml i =
  let r_organization_id = ref None in
  let r_enabled_features = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OrganizationId"; "EnabledFeatures" ] (fun tag _ ->
      match tag with
      | "OrganizationId" ->
          r_organization_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationId"
                 (fun i _ -> organization_id_type_of_xml i)
                 ())
      | "EnabledFeatures" ->
          r_enabled_features :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnabledFeatures"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> feature_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ organization_id = ( ! ) r_organization_id; enabled_features = ( ! ) r_enabled_features }
    : enable_organizations_root_credentials_management_response)

let enable_organizations_root_credentials_management_request_of_xml i = ()

let enable_mfa_device_request_of_xml i =
  let r_user_name = ref None in
  let r_serial_number = ref None in
  let r_authentication_code1 = ref None in
  let r_authentication_code2 = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UserName"; "SerialNumber"; "AuthenticationCode1"; "AuthenticationCode2" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | "AuthenticationCode1" ->
          r_authentication_code1 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationCode1"
                 (fun i _ -> authentication_code_type_of_xml i)
                 ())
      | "AuthenticationCode2" ->
          r_authentication_code2 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationCode2"
                 (fun i _ -> authentication_code_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     serial_number = Smaws_Lib.Xml.Parse.required "SerialNumber" (( ! ) r_serial_number) i;
     authentication_code1 =
       Smaws_Lib.Xml.Parse.required "AuthenticationCode1" (( ! ) r_authentication_code1) i;
     authentication_code2 =
       Smaws_Lib.Xml.Parse.required "AuthenticationCode2" (( ! ) r_authentication_code2) i;
   }
    : enable_mfa_device_request)

let disable_organizations_root_sessions_response_of_xml i =
  let r_organization_id = ref None in
  let r_enabled_features = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OrganizationId"; "EnabledFeatures" ] (fun tag _ ->
      match tag with
      | "OrganizationId" ->
          r_organization_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationId"
                 (fun i _ -> organization_id_type_of_xml i)
                 ())
      | "EnabledFeatures" ->
          r_enabled_features :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnabledFeatures"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> feature_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ organization_id = ( ! ) r_organization_id; enabled_features = ( ! ) r_enabled_features }
    : disable_organizations_root_sessions_response)

let disable_organizations_root_sessions_request_of_xml i = ()

let disable_organizations_root_credentials_management_response_of_xml i =
  let r_organization_id = ref None in
  let r_enabled_features = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OrganizationId"; "EnabledFeatures" ] (fun tag _ ->
      match tag with
      | "OrganizationId" ->
          r_organization_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationId"
                 (fun i _ -> organization_id_type_of_xml i)
                 ())
      | "EnabledFeatures" ->
          r_enabled_features :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnabledFeatures"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> feature_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ organization_id = ( ! ) r_organization_id; enabled_features = ( ! ) r_enabled_features }
    : disable_organizations_root_credentials_management_response)

let disable_organizations_root_credentials_management_request_of_xml i = ()

let detach_user_policy_request_of_xml i =
  let r_user_name = ref None in
  let r_policy_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "PolicyArn" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
   }
    : detach_user_policy_request)

let detach_role_policy_request_of_xml i =
  let r_role_name = ref None in
  let r_policy_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "PolicyArn" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
   }
    : detach_role_policy_request)

let detach_group_policy_request_of_xml i =
  let r_group_name = ref None in
  let r_policy_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "PolicyArn" ] (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
   }
    : detach_group_policy_request)

let delete_conflict_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let delete_conflict_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> delete_conflict_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : delete_conflict_exception)

let delete_virtual_mfa_device_request_of_xml i =
  let r_serial_number = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SerialNumber" ] (fun tag _ ->
      match tag with
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ serial_number = Smaws_Lib.Xml.Parse.required "SerialNumber" (( ! ) r_serial_number) i }
    : delete_virtual_mfa_device_request)

let delete_user_policy_request_of_xml i =
  let r_user_name = ref None in
  let r_policy_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "PolicyName" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
   }
    : delete_user_policy_request)

let delete_user_permissions_boundary_request_of_xml i =
  let r_user_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i }
    : delete_user_permissions_boundary_request)

let delete_user_request_of_xml i =
  let r_user_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i }
    : delete_user_request)

let delete_ssh_public_key_request_of_xml i =
  let r_user_name = ref None in
  let r_ssh_public_key_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "SSHPublicKeyId" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "SSHPublicKeyId" ->
          r_ssh_public_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSHPublicKeyId"
                 (fun i _ -> public_key_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     ssh_public_key_id = Smaws_Lib.Xml.Parse.required "SSHPublicKeyId" (( ! ) r_ssh_public_key_id) i;
   }
    : delete_ssh_public_key_request)

let delete_signing_certificate_request_of_xml i =
  let r_user_name = ref None in
  let r_certificate_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "CertificateId" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "CertificateId" ->
          r_certificate_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateId"
                 (fun i _ -> certificate_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     certificate_id = Smaws_Lib.Xml.Parse.required "CertificateId" (( ! ) r_certificate_id) i;
   }
    : delete_signing_certificate_request)

let delete_service_specific_credential_request_of_xml i =
  let r_user_name = ref None in
  let r_service_specific_credential_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "ServiceSpecificCredentialId" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "ServiceSpecificCredentialId" ->
          r_service_specific_credential_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceSpecificCredentialId"
                 (fun i _ -> service_specific_credential_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     service_specific_credential_id =
       Smaws_Lib.Xml.Parse.required "ServiceSpecificCredentialId"
         (( ! ) r_service_specific_credential_id)
         i;
   }
    : delete_service_specific_credential_request)

let delete_service_linked_role_response_of_xml i =
  let r_deletion_task_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DeletionTaskId" ] (fun tag _ ->
      match tag with
      | "DeletionTaskId" ->
          r_deletion_task_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionTaskId"
                 (fun i _ -> deletion_task_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ deletion_task_id = Smaws_Lib.Xml.Parse.required "DeletionTaskId" (( ! ) r_deletion_task_id) i }
    : delete_service_linked_role_response)

let delete_service_linked_role_request_of_xml i =
  let r_role_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i }
    : delete_service_linked_role_request)

let delete_server_certificate_request_of_xml i =
  let r_server_certificate_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerCertificateName" ] (fun tag _ ->
      match tag with
      | "ServerCertificateName" ->
          r_server_certificate_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerCertificateName"
                 (fun i _ -> server_certificate_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     server_certificate_name =
       Smaws_Lib.Xml.Parse.required "ServerCertificateName" (( ! ) r_server_certificate_name) i;
   }
    : delete_server_certificate_request)

let delete_saml_provider_request_of_xml i =
  let r_saml_provider_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SAMLProviderArn" ] (fun tag _ ->
      match tag with
      | "SAMLProviderArn" ->
          r_saml_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     saml_provider_arn =
       Smaws_Lib.Xml.Parse.required "SAMLProviderArn" (( ! ) r_saml_provider_arn) i;
   }
    : delete_saml_provider_request)

let delete_role_policy_request_of_xml i =
  let r_role_name = ref None in
  let r_policy_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "PolicyName" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
   }
    : delete_role_policy_request)

let delete_role_permissions_boundary_request_of_xml i =
  let r_role_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i }
    : delete_role_permissions_boundary_request)

let delete_role_request_of_xml i =
  let r_role_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i }
    : delete_role_request)

let delete_policy_version_request_of_xml i =
  let r_policy_arn = ref None in
  let r_version_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyArn"; "VersionId" ] (fun tag _ ->
      match tag with
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> policy_version_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
     version_id = Smaws_Lib.Xml.Parse.required "VersionId" (( ! ) r_version_id) i;
   }
    : delete_policy_version_request)

let delete_policy_request_of_xml i =
  let r_policy_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyArn" ] (fun tag _ ->
      match tag with
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i }
    : delete_policy_request)

let delete_open_id_connect_provider_request_of_xml i =
  let r_open_id_connect_provider_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OpenIDConnectProviderArn" ] (fun tag _ ->
      match tag with
      | "OpenIDConnectProviderArn" ->
          r_open_id_connect_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OpenIDConnectProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     open_id_connect_provider_arn =
       Smaws_Lib.Xml.Parse.required "OpenIDConnectProviderArn"
         (( ! ) r_open_id_connect_provider_arn)
         i;
   }
    : delete_open_id_connect_provider_request)

let delete_login_profile_request_of_xml i =
  let r_user_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = ( ! ) r_user_name } : delete_login_profile_request)

let delete_instance_profile_request_of_xml i =
  let r_instance_profile_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfileName" ] (fun tag _ ->
      match tag with
      | "InstanceProfileName" ->
          r_instance_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfileName"
                 (fun i _ -> instance_profile_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profile_name =
       Smaws_Lib.Xml.Parse.required "InstanceProfileName" (( ! ) r_instance_profile_name) i;
   }
    : delete_instance_profile_request)

let delete_group_policy_request_of_xml i =
  let r_group_name = ref None in
  let r_policy_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "PolicyName" ] (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
   }
    : delete_group_policy_request)

let delete_group_request_of_xml i =
  let r_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName" ] (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i }
    : delete_group_request)

let delete_account_alias_request_of_xml i =
  let r_account_alias = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccountAlias" ] (fun tag _ ->
      match tag with
      | "AccountAlias" ->
          r_account_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountAlias"
                 (fun i _ -> account_alias_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ account_alias = Smaws_Lib.Xml.Parse.required "AccountAlias" (( ! ) r_account_alias) i }
    : delete_account_alias_request)

let delete_access_key_request_of_xml i =
  let r_user_name = ref None in
  let r_access_key_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "AccessKeyId" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "AccessKeyId" ->
          r_access_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKeyId"
                 (fun i _ -> access_key_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     access_key_id = Smaws_Lib.Xml.Parse.required "AccessKeyId" (( ! ) r_access_key_id) i;
   }
    : delete_access_key_request)

let deactivate_mfa_device_request_of_xml i =
  let r_user_name = ref None in
  let r_serial_number = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "SerialNumber" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | "SerialNumber" ->
          r_serial_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SerialNumber"
                 (fun i _ -> serial_number_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     serial_number = Smaws_Lib.Xml.Parse.required "SerialNumber" (( ! ) r_serial_number) i;
   }
    : deactivate_mfa_device_request)

let create_virtual_mfa_device_response_of_xml i =
  let r_virtual_mfa_device = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VirtualMFADevice" ] (fun tag _ ->
      match tag with
      | "VirtualMFADevice" ->
          r_virtual_mfa_device :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VirtualMFADevice"
                 (fun i _ -> virtual_mfa_device_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     virtual_mfa_device =
       Smaws_Lib.Xml.Parse.required "VirtualMFADevice" (( ! ) r_virtual_mfa_device) i;
   }
    : create_virtual_mfa_device_response)

let virtual_mfa_device_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let create_virtual_mfa_device_request_of_xml i =
  let r_path = ref None in
  let r_virtual_mfa_device_name = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Path"; "VirtualMFADeviceName"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "VirtualMFADeviceName" ->
          r_virtual_mfa_device_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VirtualMFADeviceName"
                 (fun i _ -> virtual_mfa_device_name_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = ( ! ) r_path;
     virtual_mfa_device_name =
       Smaws_Lib.Xml.Parse.required "VirtualMFADeviceName" (( ! ) r_virtual_mfa_device_name) i;
     tags = ( ! ) r_tags;
   }
    : create_virtual_mfa_device_request)

let create_user_response_of_xml i =
  let r_user = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "User" ] (fun tag _ ->
      match tag with
      | "User" ->
          r_user := Some (Smaws_Lib.Xml.Parse.Read.sequence i "User" (fun i _ -> user_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user = ( ! ) r_user } : create_user_response)

let create_user_request_of_xml i =
  let r_path = ref None in
  let r_user_name = ref None in
  let r_permissions_boundary = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Path"; "UserName"; "PermissionsBoundary"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "PermissionsBoundary" ->
          r_permissions_boundary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundary"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = ( ! ) r_path;
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     permissions_boundary = ( ! ) r_permissions_boundary;
     tags = ( ! ) r_tags;
   }
    : create_user_request)

let create_service_specific_credential_response_of_xml i =
  let r_service_specific_credential = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServiceSpecificCredential" ] (fun tag _ ->
      match tag with
      | "ServiceSpecificCredential" ->
          r_service_specific_credential :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceSpecificCredential"
                 (fun i _ -> service_specific_credential_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ service_specific_credential = ( ! ) r_service_specific_credential }
    : create_service_specific_credential_response)

let credential_age_days_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let create_service_specific_credential_request_of_xml i =
  let r_user_name = ref None in
  let r_service_name = ref None in
  let r_credential_age_days = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "ServiceName"; "CredentialAgeDays" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "ServiceName" ->
          r_service_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceName"
                 (fun i _ -> service_name_of_xml i)
                 ())
      | "CredentialAgeDays" ->
          r_credential_age_days :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CredentialAgeDays"
                 (fun i _ -> credential_age_days_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     service_name = Smaws_Lib.Xml.Parse.required "ServiceName" (( ! ) r_service_name) i;
     credential_age_days = ( ! ) r_credential_age_days;
   }
    : create_service_specific_credential_request)

let create_service_linked_role_response_of_xml i =
  let r_role = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Role" ] (fun tag _ ->
      match tag with
      | "Role" ->
          r_role := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Role" (fun i _ -> role_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ role = ( ! ) r_role } : create_service_linked_role_response)

let custom_suffix_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let create_service_linked_role_request_of_xml i =
  let r_aws_service_name = ref None in
  let r_description = ref None in
  let r_custom_suffix = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AWSServiceName"; "Description"; "CustomSuffix" ]
    (fun tag _ ->
      match tag with
      | "AWSServiceName" ->
          r_aws_service_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AWSServiceName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> role_description_type_of_xml i)
                 ())
      | "CustomSuffix" ->
          r_custom_suffix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomSuffix"
                 (fun i _ -> custom_suffix_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     aws_service_name = Smaws_Lib.Xml.Parse.required "AWSServiceName" (( ! ) r_aws_service_name) i;
     description = ( ! ) r_description;
     custom_suffix = ( ! ) r_custom_suffix;
   }
    : create_service_linked_role_request)

let create_saml_provider_response_of_xml i =
  let r_saml_provider_arn = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SAMLProviderArn"; "Tags" ] (fun tag _ ->
      match tag with
      | "SAMLProviderArn" ->
          r_saml_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ saml_provider_arn = ( ! ) r_saml_provider_arn; tags = ( ! ) r_tags }
    : create_saml_provider_response)

let saml_provider_name_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let create_saml_provider_request_of_xml i =
  let r_saml_metadata_document = ref None in
  let r_name = ref None in
  let r_tags = ref None in
  let r_assertion_encryption_mode = ref None in
  let r_add_private_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SAMLMetadataDocument"; "Name"; "Tags"; "AssertionEncryptionMode"; "AddPrivateKey" ]
    (fun tag _ ->
      match tag with
      | "SAMLMetadataDocument" ->
          r_saml_metadata_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SAMLMetadataDocument"
                 (fun i _ -> saml_metadata_document_type_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> saml_provider_name_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "AssertionEncryptionMode" ->
          r_assertion_encryption_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssertionEncryptionMode"
                 (fun i _ -> assertion_encryption_mode_type_of_xml i)
                 ())
      | "AddPrivateKey" ->
          r_add_private_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AddPrivateKey"
                 (fun i _ -> private_key_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     saml_metadata_document =
       Smaws_Lib.Xml.Parse.required "SAMLMetadataDocument" (( ! ) r_saml_metadata_document) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     tags = ( ! ) r_tags;
     assertion_encryption_mode = ( ! ) r_assertion_encryption_mode;
     add_private_key = ( ! ) r_add_private_key;
   }
    : create_saml_provider_request)

let create_role_response_of_xml i =
  let r_role = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Role" ] (fun tag _ ->
      match tag with
      | "Role" ->
          r_role := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Role" (fun i _ -> role_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ role = Smaws_Lib.Xml.Parse.required "Role" (( ! ) r_role) i } : create_role_response)

let create_role_request_of_xml i =
  let r_path = ref None in
  let r_role_name = ref None in
  let r_assume_role_policy_document = ref None in
  let r_description = ref None in
  let r_max_session_duration = ref None in
  let r_permissions_boundary = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Path";
      "RoleName";
      "AssumeRolePolicyDocument";
      "Description";
      "MaxSessionDuration";
      "PermissionsBoundary";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "AssumeRolePolicyDocument" ->
          r_assume_role_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssumeRolePolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> role_description_type_of_xml i)
                 ())
      | "MaxSessionDuration" ->
          r_max_session_duration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxSessionDuration"
                 (fun i _ -> role_max_session_duration_type_of_xml i)
                 ())
      | "PermissionsBoundary" ->
          r_permissions_boundary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionsBoundary"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = ( ! ) r_path;
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     assume_role_policy_document =
       Smaws_Lib.Xml.Parse.required "AssumeRolePolicyDocument"
         (( ! ) r_assume_role_policy_document)
         i;
     description = ( ! ) r_description;
     max_session_duration = ( ! ) r_max_session_duration;
     permissions_boundary = ( ! ) r_permissions_boundary;
     tags = ( ! ) r_tags;
   }
    : create_role_request)

let create_policy_version_response_of_xml i =
  let r_policy_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyVersion" ] (fun tag _ ->
      match tag with
      | "PolicyVersion" ->
          r_policy_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyVersion"
                 (fun i _ -> policy_version_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_version = ( ! ) r_policy_version } : create_policy_version_response)

let create_policy_version_request_of_xml i =
  let r_policy_arn = ref None in
  let r_policy_document = ref None in
  let r_set_as_default = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyArn"; "PolicyDocument"; "SetAsDefault" ]
    (fun tag _ ->
      match tag with
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | "PolicyDocument" ->
          r_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | "SetAsDefault" ->
          r_set_as_default :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SetAsDefault"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
     policy_document = Smaws_Lib.Xml.Parse.required "PolicyDocument" (( ! ) r_policy_document) i;
     set_as_default = ( ! ) r_set_as_default;
   }
    : create_policy_version_request)

let create_policy_response_of_xml i =
  let r_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Policy" ] (fun tag _ ->
      match tag with
      | "Policy" ->
          r_policy :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Policy" (fun i _ -> policy_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy = ( ! ) r_policy } : create_policy_response)

let create_policy_request_of_xml i =
  let r_policy_name = ref None in
  let r_path = ref None in
  let r_policy_document = ref None in
  let r_description = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PolicyName"; "Path"; "PolicyDocument"; "Description"; "Tags" ] (fun tag _ ->
      match tag with
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_type_of_xml i)
                 ())
      | "Path" ->
          r_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> policy_path_type_of_xml i) ())
      | "PolicyDocument" ->
          r_policy_document :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyDocument"
                 (fun i _ -> policy_document_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> policy_description_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     path = ( ! ) r_path;
     policy_document = Smaws_Lib.Xml.Parse.required "PolicyDocument" (( ! ) r_policy_document) i;
     description = ( ! ) r_description;
     tags = ( ! ) r_tags;
   }
    : create_policy_request)

let open_id_idp_communication_error_exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let open_id_idp_communication_error_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> open_id_idp_communication_error_exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : open_id_idp_communication_error_exception)

let create_open_id_connect_provider_response_of_xml i =
  let r_open_id_connect_provider_arn = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OpenIDConnectProviderArn"; "Tags" ] (fun tag _ ->
      match tag with
      | "OpenIDConnectProviderArn" ->
          r_open_id_connect_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OpenIDConnectProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ open_id_connect_provider_arn = ( ! ) r_open_id_connect_provider_arn; tags = ( ! ) r_tags }
    : create_open_id_connect_provider_response)

let create_open_id_connect_provider_request_of_xml i =
  let r_url = ref None in
  let r_client_id_list = ref None in
  let r_thumbprint_list = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Url"; "ClientIDList"; "ThumbprintList"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "Url" ->
          r_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Url"
                 (fun i _ -> open_id_connect_provider_url_type_of_xml i)
                 ())
      | "ClientIDList" ->
          r_client_id_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientIDList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> client_id_type_of_xml i)
                     ())
                 ())
      | "ThumbprintList" ->
          r_thumbprint_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ThumbprintList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> thumbprint_type_of_xml i)
                     ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     url = Smaws_Lib.Xml.Parse.required "Url" (( ! ) r_url) i;
     client_id_list = ( ! ) r_client_id_list;
     thumbprint_list = ( ! ) r_thumbprint_list;
     tags = ( ! ) r_tags;
   }
    : create_open_id_connect_provider_request)

let create_login_profile_response_of_xml i =
  let r_login_profile = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoginProfile" ] (fun tag _ ->
      match tag with
      | "LoginProfile" ->
          r_login_profile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoginProfile"
                 (fun i _ -> login_profile_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ login_profile = Smaws_Lib.Xml.Parse.required "LoginProfile" (( ! ) r_login_profile) i }
    : create_login_profile_response)

let create_login_profile_request_of_xml i =
  let r_user_name = ref None in
  let r_password = ref None in
  let r_password_reset_required = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "Password"; "PasswordResetRequired" ]
    (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "Password" ->
          r_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Password"
                 (fun i _ -> password_type_of_xml i)
                 ())
      | "PasswordResetRequired" ->
          r_password_reset_required :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PasswordResetRequired"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = ( ! ) r_user_name;
     password = ( ! ) r_password;
     password_reset_required = ( ! ) r_password_reset_required;
   }
    : create_login_profile_request)

let create_instance_profile_response_of_xml i =
  let r_instance_profile = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfile" ] (fun tag _ ->
      match tag with
      | "InstanceProfile" ->
          r_instance_profile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfile"
                 (fun i _ -> instance_profile_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profile = Smaws_Lib.Xml.Parse.required "InstanceProfile" (( ! ) r_instance_profile) i;
   }
    : create_instance_profile_response)

let create_instance_profile_request_of_xml i =
  let r_instance_profile_name = ref None in
  let r_path = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfileName"; "Path"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "InstanceProfileName" ->
          r_instance_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfileName"
                 (fun i _ -> instance_profile_name_type_of_xml i)
                 ())
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profile_name =
       Smaws_Lib.Xml.Parse.required "InstanceProfileName" (( ! ) r_instance_profile_name) i;
     path = ( ! ) r_path;
     tags = ( ! ) r_tags;
   }
    : create_instance_profile_request)

let create_group_response_of_xml i =
  let r_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Group" ] (fun tag _ ->
      match tag with
      | "Group" ->
          r_group :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Group" (fun i _ -> group_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ group = Smaws_Lib.Xml.Parse.required "Group" (( ! ) r_group) i } : create_group_response)

let create_group_request_of_xml i =
  let r_path = ref None in
  let r_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Path"; "GroupName" ] (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Path" (fun i _ -> path_type_of_xml i) ())
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     path = ( ! ) r_path;
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
   }
    : create_group_request)

let console_deep_link_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let create_delegation_request_response_of_xml i =
  let r_console_deep_link = ref None in
  let r_delegation_request_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConsoleDeepLink"; "DelegationRequestId" ]
    (fun tag _ ->
      match tag with
      | "ConsoleDeepLink" ->
          r_console_deep_link :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsoleDeepLink"
                 (fun i _ -> console_deep_link_type_of_xml i)
                 ())
      | "DelegationRequestId" ->
          r_delegation_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DelegationRequestId"
                 (fun i _ -> delegation_request_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     console_deep_link = ( ! ) r_console_deep_link;
     delegation_request_id = ( ! ) r_delegation_request_id;
   }
    : create_delegation_request_response)

let notification_channel_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let requestor_workflow_id_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let create_delegation_request_request_of_xml i =
  let r_owner_account_id = ref None in
  let r_description = ref None in
  let r_permissions = ref None in
  let r_request_message = ref None in
  let r_requestor_workflow_id = ref None in
  let r_redirect_url = ref None in
  let r_notification_channel = ref None in
  let r_session_duration = ref None in
  let r_only_send_by_owner = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OwnerAccountId";
      "Description";
      "Permissions";
      "RequestMessage";
      "RequestorWorkflowId";
      "RedirectUrl";
      "NotificationChannel";
      "SessionDuration";
      "OnlySendByOwner";
    ] (fun tag _ ->
      match tag with
      | "OwnerAccountId" ->
          r_owner_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerAccountId"
                 (fun i _ -> account_id_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> delegation_request_description_type_of_xml i)
                 ())
      | "Permissions" ->
          r_permissions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Permissions"
                 (fun i _ -> delegation_permission_of_xml i)
                 ())
      | "RequestMessage" ->
          r_request_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestMessage"
                 (fun i _ -> request_message_type_of_xml i)
                 ())
      | "RequestorWorkflowId" ->
          r_requestor_workflow_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestorWorkflowId"
                 (fun i _ -> requestor_workflow_id_type_of_xml i)
                 ())
      | "RedirectUrl" ->
          r_redirect_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedirectUrl"
                 (fun i _ -> redirect_url_type_of_xml i)
                 ())
      | "NotificationChannel" ->
          r_notification_channel :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationChannel"
                 (fun i _ -> notification_channel_type_of_xml i)
                 ())
      | "SessionDuration" ->
          r_session_duration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SessionDuration"
                 (fun i _ -> session_duration_type_of_xml i)
                 ())
      | "OnlySendByOwner" ->
          r_only_send_by_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnlySendByOwner"
                 (fun i _ -> boolean_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     owner_account_id = ( ! ) r_owner_account_id;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     permissions = Smaws_Lib.Xml.Parse.required "Permissions" (( ! ) r_permissions) i;
     request_message = ( ! ) r_request_message;
     requestor_workflow_id =
       Smaws_Lib.Xml.Parse.required "RequestorWorkflowId" (( ! ) r_requestor_workflow_id) i;
     redirect_url = ( ! ) r_redirect_url;
     notification_channel =
       Smaws_Lib.Xml.Parse.required "NotificationChannel" (( ! ) r_notification_channel) i;
     session_duration = Smaws_Lib.Xml.Parse.required "SessionDuration" (( ! ) r_session_duration) i;
     only_send_by_owner = ( ! ) r_only_send_by_owner;
   }
    : create_delegation_request_request)

let create_account_alias_request_of_xml i =
  let r_account_alias = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccountAlias" ] (fun tag _ ->
      match tag with
      | "AccountAlias" ->
          r_account_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountAlias"
                 (fun i _ -> account_alias_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ account_alias = Smaws_Lib.Xml.Parse.required "AccountAlias" (( ! ) r_account_alias) i }
    : create_account_alias_request)

let access_key_secret_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let access_key_of_xml i =
  let r_user_name = ref None in
  let r_access_key_id = ref None in
  let r_status = ref None in
  let r_secret_access_key = ref None in
  let r_create_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UserName"; "AccessKeyId"; "Status"; "SecretAccessKey"; "CreateDate" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "AccessKeyId" ->
          r_access_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKeyId"
                 (fun i _ -> access_key_id_type_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> status_type_of_xml i) ())
      | "SecretAccessKey" ->
          r_secret_access_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecretAccessKey"
                 (fun i _ -> access_key_secret_type_of_xml i)
                 ())
      | "CreateDate" ->
          r_create_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreateDate" (fun i _ -> date_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     access_key_id = Smaws_Lib.Xml.Parse.required "AccessKeyId" (( ! ) r_access_key_id) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     secret_access_key =
       Smaws_Lib.Xml.Parse.required "SecretAccessKey" (( ! ) r_secret_access_key) i;
     create_date = ( ! ) r_create_date;
   }
    : access_key)

let create_access_key_response_of_xml i =
  let r_access_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccessKey" ] (fun tag _ ->
      match tag with
      | "AccessKey" ->
          r_access_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessKey" (fun i _ -> access_key_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ access_key = Smaws_Lib.Xml.Parse.required "AccessKey" (( ! ) r_access_key) i }
    : create_access_key_response)

let create_access_key_request_of_xml i =
  let r_user_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_name = ( ! ) r_user_name } : create_access_key_request)

let invalid_user_type_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let invalid_user_type_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> invalid_user_type_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_user_type_exception)

let change_password_request_of_xml i =
  let r_old_password = ref None in
  let r_new_password = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OldPassword"; "NewPassword" ] (fun tag _ ->
      match tag with
      | "OldPassword" ->
          r_old_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OldPassword"
                 (fun i _ -> password_type_of_xml i)
                 ())
      | "NewPassword" ->
          r_new_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewPassword"
                 (fun i _ -> password_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     old_password = Smaws_Lib.Xml.Parse.required "OldPassword" (( ! ) r_old_password) i;
     new_password = Smaws_Lib.Xml.Parse.required "NewPassword" (( ! ) r_new_password) i;
   }
    : change_password_request)

let attach_user_policy_request_of_xml i =
  let r_user_name = ref None in
  let r_policy_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserName"; "PolicyArn" ] (fun tag _ ->
      match tag with
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> user_name_type_of_xml i)
                 ())
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
   }
    : attach_user_policy_request)

let attach_role_policy_request_of_xml i =
  let r_role_name = ref None in
  let r_policy_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleName"; "PolicyArn" ] (fun tag _ ->
      match tag with
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
   }
    : attach_role_policy_request)

let attach_group_policy_request_of_xml i =
  let r_group_name = ref None in
  let r_policy_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "PolicyArn" ] (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "PolicyArn" ->
          r_policy_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyArn" (fun i _ -> arn_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     policy_arn = Smaws_Lib.Xml.Parse.required "PolicyArn" (( ! ) r_policy_arn) i;
   }
    : attach_group_policy_request)

let associate_delegation_request_request_of_xml i =
  let r_delegation_request_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DelegationRequestId" ] (fun tag _ ->
      match tag with
      | "DelegationRequestId" ->
          r_delegation_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DelegationRequestId"
                 (fun i _ -> delegation_request_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delegation_request_id =
       Smaws_Lib.Xml.Parse.required "DelegationRequestId" (( ! ) r_delegation_request_id) i;
   }
    : associate_delegation_request_request)

let add_user_to_group_request_of_xml i =
  let r_group_name = ref None in
  let r_user_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "UserName" ] (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> group_name_type_of_xml i)
                 ())
      | "UserName" ->
          r_user_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserName"
                 (fun i _ -> existing_user_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     group_name = Smaws_Lib.Xml.Parse.required "GroupName" (( ! ) r_group_name) i;
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
   }
    : add_user_to_group_request)

let add_role_to_instance_profile_request_of_xml i =
  let r_instance_profile_name = ref None in
  let r_role_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceProfileName"; "RoleName" ] (fun tag _ ->
      match tag with
      | "InstanceProfileName" ->
          r_instance_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProfileName"
                 (fun i _ -> instance_profile_name_type_of_xml i)
                 ())
      | "RoleName" ->
          r_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RoleName"
                 (fun i _ -> role_name_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_profile_name =
       Smaws_Lib.Xml.Parse.required "InstanceProfileName" (( ! ) r_instance_profile_name) i;
     role_name = Smaws_Lib.Xml.Parse.required "RoleName" (( ! ) r_role_name) i;
   }
    : add_role_to_instance_profile_request)

let add_client_id_to_open_id_connect_provider_request_of_xml i =
  let r_open_id_connect_provider_arn = ref None in
  let r_client_i_d = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OpenIDConnectProviderArn"; "ClientID" ]
    (fun tag _ ->
      match tag with
      | "OpenIDConnectProviderArn" ->
          r_open_id_connect_provider_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OpenIDConnectProviderArn"
                 (fun i _ -> arn_type_of_xml i)
                 ())
      | "ClientID" ->
          r_client_i_d :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientID"
                 (fun i _ -> client_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     open_id_connect_provider_arn =
       Smaws_Lib.Xml.Parse.required "OpenIDConnectProviderArn"
         (( ! ) r_open_id_connect_provider_arn)
         i;
     client_i_d = Smaws_Lib.Xml.Parse.required "ClientID" (( ! ) r_client_i_d) i;
   }
    : add_client_id_to_open_id_connect_provider_request)

let accept_delegation_request_request_of_xml i =
  let r_delegation_request_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DelegationRequestId" ] (fun tag _ ->
      match tag with
      | "DelegationRequestId" ->
          r_delegation_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DelegationRequestId"
                 (fun i _ -> delegation_request_id_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delegation_request_id =
       Smaws_Lib.Xml.Parse.required "DelegationRequestId" (( ! ) r_delegation_request_id) i;
   }
    : accept_delegation_request_request)
