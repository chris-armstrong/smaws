open Types

let unit_of_xml _ = ()
let error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let error_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let validation_exception_of_xml i =
  let r_code = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Code"; "Message" ] (fun tag _ ->
      match tag with
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ code = ( ! ) r_code; message = ( ! ) r_message } : validation_exception)

let resource_not_found_exception_of_xml i =
  let r_code = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Code"; "Message" ] (fun tag _ ->
      match tag with
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ code = ( ! ) r_code; message = ( ! ) r_message } : resource_not_found_exception)

let limit_exceeded_exception_of_xml i =
  let r_code = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Code"; "Message" ] (fun tag _ ->
      match tag with
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ code = ( ! ) r_code; message = ( ! ) r_message } : limit_exceeded_exception)

let invalid_type_exception_of_xml i =
  let r_code = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Code"; "Message" ] (fun tag _ ->
      match tag with
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ code = ( ! ) r_code; message = ( ! ) r_message } : invalid_type_exception)

let internal_exception_of_xml i =
  let r_code = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Code"; "Message" ] (fun tag _ ->
      match tag with
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ code = ( ! ) r_code; message = ( ! ) r_message } : internal_exception)

let base_exception_of_xml i =
  let r_code = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Code"; "Message" ] (fun tag _ ->
      match tag with
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ code = ( ! ) r_code; message = ( ! ) r_message } : base_exception)

let boolean__of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let option_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "RequiresIndexDocuments" -> RequiresIndexDocuments
   | "Processing" -> Processing
   | "Active" -> Active
   | "FailedToValidate" -> FailedToValidate
   | _ -> failwith "unknown enum value"
    : option_state)

let u_int_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let update_timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let option_status_of_xml i =
  let r_creation_date = ref None in
  let r_update_date = ref None in
  let r_update_version = ref None in
  let r_state = ref None in
  let r_pending_deletion = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CreationDate"; "UpdateDate"; "UpdateVersion"; "State"; "PendingDeletion" ] (fun tag _ ->
      match tag with
      | "CreationDate" ->
          r_creation_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationDate"
                 (fun i _ -> update_timestamp_of_xml i)
                 ())
      | "UpdateDate" ->
          r_update_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateDate"
                 (fun i _ -> update_timestamp_of_xml i)
                 ())
      | "UpdateVersion" ->
          r_update_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateVersion"
                 (fun i _ -> u_int_value_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "State" (fun i _ -> option_state_of_xml i) ())
      | "PendingDeletion" ->
          r_pending_deletion :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingDeletion"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     creation_date = Smaws_Lib.Xml.Parse.required "CreationDate" (( ! ) r_creation_date) i;
     update_date = Smaws_Lib.Xml.Parse.required "UpdateDate" (( ! ) r_update_date) i;
     update_version = ( ! ) r_update_version;
     state = Smaws_Lib.Xml.Parse.required "State" (( ! ) r_state) i;
     pending_deletion = ( ! ) r_pending_deletion;
   }
    : option_status)

let policy_document_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let access_policies_status_of_xml i =
  let r_options = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Options"; "Status" ] (fun tag _ ->
      match tag with
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ -> policy_document_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : access_policies_status)

let update_service_access_policies_response_of_xml i =
  let r_access_policies = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccessPolicies" ] (fun tag _ ->
      match tag with
      | "AccessPolicies" ->
          r_access_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessPolicies"
                 (fun i _ -> access_policies_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ access_policies = Smaws_Lib.Xml.Parse.required "AccessPolicies" (( ! ) r_access_policies) i }
    : update_service_access_policies_response)

let domain_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_service_access_policies_request_of_xml i =
  let r_domain_name = ref None in
  let r_access_policies = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "AccessPolicies" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "AccessPolicies" ->
          r_access_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessPolicies"
                 (fun i _ -> policy_document_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     access_policies = Smaws_Lib.Xml.Parse.required "AccessPolicies" (( ! ) r_access_policies) i;
   }
    : update_service_access_policies_request)

let partition_instance_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "search.m1.small" -> Search_m1_small
   | "search.m1.large" -> Search_m1_large
   | "search.m2.xlarge" -> Search_m2_xlarge
   | "search.m2.2xlarge" -> Search_m2_2xlarge
   | "search.m3.medium" -> Search_m3_medium
   | "search.m3.large" -> Search_m3_large
   | "search.m3.xlarge" -> Search_m3_xlarge
   | "search.m3.2xlarge" -> Search_m3_2xlarge
   | "search.small" -> Search_small
   | "search.medium" -> Search_medium
   | "search.large" -> Search_large
   | "search.xlarge" -> Search_xlarge
   | "search.2xlarge" -> Search_2xlarge
   | "search.previousgeneration.small" -> Search_previousgeneration_small
   | "search.previousgeneration.large" -> Search_previousgeneration_large
   | "search.previousgeneration.xlarge" -> Search_previousgeneration_xlarge
   | "search.previousgeneration.2xlarge" -> Search_previousgeneration_2xlarge
   | _ -> failwith "unknown enum value"
    : partition_instance_type)

let scaling_parameters_of_xml i =
  let r_desired_instance_type = ref None in
  let r_desired_replication_count = ref None in
  let r_desired_partition_count = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DesiredInstanceType"; "DesiredReplicationCount"; "DesiredPartitionCount" ] (fun tag _ ->
      match tag with
      | "DesiredInstanceType" ->
          r_desired_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredInstanceType"
                 (fun i _ -> partition_instance_type_of_xml i)
                 ())
      | "DesiredReplicationCount" ->
          r_desired_replication_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredReplicationCount"
                 (fun i _ -> u_int_value_of_xml i)
                 ())
      | "DesiredPartitionCount" ->
          r_desired_partition_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredPartitionCount"
                 (fun i _ -> u_int_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     desired_instance_type = ( ! ) r_desired_instance_type;
     desired_replication_count = ( ! ) r_desired_replication_count;
     desired_partition_count = ( ! ) r_desired_partition_count;
   }
    : scaling_parameters)

let scaling_parameters_status_of_xml i =
  let r_options = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Options"; "Status" ] (fun tag _ ->
      match tag with
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ -> scaling_parameters_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : scaling_parameters_status)

