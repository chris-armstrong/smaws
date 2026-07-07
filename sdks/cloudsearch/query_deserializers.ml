open Types

let unit_of_xml _ = ()
let word_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let error_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let validation_exception_of_xml i =
  let r_message = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "Code" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; code = ( ! ) r_code } : validation_exception)

let update_timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let policy_document_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let u_int_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let option_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "FailedToValidate" -> FailedToValidate
   | "Active" -> Active
   | "Processing" -> Processing
   | "RequiresIndexDocuments" -> RequiresIndexDocuments
   | _ -> failwith "unknown enum value"
    : option_state)

let boolean__of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let option_status_of_xml i =
  let r_pending_deletion = ref None in
  let r_state = ref None in
  let r_update_version = ref None in
  let r_update_date = ref None in
  let r_creation_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PendingDeletion"; "State"; "UpdateVersion"; "UpdateDate"; "CreationDate" ] (fun tag _ ->
      match tag with
      | "PendingDeletion" ->
          r_pending_deletion :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingDeletion"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "State" (fun i _ -> option_state_of_xml i) ())
      | "UpdateVersion" ->
          r_update_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateVersion"
                 (fun i _ -> u_int_value_of_xml i)
                 ())
      | "UpdateDate" ->
          r_update_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateDate"
                 (fun i _ -> update_timestamp_of_xml i)
                 ())
      | "CreationDate" ->
          r_creation_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationDate"
                 (fun i _ -> update_timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     pending_deletion = ( ! ) r_pending_deletion;
     state = Smaws_Lib.Xml.Parse.required "State" (( ! ) r_state) i;
     update_version = ( ! ) r_update_version;
     update_date = Smaws_Lib.Xml.Parse.required "UpdateDate" (( ! ) r_update_date) i;
     creation_date = Smaws_Lib.Xml.Parse.required "CreationDate" (( ! ) r_creation_date) i;
   }
    : option_status)

let access_policies_status_of_xml i =
  let r_status = ref None in
  let r_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "Options" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ -> policy_document_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
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
  let r_access_policies = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccessPolicies"; "DomainName" ] (fun tag _ ->
      match tag with
      | "AccessPolicies" ->
          r_access_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessPolicies"
                 (fun i _ -> policy_document_of_xml i)
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     access_policies = Smaws_Lib.Xml.Parse.required "AccessPolicies" (( ! ) r_access_policies) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
   }
    : update_service_access_policies_request)

let resource_not_found_exception_of_xml i =
  let r_message = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "Code" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; code = ( ! ) r_code } : resource_not_found_exception)

let limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "Code" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; code = ( ! ) r_code } : limit_exceeded_exception)

let invalid_type_exception_of_xml i =
  let r_message = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "Code" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; code = ( ! ) r_code } : invalid_type_exception)

let internal_exception_of_xml i =
  let r_message = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "Code" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; code = ( ! ) r_code } : internal_exception)

let base_exception_of_xml i =
  let r_message = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "Code" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; code = ( ! ) r_code } : base_exception)

let partition_instance_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "search.previousgeneration.2xlarge" -> Search_previousgeneration_2xlarge
   | "search.previousgeneration.xlarge" -> Search_previousgeneration_xlarge
   | "search.previousgeneration.large" -> Search_previousgeneration_large
   | "search.previousgeneration.small" -> Search_previousgeneration_small
   | "search.2xlarge" -> Search_2xlarge
   | "search.xlarge" -> Search_xlarge
   | "search.large" -> Search_large
   | "search.medium" -> Search_medium
   | "search.small" -> Search_small
   | "search.m3.2xlarge" -> Search_m3_2xlarge
   | "search.m3.xlarge" -> Search_m3_xlarge
   | "search.m3.large" -> Search_m3_large
   | "search.m3.medium" -> Search_m3_medium
   | "search.m2.2xlarge" -> Search_m2_2xlarge
   | "search.m2.xlarge" -> Search_m2_xlarge
   | "search.m1.large" -> Search_m1_large
   | "search.m1.small" -> Search_m1_small
   | _ -> failwith "unknown enum value"
    : partition_instance_type)

let scaling_parameters_of_xml i =
  let r_desired_partition_count = ref None in
  let r_desired_replication_count = ref None in
  let r_desired_instance_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DesiredPartitionCount"; "DesiredReplicationCount"; "DesiredInstanceType" ] (fun tag _ ->
      match tag with
      | "DesiredPartitionCount" ->
          r_desired_partition_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredPartitionCount"
                 (fun i _ -> u_int_value_of_xml i)
                 ())
      | "DesiredReplicationCount" ->
          r_desired_replication_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredReplicationCount"
                 (fun i _ -> u_int_value_of_xml i)
                 ())
      | "DesiredInstanceType" ->
          r_desired_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DesiredInstanceType"
                 (fun i _ -> partition_instance_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     desired_partition_count = ( ! ) r_desired_partition_count;
     desired_replication_count = ( ! ) r_desired_replication_count;
     desired_instance_type = ( ! ) r_desired_instance_type;
   }
    : scaling_parameters)

