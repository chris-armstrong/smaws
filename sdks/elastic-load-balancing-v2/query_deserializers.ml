open Types

let unit_of_xml _ = ()
let zone_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let capacity_reservation_state_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "failed" -> FAILED
   | "rebalancing" -> REBALANCING
   | "pending" -> PENDING
   | "provisioned" -> PROVISIONED
   | _ -> failwith "unknown enum value"
    : capacity_reservation_state_enum)

let state_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let capacity_reservation_status_of_xml i =
  let r_reason = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Reason"; "Code" ] (fun tag _ ->
      match tag with
      | "Reason" ->
          r_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Reason" (fun i _ -> state_reason_of_xml i) ())
      | "Code" ->
          r_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Code"
                 (fun i _ -> capacity_reservation_state_enum_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ reason = ( ! ) r_reason; code = ( ! ) r_code } : capacity_reservation_status)

let capacity_units_double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let zonal_capacity_reservation_state_of_xml i =
  let r_effective_capacity_units = ref None in
  let r_availability_zone = ref None in
  let r_state = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EffectiveCapacityUnits"; "AvailabilityZone"; "State" ] (fun tag _ ->
      match tag with
      | "EffectiveCapacityUnits" ->
          r_effective_capacity_units :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EffectiveCapacityUnits"
                 (fun i _ -> capacity_units_double_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> zone_name_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> capacity_reservation_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     effective_capacity_units = ( ! ) r_effective_capacity_units;
     availability_zone = ( ! ) r_availability_zone;
     state = ( ! ) r_state;
   }
    : zonal_capacity_reservation_state)

let zonal_capacity_reservation_states_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> zonal_capacity_reservation_state_of_xml i)
    ()

let vpc_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let string_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let rewrite_config_of_xml i =
  let r_replace = ref None in
  let r_regex = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Replace"; "Regex" ] (fun tag _ ->
      match tag with
      | "Replace" ->
          r_replace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Replace" (fun i _ -> string_value_of_xml i) ())
      | "Regex" ->
          r_regex :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Regex" (fun i _ -> string_value_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replace = Smaws_Lib.Xml.Parse.required "Replace" (( ! ) r_replace) i;
     regex = Smaws_Lib.Xml.Parse.required "Regex" (( ! ) r_regex) i;
   }
    : rewrite_config)

let rewrite_config_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rewrite_config_of_xml i) ()

let url_rewrite_config_of_xml i =
  let r_rewrites = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Rewrites" ] (fun tag _ ->
      match tag with
      | "Rewrites" ->
          r_rewrites :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Rewrites"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> rewrite_config_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rewrites = ( ! ) r_rewrites } : url_rewrite_config)

let error_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let unsupported_protocol_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : unsupported_protocol_exception)

let trust_store_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let trust_store_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let trust_store_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "CREATING" -> CREATING | "ACTIVE" -> ACTIVE | _ -> failwith "unknown enum value"
    : trust_store_status)

let number_of_ca_certificates_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let total_revoked_entries_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let trust_store_of_xml i =
  let r_total_revoked_entries = ref None in
  let r_number_of_ca_certificates = ref None in
  let r_status = ref None in
  let r_trust_store_arn = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TotalRevokedEntries"; "NumberOfCaCertificates"; "Status"; "TrustStoreArn"; "Name" ]
    (fun tag _ ->
      match tag with
      | "TotalRevokedEntries" ->
          r_total_revoked_entries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalRevokedEntries"
                 (fun i _ -> total_revoked_entries_of_xml i)
                 ())
      | "NumberOfCaCertificates" ->
          r_number_of_ca_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfCaCertificates"
                 (fun i _ -> number_of_ca_certificates_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> trust_store_status_of_xml i)
                 ())
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> trust_store_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     total_revoked_entries = ( ! ) r_total_revoked_entries;
     number_of_ca_certificates = ( ! ) r_number_of_ca_certificates;
     status = ( ! ) r_status;
     trust_store_arn = ( ! ) r_trust_store_arn;
     name = ( ! ) r_name;
   }
    : trust_store)

let trust_stores_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> trust_store_of_xml i) ()

let revocation_id_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let revocation_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "CRL" -> CRL | _ -> failwith "unknown enum value" : revocation_type)

let number_of_revoked_entries_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let trust_store_revocation_of_xml i =
  let r_number_of_revoked_entries = ref None in
  let r_revocation_type = ref None in
  let r_revocation_id = ref None in
  let r_trust_store_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NumberOfRevokedEntries"; "RevocationType"; "RevocationId"; "TrustStoreArn" ] (fun tag _ ->
      match tag with
      | "NumberOfRevokedEntries" ->
          r_number_of_revoked_entries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfRevokedEntries"
                 (fun i _ -> number_of_revoked_entries_of_xml i)
                 ())
      | "RevocationType" ->
          r_revocation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevocationType"
                 (fun i _ -> revocation_type_of_xml i)
                 ())
      | "RevocationId" ->
          r_revocation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevocationId"
                 (fun i _ -> revocation_id_of_xml i)
                 ())
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     number_of_revoked_entries = ( ! ) r_number_of_revoked_entries;
     revocation_type = ( ! ) r_revocation_type;
     revocation_id = ( ! ) r_revocation_id;
     trust_store_arn = ( ! ) r_trust_store_arn;
   }
    : trust_store_revocation)

let trust_store_revocations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> trust_store_revocation_of_xml i) ()

let trust_store_not_ready_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : trust_store_not_ready_exception)

let trust_store_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : trust_store_not_found_exception)

let trust_store_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> trust_store_name_of_xml i) ()

let trust_store_in_use_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : trust_store_in_use_exception)

let trust_store_association_resource_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let trust_store_association_of_xml i =
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArn" ] (fun tag _ ->
      match tag with
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn"
                 (fun i _ -> trust_store_association_resource_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_arn = ( ! ) r_resource_arn } : trust_store_association)

let trust_store_associations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> trust_store_association_of_xml i) ()

let trust_store_association_status_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "removed" -> REMOVED | "active" -> ACTIVE | _ -> failwith "unknown enum value"
    : trust_store_association_status_enum)

let trust_store_association_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : trust_store_association_not_found_exception)

let trust_store_arns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> trust_store_arn_of_xml i) ()

let transform_type_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "url-rewrite" -> URL_REWRITE
   | "host-header-rewrite" -> HOST_HEADER_REWRITE
   | _ -> failwith "unknown enum value"
    : transform_type_enum)

let too_many_unique_target_groups_per_load_balancer_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_unique_target_groups_per_load_balancer_exception)

let too_many_trust_stores_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_trust_stores_exception)

let too_many_trust_store_revocation_entries_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_trust_store_revocation_entries_exception)

let too_many_targets_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_targets_exception)

let too_many_target_groups_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_target_groups_exception)

let too_many_tags_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_tags_exception)

let too_many_rules_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_rules_exception)

let too_many_registrations_for_target_id_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_registrations_for_target_id_exception)

let too_many_load_balancers_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_load_balancers_exception)

let too_many_listeners_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_listeners_exception)

let too_many_certificates_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_certificates_exception)

let too_many_actions_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_actions_exception)

let target_type_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "alb" -> ALB
   | "lambda" -> LAMBDA
   | "ip" -> IP
   | "instance" -> INSTANCE
   | _ -> failwith "unknown enum value"
    : target_type_enum)

let target_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let target_health_state_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "unavailable" -> UNAVAILABLE
   | "draining" -> DRAINING
   | "unused" -> UNUSED
   | "unhealthy.draining" -> UNHEALTHY_DRAINING
   | "unhealthy" -> UNHEALTHY
   | "healthy" -> HEALTHY
   | "initial" -> INITIAL
   | _ -> failwith "unknown enum value"
    : target_health_state_enum)

let target_health_reason_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Elb.InternalError" -> INTERNAL_ERROR
   | "Target.HealthCheckDisabled" -> HEALTH_CHECK_DISABLED
   | "Target.IpUnusable" -> IP_UNUSABLE
   | "Target.InvalidState" -> INVALID_STATE
   | "Target.DeregistrationInProgress" -> DEREGISTRATION_IN_PROGRESS
   | "Target.NotInUse" -> NOT_IN_USE
   | "Target.NotRegistered" -> NOT_REGISTERED
   | "Target.FailedHealthChecks" -> FAILED_HEALTH_CHECKS
   | "Target.Timeout" -> TIMEOUT
   | "Target.ResponseCodeMismatch" -> RESPONSE_CODE_MISMATCH
   | "Elb.InitialHealthChecking" -> INITIAL_HEALTH_CHECKING
   | "Elb.RegistrationInProgress" -> REGISTRATION_IN_PROGRESS
   | _ -> failwith "unknown enum value"
    : target_health_reason_enum)

let port_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let quic_server_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let target_description_of_xml i =
  let r_quic_server_id = ref None in
  let r_availability_zone = ref None in
  let r_port = ref None in
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "QuicServerId"; "AvailabilityZone"; "Port"; "Id" ]
    (fun tag _ ->
      match tag with
      | "QuicServerId" ->
          r_quic_server_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QuicServerId"
                 (fun i _ -> quic_server_id_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> zone_name_of_xml i)
                 ())
      | "Port" ->
          r_port := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> port_of_xml i) ())
      | "Id" ->
          r_id := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> target_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     quic_server_id = ( ! ) r_quic_server_id;
     availability_zone = ( ! ) r_availability_zone;
     port = ( ! ) r_port;
     id = Smaws_Lib.Xml.Parse.required "Id" (( ! ) r_id) i;
   }
    : target_description)

let health_check_port_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let target_health_of_xml i =
  let r_description = ref None in
  let r_reason = ref None in
  let r_state = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Description"; "Reason"; "State" ] (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Reason" ->
          r_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Reason"
                 (fun i _ -> target_health_reason_enum_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> target_health_state_enum_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ description = ( ! ) r_description; reason = ( ! ) r_reason; state = ( ! ) r_state }
    : target_health)

let anomaly_result_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "normal" -> NORMAL | "anomalous" -> ANOMALOUS | _ -> failwith "unknown enum value"
    : anomaly_result_enum)

let mitigation_in_effect_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "no" -> NO | "yes" -> YES | _ -> failwith "unknown enum value"
    : mitigation_in_effect_enum)

let anomaly_detection_of_xml i =
  let r_mitigation_in_effect = ref None in
  let r_result_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MitigationInEffect"; "Result" ] (fun tag _ ->
      match tag with
      | "MitigationInEffect" ->
          r_mitigation_in_effect :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MitigationInEffect"
                 (fun i _ -> mitigation_in_effect_enum_of_xml i)
                 ())
      | "Result" ->
          r_result_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Result"
                 (fun i _ -> anomaly_result_enum_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ mitigation_in_effect = ( ! ) r_mitigation_in_effect; result_ = ( ! ) r_result_ }
    : anomaly_detection)

let target_administrative_override_state_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "zonal_shift_delegated_to_dns" -> ZONAL_SHIFT_DELEGATED_TO_DNS
   | "zonal_shift_active" -> ZONAL_SHIFT_ACTIVE
   | "no_override" -> NO_OVERRIDE
   | "unknown" -> UNKNOWN
   | _ -> failwith "unknown enum value"
    : target_administrative_override_state_enum)

let target_administrative_override_reason_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "AdministrativeOverride.ZonalShiftDelegatedToDns" -> ZONAL_SHIFT_DELEGATED_TO_DNS
   | "AdministrativeOverride.ZonalShiftActive" -> ZONAL_SHIFT_ENGAGED
   | "AdministrativeOverride.NoOverride" -> NO_OVERRIDE_ENGAGED
   | "AdministrativeOverride.Unknown" -> INTERNAL_ERROR
   | _ -> failwith "unknown enum value"
    : target_administrative_override_reason_enum)

let administrative_override_of_xml i =
  let r_description = ref None in
  let r_reason = ref None in
  let r_state = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Description"; "Reason"; "State" ] (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Reason" ->
          r_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Reason"
                 (fun i _ -> target_administrative_override_reason_enum_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> target_administrative_override_state_enum_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ description = ( ! ) r_description; reason = ( ! ) r_reason; state = ( ! ) r_state }
    : administrative_override)

let target_health_description_of_xml i =
  let r_administrative_override = ref None in
  let r_anomaly_detection = ref None in
  let r_target_health = ref None in
  let r_health_check_port = ref None in
  let r_target = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AdministrativeOverride"; "AnomalyDetection"; "TargetHealth"; "HealthCheckPort"; "Target" ]
    (fun tag _ ->
      match tag with
      | "AdministrativeOverride" ->
          r_administrative_override :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdministrativeOverride"
                 (fun i _ -> administrative_override_of_xml i)
                 ())
      | "AnomalyDetection" ->
          r_anomaly_detection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnomalyDetection"
                 (fun i _ -> anomaly_detection_of_xml i)
                 ())
      | "TargetHealth" ->
          r_target_health :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetHealth"
                 (fun i _ -> target_health_of_xml i)
                 ())
      | "HealthCheckPort" ->
          r_health_check_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckPort"
                 (fun i _ -> health_check_port_of_xml i)
                 ())
      | "Target" ->
          r_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Target"
                 (fun i _ -> target_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     administrative_override = ( ! ) r_administrative_override;
     anomaly_detection = ( ! ) r_anomaly_detection;
     target_health = ( ! ) r_target_health;
     health_check_port = ( ! ) r_health_check_port;
     target = ( ! ) r_target;
   }
    : target_health_description)

let target_health_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> target_health_description_of_xml i) ()

let target_group_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let target_group_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let protocol_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "TCP_QUIC" -> TCP_QUIC
   | "QUIC" -> QUIC
   | "GENEVE" -> GENEVE
   | "TCP_UDP" -> TCP_UDP
   | "UDP" -> UDP
   | "TLS" -> TLS
   | "TCP" -> TCP
   | "HTTPS" -> HTTPS
   | "HTTP" -> HTTP
   | _ -> failwith "unknown enum value"
    : protocol_enum)

let health_check_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let health_check_interval_seconds_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let health_check_timeout_seconds_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let health_check_threshold_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let path_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let http_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let grpc_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let matcher_of_xml i =
  let r_grpc_code = ref None in
  let r_http_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GrpcCode"; "HttpCode" ] (fun tag _ ->
      match tag with
      | "GrpcCode" ->
          r_grpc_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "GrpcCode" (fun i _ -> grpc_code_of_xml i) ())
      | "HttpCode" ->
          r_http_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "HttpCode" (fun i _ -> http_code_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ grpc_code = ( ! ) r_grpc_code; http_code = ( ! ) r_http_code } : matcher)

let load_balancer_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let load_balancer_arns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_balancer_arn_of_xml i) ()

let protocol_version_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let target_group_ip_address_type_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "ipv6" -> IPV6 | "ipv4" -> IPV4 | _ -> failwith "unknown enum value"
    : target_group_ip_address_type_enum)