let update_scaling_parameters_response_of_xml i =
  let r_scaling_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScalingParameters" ] (fun tag _ ->
      match tag with
      | "ScalingParameters" ->
          r_scaling_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingParameters"
                 (fun i _ -> scaling_parameters_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scaling_parameters =
       Smaws_Lib.Xml.Parse.required "ScalingParameters" (( ! ) r_scaling_parameters) i;
   }
    : update_scaling_parameters_response)

let update_scaling_parameters_request_of_xml i =
  let r_domain_name = ref None in
  let r_scaling_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "ScalingParameters" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "ScalingParameters" ->
          r_scaling_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingParameters"
                 (fun i _ -> scaling_parameters_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     scaling_parameters =
       Smaws_Lib.Xml.Parse.required "ScalingParameters" (( ! ) r_scaling_parameters) i;
   }
    : update_scaling_parameters_request)

let disabled_operation_exception_of_xml i =
  let r_code = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Code"; "Message" ] (fun tag _ ->
      match tag with
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ code = ( ! ) r_code; message = ( ! ) r_message } : disabled_operation_exception)

let tls_security_policy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Policy-Min-TLS-1-0-2019-07" -> POLICY_MIN_TLS_1_0_2019_07
   | "Policy-Min-TLS-1-2-2019-07" -> POLICY_MIN_TLS_1_2_2019_07
   | _ -> failwith "unknown enum value"
    : tls_security_policy)

let domain_endpoint_options_of_xml i =
  let r_enforce_http_s = ref None in
  let r_tls_security_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnforceHTTPS"; "TLSSecurityPolicy" ] (fun tag _ ->
      match tag with
      | "EnforceHTTPS" ->
          r_enforce_http_s :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnforceHTTPS" (fun i _ -> boolean__of_xml i) ())
      | "TLSSecurityPolicy" ->
          r_tls_security_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TLSSecurityPolicy"
                 (fun i _ -> tls_security_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ enforce_http_s = ( ! ) r_enforce_http_s; tls_security_policy = ( ! ) r_tls_security_policy }
    : domain_endpoint_options)

let domain_endpoint_options_status_of_xml i =
  let r_options = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Options"; "Status" ] (fun tag _ ->
      match tag with
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ -> domain_endpoint_options_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : domain_endpoint_options_status)

let update_domain_endpoint_options_response_of_xml i =
  let r_domain_endpoint_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainEndpointOptions" ] (fun tag _ ->
      match tag with
      | "DomainEndpointOptions" ->
          r_domain_endpoint_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainEndpointOptions"
                 (fun i _ -> domain_endpoint_options_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain_endpoint_options = ( ! ) r_domain_endpoint_options }
    : update_domain_endpoint_options_response)

let update_domain_endpoint_options_request_of_xml i =
  let r_domain_name = ref None in
  let r_domain_endpoint_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "DomainEndpointOptions" ]
    (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "DomainEndpointOptions" ->
          r_domain_endpoint_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainEndpointOptions"
                 (fun i _ -> domain_endpoint_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     domain_endpoint_options =
       Smaws_Lib.Xml.Parse.required "DomainEndpointOptions" (( ! ) r_domain_endpoint_options) i;
   }
    : update_domain_endpoint_options_request)

let multi_a_z_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let availability_options_status_of_xml i =
  let r_options = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Options"; "Status" ] (fun tag _ ->
      match tag with
      | "Options" ->
          r_options :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Options" (fun i _ -> multi_a_z_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : availability_options_status)

let update_availability_options_response_of_xml i =
  let r_availability_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AvailabilityOptions" ] (fun tag _ ->
      match tag with
      | "AvailabilityOptions" ->
          r_availability_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityOptions"
                 (fun i _ -> availability_options_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ availability_options = ( ! ) r_availability_options } : update_availability_options_response)

let update_availability_options_request_of_xml i =
  let r_domain_name = ref None in
  let r_multi_a_z = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "MultiAZ" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     multi_a_z = Smaws_Lib.Xml.Parse.required "MultiAZ" (( ! ) r_multi_a_z) i;
   }
    : update_availability_options_request)

let api_version_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let domain_name_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> domain_name_of_xml i) () in
      let v = Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> api_version_of_xml i) () in
      (k, v))
    ()

let list_domain_names_response_of_xml i =
  let r_domain_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainNames" ] (fun tag _ ->
      match tag with
      | "DomainNames" ->
          r_domain_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> domain_name_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> api_version_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain_names = ( ! ) r_domain_names } : list_domain_names_response)

let field_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let field_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> field_name_of_xml i) ()

let index_documents_response_of_xml i =
  let r_field_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FieldNames" ] (fun tag _ ->
      match tag with
      | "FieldNames" ->
          r_field_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FieldNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> field_name_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ field_names = ( ! ) r_field_names } : index_documents_response)

let index_documents_request_of_xml i =
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i }
    : index_documents_request)

let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let suggester_fuzzy_matching_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "none" -> None_
   | "low" -> Low
   | "high" -> High
   | _ -> failwith "unknown enum value"
    : suggester_fuzzy_matching)

let document_suggester_options_of_xml i =
  let r_source_field = ref None in
  let r_fuzzy_matching = ref None in
  let r_sort_expression = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SourceField"; "FuzzyMatching"; "SortExpression" ]
    (fun tag _ ->
      match tag with
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "FuzzyMatching" ->
          r_fuzzy_matching :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FuzzyMatching"
                 (fun i _ -> suggester_fuzzy_matching_of_xml i)
                 ())
      | "SortExpression" ->
          r_sort_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortExpression"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_field = Smaws_Lib.Xml.Parse.required "SourceField" (( ! ) r_source_field) i;
     fuzzy_matching = ( ! ) r_fuzzy_matching;
     sort_expression = ( ! ) r_sort_expression;
   }
    : document_suggester_options)