let scaling_parameters_status_of_xml i =
  let r_status = ref None in
  let r_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "Options" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ -> scaling_parameters_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
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
  let r_scaling_parameters = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScalingParameters"; "DomainName" ] (fun tag _ ->
      match tag with
      | "ScalingParameters" ->
          r_scaling_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalingParameters"
                 (fun i _ -> scaling_parameters_of_xml i)
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scaling_parameters =
       Smaws_Lib.Xml.Parse.required "ScalingParameters" (( ! ) r_scaling_parameters) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
   }
    : update_scaling_parameters_request)

let tls_security_policy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Policy-Min-TLS-1-2-2019-07" -> POLICY_MIN_TLS_1_2_2019_07
   | "Policy-Min-TLS-1-0-2019-07" -> POLICY_MIN_TLS_1_0_2019_07
   | _ -> failwith "unknown enum value"
    : tls_security_policy)

let domain_endpoint_options_of_xml i =
  let r_tls_security_policy = ref None in
  let r_enforce_http_s = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TLSSecurityPolicy"; "EnforceHTTPS" ] (fun tag _ ->
      match tag with
      | "TLSSecurityPolicy" ->
          r_tls_security_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TLSSecurityPolicy"
                 (fun i _ -> tls_security_policy_of_xml i)
                 ())
      | "EnforceHTTPS" ->
          r_enforce_http_s :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnforceHTTPS" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tls_security_policy = ( ! ) r_tls_security_policy; enforce_http_s = ( ! ) r_enforce_http_s }
    : domain_endpoint_options)

let domain_endpoint_options_status_of_xml i =
  let r_status = ref None in
  let r_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "Options" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ -> domain_endpoint_options_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
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
  let r_domain_endpoint_options = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DomainEndpointOptions"; "DomainName" ]
    (fun tag _ ->
      match tag with
      | "DomainEndpointOptions" ->
          r_domain_endpoint_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainEndpointOptions"
                 (fun i _ -> domain_endpoint_options_of_xml i)
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     domain_endpoint_options =
       Smaws_Lib.Xml.Parse.required "DomainEndpointOptions" (( ! ) r_domain_endpoint_options) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
   }
    : update_domain_endpoint_options_request)

let disabled_operation_exception_of_xml i =
  let r_message = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "Code" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; code = ( ! ) r_code } : disabled_operation_exception)

let multi_a_z_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let availability_options_status_of_xml i =
  let r_status = ref None in
  let r_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "Options" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | "Options" ->
          r_options :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Options" (fun i _ -> multi_a_z_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
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
  let r_multi_a_z = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MultiAZ"; "DomainName" ] (fun tag _ ->
      match tag with
      | "MultiAZ" ->
          r_multi_a_z :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ" (fun i _ -> boolean__of_xml i) ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     multi_a_z = Smaws_Lib.Xml.Parse.required "MultiAZ" (( ! ) r_multi_a_z) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
   }
    : update_availability_options_request)

let field_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let field_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let text_options_of_xml i =
  let r_analysis_scheme = ref None in
  let r_highlight_enabled = ref None in
  let r_sort_enabled = ref None in
  let r_return_enabled = ref None in
  let r_source_field = ref None in
  let r_default_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AnalysisScheme";
      "HighlightEnabled";
      "SortEnabled";
      "ReturnEnabled";
      "SourceField";
      "DefaultValue";
    ] (fun tag _ ->
      match tag with
      | "AnalysisScheme" ->
          r_analysis_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisScheme" (fun i _ -> word_of_xml i) ())
      | "HighlightEnabled" ->
          r_highlight_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HighlightEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     analysis_scheme = ( ! ) r_analysis_scheme;
     highlight_enabled = ( ! ) r_highlight_enabled;
     sort_enabled = ( ! ) r_sort_enabled;
     return_enabled = ( ! ) r_return_enabled;
     source_field = ( ! ) r_source_field;
     default_value = ( ! ) r_default_value;
   }
    : text_options)

let field_name_comma_list_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let text_array_options_of_xml i =
  let r_analysis_scheme = ref None in
  let r_highlight_enabled = ref None in
  let r_return_enabled = ref None in
  let r_source_fields = ref None in
  let r_default_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AnalysisScheme"; "HighlightEnabled"; "ReturnEnabled"; "SourceFields"; "DefaultValue" ]
    (fun tag _ ->
      match tag with
      | "AnalysisScheme" ->
          r_analysis_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisScheme" (fun i _ -> word_of_xml i) ())
      | "HighlightEnabled" ->
          r_highlight_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HighlightEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SourceFields" ->
          r_source_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceFields"
                 (fun i _ -> field_name_comma_list_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     analysis_scheme = ( ! ) r_analysis_scheme;
     highlight_enabled = ( ! ) r_highlight_enabled;
     return_enabled = ( ! ) r_return_enabled;
     source_fields = ( ! ) r_source_fields;
     default_value = ( ! ) r_default_value;
   }
    : text_array_options)