let target_control_port_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let target_group_of_xml i =
  let r_target_control_port = ref None in
  let r_ip_address_type = ref None in
  let r_protocol_version = ref None in
  let r_target_type = ref None in
  let r_load_balancer_arns = ref None in
  let r_matcher = ref None in
  let r_health_check_path = ref None in
  let r_unhealthy_threshold_count = ref None in
  let r_healthy_threshold_count = ref None in
  let r_health_check_timeout_seconds = ref None in
  let r_health_check_interval_seconds = ref None in
  let r_health_check_enabled = ref None in
  let r_health_check_port = ref None in
  let r_health_check_protocol = ref None in
  let r_vpc_id = ref None in
  let r_port = ref None in
  let r_protocol = ref None in
  let r_target_group_name = ref None in
  let r_target_group_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TargetControlPort";
      "IpAddressType";
      "ProtocolVersion";
      "TargetType";
      "LoadBalancerArns";
      "Matcher";
      "HealthCheckPath";
      "UnhealthyThresholdCount";
      "HealthyThresholdCount";
      "HealthCheckTimeoutSeconds";
      "HealthCheckIntervalSeconds";
      "HealthCheckEnabled";
      "HealthCheckPort";
      "HealthCheckProtocol";
      "VpcId";
      "Port";
      "Protocol";
      "TargetGroupName";
      "TargetGroupArn";
    ] (fun tag _ ->
      match tag with
      | "TargetControlPort" ->
          r_target_control_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetControlPort"
                 (fun i _ -> target_control_port_of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType"
                 (fun i _ -> target_group_ip_address_type_enum_of_xml i)
                 ())
      | "ProtocolVersion" ->
          r_protocol_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProtocolVersion"
                 (fun i _ -> protocol_version_of_xml i)
                 ())
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> target_type_enum_of_xml i)
                 ())
      | "LoadBalancerArns" ->
          r_load_balancer_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_arn_of_xml i)
                     ())
                 ())
      | "Matcher" ->
          r_matcher :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Matcher" (fun i _ -> matcher_of_xml i) ())
      | "HealthCheckPath" ->
          r_health_check_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckPath" (fun i _ -> path_of_xml i) ())
      | "UnhealthyThresholdCount" ->
          r_unhealthy_threshold_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UnhealthyThresholdCount"
                 (fun i _ -> health_check_threshold_count_of_xml i)
                 ())
      | "HealthyThresholdCount" ->
          r_healthy_threshold_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthyThresholdCount"
                 (fun i _ -> health_check_threshold_count_of_xml i)
                 ())
      | "HealthCheckTimeoutSeconds" ->
          r_health_check_timeout_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckTimeoutSeconds"
                 (fun i _ -> health_check_timeout_seconds_of_xml i)
                 ())
      | "HealthCheckIntervalSeconds" ->
          r_health_check_interval_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckIntervalSeconds"
                 (fun i _ -> health_check_interval_seconds_of_xml i)
                 ())
      | "HealthCheckEnabled" ->
          r_health_check_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckEnabled"
                 (fun i _ -> health_check_enabled_of_xml i)
                 ())
      | "HealthCheckPort" ->
          r_health_check_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckPort"
                 (fun i _ -> health_check_port_of_xml i)
                 ())
      | "HealthCheckProtocol" ->
          r_health_check_protocol :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckProtocol"
                 (fun i _ -> protocol_enum_of_xml i)
                 ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> vpc_id_of_xml i) ())
      | "Port" ->
          r_port := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> port_of_xml i) ())
      | "Protocol" ->
          r_protocol :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Protocol"
                 (fun i _ -> protocol_enum_of_xml i)
                 ())
      | "TargetGroupName" ->
          r_target_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupName"
                 (fun i _ -> target_group_name_of_xml i)
                 ())
      | "TargetGroupArn" ->
          r_target_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupArn"
                 (fun i _ -> target_group_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_control_port = ( ! ) r_target_control_port;
     ip_address_type = ( ! ) r_ip_address_type;
     protocol_version = ( ! ) r_protocol_version;
     target_type = ( ! ) r_target_type;
     load_balancer_arns = ( ! ) r_load_balancer_arns;
     matcher = ( ! ) r_matcher;
     health_check_path = ( ! ) r_health_check_path;
     unhealthy_threshold_count = ( ! ) r_unhealthy_threshold_count;
     healthy_threshold_count = ( ! ) r_healthy_threshold_count;
     health_check_timeout_seconds = ( ! ) r_health_check_timeout_seconds;
     health_check_interval_seconds = ( ! ) r_health_check_interval_seconds;
     health_check_enabled = ( ! ) r_health_check_enabled;
     health_check_port = ( ! ) r_health_check_port;
     health_check_protocol = ( ! ) r_health_check_protocol;
     vpc_id = ( ! ) r_vpc_id;
     port = ( ! ) r_port;
     protocol = ( ! ) r_protocol;
     target_group_name = ( ! ) r_target_group_name;
     target_group_arn = ( ! ) r_target_group_arn;
   }
    : target_group)

let target_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> target_group_of_xml i) ()

let target_group_weight_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let target_group_tuple_of_xml i =
  let r_weight = ref None in
  let r_target_group_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Weight"; "TargetGroupArn" ] (fun tag _ ->
      match tag with
      | "Weight" ->
          r_weight :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Weight"
                 (fun i _ -> target_group_weight_of_xml i)
                 ())
      | "TargetGroupArn" ->
          r_target_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupArn"
                 (fun i _ -> target_group_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ weight = ( ! ) r_weight; target_group_arn = ( ! ) r_target_group_arn } : target_group_tuple)

let target_group_stickiness_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let target_group_stickiness_duration_seconds_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let target_group_stickiness_config_of_xml i =
  let r_duration_seconds = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DurationSeconds"; "Enabled" ] (fun tag _ ->
      match tag with
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> target_group_stickiness_duration_seconds_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> target_group_stickiness_enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ duration_seconds = ( ! ) r_duration_seconds; enabled = ( ! ) r_enabled }
    : target_group_stickiness_config)

let target_group_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : target_group_not_found_exception)

let target_group_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> target_group_name_of_xml i) ()

let target_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> target_group_tuple_of_xml i) ()

let target_group_attribute_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let target_group_attribute_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let target_group_attribute_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Key" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> target_group_attribute_value_of_xml i)
                 ())
      | "Key" ->
          r_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Key"
                 (fun i _ -> target_group_attribute_key_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; key = ( ! ) r_key } : target_group_attribute)

let target_group_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> target_group_attribute_of_xml i) ()

let target_group_association_limit_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : target_group_association_limit_exception)

let target_group_arns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> target_group_arn_of_xml i) ()

let target_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> target_description_of_xml i) ()

let tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Key" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_of_xml i) ())
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i } : tag)

let tag_list_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let tag_keys_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ()

let resource_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_description_of_xml i =
  let r_tags = ref None in
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "ResourceArn" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn"
                 (fun i _ -> resource_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tags = ( ! ) r_tags; resource_arn = ( ! ) r_resource_arn } : tag_description)

let tag_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_description_of_xml i) ()

let subnet_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let subnets_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subnet_id_of_xml i) ()

let subnet_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : subnet_not_found_exception)

let allocation_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let private_i_pv4_address_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let i_pv6_address_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let source_nat_ipv6_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let subnet_mapping_of_xml i =
  let r_source_nat_ipv6_prefix = ref None in
  let r_i_pv6_address = ref None in
  let r_private_i_pv4_address = ref None in
  let r_allocation_id = ref None in
  let r_subnet_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourceNatIpv6Prefix"; "IPv6Address"; "PrivateIPv4Address"; "AllocationId"; "SubnetId" ]
    (fun tag _ ->
      match tag with
      | "SourceNatIpv6Prefix" ->
          r_source_nat_ipv6_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceNatIpv6Prefix"
                 (fun i _ -> source_nat_ipv6_prefix_of_xml i)
                 ())
      | "IPv6Address" ->
          r_i_pv6_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IPv6Address"
                 (fun i _ -> i_pv6_address_of_xml i)
                 ())
      | "PrivateIPv4Address" ->
          r_private_i_pv4_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrivateIPv4Address"
                 (fun i _ -> private_i_pv4_address_of_xml i)
                 ())
      | "AllocationId" ->
          r_allocation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllocationId"
                 (fun i _ -> allocation_id_of_xml i)
                 ())
      | "SubnetId" ->
          r_subnet_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetId" (fun i _ -> subnet_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_nat_ipv6_prefix = ( ! ) r_source_nat_ipv6_prefix;
     i_pv6_address = ( ! ) r_i_pv6_address;
     private_i_pv4_address = ( ! ) r_private_i_pv4_address;
     allocation_id = ( ! ) r_allocation_id;
     subnet_id = ( ! ) r_subnet_id;
   }
    : subnet_mapping)

let subnet_mappings_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subnet_mapping_of_xml i) ()

let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let ssl_protocol_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let ssl_protocols_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> ssl_protocol_of_xml i) ()

let ssl_policy_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let ssl_policy_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> ssl_policy_name_of_xml i) ()

let cipher_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let cipher_priority_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let cipher_of_xml i =
  let r_priority = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Priority"; "Name" ] (fun tag _ ->
      match tag with
      | "Priority" ->
          r_priority :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Priority"
                 (fun i _ -> cipher_priority_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> cipher_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ priority = ( ! ) r_priority; name = ( ! ) r_name } : cipher)

let ciphers_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cipher_of_xml i) ()

let list_of_string_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string_value_of_xml i) ()

let ssl_policy_of_xml i =
  let r_supported_load_balancer_types = ref None in
  let r_name = ref None in
  let r_ciphers = ref None in
  let r_ssl_protocols = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SupportedLoadBalancerTypes"; "Name"; "Ciphers"; "SslProtocols" ] (fun tag _ ->
      match tag with
      | "SupportedLoadBalancerTypes" ->
          r_supported_load_balancer_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedLoadBalancerTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> string_value_of_xml i)
                     ())
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> ssl_policy_name_of_xml i) ())
      | "Ciphers" ->
          r_ciphers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Ciphers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cipher_of_xml i) ())
                 ())
      | "SslProtocols" ->
          r_ssl_protocols :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SslProtocols"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> ssl_protocol_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     supported_load_balancer_types = ( ! ) r_supported_load_balancer_types;
     name = ( ! ) r_name;
     ciphers = ( ! ) r_ciphers;
     ssl_protocols = ( ! ) r_ssl_protocols;
   }
    : ssl_policy)

let ssl_policies_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> ssl_policy_of_xml i) ()

let source_nat_ipv6_prefixes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> source_nat_ipv6_prefix_of_xml i) ()

let source_ip_condition_config_of_xml i =
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> string_value_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ values = ( ! ) r_values } : source_ip_condition_config)

let outpost_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let ip_address_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let load_balancer_address_of_xml i =
  let r_i_pv6_address = ref None in
  let r_private_i_pv4_address = ref None in
  let r_allocation_id = ref None in
  let r_ip_address = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "IPv6Address"; "PrivateIPv4Address"; "AllocationId"; "IpAddress" ] (fun tag _ ->
      match tag with
      | "IPv6Address" ->
          r_i_pv6_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IPv6Address"
                 (fun i _ -> i_pv6_address_of_xml i)
                 ())
      | "PrivateIPv4Address" ->
          r_private_i_pv4_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrivateIPv4Address"
                 (fun i _ -> private_i_pv4_address_of_xml i)
                 ())
      | "AllocationId" ->
          r_allocation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllocationId"
                 (fun i _ -> allocation_id_of_xml i)
                 ())
      | "IpAddress" ->
          r_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddress" (fun i _ -> ip_address_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     i_pv6_address = ( ! ) r_i_pv6_address;
     private_i_pv4_address = ( ! ) r_private_i_pv4_address;
     allocation_id = ( ! ) r_allocation_id;
     ip_address = ( ! ) r_ip_address;
   }
    : load_balancer_address)

let load_balancer_addresses_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_balancer_address_of_xml i) ()

let availability_zone_of_xml i =
  let r_source_nat_ipv6_prefixes = ref None in
  let r_load_balancer_addresses = ref None in
  let r_outpost_id = ref None in
  let r_subnet_id = ref None in
  let r_zone_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourceNatIpv6Prefixes"; "LoadBalancerAddresses"; "OutpostId"; "SubnetId"; "ZoneName" ]
    (fun tag _ ->
      match tag with
      | "SourceNatIpv6Prefixes" ->
          r_source_nat_ipv6_prefixes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceNatIpv6Prefixes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> source_nat_ipv6_prefix_of_xml i)
                     ())
                 ())
      | "LoadBalancerAddresses" ->
          r_load_balancer_addresses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerAddresses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_address_of_xml i)
                     ())
                 ())
      | "OutpostId" ->
          r_outpost_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutpostId" (fun i _ -> outpost_id_of_xml i) ())
      | "SubnetId" ->
          r_subnet_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetId" (fun i _ -> subnet_id_of_xml i) ())
      | "ZoneName" ->
          r_zone_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ZoneName" (fun i _ -> zone_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_nat_ipv6_prefixes = ( ! ) r_source_nat_ipv6_prefixes;
     load_balancer_addresses = ( ! ) r_load_balancer_addresses;
     outpost_id = ( ! ) r_outpost_id;
     subnet_id = ( ! ) r_subnet_id;
     zone_name = ( ! ) r_zone_name;
   }
    : availability_zone)

let availability_zones_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> availability_zone_of_xml i) ()

let ip_address_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "dualstack-without-public-ipv4" -> DUALSTACK_WITHOUT_PUBLIC_IPV4
   | "dualstack" -> DUALSTACK
   | "ipv4" -> IPV4
   | _ -> failwith "unknown enum value"
    : ip_address_type)

let enable_prefix_for_ipv6_source_nat_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "off" -> OFF | "on" -> ON | _ -> failwith "unknown enum value"
    : enable_prefix_for_ipv6_source_nat_enum)

let set_subnets_output_of_xml i =
  let r_enable_prefix_for_ipv6_source_nat = ref None in
  let r_ip_address_type = ref None in
  let r_availability_zones = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EnablePrefixForIpv6SourceNat"; "IpAddressType"; "AvailabilityZones" ] (fun tag _ ->
      match tag with
      | "EnablePrefixForIpv6SourceNat" ->
          r_enable_prefix_for_ipv6_source_nat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnablePrefixForIpv6SourceNat"
                 (fun i _ -> enable_prefix_for_ipv6_source_nat_enum_of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType"
                 (fun i _ -> ip_address_type_of_xml i)
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enable_prefix_for_ipv6_source_nat = ( ! ) r_enable_prefix_for_ipv6_source_nat;
     ip_address_type = ( ! ) r_ip_address_type;
     availability_zones = ( ! ) r_availability_zones;
   }
    : set_subnets_output)

let set_subnets_input_of_xml i =
  let r_enable_prefix_for_ipv6_source_nat = ref None in
  let r_ip_address_type = ref None in
  let r_subnet_mappings = ref None in
  let r_subnets = ref None in
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EnablePrefixForIpv6SourceNat";
      "IpAddressType";
      "SubnetMappings";
      "Subnets";
      "LoadBalancerArn";
    ] (fun tag _ ->
      match tag with
      | "EnablePrefixForIpv6SourceNat" ->
          r_enable_prefix_for_ipv6_source_nat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnablePrefixForIpv6SourceNat"
                 (fun i _ -> enable_prefix_for_ipv6_source_nat_enum_of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType"
                 (fun i _ -> ip_address_type_of_xml i)
                 ())
      | "SubnetMappings" ->
          r_subnet_mappings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetMappings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> subnet_mapping_of_xml i)
                     ())
                 ())
      | "Subnets" ->
          r_subnets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subnets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subnet_id_of_xml i) ())
                 ())
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enable_prefix_for_ipv6_source_nat = ( ! ) r_enable_prefix_for_ipv6_source_nat;
     ip_address_type = ( ! ) r_ip_address_type;
     subnet_mappings = ( ! ) r_subnet_mappings;
     subnets = ( ! ) r_subnets;
     load_balancer_arn =
       Smaws_Lib.Xml.Parse.required "LoadBalancerArn" (( ! ) r_load_balancer_arn) i;
   }
    : set_subnets_input)

let load_balancer_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : load_balancer_not_found_exception)

let invalid_subnet_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_subnet_exception)

let invalid_configuration_request_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_configuration_request_exception)

let capacity_reservation_pending_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : capacity_reservation_pending_exception)

let availability_zone_not_supported_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : availability_zone_not_supported_exception)

let allocation_id_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : allocation_id_not_found_exception)

let security_group_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let security_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> security_group_id_of_xml i) ()

let enforce_security_group_inbound_rules_on_private_link_traffic_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "off" -> Off | "on" -> On | _ -> failwith "unknown enum value"
    : enforce_security_group_inbound_rules_on_private_link_traffic_enum)

let set_security_groups_output_of_xml i =
  let r_enforce_security_group_inbound_rules_on_private_link_traffic = ref None in
  let r_security_group_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic"; "SecurityGroupIds" ] (fun tag _ ->
      match tag with
      | "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic" ->
          r_enforce_security_group_inbound_rules_on_private_link_traffic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i
                 "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic"
                 (fun i _ ->
                   enforce_security_group_inbound_rules_on_private_link_traffic_enum_of_xml i)
                 ())
      | "SecurityGroupIds" ->
          r_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> security_group_id_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enforce_security_group_inbound_rules_on_private_link_traffic =
       ( ! ) r_enforce_security_group_inbound_rules_on_private_link_traffic;
     security_group_ids = ( ! ) r_security_group_ids;
   }
    : set_security_groups_output)