let standard_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let suggester_of_xml i =
  let r_suggester_name = ref None in
  let r_document_suggester_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SuggesterName"; "DocumentSuggesterOptions" ]
    (fun tag _ ->
      match tag with
      | "SuggesterName" ->
          r_suggester_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuggesterName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | "DocumentSuggesterOptions" ->
          r_document_suggester_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DocumentSuggesterOptions"
                 (fun i _ -> document_suggester_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     suggester_name = Smaws_Lib.Xml.Parse.required "SuggesterName" (( ! ) r_suggester_name) i;
     document_suggester_options =
       Smaws_Lib.Xml.Parse.required "DocumentSuggesterOptions"
         (( ! ) r_document_suggester_options)
         i;
   }
    : suggester)

let suggester_status_of_xml i =
  let r_options = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Options"; "Status" ] (fun tag _ ->
      match tag with
      | "Options" ->
          r_options :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Options" (fun i _ -> suggester_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : suggester_status)

let suggester_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> suggester_status_of_xml i) ()

let describe_suggesters_response_of_xml i =
  let r_suggesters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Suggesters" ] (fun tag _ ->
      match tag with
      | "Suggesters" ->
          r_suggesters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Suggesters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> suggester_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ suggesters = Smaws_Lib.Xml.Parse.required "Suggesters" (( ! ) r_suggesters) i }
    : describe_suggesters_response)

let standard_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> standard_name_of_xml i) ()

let describe_suggesters_request_of_xml i =
  let r_domain_name = ref None in
  let r_suggester_names = ref None in
  let r_deployed = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "SuggesterNames"; "Deployed" ]
    (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "SuggesterNames" ->
          r_suggester_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuggesterNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> standard_name_of_xml i)
                     ())
                 ())
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     suggester_names = ( ! ) r_suggester_names;
     deployed = ( ! ) r_deployed;
   }
    : describe_suggesters_request)

let describe_service_access_policies_response_of_xml i =
  let r_access_policies = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccessPolicies" ] (fun tag _ ->
      match tag with
      | "AccessPolicies" ->
          r_access_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessPolicies"
                 (fun i _ -> access_policies_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ access_policies = Smaws_Lib.Xml.Parse.required "AccessPolicies" (( ! ) r_access_policies) i }
    : describe_service_access_policies_response)

let describe_service_access_policies_request_of_xml i =
  let r_domain_name = ref None in
  let r_deployed = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "Deployed" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     deployed = ( ! ) r_deployed;
   }
    : describe_service_access_policies_request)

let describe_scaling_parameters_response_of_xml i =
  let r_scaling_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScalingParameters" ] (fun tag _ ->
      match tag with
      | "ScalingParameters" ->
          r_scaling_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingParameters"
                 (fun i _ -> scaling_parameters_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scaling_parameters =
       Smaws_Lib.Xml.Parse.required "ScalingParameters" (( ! ) r_scaling_parameters) i;
   }
    : describe_scaling_parameters_response)

let describe_scaling_parameters_request_of_xml i =
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i }
    : describe_scaling_parameters_request)

let field_name_comma_list_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let field_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let date_array_options_of_xml i =
  let r_default_value = ref None in
  let r_source_fields = ref None in
  let r_facet_enabled = ref None in
  let r_search_enabled = ref None in
  let r_return_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DefaultValue"; "SourceFields"; "FacetEnabled"; "SearchEnabled"; "ReturnEnabled" ]
    (fun tag _ ->
      match tag with
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | "SourceFields" ->
          r_source_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceFields"
                 (fun i _ -> field_name_comma_list_of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_value = ( ! ) r_default_value;
     source_fields = ( ! ) r_source_fields;
     facet_enabled = ( ! ) r_facet_enabled;
     search_enabled = ( ! ) r_search_enabled;
     return_enabled = ( ! ) r_return_enabled;
   }
    : date_array_options)

let word_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let text_array_options_of_xml i =
  let r_default_value = ref None in
  let r_source_fields = ref None in
  let r_return_enabled = ref None in
  let r_highlight_enabled = ref None in
  let r_analysis_scheme = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DefaultValue"; "SourceFields"; "ReturnEnabled"; "HighlightEnabled"; "AnalysisScheme" ]
    (fun tag _ ->
      match tag with
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | "SourceFields" ->
          r_source_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceFields"
                 (fun i _ -> field_name_comma_list_of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "HighlightEnabled" ->
          r_highlight_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HighlightEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "AnalysisScheme" ->
          r_analysis_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisScheme" (fun i _ -> word_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_value = ( ! ) r_default_value;
     source_fields = ( ! ) r_source_fields;
     return_enabled = ( ! ) r_return_enabled;
     highlight_enabled = ( ! ) r_highlight_enabled;
     analysis_scheme = ( ! ) r_analysis_scheme;
   }
    : text_array_options)

let literal_array_options_of_xml i =
  let r_default_value = ref None in
  let r_source_fields = ref None in
  let r_facet_enabled = ref None in
  let r_search_enabled = ref None in
  let r_return_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DefaultValue"; "SourceFields"; "FacetEnabled"; "SearchEnabled"; "ReturnEnabled" ]
    (fun tag _ ->
      match tag with
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | "SourceFields" ->
          r_source_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceFields"
                 (fun i _ -> field_name_comma_list_of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_value = ( ! ) r_default_value;
     source_fields = ( ! ) r_source_fields;
     facet_enabled = ( ! ) r_facet_enabled;
     search_enabled = ( ! ) r_search_enabled;
     return_enabled = ( ! ) r_return_enabled;
   }
    : literal_array_options)

let double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let double_array_options_of_xml i =
  let r_default_value = ref None in
  let r_source_fields = ref None in
  let r_facet_enabled = ref None in
  let r_search_enabled = ref None in
  let r_return_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DefaultValue"; "SourceFields"; "FacetEnabled"; "SearchEnabled"; "ReturnEnabled" ]
    (fun tag _ ->
      match tag with
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue" (fun i _ -> double_of_xml i) ())
      | "SourceFields" ->
          r_source_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceFields"
                 (fun i _ -> field_name_comma_list_of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_value = ( ! ) r_default_value;
     source_fields = ( ! ) r_source_fields;
     facet_enabled = ( ! ) r_facet_enabled;
     search_enabled = ( ! ) r_search_enabled;
     return_enabled = ( ! ) r_return_enabled;
   }
    : double_array_options)