let standard_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let suggester_fuzzy_matching_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "high" -> High
   | "low" -> Low
   | "none" -> None_
   | _ -> failwith "unknown enum value"
    : suggester_fuzzy_matching)

let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let document_suggester_options_of_xml i =
  let r_sort_expression = ref None in
  let r_fuzzy_matching = ref None in
  let r_source_field = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SortExpression"; "FuzzyMatching"; "SourceField" ]
    (fun tag _ ->
      match tag with
      | "SortExpression" ->
          r_sort_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortExpression"
                 (fun i _ -> string__of_xml i)
                 ())
      | "FuzzyMatching" ->
          r_fuzzy_matching :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FuzzyMatching"
                 (fun i _ -> suggester_fuzzy_matching_of_xml i)
                 ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sort_expression = ( ! ) r_sort_expression;
     fuzzy_matching = ( ! ) r_fuzzy_matching;
     source_field = Smaws_Lib.Xml.Parse.required "SourceField" (( ! ) r_source_field) i;
   }
    : document_suggester_options)

let suggester_of_xml i =
  let r_document_suggester_options = ref None in
  let r_suggester_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DocumentSuggesterOptions"; "SuggesterName" ]
    (fun tag _ ->
      match tag with
      | "DocumentSuggesterOptions" ->
          r_document_suggester_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DocumentSuggesterOptions"
                 (fun i _ -> document_suggester_options_of_xml i)
                 ())
      | "SuggesterName" ->
          r_suggester_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuggesterName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     document_suggester_options =
       Smaws_Lib.Xml.Parse.required "DocumentSuggesterOptions"
         (( ! ) r_document_suggester_options)
         i;
     suggester_name = Smaws_Lib.Xml.Parse.required "SuggesterName" (( ! ) r_suggester_name) i;
   }
    : suggester)

let suggester_status_of_xml i =
  let r_status = ref None in
  let r_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "Options" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | "Options" ->
          r_options :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Options" (fun i _ -> suggester_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
   }
    : suggester_status)

let suggester_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> suggester_status_of_xml i) ()

let standard_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> standard_name_of_xml i) ()

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

let search_instance_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_already_exists_exception_of_xml i =
  let r_message = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "Code" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> error_code_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message; code = ( ! ) r_code } : resource_already_exists_exception)

let partition_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let maximum_replication_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let maximum_partition_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let long_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let literal_options_of_xml i =
  let r_sort_enabled = ref None in
  let r_return_enabled = ref None in
  let r_search_enabled = ref None in
  let r_facet_enabled = ref None in
  let r_source_field = ref None in
  let r_default_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SortEnabled"; "ReturnEnabled"; "SearchEnabled"; "FacetEnabled"; "SourceField"; "DefaultValue";
    ] (fun tag _ ->
      match tag with
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sort_enabled = ( ! ) r_sort_enabled;
     return_enabled = ( ! ) r_return_enabled;
     search_enabled = ( ! ) r_search_enabled;
     facet_enabled = ( ! ) r_facet_enabled;
     source_field = ( ! ) r_source_field;
     default_value = ( ! ) r_default_value;
   }
    : literal_options)

let literal_array_options_of_xml i =
  let r_return_enabled = ref None in
  let r_search_enabled = ref None in
  let r_facet_enabled = ref None in
  let r_source_fields = ref None in
  let r_default_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReturnEnabled"; "SearchEnabled"; "FacetEnabled"; "SourceFields"; "DefaultValue" ]
    (fun tag _ ->
      match tag with
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SourceFields" ->
          r_source_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceFields"
                 (fun i _ -> field_name_comma_list_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     return_enabled = ( ! ) r_return_enabled;
     search_enabled = ( ! ) r_search_enabled;
     facet_enabled = ( ! ) r_facet_enabled;
     source_fields = ( ! ) r_source_fields;
     default_value = ( ! ) r_default_value;
   }
    : literal_array_options)

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

let limits_of_xml i =
  let r_maximum_partition_count = ref None in
  let r_maximum_replication_count = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaximumPartitionCount"; "MaximumReplicationCount" ] (fun tag _ ->
      match tag with
      | "MaximumPartitionCount" ->
          r_maximum_partition_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaximumPartitionCount"
                 (fun i _ -> maximum_partition_count_of_xml i)
                 ())
      | "MaximumReplicationCount" ->
          r_maximum_replication_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaximumReplicationCount"
                 (fun i _ -> maximum_replication_count_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     maximum_partition_count =
       Smaws_Lib.Xml.Parse.required "MaximumPartitionCount" (( ! ) r_maximum_partition_count) i;
     maximum_replication_count =
       Smaws_Lib.Xml.Parse.required "MaximumReplicationCount" (( ! ) r_maximum_replication_count) i;
   }
    : limits)