let set_security_groups_input_of_xml i =
  let r_enforce_security_group_inbound_rules_on_private_link_traffic = ref None in
  let r_security_groups = ref None in
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic"; "SecurityGroups"; "LoadBalancerArn" ]
    (fun tag _ ->
      match tag with
      | "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic" ->
          r_enforce_security_group_inbound_rules_on_private_link_traffic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i
                 "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic"
                 (fun i _ ->
                   enforce_security_group_inbound_rules_on_private_link_traffic_enum_of_xml i)
                 ())
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> security_group_id_of_xml i)
                     ())
                 ())
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enforce_security_group_inbound_rules_on_private_link_traffic =
       ( ! ) r_enforce_security_group_inbound_rules_on_private_link_traffic;
     security_groups = Smaws_Lib.Xml.Parse.required "SecurityGroups" (( ! ) r_security_groups) i;
     load_balancer_arn =
       Smaws_Lib.Xml.Parse.required "LoadBalancerArn" (( ! ) r_load_balancer_arn) i;
   }
    : set_security_groups_input)

let invalid_security_group_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_security_group_exception)

let rule_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let condition_field_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let host_header_condition_config_of_xml i =
  let r_regex_values = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RegexValues"; "Values" ] (fun tag _ ->
      match tag with
      | "RegexValues" ->
          r_regex_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegexValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> string_value_of_xml i)
                     ())
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> string_value_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ regex_values = ( ! ) r_regex_values; values = ( ! ) r_values } : host_header_condition_config)

let path_pattern_condition_config_of_xml i =
  let r_regex_values = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RegexValues"; "Values" ] (fun tag _ ->
      match tag with
      | "RegexValues" ->
          r_regex_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegexValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> string_value_of_xml i)
                     ())
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> string_value_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ regex_values = ( ! ) r_regex_values; values = ( ! ) r_values } : path_pattern_condition_config)

let http_header_condition_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let http_header_condition_config_of_xml i =
  let r_regex_values = ref None in
  let r_values = ref None in
  let r_http_header_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RegexValues"; "Values"; "HttpHeaderName" ]
    (fun tag _ ->
      match tag with
      | "RegexValues" ->
          r_regex_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegexValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> string_value_of_xml i)
                     ())
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> string_value_of_xml i)
                     ())
                 ())
      | "HttpHeaderName" ->
          r_http_header_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HttpHeaderName"
                 (fun i _ -> http_header_condition_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     regex_values = ( ! ) r_regex_values;
     values = ( ! ) r_values;
     http_header_name = ( ! ) r_http_header_name;
   }
    : http_header_condition_config)

let query_string_key_value_pair_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Key" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> string_value_of_xml i) ())
      | "Key" ->
          r_key :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> string_value_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; key = ( ! ) r_key } : query_string_key_value_pair)

let query_string_key_value_pair_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> query_string_key_value_pair_of_xml i) ()

let query_string_condition_config_of_xml i =
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> query_string_key_value_pair_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ values = ( ! ) r_values } : query_string_condition_config)

let http_request_method_condition_config_of_xml i =
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> string_value_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ values = ( ! ) r_values } : http_request_method_condition_config)

let rule_condition_of_xml i =
  let r_regex_values = ref None in
  let r_source_ip_config = ref None in
  let r_http_request_method_config = ref None in
  let r_query_string_config = ref None in
  let r_http_header_config = ref None in
  let r_path_pattern_config = ref None in
  let r_host_header_config = ref None in
  let r_values = ref None in
  let r_field = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RegexValues";
      "SourceIpConfig";
      "HttpRequestMethodConfig";
      "QueryStringConfig";
      "HttpHeaderConfig";
      "PathPatternConfig";
      "HostHeaderConfig";
      "Values";
      "Field";
    ] (fun tag _ ->
      match tag with
      | "RegexValues" ->
          r_regex_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegexValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> string_value_of_xml i)
                     ())
                 ())
      | "SourceIpConfig" ->
          r_source_ip_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIpConfig"
                 (fun i _ -> source_ip_condition_config_of_xml i)
                 ())
      | "HttpRequestMethodConfig" ->
          r_http_request_method_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HttpRequestMethodConfig"
                 (fun i _ -> http_request_method_condition_config_of_xml i)
                 ())
      | "QueryStringConfig" ->
          r_query_string_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "QueryStringConfig"
                 (fun i _ -> query_string_condition_config_of_xml i)
                 ())
      | "HttpHeaderConfig" ->
          r_http_header_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HttpHeaderConfig"
                 (fun i _ -> http_header_condition_config_of_xml i)
                 ())
      | "PathPatternConfig" ->
          r_path_pattern_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PathPatternConfig"
                 (fun i _ -> path_pattern_condition_config_of_xml i)
                 ())
      | "HostHeaderConfig" ->
          r_host_header_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HostHeaderConfig"
                 (fun i _ -> host_header_condition_config_of_xml i)
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> string_value_of_xml i)
                     ())
                 ())
      | "Field" ->
          r_field :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Field"
                 (fun i _ -> condition_field_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     regex_values = ( ! ) r_regex_values;
     source_ip_config = ( ! ) r_source_ip_config;
     http_request_method_config = ( ! ) r_http_request_method_config;
     query_string_config = ( ! ) r_query_string_config;
     http_header_config = ( ! ) r_http_header_config;
     path_pattern_config = ( ! ) r_path_pattern_config;
     host_header_config = ( ! ) r_host_header_config;
     values = ( ! ) r_values;
     field = ( ! ) r_field;
   }
    : rule_condition)

let rule_condition_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rule_condition_of_xml i) ()

let action_type_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "jwt-validation" -> JWT_VALIDATION
   | "fixed-response" -> FIXED_RESPONSE
   | "redirect" -> REDIRECT
   | "authenticate-cognito" -> AUTHENTICATE_COGNITO
   | "authenticate-oidc" -> AUTHENTICATE_OIDC
   | "forward" -> FORWARD
   | _ -> failwith "unknown enum value"
    : action_type_enum)

let authenticate_oidc_action_issuer_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let authenticate_oidc_action_authorization_endpoint_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let authenticate_oidc_action_token_endpoint_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let authenticate_oidc_action_user_info_endpoint_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let authenticate_oidc_action_client_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let authenticate_oidc_action_client_secret_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let authenticate_oidc_action_session_cookie_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let authenticate_oidc_action_scope_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let authenticate_oidc_action_session_timeout_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let authenticate_oidc_action_authentication_request_param_value_of_xml i =
  Smaws_Lib.Xml.Parse.Read.data i

let authenticate_oidc_action_authentication_request_param_name_of_xml i =
  Smaws_Lib.Xml.Parse.Read.data i

let authenticate_oidc_action_authentication_request_extra_params_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k =
        Smaws_Lib.Xml.Parse.Read.sequence i "key"
          (fun i _ -> authenticate_oidc_action_authentication_request_param_name_of_xml i)
          ()
      in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> authenticate_oidc_action_authentication_request_param_value_of_xml i)
          ()
      in
      (k, v))
    ()

let authenticate_oidc_action_conditional_behavior_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "authenticate" -> AUTHENTICATE
   | "allow" -> ALLOW
   | "deny" -> DENY
   | _ -> failwith "unknown enum value"
    : authenticate_oidc_action_conditional_behavior_enum)

let authenticate_oidc_action_use_existing_client_secret_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let authenticate_oidc_action_config_of_xml i =
  let r_use_existing_client_secret = ref None in
  let r_on_unauthenticated_request = ref None in
  let r_authentication_request_extra_params = ref None in
  let r_session_timeout = ref None in
  let r_scope = ref None in
  let r_session_cookie_name = ref None in
  let r_client_secret = ref None in
  let r_client_id = ref None in
  let r_user_info_endpoint = ref None in
  let r_token_endpoint = ref None in
  let r_authorization_endpoint = ref None in
  let r_issuer = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "UseExistingClientSecret";
      "OnUnauthenticatedRequest";
      "AuthenticationRequestExtraParams";
      "SessionTimeout";
      "Scope";
      "SessionCookieName";
      "ClientSecret";
      "ClientId";
      "UserInfoEndpoint";
      "TokenEndpoint";
      "AuthorizationEndpoint";
      "Issuer";
    ] (fun tag _ ->
      match tag with
      | "UseExistingClientSecret" ->
          r_use_existing_client_secret :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UseExistingClientSecret"
                 (fun i _ -> authenticate_oidc_action_use_existing_client_secret_of_xml i)
                 ())
      | "OnUnauthenticatedRequest" ->
          r_on_unauthenticated_request :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnUnauthenticatedRequest"
                 (fun i _ -> authenticate_oidc_action_conditional_behavior_enum_of_xml i)
                 ())
      | "AuthenticationRequestExtraParams" ->
          r_authentication_request_extra_params :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationRequestExtraParams"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ ->
                             authenticate_oidc_action_authentication_request_param_name_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ ->
                             authenticate_oidc_action_authentication_request_param_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "SessionTimeout" ->
          r_session_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SessionTimeout"
                 (fun i _ -> authenticate_oidc_action_session_timeout_of_xml i)
                 ())
      | "Scope" ->
          r_scope :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Scope"
                 (fun i _ -> authenticate_oidc_action_scope_of_xml i)
                 ())
      | "SessionCookieName" ->
          r_session_cookie_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SessionCookieName"
                 (fun i _ -> authenticate_oidc_action_session_cookie_name_of_xml i)
                 ())
      | "ClientSecret" ->
          r_client_secret :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientSecret"
                 (fun i _ -> authenticate_oidc_action_client_secret_of_xml i)
                 ())
      | "ClientId" ->
          r_client_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientId"
                 (fun i _ -> authenticate_oidc_action_client_id_of_xml i)
                 ())
      | "UserInfoEndpoint" ->
          r_user_info_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserInfoEndpoint"
                 (fun i _ -> authenticate_oidc_action_user_info_endpoint_of_xml i)
                 ())
      | "TokenEndpoint" ->
          r_token_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TokenEndpoint"
                 (fun i _ -> authenticate_oidc_action_token_endpoint_of_xml i)
                 ())
      | "AuthorizationEndpoint" ->
          r_authorization_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthorizationEndpoint"
                 (fun i _ -> authenticate_oidc_action_authorization_endpoint_of_xml i)
                 ())
      | "Issuer" ->
          r_issuer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Issuer"
                 (fun i _ -> authenticate_oidc_action_issuer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     use_existing_client_secret = ( ! ) r_use_existing_client_secret;
     on_unauthenticated_request = ( ! ) r_on_unauthenticated_request;
     authentication_request_extra_params = ( ! ) r_authentication_request_extra_params;
     session_timeout = ( ! ) r_session_timeout;
     scope = ( ! ) r_scope;
     session_cookie_name = ( ! ) r_session_cookie_name;
     client_secret = ( ! ) r_client_secret;
     client_id = Smaws_Lib.Xml.Parse.required "ClientId" (( ! ) r_client_id) i;
     user_info_endpoint =
       Smaws_Lib.Xml.Parse.required "UserInfoEndpoint" (( ! ) r_user_info_endpoint) i;
     token_endpoint = Smaws_Lib.Xml.Parse.required "TokenEndpoint" (( ! ) r_token_endpoint) i;
     authorization_endpoint =
       Smaws_Lib.Xml.Parse.required "AuthorizationEndpoint" (( ! ) r_authorization_endpoint) i;
     issuer = Smaws_Lib.Xml.Parse.required "Issuer" (( ! ) r_issuer) i;
   }
    : authenticate_oidc_action_config)

let authenticate_cognito_action_user_pool_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let authenticate_cognito_action_user_pool_client_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let authenticate_cognito_action_user_pool_domain_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let authenticate_cognito_action_session_cookie_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let authenticate_cognito_action_scope_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let authenticate_cognito_action_session_timeout_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let authenticate_cognito_action_authentication_request_param_value_of_xml i =
  Smaws_Lib.Xml.Parse.Read.data i

let authenticate_cognito_action_authentication_request_param_name_of_xml i =
  Smaws_Lib.Xml.Parse.Read.data i

let authenticate_cognito_action_authentication_request_extra_params_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k =
        Smaws_Lib.Xml.Parse.Read.sequence i "key"
          (fun i _ -> authenticate_cognito_action_authentication_request_param_name_of_xml i)
          ()
      in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> authenticate_cognito_action_authentication_request_param_value_of_xml i)
          ()
      in
      (k, v))
    ()

let authenticate_cognito_action_conditional_behavior_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "authenticate" -> AUTHENTICATE
   | "allow" -> ALLOW
   | "deny" -> DENY
   | _ -> failwith "unknown enum value"
    : authenticate_cognito_action_conditional_behavior_enum)

let authenticate_cognito_action_config_of_xml i =
  let r_on_unauthenticated_request = ref None in
  let r_authentication_request_extra_params = ref None in
  let r_session_timeout = ref None in
  let r_scope = ref None in
  let r_session_cookie_name = ref None in
  let r_user_pool_domain = ref None in
  let r_user_pool_client_id = ref None in
  let r_user_pool_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OnUnauthenticatedRequest";
      "AuthenticationRequestExtraParams";
      "SessionTimeout";
      "Scope";
      "SessionCookieName";
      "UserPoolDomain";
      "UserPoolClientId";
      "UserPoolArn";
    ] (fun tag _ ->
      match tag with
      | "OnUnauthenticatedRequest" ->
          r_on_unauthenticated_request :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnUnauthenticatedRequest"
                 (fun i _ -> authenticate_cognito_action_conditional_behavior_enum_of_xml i)
                 ())
      | "AuthenticationRequestExtraParams" ->
          r_authentication_request_extra_params :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationRequestExtraParams"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ ->
                             authenticate_cognito_action_authentication_request_param_name_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ ->
                             authenticate_cognito_action_authentication_request_param_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "SessionTimeout" ->
          r_session_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SessionTimeout"
                 (fun i _ -> authenticate_cognito_action_session_timeout_of_xml i)
                 ())
      | "Scope" ->
          r_scope :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Scope"
                 (fun i _ -> authenticate_cognito_action_scope_of_xml i)
                 ())
      | "SessionCookieName" ->
          r_session_cookie_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SessionCookieName"
                 (fun i _ -> authenticate_cognito_action_session_cookie_name_of_xml i)
                 ())
      | "UserPoolDomain" ->
          r_user_pool_domain :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserPoolDomain"
                 (fun i _ -> authenticate_cognito_action_user_pool_domain_of_xml i)
                 ())
      | "UserPoolClientId" ->
          r_user_pool_client_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserPoolClientId"
                 (fun i _ -> authenticate_cognito_action_user_pool_client_id_of_xml i)
                 ())
      | "UserPoolArn" ->
          r_user_pool_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserPoolArn"
                 (fun i _ -> authenticate_cognito_action_user_pool_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     on_unauthenticated_request = ( ! ) r_on_unauthenticated_request;
     authentication_request_extra_params = ( ! ) r_authentication_request_extra_params;
     session_timeout = ( ! ) r_session_timeout;
     scope = ( ! ) r_scope;
     session_cookie_name = ( ! ) r_session_cookie_name;
     user_pool_domain = Smaws_Lib.Xml.Parse.required "UserPoolDomain" (( ! ) r_user_pool_domain) i;
     user_pool_client_id =
       Smaws_Lib.Xml.Parse.required "UserPoolClientId" (( ! ) r_user_pool_client_id) i;
     user_pool_arn = Smaws_Lib.Xml.Parse.required "UserPoolArn" (( ! ) r_user_pool_arn) i;
   }
    : authenticate_cognito_action_config)

let action_order_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let redirect_action_protocol_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let redirect_action_port_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let redirect_action_host_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let redirect_action_path_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let redirect_action_query_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let redirect_action_status_code_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "HTTP_302" -> HTTP_302
   | "HTTP_301" -> HTTP_301
   | _ -> failwith "unknown enum value"
    : redirect_action_status_code_enum)