let long_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let int_array_options_of_xml i =
  let r_default_value = ref None in
  let r_source_fields = ref None in
  let r_facet_enabled = ref None in
  let r_search_enabled = ref None in
  let r_return_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DefaultValue"; "SourceFields"; "FacetEnabled"; "SearchEnabled"; "ReturnEnabled" ]
    (fun tag _ ->
      match tag with
      | "DefaultValue" ->
          r_default_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue" (fun i _ -> long_of_xml i) ())
      | "SourceFields" ->
          r_source_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceFields"
                 (fun i _ -> field_name_comma_list_of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_value = ( ! ) r_default_value;
     source_fields = ( ! ) r_source_fields;
     facet_enabled = ( ! ) r_facet_enabled;
     search_enabled = ( ! ) r_search_enabled;
     return_enabled = ( ! ) r_return_enabled;
   }
    : int_array_options)

let lat_lon_options_of_xml i =
  let r_default_value = ref None in
  let r_source_field = ref None in
  let r_facet_enabled = ref None in
  let r_search_enabled = ref None in
  let r_return_enabled = ref None in
  let r_sort_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DefaultValue"; "SourceField"; "FacetEnabled"; "SearchEnabled"; "ReturnEnabled"; "SortEnabled";
    ] (fun tag _ ->
      match tag with
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_value = ( ! ) r_default_value;
     source_field = ( ! ) r_source_field;
     facet_enabled = ( ! ) r_facet_enabled;
     search_enabled = ( ! ) r_search_enabled;
     return_enabled = ( ! ) r_return_enabled;
     sort_enabled = ( ! ) r_sort_enabled;
   }
    : lat_lon_options)

let date_options_of_xml i =
  let r_default_value = ref None in
  let r_source_field = ref None in
  let r_facet_enabled = ref None in
  let r_search_enabled = ref None in
  let r_return_enabled = ref None in
  let r_sort_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DefaultValue"; "SourceField"; "FacetEnabled"; "SearchEnabled"; "ReturnEnabled"; "SortEnabled";
    ] (fun tag _ ->
      match tag with
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_value = ( ! ) r_default_value;
     source_field = ( ! ) r_source_field;
     facet_enabled = ( ! ) r_facet_enabled;
     search_enabled = ( ! ) r_search_enabled;
     return_enabled = ( ! ) r_return_enabled;
     sort_enabled = ( ! ) r_sort_enabled;
   }
    : date_options)

let text_options_of_xml i =
  let r_default_value = ref None in
  let r_source_field = ref None in
  let r_return_enabled = ref None in
  let r_sort_enabled = ref None in
  let r_highlight_enabled = ref None in
  let r_analysis_scheme = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DefaultValue";
      "SourceField";
      "ReturnEnabled";
      "SortEnabled";
      "HighlightEnabled";
      "AnalysisScheme";
    ] (fun tag _ ->
      match tag with
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | "HighlightEnabled" ->
          r_highlight_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HighlightEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "AnalysisScheme" ->
          r_analysis_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisScheme" (fun i _ -> word_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_value = ( ! ) r_default_value;
     source_field = ( ! ) r_source_field;
     return_enabled = ( ! ) r_return_enabled;
     sort_enabled = ( ! ) r_sort_enabled;
     highlight_enabled = ( ! ) r_highlight_enabled;
     analysis_scheme = ( ! ) r_analysis_scheme;
   }
    : text_options)

let literal_options_of_xml i =
  let r_default_value = ref None in
  let r_source_field = ref None in
  let r_facet_enabled = ref None in
  let r_search_enabled = ref None in
  let r_return_enabled = ref None in
  let r_sort_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DefaultValue"; "SourceField"; "FacetEnabled"; "SearchEnabled"; "ReturnEnabled"; "SortEnabled";
    ] (fun tag _ ->
      match tag with
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_value = ( ! ) r_default_value;
     source_field = ( ! ) r_source_field;
     facet_enabled = ( ! ) r_facet_enabled;
     search_enabled = ( ! ) r_search_enabled;
     return_enabled = ( ! ) r_return_enabled;
     sort_enabled = ( ! ) r_sort_enabled;
   }
    : literal_options)

let double_options_of_xml i =
  let r_default_value = ref None in
  let r_source_field = ref None in
  let r_facet_enabled = ref None in
  let r_search_enabled = ref None in
  let r_return_enabled = ref None in
  let r_sort_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DefaultValue"; "SourceField"; "FacetEnabled"; "SearchEnabled"; "ReturnEnabled"; "SortEnabled";
    ] (fun tag _ ->
      match tag with
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue" (fun i _ -> double_of_xml i) ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_value = ( ! ) r_default_value;
     source_field = ( ! ) r_source_field;
     facet_enabled = ( ! ) r_facet_enabled;
     search_enabled = ( ! ) r_search_enabled;
     return_enabled = ( ! ) r_return_enabled;
     sort_enabled = ( ! ) r_sort_enabled;
   }
    : double_options)

let int_options_of_xml i =
  let r_default_value = ref None in
  let r_source_field = ref None in
  let r_facet_enabled = ref None in
  let r_search_enabled = ref None in
  let r_return_enabled = ref None in
  let r_sort_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DefaultValue"; "SourceField"; "FacetEnabled"; "SearchEnabled"; "ReturnEnabled"; "SortEnabled";
    ] (fun tag _ ->
      match tag with
      | "DefaultValue" ->
          r_default_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue" (fun i _ -> long_of_xml i) ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_value = ( ! ) r_default_value;
     source_field = ( ! ) r_source_field;
     facet_enabled = ( ! ) r_facet_enabled;
     search_enabled = ( ! ) r_search_enabled;
     return_enabled = ( ! ) r_return_enabled;
     sort_enabled = ( ! ) r_sort_enabled;
   }
    : int_options)

let index_field_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "int" -> Int
   | "double" -> Double
   | "literal" -> Literal
   | "text" -> Text
   | "date" -> Date
   | "latlon" -> Latlon
   | "int-array" -> Int_array
   | "double-array" -> Double_array
   | "literal-array" -> Literal_array
   | "text-array" -> Text_array
   | "date-array" -> Date_array
   | _ -> failwith "unknown enum value"
    : index_field_type)