let lat_lon_options_of_xml i =
  let r_sort_enabled = ref None in
  let r_return_enabled = ref None in
  let r_search_enabled = ref None in
  let r_facet_enabled = ref None in
  let r_source_field = ref None in
  let r_default_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SortEnabled"; "ReturnEnabled"; "SearchEnabled"; "FacetEnabled"; "SourceField"; "DefaultValue";
    ] (fun tag _ ->
      match tag with
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sort_enabled = ( ! ) r_sort_enabled;
     return_enabled = ( ! ) r_return_enabled;
     search_enabled = ( ! ) r_search_enabled;
     facet_enabled = ( ! ) r_facet_enabled;
     source_field = ( ! ) r_source_field;
     default_value = ( ! ) r_default_value;
   }
    : lat_lon_options)

let int_options_of_xml i =
  let r_sort_enabled = ref None in
  let r_return_enabled = ref None in
  let r_search_enabled = ref None in
  let r_facet_enabled = ref None in
  let r_source_field = ref None in
  let r_default_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SortEnabled"; "ReturnEnabled"; "SearchEnabled"; "FacetEnabled"; "SourceField"; "DefaultValue";
    ] (fun tag _ ->
      match tag with
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue" (fun i _ -> long_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sort_enabled = ( ! ) r_sort_enabled;
     return_enabled = ( ! ) r_return_enabled;
     search_enabled = ( ! ) r_search_enabled;
     facet_enabled = ( ! ) r_facet_enabled;
     source_field = ( ! ) r_source_field;
     default_value = ( ! ) r_default_value;
   }
    : int_options)

let int_array_options_of_xml i =
  let r_return_enabled = ref None in
  let r_search_enabled = ref None in
  let r_facet_enabled = ref None in
  let r_source_fields = ref None in
  let r_default_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReturnEnabled"; "SearchEnabled"; "FacetEnabled"; "SourceFields"; "DefaultValue" ]
    (fun tag _ ->
      match tag with
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SourceFields" ->
          r_source_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceFields"
                 (fun i _ -> field_name_comma_list_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue" (fun i _ -> long_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     return_enabled = ( ! ) r_return_enabled;
     search_enabled = ( ! ) r_search_enabled;
     facet_enabled = ( ! ) r_facet_enabled;
     source_fields = ( ! ) r_source_fields;
     default_value = ( ! ) r_default_value;
   }
    : int_array_options)

let instance_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let index_field_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "date-array" -> Date_array
   | "text-array" -> Text_array
   | "literal-array" -> Literal_array
   | "double-array" -> Double_array
   | "int-array" -> Int_array
   | "latlon" -> Latlon
   | "date" -> Date
   | "text" -> Text
   | "literal" -> Literal
   | "double" -> Double
   | "int" -> Int
   | _ -> failwith "unknown enum value"
    : index_field_type)

let dynamic_field_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let double_options_of_xml i =
  let r_sort_enabled = ref None in
  let r_return_enabled = ref None in
  let r_search_enabled = ref None in
  let r_facet_enabled = ref None in
  let r_source_field = ref None in
  let r_default_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SortEnabled"; "ReturnEnabled"; "SearchEnabled"; "FacetEnabled"; "SourceField"; "DefaultValue";
    ] (fun tag _ ->
      match tag with
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue" (fun i _ -> double_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sort_enabled = ( ! ) r_sort_enabled;
     return_enabled = ( ! ) r_return_enabled;
     search_enabled = ( ! ) r_search_enabled;
     facet_enabled = ( ! ) r_facet_enabled;
     source_field = ( ! ) r_source_field;
     default_value = ( ! ) r_default_value;
   }
    : double_options)

let date_options_of_xml i =
  let r_sort_enabled = ref None in
  let r_return_enabled = ref None in
  let r_search_enabled = ref None in
  let r_facet_enabled = ref None in
  let r_source_field = ref None in
  let r_default_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SortEnabled"; "ReturnEnabled"; "SearchEnabled"; "FacetEnabled"; "SourceField"; "DefaultValue";
    ] (fun tag _ ->
      match tag with
      | "SortEnabled" ->
          r_sort_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortEnabled" (fun i _ -> boolean__of_xml i) ())
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SourceField" ->
          r_source_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceField"
                 (fun i _ -> field_name_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sort_enabled = ( ! ) r_sort_enabled;
     return_enabled = ( ! ) r_return_enabled;
     search_enabled = ( ! ) r_search_enabled;
     facet_enabled = ( ! ) r_facet_enabled;
     source_field = ( ! ) r_source_field;
     default_value = ( ! ) r_default_value;
   }
    : date_options)