let redirect_action_config_of_xml i =
  let r_status_code = ref None in
  let r_query = ref None in
  let r_path = ref None in
  let r_host = ref None in
  let r_port = ref None in
  let r_protocol = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StatusCode"; "Query"; "Path"; "Host"; "Port"; "Protocol" ] (fun tag _ ->
      match tag with
      | "StatusCode" ->
          r_status_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusCode"
                 (fun i _ -> redirect_action_status_code_enum_of_xml i)
                 ())
      | "Query" ->
          r_query :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Query"
                 (fun i _ -> redirect_action_query_of_xml i)
                 ())
      | "Path" ->
          r_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Path"
                 (fun i _ -> redirect_action_path_of_xml i)
                 ())
      | "Host" ->
          r_host :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Host"
                 (fun i _ -> redirect_action_host_of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port"
                 (fun i _ -> redirect_action_port_of_xml i)
                 ())
      | "Protocol" ->
          r_protocol :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Protocol"
                 (fun i _ -> redirect_action_protocol_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status_code = Smaws_Lib.Xml.Parse.required "StatusCode" (( ! ) r_status_code) i;
     query = ( ! ) r_query;
     path = ( ! ) r_path;
     host = ( ! ) r_host;
     port = ( ! ) r_port;
     protocol = ( ! ) r_protocol;
   }
    : redirect_action_config)

let fixed_response_action_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let fixed_response_action_status_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let fixed_response_action_content_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let fixed_response_action_config_of_xml i =
  let r_content_type = ref None in
  let r_status_code = ref None in
  let r_message_body = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ContentType"; "StatusCode"; "MessageBody" ]
    (fun tag _ ->
      match tag with
      | "ContentType" ->
          r_content_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ContentType"
                 (fun i _ -> fixed_response_action_content_type_of_xml i)
                 ())
      | "StatusCode" ->
          r_status_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusCode"
                 (fun i _ -> fixed_response_action_status_code_of_xml i)
                 ())
      | "MessageBody" ->
          r_message_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageBody"
                 (fun i _ -> fixed_response_action_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     content_type = ( ! ) r_content_type;
     status_code = Smaws_Lib.Xml.Parse.required "StatusCode" (( ! ) r_status_code) i;
     message_body = ( ! ) r_message_body;
   }
    : fixed_response_action_config)

let forward_action_config_of_xml i =
  let r_target_group_stickiness_config = ref None in
  let r_target_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TargetGroupStickinessConfig"; "TargetGroups" ]
    (fun tag _ ->
      match tag with
      | "TargetGroupStickinessConfig" ->
          r_target_group_stickiness_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupStickinessConfig"
                 (fun i _ -> target_group_stickiness_config_of_xml i)
                 ())
      | "TargetGroups" ->
          r_target_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_group_tuple_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_group_stickiness_config = ( ! ) r_target_group_stickiness_config;
     target_groups = ( ! ) r_target_groups;
   }
    : forward_action_config)

let jwt_validation_action_jwks_endpoint_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let jwt_validation_action_issuer_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let jwt_validation_action_additional_claim_format_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "space-separated-values" -> SPACE_SEPARATED_VALUES
   | "string-array" -> STRING_ARRAY
   | "single-string" -> SINGLE_STRING
   | _ -> failwith "unknown enum value"
    : jwt_validation_action_additional_claim_format_enum)

let jwt_validation_action_additional_claim_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let jwt_validation_action_additional_claim_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let jwt_validation_action_additional_claim_values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> jwt_validation_action_additional_claim_value_of_xml i)
    ()

let jwt_validation_action_additional_claim_of_xml i =
  let r_values = ref None in
  let r_name = ref None in
  let r_format = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values"; "Name"; "Format" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> jwt_validation_action_additional_claim_value_of_xml i)
                     ())
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> jwt_validation_action_additional_claim_name_of_xml i)
                 ())
      | "Format" ->
          r_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Format"
                 (fun i _ -> jwt_validation_action_additional_claim_format_enum_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     values = Smaws_Lib.Xml.Parse.required "Values" (( ! ) r_values) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     format = Smaws_Lib.Xml.Parse.required "Format" (( ! ) r_format) i;
   }
    : jwt_validation_action_additional_claim)

let jwt_validation_action_additional_claims_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> jwt_validation_action_additional_claim_of_xml i)
    ()

let jwt_validation_action_config_of_xml i =
  let r_additional_claims = ref None in
  let r_issuer = ref None in
  let r_jwks_endpoint = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AdditionalClaims"; "Issuer"; "JwksEndpoint" ]
    (fun tag _ ->
      match tag with
      | "AdditionalClaims" ->
          r_additional_claims :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdditionalClaims"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> jwt_validation_action_additional_claim_of_xml i)
                     ())
                 ())
      | "Issuer" ->
          r_issuer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Issuer"
                 (fun i _ -> jwt_validation_action_issuer_of_xml i)
                 ())
      | "JwksEndpoint" ->
          r_jwks_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JwksEndpoint"
                 (fun i _ -> jwt_validation_action_jwks_endpoint_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     additional_claims = ( ! ) r_additional_claims;
     issuer = Smaws_Lib.Xml.Parse.required "Issuer" (( ! ) r_issuer) i;
     jwks_endpoint = Smaws_Lib.Xml.Parse.required "JwksEndpoint" (( ! ) r_jwks_endpoint) i;
   }
    : jwt_validation_action_config)

let action_of_xml i =
  let r_jwt_validation_config = ref None in
  let r_forward_config = ref None in
  let r_fixed_response_config = ref None in
  let r_redirect_config = ref None in
  let r_order = ref None in
  let r_authenticate_cognito_config = ref None in
  let r_authenticate_oidc_config = ref None in
  let r_target_group_arn = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "JwtValidationConfig";
      "ForwardConfig";
      "FixedResponseConfig";
      "RedirectConfig";
      "Order";
      "AuthenticateCognitoConfig";
      "AuthenticateOidcConfig";
      "TargetGroupArn";
      "Type";
    ] (fun tag _ ->
      match tag with
      | "JwtValidationConfig" ->
          r_jwt_validation_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "JwtValidationConfig"
                 (fun i _ -> jwt_validation_action_config_of_xml i)
                 ())
      | "ForwardConfig" ->
          r_forward_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForwardConfig"
                 (fun i _ -> forward_action_config_of_xml i)
                 ())
      | "FixedResponseConfig" ->
          r_fixed_response_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FixedResponseConfig"
                 (fun i _ -> fixed_response_action_config_of_xml i)
                 ())
      | "RedirectConfig" ->
          r_redirect_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedirectConfig"
                 (fun i _ -> redirect_action_config_of_xml i)
                 ())
      | "Order" ->
          r_order :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Order" (fun i _ -> action_order_of_xml i) ())
      | "AuthenticateCognitoConfig" ->
          r_authenticate_cognito_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticateCognitoConfig"
                 (fun i _ -> authenticate_cognito_action_config_of_xml i)
                 ())
      | "AuthenticateOidcConfig" ->
          r_authenticate_oidc_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticateOidcConfig"
                 (fun i _ -> authenticate_oidc_action_config_of_xml i)
                 ())
      | "TargetGroupArn" ->
          r_target_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupArn"
                 (fun i _ -> target_group_arn_of_xml i)
                 ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> action_type_enum_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     jwt_validation_config = ( ! ) r_jwt_validation_config;
     forward_config = ( ! ) r_forward_config;
     fixed_response_config = ( ! ) r_fixed_response_config;
     redirect_config = ( ! ) r_redirect_config;
     order = ( ! ) r_order;
     authenticate_cognito_config = ( ! ) r_authenticate_cognito_config;
     authenticate_oidc_config = ( ! ) r_authenticate_oidc_config;
     target_group_arn = ( ! ) r_target_group_arn;
     type_ = Smaws_Lib.Xml.Parse.required "Type" (( ! ) r_type_) i;
   }
    : action)

let actions_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> action_of_xml i) ()

let is_default_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let host_header_rewrite_config_of_xml i =
  let r_rewrites = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Rewrites" ] (fun tag _ ->
      match tag with
      | "Rewrites" ->
          r_rewrites :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Rewrites"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> rewrite_config_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rewrites = ( ! ) r_rewrites } : host_header_rewrite_config)

let rule_transform_of_xml i =
  let r_url_rewrite_config = ref None in
  let r_host_header_rewrite_config = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UrlRewriteConfig"; "HostHeaderRewriteConfig"; "Type" ] (fun tag _ ->
      match tag with
      | "UrlRewriteConfig" ->
          r_url_rewrite_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UrlRewriteConfig"
                 (fun i _ -> url_rewrite_config_of_xml i)
                 ())
      | "HostHeaderRewriteConfig" ->
          r_host_header_rewrite_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HostHeaderRewriteConfig"
                 (fun i _ -> host_header_rewrite_config_of_xml i)
                 ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> transform_type_enum_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     url_rewrite_config = ( ! ) r_url_rewrite_config;
     host_header_rewrite_config = ( ! ) r_host_header_rewrite_config;
     type_ = Smaws_Lib.Xml.Parse.required "Type" (( ! ) r_type_) i;
   }
    : rule_transform)

let rule_transform_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rule_transform_of_xml i) ()

let rule_of_xml i =
  let r_transforms = ref None in
  let r_is_default = ref None in
  let r_actions = ref None in
  let r_conditions = ref None in
  let r_priority = ref None in
  let r_rule_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Transforms"; "IsDefault"; "Actions"; "Conditions"; "Priority"; "RuleArn" ] (fun tag _ ->
      match tag with
      | "Transforms" ->
          r_transforms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Transforms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> rule_transform_of_xml i)
                     ())
                 ())
      | "IsDefault" ->
          r_is_default :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsDefault" (fun i _ -> is_default_of_xml i) ())
      | "Actions" ->
          r_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Actions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> action_of_xml i) ())
                 ())
      | "Conditions" ->
          r_conditions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Conditions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> rule_condition_of_xml i)
                     ())
                 ())
      | "Priority" ->
          r_priority :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Priority" (fun i _ -> string__of_xml i) ())
      | "RuleArn" ->
          r_rule_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RuleArn" (fun i _ -> rule_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     transforms = ( ! ) r_transforms;
     is_default = ( ! ) r_is_default;
     actions = ( ! ) r_actions;
     conditions = ( ! ) r_conditions;
     priority = ( ! ) r_priority;
     rule_arn = ( ! ) r_rule_arn;
   }
    : rule)

let rules_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rule_of_xml i) ()

let set_rule_priorities_output_of_xml i =
  let r_rules = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Rules" ] (fun tag _ ->
      match tag with
      | "Rules" ->
          r_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Rules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rule_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rules = ( ! ) r_rules } : set_rule_priorities_output)

let rule_priority_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let rule_priority_pair_of_xml i =
  let r_priority = ref None in
  let r_rule_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Priority"; "RuleArn" ] (fun tag _ ->
      match tag with
      | "Priority" ->
          r_priority :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Priority"
                 (fun i _ -> rule_priority_of_xml i)
                 ())
      | "RuleArn" ->
          r_rule_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RuleArn" (fun i _ -> rule_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ priority = ( ! ) r_priority; rule_arn = ( ! ) r_rule_arn } : rule_priority_pair)

let rule_priority_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rule_priority_pair_of_xml i) ()

let set_rule_priorities_input_of_xml i =
  let r_rule_priorities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RulePriorities" ] (fun tag _ ->
      match tag with
      | "RulePriorities" ->
          r_rule_priorities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RulePriorities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> rule_priority_pair_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rule_priorities = Smaws_Lib.Xml.Parse.required "RulePriorities" (( ! ) r_rule_priorities) i }
    : set_rule_priorities_input)

let rule_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : rule_not_found_exception)

let priority_in_use_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : priority_in_use_exception)

let operation_not_permitted_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : operation_not_permitted_exception)

let set_ip_address_type_output_of_xml i =
  let r_ip_address_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IpAddressType" ] (fun tag _ ->
      match tag with
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType"
                 (fun i _ -> ip_address_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ ip_address_type = ( ! ) r_ip_address_type } : set_ip_address_type_output)

let set_ip_address_type_input_of_xml i =
  let r_ip_address_type = ref None in
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IpAddressType"; "LoadBalancerArn" ] (fun tag _ ->
      match tag with
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType"
                 (fun i _ -> ip_address_type_of_xml i)
                 ())
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     ip_address_type = Smaws_Lib.Xml.Parse.required "IpAddressType" (( ! ) r_ip_address_type) i;
     load_balancer_arn =
       Smaws_Lib.Xml.Parse.required "LoadBalancerArn" (( ! ) r_load_balancer_arn) i;
   }
    : set_ip_address_type_input)

let ssl_policy_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : ssl_policy_not_found_exception)

let s3_object_version_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let s3_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let s3_bucket_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let rule_arns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rule_arn_of_xml i) ()

let revocation_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> revocation_id_of_xml i) ()

let revocation_id_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : revocation_id_not_found_exception)

let revocation_content_of_xml i =
  let r_revocation_type = ref None in
  let r_s3_object_version = ref None in
  let r_s3_key = ref None in
  let r_s3_bucket = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "RevocationType"; "S3ObjectVersion"; "S3Key"; "S3Bucket" ] (fun tag _ ->
      match tag with
      | "RevocationType" ->
          r_revocation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevocationType"
                 (fun i _ -> revocation_type_of_xml i)
                 ())
      | "S3ObjectVersion" ->
          r_s3_object_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "S3ObjectVersion"
                 (fun i _ -> s3_object_version_of_xml i)
                 ())
      | "S3Key" ->
          r_s3_key :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "S3Key" (fun i _ -> s3_key_of_xml i) ())
      | "S3Bucket" ->
          r_s3_bucket :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "S3Bucket" (fun i _ -> s3_bucket_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     revocation_type = ( ! ) r_revocation_type;
     s3_object_version = ( ! ) r_s3_object_version;
     s3_key = ( ! ) r_s3_key;
     s3_bucket = ( ! ) r_s3_bucket;
   }
    : revocation_content)

let revocation_contents_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> revocation_content_of_xml i) ()

let revocation_content_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : revocation_content_not_found_exception)

let resource_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_not_found_exception)

let resource_in_use_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_in_use_exception)

let resource_arns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_arn_of_xml i) ()

let reset_transforms_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let reset_capacity_reservation_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let remove_trust_store_revocations_output_of_xml i = ()

let remove_trust_store_revocations_input_of_xml i =
  let r_revocation_ids = ref None in
  let r_trust_store_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RevocationIds"; "TrustStoreArn" ] (fun tag _ ->
      match tag with
      | "RevocationIds" ->
          r_revocation_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevocationIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> revocation_id_of_xml i)
                     ())
                 ())
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     revocation_ids = Smaws_Lib.Xml.Parse.required "RevocationIds" (( ! ) r_revocation_ids) i;
     trust_store_arn = Smaws_Lib.Xml.Parse.required "TrustStoreArn" (( ! ) r_trust_store_arn) i;
   }
    : remove_trust_store_revocations_input)

let remove_tags_output_of_xml i = ()

let remove_tags_input_of_xml i =
  let r_tag_keys = ref None in
  let r_resource_arns = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TagKeys"; "ResourceArns" ] (fun tag _ ->
      match tag with
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ())
                 ())
      | "ResourceArns" ->
          r_resource_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_arn_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
     resource_arns = Smaws_Lib.Xml.Parse.required "ResourceArns" (( ! ) r_resource_arns) i;
   }
    : remove_tags_input)

let listener_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : listener_not_found_exception)

let remove_listener_certificates_output_of_xml i = ()
let listener_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let certificate_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let default_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let certificate_of_xml i =
  let r_is_default = ref None in
  let r_certificate_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IsDefault"; "CertificateArn" ] (fun tag _ ->
      match tag with
      | "IsDefault" ->
          r_is_default :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IsDefault" (fun i _ -> default_of_xml i) ())
      | "CertificateArn" ->
          r_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateArn"
                 (fun i _ -> certificate_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ is_default = ( ! ) r_is_default; certificate_arn = ( ! ) r_certificate_arn } : certificate)

let certificate_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> certificate_of_xml i) ()

let remove_listener_certificates_input_of_xml i =
  let r_certificates = ref None in
  let r_listener_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Certificates"; "ListenerArn" ] (fun tag _ ->
      match tag with
      | "Certificates" ->
          r_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Certificates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> certificate_of_xml i)
                     ())
                 ())
      | "ListenerArn" ->
          r_listener_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerArn"
                 (fun i _ -> listener_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     certificates = Smaws_Lib.Xml.Parse.required "Certificates" (( ! ) r_certificates) i;
     listener_arn = Smaws_Lib.Xml.Parse.required "ListenerArn" (( ! ) r_listener_arn) i;
   }
    : remove_listener_certificates_input)