let dynamic_field_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let index_field_of_xml i =
  let r_index_field_name = ref None in
  let r_index_field_type = ref None in
  let r_int_options = ref None in
  let r_double_options = ref None in
  let r_literal_options = ref None in
  let r_text_options = ref None in
  let r_date_options = ref None in
  let r_lat_lon_options = ref None in
  let r_int_array_options = ref None in
  let r_double_array_options = ref None in
  let r_literal_array_options = ref None in
  let r_text_array_options = ref None in
  let r_date_array_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "IndexFieldName";
      "IndexFieldType";
      "IntOptions";
      "DoubleOptions";
      "LiteralOptions";
      "TextOptions";
      "DateOptions";
      "LatLonOptions";
      "IntArrayOptions";
      "DoubleArrayOptions";
      "LiteralArrayOptions";
      "TextArrayOptions";
      "DateArrayOptions";
    ] (fun tag _ ->
      match tag with
      | "IndexFieldName" ->
          r_index_field_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IndexFieldName"
                 (fun i _ -> dynamic_field_name_of_xml i)
                 ())
      | "IndexFieldType" ->
          r_index_field_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IndexFieldType"
                 (fun i _ -> index_field_type_of_xml i)
                 ())
      | "IntOptions" ->
          r_int_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntOptions"
                 (fun i _ -> int_options_of_xml i)
                 ())
      | "DoubleOptions" ->
          r_double_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DoubleOptions"
                 (fun i _ -> double_options_of_xml i)
                 ())
      | "LiteralOptions" ->
          r_literal_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LiteralOptions"
                 (fun i _ -> literal_options_of_xml i)
                 ())
      | "TextOptions" ->
          r_text_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TextOptions"
                 (fun i _ -> text_options_of_xml i)
                 ())
      | "DateOptions" ->
          r_date_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateOptions"
                 (fun i _ -> date_options_of_xml i)
                 ())
      | "LatLonOptions" ->
          r_lat_lon_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LatLonOptions"
                 (fun i _ -> lat_lon_options_of_xml i)
                 ())
      | "IntArrayOptions" ->
          r_int_array_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntArrayOptions"
                 (fun i _ -> int_array_options_of_xml i)
                 ())
      | "DoubleArrayOptions" ->
          r_double_array_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DoubleArrayOptions"
                 (fun i _ -> double_array_options_of_xml i)
                 ())
      | "LiteralArrayOptions" ->
          r_literal_array_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LiteralArrayOptions"
                 (fun i _ -> literal_array_options_of_xml i)
                 ())
      | "TextArrayOptions" ->
          r_text_array_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TextArrayOptions"
                 (fun i _ -> text_array_options_of_xml i)
                 ())
      | "DateArrayOptions" ->
          r_date_array_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateArrayOptions"
                 (fun i _ -> date_array_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     index_field_name = Smaws_Lib.Xml.Parse.required "IndexFieldName" (( ! ) r_index_field_name) i;
     index_field_type = Smaws_Lib.Xml.Parse.required "IndexFieldType" (( ! ) r_index_field_type) i;
     int_options = ( ! ) r_int_options;
     double_options = ( ! ) r_double_options;
     literal_options = ( ! ) r_literal_options;
     text_options = ( ! ) r_text_options;
     date_options = ( ! ) r_date_options;
     lat_lon_options = ( ! ) r_lat_lon_options;
     int_array_options = ( ! ) r_int_array_options;
     double_array_options = ( ! ) r_double_array_options;
     literal_array_options = ( ! ) r_literal_array_options;
     text_array_options = ( ! ) r_text_array_options;
     date_array_options = ( ! ) r_date_array_options;
   }
    : index_field)

let index_field_status_of_xml i =
  let r_options = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Options"; "Status" ] (fun tag _ ->
      match tag with
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options" (fun i _ -> index_field_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : index_field_status)

let index_field_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> index_field_status_of_xml i) ()

let describe_index_fields_response_of_xml i =
  let r_index_fields = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IndexFields" ] (fun tag _ ->
      match tag with
      | "IndexFields" ->
          r_index_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IndexFields"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> index_field_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ index_fields = Smaws_Lib.Xml.Parse.required "IndexFields" (( ! ) r_index_fields) i }
    : describe_index_fields_response)

let dynamic_field_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dynamic_field_name_of_xml i) ()

let describe_index_fields_request_of_xml i =
  let r_domain_name = ref None in
  let r_field_names = ref None in
  let r_deployed = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "FieldNames"; "Deployed" ]
    (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "FieldNames" ->
          r_field_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FieldNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> dynamic_field_name_of_xml i)
                     ())
                 ())
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     field_names = ( ! ) r_field_names;
     deployed = ( ! ) r_deployed;
   }
    : describe_index_fields_request)

let expression_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let expression_of_xml i =
  let r_expression_name = ref None in
  let r_expression_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ExpressionName"; "ExpressionValue" ] (fun tag _ ->
      match tag with
      | "ExpressionName" ->
          r_expression_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpressionName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | "ExpressionValue" ->
          r_expression_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpressionValue"
                 (fun i _ -> expression_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     expression_name = Smaws_Lib.Xml.Parse.required "ExpressionName" (( ! ) r_expression_name) i;
     expression_value = Smaws_Lib.Xml.Parse.required "ExpressionValue" (( ! ) r_expression_value) i;
   }
    : expression)

let expression_status_of_xml i =
  let r_options = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Options"; "Status" ] (fun tag _ ->
      match tag with
      | "Options" ->
          r_options :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Options" (fun i _ -> expression_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : expression_status)

let expression_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> expression_status_of_xml i) ()

let describe_expressions_response_of_xml i =
  let r_expressions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Expressions" ] (fun tag _ ->
      match tag with
      | "Expressions" ->
          r_expressions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expressions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> expression_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ expressions = Smaws_Lib.Xml.Parse.required "Expressions" (( ! ) r_expressions) i }
    : describe_expressions_response)

let describe_expressions_request_of_xml i =
  let r_domain_name = ref None in
  let r_expression_names = ref None in
  let r_deployed = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "ExpressionNames"; "Deployed" ]
    (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "ExpressionNames" ->
          r_expression_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpressionNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> standard_name_of_xml i)
                     ())
                 ())
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     expression_names = ( ! ) r_expression_names;
     deployed = ( ! ) r_deployed;
   }
    : describe_expressions_request)