let double_array_options_of_xml i =
  let r_return_enabled = ref None in
  let r_search_enabled = ref None in
  let r_facet_enabled = ref None in
  let r_source_fields = ref None in
  let r_default_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReturnEnabled"; "SearchEnabled"; "FacetEnabled"; "SourceFields"; "DefaultValue" ]
    (fun tag _ ->
      match tag with
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SourceFields" ->
          r_source_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceFields"
                 (fun i _ -> field_name_comma_list_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue" (fun i _ -> double_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     return_enabled = ( ! ) r_return_enabled;
     search_enabled = ( ! ) r_search_enabled;
     facet_enabled = ( ! ) r_facet_enabled;
     source_fields = ( ! ) r_source_fields;
     default_value = ( ! ) r_default_value;
   }
    : double_array_options)

let date_array_options_of_xml i =
  let r_return_enabled = ref None in
  let r_search_enabled = ref None in
  let r_facet_enabled = ref None in
  let r_source_fields = ref None in
  let r_default_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReturnEnabled"; "SearchEnabled"; "FacetEnabled"; "SourceFields"; "DefaultValue" ]
    (fun tag _ ->
      match tag with
      | "ReturnEnabled" ->
          r_return_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SearchEnabled" ->
          r_search_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "FacetEnabled" ->
          r_facet_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FacetEnabled" (fun i _ -> boolean__of_xml i) ())
      | "SourceFields" ->
          r_source_fields :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceFields"
                 (fun i _ -> field_name_comma_list_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> field_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     return_enabled = ( ! ) r_return_enabled;
     search_enabled = ( ! ) r_search_enabled;
     facet_enabled = ( ! ) r_facet_enabled;
     source_fields = ( ! ) r_source_fields;
     default_value = ( ! ) r_default_value;
   }
    : date_array_options)

let index_field_of_xml i =
  let r_date_array_options = ref None in
  let r_text_array_options = ref None in
  let r_literal_array_options = ref None in
  let r_double_array_options = ref None in
  let r_int_array_options = ref None in
  let r_lat_lon_options = ref None in
  let r_date_options = ref None in
  let r_text_options = ref None in
  let r_literal_options = ref None in
  let r_double_options = ref None in
  let r_int_options = ref None in
  let r_index_field_type = ref None in
  let r_index_field_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DateArrayOptions";
      "TextArrayOptions";
      "LiteralArrayOptions";
      "DoubleArrayOptions";
      "IntArrayOptions";
      "LatLonOptions";
      "DateOptions";
      "TextOptions";
      "LiteralOptions";
      "DoubleOptions";
      "IntOptions";
      "IndexFieldType";
      "IndexFieldName";
    ] (fun tag _ ->
      match tag with
      | "DateArrayOptions" ->
          r_date_array_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateArrayOptions"
                 (fun i _ -> date_array_options_of_xml i)
                 ())
      | "TextArrayOptions" ->
          r_text_array_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TextArrayOptions"
                 (fun i _ -> text_array_options_of_xml i)
                 ())
      | "LiteralArrayOptions" ->
          r_literal_array_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LiteralArrayOptions"
                 (fun i _ -> literal_array_options_of_xml i)
                 ())
      | "DoubleArrayOptions" ->
          r_double_array_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DoubleArrayOptions"
                 (fun i _ -> double_array_options_of_xml i)
                 ())
      | "IntArrayOptions" ->
          r_int_array_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntArrayOptions"
                 (fun i _ -> int_array_options_of_xml i)
                 ())
      | "LatLonOptions" ->
          r_lat_lon_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LatLonOptions"
                 (fun i _ -> lat_lon_options_of_xml i)
                 ())
      | "DateOptions" ->
          r_date_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateOptions"
                 (fun i _ -> date_options_of_xml i)
                 ())
      | "TextOptions" ->
          r_text_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TextOptions"
                 (fun i _ -> text_options_of_xml i)
                 ())
      | "LiteralOptions" ->
          r_literal_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LiteralOptions"
                 (fun i _ -> literal_options_of_xml i)
                 ())
      | "DoubleOptions" ->
          r_double_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DoubleOptions"
                 (fun i _ -> double_options_of_xml i)
                 ())
      | "IntOptions" ->
          r_int_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntOptions"
                 (fun i _ -> int_options_of_xml i)
                 ())
      | "IndexFieldType" ->
          r_index_field_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IndexFieldType"
                 (fun i _ -> index_field_type_of_xml i)
                 ())
      | "IndexFieldName" ->
          r_index_field_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IndexFieldName"
                 (fun i _ -> dynamic_field_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     date_array_options = ( ! ) r_date_array_options;
     text_array_options = ( ! ) r_text_array_options;
     literal_array_options = ( ! ) r_literal_array_options;
     double_array_options = ( ! ) r_double_array_options;
     int_array_options = ( ! ) r_int_array_options;
     lat_lon_options = ( ! ) r_lat_lon_options;
     date_options = ( ! ) r_date_options;
     text_options = ( ! ) r_text_options;
     literal_options = ( ! ) r_literal_options;
     double_options = ( ! ) r_double_options;
     int_options = ( ! ) r_int_options;
     index_field_type = Smaws_Lib.Xml.Parse.required "IndexFieldType" (( ! ) r_index_field_type) i;
     index_field_name = Smaws_Lib.Xml.Parse.required "IndexFieldName" (( ! ) r_index_field_name) i;
   }
    : index_field)