let remove_ipam_pool_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "ipv4" -> Ipv4 | _ -> failwith "unknown enum value" : remove_ipam_pool_enum)

let remove_ipam_pools_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> remove_ipam_pool_enum_of_xml i) ()

let register_targets_output_of_xml i = ()

let register_targets_input_of_xml i =
  let r_targets = ref None in
  let r_target_group_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Targets"; "TargetGroupArn" ] (fun tag _ ->
      match tag with
      | "Targets" ->
          r_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Targets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_description_of_xml i)
                     ())
                 ())
      | "TargetGroupArn" ->
          r_target_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupArn"
                 (fun i _ -> target_group_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     targets = Smaws_Lib.Xml.Parse.required "Targets" (( ! ) r_targets) i;
     target_group_arn = Smaws_Lib.Xml.Parse.required "TargetGroupArn" (( ! ) r_target_group_arn) i;
   }
    : register_targets_input)

let invalid_target_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_target_exception)

let prior_request_not_complete_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : prior_request_not_complete_exception)

let policy_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let page_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let mode_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let ignore_client_certificate_expiry_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let advertise_trust_store_ca_names_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "off" -> Off | "on" -> On | _ -> failwith "unknown enum value"
    : advertise_trust_store_ca_names_enum)

let mutual_authentication_attributes_of_xml i =
  let r_advertise_trust_store_ca_names = ref None in
  let r_trust_store_association_status = ref None in
  let r_ignore_client_certificate_expiry = ref None in
  let r_trust_store_arn = ref None in
  let r_mode = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AdvertiseTrustStoreCaNames";
      "TrustStoreAssociationStatus";
      "IgnoreClientCertificateExpiry";
      "TrustStoreArn";
      "Mode";
    ] (fun tag _ ->
      match tag with
      | "AdvertiseTrustStoreCaNames" ->
          r_advertise_trust_store_ca_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdvertiseTrustStoreCaNames"
                 (fun i _ -> advertise_trust_store_ca_names_enum_of_xml i)
                 ())
      | "TrustStoreAssociationStatus" ->
          r_trust_store_association_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreAssociationStatus"
                 (fun i _ -> trust_store_association_status_enum_of_xml i)
                 ())
      | "IgnoreClientCertificateExpiry" ->
          r_ignore_client_certificate_expiry :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IgnoreClientCertificateExpiry"
                 (fun i _ -> ignore_client_certificate_expiry_of_xml i)
                 ())
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | "Mode" ->
          r_mode := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Mode" (fun i _ -> mode_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     advertise_trust_store_ca_names = ( ! ) r_advertise_trust_store_ca_names;
     trust_store_association_status = ( ! ) r_trust_store_association_status;
     ignore_client_certificate_expiry = ( ! ) r_ignore_client_certificate_expiry;
     trust_store_arn = ( ! ) r_trust_store_arn;
     mode = ( ! ) r_mode;
   }
    : mutual_authentication_attributes)

let modify_trust_store_output_of_xml i =
  let r_trust_stores = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TrustStores" ] (fun tag _ ->
      match tag with
      | "TrustStores" ->
          r_trust_stores :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStores"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> trust_store_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ trust_stores = ( ! ) r_trust_stores } : modify_trust_store_output)

let modify_trust_store_input_of_xml i =
  let r_ca_certificates_bundle_s3_object_version = ref None in
  let r_ca_certificates_bundle_s3_key = ref None in
  let r_ca_certificates_bundle_s3_bucket = ref None in
  let r_trust_store_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CaCertificatesBundleS3ObjectVersion";
      "CaCertificatesBundleS3Key";
      "CaCertificatesBundleS3Bucket";
      "TrustStoreArn";
    ] (fun tag _ ->
      match tag with
      | "CaCertificatesBundleS3ObjectVersion" ->
          r_ca_certificates_bundle_s3_object_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CaCertificatesBundleS3ObjectVersion"
                 (fun i _ -> s3_object_version_of_xml i)
                 ())
      | "CaCertificatesBundleS3Key" ->
          r_ca_certificates_bundle_s3_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CaCertificatesBundleS3Key"
                 (fun i _ -> s3_key_of_xml i)
                 ())
      | "CaCertificatesBundleS3Bucket" ->
          r_ca_certificates_bundle_s3_bucket :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CaCertificatesBundleS3Bucket"
                 (fun i _ -> s3_bucket_of_xml i)
                 ())
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     ca_certificates_bundle_s3_object_version = ( ! ) r_ca_certificates_bundle_s3_object_version;
     ca_certificates_bundle_s3_key =
       Smaws_Lib.Xml.Parse.required "CaCertificatesBundleS3Key"
         (( ! ) r_ca_certificates_bundle_s3_key)
         i;
     ca_certificates_bundle_s3_bucket =
       Smaws_Lib.Xml.Parse.required "CaCertificatesBundleS3Bucket"
         (( ! ) r_ca_certificates_bundle_s3_bucket)
         i;
     trust_store_arn = Smaws_Lib.Xml.Parse.required "TrustStoreArn" (( ! ) r_trust_store_arn) i;
   }
    : modify_trust_store_input)

let invalid_ca_certificates_bundle_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_ca_certificates_bundle_exception)

let ca_certificates_bundle_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : ca_certificates_bundle_not_found_exception)

let modify_target_group_output_of_xml i =
  let r_target_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TargetGroups" ] (fun tag _ ->
      match tag with
      | "TargetGroups" ->
          r_target_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ target_groups = ( ! ) r_target_groups } : modify_target_group_output)

let modify_target_group_input_of_xml i =
  let r_matcher = ref None in
  let r_unhealthy_threshold_count = ref None in
  let r_healthy_threshold_count = ref None in
  let r_health_check_timeout_seconds = ref None in
  let r_health_check_interval_seconds = ref None in
  let r_health_check_enabled = ref None in
  let r_health_check_path = ref None in
  let r_health_check_port = ref None in
  let r_health_check_protocol = ref None in
  let r_target_group_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Matcher";
      "UnhealthyThresholdCount";
      "HealthyThresholdCount";
      "HealthCheckTimeoutSeconds";
      "HealthCheckIntervalSeconds";
      "HealthCheckEnabled";
      "HealthCheckPath";
      "HealthCheckPort";
      "HealthCheckProtocol";
      "TargetGroupArn";
    ] (fun tag _ ->
      match tag with
      | "Matcher" ->
          r_matcher :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Matcher" (fun i _ -> matcher_of_xml i) ())
      | "UnhealthyThresholdCount" ->
          r_unhealthy_threshold_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UnhealthyThresholdCount"
                 (fun i _ -> health_check_threshold_count_of_xml i)
                 ())
      | "HealthyThresholdCount" ->
          r_healthy_threshold_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthyThresholdCount"
                 (fun i _ -> health_check_threshold_count_of_xml i)
                 ())
      | "HealthCheckTimeoutSeconds" ->
          r_health_check_timeout_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckTimeoutSeconds"
                 (fun i _ -> health_check_timeout_seconds_of_xml i)
                 ())
      | "HealthCheckIntervalSeconds" ->
          r_health_check_interval_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckIntervalSeconds"
                 (fun i _ -> health_check_interval_seconds_of_xml i)
                 ())
      | "HealthCheckEnabled" ->
          r_health_check_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckEnabled"
                 (fun i _ -> health_check_enabled_of_xml i)
                 ())
      | "HealthCheckPath" ->
          r_health_check_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckPath" (fun i _ -> path_of_xml i) ())
      | "HealthCheckPort" ->
          r_health_check_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckPort"
                 (fun i _ -> health_check_port_of_xml i)
                 ())
      | "HealthCheckProtocol" ->
          r_health_check_protocol :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckProtocol"
                 (fun i _ -> protocol_enum_of_xml i)
                 ())
      | "TargetGroupArn" ->
          r_target_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupArn"
                 (fun i _ -> target_group_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     matcher = ( ! ) r_matcher;
     unhealthy_threshold_count = ( ! ) r_unhealthy_threshold_count;
     healthy_threshold_count = ( ! ) r_healthy_threshold_count;
     health_check_timeout_seconds = ( ! ) r_health_check_timeout_seconds;
     health_check_interval_seconds = ( ! ) r_health_check_interval_seconds;
     health_check_enabled = ( ! ) r_health_check_enabled;
     health_check_path = ( ! ) r_health_check_path;
     health_check_port = ( ! ) r_health_check_port;
     health_check_protocol = ( ! ) r_health_check_protocol;
     target_group_arn = Smaws_Lib.Xml.Parse.required "TargetGroupArn" (( ! ) r_target_group_arn) i;
   }
    : modify_target_group_input)

let modify_target_group_attributes_output_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_group_attribute_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : modify_target_group_attributes_output)

let modify_target_group_attributes_input_of_xml i =
  let r_attributes = ref None in
  let r_target_group_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes"; "TargetGroupArn" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_group_attribute_of_xml i)
                     ())
                 ())
      | "TargetGroupArn" ->
          r_target_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupArn"
                 (fun i _ -> target_group_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attributes = Smaws_Lib.Xml.Parse.required "Attributes" (( ! ) r_attributes) i;
     target_group_arn = Smaws_Lib.Xml.Parse.required "TargetGroupArn" (( ! ) r_target_group_arn) i;
   }
    : modify_target_group_attributes_input)

let modify_rule_output_of_xml i =
  let r_rules = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Rules" ] (fun tag _ ->
      match tag with
      | "Rules" ->
          r_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Rules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rule_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rules = ( ! ) r_rules } : modify_rule_output)

let modify_rule_input_of_xml i =
  let r_reset_transforms = ref None in
  let r_transforms = ref None in
  let r_actions = ref None in
  let r_conditions = ref None in
  let r_rule_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResetTransforms"; "Transforms"; "Actions"; "Conditions"; "RuleArn" ] (fun tag _ ->
      match tag with
      | "ResetTransforms" ->
          r_reset_transforms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResetTransforms"
                 (fun i _ -> reset_transforms_of_xml i)
                 ())
      | "Transforms" ->
          r_transforms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Transforms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> rule_transform_of_xml i)
                     ())
                 ())
      | "Actions" ->
          r_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Actions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> action_of_xml i) ())
                 ())
      | "Conditions" ->
          r_conditions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Conditions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> rule_condition_of_xml i)
                     ())
                 ())
      | "RuleArn" ->
          r_rule_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RuleArn" (fun i _ -> rule_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reset_transforms = ( ! ) r_reset_transforms;
     transforms = ( ! ) r_transforms;
     actions = ( ! ) r_actions;
     conditions = ( ! ) r_conditions;
     rule_arn = Smaws_Lib.Xml.Parse.required "RuleArn" (( ! ) r_rule_arn) i;
   }
    : modify_rule_input)

let invalid_load_balancer_action_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_load_balancer_action_exception)

let incompatible_protocols_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : incompatible_protocols_exception)

let load_balancer_attribute_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let load_balancer_attribute_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let load_balancer_attribute_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Key" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> load_balancer_attribute_value_of_xml i)
                 ())
      | "Key" ->
          r_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Key"
                 (fun i _ -> load_balancer_attribute_key_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; key = ( ! ) r_key } : load_balancer_attribute)

let load_balancer_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_balancer_attribute_of_xml i) ()

let modify_load_balancer_attributes_output_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_attribute_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : modify_load_balancer_attributes_output)

let modify_load_balancer_attributes_input_of_xml i =
  let r_attributes = ref None in
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes"; "LoadBalancerArn" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_attribute_of_xml i)
                     ())
                 ())
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attributes = Smaws_Lib.Xml.Parse.required "Attributes" (( ! ) r_attributes) i;
     load_balancer_arn =
       Smaws_Lib.Xml.Parse.required "LoadBalancerArn" (( ! ) r_load_balancer_arn) i;
   }
    : modify_load_balancer_attributes_input)

let alpn_policy_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let alpn_policy_name_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> alpn_policy_value_of_xml i) ()

let listener_of_xml i =
  let r_mutual_authentication = ref None in
  let r_alpn_policy = ref None in
  let r_default_actions = ref None in
  let r_ssl_policy = ref None in
  let r_certificates = ref None in
  let r_protocol = ref None in
  let r_port = ref None in
  let r_load_balancer_arn = ref None in
  let r_listener_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MutualAuthentication";
      "AlpnPolicy";
      "DefaultActions";
      "SslPolicy";
      "Certificates";
      "Protocol";
      "Port";
      "LoadBalancerArn";
      "ListenerArn";
    ] (fun tag _ ->
      match tag with
      | "MutualAuthentication" ->
          r_mutual_authentication :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MutualAuthentication"
                 (fun i _ -> mutual_authentication_attributes_of_xml i)
                 ())
      | "AlpnPolicy" ->
          r_alpn_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlpnPolicy"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> alpn_policy_value_of_xml i)
                     ())
                 ())
      | "DefaultActions" ->
          r_default_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> action_of_xml i) ())
                 ())
      | "SslPolicy" ->
          r_ssl_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SslPolicy"
                 (fun i _ -> ssl_policy_name_of_xml i)
                 ())
      | "Certificates" ->
          r_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Certificates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> certificate_of_xml i)
                     ())
                 ())
      | "Protocol" ->
          r_protocol :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Protocol"
                 (fun i _ -> protocol_enum_of_xml i)
                 ())
      | "Port" ->
          r_port := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> port_of_xml i) ())
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | "ListenerArn" ->
          r_listener_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerArn"
                 (fun i _ -> listener_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     mutual_authentication = ( ! ) r_mutual_authentication;
     alpn_policy = ( ! ) r_alpn_policy;
     default_actions = ( ! ) r_default_actions;
     ssl_policy = ( ! ) r_ssl_policy;
     certificates = ( ! ) r_certificates;
     protocol = ( ! ) r_protocol;
     port = ( ! ) r_port;
     load_balancer_arn = ( ! ) r_load_balancer_arn;
     listener_arn = ( ! ) r_listener_arn;
   }
    : listener)

let listeners_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_of_xml i) ()

let modify_listener_output_of_xml i =
  let r_listeners = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Listeners" ] (fun tag _ ->
      match tag with
      | "Listeners" ->
          r_listeners :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Listeners"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ listeners = ( ! ) r_listeners } : modify_listener_output)

let modify_listener_input_of_xml i =
  let r_mutual_authentication = ref None in
  let r_alpn_policy = ref None in
  let r_default_actions = ref None in
  let r_certificates = ref None in
  let r_ssl_policy = ref None in
  let r_protocol = ref None in
  let r_port = ref None in
  let r_listener_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MutualAuthentication";
      "AlpnPolicy";
      "DefaultActions";
      "Certificates";
      "SslPolicy";
      "Protocol";
      "Port";
      "ListenerArn";
    ] (fun tag _ ->
      match tag with
      | "MutualAuthentication" ->
          r_mutual_authentication :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MutualAuthentication"
                 (fun i _ -> mutual_authentication_attributes_of_xml i)
                 ())
      | "AlpnPolicy" ->
          r_alpn_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlpnPolicy"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> alpn_policy_value_of_xml i)
                     ())
                 ())
      | "DefaultActions" ->
          r_default_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> action_of_xml i) ())
                 ())
      | "Certificates" ->
          r_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Certificates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> certificate_of_xml i)
                     ())
                 ())
      | "SslPolicy" ->
          r_ssl_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SslPolicy"
                 (fun i _ -> ssl_policy_name_of_xml i)
                 ())
      | "Protocol" ->
          r_protocol :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Protocol"
                 (fun i _ -> protocol_enum_of_xml i)
                 ())
      | "Port" ->
          r_port := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> port_of_xml i) ())
      | "ListenerArn" ->
          r_listener_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerArn"
                 (fun i _ -> listener_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     mutual_authentication = ( ! ) r_mutual_authentication;
     alpn_policy = ( ! ) r_alpn_policy;
     default_actions = ( ! ) r_default_actions;
     certificates = ( ! ) r_certificates;
     ssl_policy = ( ! ) r_ssl_policy;
     protocol = ( ! ) r_protocol;
     port = ( ! ) r_port;
     listener_arn = Smaws_Lib.Xml.Parse.required "ListenerArn" (( ! ) r_listener_arn) i;
   }
    : modify_listener_input)