let maximum_partition_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let maximum_replication_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let limits_of_xml i =
  let r_maximum_replication_count = ref None in
  let r_maximum_partition_count = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaximumReplicationCount"; "MaximumPartitionCount" ] (fun tag _ ->
      match tag with
      | "MaximumReplicationCount" ->
          r_maximum_replication_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaximumReplicationCount"
                 (fun i _ -> maximum_replication_count_of_xml i)
                 ())
      | "MaximumPartitionCount" ->
          r_maximum_partition_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaximumPartitionCount"
                 (fun i _ -> maximum_partition_count_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     maximum_replication_count =
       Smaws_Lib.Xml.Parse.required "MaximumReplicationCount" (( ! ) r_maximum_replication_count) i;
     maximum_partition_count =
       Smaws_Lib.Xml.Parse.required "MaximumPartitionCount" (( ! ) r_maximum_partition_count) i;
   }
    : limits)

let instance_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let partition_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let search_instance_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let service_url_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let service_endpoint_of_xml i =
  let r_endpoint = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Endpoint" ] (fun tag _ ->
      match tag with
      | "Endpoint" ->
          r_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> service_url_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ endpoint = ( ! ) r_endpoint } : service_endpoint)

let ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let domain_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let domain_status_of_xml i =
  let r_domain_id = ref None in
  let r_domain_name = ref None in
  let r_ar_n = ref None in
  let r_created = ref None in
  let r_deleted = ref None in
  let r_doc_service = ref None in
  let r_search_service = ref None in
  let r_requires_index_documents = ref None in
  let r_processing = ref None in
  let r_search_instance_type = ref None in
  let r_search_partition_count = ref None in
  let r_search_instance_count = ref None in
  let r_limits = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DomainId";
      "DomainName";
      "ARN";
      "Created";
      "Deleted";
      "DocService";
      "SearchService";
      "RequiresIndexDocuments";
      "Processing";
      "SearchInstanceType";
      "SearchPartitionCount";
      "SearchInstanceCount";
      "Limits";
    ] (fun tag _ ->
      match tag with
      | "DomainId" ->
          r_domain_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DomainId" (fun i _ -> domain_id_of_xml i) ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "ARN" ->
          r_ar_n := Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> ar_n_of_xml i) ())
      | "Created" ->
          r_created :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Created" (fun i _ -> boolean__of_xml i) ())
      | "Deleted" ->
          r_deleted :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deleted" (fun i _ -> boolean__of_xml i) ())
      | "DocService" ->
          r_doc_service :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DocService"
                 (fun i _ -> service_endpoint_of_xml i)
                 ())
      | "SearchService" ->
          r_search_service :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchService"
                 (fun i _ -> service_endpoint_of_xml i)
                 ())
      | "RequiresIndexDocuments" ->
          r_requires_index_documents :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequiresIndexDocuments"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "Processing" ->
          r_processing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Processing" (fun i _ -> boolean__of_xml i) ())
      | "SearchInstanceType" ->
          r_search_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchInstanceType"
                 (fun i _ -> search_instance_type_of_xml i)
                 ())
      | "SearchPartitionCount" ->
          r_search_partition_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchPartitionCount"
                 (fun i _ -> partition_count_of_xml i)
                 ())
      | "SearchInstanceCount" ->
          r_search_instance_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchInstanceCount"
                 (fun i _ -> instance_count_of_xml i)
                 ())
      | "Limits" ->
          r_limits :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Limits" (fun i _ -> limits_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_id = Smaws_Lib.Xml.Parse.required "DomainId" (( ! ) r_domain_id) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     ar_n = ( ! ) r_ar_n;
     created = ( ! ) r_created;
     deleted = ( ! ) r_deleted;
     doc_service = ( ! ) r_doc_service;
     search_service = ( ! ) r_search_service;
     requires_index_documents =
       Smaws_Lib.Xml.Parse.required "RequiresIndexDocuments" (( ! ) r_requires_index_documents) i;
     processing = ( ! ) r_processing;
     search_instance_type = ( ! ) r_search_instance_type;
     search_partition_count = ( ! ) r_search_partition_count;
     search_instance_count = ( ! ) r_search_instance_count;
     limits = ( ! ) r_limits;
   }
    : domain_status)

let domain_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> domain_status_of_xml i) ()

let describe_domains_response_of_xml i =
  let r_domain_status_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainStatusList" ] (fun tag _ ->
      match tag with
      | "DomainStatusList" ->
          r_domain_status_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainStatusList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> domain_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_status_list =
       Smaws_Lib.Xml.Parse.required "DomainStatusList" (( ! ) r_domain_status_list) i;
   }
    : describe_domains_response)

let domain_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> domain_name_of_xml i) ()

let describe_domains_request_of_xml i =
  let r_domain_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainNames" ] (fun tag _ ->
      match tag with
      | "DomainNames" ->
          r_domain_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> domain_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain_names = ( ! ) r_domain_names } : describe_domains_request)

let describe_domain_endpoint_options_response_of_xml i =
  let r_domain_endpoint_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainEndpointOptions" ] (fun tag _ ->
      match tag with
      | "DomainEndpointOptions" ->
          r_domain_endpoint_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainEndpointOptions"
                 (fun i _ -> domain_endpoint_options_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain_endpoint_options = ( ! ) r_domain_endpoint_options }
    : describe_domain_endpoint_options_response)

let describe_domain_endpoint_options_request_of_xml i =
  let r_domain_name = ref None in
  let r_deployed = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "Deployed" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     deployed = ( ! ) r_deployed;
   }
    : describe_domain_endpoint_options_request)

let describe_availability_options_response_of_xml i =
  let r_availability_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AvailabilityOptions" ] (fun tag _ ->
      match tag with
      | "AvailabilityOptions" ->
          r_availability_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityOptions"
                 (fun i _ -> availability_options_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ availability_options = ( ! ) r_availability_options } : describe_availability_options_response)

let describe_availability_options_request_of_xml i =
  let r_domain_name = ref None in
  let r_deployed = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "Deployed" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     deployed = ( ! ) r_deployed;
   }
    : describe_availability_options_request)