let index_field_status_of_xml i =
  let r_status = ref None in
  let r_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "Options" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options" (fun i _ -> index_field_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
   }
    : index_field_status)

let index_field_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> index_field_status_of_xml i) ()

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

let expression_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let expression_of_xml i =
  let r_expression_value = ref None in
  let r_expression_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ExpressionValue"; "ExpressionName" ] (fun tag _ ->
      match tag with
      | "ExpressionValue" ->
          r_expression_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpressionValue"
                 (fun i _ -> expression_value_of_xml i)
                 ())
      | "ExpressionName" ->
          r_expression_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpressionName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     expression_value = Smaws_Lib.Xml.Parse.required "ExpressionValue" (( ! ) r_expression_value) i;
     expression_name = Smaws_Lib.Xml.Parse.required "ExpressionName" (( ! ) r_expression_name) i;
   }
    : expression)

let expression_status_of_xml i =
  let r_status = ref None in
  let r_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "Options" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | "Options" ->
          r_options :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Options" (fun i _ -> expression_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
   }
    : expression_status)

let expression_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> expression_status_of_xml i) ()

let dynamic_field_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> dynamic_field_name_of_xml i) ()

let domain_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let domain_status_of_xml i =
  let r_limits = ref None in
  let r_search_instance_count = ref None in
  let r_search_partition_count = ref None in
  let r_search_instance_type = ref None in
  let r_processing = ref None in
  let r_requires_index_documents = ref None in
  let r_search_service = ref None in
  let r_doc_service = ref None in
  let r_deleted = ref None in
  let r_created = ref None in
  let r_ar_n = ref None in
  let r_domain_name = ref None in
  let r_domain_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Limits";
      "SearchInstanceCount";
      "SearchPartitionCount";
      "SearchInstanceType";
      "Processing";
      "RequiresIndexDocuments";
      "SearchService";
      "DocService";
      "Deleted";
      "Created";
      "ARN";
      "DomainName";
      "DomainId";
    ] (fun tag _ ->
      match tag with
      | "Limits" ->
          r_limits :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Limits" (fun i _ -> limits_of_xml i) ())
      | "SearchInstanceCount" ->
          r_search_instance_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchInstanceCount"
                 (fun i _ -> instance_count_of_xml i)
                 ())
      | "SearchPartitionCount" ->
          r_search_partition_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchPartitionCount"
                 (fun i _ -> partition_count_of_xml i)
                 ())
      | "SearchInstanceType" ->
          r_search_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchInstanceType"
                 (fun i _ -> search_instance_type_of_xml i)
                 ())
      | "Processing" ->
          r_processing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Processing" (fun i _ -> boolean__of_xml i) ())
      | "RequiresIndexDocuments" ->
          r_requires_index_documents :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequiresIndexDocuments"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SearchService" ->
          r_search_service :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SearchService"
                 (fun i _ -> service_endpoint_of_xml i)
                 ())
      | "DocService" ->
          r_doc_service :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DocService"
                 (fun i _ -> service_endpoint_of_xml i)
                 ())
      | "Deleted" ->
          r_deleted :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deleted" (fun i _ -> boolean__of_xml i) ())
      | "Created" ->
          r_created :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Created" (fun i _ -> boolean__of_xml i) ())
      | "ARN" ->
          r_ar_n := Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> ar_n_of_xml i) ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | "DomainId" ->
          r_domain_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DomainId" (fun i _ -> domain_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     limits = ( ! ) r_limits;
     search_instance_count = ( ! ) r_search_instance_count;
     search_partition_count = ( ! ) r_search_partition_count;
     search_instance_type = ( ! ) r_search_instance_type;
     processing = ( ! ) r_processing;
     requires_index_documents =
       Smaws_Lib.Xml.Parse.required "RequiresIndexDocuments" (( ! ) r_requires_index_documents) i;
     search_service = ( ! ) r_search_service;
     doc_service = ( ! ) r_doc_service;
     deleted = ( ! ) r_deleted;
     created = ( ! ) r_created;
     ar_n = ( ! ) r_ar_n;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
     domain_id = Smaws_Lib.Xml.Parse.required "DomainId" (( ! ) r_domain_id) i;
   }
    : domain_status)