let listener_attribute_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let listener_attribute_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let listener_attribute_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Key" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> listener_attribute_value_of_xml i)
                 ())
      | "Key" ->
          r_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Key"
                 (fun i _ -> listener_attribute_key_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; key = ( ! ) r_key } : listener_attribute)

let listener_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_attribute_of_xml i) ()

let modify_listener_attributes_output_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> listener_attribute_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : modify_listener_attributes_output)

let modify_listener_attributes_input_of_xml i =
  let r_attributes = ref None in
  let r_listener_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes"; "ListenerArn" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> listener_attribute_of_xml i)
                     ())
                 ())
      | "ListenerArn" ->
          r_listener_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerArn"
                 (fun i _ -> listener_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attributes = Smaws_Lib.Xml.Parse.required "Attributes" (( ! ) r_attributes) i;
     listener_arn = Smaws_Lib.Xml.Parse.required "ListenerArn" (( ! ) r_listener_arn) i;
   }
    : modify_listener_attributes_input)

let duplicate_listener_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : duplicate_listener_exception)

let certificate_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : certificate_not_found_exception)

let alpn_policy_not_supported_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : alpn_policy_not_supported_exception)

let ipam_pool_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let ipam_pools_of_xml i =
  let r_ipv4_ipam_pool_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Ipv4IpamPoolId" ] (fun tag _ ->
      match tag with
      | "Ipv4IpamPoolId" ->
          r_ipv4_ipam_pool_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Ipv4IpamPoolId"
                 (fun i _ -> ipam_pool_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ ipv4_ipam_pool_id = ( ! ) r_ipv4_ipam_pool_id } : ipam_pools)

let modify_ip_pools_output_of_xml i =
  let r_ipam_pools = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IpamPools" ] (fun tag _ ->
      match tag with
      | "IpamPools" ->
          r_ipam_pools :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpamPools" (fun i _ -> ipam_pools_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ ipam_pools = ( ! ) r_ipam_pools } : modify_ip_pools_output)

let modify_ip_pools_input_of_xml i =
  let r_remove_ipam_pools = ref None in
  let r_ipam_pools = ref None in
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RemoveIpamPools"; "IpamPools"; "LoadBalancerArn" ]
    (fun tag _ ->
      match tag with
      | "RemoveIpamPools" ->
          r_remove_ipam_pools :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemoveIpamPools"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> remove_ipam_pool_enum_of_xml i)
                     ())
                 ())
      | "IpamPools" ->
          r_ipam_pools :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpamPools" (fun i _ -> ipam_pools_of_xml i) ())
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     remove_ipam_pools = ( ! ) r_remove_ipam_pools;
     ipam_pools = ( ! ) r_ipam_pools;
     load_balancer_arn =
       Smaws_Lib.Xml.Parse.required "LoadBalancerArn" (( ! ) r_load_balancer_arn) i;
   }
    : modify_ip_pools_input)

let last_modified_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let decrease_requests_remaining_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let capacity_units_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let minimum_load_balancer_capacity_of_xml i =
  let r_capacity_units = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CapacityUnits" ] (fun tag _ ->
      match tag with
      | "CapacityUnits" ->
          r_capacity_units :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityUnits"
                 (fun i _ -> capacity_units_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ capacity_units = ( ! ) r_capacity_units } : minimum_load_balancer_capacity)

let modify_capacity_reservation_output_of_xml i =
  let r_capacity_reservation_state = ref None in
  let r_minimum_load_balancer_capacity = ref None in
  let r_decrease_requests_remaining = ref None in
  let r_last_modified_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CapacityReservationState";
      "MinimumLoadBalancerCapacity";
      "DecreaseRequestsRemaining";
      "LastModifiedTime";
    ] (fun tag _ ->
      match tag with
      | "CapacityReservationState" ->
          r_capacity_reservation_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationState"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> zonal_capacity_reservation_state_of_xml i)
                     ())
                 ())
      | "MinimumLoadBalancerCapacity" ->
          r_minimum_load_balancer_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinimumLoadBalancerCapacity"
                 (fun i _ -> minimum_load_balancer_capacity_of_xml i)
                 ())
      | "DecreaseRequestsRemaining" ->
          r_decrease_requests_remaining :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DecreaseRequestsRemaining"
                 (fun i _ -> decrease_requests_remaining_of_xml i)
                 ())
      | "LastModifiedTime" ->
          r_last_modified_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastModifiedTime"
                 (fun i _ -> last_modified_time_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     capacity_reservation_state = ( ! ) r_capacity_reservation_state;
     minimum_load_balancer_capacity = ( ! ) r_minimum_load_balancer_capacity;
     decrease_requests_remaining = ( ! ) r_decrease_requests_remaining;
     last_modified_time = ( ! ) r_last_modified_time;
   }
    : modify_capacity_reservation_output)

let modify_capacity_reservation_input_of_xml i =
  let r_reset_capacity_reservation = ref None in
  let r_minimum_load_balancer_capacity = ref None in
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResetCapacityReservation"; "MinimumLoadBalancerCapacity"; "LoadBalancerArn" ] (fun tag _ ->
      match tag with
      | "ResetCapacityReservation" ->
          r_reset_capacity_reservation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResetCapacityReservation"
                 (fun i _ -> reset_capacity_reservation_of_xml i)
                 ())
      | "MinimumLoadBalancerCapacity" ->
          r_minimum_load_balancer_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinimumLoadBalancerCapacity"
                 (fun i _ -> minimum_load_balancer_capacity_of_xml i)
                 ())
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reset_capacity_reservation = ( ! ) r_reset_capacity_reservation;
     minimum_load_balancer_capacity = ( ! ) r_minimum_load_balancer_capacity;
     load_balancer_arn =
       Smaws_Lib.Xml.Parse.required "LoadBalancerArn" (( ! ) r_load_balancer_arn) i;
   }
    : modify_capacity_reservation_input)

let insufficient_capacity_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : insufficient_capacity_exception)

let capacity_units_limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : capacity_units_limit_exceeded_exception)

let capacity_decrease_requests_limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : capacity_decrease_requests_limit_exceeded_exception)

let max_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let marker_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let location_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dns_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let canonical_hosted_zone_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let created_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let load_balancer_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let load_balancer_scheme_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "internal" -> INTERNAL
   | "internet-facing" -> INTERNET_FACING
   | _ -> failwith "unknown enum value"
    : load_balancer_scheme_enum)

let load_balancer_state_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "failed" -> FAILED
   | "active_impaired" -> ACTIVE_IMPAIRED
   | "provisioning" -> PROVISIONING
   | "active" -> ACTIVE
   | _ -> failwith "unknown enum value"
    : load_balancer_state_enum)

let load_balancer_state_of_xml i =
  let r_reason = ref None in
  let r_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Reason"; "Code" ] (fun tag _ ->
      match tag with
      | "Reason" ->
          r_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Reason" (fun i _ -> state_reason_of_xml i) ())
      | "Code" ->
          r_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Code"
                 (fun i _ -> load_balancer_state_enum_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ reason = ( ! ) r_reason; code = ( ! ) r_code } : load_balancer_state)

let load_balancer_type_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "gateway" -> GATEWAY
   | "network" -> NETWORK
   | "application" -> APPLICATION
   | _ -> failwith "unknown enum value"
    : load_balancer_type_enum)

let customer_owned_ipv4_pool_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let enforce_security_group_inbound_rules_on_private_link_traffic_of_xml i =
  Smaws_Lib.Xml.Parse.Read.data i

let load_balancer_of_xml i =
  let r_ipam_pools = ref None in
  let r_enable_prefix_for_ipv6_source_nat = ref None in
  let r_enforce_security_group_inbound_rules_on_private_link_traffic = ref None in
  let r_customer_owned_ipv4_pool = ref None in
  let r_ip_address_type = ref None in
  let r_security_groups = ref None in
  let r_availability_zones = ref None in
  let r_type_ = ref None in
  let r_state = ref None in
  let r_vpc_id = ref None in
  let r_scheme = ref None in
  let r_load_balancer_name = ref None in
  let r_created_time = ref None in
  let r_canonical_hosted_zone_id = ref None in
  let r_dns_name = ref None in
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "IpamPools";
      "EnablePrefixForIpv6SourceNat";
      "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic";
      "CustomerOwnedIpv4Pool";
      "IpAddressType";
      "SecurityGroups";
      "AvailabilityZones";
      "Type";
      "State";
      "VpcId";
      "Scheme";
      "LoadBalancerName";
      "CreatedTime";
      "CanonicalHostedZoneId";
      "DNSName";
      "LoadBalancerArn";
    ] (fun tag _ ->
      match tag with
      | "IpamPools" ->
          r_ipam_pools :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpamPools" (fun i _ -> ipam_pools_of_xml i) ())
      | "EnablePrefixForIpv6SourceNat" ->
          r_enable_prefix_for_ipv6_source_nat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnablePrefixForIpv6SourceNat"
                 (fun i _ -> enable_prefix_for_ipv6_source_nat_enum_of_xml i)
                 ())
      | "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic" ->
          r_enforce_security_group_inbound_rules_on_private_link_traffic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i
                 "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic"
                 (fun i _ -> enforce_security_group_inbound_rules_on_private_link_traffic_of_xml i)
                 ())
      | "CustomerOwnedIpv4Pool" ->
          r_customer_owned_ipv4_pool :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomerOwnedIpv4Pool"
                 (fun i _ -> customer_owned_ipv4_pool_of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType"
                 (fun i _ -> ip_address_type_of_xml i)
                 ())
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> security_group_id_of_xml i)
                     ())
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> load_balancer_type_enum_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> load_balancer_state_of_xml i)
                 ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> vpc_id_of_xml i) ())
      | "Scheme" ->
          r_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Scheme"
                 (fun i _ -> load_balancer_scheme_enum_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> load_balancer_name_of_xml i)
                 ())
      | "CreatedTime" ->
          r_created_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedTime"
                 (fun i _ -> created_time_of_xml i)
                 ())
      | "CanonicalHostedZoneId" ->
          r_canonical_hosted_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CanonicalHostedZoneId"
                 (fun i _ -> canonical_hosted_zone_id_of_xml i)
                 ())
      | "DNSName" ->
          r_dns_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DNSName" (fun i _ -> dns_name_of_xml i) ())
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     ipam_pools = ( ! ) r_ipam_pools;
     enable_prefix_for_ipv6_source_nat = ( ! ) r_enable_prefix_for_ipv6_source_nat;
     enforce_security_group_inbound_rules_on_private_link_traffic =
       ( ! ) r_enforce_security_group_inbound_rules_on_private_link_traffic;
     customer_owned_ipv4_pool = ( ! ) r_customer_owned_ipv4_pool;
     ip_address_type = ( ! ) r_ip_address_type;
     security_groups = ( ! ) r_security_groups;
     availability_zones = ( ! ) r_availability_zones;
     type_ = ( ! ) r_type_;
     state = ( ! ) r_state;
     vpc_id = ( ! ) r_vpc_id;
     scheme = ( ! ) r_scheme;
     load_balancer_name = ( ! ) r_load_balancer_name;
     created_time = ( ! ) r_created_time;
     canonical_hosted_zone_id = ( ! ) r_canonical_hosted_zone_id;
     dns_name = ( ! ) r_dns_name;
     load_balancer_arn = ( ! ) r_load_balancer_arn;
   }
    : load_balancer)

let load_balancers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_balancer_of_xml i) ()

let load_balancer_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_balancer_name_of_xml i) ()

let listener_arns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_arn_of_xml i) ()

let describe_target_health_input_include_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "All" -> ALL | "AnomalyDetection" -> ANOMALY | _ -> failwith "unknown enum value"
    : describe_target_health_input_include_enum)

let list_of_describe_target_health_include_options_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> describe_target_health_input_include_enum_of_xml i)
    ()

let limit_of_xml i =
  let r_max = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max"; "Name" ] (fun tag _ ->
      match tag with
      | "Max" ->
          r_max := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Max" (fun i _ -> max_of_xml i) ())
      | "Name" ->
          r_name := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max = ( ! ) r_max; name = ( ! ) r_name } : limit)

let limits_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> limit_of_xml i) ()

let invalid_scheme_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_scheme_exception)

let invalid_revocation_content_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_revocation_content_exception)

let health_unavailable_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : health_unavailable_exception)

let get_trust_store_revocation_content_output_of_xml i =
  let r_location = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Location" ] (fun tag _ ->
      match tag with
      | "Location" ->
          r_location :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Location" (fun i _ -> location_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ location = ( ! ) r_location } : get_trust_store_revocation_content_output)

let get_trust_store_revocation_content_input_of_xml i =
  let r_revocation_id = ref None in
  let r_trust_store_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RevocationId"; "TrustStoreArn" ] (fun tag _ ->
      match tag with
      | "RevocationId" ->
          r_revocation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevocationId"
                 (fun i _ -> revocation_id_of_xml i)
                 ())
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     revocation_id = Smaws_Lib.Xml.Parse.required "RevocationId" (( ! ) r_revocation_id) i;
     trust_store_arn = Smaws_Lib.Xml.Parse.required "TrustStoreArn" (( ! ) r_trust_store_arn) i;
   }
    : get_trust_store_revocation_content_input)

let get_trust_store_ca_certificates_bundle_output_of_xml i =
  let r_location = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Location" ] (fun tag _ ->
      match tag with
      | "Location" ->
          r_location :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Location" (fun i _ -> location_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ location = ( ! ) r_location } : get_trust_store_ca_certificates_bundle_output)

let get_trust_store_ca_certificates_bundle_input_of_xml i =
  let r_trust_store_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TrustStoreArn" ] (fun tag _ ->
      match tag with
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ trust_store_arn = Smaws_Lib.Xml.Parse.required "TrustStoreArn" (( ! ) r_trust_store_arn) i }
    : get_trust_store_ca_certificates_bundle_input)

let get_resource_policy_output_of_xml i =
  let r_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Policy" ] (fun tag _ ->
      match tag with
      | "Policy" ->
          r_policy :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Policy" (fun i _ -> policy_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy = ( ! ) r_policy } : get_resource_policy_output)

let get_resource_policy_input_of_xml i =
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArn" ] (fun tag _ ->
      match tag with
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn"
                 (fun i _ -> resource_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i }
    : get_resource_policy_input)

let describe_trust_stores_output_of_xml i =
  let r_next_marker = ref None in
  let r_trust_stores = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "TrustStores" ] (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "TrustStores" ->
          r_trust_stores :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStores"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> trust_store_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_marker = ( ! ) r_next_marker; trust_stores = ( ! ) r_trust_stores }
    : describe_trust_stores_output)

let describe_trust_stores_input_of_xml i =
  let r_page_size = ref None in
  let r_marker = ref None in
  let r_names = ref None in
  let r_trust_store_arns = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PageSize"; "Marker"; "Names"; "TrustStoreArns" ]
    (fun tag _ ->
      match tag with
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | "Names" ->
          r_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Names"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> trust_store_name_of_xml i)
                     ())
                 ())
      | "TrustStoreArns" ->
          r_trust_store_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> trust_store_arn_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     page_size = ( ! ) r_page_size;
     marker = ( ! ) r_marker;
     names = ( ! ) r_names;
     trust_store_arns = ( ! ) r_trust_store_arns;
   }
    : describe_trust_stores_input)

let describe_trust_store_revocation_of_xml i =
  let r_number_of_revoked_entries = ref None in
  let r_revocation_type = ref None in
  let r_revocation_id = ref None in
  let r_trust_store_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NumberOfRevokedEntries"; "RevocationType"; "RevocationId"; "TrustStoreArn" ] (fun tag _ ->
      match tag with
      | "NumberOfRevokedEntries" ->
          r_number_of_revoked_entries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfRevokedEntries"
                 (fun i _ -> number_of_revoked_entries_of_xml i)
                 ())
      | "RevocationType" ->
          r_revocation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevocationType"
                 (fun i _ -> revocation_type_of_xml i)
                 ())
      | "RevocationId" ->
          r_revocation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevocationId"
                 (fun i _ -> revocation_id_of_xml i)
                 ())
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     number_of_revoked_entries = ( ! ) r_number_of_revoked_entries;
     revocation_type = ( ! ) r_revocation_type;
     revocation_id = ( ! ) r_revocation_id;
     trust_store_arn = ( ! ) r_trust_store_arn;
   }
    : describe_trust_store_revocation)

let describe_trust_store_revocation_response_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> describe_trust_store_revocation_of_xml i)
    ()