let algorithmic_stemming_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "none" -> None_
   | "minimal" -> Minimal
   | "light" -> Light
   | "full" -> Full
   | _ -> failwith "unknown enum value"
    : algorithmic_stemming)

let analysis_options_of_xml i =
  let r_synonyms = ref None in
  let r_stopwords = ref None in
  let r_stemming_dictionary = ref None in
  let r_japanese_tokenization_dictionary = ref None in
  let r_algorithmic_stemming = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Synonyms";
      "Stopwords";
      "StemmingDictionary";
      "JapaneseTokenizationDictionary";
      "AlgorithmicStemming";
    ] (fun tag _ ->
      match tag with
      | "Synonyms" ->
          r_synonyms :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Synonyms" (fun i _ -> string__of_xml i) ())
      | "Stopwords" ->
          r_stopwords :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Stopwords" (fun i _ -> string__of_xml i) ())
      | "StemmingDictionary" ->
          r_stemming_dictionary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StemmingDictionary"
                 (fun i _ -> string__of_xml i)
                 ())
      | "JapaneseTokenizationDictionary" ->
          r_japanese_tokenization_dictionary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JapaneseTokenizationDictionary"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AlgorithmicStemming" ->
          r_algorithmic_stemming :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlgorithmicStemming"
                 (fun i _ -> algorithmic_stemming_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     synonyms = ( ! ) r_synonyms;
     stopwords = ( ! ) r_stopwords;
     stemming_dictionary = ( ! ) r_stemming_dictionary;
     japanese_tokenization_dictionary = ( ! ) r_japanese_tokenization_dictionary;
     algorithmic_stemming = ( ! ) r_algorithmic_stemming;
   }
    : analysis_options)

let analysis_scheme_language_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ar" -> Ar
   | "bg" -> Bg
   | "ca" -> Ca
   | "cs" -> Cs
   | "da" -> Da
   | "de" -> De
   | "el" -> El
   | "en" -> En
   | "es" -> Es
   | "eu" -> Eu
   | "fa" -> Fa
   | "fi" -> Fi
   | "fr" -> Fr
   | "ga" -> Ga
   | "gl" -> Gl
   | "he" -> He
   | "hi" -> Hi
   | "hu" -> Hu
   | "hy" -> Hy
   | "id" -> Id
   | "it" -> It
   | "ja" -> Ja
   | "ko" -> Ko
   | "lv" -> Lv
   | "mul" -> Mul
   | "nl" -> Nl
   | "no" -> No
   | "pt" -> Pt
   | "ro" -> Ro
   | "ru" -> Ru
   | "sv" -> Sv
   | "th" -> Th
   | "tr" -> Tr
   | "zh-Hans" -> Zh_Hans
   | "zh-Hant" -> Zh_Hant
   | _ -> failwith "unknown enum value"
    : analysis_scheme_language)

let analysis_scheme_of_xml i =
  let r_analysis_scheme_name = ref None in
  let r_analysis_scheme_language = ref None in
  let r_analysis_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AnalysisSchemeName"; "AnalysisSchemeLanguage"; "AnalysisOptions" ] (fun tag _ ->
      match tag with
      | "AnalysisSchemeName" ->
          r_analysis_scheme_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisSchemeName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | "AnalysisSchemeLanguage" ->
          r_analysis_scheme_language :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisSchemeLanguage"
                 (fun i _ -> analysis_scheme_language_of_xml i)
                 ())
      | "AnalysisOptions" ->
          r_analysis_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisOptions"
                 (fun i _ -> analysis_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     analysis_scheme_name =
       Smaws_Lib.Xml.Parse.required "AnalysisSchemeName" (( ! ) r_analysis_scheme_name) i;
     analysis_scheme_language =
       Smaws_Lib.Xml.Parse.required "AnalysisSchemeLanguage" (( ! ) r_analysis_scheme_language) i;
     analysis_options = ( ! ) r_analysis_options;
   }
    : analysis_scheme)

let analysis_scheme_status_of_xml i =
  let r_options = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Options"; "Status" ] (fun tag _ ->
      match tag with
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ -> analysis_scheme_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : analysis_scheme_status)

let analysis_scheme_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> analysis_scheme_status_of_xml i) ()

let describe_analysis_schemes_response_of_xml i =
  let r_analysis_schemes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AnalysisSchemes" ] (fun tag _ ->
      match tag with
      | "AnalysisSchemes" ->
          r_analysis_schemes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisSchemes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> analysis_scheme_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     analysis_schemes = Smaws_Lib.Xml.Parse.required "AnalysisSchemes" (( ! ) r_analysis_schemes) i;
   }
    : describe_analysis_schemes_response)

let describe_analysis_schemes_request_of_xml i =
  let r_domain_name = ref None in
  let r_analysis_scheme_names = ref None in
  let r_deployed = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "AnalysisSchemeNames"; "Deployed" ]
    (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "AnalysisSchemeNames" ->
          r_analysis_scheme_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisSchemeNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> standard_name_of_xml i)
                     ())
                 ())
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     analysis_scheme_names = ( ! ) r_analysis_scheme_names;
     deployed = ( ! ) r_deployed;
   }
    : describe_analysis_schemes_request)

let delete_suggester_response_of_xml i =
  let r_suggester = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Suggester" ] (fun tag _ ->
      match tag with
      | "Suggester" ->
          r_suggester :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Suggester"
                 (fun i _ -> suggester_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ suggester = Smaws_Lib.Xml.Parse.required "Suggester" (( ! ) r_suggester) i }
    : delete_suggester_response)

let delete_suggester_request_of_xml i =
  let r_domain_name = ref None in
  let r_suggester_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "SuggesterName" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "SuggesterName" ->
          r_suggester_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuggesterName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     suggester_name = Smaws_Lib.Xml.Parse.required "SuggesterName" (( ! ) r_suggester_name) i;
   }
    : delete_suggester_request)

let delete_index_field_response_of_xml i =
  let r_index_field = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IndexField" ] (fun tag _ ->
      match tag with
      | "IndexField" ->
          r_index_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IndexField"
                 (fun i _ -> index_field_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ index_field = Smaws_Lib.Xml.Parse.required "IndexField" (( ! ) r_index_field) i }
    : delete_index_field_response)