let domain_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> domain_status_of_xml i) ()

let domain_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> domain_name_of_xml i) ()

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

let describe_suggesters_request_of_xml i =
  let r_deployed = ref None in
  let r_suggester_names = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Deployed"; "SuggesterNames"; "DomainName" ]
    (fun tag _ ->
      match tag with
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | "SuggesterNames" ->
          r_suggester_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuggesterNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> standard_name_of_xml i)
                     ())
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deployed = ( ! ) r_deployed;
     suggester_names = ( ! ) r_suggester_names;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
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
  let r_deployed = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Deployed"; "DomainName" ] (fun tag _ ->
      match tag with
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deployed = ( ! ) r_deployed;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
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

let describe_index_fields_request_of_xml i =
  let r_deployed = ref None in
  let r_field_names = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Deployed"; "FieldNames"; "DomainName" ]
    (fun tag _ ->
      match tag with
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | "FieldNames" ->
          r_field_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FieldNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> dynamic_field_name_of_xml i)
                     ())
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deployed = ( ! ) r_deployed;
     field_names = ( ! ) r_field_names;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
   }
    : describe_index_fields_request)

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
  let r_deployed = ref None in
  let r_expression_names = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Deployed"; "ExpressionNames"; "DomainName" ]
    (fun tag _ ->
      match tag with
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | "ExpressionNames" ->
          r_expression_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpressionNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> standard_name_of_xml i)
                     ())
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deployed = ( ! ) r_deployed;
     expression_names = ( ! ) r_expression_names;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
   }
    : describe_expressions_request)

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
  let r_deployed = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Deployed"; "DomainName" ] (fun tag _ ->
      match tag with
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deployed = ( ! ) r_deployed;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
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
  let r_deployed = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Deployed"; "DomainName" ] (fun tag _ ->
      match tag with
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deployed = ( ! ) r_deployed;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
   }
    : describe_availability_options_request)

let analysis_scheme_language_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "zh-Hant" -> Zh_Hant
   | "zh-Hans" -> Zh_Hans
   | "tr" -> Tr
   | "th" -> Th
   | "sv" -> Sv
   | "ru" -> Ru
   | "ro" -> Ro
   | "pt" -> Pt
   | "no" -> No
   | "nl" -> Nl
   | "mul" -> Mul
   | "lv" -> Lv
   | "ko" -> Ko
   | "ja" -> Ja
   | "it" -> It
   | "id" -> Id
   | "hy" -> Hy
   | "hu" -> Hu
   | "hi" -> Hi
   | "he" -> He
   | "gl" -> Gl
   | "ga" -> Ga
   | "fr" -> Fr
   | "fi" -> Fi
   | "fa" -> Fa
   | "eu" -> Eu
   | "es" -> Es
   | "en" -> En
   | "el" -> El
   | "de" -> De
   | "da" -> Da
   | "cs" -> Cs
   | "ca" -> Ca
   | "bg" -> Bg
   | "ar" -> Ar
   | _ -> failwith "unknown enum value"
    : analysis_scheme_language)

let algorithmic_stemming_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "full" -> Full
   | "light" -> Light
   | "minimal" -> Minimal
   | "none" -> None_
   | _ -> failwith "unknown enum value"
    : algorithmic_stemming)

let analysis_options_of_xml i =
  let r_algorithmic_stemming = ref None in
  let r_japanese_tokenization_dictionary = ref None in
  let r_stemming_dictionary = ref None in
  let r_stopwords = ref None in
  let r_synonyms = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AlgorithmicStemming";
      "JapaneseTokenizationDictionary";
      "StemmingDictionary";
      "Stopwords";
      "Synonyms";
    ] (fun tag _ ->
      match tag with
      | "AlgorithmicStemming" ->
          r_algorithmic_stemming :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlgorithmicStemming"
                 (fun i _ -> algorithmic_stemming_of_xml i)
                 ())
      | "JapaneseTokenizationDictionary" ->
          r_japanese_tokenization_dictionary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JapaneseTokenizationDictionary"
                 (fun i _ -> string__of_xml i)
                 ())
      | "StemmingDictionary" ->
          r_stemming_dictionary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StemmingDictionary"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Stopwords" ->
          r_stopwords :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Stopwords" (fun i _ -> string__of_xml i) ())
      | "Synonyms" ->
          r_synonyms :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Synonyms" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     algorithmic_stemming = ( ! ) r_algorithmic_stemming;
     japanese_tokenization_dictionary = ( ! ) r_japanese_tokenization_dictionary;
     stemming_dictionary = ( ! ) r_stemming_dictionary;
     stopwords = ( ! ) r_stopwords;
     synonyms = ( ! ) r_synonyms;
   }
    : analysis_options)