let describe_trust_store_revocations_output_of_xml i =
  let r_next_marker = ref None in
  let r_trust_store_revocations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "TrustStoreRevocations" ]
    (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "TrustStoreRevocations" ->
          r_trust_store_revocations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreRevocations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> describe_trust_store_revocation_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_marker = ( ! ) r_next_marker; trust_store_revocations = ( ! ) r_trust_store_revocations }
    : describe_trust_store_revocations_output)

let describe_trust_store_revocations_input_of_xml i =
  let r_page_size = ref None in
  let r_marker = ref None in
  let r_revocation_ids = ref None in
  let r_trust_store_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PageSize"; "Marker"; "RevocationIds"; "TrustStoreArn" ] (fun tag _ ->
      match tag with
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | "RevocationIds" ->
          r_revocation_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevocationIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> revocation_id_of_xml i)
                     ())
                 ())
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     page_size = ( ! ) r_page_size;
     marker = ( ! ) r_marker;
     revocation_ids = ( ! ) r_revocation_ids;
     trust_store_arn = Smaws_Lib.Xml.Parse.required "TrustStoreArn" (( ! ) r_trust_store_arn) i;
   }
    : describe_trust_store_revocations_input)

let describe_trust_store_associations_output_of_xml i =
  let r_next_marker = ref None in
  let r_trust_store_associations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "TrustStoreAssociations" ]
    (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "TrustStoreAssociations" ->
          r_trust_store_associations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreAssociations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> trust_store_association_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_marker = ( ! ) r_next_marker;
     trust_store_associations = ( ! ) r_trust_store_associations;
   }
    : describe_trust_store_associations_output)

let describe_trust_store_associations_input_of_xml i =
  let r_page_size = ref None in
  let r_marker = ref None in
  let r_trust_store_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PageSize"; "Marker"; "TrustStoreArn" ]
    (fun tag _ ->
      match tag with
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     page_size = ( ! ) r_page_size;
     marker = ( ! ) r_marker;
     trust_store_arn = Smaws_Lib.Xml.Parse.required "TrustStoreArn" (( ! ) r_trust_store_arn) i;
   }
    : describe_trust_store_associations_input)

let describe_target_health_output_of_xml i =
  let r_target_health_descriptions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TargetHealthDescriptions" ] (fun tag _ ->
      match tag with
      | "TargetHealthDescriptions" ->
          r_target_health_descriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetHealthDescriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_health_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ target_health_descriptions = ( ! ) r_target_health_descriptions }
    : describe_target_health_output)

let describe_target_health_input_of_xml i =
  let r_include_ = ref None in
  let r_targets = ref None in
  let r_target_group_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Include"; "Targets"; "TargetGroupArn" ]
    (fun tag _ ->
      match tag with
      | "Include" ->
          r_include_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Include"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> describe_target_health_input_include_enum_of_xml i)
                     ())
                 ())
      | "Targets" ->
          r_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Targets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_description_of_xml i)
                     ())
                 ())
      | "TargetGroupArn" ->
          r_target_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupArn"
                 (fun i _ -> target_group_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     include_ = ( ! ) r_include_;
     targets = ( ! ) r_targets;
     target_group_arn = Smaws_Lib.Xml.Parse.required "TargetGroupArn" (( ! ) r_target_group_arn) i;
   }
    : describe_target_health_input)

let describe_target_groups_output_of_xml i =
  let r_next_marker = ref None in
  let r_target_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "TargetGroups" ] (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "TargetGroups" ->
          r_target_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_marker = ( ! ) r_next_marker; target_groups = ( ! ) r_target_groups }
    : describe_target_groups_output)

let describe_target_groups_input_of_xml i =
  let r_page_size = ref None in
  let r_marker = ref None in
  let r_names = ref None in
  let r_target_group_arns = ref None in
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PageSize"; "Marker"; "Names"; "TargetGroupArns"; "LoadBalancerArn" ] (fun tag _ ->
      match tag with
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | "Names" ->
          r_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Names"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_group_name_of_xml i)
                     ())
                 ())
      | "TargetGroupArns" ->
          r_target_group_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_group_arn_of_xml i)
                     ())
                 ())
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     page_size = ( ! ) r_page_size;
     marker = ( ! ) r_marker;
     names = ( ! ) r_names;
     target_group_arns = ( ! ) r_target_group_arns;
     load_balancer_arn = ( ! ) r_load_balancer_arn;
   }
    : describe_target_groups_input)

let describe_target_group_attributes_output_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_group_attribute_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : describe_target_group_attributes_output)

let describe_target_group_attributes_input_of_xml i =
  let r_target_group_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TargetGroupArn" ] (fun tag _ ->
      match tag with
      | "TargetGroupArn" ->
          r_target_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupArn"
                 (fun i _ -> target_group_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ target_group_arn = Smaws_Lib.Xml.Parse.required "TargetGroupArn" (( ! ) r_target_group_arn) i }
    : describe_target_group_attributes_input)

let describe_tags_output_of_xml i =
  let r_tag_descriptions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TagDescriptions" ] (fun tag _ ->
      match tag with
      | "TagDescriptions" ->
          r_tag_descriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagDescriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tag_descriptions = ( ! ) r_tag_descriptions } : describe_tags_output)

let describe_tags_input_of_xml i =
  let r_resource_arns = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArns" ] (fun tag _ ->
      match tag with
      | "ResourceArns" ->
          r_resource_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_arn_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_arns = Smaws_Lib.Xml.Parse.required "ResourceArns" (( ! ) r_resource_arns) i }
    : describe_tags_input)

let describe_ssl_policies_output_of_xml i =
  let r_next_marker = ref None in
  let r_ssl_policies = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "SslPolicies" ] (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "SslPolicies" ->
          r_ssl_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SslPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> ssl_policy_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_marker = ( ! ) r_next_marker; ssl_policies = ( ! ) r_ssl_policies }
    : describe_ssl_policies_output)

let describe_ssl_policies_input_of_xml i =
  let r_load_balancer_type = ref None in
  let r_page_size = ref None in
  let r_marker = ref None in
  let r_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerType"; "PageSize"; "Marker"; "Names" ]
    (fun tag _ ->
      match tag with
      | "LoadBalancerType" ->
          r_load_balancer_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerType"
                 (fun i _ -> load_balancer_type_enum_of_xml i)
                 ())
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | "Names" ->
          r_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Names"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> ssl_policy_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_type = ( ! ) r_load_balancer_type;
     page_size = ( ! ) r_page_size;
     marker = ( ! ) r_marker;
     names = ( ! ) r_names;
   }
    : describe_ssl_policies_input)

let describe_rules_output_of_xml i =
  let r_next_marker = ref None in
  let r_rules = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "Rules" ] (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "Rules" ->
          r_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Rules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rule_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_marker = ( ! ) r_next_marker; rules = ( ! ) r_rules } : describe_rules_output)

let describe_rules_input_of_xml i =
  let r_page_size = ref None in
  let r_marker = ref None in
  let r_rule_arns = ref None in
  let r_listener_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PageSize"; "Marker"; "RuleArns"; "ListenerArn" ]
    (fun tag _ ->
      match tag with
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | "RuleArns" ->
          r_rule_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RuleArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rule_arn_of_xml i) ())
                 ())
      | "ListenerArn" ->
          r_listener_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerArn"
                 (fun i _ -> listener_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     page_size = ( ! ) r_page_size;
     marker = ( ! ) r_marker;
     rule_arns = ( ! ) r_rule_arns;
     listener_arn = ( ! ) r_listener_arn;
   }
    : describe_rules_input)

let describe_load_balancers_output_of_xml i =
  let r_next_marker = ref None in
  let r_load_balancers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "LoadBalancers" ] (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "LoadBalancers" ->
          r_load_balancers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_marker = ( ! ) r_next_marker; load_balancers = ( ! ) r_load_balancers }
    : describe_load_balancers_output)

let describe_load_balancers_input_of_xml i =
  let r_page_size = ref None in
  let r_marker = ref None in
  let r_names = ref None in
  let r_load_balancer_arns = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PageSize"; "Marker"; "Names"; "LoadBalancerArns" ]
    (fun tag _ ->
      match tag with
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | "Names" ->
          r_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Names"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_name_of_xml i)
                     ())
                 ())
      | "LoadBalancerArns" ->
          r_load_balancer_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_arn_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     page_size = ( ! ) r_page_size;
     marker = ( ! ) r_marker;
     names = ( ! ) r_names;
     load_balancer_arns = ( ! ) r_load_balancer_arns;
   }
    : describe_load_balancers_input)

let describe_load_balancer_attributes_output_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_attribute_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : describe_load_balancer_attributes_output)

let describe_load_balancer_attributes_input_of_xml i =
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerArn" ] (fun tag _ ->
      match tag with
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_arn =
       Smaws_Lib.Xml.Parse.required "LoadBalancerArn" (( ! ) r_load_balancer_arn) i;
   }
    : describe_load_balancer_attributes_input)

let describe_listeners_output_of_xml i =
  let r_next_marker = ref None in
  let r_listeners = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "Listeners" ] (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "Listeners" ->
          r_listeners :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Listeners"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_marker = ( ! ) r_next_marker; listeners = ( ! ) r_listeners } : describe_listeners_output)

let describe_listeners_input_of_xml i =
  let r_page_size = ref None in
  let r_marker = ref None in
  let r_listener_arns = ref None in
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PageSize"; "Marker"; "ListenerArns"; "LoadBalancerArn" ] (fun tag _ ->
      match tag with
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | "ListenerArns" ->
          r_listener_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> listener_arn_of_xml i)
                     ())
                 ())
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     page_size = ( ! ) r_page_size;
     marker = ( ! ) r_marker;
     listener_arns = ( ! ) r_listener_arns;
     load_balancer_arn = ( ! ) r_load_balancer_arn;
   }
    : describe_listeners_input)

let describe_listener_certificates_output_of_xml i =
  let r_next_marker = ref None in
  let r_certificates = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "Certificates" ] (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "Certificates" ->
          r_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Certificates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> certificate_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_marker = ( ! ) r_next_marker; certificates = ( ! ) r_certificates }
    : describe_listener_certificates_output)

let describe_listener_certificates_input_of_xml i =
  let r_page_size = ref None in
  let r_marker = ref None in
  let r_listener_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PageSize"; "Marker"; "ListenerArn" ] (fun tag _ ->
      match tag with
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | "ListenerArn" ->
          r_listener_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerArn"
                 (fun i _ -> listener_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     page_size = ( ! ) r_page_size;
     marker = ( ! ) r_marker;
     listener_arn = Smaws_Lib.Xml.Parse.required "ListenerArn" (( ! ) r_listener_arn) i;
   }
    : describe_listener_certificates_input)

let describe_listener_attributes_output_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> listener_attribute_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : describe_listener_attributes_output)

let describe_listener_attributes_input_of_xml i =
  let r_listener_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ListenerArn" ] (fun tag _ ->
      match tag with
      | "ListenerArn" ->
          r_listener_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerArn"
                 (fun i _ -> listener_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ listener_arn = Smaws_Lib.Xml.Parse.required "ListenerArn" (( ! ) r_listener_arn) i }
    : describe_listener_attributes_input)

let describe_capacity_reservation_output_of_xml i =
  let r_capacity_reservation_state = ref None in
  let r_minimum_load_balancer_capacity = ref None in
  let r_decrease_requests_remaining = ref None in
  let r_last_modified_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CapacityReservationState";
      "MinimumLoadBalancerCapacity";
      "DecreaseRequestsRemaining";
      "LastModifiedTime";
    ] (fun tag _ ->
      match tag with
      | "CapacityReservationState" ->
          r_capacity_reservation_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapacityReservationState"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> zonal_capacity_reservation_state_of_xml i)
                     ())
                 ())
      | "MinimumLoadBalancerCapacity" ->
          r_minimum_load_balancer_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinimumLoadBalancerCapacity"
                 (fun i _ -> minimum_load_balancer_capacity_of_xml i)
                 ())
      | "DecreaseRequestsRemaining" ->
          r_decrease_requests_remaining :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DecreaseRequestsRemaining"
                 (fun i _ -> decrease_requests_remaining_of_xml i)
                 ())
      | "LastModifiedTime" ->
          r_last_modified_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastModifiedTime"
                 (fun i _ -> last_modified_time_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     capacity_reservation_state = ( ! ) r_capacity_reservation_state;
     minimum_load_balancer_capacity = ( ! ) r_minimum_load_balancer_capacity;
     decrease_requests_remaining = ( ! ) r_decrease_requests_remaining;
     last_modified_time = ( ! ) r_last_modified_time;
   }
    : describe_capacity_reservation_output)

let describe_capacity_reservation_input_of_xml i =
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerArn" ] (fun tag _ ->
      match tag with
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_arn =
       Smaws_Lib.Xml.Parse.required "LoadBalancerArn" (( ! ) r_load_balancer_arn) i;
   }
    : describe_capacity_reservation_input)

let describe_account_limits_output_of_xml i =
  let r_next_marker = ref None in
  let r_limits = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "Limits" ] (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "Limits" ->
          r_limits :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Limits"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> limit_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_marker = ( ! ) r_next_marker; limits = ( ! ) r_limits } : describe_account_limits_output)

let describe_account_limits_input_of_xml i =
  let r_page_size = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PageSize"; "Marker" ] (fun tag _ ->
      match tag with
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ page_size = ( ! ) r_page_size; marker = ( ! ) r_marker } : describe_account_limits_input)

let deregister_targets_output_of_xml i = ()

let deregister_targets_input_of_xml i =
  let r_targets = ref None in
  let r_target_group_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Targets"; "TargetGroupArn" ] (fun tag _ ->
      match tag with
      | "Targets" ->
          r_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Targets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_description_of_xml i)
                     ())
                 ())
      | "TargetGroupArn" ->
          r_target_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupArn"
                 (fun i _ -> target_group_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     targets = Smaws_Lib.Xml.Parse.required "Targets" (( ! ) r_targets) i;
     target_group_arn = Smaws_Lib.Xml.Parse.required "TargetGroupArn" (( ! ) r_target_group_arn) i;
   }
    : deregister_targets_input)

let delete_trust_store_output_of_xml i = ()

let delete_trust_store_input_of_xml i =
  let r_trust_store_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TrustStoreArn" ] (fun tag _ ->
      match tag with
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ trust_store_arn = Smaws_Lib.Xml.Parse.required "TrustStoreArn" (( ! ) r_trust_store_arn) i }
    : delete_trust_store_input)

let delete_target_group_output_of_xml i = ()

let delete_target_group_input_of_xml i =
  let r_target_group_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TargetGroupArn" ] (fun tag _ ->
      match tag with
      | "TargetGroupArn" ->
          r_target_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroupArn"
                 (fun i _ -> target_group_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ target_group_arn = Smaws_Lib.Xml.Parse.required "TargetGroupArn" (( ! ) r_target_group_arn) i }
    : delete_target_group_input)

let delete_association_same_account_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : delete_association_same_account_exception)

let delete_shared_trust_store_association_output_of_xml i = ()

let delete_shared_trust_store_association_input_of_xml i =
  let r_resource_arn = ref None in
  let r_trust_store_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArn"; "TrustStoreArn" ] (fun tag _ ->
      match tag with
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn"
                 (fun i _ -> resource_arn_of_xml i)
                 ())
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i;
     trust_store_arn = Smaws_Lib.Xml.Parse.required "TrustStoreArn" (( ! ) r_trust_store_arn) i;
   }
    : delete_shared_trust_store_association_input)

let delete_rule_output_of_xml i = ()

let delete_rule_input_of_xml i =
  let r_rule_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RuleArn" ] (fun tag _ ->
      match tag with
      | "RuleArn" ->
          r_rule_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RuleArn" (fun i _ -> rule_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rule_arn = Smaws_Lib.Xml.Parse.required "RuleArn" (( ! ) r_rule_arn) i } : delete_rule_input)

let delete_load_balancer_output_of_xml i = ()

let delete_load_balancer_input_of_xml i =
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerArn" ] (fun tag _ ->
      match tag with
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_arn =
       Smaws_Lib.Xml.Parse.required "LoadBalancerArn" (( ! ) r_load_balancer_arn) i;
   }
    : delete_load_balancer_input)

let delete_listener_output_of_xml i = ()