let delete_index_field_request_of_xml i =
  let r_domain_name = ref None in
  let r_index_field_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "IndexFieldName" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "IndexFieldName" ->
          r_index_field_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IndexFieldName"
                 (fun i _ -> dynamic_field_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     index_field_name = Smaws_Lib.Xml.Parse.required "IndexFieldName" (( ! ) r_index_field_name) i;
   }
    : delete_index_field_request)

let delete_expression_response_of_xml i =
  let r_expression = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Expression" ] (fun tag _ ->
      match tag with
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression"
                 (fun i _ -> expression_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ expression = Smaws_Lib.Xml.Parse.required "Expression" (( ! ) r_expression) i }
    : delete_expression_response)

let delete_expression_request_of_xml i =
  let r_domain_name = ref None in
  let r_expression_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "ExpressionName" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "ExpressionName" ->
          r_expression_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpressionName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     expression_name = Smaws_Lib.Xml.Parse.required "ExpressionName" (( ! ) r_expression_name) i;
   }
    : delete_expression_request)

let delete_domain_response_of_xml i =
  let r_domain_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainStatus" ] (fun tag _ ->
      match tag with
      | "DomainStatus" ->
          r_domain_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainStatus"
                 (fun i _ -> domain_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain_status = ( ! ) r_domain_status } : delete_domain_response)

let delete_domain_request_of_xml i =
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i }
    : delete_domain_request)

let delete_analysis_scheme_response_of_xml i =
  let r_analysis_scheme = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AnalysisScheme" ] (fun tag _ ->
      match tag with
      | "AnalysisScheme" ->
          r_analysis_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisScheme"
                 (fun i _ -> analysis_scheme_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ analysis_scheme = Smaws_Lib.Xml.Parse.required "AnalysisScheme" (( ! ) r_analysis_scheme) i }
    : delete_analysis_scheme_response)

let delete_analysis_scheme_request_of_xml i =
  let r_domain_name = ref None in
  let r_analysis_scheme_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "AnalysisSchemeName" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "AnalysisSchemeName" ->
          r_analysis_scheme_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisSchemeName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     analysis_scheme_name =
       Smaws_Lib.Xml.Parse.required "AnalysisSchemeName" (( ! ) r_analysis_scheme_name) i;
   }
    : delete_analysis_scheme_request)

let define_suggester_response_of_xml i =
  let r_suggester = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Suggester" ] (fun tag _ ->
      match tag with
      | "Suggester" ->
          r_suggester :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Suggester"
                 (fun i _ -> suggester_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ suggester = Smaws_Lib.Xml.Parse.required "Suggester" (( ! ) r_suggester) i }
    : define_suggester_response)

let define_suggester_request_of_xml i =
  let r_domain_name = ref None in
  let r_suggester = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "Suggester" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "Suggester" ->
          r_suggester :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Suggester" (fun i _ -> suggester_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     suggester = Smaws_Lib.Xml.Parse.required "Suggester" (( ! ) r_suggester) i;
   }
    : define_suggester_request)

let define_index_field_response_of_xml i =
  let r_index_field = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IndexField" ] (fun tag _ ->
      match tag with
      | "IndexField" ->
          r_index_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IndexField"
                 (fun i _ -> index_field_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ index_field = Smaws_Lib.Xml.Parse.required "IndexField" (( ! ) r_index_field) i }
    : define_index_field_response)

let define_index_field_request_of_xml i =
  let r_domain_name = ref None in
  let r_index_field = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "IndexField" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "IndexField" ->
          r_index_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IndexField"
                 (fun i _ -> index_field_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     index_field = Smaws_Lib.Xml.Parse.required "IndexField" (( ! ) r_index_field) i;
   }
    : define_index_field_request)

let define_expression_response_of_xml i =
  let r_expression = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Expression" ] (fun tag _ ->
      match tag with
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression"
                 (fun i _ -> expression_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ expression = Smaws_Lib.Xml.Parse.required "Expression" (( ! ) r_expression) i }
    : define_expression_response)

let define_expression_request_of_xml i =
  let r_domain_name = ref None in
  let r_expression = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "Expression" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression" (fun i _ -> expression_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     expression = Smaws_Lib.Xml.Parse.required "Expression" (( ! ) r_expression) i;
   }
    : define_expression_request)

let define_analysis_scheme_response_of_xml i =
  let r_analysis_scheme = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AnalysisScheme" ] (fun tag _ ->
      match tag with
      | "AnalysisScheme" ->
          r_analysis_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisScheme"
                 (fun i _ -> analysis_scheme_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ analysis_scheme = Smaws_Lib.Xml.Parse.required "AnalysisScheme" (( ! ) r_analysis_scheme) i }
    : define_analysis_scheme_response)

let define_analysis_scheme_request_of_xml i =
  let r_domain_name = ref None in
  let r_analysis_scheme = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName"; "AnalysisScheme" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "AnalysisScheme" ->
          r_analysis_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisScheme"
                 (fun i _ -> analysis_scheme_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     analysis_scheme = Smaws_Lib.Xml.Parse.required "AnalysisScheme" (( ! ) r_analysis_scheme) i;
   }
    : define_analysis_scheme_request)

let resource_already_exists_exception_of_xml i =
  let r_code = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Code"; "Message" ] (fun tag _ ->
      match tag with
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ code = ( ! ) r_code; message = ( ! ) r_message } : resource_already_exists_exception)

let create_domain_response_of_xml i =
  let r_domain_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainStatus" ] (fun tag _ ->
      match tag with
      | "DomainStatus" ->
          r_domain_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainStatus"
                 (fun i _ -> domain_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain_status = ( ! ) r_domain_status } : create_domain_response)

let create_domain_request_of_xml i =
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i }
    : create_domain_request)

let build_suggesters_response_of_xml i =
  let r_field_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FieldNames" ] (fun tag _ ->
      match tag with
      | "FieldNames" ->
          r_field_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FieldNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> field_name_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ field_names = ( ! ) r_field_names } : build_suggesters_response)

let build_suggesters_request_of_xml i =
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainName" ] (fun tag _ ->
      match tag with
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i }
    : build_suggesters_request)