let analysis_scheme_of_xml i =
  let r_analysis_options = ref None in
  let r_analysis_scheme_language = ref None in
  let r_analysis_scheme_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AnalysisOptions"; "AnalysisSchemeLanguage"; "AnalysisSchemeName" ] (fun tag _ ->
      match tag with
      | "AnalysisOptions" ->
          r_analysis_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisOptions"
                 (fun i _ -> analysis_options_of_xml i)
                 ())
      | "AnalysisSchemeLanguage" ->
          r_analysis_scheme_language :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisSchemeLanguage"
                 (fun i _ -> analysis_scheme_language_of_xml i)
                 ())
      | "AnalysisSchemeName" ->
          r_analysis_scheme_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisSchemeName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     analysis_options = ( ! ) r_analysis_options;
     analysis_scheme_language =
       Smaws_Lib.Xml.Parse.required "AnalysisSchemeLanguage" (( ! ) r_analysis_scheme_language) i;
     analysis_scheme_name =
       Smaws_Lib.Xml.Parse.required "AnalysisSchemeName" (( ! ) r_analysis_scheme_name) i;
   }
    : analysis_scheme)

let analysis_scheme_status_of_xml i =
  let r_status = ref None in
  let r_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "Options" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> option_status_of_xml i) ())
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ -> analysis_scheme_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     options = Smaws_Lib.Xml.Parse.required "Options" (( ! ) r_options) i;
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
  let r_deployed = ref None in
  let r_analysis_scheme_names = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Deployed"; "AnalysisSchemeNames"; "DomainName" ]
    (fun tag _ ->
      match tag with
      | "Deployed" ->
          r_deployed :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Deployed" (fun i _ -> boolean__of_xml i) ())
      | "AnalysisSchemeNames" ->
          r_analysis_scheme_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisSchemeNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> standard_name_of_xml i)
                     ())
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deployed = ( ! ) r_deployed;
     analysis_scheme_names = ( ! ) r_analysis_scheme_names;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
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
  let r_suggester_name = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SuggesterName"; "DomainName" ] (fun tag _ ->
      match tag with
      | "SuggesterName" ->
          r_suggester_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SuggesterName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     suggester_name = Smaws_Lib.Xml.Parse.required "SuggesterName" (( ! ) r_suggester_name) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
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
  let r_index_field_name = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IndexFieldName"; "DomainName" ] (fun tag _ ->
      match tag with
      | "IndexFieldName" ->
          r_index_field_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IndexFieldName"
                 (fun i _ -> dynamic_field_name_of_xml i)
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     index_field_name = Smaws_Lib.Xml.Parse.required "IndexFieldName" (( ! ) r_index_field_name) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
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
  let r_expression_name = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ExpressionName"; "DomainName" ] (fun tag _ ->
      match tag with
      | "ExpressionName" ->
          r_expression_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpressionName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     expression_name = Smaws_Lib.Xml.Parse.required "ExpressionName" (( ! ) r_expression_name) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
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
  let r_analysis_scheme_name = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AnalysisSchemeName"; "DomainName" ] (fun tag _ ->
      match tag with
      | "AnalysisSchemeName" ->
          r_analysis_scheme_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisSchemeName"
                 (fun i _ -> standard_name_of_xml i)
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     analysis_scheme_name =
       Smaws_Lib.Xml.Parse.required "AnalysisSchemeName" (( ! ) r_analysis_scheme_name) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
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
  let r_suggester = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Suggester"; "DomainName" ] (fun tag _ ->
      match tag with
      | "Suggester" ->
          r_suggester :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Suggester" (fun i _ -> suggester_of_xml i) ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     suggester = Smaws_Lib.Xml.Parse.required "Suggester" (( ! ) r_suggester) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
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
  let r_index_field = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IndexField"; "DomainName" ] (fun tag _ ->
      match tag with
      | "IndexField" ->
          r_index_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IndexField"
                 (fun i _ -> index_field_of_xml i)
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     index_field = Smaws_Lib.Xml.Parse.required "IndexField" (( ! ) r_index_field) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
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
  let r_expression = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Expression"; "DomainName" ] (fun tag _ ->
      match tag with
      | "Expression" ->
          r_expression :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Expression" (fun i _ -> expression_of_xml i) ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     expression = Smaws_Lib.Xml.Parse.required "Expression" (( ! ) r_expression) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
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
  let r_analysis_scheme = ref None in
  let r_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AnalysisScheme"; "DomainName" ] (fun tag _ ->
      match tag with
      | "AnalysisScheme" ->
          r_analysis_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnalysisScheme"
                 (fun i _ -> analysis_scheme_of_xml i)
                 ())
      | "DomainName" ->
          r_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainName"
                 (fun i _ -> domain_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     analysis_scheme = Smaws_Lib.Xml.Parse.required "AnalysisScheme" (( ! ) r_analysis_scheme) i;
     domain_name = Smaws_Lib.Xml.Parse.required "DomainName" (( ! ) r_domain_name) i;
   }
    : define_analysis_scheme_request)

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