let delete_listener_input_of_xml i =
  let r_listener_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ListenerArn" ] (fun tag _ ->
      match tag with
      | "ListenerArn" ->
          r_listener_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerArn"
                 (fun i _ -> listener_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ listener_arn = Smaws_Lib.Xml.Parse.required "ListenerArn" (( ! ) r_listener_arn) i }
    : delete_listener_input)

let duplicate_trust_store_name_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : duplicate_trust_store_name_exception)

let duplicate_tag_keys_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : duplicate_tag_keys_exception)

let create_trust_store_output_of_xml i =
  let r_trust_stores = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TrustStores" ] (fun tag _ ->
      match tag with
      | "TrustStores" ->
          r_trust_stores :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStores"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> trust_store_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ trust_stores = ( ! ) r_trust_stores } : create_trust_store_output)

let create_trust_store_input_of_xml i =
  let r_tags = ref None in
  let r_ca_certificates_bundle_s3_object_version = ref None in
  let r_ca_certificates_bundle_s3_key = ref None in
  let r_ca_certificates_bundle_s3_bucket = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "CaCertificatesBundleS3ObjectVersion";
      "CaCertificatesBundleS3Key";
      "CaCertificatesBundleS3Bucket";
      "Name";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "CaCertificatesBundleS3ObjectVersion" ->
          r_ca_certificates_bundle_s3_object_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CaCertificatesBundleS3ObjectVersion"
                 (fun i _ -> s3_object_version_of_xml i)
                 ())
      | "CaCertificatesBundleS3Key" ->
          r_ca_certificates_bundle_s3_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CaCertificatesBundleS3Key"
                 (fun i _ -> s3_key_of_xml i)
                 ())
      | "CaCertificatesBundleS3Bucket" ->
          r_ca_certificates_bundle_s3_bucket :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CaCertificatesBundleS3Bucket"
                 (fun i _ -> s3_bucket_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> trust_store_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     ca_certificates_bundle_s3_object_version = ( ! ) r_ca_certificates_bundle_s3_object_version;
     ca_certificates_bundle_s3_key =
       Smaws_Lib.Xml.Parse.required "CaCertificatesBundleS3Key"
         (( ! ) r_ca_certificates_bundle_s3_key)
         i;
     ca_certificates_bundle_s3_bucket =
       Smaws_Lib.Xml.Parse.required "CaCertificatesBundleS3Bucket"
         (( ! ) r_ca_certificates_bundle_s3_bucket)
         i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : create_trust_store_input)

let duplicate_target_group_name_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : duplicate_target_group_name_exception)

let create_target_group_output_of_xml i =
  let r_target_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TargetGroups" ] (fun tag _ ->
      match tag with
      | "TargetGroups" ->
          r_target_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> target_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ target_groups = ( ! ) r_target_groups } : create_target_group_output)

let create_target_group_input_of_xml i =
  let r_target_control_port = ref None in
  let r_ip_address_type = ref None in
  let r_tags = ref None in
  let r_target_type = ref None in
  let r_matcher = ref None in
  let r_unhealthy_threshold_count = ref None in
  let r_healthy_threshold_count = ref None in
  let r_health_check_timeout_seconds = ref None in
  let r_health_check_interval_seconds = ref None in
  let r_health_check_path = ref None in
  let r_health_check_enabled = ref None in
  let r_health_check_port = ref None in
  let r_health_check_protocol = ref None in
  let r_vpc_id = ref None in
  let r_port = ref None in
  let r_protocol_version = ref None in
  let r_protocol = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TargetControlPort";
      "IpAddressType";
      "Tags";
      "TargetType";
      "Matcher";
      "UnhealthyThresholdCount";
      "HealthyThresholdCount";
      "HealthCheckTimeoutSeconds";
      "HealthCheckIntervalSeconds";
      "HealthCheckPath";
      "HealthCheckEnabled";
      "HealthCheckPort";
      "HealthCheckProtocol";
      "VpcId";
      "Port";
      "ProtocolVersion";
      "Protocol";
      "Name";
    ] (fun tag _ ->
      match tag with
      | "TargetControlPort" ->
          r_target_control_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetControlPort"
                 (fun i _ -> target_control_port_of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType"
                 (fun i _ -> target_group_ip_address_type_enum_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> target_type_enum_of_xml i)
                 ())
      | "Matcher" ->
          r_matcher :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Matcher" (fun i _ -> matcher_of_xml i) ())
      | "UnhealthyThresholdCount" ->
          r_unhealthy_threshold_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UnhealthyThresholdCount"
                 (fun i _ -> health_check_threshold_count_of_xml i)
                 ())
      | "HealthyThresholdCount" ->
          r_healthy_threshold_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthyThresholdCount"
                 (fun i _ -> health_check_threshold_count_of_xml i)
                 ())
      | "HealthCheckTimeoutSeconds" ->
          r_health_check_timeout_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckTimeoutSeconds"
                 (fun i _ -> health_check_timeout_seconds_of_xml i)
                 ())
      | "HealthCheckIntervalSeconds" ->
          r_health_check_interval_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckIntervalSeconds"
                 (fun i _ -> health_check_interval_seconds_of_xml i)
                 ())
      | "HealthCheckPath" ->
          r_health_check_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckPath" (fun i _ -> path_of_xml i) ())
      | "HealthCheckEnabled" ->
          r_health_check_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckEnabled"
                 (fun i _ -> health_check_enabled_of_xml i)
                 ())
      | "HealthCheckPort" ->
          r_health_check_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckPort"
                 (fun i _ -> health_check_port_of_xml i)
                 ())
      | "HealthCheckProtocol" ->
          r_health_check_protocol :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheckProtocol"
                 (fun i _ -> protocol_enum_of_xml i)
                 ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> vpc_id_of_xml i) ())
      | "Port" ->
          r_port := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> port_of_xml i) ())
      | "ProtocolVersion" ->
          r_protocol_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProtocolVersion"
                 (fun i _ -> protocol_version_of_xml i)
                 ())
      | "Protocol" ->
          r_protocol :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Protocol"
                 (fun i _ -> protocol_enum_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> target_group_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_control_port = ( ! ) r_target_control_port;
     ip_address_type = ( ! ) r_ip_address_type;
     tags = ( ! ) r_tags;
     target_type = ( ! ) r_target_type;
     matcher = ( ! ) r_matcher;
     unhealthy_threshold_count = ( ! ) r_unhealthy_threshold_count;
     healthy_threshold_count = ( ! ) r_healthy_threshold_count;
     health_check_timeout_seconds = ( ! ) r_health_check_timeout_seconds;
     health_check_interval_seconds = ( ! ) r_health_check_interval_seconds;
     health_check_path = ( ! ) r_health_check_path;
     health_check_enabled = ( ! ) r_health_check_enabled;
     health_check_port = ( ! ) r_health_check_port;
     health_check_protocol = ( ! ) r_health_check_protocol;
     vpc_id = ( ! ) r_vpc_id;
     port = ( ! ) r_port;
     protocol_version = ( ! ) r_protocol_version;
     protocol = ( ! ) r_protocol;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : create_target_group_input)

let create_rule_output_of_xml i =
  let r_rules = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Rules" ] (fun tag _ ->
      match tag with
      | "Rules" ->
          r_rules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Rules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rule_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ rules = ( ! ) r_rules } : create_rule_output)

let create_rule_input_of_xml i =
  let r_transforms = ref None in
  let r_tags = ref None in
  let r_actions = ref None in
  let r_priority = ref None in
  let r_conditions = ref None in
  let r_listener_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Transforms"; "Tags"; "Actions"; "Priority"; "Conditions"; "ListenerArn" ] (fun tag _ ->
      match tag with
      | "Transforms" ->
          r_transforms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Transforms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> rule_transform_of_xml i)
                     ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Actions" ->
          r_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Actions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> action_of_xml i) ())
                 ())
      | "Priority" ->
          r_priority :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Priority"
                 (fun i _ -> rule_priority_of_xml i)
                 ())
      | "Conditions" ->
          r_conditions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Conditions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> rule_condition_of_xml i)
                     ())
                 ())
      | "ListenerArn" ->
          r_listener_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerArn"
                 (fun i _ -> listener_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     transforms = ( ! ) r_transforms;
     tags = ( ! ) r_tags;
     actions = Smaws_Lib.Xml.Parse.required "Actions" (( ! ) r_actions) i;
     priority = Smaws_Lib.Xml.Parse.required "Priority" (( ! ) r_priority) i;
     conditions = Smaws_Lib.Xml.Parse.required "Conditions" (( ! ) r_conditions) i;
     listener_arn = Smaws_Lib.Xml.Parse.required "ListenerArn" (( ! ) r_listener_arn) i;
   }
    : create_rule_input)

let duplicate_load_balancer_name_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : duplicate_load_balancer_name_exception)

let create_load_balancer_output_of_xml i =
  let r_load_balancers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancers" ] (fun tag _ ->
      match tag with
      | "LoadBalancers" ->
          r_load_balancers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ load_balancers = ( ! ) r_load_balancers } : create_load_balancer_output)

let create_load_balancer_input_of_xml i =
  let r_ipam_pools = ref None in
  let r_enable_prefix_for_ipv6_source_nat = ref None in
  let r_customer_owned_ipv4_pool = ref None in
  let r_ip_address_type = ref None in
  let r_type_ = ref None in
  let r_tags = ref None in
  let r_scheme = ref None in
  let r_security_groups = ref None in
  let r_subnet_mappings = ref None in
  let r_subnets = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "IpamPools";
      "EnablePrefixForIpv6SourceNat";
      "CustomerOwnedIpv4Pool";
      "IpAddressType";
      "Type";
      "Tags";
      "Scheme";
      "SecurityGroups";
      "SubnetMappings";
      "Subnets";
      "Name";
    ] (fun tag _ ->
      match tag with
      | "IpamPools" ->
          r_ipam_pools :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpamPools" (fun i _ -> ipam_pools_of_xml i) ())
      | "EnablePrefixForIpv6SourceNat" ->
          r_enable_prefix_for_ipv6_source_nat :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnablePrefixForIpv6SourceNat"
                 (fun i _ -> enable_prefix_for_ipv6_source_nat_enum_of_xml i)
                 ())
      | "CustomerOwnedIpv4Pool" ->
          r_customer_owned_ipv4_pool :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomerOwnedIpv4Pool"
                 (fun i _ -> customer_owned_ipv4_pool_of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType"
                 (fun i _ -> ip_address_type_of_xml i)
                 ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> load_balancer_type_enum_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Scheme" ->
          r_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Scheme"
                 (fun i _ -> load_balancer_scheme_enum_of_xml i)
                 ())
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> security_group_id_of_xml i)
                     ())
                 ())
      | "SubnetMappings" ->
          r_subnet_mappings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetMappings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> subnet_mapping_of_xml i)
                     ())
                 ())
      | "Subnets" ->
          r_subnets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subnets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subnet_id_of_xml i) ())
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> load_balancer_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     ipam_pools = ( ! ) r_ipam_pools;
     enable_prefix_for_ipv6_source_nat = ( ! ) r_enable_prefix_for_ipv6_source_nat;
     customer_owned_ipv4_pool = ( ! ) r_customer_owned_ipv4_pool;
     ip_address_type = ( ! ) r_ip_address_type;
     type_ = ( ! ) r_type_;
     tags = ( ! ) r_tags;
     scheme = ( ! ) r_scheme;
     security_groups = ( ! ) r_security_groups;
     subnet_mappings = ( ! ) r_subnet_mappings;
     subnets = ( ! ) r_subnets;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : create_load_balancer_input)

let create_listener_output_of_xml i =
  let r_listeners = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Listeners" ] (fun tag _ ->
      match tag with
      | "Listeners" ->
          r_listeners :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Listeners"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ listeners = ( ! ) r_listeners } : create_listener_output)

let create_listener_input_of_xml i =
  let r_mutual_authentication = ref None in
  let r_tags = ref None in
  let r_alpn_policy = ref None in
  let r_default_actions = ref None in
  let r_certificates = ref None in
  let r_ssl_policy = ref None in
  let r_port = ref None in
  let r_protocol = ref None in
  let r_load_balancer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MutualAuthentication";
      "Tags";
      "AlpnPolicy";
      "DefaultActions";
      "Certificates";
      "SslPolicy";
      "Port";
      "Protocol";
      "LoadBalancerArn";
    ] (fun tag _ ->
      match tag with
      | "MutualAuthentication" ->
          r_mutual_authentication :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MutualAuthentication"
                 (fun i _ -> mutual_authentication_attributes_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "AlpnPolicy" ->
          r_alpn_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AlpnPolicy"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> alpn_policy_value_of_xml i)
                     ())
                 ())
      | "DefaultActions" ->
          r_default_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> action_of_xml i) ())
                 ())
      | "Certificates" ->
          r_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Certificates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> certificate_of_xml i)
                     ())
                 ())
      | "SslPolicy" ->
          r_ssl_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SslPolicy"
                 (fun i _ -> ssl_policy_name_of_xml i)
                 ())
      | "Port" ->
          r_port := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> port_of_xml i) ())
      | "Protocol" ->
          r_protocol :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Protocol"
                 (fun i _ -> protocol_enum_of_xml i)
                 ())
      | "LoadBalancerArn" ->
          r_load_balancer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerArn"
                 (fun i _ -> load_balancer_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     mutual_authentication = ( ! ) r_mutual_authentication;
     tags = ( ! ) r_tags;
     alpn_policy = ( ! ) r_alpn_policy;
     default_actions = Smaws_Lib.Xml.Parse.required "DefaultActions" (( ! ) r_default_actions) i;
     certificates = ( ! ) r_certificates;
     ssl_policy = ( ! ) r_ssl_policy;
     port = ( ! ) r_port;
     protocol = ( ! ) r_protocol;
     load_balancer_arn =
       Smaws_Lib.Xml.Parse.required "LoadBalancerArn" (( ! ) r_load_balancer_arn) i;
   }
    : create_listener_input)

let add_trust_store_revocations_output_of_xml i =
  let r_trust_store_revocations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TrustStoreRevocations" ] (fun tag _ ->
      match tag with
      | "TrustStoreRevocations" ->
          r_trust_store_revocations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreRevocations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> trust_store_revocation_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ trust_store_revocations = ( ! ) r_trust_store_revocations }
    : add_trust_store_revocations_output)

let add_trust_store_revocations_input_of_xml i =
  let r_revocation_contents = ref None in
  let r_trust_store_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RevocationContents"; "TrustStoreArn" ]
    (fun tag _ ->
      match tag with
      | "RevocationContents" ->
          r_revocation_contents :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevocationContents"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> revocation_content_of_xml i)
                     ())
                 ())
      | "TrustStoreArn" ->
          r_trust_store_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustStoreArn"
                 (fun i _ -> trust_store_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     revocation_contents = ( ! ) r_revocation_contents;
     trust_store_arn = Smaws_Lib.Xml.Parse.required "TrustStoreArn" (( ! ) r_trust_store_arn) i;
   }
    : add_trust_store_revocations_input)

let add_tags_output_of_xml i = ()

let add_tags_input_of_xml i =
  let r_tags = ref None in
  let r_resource_arns = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "ResourceArns" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ResourceArns" ->
          r_resource_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_arn_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     resource_arns = Smaws_Lib.Xml.Parse.required "ResourceArns" (( ! ) r_resource_arns) i;
   }
    : add_tags_input)

let add_listener_certificates_output_of_xml i =
  let r_certificates = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Certificates" ] (fun tag _ ->
      match tag with
      | "Certificates" ->
          r_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Certificates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> certificate_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ certificates = ( ! ) r_certificates } : add_listener_certificates_output)

let add_listener_certificates_input_of_xml i =
  let r_certificates = ref None in
  let r_listener_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Certificates"; "ListenerArn" ] (fun tag _ ->
      match tag with
      | "Certificates" ->
          r_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Certificates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> certificate_of_xml i)
                     ())
                 ())
      | "ListenerArn" ->
          r_listener_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerArn"
                 (fun i _ -> listener_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     certificates = Smaws_Lib.Xml.Parse.required "Certificates" (( ! ) r_certificates) i;
     listener_arn = Smaws_Lib.Xml.Parse.required "ListenerArn" (( ! ) r_listener_arn) i;
   }
    : add_listener_certificates_input)
