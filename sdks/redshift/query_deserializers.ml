open Types

let unit_of_xml _ = ()

let zero_etl_integration_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "needs_attention" -> NEEDS_ATTENTION
   | "syncing" -> SYNCING
   | "deleting" -> DELETING
   | "failed" -> FAILED
   | "modifying" -> MODIFYING
   | "active" -> ACTIVE
   | "creating" -> CREATING
   | _ -> failwith "unknown enum value"
    : zero_etl_integration_status)

let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let vpc_security_group_membership_of_xml i =
  let r_status = ref None in
  let r_vpc_security_group_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "VpcSecurityGroupId" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "VpcSecurityGroupId" ->
          r_vpc_security_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status; vpc_security_group_id = ( ! ) r_vpc_security_group_id }
    : vpc_security_group_membership)

let vpc_security_group_membership_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroup"
    (fun i _ -> vpc_security_group_membership_of_xml i)
    ()

let vpc_security_group_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId" (fun i _ -> string__of_xml i) ()

let vpc_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcIdentifier" (fun i _ -> string__of_xml i) ()

let network_interface_of_xml i =
  let r_ipv6_address = ref None in
  let r_availability_zone = ref None in
  let r_private_ip_address = ref None in
  let r_subnet_id = ref None in
  let r_network_interface_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Ipv6Address"; "AvailabilityZone"; "PrivateIpAddress"; "SubnetId"; "NetworkInterfaceId" ]
    (fun tag _ ->
      match tag with
      | "Ipv6Address" ->
          r_ipv6_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Ipv6Address" (fun i _ -> string__of_xml i) ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PrivateIpAddress" ->
          r_private_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrivateIpAddress"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SubnetId" ->
          r_subnet_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetId" (fun i _ -> string__of_xml i) ())
      | "NetworkInterfaceId" ->
          r_network_interface_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkInterfaceId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     ipv6_address = ( ! ) r_ipv6_address;
     availability_zone = ( ! ) r_availability_zone;
     private_ip_address = ( ! ) r_private_ip_address;
     subnet_id = ( ! ) r_subnet_id;
     network_interface_id = ( ! ) r_network_interface_id;
   }
    : network_interface)

let network_interface_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NetworkInterface" (fun i _ -> network_interface_of_xml i) ()

let vpc_endpoint_of_xml i =
  let r_network_interfaces = ref None in
  let r_vpc_id = ref None in
  let r_vpc_endpoint_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NetworkInterfaces"; "VpcId"; "VpcEndpointId" ]
    (fun tag _ ->
      match tag with
      | "NetworkInterfaces" ->
          r_network_interfaces :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkInterfaces"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NetworkInterface"
                     (fun i _ -> network_interface_of_xml i)
                     ())
                 ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "VpcEndpointId" ->
          r_vpc_endpoint_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcEndpointId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     network_interfaces = ( ! ) r_network_interfaces;
     vpc_id = ( ! ) r_vpc_id;
     vpc_endpoint_id = ( ! ) r_vpc_endpoint_id;
   }
    : vpc_endpoint)

let vpc_endpoints_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcEndpoint" (fun i _ -> vpc_endpoint_of_xml i) ()

let value_string_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "item" (fun i _ -> string__of_xml i) ()

let usage_limit_feature_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "extra-compute-for-automatic-optimization" -> EXTRA_COMPUTE_FOR_AUTOMATIC_OPTIMIZATION
   | "cross-region-datasharing" -> CROSS_REGION_DATASHARING
   | "concurrency-scaling" -> CONCURRENCY_SCALING
   | "spectrum" -> SPECTRUM
   | _ -> failwith "unknown enum value"
    : usage_limit_feature_type)

let usage_limit_limit_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "data-scanned" -> DATA_SCANNED
   | "time" -> TIME
   | _ -> failwith "unknown enum value"
    : usage_limit_limit_type)

let long_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let usage_limit_period_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "monthly" -> MONTHLY
   | "weekly" -> WEEKLY
   | "daily" -> DAILY
   | _ -> failwith "unknown enum value"
    : usage_limit_period)

let usage_limit_breach_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "disable" -> DISABLE
   | "emit-metric" -> EMIT_METRIC
   | "log" -> LOG
   | _ -> failwith "unknown enum value"
    : usage_limit_breach_action)

let tag_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Key" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> string__of_xml i) ())
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; key = ( ! ) r_key } : tag)

let tag_list_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ()

let usage_limit_of_xml i =
  let r_tags = ref None in
  let r_breach_action = ref None in
  let r_period = ref None in
  let r_amount = ref None in
  let r_limit_type = ref None in
  let r_feature_type = ref None in
  let r_cluster_identifier = ref None in
  let r_usage_limit_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "BreachAction";
      "Period";
      "Amount";
      "LimitType";
      "FeatureType";
      "ClusterIdentifier";
      "UsageLimitId";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "BreachAction" ->
          r_breach_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BreachAction"
                 (fun i _ -> usage_limit_breach_action_of_xml i)
                 ())
      | "Period" ->
          r_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Period"
                 (fun i _ -> usage_limit_period_of_xml i)
                 ())
      | "Amount" ->
          r_amount :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Amount" (fun i _ -> long_of_xml i) ())
      | "LimitType" ->
          r_limit_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LimitType"
                 (fun i _ -> usage_limit_limit_type_of_xml i)
                 ())
      | "FeatureType" ->
          r_feature_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FeatureType"
                 (fun i _ -> usage_limit_feature_type_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "UsageLimitId" ->
          r_usage_limit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsageLimitId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     breach_action = ( ! ) r_breach_action;
     period = ( ! ) r_period;
     amount = ( ! ) r_amount;
     limit_type = ( ! ) r_limit_type;
     feature_type = ( ! ) r_feature_type;
     cluster_identifier = ( ! ) r_cluster_identifier;
     usage_limit_id = ( ! ) r_usage_limit_id;
   }
    : usage_limit)

let usage_limits_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> usage_limit_of_xml i) ()

let exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let usage_limit_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : usage_limit_not_found_fault)

let usage_limit_list_of_xml i =
  let r_marker = ref None in
  let r_usage_limits = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "UsageLimits" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "UsageLimits" ->
          r_usage_limits :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsageLimits"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> usage_limit_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; usage_limits = ( ! ) r_usage_limits } : usage_limit_list)

let usage_limit_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : usage_limit_already_exists_fault)

let supported_operation_of_xml i =
  let r_operation_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationName" ] (fun tag _ ->
      match tag with
      | "OperationName" ->
          r_operation_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_name = ( ! ) r_operation_name } : supported_operation)

let supported_operation_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SupportedOperation"
    (fun i _ -> supported_operation_of_xml i)
    ()

let update_target_of_xml i =
  let r_supported_operations = ref None in
  let r_database_version = ref None in
  let r_maintenance_track_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SupportedOperations"; "DatabaseVersion"; "MaintenanceTrackName" ] (fun tag _ ->
      match tag with
      | "SupportedOperations" ->
          r_supported_operations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedOperations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SupportedOperation"
                     (fun i _ -> supported_operation_of_xml i)
                     ())
                 ())
      | "DatabaseVersion" ->
          r_database_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     supported_operations = ( ! ) r_supported_operations;
     database_version = ( ! ) r_database_version;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
   }
    : update_target)

let partner_integration_account_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let partner_integration_cluster_identifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let partner_integration_database_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let partner_integration_partner_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let partner_integration_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ConnectionFailure" -> ConnectionFailure
   | "RuntimeFailure" -> RuntimeFailure
   | "Inactive" -> Inactive
   | "Active" -> Active
   | _ -> failwith "unknown enum value"
    : partner_integration_status)

let partner_integration_status_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_partner_status_input_message_of_xml i =
  let r_status_message = ref None in
  let r_status = ref None in
  let r_partner_name = ref None in
  let r_database_name = ref None in
  let r_cluster_identifier = ref None in
  let r_account_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StatusMessage"; "Status"; "PartnerName"; "DatabaseName"; "ClusterIdentifier"; "AccountId" ]
    (fun tag _ ->
      match tag with
      | "StatusMessage" ->
          r_status_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusMessage"
                 (fun i _ -> partner_integration_status_message_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> partner_integration_status_of_xml i)
                 ())
      | "PartnerName" ->
          r_partner_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PartnerName"
                 (fun i _ -> partner_integration_partner_name_of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName"
                 (fun i _ -> partner_integration_database_name_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> partner_integration_cluster_identifier_of_xml i)
                 ())
      | "AccountId" ->
          r_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId"
                 (fun i _ -> partner_integration_account_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status_message = ( ! ) r_status_message;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     partner_name = Smaws_Lib.Xml.Parse.required "PartnerName" (( ! ) r_partner_name) i;
     database_name = Smaws_Lib.Xml.Parse.required "DatabaseName" (( ! ) r_database_name) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     account_id = Smaws_Lib.Xml.Parse.required "AccountId" (( ! ) r_account_id) i;
   }
    : update_partner_status_input_message)

let unsupported_operation_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : unsupported_operation_fault)

let unauthorized_partner_integration_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : unauthorized_partner_integration_fault)

let partner_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : partner_not_found_fault)

let cluster_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_not_found_fault)

let partner_integration_output_message_of_xml i =
  let r_partner_name = ref None in
  let r_database_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PartnerName"; "DatabaseName" ] (fun tag _ ->
      match tag with
      | "PartnerName" ->
          r_partner_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PartnerName"
                 (fun i _ -> partner_integration_partner_name_of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName"
                 (fun i _ -> partner_integration_database_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ partner_name = ( ! ) r_partner_name; database_name = ( ! ) r_database_name }
    : partner_integration_output_message)

let unsupported_option_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : unsupported_option_fault)

let unknown_snapshot_copy_region_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : unknown_snapshot_copy_region_fault)

let unauthorized_operation_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : unauthorized_operation)

let eligible_tracks_to_update_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "UpdateTarget" (fun i _ -> update_target_of_xml i) ()

let maintenance_track_of_xml i =
  let r_update_targets = ref None in
  let r_database_version = ref None in
  let r_maintenance_track_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UpdateTargets"; "DatabaseVersion"; "MaintenanceTrackName" ] (fun tag _ ->
      match tag with
      | "UpdateTargets" ->
          r_update_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateTargets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "UpdateTarget"
                     (fun i _ -> update_target_of_xml i)
                     ())
                 ())
      | "DatabaseVersion" ->
          r_database_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     update_targets = ( ! ) r_update_targets;
     database_version = ( ! ) r_database_version;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
   }
    : maintenance_track)

let track_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "MaintenanceTrack" (fun i _ -> maintenance_track_of_xml i) ()

let track_list_message_of_xml i =
  let r_marker = ref None in
  let r_maintenance_tracks = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaintenanceTracks" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaintenanceTracks" ->
          r_maintenance_tracks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTracks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "MaintenanceTrack"
                     (fun i _ -> maintenance_track_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; maintenance_tracks = ( ! ) r_maintenance_tracks }
    : track_list_message)

let target_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tagged_resource_of_xml i =
  let r_resource_type = ref None in
  let r_resource_name = ref None in
  let r_tag = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceType"; "ResourceName"; "Tag" ]
    (fun tag _ ->
      match tag with
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType" (fun i _ -> string__of_xml i) ())
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName" (fun i _ -> string__of_xml i) ())
      | "Tag" ->
          r_tag := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Tag" (fun i _ -> tag_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_type = ( ! ) r_resource_type;
     resource_name = ( ! ) r_resource_name;
     tag = ( ! ) r_tag;
   }
    : tagged_resource)

let tagged_resource_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "TaggedResource" (fun i _ -> tagged_resource_of_xml i) ()

let tagged_resource_list_message_of_xml i =
  let r_marker = ref None in
  let r_tagged_resources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "TaggedResources" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "TaggedResources" ->
          r_tagged_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TaggedResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TaggedResource"
                     (fun i _ -> tagged_resource_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; tagged_resources = ( ! ) r_tagged_resources }
    : tagged_resource_list_message)

let tag_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ()

let tag_limit_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : tag_limit_exceeded_fault)

let tag_key_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ()

let table_restore_status_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CANCELED" -> CANCELED
   | "FAILED" -> FAILED
   | "SUCCEEDED" -> SUCCEEDED
   | "IN_PROGRESS" -> IN_PROGRESS
   | "PENDING" -> PENDING
   | _ -> failwith "unknown enum value"
    : table_restore_status_type)

let t_stamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let long_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let table_restore_status_of_xml i =
  let r_new_table_name = ref None in
  let r_target_schema_name = ref None in
  let r_target_database_name = ref None in
  let r_source_table_name = ref None in
  let r_source_schema_name = ref None in
  let r_source_database_name = ref None in
  let r_snapshot_identifier = ref None in
  let r_cluster_identifier = ref None in
  let r_total_data_in_mega_bytes = ref None in
  let r_progress_in_mega_bytes = ref None in
  let r_request_time = ref None in
  let r_message = ref None in
  let r_status = ref None in
  let r_table_restore_request_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NewTableName";
      "TargetSchemaName";
      "TargetDatabaseName";
      "SourceTableName";
      "SourceSchemaName";
      "SourceDatabaseName";
      "SnapshotIdentifier";
      "ClusterIdentifier";
      "TotalDataInMegaBytes";
      "ProgressInMegaBytes";
      "RequestTime";
      "Message";
      "Status";
      "TableRestoreRequestId";
    ] (fun tag _ ->
      match tag with
      | "NewTableName" ->
          r_new_table_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewTableName" (fun i _ -> string__of_xml i) ())
      | "TargetSchemaName" ->
          r_target_schema_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetSchemaName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetDatabaseName" ->
          r_target_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDatabaseName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceTableName" ->
          r_source_table_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceTableName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceSchemaName" ->
          r_source_schema_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceSchemaName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceDatabaseName" ->
          r_source_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDatabaseName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TotalDataInMegaBytes" ->
          r_total_data_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalDataInMegaBytes"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "ProgressInMegaBytes" ->
          r_progress_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressInMegaBytes"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "RequestTime" ->
          r_request_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestTime" (fun i _ -> t_stamp_of_xml i) ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> table_restore_status_type_of_xml i)
                 ())
      | "TableRestoreRequestId" ->
          r_table_restore_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TableRestoreRequestId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     new_table_name = ( ! ) r_new_table_name;
     target_schema_name = ( ! ) r_target_schema_name;
     target_database_name = ( ! ) r_target_database_name;
     source_table_name = ( ! ) r_source_table_name;
     source_schema_name = ( ! ) r_source_schema_name;
     source_database_name = ( ! ) r_source_database_name;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     cluster_identifier = ( ! ) r_cluster_identifier;
     total_data_in_mega_bytes = ( ! ) r_total_data_in_mega_bytes;
     progress_in_mega_bytes = ( ! ) r_progress_in_mega_bytes;
     request_time = ( ! ) r_request_time;
     message = ( ! ) r_message;
     status = ( ! ) r_status;
     table_restore_request_id = ( ! ) r_table_restore_request_id;
   }
    : table_restore_status)

let table_restore_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "TableRestoreStatus"
    (fun i _ -> table_restore_status_of_xml i)
    ()

let table_restore_status_message_of_xml i =
  let r_marker = ref None in
  let r_table_restore_status_details = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "TableRestoreStatusDetails" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "TableRestoreStatusDetails" ->
          r_table_restore_status_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TableRestoreStatusDetails"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TableRestoreStatus"
                     (fun i _ -> table_restore_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; table_restore_status_details = ( ! ) r_table_restore_status_details }
    : table_restore_status_message)

let table_restore_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : table_restore_not_found_fault)

let table_limit_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : table_limit_exceeded_fault)

let supported_platform_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name } : supported_platform)

let supported_platforms_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SupportedPlatform"
    (fun i _ -> supported_platform_of_xml i)
    ()

let subscription_severity_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : subscription_severity_not_found_fault)

let subscription_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : subscription_not_found_fault)

let subscription_event_id_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : subscription_event_id_not_found_fault)

let subscription_category_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : subscription_category_not_found_fault)

let subscription_already_exist_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : subscription_already_exist_fault)

let availability_zone_of_xml i =
  let r_supported_platforms = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SupportedPlatforms"; "Name" ] (fun tag _ ->
      match tag with
      | "SupportedPlatforms" ->
          r_supported_platforms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedPlatforms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SupportedPlatform"
                     (fun i _ -> supported_platform_of_xml i)
                     ())
                 ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ supported_platforms = ( ! ) r_supported_platforms; name = ( ! ) r_name } : availability_zone)

let subnet_of_xml i =
  let r_subnet_status = ref None in
  let r_subnet_availability_zone = ref None in
  let r_subnet_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SubnetStatus"; "SubnetAvailabilityZone"; "SubnetIdentifier" ] (fun tag _ ->
      match tag with
      | "SubnetStatus" ->
          r_subnet_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetStatus" (fun i _ -> string__of_xml i) ())
      | "SubnetAvailabilityZone" ->
          r_subnet_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetAvailabilityZone"
                 (fun i _ -> availability_zone_of_xml i)
                 ())
      | "SubnetIdentifier" ->
          r_subnet_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subnet_status = ( ! ) r_subnet_status;
     subnet_availability_zone = ( ! ) r_subnet_availability_zone;
     subnet_identifier = ( ! ) r_subnet_identifier;
   }
    : subnet)

let subnet_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Subnet" (fun i _ -> subnet_of_xml i) ()

let subnet_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SubnetIdentifier" (fun i _ -> string__of_xml i) ()

let subnet_already_in_use_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : subnet_already_in_use)

let source_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "scheduled-action" -> Scheduled_action
   | "cluster-snapshot" -> Cluster_snapshot
   | "cluster-security-group" -> Cluster_security_group
   | "cluster-parameter-group" -> Cluster_parameter_group
   | "cluster" -> Cluster
   | _ -> failwith "unknown enum value"
    : source_type)

let source_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : source_not_found_fault)

let source_ids_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SourceId" (fun i _ -> string__of_xml i) ()

let source_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let sort_by_order_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "DESC" -> DESCENDING | "ASC" -> ASCENDING | _ -> failwith "unknown enum value"
    : sort_by_order)

let snapshot_attribute_to_sort_by_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CREATE_TIME" -> CREATE_TIME
   | "TOTAL_SIZE" -> TOTAL_SIZE
   | "SOURCE_TYPE" -> SOURCE_TYPE
   | _ -> failwith "unknown enum value"
    : snapshot_attribute_to_sort_by)

let snapshot_sorting_entity_of_xml i =
  let r_sort_order = ref None in
  let r_attribute = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SortOrder"; "Attribute" ] (fun tag _ ->
      match tag with
      | "SortOrder" ->
          r_sort_order :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortOrder"
                 (fun i _ -> sort_by_order_of_xml i)
                 ())
      | "Attribute" ->
          r_attribute :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attribute"
                 (fun i _ -> snapshot_attribute_to_sort_by_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sort_order = ( ! ) r_sort_order;
     attribute = Smaws_Lib.Xml.Parse.required "Attribute" (( ! ) r_attribute) i;
   }
    : snapshot_sorting_entity)

let snapshot_sorting_entity_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotSortingEntity"
    (fun i _ -> snapshot_sorting_entity_of_xml i)
    ()

let snapshot_schedule_update_in_progress_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : snapshot_schedule_update_in_progress_fault)

let snapshot_schedule_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : snapshot_schedule_quota_exceeded_fault)

let snapshot_schedule_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : snapshot_schedule_not_found_fault)

let schedule_definition_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ScheduleDefinition" (fun i _ -> string__of_xml i) ()

let scheduled_snapshot_time_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotTime" (fun i _ -> t_stamp_of_xml i) ()

let integer_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let schedule_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "FAILED" -> FAILED
   | "ACTIVE" -> ACTIVE
   | "MODIFYING" -> MODIFYING
   | _ -> failwith "unknown enum value"
    : schedule_state)

let cluster_associated_to_schedule_of_xml i =
  let r_schedule_association_state = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScheduleAssociationState"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "ScheduleAssociationState" ->
          r_schedule_association_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleAssociationState"
                 (fun i _ -> schedule_state_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     schedule_association_state = ( ! ) r_schedule_association_state;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : cluster_associated_to_schedule)

let associated_cluster_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterAssociatedToSchedule"
    (fun i _ -> cluster_associated_to_schedule_of_xml i)
    ()

let snapshot_schedule_of_xml i =
  let r_associated_clusters = ref None in
  let r_associated_cluster_count = ref None in
  let r_next_invocations = ref None in
  let r_tags = ref None in
  let r_schedule_description = ref None in
  let r_schedule_identifier = ref None in
  let r_schedule_definitions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AssociatedClusters";
      "AssociatedClusterCount";
      "NextInvocations";
      "Tags";
      "ScheduleDescription";
      "ScheduleIdentifier";
      "ScheduleDefinitions";
    ] (fun tag _ ->
      match tag with
      | "AssociatedClusters" ->
          r_associated_clusters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociatedClusters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterAssociatedToSchedule"
                     (fun i _ -> cluster_associated_to_schedule_of_xml i)
                     ())
                 ())
      | "AssociatedClusterCount" ->
          r_associated_cluster_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociatedClusterCount"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "NextInvocations" ->
          r_next_invocations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextInvocations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotTime"
                     (fun i _ -> t_stamp_of_xml i)
                     ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ScheduleDescription" ->
          r_schedule_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ScheduleIdentifier" ->
          r_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ScheduleDefinitions" ->
          r_schedule_definitions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleDefinitions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ScheduleDefinition"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     associated_clusters = ( ! ) r_associated_clusters;
     associated_cluster_count = ( ! ) r_associated_cluster_count;
     next_invocations = ( ! ) r_next_invocations;
     tags = ( ! ) r_tags;
     schedule_description = ( ! ) r_schedule_description;
     schedule_identifier = ( ! ) r_schedule_identifier;
     schedule_definitions = ( ! ) r_schedule_definitions;
   }
    : snapshot_schedule)

let snapshot_schedule_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotSchedule" (fun i _ -> snapshot_schedule_of_xml i) ()

let snapshot_schedule_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : snapshot_schedule_already_exists_fault)

let integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let boolean__of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let account_with_restore_access_of_xml i =
  let r_account_alias = ref None in
  let r_account_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccountAlias"; "AccountId" ] (fun tag _ ->
      match tag with
      | "AccountAlias" ->
          r_account_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountAlias" (fun i _ -> string__of_xml i) ())
      | "AccountId" ->
          r_account_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ account_alias = ( ! ) r_account_alias; account_id = ( ! ) r_account_id }
    : account_with_restore_access)

let accounts_with_restore_access_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AccountWithRestoreAccess"
    (fun i _ -> account_with_restore_access_of_xml i)
    ()

let double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let restorable_node_type_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeType" (fun i _ -> string__of_xml i) ()

let snapshot_of_xml i =
  let r_snapshot_arn = ref None in
  let r_master_password_secret_kms_key_id = ref None in
  let r_master_password_secret_arn = ref None in
  let r_snapshot_retention_start_time = ref None in
  let r_manual_snapshot_remaining_days = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_maintenance_track_name = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_restorable_node_types = ref None in
  let r_tags = ref None in
  let r_source_region = ref None in
  let r_elapsed_time_in_seconds = ref None in
  let r_estimated_seconds_to_completion = ref None in
  let r_current_backup_rate_in_mega_bytes_per_second = ref None in
  let r_backup_progress_in_mega_bytes = ref None in
  let r_actual_incremental_backup_size_in_mega_bytes = ref None in
  let r_total_backup_size_in_mega_bytes = ref None in
  let r_owner_account = ref None in
  let r_accounts_with_restore_access = ref None in
  let r_encrypted_with_hs_m = ref None in
  let r_kms_key_id = ref None in
  let r_encrypted = ref None in
  let r_vpc_id = ref None in
  let r_db_name = ref None in
  let r_number_of_nodes = ref None in
  let r_node_type = ref None in
  let r_snapshot_type = ref None in
  let r_engine_full_version = ref None in
  let r_cluster_version = ref None in
  let r_master_username = ref None in
  let r_cluster_create_time = ref None in
  let r_availability_zone = ref None in
  let r_port = ref None in
  let r_status = ref None in
  let r_snapshot_create_time = ref None in
  let r_cluster_identifier = ref None in
  let r_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SnapshotArn";
      "MasterPasswordSecretKmsKeyId";
      "MasterPasswordSecretArn";
      "SnapshotRetentionStartTime";
      "ManualSnapshotRemainingDays";
      "ManualSnapshotRetentionPeriod";
      "MaintenanceTrackName";
      "EnhancedVpcRouting";
      "RestorableNodeTypes";
      "Tags";
      "SourceRegion";
      "ElapsedTimeInSeconds";
      "EstimatedSecondsToCompletion";
      "CurrentBackupRateInMegaBytesPerSecond";
      "BackupProgressInMegaBytes";
      "ActualIncrementalBackupSizeInMegaBytes";
      "TotalBackupSizeInMegaBytes";
      "OwnerAccount";
      "AccountsWithRestoreAccess";
      "EncryptedWithHSM";
      "KmsKeyId";
      "Encrypted";
      "VpcId";
      "DBName";
      "NumberOfNodes";
      "NodeType";
      "SnapshotType";
      "EngineFullVersion";
      "ClusterVersion";
      "MasterUsername";
      "ClusterCreateTime";
      "AvailabilityZone";
      "Port";
      "Status";
      "SnapshotCreateTime";
      "ClusterIdentifier";
      "SnapshotIdentifier";
    ] (fun tag _ ->
      match tag with
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | "MasterPasswordSecretKmsKeyId" ->
          r_master_password_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MasterPasswordSecretArn" ->
          r_master_password_secret_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotRetentionStartTime" ->
          r_snapshot_retention_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionStartTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ManualSnapshotRemainingDays" ->
          r_manual_snapshot_remaining_days :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRemainingDays"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "RestorableNodeTypes" ->
          r_restorable_node_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RestorableNodeTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeType" (fun i _ -> string__of_xml i) ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "SourceRegion" ->
          r_source_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceRegion" (fun i _ -> string__of_xml i) ())
      | "ElapsedTimeInSeconds" ->
          r_elapsed_time_in_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ElapsedTimeInSeconds"
                 (fun i _ -> long_of_xml i)
                 ())
      | "EstimatedSecondsToCompletion" ->
          r_estimated_seconds_to_completion :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedSecondsToCompletion"
                 (fun i _ -> long_of_xml i)
                 ())
      | "CurrentBackupRateInMegaBytesPerSecond" ->
          r_current_backup_rate_in_mega_bytes_per_second :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentBackupRateInMegaBytesPerSecond"
                 (fun i _ -> double_of_xml i)
                 ())
      | "BackupProgressInMegaBytes" ->
          r_backup_progress_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupProgressInMegaBytes"
                 (fun i _ -> double_of_xml i)
                 ())
      | "ActualIncrementalBackupSizeInMegaBytes" ->
          r_actual_incremental_backup_size_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActualIncrementalBackupSizeInMegaBytes"
                 (fun i _ -> double_of_xml i)
                 ())
      | "TotalBackupSizeInMegaBytes" ->
          r_total_backup_size_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalBackupSizeInMegaBytes"
                 (fun i _ -> double_of_xml i)
                 ())
      | "OwnerAccount" ->
          r_owner_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerAccount" (fun i _ -> string__of_xml i) ())
      | "AccountsWithRestoreAccess" ->
          r_accounts_with_restore_access :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountsWithRestoreAccess"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AccountWithRestoreAccess"
                     (fun i _ -> account_with_restore_access_of_xml i)
                     ())
                 ())
      | "EncryptedWithHSM" ->
          r_encrypted_with_hs_m :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EncryptedWithHSM"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "Encrypted" ->
          r_encrypted :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted" (fun i _ -> boolean__of_xml i) ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "DBName" ->
          r_db_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DBName" (fun i _ -> string__of_xml i) ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes" (fun i _ -> integer_of_xml i) ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "SnapshotType" ->
          r_snapshot_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotType" (fun i _ -> string__of_xml i) ())
      | "EngineFullVersion" ->
          r_engine_full_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineFullVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MasterUsername" ->
          r_master_username :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUsername"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterCreateTime" ->
          r_cluster_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "SnapshotCreateTime" ->
          r_snapshot_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_arn = ( ! ) r_snapshot_arn;
     master_password_secret_kms_key_id = ( ! ) r_master_password_secret_kms_key_id;
     master_password_secret_arn = ( ! ) r_master_password_secret_arn;
     snapshot_retention_start_time = ( ! ) r_snapshot_retention_start_time;
     manual_snapshot_remaining_days = ( ! ) r_manual_snapshot_remaining_days;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     restorable_node_types = ( ! ) r_restorable_node_types;
     tags = ( ! ) r_tags;
     source_region = ( ! ) r_source_region;
     elapsed_time_in_seconds = ( ! ) r_elapsed_time_in_seconds;
     estimated_seconds_to_completion = ( ! ) r_estimated_seconds_to_completion;
     current_backup_rate_in_mega_bytes_per_second =
       ( ! ) r_current_backup_rate_in_mega_bytes_per_second;
     backup_progress_in_mega_bytes = ( ! ) r_backup_progress_in_mega_bytes;
     actual_incremental_backup_size_in_mega_bytes =
       ( ! ) r_actual_incremental_backup_size_in_mega_bytes;
     total_backup_size_in_mega_bytes = ( ! ) r_total_backup_size_in_mega_bytes;
     owner_account = ( ! ) r_owner_account;
     accounts_with_restore_access = ( ! ) r_accounts_with_restore_access;
     encrypted_with_hs_m = ( ! ) r_encrypted_with_hs_m;
     kms_key_id = ( ! ) r_kms_key_id;
     encrypted = ( ! ) r_encrypted;
     vpc_id = ( ! ) r_vpc_id;
     db_name = ( ! ) r_db_name;
     number_of_nodes = ( ! ) r_number_of_nodes;
     node_type = ( ! ) r_node_type;
     snapshot_type = ( ! ) r_snapshot_type;
     engine_full_version = ( ! ) r_engine_full_version;
     cluster_version = ( ! ) r_cluster_version;
     master_username = ( ! ) r_master_username;
     cluster_create_time = ( ! ) r_cluster_create_time;
     availability_zone = ( ! ) r_availability_zone;
     port = ( ! ) r_port;
     status = ( ! ) r_status;
     snapshot_create_time = ( ! ) r_snapshot_create_time;
     cluster_identifier = ( ! ) r_cluster_identifier;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
   }
    : snapshot)

let snapshot_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Snapshot" (fun i _ -> snapshot_of_xml i) ()

let snapshot_message_of_xml i =
  let r_snapshots = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Snapshots"; "Marker" ] (fun tag _ ->
      match tag with
      | "Snapshots" ->
          r_snapshots :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshots"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshots = ( ! ) r_snapshots; marker = ( ! ) r_marker } : snapshot_message)

let snapshot_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "String" (fun i _ -> string__of_xml i) ()

let snapshot_error_message_of_xml i =
  let r_failure_reason = ref None in
  let r_failure_code = ref None in
  let r_snapshot_cluster_identifier = ref None in
  let r_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "FailureReason"; "FailureCode"; "SnapshotClusterIdentifier"; "SnapshotIdentifier" ]
    (fun tag _ ->
      match tag with
      | "FailureReason" ->
          r_failure_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureReason" (fun i _ -> string__of_xml i) ())
      | "FailureCode" ->
          r_failure_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureCode" (fun i _ -> string__of_xml i) ())
      | "SnapshotClusterIdentifier" ->
          r_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     failure_reason = ( ! ) r_failure_reason;
     failure_code = ( ! ) r_failure_code;
     snapshot_cluster_identifier = ( ! ) r_snapshot_cluster_identifier;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
   }
    : snapshot_error_message)

let snapshot_copy_grant_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : snapshot_copy_grant_quota_exceeded_fault)

let snapshot_copy_grant_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : snapshot_copy_grant_not_found_fault)

let snapshot_copy_grant_of_xml i =
  let r_tags = ref None in
  let r_kms_key_id = ref None in
  let r_snapshot_copy_grant_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "KmsKeyId"; "SnapshotCopyGrantName" ]
    (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "SnapshotCopyGrantName" ->
          r_snapshot_copy_grant_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrantName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     kms_key_id = ( ! ) r_kms_key_id;
     snapshot_copy_grant_name = ( ! ) r_snapshot_copy_grant_name;
   }
    : snapshot_copy_grant)

let snapshot_copy_grant_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotCopyGrant"
    (fun i _ -> snapshot_copy_grant_of_xml i)
    ()

let snapshot_copy_grant_message_of_xml i =
  let r_snapshot_copy_grants = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SnapshotCopyGrants"; "Marker" ] (fun tag _ ->
      match tag with
      | "SnapshotCopyGrants" ->
          r_snapshot_copy_grants :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrants"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotCopyGrant"
                     (fun i _ -> snapshot_copy_grant_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot_copy_grants = ( ! ) r_snapshot_copy_grants; marker = ( ! ) r_marker }
    : snapshot_copy_grant_message)

let snapshot_copy_grant_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : snapshot_copy_grant_already_exists_fault)

let snapshot_copy_disabled_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : snapshot_copy_disabled_fault)

let snapshot_copy_already_enabled_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : snapshot_copy_already_enabled_fault)

let snapshot_copy_already_disabled_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : snapshot_copy_already_disabled_fault)

let service_authorization_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Disabled" -> DISABLED | "Enabled" -> ENABLED | _ -> failwith "unknown enum value"
    : service_authorization)

let lake_formation_query_of_xml i =
  let r_authorization = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Authorization" ] (fun tag _ ->
      match tag with
      | "Authorization" ->
          r_authorization :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Authorization"
                 (fun i _ -> service_authorization_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ authorization = Smaws_Lib.Xml.Parse.required "Authorization" (( ! ) r_authorization) i }
    : lake_formation_query)

let lake_formation_scope_union_of_xml i =
  let r_lake_formation_query = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LakeFormationQuery" ] (fun tag _ ->
      match tag with
      | "LakeFormationQuery" ->
          r_lake_formation_query :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakeFormationQuery"
                 (fun i _ -> lake_formation_query_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_lake_formation_query with
   | Some v -> LakeFormationQuery v
   | None -> failwith "no union member present in xml response"
    : lake_formation_scope_union)

let lake_formation_service_integrations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> lake_formation_scope_union_of_xml i) ()

let read_write_access_of_xml i =
  let r_authorization = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Authorization" ] (fun tag _ ->
      match tag with
      | "Authorization" ->
          r_authorization :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Authorization"
                 (fun i _ -> service_authorization_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ authorization = Smaws_Lib.Xml.Parse.required "Authorization" (( ! ) r_authorization) i }
    : read_write_access)

let s3_access_grants_scope_union_of_xml i =
  let r_read_write_access = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReadWriteAccess" ] (fun tag _ ->
      match tag with
      | "ReadWriteAccess" ->
          r_read_write_access :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReadWriteAccess"
                 (fun i _ -> read_write_access_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_read_write_access with
   | Some v -> ReadWriteAccess v
   | None -> failwith "no union member present in xml response"
    : s3_access_grants_scope_union)

let s3_access_grants_service_integrations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> s3_access_grants_scope_union_of_xml i)
    ()

let connect_of_xml i =
  let r_authorization = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Authorization" ] (fun tag _ ->
      match tag with
      | "Authorization" ->
          r_authorization :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Authorization"
                 (fun i _ -> service_authorization_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ authorization = Smaws_Lib.Xml.Parse.required "Authorization" (( ! ) r_authorization) i }
    : connect)

let redshift_scope_union_of_xml i =
  let r_connect = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Connect" ] (fun tag _ ->
      match tag with
      | "Connect" ->
          r_connect :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Connect" (fun i _ -> connect_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_connect with
   | Some v -> Connect v
   | None -> failwith "no union member present in xml response"
    : redshift_scope_union)

let redshift_service_integrations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> redshift_scope_union_of_xml i) ()

let service_integrations_union_of_xml i =
  let r_redshift = ref None in
  let r_s3_access_grants = ref None in
  let r_lake_formation = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Redshift"; "S3AccessGrants"; "LakeFormation" ]
    (fun tag _ ->
      match tag with
      | "Redshift" ->
          r_redshift :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Redshift"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> redshift_scope_union_of_xml i)
                     ())
                 ())
      | "S3AccessGrants" ->
          r_s3_access_grants :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "S3AccessGrants"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> s3_access_grants_scope_union_of_xml i)
                     ())
                 ())
      | "LakeFormation" ->
          r_lake_formation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakeFormation"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> lake_formation_scope_union_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_redshift with
   | Some v -> Redshift v
   | None -> (
       match ( ! ) r_s3_access_grants with
       | Some v -> S3AccessGrants v
       | None -> (
           match ( ! ) r_lake_formation with
           | Some v -> LakeFormation v
           | None -> failwith "no union member present in xml response"))
    : service_integrations_union)

let service_integration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> service_integrations_union_of_xml i) ()

let serverless_identifier_of_xml i =
  let r_workgroup_identifier = ref None in
  let r_namespace_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "WorkgroupIdentifier"; "NamespaceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "WorkgroupIdentifier" ->
          r_workgroup_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WorkgroupIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NamespaceIdentifier" ->
          r_namespace_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NamespaceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     workgroup_identifier =
       Smaws_Lib.Xml.Parse.required "WorkgroupIdentifier" (( ! ) r_workgroup_identifier) i;
     namespace_identifier =
       Smaws_Lib.Xml.Parse.required "NamespaceIdentifier" (( ! ) r_namespace_identifier) i;
   }
    : serverless_identifier)

let sensitive_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let cluster_node_of_xml i =
  let r_public_ip_address = ref None in
  let r_private_ip_address = ref None in
  let r_node_role = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PublicIPAddress"; "PrivateIPAddress"; "NodeRole" ]
    (fun tag _ ->
      match tag with
      | "PublicIPAddress" ->
          r_public_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicIPAddress"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PrivateIPAddress" ->
          r_private_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrivateIPAddress"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeRole" ->
          r_node_role :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeRole" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     public_ip_address = ( ! ) r_public_ip_address;
     private_ip_address = ( ! ) r_private_ip_address;
     node_role = ( ! ) r_node_role;
   }
    : cluster_node)

let cluster_nodes_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cluster_node_of_xml i) ()

let secondary_cluster_info_of_xml i =
  let r_cluster_nodes = ref None in
  let r_availability_zone = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterNodes"; "AvailabilityZone" ] (fun tag _ ->
      match tag with
      | "ClusterNodes" ->
          r_cluster_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterNodes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> cluster_node_of_xml i)
                     ())
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_nodes = ( ! ) r_cluster_nodes; availability_zone = ( ! ) r_availability_zone }
    : secondary_cluster_info)

let boolean_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resize_cluster_message_of_xml i =
  let r_target_reserved_node_offering_id = ref None in
  let r_reserved_node_id = ref None in
  let r_classic = ref None in
  let r_number_of_nodes = ref None in
  let r_node_type = ref None in
  let r_cluster_type = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TargetReservedNodeOfferingId";
      "ReservedNodeId";
      "Classic";
      "NumberOfNodes";
      "NodeType";
      "ClusterType";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "TargetReservedNodeOfferingId" ->
          r_target_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Classic" ->
          r_classic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Classic"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "ClusterType" ->
          r_cluster_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterType" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_reserved_node_offering_id = ( ! ) r_target_reserved_node_offering_id;
     reserved_node_id = ( ! ) r_reserved_node_id;
     classic = ( ! ) r_classic;
     number_of_nodes = ( ! ) r_number_of_nodes;
     node_type = ( ! ) r_node_type;
     cluster_type = ( ! ) r_cluster_type;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : resize_cluster_message)

let pause_cluster_message_of_xml i =
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : pause_cluster_message)

let resume_cluster_message_of_xml i =
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : resume_cluster_message)

let scheduled_action_type_of_xml i =
  let r_resume_cluster = ref None in
  let r_pause_cluster = ref None in
  let r_resize_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResumeCluster"; "PauseCluster"; "ResizeCluster" ]
    (fun tag _ ->
      match tag with
      | "ResumeCluster" ->
          r_resume_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResumeCluster"
                 (fun i _ -> resume_cluster_message_of_xml i)
                 ())
      | "PauseCluster" ->
          r_pause_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PauseCluster"
                 (fun i _ -> pause_cluster_message_of_xml i)
                 ())
      | "ResizeCluster" ->
          r_resize_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResizeCluster"
                 (fun i _ -> resize_cluster_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resume_cluster = ( ! ) r_resume_cluster;
     pause_cluster = ( ! ) r_pause_cluster;
     resize_cluster = ( ! ) r_resize_cluster;
   }
    : scheduled_action_type)

let scheduled_action_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "DISABLED" -> DISABLED | "ACTIVE" -> ACTIVE | _ -> failwith "unknown enum value"
    : scheduled_action_state)

let scheduled_action_time_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledActionTime" (fun i _ -> t_stamp_of_xml i) ()

let scheduled_action_of_xml i =
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_next_invocations = ref None in
  let r_state = ref None in
  let r_scheduled_action_description = ref None in
  let r_iam_role = ref None in
  let r_schedule = ref None in
  let r_target_action = ref None in
  let r_scheduled_action_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EndTime";
      "StartTime";
      "NextInvocations";
      "State";
      "ScheduledActionDescription";
      "IamRole";
      "Schedule";
      "TargetAction";
      "ScheduledActionName";
    ] (fun tag _ ->
      match tag with
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "NextInvocations" ->
          r_next_invocations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextInvocations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledActionTime"
                     (fun i _ -> t_stamp_of_xml i)
                     ())
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> scheduled_action_state_of_xml i)
                 ())
      | "ScheduledActionDescription" ->
          r_scheduled_action_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IamRole" ->
          r_iam_role :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IamRole" (fun i _ -> string__of_xml i) ())
      | "Schedule" ->
          r_schedule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Schedule" (fun i _ -> string__of_xml i) ())
      | "TargetAction" ->
          r_target_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetAction"
                 (fun i _ -> scheduled_action_type_of_xml i)
                 ())
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     next_invocations = ( ! ) r_next_invocations;
     state = ( ! ) r_state;
     scheduled_action_description = ( ! ) r_scheduled_action_description;
     iam_role = ( ! ) r_iam_role;
     schedule = ( ! ) r_schedule;
     target_action = ( ! ) r_target_action;
     scheduled_action_name = ( ! ) r_scheduled_action_name;
   }
    : scheduled_action)

let scheduled_action_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledAction" (fun i _ -> scheduled_action_of_xml i) ()

let scheduled_actions_message_of_xml i =
  let r_scheduled_actions = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScheduledActions"; "Marker" ] (fun tag _ ->
      match tag with
      | "ScheduledActions" ->
          r_scheduled_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledAction"
                     (fun i _ -> scheduled_action_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ scheduled_actions = ( ! ) r_scheduled_actions; marker = ( ! ) r_marker }
    : scheduled_actions_message)

let scheduled_action_type_values_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ResumeCluster" -> RESUME_CLUSTER
   | "PauseCluster" -> PAUSE_CLUSTER
   | "ResizeCluster" -> RESIZE_CLUSTER
   | _ -> failwith "unknown enum value"
    : scheduled_action_type_values)

let scheduled_action_type_unsupported_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : scheduled_action_type_unsupported_fault)

let scheduled_action_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : scheduled_action_quota_exceeded_fault)

let scheduled_action_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : scheduled_action_not_found_fault)

let scheduled_action_filter_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "iam-role" -> IAM_ROLE
   | "cluster-identifier" -> CLUSTER_IDENTIFIER
   | _ -> failwith "unknown enum value"
    : scheduled_action_filter_name)

let scheduled_action_filter_of_xml i =
  let r_values = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values"; "Name" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "item" (fun i _ -> string__of_xml i) ())
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> scheduled_action_filter_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     values = Smaws_Lib.Xml.Parse.required "Values" (( ! ) r_values) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : scheduled_action_filter)

let scheduled_action_filter_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledActionFilter"
    (fun i _ -> scheduled_action_filter_of_xml i)
    ()

let scheduled_action_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : scheduled_action_already_exists_fault)

let schedule_definition_type_unsupported_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : schedule_definition_type_unsupported_fault)

let sns_topic_arn_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : sns_topic_arn_not_found_fault)

let sns_no_authorization_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : sns_no_authorization_fault)

let sns_invalid_topic_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : sns_invalid_topic_fault)

let s3_key_prefix_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let endpoint_of_xml i =
  let r_vpc_endpoints = ref None in
  let r_port = ref None in
  let r_address = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VpcEndpoints"; "Port"; "Address" ] (fun tag _ ->
      match tag with
      | "VpcEndpoints" ->
          r_vpc_endpoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcEndpoints"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcEndpoint"
                     (fun i _ -> vpc_endpoint_of_xml i)
                     ())
                 ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | "Address" ->
          r_address :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Address" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ vpc_endpoints = ( ! ) r_vpc_endpoints; port = ( ! ) r_port; address = ( ! ) r_address }
    : endpoint)

let cluster_security_group_membership_of_xml i =
  let r_status = ref None in
  let r_cluster_security_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "ClusterSecurityGroupName" ]
    (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status; cluster_security_group_name = ( ! ) r_cluster_security_group_name }
    : cluster_security_group_membership)

let cluster_security_group_membership_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroup"
    (fun i _ -> cluster_security_group_membership_of_xml i)
    ()

let cluster_parameter_status_of_xml i =
  let r_parameter_apply_error_description = ref None in
  let r_parameter_apply_status = ref None in
  let r_parameter_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ParameterApplyErrorDescription"; "ParameterApplyStatus"; "ParameterName" ] (fun tag _ ->
      match tag with
      | "ParameterApplyErrorDescription" ->
          r_parameter_apply_error_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterApplyErrorDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterApplyStatus" ->
          r_parameter_apply_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterApplyStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterName" ->
          r_parameter_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_apply_error_description = ( ! ) r_parameter_apply_error_description;
     parameter_apply_status = ( ! ) r_parameter_apply_status;
     parameter_name = ( ! ) r_parameter_name;
   }
    : cluster_parameter_status)

let cluster_parameter_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cluster_parameter_status_of_xml i) ()

let cluster_parameter_group_status_of_xml i =
  let r_cluster_parameter_status_list = ref None in
  let r_parameter_apply_status = ref None in
  let r_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterParameterStatusList"; "ParameterApplyStatus"; "ParameterGroupName" ] (fun tag _ ->
      match tag with
      | "ClusterParameterStatusList" ->
          r_cluster_parameter_status_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterStatusList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> cluster_parameter_status_of_xml i)
                     ())
                 ())
      | "ParameterApplyStatus" ->
          r_parameter_apply_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterApplyStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_parameter_status_list = ( ! ) r_cluster_parameter_status_list;
     parameter_apply_status = ( ! ) r_parameter_apply_status;
     parameter_group_name = ( ! ) r_parameter_group_name;
   }
    : cluster_parameter_group_status)

let cluster_parameter_group_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterParameterGroup"
    (fun i _ -> cluster_parameter_group_status_of_xml i)
    ()

let pending_modified_values_of_xml i =
  let r_encryption_type = ref None in
  let r_maintenance_track_name = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_publicly_accessible = ref None in
  let r_cluster_identifier = ref None in
  let r_automated_snapshot_retention_period = ref None in
  let r_cluster_version = ref None in
  let r_cluster_type = ref None in
  let r_number_of_nodes = ref None in
  let r_node_type = ref None in
  let r_master_user_password = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EncryptionType";
      "MaintenanceTrackName";
      "EnhancedVpcRouting";
      "PubliclyAccessible";
      "ClusterIdentifier";
      "AutomatedSnapshotRetentionPeriod";
      "ClusterVersion";
      "ClusterType";
      "NumberOfNodes";
      "NodeType";
      "MasterUserPassword";
    ] (fun tag _ ->
      match tag with
      | "EncryptionType" ->
          r_encryption_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EncryptionType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutomatedSnapshotRetentionPeriod" ->
          r_automated_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomatedSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterType" ->
          r_cluster_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterType" (fun i _ -> string__of_xml i) ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "MasterUserPassword" ->
          r_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserPassword"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     encryption_type = ( ! ) r_encryption_type;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     publicly_accessible = ( ! ) r_publicly_accessible;
     cluster_identifier = ( ! ) r_cluster_identifier;
     automated_snapshot_retention_period = ( ! ) r_automated_snapshot_retention_period;
     cluster_version = ( ! ) r_cluster_version;
     cluster_type = ( ! ) r_cluster_type;
     number_of_nodes = ( ! ) r_number_of_nodes;
     node_type = ( ! ) r_node_type;
     master_user_password = ( ! ) r_master_user_password;
   }
    : pending_modified_values)

let restore_status_of_xml i =
  let r_estimated_time_to_completion_in_seconds = ref None in
  let r_elapsed_time_in_seconds = ref None in
  let r_progress_in_mega_bytes = ref None in
  let r_snapshot_size_in_mega_bytes = ref None in
  let r_current_restore_rate_in_mega_bytes_per_second = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EstimatedTimeToCompletionInSeconds";
      "ElapsedTimeInSeconds";
      "ProgressInMegaBytes";
      "SnapshotSizeInMegaBytes";
      "CurrentRestoreRateInMegaBytesPerSecond";
      "Status";
    ] (fun tag _ ->
      match tag with
      | "EstimatedTimeToCompletionInSeconds" ->
          r_estimated_time_to_completion_in_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedTimeToCompletionInSeconds"
                 (fun i _ -> long_of_xml i)
                 ())
      | "ElapsedTimeInSeconds" ->
          r_elapsed_time_in_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ElapsedTimeInSeconds"
                 (fun i _ -> long_of_xml i)
                 ())
      | "ProgressInMegaBytes" ->
          r_progress_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressInMegaBytes"
                 (fun i _ -> long_of_xml i)
                 ())
      | "SnapshotSizeInMegaBytes" ->
          r_snapshot_size_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotSizeInMegaBytes"
                 (fun i _ -> long_of_xml i)
                 ())
      | "CurrentRestoreRateInMegaBytesPerSecond" ->
          r_current_restore_rate_in_mega_bytes_per_second :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentRestoreRateInMegaBytesPerSecond"
                 (fun i _ -> double_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     estimated_time_to_completion_in_seconds = ( ! ) r_estimated_time_to_completion_in_seconds;
     elapsed_time_in_seconds = ( ! ) r_elapsed_time_in_seconds;
     progress_in_mega_bytes = ( ! ) r_progress_in_mega_bytes;
     snapshot_size_in_mega_bytes = ( ! ) r_snapshot_size_in_mega_bytes;
     current_restore_rate_in_mega_bytes_per_second =
       ( ! ) r_current_restore_rate_in_mega_bytes_per_second;
     status = ( ! ) r_status;
   }
    : restore_status)

let double_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let data_transfer_progress_of_xml i =
  let r_elapsed_time_in_seconds = ref None in
  let r_estimated_time_to_completion_in_seconds = ref None in
  let r_data_transferred_in_mega_bytes = ref None in
  let r_total_data_in_mega_bytes = ref None in
  let r_current_rate_in_mega_bytes_per_second = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ElapsedTimeInSeconds";
      "EstimatedTimeToCompletionInSeconds";
      "DataTransferredInMegaBytes";
      "TotalDataInMegaBytes";
      "CurrentRateInMegaBytesPerSecond";
      "Status";
    ] (fun tag _ ->
      match tag with
      | "ElapsedTimeInSeconds" ->
          r_elapsed_time_in_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ElapsedTimeInSeconds"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "EstimatedTimeToCompletionInSeconds" ->
          r_estimated_time_to_completion_in_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedTimeToCompletionInSeconds"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "DataTransferredInMegaBytes" ->
          r_data_transferred_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataTransferredInMegaBytes"
                 (fun i _ -> long_of_xml i)
                 ())
      | "TotalDataInMegaBytes" ->
          r_total_data_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalDataInMegaBytes"
                 (fun i _ -> long_of_xml i)
                 ())
      | "CurrentRateInMegaBytesPerSecond" ->
          r_current_rate_in_mega_bytes_per_second :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentRateInMegaBytesPerSecond"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     elapsed_time_in_seconds = ( ! ) r_elapsed_time_in_seconds;
     estimated_time_to_completion_in_seconds = ( ! ) r_estimated_time_to_completion_in_seconds;
     data_transferred_in_mega_bytes = ( ! ) r_data_transferred_in_mega_bytes;
     total_data_in_mega_bytes = ( ! ) r_total_data_in_mega_bytes;
     current_rate_in_mega_bytes_per_second = ( ! ) r_current_rate_in_mega_bytes_per_second;
     status = ( ! ) r_status;
   }
    : data_transfer_progress)

let hsm_status_of_xml i =
  let r_status = ref None in
  let r_hsm_configuration_identifier = ref None in
  let r_hsm_client_certificate_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Status"; "HsmConfigurationIdentifier"; "HsmClientCertificateIdentifier" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = ( ! ) r_status;
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
   }
    : hsm_status)

let cluster_snapshot_copy_status_of_xml i =
  let r_snapshot_copy_grant_name = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_retention_period = ref None in
  let r_destination_region = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SnapshotCopyGrantName";
      "ManualSnapshotRetentionPeriod";
      "RetentionPeriod";
      "DestinationRegion";
    ] (fun tag _ ->
      match tag with
      | "SnapshotCopyGrantName" ->
          r_snapshot_copy_grant_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrantName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "RetentionPeriod" ->
          r_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetentionPeriod" (fun i _ -> long_of_xml i) ())
      | "DestinationRegion" ->
          r_destination_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_copy_grant_name = ( ! ) r_snapshot_copy_grant_name;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     retention_period = ( ! ) r_retention_period;
     destination_region = ( ! ) r_destination_region;
   }
    : cluster_snapshot_copy_status)

let elastic_ip_status_of_xml i =
  let r_status = ref None in
  let r_elastic_ip = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "ElasticIp" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "ElasticIp" ->
          r_elastic_ip :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticIp" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status; elastic_ip = ( ! ) r_elastic_ip } : elastic_ip_status)

let cluster_iam_role_of_xml i =
  let r_apply_status = ref None in
  let r_iam_role_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplyStatus"; "IamRoleArn" ] (fun tag _ ->
      match tag with
      | "ApplyStatus" ->
          r_apply_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyStatus" (fun i _ -> string__of_xml i) ())
      | "IamRoleArn" ->
          r_iam_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IamRoleArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ apply_status = ( ! ) r_apply_status; iam_role_arn = ( ! ) r_iam_role_arn } : cluster_iam_role)

let cluster_iam_role_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterIamRole" (fun i _ -> cluster_iam_role_of_xml i) ()

let pending_actions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let deferred_maintenance_window_of_xml i =
  let r_defer_maintenance_end_time = ref None in
  let r_defer_maintenance_start_time = ref None in
  let r_defer_maintenance_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DeferMaintenanceEndTime"; "DeferMaintenanceStartTime"; "DeferMaintenanceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "DeferMaintenanceEndTime" ->
          r_defer_maintenance_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceEndTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "DeferMaintenanceStartTime" ->
          r_defer_maintenance_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceStartTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "DeferMaintenanceIdentifier" ->
          r_defer_maintenance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     defer_maintenance_end_time = ( ! ) r_defer_maintenance_end_time;
     defer_maintenance_start_time = ( ! ) r_defer_maintenance_start_time;
     defer_maintenance_identifier = ( ! ) r_defer_maintenance_identifier;
   }
    : deferred_maintenance_window)

let deferred_maintenance_windows_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DeferredMaintenanceWindow"
    (fun i _ -> deferred_maintenance_window_of_xml i)
    ()

let resize_info_of_xml i =
  let r_allow_cancel_resize = ref None in
  let r_resize_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AllowCancelResize"; "ResizeType" ] (fun tag _ ->
      match tag with
      | "AllowCancelResize" ->
          r_allow_cancel_resize :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowCancelResize"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ResizeType" ->
          r_resize_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ResizeType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ allow_cancel_resize = ( ! ) r_allow_cancel_resize; resize_type = ( ! ) r_resize_type }
    : resize_info)

let aqua_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "applying" -> APPLYING
   | "disabled" -> DISABLED
   | "enabled" -> ENABLED
   | _ -> failwith "unknown enum value"
    : aqua_status)

let aqua_configuration_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "auto" -> AUTO
   | "disabled" -> DISABLED
   | "enabled" -> ENABLED
   | _ -> failwith "unknown enum value"
    : aqua_configuration_status)

let aqua_configuration_of_xml i =
  let r_aqua_configuration_status = ref None in
  let r_aqua_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AquaConfigurationStatus"; "AquaStatus" ]
    (fun tag _ ->
      match tag with
      | "AquaConfigurationStatus" ->
          r_aqua_configuration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaConfigurationStatus"
                 (fun i _ -> aqua_configuration_status_of_xml i)
                 ())
      | "AquaStatus" ->
          r_aqua_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaStatus"
                 (fun i _ -> aqua_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     aqua_configuration_status = ( ! ) r_aqua_configuration_status;
     aqua_status = ( ! ) r_aqua_status;
   }
    : aqua_configuration)

let reserved_node_exchange_status_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "FAILED" -> FAILED
   | "SUCCEEDED" -> SUCCEEDED
   | "RETRYING" -> RETRYING
   | "IN_PROGRESS" -> IN_PROGRESS
   | "PENDING" -> PENDING
   | "REQUESTED" -> REQUESTED
   | _ -> failwith "unknown enum value"
    : reserved_node_exchange_status_type)

let reserved_node_exchange_status_of_xml i =
  let r_target_reserved_node_count = ref None in
  let r_target_reserved_node_type = ref None in
  let r_target_reserved_node_offering_id = ref None in
  let r_source_reserved_node_count = ref None in
  let r_source_reserved_node_type = ref None in
  let r_source_reserved_node_id = ref None in
  let r_request_time = ref None in
  let r_status = ref None in
  let r_reserved_node_exchange_request_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TargetReservedNodeCount";
      "TargetReservedNodeType";
      "TargetReservedNodeOfferingId";
      "SourceReservedNodeCount";
      "SourceReservedNodeType";
      "SourceReservedNodeId";
      "RequestTime";
      "Status";
      "ReservedNodeExchangeRequestId";
    ] (fun tag _ ->
      match tag with
      | "TargetReservedNodeCount" ->
          r_target_reserved_node_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeCount"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "TargetReservedNodeType" ->
          r_target_reserved_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetReservedNodeOfferingId" ->
          r_target_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceReservedNodeCount" ->
          r_source_reserved_node_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceReservedNodeCount"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "SourceReservedNodeType" ->
          r_source_reserved_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceReservedNodeType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceReservedNodeId" ->
          r_source_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RequestTime" ->
          r_request_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestTime" (fun i _ -> t_stamp_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> reserved_node_exchange_status_type_of_xml i)
                 ())
      | "ReservedNodeExchangeRequestId" ->
          r_reserved_node_exchange_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeExchangeRequestId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_reserved_node_count = ( ! ) r_target_reserved_node_count;
     target_reserved_node_type = ( ! ) r_target_reserved_node_type;
     target_reserved_node_offering_id = ( ! ) r_target_reserved_node_offering_id;
     source_reserved_node_count = ( ! ) r_source_reserved_node_count;
     source_reserved_node_type = ( ! ) r_source_reserved_node_type;
     source_reserved_node_id = ( ! ) r_source_reserved_node_id;
     request_time = ( ! ) r_request_time;
     status = ( ! ) r_status;
     reserved_node_exchange_request_id = ( ! ) r_reserved_node_exchange_request_id;
   }
    : reserved_node_exchange_status)

let cluster_of_xml i =
  let r_extra_compute_for_automatic_optimization = ref None in
  let r_catalog_arn = ref None in
  let r_lakehouse_registration_status = ref None in
  let r_multi_az_secondary = ref None in
  let r_multi_a_z = ref None in
  let r_ip_address_type = ref None in
  let r_master_password_secret_kms_key_id = ref None in
  let r_master_password_secret_arn = ref None in
  let r_custom_domain_certificate_expiry_date = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_custom_domain_name = ref None in
  let r_reserved_node_exchange_status = ref None in
  let r_default_iam_role_arn = ref None in
  let r_aqua_configuration = ref None in
  let r_total_storage_capacity_in_mega_bytes = ref None in
  let r_cluster_namespace_arn = ref None in
  let r_availability_zone_relocation_status = ref None in
  let r_resize_info = ref None in
  let r_next_maintenance_window_start_time = ref None in
  let r_expected_next_snapshot_schedule_time_status = ref None in
  let r_expected_next_snapshot_schedule_time = ref None in
  let r_snapshot_schedule_state = ref None in
  let r_snapshot_schedule_identifier = ref None in
  let r_deferred_maintenance_windows = ref None in
  let r_elastic_resize_number_of_node_options = ref None in
  let r_maintenance_track_name = ref None in
  let r_pending_actions = ref None in
  let r_iam_roles = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_kms_key_id = ref None in
  let r_tags = ref None in
  let r_cluster_revision_number = ref None in
  let r_elastic_ip_status = ref None in
  let r_cluster_nodes = ref None in
  let r_cluster_public_key = ref None in
  let r_cluster_snapshot_copy_status = ref None in
  let r_hsm_status = ref None in
  let r_data_transfer_progress = ref None in
  let r_restore_status = ref None in
  let r_encrypted = ref None in
  let r_publicly_accessible = ref None in
  let r_number_of_nodes = ref None in
  let r_allow_version_upgrade = ref None in
  let r_cluster_version = ref None in
  let r_pending_modified_values = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_availability_zone = ref None in
  let r_vpc_id = ref None in
  let r_cluster_subnet_group_name = ref None in
  let r_cluster_parameter_groups = ref None in
  let r_vpc_security_groups = ref None in
  let r_cluster_security_groups = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_automated_snapshot_retention_period = ref None in
  let r_cluster_create_time = ref None in
  let r_endpoint = ref None in
  let r_db_name = ref None in
  let r_master_username = ref None in
  let r_modify_status = ref None in
  let r_cluster_availability_status = ref None in
  let r_cluster_status = ref None in
  let r_node_type = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ExtraComputeForAutomaticOptimization";
      "CatalogArn";
      "LakehouseRegistrationStatus";
      "MultiAZSecondary";
      "MultiAZ";
      "IpAddressType";
      "MasterPasswordSecretKmsKeyId";
      "MasterPasswordSecretArn";
      "CustomDomainCertificateExpiryDate";
      "CustomDomainCertificateArn";
      "CustomDomainName";
      "ReservedNodeExchangeStatus";
      "DefaultIamRoleArn";
      "AquaConfiguration";
      "TotalStorageCapacityInMegaBytes";
      "ClusterNamespaceArn";
      "AvailabilityZoneRelocationStatus";
      "ResizeInfo";
      "NextMaintenanceWindowStartTime";
      "ExpectedNextSnapshotScheduleTimeStatus";
      "ExpectedNextSnapshotScheduleTime";
      "SnapshotScheduleState";
      "SnapshotScheduleIdentifier";
      "DeferredMaintenanceWindows";
      "ElasticResizeNumberOfNodeOptions";
      "MaintenanceTrackName";
      "PendingActions";
      "IamRoles";
      "EnhancedVpcRouting";
      "KmsKeyId";
      "Tags";
      "ClusterRevisionNumber";
      "ElasticIpStatus";
      "ClusterNodes";
      "ClusterPublicKey";
      "ClusterSnapshotCopyStatus";
      "HsmStatus";
      "DataTransferProgress";
      "RestoreStatus";
      "Encrypted";
      "PubliclyAccessible";
      "NumberOfNodes";
      "AllowVersionUpgrade";
      "ClusterVersion";
      "PendingModifiedValues";
      "PreferredMaintenanceWindow";
      "AvailabilityZone";
      "VpcId";
      "ClusterSubnetGroupName";
      "ClusterParameterGroups";
      "VpcSecurityGroups";
      "ClusterSecurityGroups";
      "ManualSnapshotRetentionPeriod";
      "AutomatedSnapshotRetentionPeriod";
      "ClusterCreateTime";
      "Endpoint";
      "DBName";
      "MasterUsername";
      "ModifyStatus";
      "ClusterAvailabilityStatus";
      "ClusterStatus";
      "NodeType";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "ExtraComputeForAutomaticOptimization" ->
          r_extra_compute_for_automatic_optimization :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtraComputeForAutomaticOptimization"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CatalogArn" ->
          r_catalog_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CatalogArn" (fun i _ -> string__of_xml i) ())
      | "LakehouseRegistrationStatus" ->
          r_lakehouse_registration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseRegistrationStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MultiAZSecondary" ->
          r_multi_az_secondary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZSecondary"
                 (fun i _ -> secondary_cluster_info_of_xml i)
                 ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ" (fun i _ -> string__of_xml i) ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType" (fun i _ -> string__of_xml i) ())
      | "MasterPasswordSecretKmsKeyId" ->
          r_master_password_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MasterPasswordSecretArn" ->
          r_master_password_secret_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainCertificateExpiryDate" ->
          r_custom_domain_certificate_expiry_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateExpiryDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedNodeExchangeStatus" ->
          r_reserved_node_exchange_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeExchangeStatus"
                 (fun i _ -> reserved_node_exchange_status_of_xml i)
                 ())
      | "DefaultIamRoleArn" ->
          r_default_iam_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultIamRoleArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AquaConfiguration" ->
          r_aqua_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaConfiguration"
                 (fun i _ -> aqua_configuration_of_xml i)
                 ())
      | "TotalStorageCapacityInMegaBytes" ->
          r_total_storage_capacity_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalStorageCapacityInMegaBytes"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "ClusterNamespaceArn" ->
          r_cluster_namespace_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterNamespaceArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AvailabilityZoneRelocationStatus" ->
          r_availability_zone_relocation_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneRelocationStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ResizeInfo" ->
          r_resize_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResizeInfo"
                 (fun i _ -> resize_info_of_xml i)
                 ())
      | "NextMaintenanceWindowStartTime" ->
          r_next_maintenance_window_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextMaintenanceWindowStartTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ExpectedNextSnapshotScheduleTimeStatus" ->
          r_expected_next_snapshot_schedule_time_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpectedNextSnapshotScheduleTimeStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ExpectedNextSnapshotScheduleTime" ->
          r_expected_next_snapshot_schedule_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpectedNextSnapshotScheduleTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "SnapshotScheduleState" ->
          r_snapshot_schedule_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotScheduleState"
                 (fun i _ -> schedule_state_of_xml i)
                 ())
      | "SnapshotScheduleIdentifier" ->
          r_snapshot_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DeferredMaintenanceWindows" ->
          r_deferred_maintenance_windows :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferredMaintenanceWindows"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DeferredMaintenanceWindow"
                     (fun i _ -> deferred_maintenance_window_of_xml i)
                     ())
                 ())
      | "ElasticResizeNumberOfNodeOptions" ->
          r_elastic_resize_number_of_node_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticResizeNumberOfNodeOptions"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PendingActions" ->
          r_pending_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "IamRoles" ->
          r_iam_roles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IamRoles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterIamRole"
                     (fun i _ -> cluster_iam_role_of_xml i)
                     ())
                 ())
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ClusterRevisionNumber" ->
          r_cluster_revision_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterRevisionNumber"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ElasticIpStatus" ->
          r_elastic_ip_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticIpStatus"
                 (fun i _ -> elastic_ip_status_of_xml i)
                 ())
      | "ClusterNodes" ->
          r_cluster_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterNodes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> cluster_node_of_xml i)
                     ())
                 ())
      | "ClusterPublicKey" ->
          r_cluster_public_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterPublicKey"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterSnapshotCopyStatus" ->
          r_cluster_snapshot_copy_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSnapshotCopyStatus"
                 (fun i _ -> cluster_snapshot_copy_status_of_xml i)
                 ())
      | "HsmStatus" ->
          r_hsm_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmStatus" (fun i _ -> hsm_status_of_xml i) ())
      | "DataTransferProgress" ->
          r_data_transfer_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataTransferProgress"
                 (fun i _ -> data_transfer_progress_of_xml i)
                 ())
      | "RestoreStatus" ->
          r_restore_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RestoreStatus"
                 (fun i _ -> restore_status_of_xml i)
                 ())
      | "Encrypted" ->
          r_encrypted :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted" (fun i _ -> boolean__of_xml i) ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes" (fun i _ -> integer_of_xml i) ())
      | "AllowVersionUpgrade" ->
          r_allow_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PendingModifiedValues" ->
          r_pending_modified_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingModifiedValues"
                 (fun i _ -> pending_modified_values_of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterParameterGroups" ->
          r_cluster_parameter_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterParameterGroup"
                     (fun i _ -> cluster_parameter_group_status_of_xml i)
                     ())
                 ())
      | "VpcSecurityGroups" ->
          r_vpc_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroup"
                     (fun i _ -> vpc_security_group_membership_of_xml i)
                     ())
                 ())
      | "ClusterSecurityGroups" ->
          r_cluster_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroup"
                     (fun i _ -> cluster_security_group_membership_of_xml i)
                     ())
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "AutomatedSnapshotRetentionPeriod" ->
          r_automated_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomatedSnapshotRetentionPeriod"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "ClusterCreateTime" ->
          r_cluster_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> endpoint_of_xml i) ())
      | "DBName" ->
          r_db_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DBName" (fun i _ -> string__of_xml i) ())
      | "MasterUsername" ->
          r_master_username :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUsername"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ModifyStatus" ->
          r_modify_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModifyStatus" (fun i _ -> string__of_xml i) ())
      | "ClusterAvailabilityStatus" ->
          r_cluster_availability_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterAvailabilityStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterStatus" ->
          r_cluster_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterStatus" (fun i _ -> string__of_xml i) ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     extra_compute_for_automatic_optimization = ( ! ) r_extra_compute_for_automatic_optimization;
     catalog_arn = ( ! ) r_catalog_arn;
     lakehouse_registration_status = ( ! ) r_lakehouse_registration_status;
     multi_az_secondary = ( ! ) r_multi_az_secondary;
     multi_a_z = ( ! ) r_multi_a_z;
     ip_address_type = ( ! ) r_ip_address_type;
     master_password_secret_kms_key_id = ( ! ) r_master_password_secret_kms_key_id;
     master_password_secret_arn = ( ! ) r_master_password_secret_arn;
     custom_domain_certificate_expiry_date = ( ! ) r_custom_domain_certificate_expiry_date;
     custom_domain_certificate_arn = ( ! ) r_custom_domain_certificate_arn;
     custom_domain_name = ( ! ) r_custom_domain_name;
     reserved_node_exchange_status = ( ! ) r_reserved_node_exchange_status;
     default_iam_role_arn = ( ! ) r_default_iam_role_arn;
     aqua_configuration = ( ! ) r_aqua_configuration;
     total_storage_capacity_in_mega_bytes = ( ! ) r_total_storage_capacity_in_mega_bytes;
     cluster_namespace_arn = ( ! ) r_cluster_namespace_arn;
     availability_zone_relocation_status = ( ! ) r_availability_zone_relocation_status;
     resize_info = ( ! ) r_resize_info;
     next_maintenance_window_start_time = ( ! ) r_next_maintenance_window_start_time;
     expected_next_snapshot_schedule_time_status =
       ( ! ) r_expected_next_snapshot_schedule_time_status;
     expected_next_snapshot_schedule_time = ( ! ) r_expected_next_snapshot_schedule_time;
     snapshot_schedule_state = ( ! ) r_snapshot_schedule_state;
     snapshot_schedule_identifier = ( ! ) r_snapshot_schedule_identifier;
     deferred_maintenance_windows = ( ! ) r_deferred_maintenance_windows;
     elastic_resize_number_of_node_options = ( ! ) r_elastic_resize_number_of_node_options;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     pending_actions = ( ! ) r_pending_actions;
     iam_roles = ( ! ) r_iam_roles;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     kms_key_id = ( ! ) r_kms_key_id;
     tags = ( ! ) r_tags;
     cluster_revision_number = ( ! ) r_cluster_revision_number;
     elastic_ip_status = ( ! ) r_elastic_ip_status;
     cluster_nodes = ( ! ) r_cluster_nodes;
     cluster_public_key = ( ! ) r_cluster_public_key;
     cluster_snapshot_copy_status = ( ! ) r_cluster_snapshot_copy_status;
     hsm_status = ( ! ) r_hsm_status;
     data_transfer_progress = ( ! ) r_data_transfer_progress;
     restore_status = ( ! ) r_restore_status;
     encrypted = ( ! ) r_encrypted;
     publicly_accessible = ( ! ) r_publicly_accessible;
     number_of_nodes = ( ! ) r_number_of_nodes;
     allow_version_upgrade = ( ! ) r_allow_version_upgrade;
     cluster_version = ( ! ) r_cluster_version;
     pending_modified_values = ( ! ) r_pending_modified_values;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     availability_zone = ( ! ) r_availability_zone;
     vpc_id = ( ! ) r_vpc_id;
     cluster_subnet_group_name = ( ! ) r_cluster_subnet_group_name;
     cluster_parameter_groups = ( ! ) r_cluster_parameter_groups;
     vpc_security_groups = ( ! ) r_vpc_security_groups;
     cluster_security_groups = ( ! ) r_cluster_security_groups;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     automated_snapshot_retention_period = ( ! ) r_automated_snapshot_retention_period;
     cluster_create_time = ( ! ) r_cluster_create_time;
     endpoint = ( ! ) r_endpoint;
     db_name = ( ! ) r_db_name;
     master_username = ( ! ) r_master_username;
     modify_status = ( ! ) r_modify_status;
     cluster_availability_status = ( ! ) r_cluster_availability_status;
     cluster_status = ( ! ) r_cluster_status;
     node_type = ( ! ) r_node_type;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : cluster)

let rotate_encryption_key_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : rotate_encryption_key_result)

let rotate_encryption_key_message_of_xml i =
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : rotate_encryption_key_message)

let invalid_cluster_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_cluster_state_fault)

let dependent_service_request_throttling_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : dependent_service_request_throttling_fault)

let revoke_snapshot_access_result_of_xml i =
  let r_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Snapshot" ] (fun tag _ ->
      match tag with
      | "Snapshot" ->
          r_snapshot :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot = ( ! ) r_snapshot } : revoke_snapshot_access_result)

let revoke_snapshot_access_message_of_xml i =
  let r_account_with_restore_access = ref None in
  let r_snapshot_cluster_identifier = ref None in
  let r_snapshot_arn = ref None in
  let r_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AccountWithRestoreAccess"; "SnapshotClusterIdentifier"; "SnapshotArn"; "SnapshotIdentifier" ]
    (fun tag _ ->
      match tag with
      | "AccountWithRestoreAccess" ->
          r_account_with_restore_access :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountWithRestoreAccess"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotClusterIdentifier" ->
          r_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     account_with_restore_access =
       Smaws_Lib.Xml.Parse.required "AccountWithRestoreAccess"
         (( ! ) r_account_with_restore_access)
         i;
     snapshot_cluster_identifier = ( ! ) r_snapshot_cluster_identifier;
     snapshot_arn = ( ! ) r_snapshot_arn;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
   }
    : revoke_snapshot_access_message)

let cluster_snapshot_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_snapshot_not_found_fault)

let authorization_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : authorization_not_found_fault)

let access_to_snapshot_denied_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : access_to_snapshot_denied_fault)

let revoke_endpoint_access_message_of_xml i =
  let r_force = ref None in
  let r_vpc_ids = ref None in
  let r_account = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Force"; "VpcIds"; "Account"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "Force" ->
          r_force :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Force" (fun i _ -> boolean__of_xml i) ())
      | "VpcIds" ->
          r_vpc_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     force = ( ! ) r_force;
     vpc_ids = ( ! ) r_vpc_ids;
     account = ( ! ) r_account;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : revoke_endpoint_access_message)

let invalid_endpoint_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_endpoint_state_fault)

let invalid_cluster_security_group_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_cluster_security_group_state_fault)

let invalid_authorization_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_authorization_state_fault)

let endpoint_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : endpoint_not_found_fault)

let endpoint_authorization_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : endpoint_authorization_not_found_fault)

let authorization_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Revoking" -> REVOKING
   | "Authorized" -> AUTHORIZED
   | _ -> failwith "unknown enum value"
    : authorization_status)

let endpoint_authorization_of_xml i =
  let r_endpoint_count = ref None in
  let r_allowed_vp_cs = ref None in
  let r_allowed_all_vp_cs = ref None in
  let r_status = ref None in
  let r_cluster_status = ref None in
  let r_authorize_time = ref None in
  let r_cluster_identifier = ref None in
  let r_grantee = ref None in
  let r_grantor = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EndpointCount";
      "AllowedVPCs";
      "AllowedAllVPCs";
      "Status";
      "ClusterStatus";
      "AuthorizeTime";
      "ClusterIdentifier";
      "Grantee";
      "Grantor";
    ] (fun tag _ ->
      match tag with
      | "EndpointCount" ->
          r_endpoint_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointCount" (fun i _ -> integer_of_xml i) ())
      | "AllowedVPCs" ->
          r_allowed_vp_cs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedVPCs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "AllowedAllVPCs" ->
          r_allowed_all_vp_cs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedAllVPCs"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> authorization_status_of_xml i)
                 ())
      | "ClusterStatus" ->
          r_cluster_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterStatus" (fun i _ -> string__of_xml i) ())
      | "AuthorizeTime" ->
          r_authorize_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthorizeTime" (fun i _ -> t_stamp_of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Grantee" ->
          r_grantee :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Grantee" (fun i _ -> string__of_xml i) ())
      | "Grantor" ->
          r_grantor :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Grantor" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     endpoint_count = ( ! ) r_endpoint_count;
     allowed_vp_cs = ( ! ) r_allowed_vp_cs;
     allowed_all_vp_cs = ( ! ) r_allowed_all_vp_cs;
     status = ( ! ) r_status;
     cluster_status = ( ! ) r_cluster_status;
     authorize_time = ( ! ) r_authorize_time;
     cluster_identifier = ( ! ) r_cluster_identifier;
     grantee = ( ! ) r_grantee;
     grantor = ( ! ) r_grantor;
   }
    : endpoint_authorization)

let ec2_security_group_of_xml i =
  let r_tags = ref None in
  let r_ec2_security_group_owner_id = ref None in
  let r_ec2_security_group_name = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "EC2SecurityGroupOwnerId"; "EC2SecurityGroupName"; "Status" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "EC2SecurityGroupOwnerId" ->
          r_ec2_security_group_owner_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupOwnerId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EC2SecurityGroupName" ->
          r_ec2_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     ec2_security_group_owner_id = ( ! ) r_ec2_security_group_owner_id;
     ec2_security_group_name = ( ! ) r_ec2_security_group_name;
     status = ( ! ) r_status;
   }
    : ec2_security_group)

let ec2_security_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "EC2SecurityGroup"
    (fun i _ -> ec2_security_group_of_xml i)
    ()

let ip_range_of_xml i =
  let r_tags = ref None in
  let r_cidri_p = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "CIDRIP"; "Status" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "CIDRIP" ->
          r_cidri_p :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CIDRIP" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tags = ( ! ) r_tags; cidri_p = ( ! ) r_cidri_p; status = ( ! ) r_status } : ip_range)

let ip_range_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "IPRange" (fun i _ -> ip_range_of_xml i) ()

let cluster_security_group_of_xml i =
  let r_tags = ref None in
  let r_ip_ranges = ref None in
  let r_ec2_security_groups = ref None in
  let r_description = ref None in
  let r_cluster_security_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "IPRanges"; "EC2SecurityGroups"; "Description"; "ClusterSecurityGroupName" ]
    (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "IPRanges" ->
          r_ip_ranges :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IPRanges"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "IPRange" (fun i _ -> ip_range_of_xml i) ())
                 ())
      | "EC2SecurityGroups" ->
          r_ec2_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EC2SecurityGroup"
                     (fun i _ -> ec2_security_group_of_xml i)
                     ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     ip_ranges = ( ! ) r_ip_ranges;
     ec2_security_groups = ( ! ) r_ec2_security_groups;
     description = ( ! ) r_description;
     cluster_security_group_name = ( ! ) r_cluster_security_group_name;
   }
    : cluster_security_group)

let revoke_cluster_security_group_ingress_result_of_xml i =
  let r_cluster_security_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterSecurityGroup" ] (fun tag _ ->
      match tag with
      | "ClusterSecurityGroup" ->
          r_cluster_security_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroup"
                 (fun i _ -> cluster_security_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_security_group = ( ! ) r_cluster_security_group }
    : revoke_cluster_security_group_ingress_result)

let revoke_cluster_security_group_ingress_message_of_xml i =
  let r_ec2_security_group_owner_id = ref None in
  let r_ec2_security_group_name = ref None in
  let r_cidri_p = ref None in
  let r_cluster_security_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EC2SecurityGroupOwnerId"; "EC2SecurityGroupName"; "CIDRIP"; "ClusterSecurityGroupName" ]
    (fun tag _ ->
      match tag with
      | "EC2SecurityGroupOwnerId" ->
          r_ec2_security_group_owner_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupOwnerId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EC2SecurityGroupName" ->
          r_ec2_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CIDRIP" ->
          r_cidri_p :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CIDRIP" (fun i _ -> string__of_xml i) ())
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     ec2_security_group_owner_id = ( ! ) r_ec2_security_group_owner_id;
     ec2_security_group_name = ( ! ) r_ec2_security_group_name;
     cidri_p = ( ! ) r_cidri_p;
     cluster_security_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSecurityGroupName"
         (( ! ) r_cluster_security_group_name)
         i;
   }
    : revoke_cluster_security_group_ingress_message)

let cluster_security_group_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_security_group_not_found_fault)

let revision_target_of_xml i =
  let r_database_revision_release_date = ref None in
  let r_description = ref None in
  let r_database_revision = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DatabaseRevisionReleaseDate"; "Description"; "DatabaseRevision" ] (fun tag _ ->
      match tag with
      | "DatabaseRevisionReleaseDate" ->
          r_database_revision_release_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseRevisionReleaseDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "DatabaseRevision" ->
          r_database_revision :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseRevision"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     database_revision_release_date = ( ! ) r_database_revision_release_date;
     description = ( ! ) r_description;
     database_revision = ( ! ) r_database_revision;
   }
    : revision_target)

let revision_targets_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "RevisionTarget" (fun i _ -> revision_target_of_xml i) ()

let resume_cluster_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : resume_cluster_result)

let insufficient_cluster_capacity_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : insufficient_cluster_capacity_fault)

let restore_table_from_cluster_snapshot_result_of_xml i =
  let r_table_restore_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TableRestoreStatus" ] (fun tag _ ->
      match tag with
      | "TableRestoreStatus" ->
          r_table_restore_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TableRestoreStatus"
                 (fun i _ -> table_restore_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ table_restore_status = ( ! ) r_table_restore_status }
    : restore_table_from_cluster_snapshot_result)

let restore_table_from_cluster_snapshot_message_of_xml i =
  let r_enable_case_sensitive_identifier = ref None in
  let r_new_table_name = ref None in
  let r_target_schema_name = ref None in
  let r_target_database_name = ref None in
  let r_source_table_name = ref None in
  let r_source_schema_name = ref None in
  let r_source_database_name = ref None in
  let r_snapshot_identifier = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EnableCaseSensitiveIdentifier";
      "NewTableName";
      "TargetSchemaName";
      "TargetDatabaseName";
      "SourceTableName";
      "SourceSchemaName";
      "SourceDatabaseName";
      "SnapshotIdentifier";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "EnableCaseSensitiveIdentifier" ->
          r_enable_case_sensitive_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableCaseSensitiveIdentifier"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NewTableName" ->
          r_new_table_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewTableName" (fun i _ -> string__of_xml i) ())
      | "TargetSchemaName" ->
          r_target_schema_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetSchemaName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetDatabaseName" ->
          r_target_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDatabaseName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceTableName" ->
          r_source_table_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceTableName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceSchemaName" ->
          r_source_schema_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceSchemaName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceDatabaseName" ->
          r_source_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDatabaseName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enable_case_sensitive_identifier = ( ! ) r_enable_case_sensitive_identifier;
     new_table_name = Smaws_Lib.Xml.Parse.required "NewTableName" (( ! ) r_new_table_name) i;
     target_schema_name = ( ! ) r_target_schema_name;
     target_database_name = ( ! ) r_target_database_name;
     source_table_name =
       Smaws_Lib.Xml.Parse.required "SourceTableName" (( ! ) r_source_table_name) i;
     source_schema_name = ( ! ) r_source_schema_name;
     source_database_name =
       Smaws_Lib.Xml.Parse.required "SourceDatabaseName" (( ! ) r_source_database_name) i;
     snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifier" (( ! ) r_snapshot_identifier) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : restore_table_from_cluster_snapshot_message)

let invalid_table_restore_argument_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_table_restore_argument_fault)

let invalid_cluster_snapshot_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_cluster_snapshot_state_fault)

let in_progress_table_restore_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : in_progress_table_restore_quota_exceeded_fault)

let restore_from_cluster_snapshot_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : restore_from_cluster_snapshot_result)

let cluster_security_group_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroupName" (fun i _ -> string__of_xml i) ()

let iam_role_arn_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "IamRoleArn" (fun i _ -> string__of_xml i) ()

let catalog_name_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let restore_from_cluster_snapshot_message_of_xml i =
  let r_redshift_idc_application_arn = ref None in
  let r_catalog_name = ref None in
  let r_multi_a_z = ref None in
  let r_ip_address_type = ref None in
  let r_master_password_secret_kms_key_id = ref None in
  let r_manage_master_password = ref None in
  let r_encrypted = ref None in
  let r_target_reserved_node_offering_id = ref None in
  let r_reserved_node_id = ref None in
  let r_default_iam_role_arn = ref None in
  let r_aqua_configuration_status = ref None in
  let r_availability_zone_relocation = ref None in
  let r_number_of_nodes = ref None in
  let r_snapshot_schedule_identifier = ref None in
  let r_maintenance_track_name = ref None in
  let r_iam_roles = ref None in
  let r_additional_info = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_node_type = ref None in
  let r_kms_key_id = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_automated_snapshot_retention_period = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_cluster_security_groups = ref None in
  let r_cluster_parameter_group_name = ref None in
  let r_elastic_ip = ref None in
  let r_hsm_configuration_identifier = ref None in
  let r_hsm_client_certificate_identifier = ref None in
  let r_owner_account = ref None in
  let r_publicly_accessible = ref None in
  let r_cluster_subnet_group_name = ref None in
  let r_allow_version_upgrade = ref None in
  let r_availability_zone = ref None in
  let r_port = ref None in
  let r_snapshot_cluster_identifier = ref None in
  let r_snapshot_arn = ref None in
  let r_snapshot_identifier = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RedshiftIdcApplicationArn";
      "CatalogName";
      "MultiAZ";
      "IpAddressType";
      "MasterPasswordSecretKmsKeyId";
      "ManageMasterPassword";
      "Encrypted";
      "TargetReservedNodeOfferingId";
      "ReservedNodeId";
      "DefaultIamRoleArn";
      "AquaConfigurationStatus";
      "AvailabilityZoneRelocation";
      "NumberOfNodes";
      "SnapshotScheduleIdentifier";
      "MaintenanceTrackName";
      "IamRoles";
      "AdditionalInfo";
      "EnhancedVpcRouting";
      "NodeType";
      "KmsKeyId";
      "ManualSnapshotRetentionPeriod";
      "AutomatedSnapshotRetentionPeriod";
      "PreferredMaintenanceWindow";
      "VpcSecurityGroupIds";
      "ClusterSecurityGroups";
      "ClusterParameterGroupName";
      "ElasticIp";
      "HsmConfigurationIdentifier";
      "HsmClientCertificateIdentifier";
      "OwnerAccount";
      "PubliclyAccessible";
      "ClusterSubnetGroupName";
      "AllowVersionUpgrade";
      "AvailabilityZone";
      "Port";
      "SnapshotClusterIdentifier";
      "SnapshotArn";
      "SnapshotIdentifier";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "RedshiftIdcApplicationArn" ->
          r_redshift_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CatalogName" ->
          r_catalog_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CatalogName"
                 (fun i _ -> catalog_name_string_of_xml i)
                 ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType" (fun i _ -> string__of_xml i) ())
      | "MasterPasswordSecretKmsKeyId" ->
          r_master_password_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ManageMasterPassword" ->
          r_manage_master_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManageMasterPassword"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Encrypted" ->
          r_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "TargetReservedNodeOfferingId" ->
          r_target_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DefaultIamRoleArn" ->
          r_default_iam_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultIamRoleArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AquaConfigurationStatus" ->
          r_aqua_configuration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaConfigurationStatus"
                 (fun i _ -> aqua_configuration_status_of_xml i)
                 ())
      | "AvailabilityZoneRelocation" ->
          r_availability_zone_relocation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneRelocation"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotScheduleIdentifier" ->
          r_snapshot_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IamRoles" ->
          r_iam_roles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IamRoles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "IamRoleArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "AdditionalInfo" ->
          r_additional_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdditionalInfo"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "AutomatedSnapshotRetentionPeriod" ->
          r_automated_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomatedSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ClusterSecurityGroups" ->
          r_cluster_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroupName"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ClusterParameterGroupName" ->
          r_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ElasticIp" ->
          r_elastic_ip :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticIp" (fun i _ -> string__of_xml i) ())
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "OwnerAccount" ->
          r_owner_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerAccount" (fun i _ -> string__of_xml i) ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AllowVersionUpgrade" ->
          r_allow_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "SnapshotClusterIdentifier" ->
          r_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     redshift_idc_application_arn = ( ! ) r_redshift_idc_application_arn;
     catalog_name = ( ! ) r_catalog_name;
     multi_a_z = ( ! ) r_multi_a_z;
     ip_address_type = ( ! ) r_ip_address_type;
     master_password_secret_kms_key_id = ( ! ) r_master_password_secret_kms_key_id;
     manage_master_password = ( ! ) r_manage_master_password;
     encrypted = ( ! ) r_encrypted;
     target_reserved_node_offering_id = ( ! ) r_target_reserved_node_offering_id;
     reserved_node_id = ( ! ) r_reserved_node_id;
     default_iam_role_arn = ( ! ) r_default_iam_role_arn;
     aqua_configuration_status = ( ! ) r_aqua_configuration_status;
     availability_zone_relocation = ( ! ) r_availability_zone_relocation;
     number_of_nodes = ( ! ) r_number_of_nodes;
     snapshot_schedule_identifier = ( ! ) r_snapshot_schedule_identifier;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     iam_roles = ( ! ) r_iam_roles;
     additional_info = ( ! ) r_additional_info;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     node_type = ( ! ) r_node_type;
     kms_key_id = ( ! ) r_kms_key_id;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     automated_snapshot_retention_period = ( ! ) r_automated_snapshot_retention_period;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     cluster_security_groups = ( ! ) r_cluster_security_groups;
     cluster_parameter_group_name = ( ! ) r_cluster_parameter_group_name;
     elastic_ip = ( ! ) r_elastic_ip;
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
     owner_account = ( ! ) r_owner_account;
     publicly_accessible = ( ! ) r_publicly_accessible;
     cluster_subnet_group_name = ( ! ) r_cluster_subnet_group_name;
     allow_version_upgrade = ( ! ) r_allow_version_upgrade;
     availability_zone = ( ! ) r_availability_zone;
     port = ( ! ) r_port;
     snapshot_cluster_identifier = ( ! ) r_snapshot_cluster_identifier;
     snapshot_arn = ( ! ) r_snapshot_arn;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : restore_from_cluster_snapshot_message)

let reserved_node_offering_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : reserved_node_offering_not_found_fault)

let reserved_node_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : reserved_node_not_found_fault)

let reserved_node_already_migrated_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : reserved_node_already_migrated_fault)

let reserved_node_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : reserved_node_already_exists_fault)

let redshift_idc_application_not_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : redshift_idc_application_not_exists_fault)

let number_of_nodes_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : number_of_nodes_quota_exceeded_fault)

let number_of_nodes_per_cluster_limit_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : number_of_nodes_per_cluster_limit_exceeded_fault)

let limit_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : limit_exceeded_fault)

let ipv6_cidr_block_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : ipv6_cidr_block_not_found_fault)

let invalid_vpc_network_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_vpc_network_state_fault)

let invalid_tag_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_tag_fault)

let invalid_subnet_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_subnet)

let invalid_restore_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_restore_fault)

let invalid_reserved_node_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_reserved_node_state_fault)

let invalid_elastic_ip_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_elastic_ip_fault)

let invalid_cluster_track_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_cluster_track_fault)

let invalid_cluster_subnet_group_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_cluster_subnet_group_state_fault)

let hsm_configuration_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : hsm_configuration_not_found_fault)

let hsm_client_certificate_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : hsm_client_certificate_not_found_fault)

let dependent_service_unavailable_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : dependent_service_unavailable_fault)

let dependent_service_access_denied_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : dependent_service_access_denied_fault)

let cluster_subnet_group_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_subnet_group_not_found_fault)

let cluster_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_quota_exceeded_fault)

let cluster_parameter_group_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_parameter_group_not_found_fault)

let cluster_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_already_exists_fault)

let resource_policy_of_xml i =
  let r_policy = ref None in
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Policy"; "ResourceArn" ] (fun tag _ ->
      match tag with
      | "Policy" ->
          r_policy :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Policy" (fun i _ -> string__of_xml i) ())
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy = ( ! ) r_policy; resource_arn = ( ! ) r_resource_arn } : resource_policy)

let resource_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_not_found_fault)

let import_tables_completed_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let import_tables_in_progress_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let import_tables_not_started_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let resize_progress_message_of_xml i =
  let r_data_transfer_progress_percent = ref None in
  let r_target_encryption_type = ref None in
  let r_message = ref None in
  let r_resize_type = ref None in
  let r_estimated_time_to_completion_in_seconds = ref None in
  let r_elapsed_time_in_seconds = ref None in
  let r_progress_in_mega_bytes = ref None in
  let r_total_resize_data_in_mega_bytes = ref None in
  let r_avg_resize_rate_in_mega_bytes_per_second = ref None in
  let r_import_tables_not_started = ref None in
  let r_import_tables_in_progress = ref None in
  let r_import_tables_completed = ref None in
  let r_status = ref None in
  let r_target_cluster_type = ref None in
  let r_target_number_of_nodes = ref None in
  let r_target_node_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DataTransferProgressPercent";
      "TargetEncryptionType";
      "Message";
      "ResizeType";
      "EstimatedTimeToCompletionInSeconds";
      "ElapsedTimeInSeconds";
      "ProgressInMegaBytes";
      "TotalResizeDataInMegaBytes";
      "AvgResizeRateInMegaBytesPerSecond";
      "ImportTablesNotStarted";
      "ImportTablesInProgress";
      "ImportTablesCompleted";
      "Status";
      "TargetClusterType";
      "TargetNumberOfNodes";
      "TargetNodeType";
    ] (fun tag _ ->
      match tag with
      | "DataTransferProgressPercent" ->
          r_data_transfer_progress_percent :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataTransferProgressPercent"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "TargetEncryptionType" ->
          r_target_encryption_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetEncryptionType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | "ResizeType" ->
          r_resize_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ResizeType" (fun i _ -> string__of_xml i) ())
      | "EstimatedTimeToCompletionInSeconds" ->
          r_estimated_time_to_completion_in_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedTimeToCompletionInSeconds"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "ElapsedTimeInSeconds" ->
          r_elapsed_time_in_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ElapsedTimeInSeconds"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "ProgressInMegaBytes" ->
          r_progress_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressInMegaBytes"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "TotalResizeDataInMegaBytes" ->
          r_total_resize_data_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalResizeDataInMegaBytes"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "AvgResizeRateInMegaBytesPerSecond" ->
          r_avg_resize_rate_in_mega_bytes_per_second :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvgResizeRateInMegaBytesPerSecond"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "ImportTablesNotStarted" ->
          r_import_tables_not_started :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImportTablesNotStarted"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "ImportTablesInProgress" ->
          r_import_tables_in_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImportTablesInProgress"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "ImportTablesCompleted" ->
          r_import_tables_completed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImportTablesCompleted"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "TargetClusterType" ->
          r_target_cluster_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetClusterType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetNumberOfNodes" ->
          r_target_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetNumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "TargetNodeType" ->
          r_target_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetNodeType"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     data_transfer_progress_percent = ( ! ) r_data_transfer_progress_percent;
     target_encryption_type = ( ! ) r_target_encryption_type;
     message = ( ! ) r_message;
     resize_type = ( ! ) r_resize_type;
     estimated_time_to_completion_in_seconds = ( ! ) r_estimated_time_to_completion_in_seconds;
     elapsed_time_in_seconds = ( ! ) r_elapsed_time_in_seconds;
     progress_in_mega_bytes = ( ! ) r_progress_in_mega_bytes;
     total_resize_data_in_mega_bytes = ( ! ) r_total_resize_data_in_mega_bytes;
     avg_resize_rate_in_mega_bytes_per_second = ( ! ) r_avg_resize_rate_in_mega_bytes_per_second;
     import_tables_not_started = ( ! ) r_import_tables_not_started;
     import_tables_in_progress = ( ! ) r_import_tables_in_progress;
     import_tables_completed = ( ! ) r_import_tables_completed;
     status = ( ! ) r_status;
     target_cluster_type = ( ! ) r_target_cluster_type;
     target_number_of_nodes = ( ! ) r_target_number_of_nodes;
     target_node_type = ( ! ) r_target_node_type;
   }
    : resize_progress_message)

let resize_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resize_not_found_fault)

let resize_cluster_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : resize_cluster_result)

let parameter_apply_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "dynamic" -> Dynamic | "static" -> Static | _ -> failwith "unknown enum value"
    : parameter_apply_type)

let parameter_of_xml i =
  let r_minimum_engine_version = ref None in
  let r_is_modifiable = ref None in
  let r_apply_type = ref None in
  let r_allowed_values = ref None in
  let r_data_type = ref None in
  let r_source = ref None in
  let r_description = ref None in
  let r_parameter_value = ref None in
  let r_parameter_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MinimumEngineVersion";
      "IsModifiable";
      "ApplyType";
      "AllowedValues";
      "DataType";
      "Source";
      "Description";
      "ParameterValue";
      "ParameterName";
    ] (fun tag _ ->
      match tag with
      | "MinimumEngineVersion" ->
          r_minimum_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinimumEngineVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IsModifiable" ->
          r_is_modifiable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsModifiable" (fun i _ -> boolean__of_xml i) ())
      | "ApplyType" ->
          r_apply_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyType"
                 (fun i _ -> parameter_apply_type_of_xml i)
                 ())
      | "AllowedValues" ->
          r_allowed_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedValues" (fun i _ -> string__of_xml i) ())
      | "DataType" ->
          r_data_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DataType" (fun i _ -> string__of_xml i) ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> string__of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "ParameterValue" ->
          r_parameter_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterValue"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterName" ->
          r_parameter_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     minimum_engine_version = ( ! ) r_minimum_engine_version;
     is_modifiable = ( ! ) r_is_modifiable;
     apply_type = ( ! ) r_apply_type;
     allowed_values = ( ! ) r_allowed_values;
     data_type = ( ! ) r_data_type;
     source = ( ! ) r_source;
     description = ( ! ) r_description;
     parameter_value = ( ! ) r_parameter_value;
     parameter_name = ( ! ) r_parameter_name;
   }
    : parameter)

let parameters_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Parameter" (fun i _ -> parameter_of_xml i) ()

let reset_cluster_parameter_group_message_of_xml i =
  let r_parameters = ref None in
  let r_reset_all_parameters = ref None in
  let r_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Parameters"; "ResetAllParameters"; "ParameterGroupName" ] (fun tag _ ->
      match tag with
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Parameter"
                     (fun i _ -> parameter_of_xml i)
                     ())
                 ())
      | "ResetAllParameters" ->
          r_reset_all_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResetAllParameters"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameters = ( ! ) r_parameters;
     reset_all_parameters = ( ! ) r_reset_all_parameters;
     parameter_group_name =
       Smaws_Lib.Xml.Parse.required "ParameterGroupName" (( ! ) r_parameter_group_name) i;
   }
    : reset_cluster_parameter_group_message)

let invalid_cluster_parameter_group_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_cluster_parameter_group_state_fault)

let cluster_parameter_group_name_message_of_xml i =
  let r_parameter_group_status = ref None in
  let r_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ParameterGroupStatus"; "ParameterGroupName" ]
    (fun tag _ ->
      match tag with
      | "ParameterGroupStatus" ->
          r_parameter_group_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_group_status = ( ! ) r_parameter_group_status;
     parameter_group_name = ( ! ) r_parameter_group_name;
   }
    : cluster_parameter_group_name_message)

let recurring_charge_of_xml i =
  let r_recurring_charge_frequency = ref None in
  let r_recurring_charge_amount = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "RecurringChargeFrequency"; "RecurringChargeAmount" ] (fun tag _ ->
      match tag with
      | "RecurringChargeFrequency" ->
          r_recurring_charge_frequency :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecurringChargeFrequency"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RecurringChargeAmount" ->
          r_recurring_charge_amount :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecurringChargeAmount"
                 (fun i _ -> double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     recurring_charge_frequency = ( ! ) r_recurring_charge_frequency;
     recurring_charge_amount = ( ! ) r_recurring_charge_amount;
   }
    : recurring_charge)

let recurring_charge_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "RecurringCharge" (fun i _ -> recurring_charge_of_xml i) ()

let reserved_node_offering_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Upgradable" -> Upgradable
   | "Regular" -> Regular
   | _ -> failwith "unknown enum value"
    : reserved_node_offering_type)

let reserved_node_of_xml i =
  let r_reserved_node_offering_type = ref None in
  let r_recurring_charges = ref None in
  let r_offering_type = ref None in
  let r_state = ref None in
  let r_node_count = ref None in
  let r_currency_code = ref None in
  let r_usage_price = ref None in
  let r_fixed_price = ref None in
  let r_duration = ref None in
  let r_start_time = ref None in
  let r_node_type = ref None in
  let r_reserved_node_offering_id = ref None in
  let r_reserved_node_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReservedNodeOfferingType";
      "RecurringCharges";
      "OfferingType";
      "State";
      "NodeCount";
      "CurrencyCode";
      "UsagePrice";
      "FixedPrice";
      "Duration";
      "StartTime";
      "NodeType";
      "ReservedNodeOfferingId";
      "ReservedNodeId";
    ] (fun tag _ ->
      match tag with
      | "ReservedNodeOfferingType" ->
          r_reserved_node_offering_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingType"
                 (fun i _ -> reserved_node_offering_type_of_xml i)
                 ())
      | "RecurringCharges" ->
          r_recurring_charges :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecurringCharges"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "RecurringCharge"
                     (fun i _ -> recurring_charge_of_xml i)
                     ())
                 ())
      | "OfferingType" ->
          r_offering_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OfferingType" (fun i _ -> string__of_xml i) ())
      | "State" ->
          r_state :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "State" (fun i _ -> string__of_xml i) ())
      | "NodeCount" ->
          r_node_count :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeCount" (fun i _ -> integer_of_xml i) ())
      | "CurrencyCode" ->
          r_currency_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrencyCode" (fun i _ -> string__of_xml i) ())
      | "UsagePrice" ->
          r_usage_price :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UsagePrice" (fun i _ -> double_of_xml i) ())
      | "FixedPrice" ->
          r_fixed_price :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "FixedPrice" (fun i _ -> double_of_xml i) ())
      | "Duration" ->
          r_duration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Duration" (fun i _ -> integer_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "ReservedNodeOfferingId" ->
          r_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_node_offering_type = ( ! ) r_reserved_node_offering_type;
     recurring_charges = ( ! ) r_recurring_charges;
     offering_type = ( ! ) r_offering_type;
     state = ( ! ) r_state;
     node_count = ( ! ) r_node_count;
     currency_code = ( ! ) r_currency_code;
     usage_price = ( ! ) r_usage_price;
     fixed_price = ( ! ) r_fixed_price;
     duration = ( ! ) r_duration;
     start_time = ( ! ) r_start_time;
     node_type = ( ! ) r_node_type;
     reserved_node_offering_id = ( ! ) r_reserved_node_offering_id;
     reserved_node_id = ( ! ) r_reserved_node_id;
   }
    : reserved_node)

let reserved_node_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNode" (fun i _ -> reserved_node_of_xml i) ()

let reserved_nodes_message_of_xml i =
  let r_reserved_nodes = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedNodes"; "Marker" ] (fun tag _ ->
      match tag with
      | "ReservedNodes" ->
          r_reserved_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNode"
                     (fun i _ -> reserved_node_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ reserved_nodes = ( ! ) r_reserved_nodes; marker = ( ! ) r_marker } : reserved_nodes_message)

let reserved_node_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : reserved_node_quota_exceeded_fault)

let reserved_node_offering_of_xml i =
  let r_reserved_node_offering_type = ref None in
  let r_recurring_charges = ref None in
  let r_offering_type = ref None in
  let r_currency_code = ref None in
  let r_usage_price = ref None in
  let r_fixed_price = ref None in
  let r_duration = ref None in
  let r_node_type = ref None in
  let r_reserved_node_offering_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReservedNodeOfferingType";
      "RecurringCharges";
      "OfferingType";
      "CurrencyCode";
      "UsagePrice";
      "FixedPrice";
      "Duration";
      "NodeType";
      "ReservedNodeOfferingId";
    ] (fun tag _ ->
      match tag with
      | "ReservedNodeOfferingType" ->
          r_reserved_node_offering_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingType"
                 (fun i _ -> reserved_node_offering_type_of_xml i)
                 ())
      | "RecurringCharges" ->
          r_recurring_charges :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecurringCharges"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "RecurringCharge"
                     (fun i _ -> recurring_charge_of_xml i)
                     ())
                 ())
      | "OfferingType" ->
          r_offering_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OfferingType" (fun i _ -> string__of_xml i) ())
      | "CurrencyCode" ->
          r_currency_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrencyCode" (fun i _ -> string__of_xml i) ())
      | "UsagePrice" ->
          r_usage_price :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UsagePrice" (fun i _ -> double_of_xml i) ())
      | "FixedPrice" ->
          r_fixed_price :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "FixedPrice" (fun i _ -> double_of_xml i) ())
      | "Duration" ->
          r_duration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Duration" (fun i _ -> integer_of_xml i) ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "ReservedNodeOfferingId" ->
          r_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_node_offering_type = ( ! ) r_reserved_node_offering_type;
     recurring_charges = ( ! ) r_recurring_charges;
     offering_type = ( ! ) r_offering_type;
     currency_code = ( ! ) r_currency_code;
     usage_price = ( ! ) r_usage_price;
     fixed_price = ( ! ) r_fixed_price;
     duration = ( ! ) r_duration;
     node_type = ( ! ) r_node_type;
     reserved_node_offering_id = ( ! ) r_reserved_node_offering_id;
   }
    : reserved_node_offering)

let reserved_node_offering_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeOffering"
    (fun i _ -> reserved_node_offering_of_xml i)
    ()

let reserved_node_offerings_message_of_xml i =
  let r_reserved_node_offerings = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedNodeOfferings"; "Marker" ] (fun tag _ ->
      match tag with
      | "ReservedNodeOfferings" ->
          r_reserved_node_offerings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeOffering"
                     (fun i _ -> reserved_node_offering_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ reserved_node_offerings = ( ! ) r_reserved_node_offerings; marker = ( ! ) r_marker }
    : reserved_node_offerings_message)

let reserved_node_exchange_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeExchangeStatus"
    (fun i _ -> reserved_node_exchange_status_of_xml i)
    ()

let reserved_node_exchange_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : reserved_node_exchange_not_found_fault)

let reserved_node_exchange_action_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "resize-cluster" -> RESIZE_CLUSTER
   | "restore-cluster" -> RESTORE_CLUSTER
   | _ -> failwith "unknown enum value"
    : reserved_node_exchange_action_type)

let reserved_node_configuration_option_of_xml i =
  let r_target_reserved_node_offering = ref None in
  let r_target_reserved_node_count = ref None in
  let r_source_reserved_node = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TargetReservedNodeOffering"; "TargetReservedNodeCount"; "SourceReservedNode" ] (fun tag _ ->
      match tag with
      | "TargetReservedNodeOffering" ->
          r_target_reserved_node_offering :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeOffering"
                 (fun i _ -> reserved_node_offering_of_xml i)
                 ())
      | "TargetReservedNodeCount" ->
          r_target_reserved_node_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeCount"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "SourceReservedNode" ->
          r_source_reserved_node :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceReservedNode"
                 (fun i _ -> reserved_node_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_reserved_node_offering = ( ! ) r_target_reserved_node_offering;
     target_reserved_node_count = ( ! ) r_target_reserved_node_count;
     source_reserved_node = ( ! ) r_source_reserved_node;
   }
    : reserved_node_configuration_option)

let reserved_node_configuration_option_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeConfigurationOption"
    (fun i _ -> reserved_node_configuration_option_of_xml i)
    ()

let reject_data_share_message_of_xml i =
  let r_data_share_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DataShareArn" ] (fun tag _ ->
      match tag with
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data_share_arn = Smaws_Lib.Xml.Parse.required "DataShareArn" (( ! ) r_data_share_arn) i }
    : reject_data_share_message)

let invalid_data_share_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_data_share_fault)

let data_share_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "AVAILABLE" -> AVAILABLE
   | "REJECTED" -> REJECTED
   | "DEAUTHORIZED" -> DEAUTHORIZED
   | "AUTHORIZED" -> AUTHORIZED
   | "PENDING_AUTHORIZATION" -> PENDING_AUTHORIZATION
   | "ACTIVE" -> ACTIVE
   | _ -> failwith "unknown enum value"
    : data_share_status)

let data_share_association_of_xml i =
  let r_consumer_accepted_writes = ref None in
  let r_producer_allowed_writes = ref None in
  let r_status_change_date = ref None in
  let r_created_date = ref None in
  let r_consumer_region = ref None in
  let r_status = ref None in
  let r_consumer_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ConsumerAcceptedWrites";
      "ProducerAllowedWrites";
      "StatusChangeDate";
      "CreatedDate";
      "ConsumerRegion";
      "Status";
      "ConsumerIdentifier";
    ] (fun tag _ ->
      match tag with
      | "ConsumerAcceptedWrites" ->
          r_consumer_accepted_writes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerAcceptedWrites"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ProducerAllowedWrites" ->
          r_producer_allowed_writes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProducerAllowedWrites"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "StatusChangeDate" ->
          r_status_change_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusChangeDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "CreatedDate" ->
          r_created_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedDate" (fun i _ -> t_stamp_of_xml i) ())
      | "ConsumerRegion" ->
          r_consumer_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> data_share_status_of_xml i)
                 ())
      | "ConsumerIdentifier" ->
          r_consumer_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     consumer_accepted_writes = ( ! ) r_consumer_accepted_writes;
     producer_allowed_writes = ( ! ) r_producer_allowed_writes;
     status_change_date = ( ! ) r_status_change_date;
     created_date = ( ! ) r_created_date;
     consumer_region = ( ! ) r_consumer_region;
     status = ( ! ) r_status;
     consumer_identifier = ( ! ) r_consumer_identifier;
   }
    : data_share_association)

let data_share_association_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> data_share_association_of_xml i) ()

let data_share_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "INTERNAL" -> INTERNAL | _ -> failwith "unknown enum value" : data_share_type)

let data_share_of_xml i =
  let r_data_share_type = ref None in
  let r_managed_by = ref None in
  let r_data_share_associations = ref None in
  let r_allow_publicly_accessible_consumers = ref None in
  let r_producer_arn = ref None in
  let r_data_share_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DataShareType";
      "ManagedBy";
      "DataShareAssociations";
      "AllowPubliclyAccessibleConsumers";
      "ProducerArn";
      "DataShareArn";
    ] (fun tag _ ->
      match tag with
      | "DataShareType" ->
          r_data_share_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareType"
                 (fun i _ -> data_share_type_of_xml i)
                 ())
      | "ManagedBy" ->
          r_managed_by :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedBy" (fun i _ -> string__of_xml i) ())
      | "DataShareAssociations" ->
          r_data_share_associations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareAssociations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> data_share_association_of_xml i)
                     ())
                 ())
      | "AllowPubliclyAccessibleConsumers" ->
          r_allow_publicly_accessible_consumers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowPubliclyAccessibleConsumers"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ProducerArn" ->
          r_producer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProducerArn" (fun i _ -> string__of_xml i) ())
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     data_share_type = ( ! ) r_data_share_type;
     managed_by = ( ! ) r_managed_by;
     data_share_associations = ( ! ) r_data_share_associations;
     allow_publicly_accessible_consumers = ( ! ) r_allow_publicly_accessible_consumers;
     producer_arn = ( ! ) r_producer_arn;
     data_share_arn = ( ! ) r_data_share_arn;
   }
    : data_share)

let namespace_registration_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Deregistering" -> DEREGISTERING
   | "Registering" -> REGISTERING
   | _ -> failwith "unknown enum value"
    : namespace_registration_status)

let register_namespace_output_message_of_xml i =
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> namespace_registration_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status } : register_namespace_output_message)

let provisioned_identifier_of_xml i =
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : provisioned_identifier)

let namespace_identifier_union_of_xml i =
  let r_provisioned_identifier = ref None in
  let r_serverless_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ProvisionedIdentifier"; "ServerlessIdentifier" ]
    (fun tag _ ->
      match tag with
      | "ProvisionedIdentifier" ->
          r_provisioned_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProvisionedIdentifier"
                 (fun i _ -> provisioned_identifier_of_xml i)
                 ())
      | "ServerlessIdentifier" ->
          r_serverless_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessIdentifier"
                 (fun i _ -> serverless_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_provisioned_identifier with
   | Some v -> ProvisionedIdentifier v
   | None -> (
       match ( ! ) r_serverless_identifier with
       | Some v -> ServerlessIdentifier v
       | None -> failwith "no union member present in xml response")
    : namespace_identifier_union)

let consumer_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let register_namespace_input_message_of_xml i =
  let r_consumer_identifiers = ref None in
  let r_namespace_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConsumerIdentifiers"; "NamespaceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "ConsumerIdentifiers" ->
          r_consumer_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "NamespaceIdentifier" ->
          r_namespace_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NamespaceIdentifier"
                 (fun i _ -> namespace_identifier_union_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     consumer_identifiers =
       Smaws_Lib.Xml.Parse.required "ConsumerIdentifiers" (( ! ) r_consumer_identifiers) i;
     namespace_identifier =
       Smaws_Lib.Xml.Parse.required "NamespaceIdentifier" (( ! ) r_namespace_identifier) i;
   }
    : register_namespace_input_message)

let invalid_namespace_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_namespace_fault)

let reference_link_of_xml i =
  let r_link = ref None in
  let r_text = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Link"; "Text" ] (fun tag _ ->
      match tag with
      | "Link" ->
          r_link :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Link" (fun i _ -> string__of_xml i) ())
      | "Text" ->
          r_text :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Text" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ link = ( ! ) r_link; text = ( ! ) r_text } : reference_link)

let reference_link_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReferenceLink" (fun i _ -> reference_link_of_xml i) ()

let reboot_cluster_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : reboot_cluster_result)

let reboot_cluster_message_of_xml i =
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : reboot_cluster_message)

let invalid_policy_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_policy_fault)

let conflict_policy_update_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : conflict_policy_update_fault)

let put_resource_policy_result_of_xml i =
  let r_resource_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourcePolicy" ] (fun tag _ ->
      match tag with
      | "ResourcePolicy" ->
          r_resource_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcePolicy"
                 (fun i _ -> resource_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_policy = ( ! ) r_resource_policy } : put_resource_policy_result)

let put_resource_policy_message_of_xml i =
  let r_policy = ref None in
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Policy"; "ResourceArn" ] (fun tag _ ->
      match tag with
      | "Policy" ->
          r_policy :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Policy" (fun i _ -> string__of_xml i) ())
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy = Smaws_Lib.Xml.Parse.required "Policy" (( ! ) r_policy) i;
     resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i;
   }
    : put_resource_policy_message)

let purchase_reserved_node_offering_result_of_xml i =
  let r_reserved_node = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedNode" ] (fun tag _ ->
      match tag with
      | "ReservedNode" ->
          r_reserved_node :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNode"
                 (fun i _ -> reserved_node_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ reserved_node = ( ! ) r_reserved_node } : purchase_reserved_node_offering_result)

let purchase_reserved_node_offering_message_of_xml i =
  let r_node_count = ref None in
  let r_reserved_node_offering_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NodeCount"; "ReservedNodeOfferingId" ]
    (fun tag _ ->
      match tag with
      | "NodeCount" ->
          r_node_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeCount"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ReservedNodeOfferingId" ->
          r_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     node_count = ( ! ) r_node_count;
     reserved_node_offering_id =
       Smaws_Lib.Xml.Parse.required "ReservedNodeOfferingId" (( ! ) r_reserved_node_offering_id) i;
   }
    : purchase_reserved_node_offering_message)

let pause_cluster_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : pause_cluster_result)

let invalid_usage_limit_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_usage_limit_fault)

let modify_usage_limit_message_of_xml i =
  let r_breach_action = ref None in
  let r_amount = ref None in
  let r_usage_limit_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "BreachAction"; "Amount"; "UsageLimitId" ]
    (fun tag _ ->
      match tag with
      | "BreachAction" ->
          r_breach_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BreachAction"
                 (fun i _ -> usage_limit_breach_action_of_xml i)
                 ())
      | "Amount" ->
          r_amount :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Amount" (fun i _ -> long_optional_of_xml i) ())
      | "UsageLimitId" ->
          r_usage_limit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsageLimitId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     breach_action = ( ! ) r_breach_action;
     amount = ( ! ) r_amount;
     usage_limit_id = Smaws_Lib.Xml.Parse.required "UsageLimitId" (( ! ) r_usage_limit_id) i;
   }
    : modify_usage_limit_message)

let invalid_schedule_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_schedule_fault)

let modify_snapshot_schedule_message_of_xml i =
  let r_schedule_definitions = ref None in
  let r_schedule_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScheduleDefinitions"; "ScheduleIdentifier" ]
    (fun tag _ ->
      match tag with
      | "ScheduleDefinitions" ->
          r_schedule_definitions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleDefinitions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ScheduleDefinition"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ScheduleIdentifier" ->
          r_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     schedule_definitions =
       Smaws_Lib.Xml.Parse.required "ScheduleDefinitions" (( ! ) r_schedule_definitions) i;
     schedule_identifier =
       Smaws_Lib.Xml.Parse.required "ScheduleIdentifier" (( ! ) r_schedule_identifier) i;
   }
    : modify_snapshot_schedule_message)

let invalid_retention_period_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_retention_period_fault)

let modify_snapshot_copy_retention_period_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : modify_snapshot_copy_retention_period_result)

let modify_snapshot_copy_retention_period_message_of_xml i =
  let r_manual = ref None in
  let r_retention_period = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Manual"; "RetentionPeriod"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "Manual" ->
          r_manual :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Manual" (fun i _ -> boolean__of_xml i) ())
      | "RetentionPeriod" ->
          r_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetentionPeriod"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     manual = ( ! ) r_manual;
     retention_period = Smaws_Lib.Xml.Parse.required "RetentionPeriod" (( ! ) r_retention_period) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : modify_snapshot_copy_retention_period_message)

let invalid_scheduled_action_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_scheduled_action_fault)

let modify_scheduled_action_message_of_xml i =
  let r_enable = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_scheduled_action_description = ref None in
  let r_iam_role = ref None in
  let r_schedule = ref None in
  let r_target_action = ref None in
  let r_scheduled_action_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Enable";
      "EndTime";
      "StartTime";
      "ScheduledActionDescription";
      "IamRole";
      "Schedule";
      "TargetAction";
      "ScheduledActionName";
    ] (fun tag _ ->
      match tag with
      | "Enable" ->
          r_enable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enable"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "ScheduledActionDescription" ->
          r_scheduled_action_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IamRole" ->
          r_iam_role :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IamRole" (fun i _ -> string__of_xml i) ())
      | "Schedule" ->
          r_schedule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Schedule" (fun i _ -> string__of_xml i) ())
      | "TargetAction" ->
          r_target_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetAction"
                 (fun i _ -> scheduled_action_type_of_xml i)
                 ())
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enable = ( ! ) r_enable;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     scheduled_action_description = ( ! ) r_scheduled_action_description;
     iam_role = ( ! ) r_iam_role;
     schedule = ( ! ) r_schedule;
     target_action = ( ! ) r_target_action;
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
   }
    : modify_scheduled_action_message)

let redshift_idc_application_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let identity_namespace_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let idc_display_name_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let authorized_audience_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let authorized_token_issuer_of_xml i =
  let r_authorized_audiences_list = ref None in
  let r_trusted_token_issuer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AuthorizedAudiencesList"; "TrustedTokenIssuerArn" ] (fun tag _ ->
      match tag with
      | "AuthorizedAudiencesList" ->
          r_authorized_audiences_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthorizedAudiencesList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "TrustedTokenIssuerArn" ->
          r_trusted_token_issuer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustedTokenIssuerArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authorized_audiences_list = ( ! ) r_authorized_audiences_list;
     trusted_token_issuer_arn = ( ! ) r_trusted_token_issuer_arn;
   }
    : authorized_token_issuer)

let authorized_token_issuer_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> authorized_token_issuer_of_xml i) ()

let application_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Lakehouse" -> LAKEHOUSE | "None" -> NONE | _ -> failwith "unknown enum value"
    : application_type)

let redshift_idc_application_of_xml i =
  let r_sso_tag_keys = ref None in
  let r_tags = ref None in
  let r_application_type = ref None in
  let r_service_integrations = ref None in
  let r_authorized_token_issuer_list = ref None in
  let r_idc_onboard_status = ref None in
  let r_idc_managed_application_arn = ref None in
  let r_iam_role_arn = ref None in
  let r_idc_display_name = ref None in
  let r_identity_namespace = ref None in
  let r_redshift_idc_application_arn = ref None in
  let r_redshift_idc_application_name = ref None in
  let r_idc_instance_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SsoTagKeys";
      "Tags";
      "ApplicationType";
      "ServiceIntegrations";
      "AuthorizedTokenIssuerList";
      "IdcOnboardStatus";
      "IdcManagedApplicationArn";
      "IamRoleArn";
      "IdcDisplayName";
      "IdentityNamespace";
      "RedshiftIdcApplicationArn";
      "RedshiftIdcApplicationName";
      "IdcInstanceArn";
    ] (fun tag _ ->
      match tag with
      | "SsoTagKeys" ->
          r_sso_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SsoTagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ApplicationType" ->
          r_application_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationType"
                 (fun i _ -> application_type_of_xml i)
                 ())
      | "ServiceIntegrations" ->
          r_service_integrations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceIntegrations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> service_integrations_union_of_xml i)
                     ())
                 ())
      | "AuthorizedTokenIssuerList" ->
          r_authorized_token_issuer_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthorizedTokenIssuerList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> authorized_token_issuer_of_xml i)
                     ())
                 ())
      | "IdcOnboardStatus" ->
          r_idc_onboard_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdcOnboardStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IdcManagedApplicationArn" ->
          r_idc_managed_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdcManagedApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IamRoleArn" ->
          r_iam_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IamRoleArn" (fun i _ -> string__of_xml i) ())
      | "IdcDisplayName" ->
          r_idc_display_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdcDisplayName"
                 (fun i _ -> idc_display_name_string_of_xml i)
                 ())
      | "IdentityNamespace" ->
          r_identity_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdentityNamespace"
                 (fun i _ -> identity_namespace_string_of_xml i)
                 ())
      | "RedshiftIdcApplicationArn" ->
          r_redshift_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RedshiftIdcApplicationName" ->
          r_redshift_idc_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationName"
                 (fun i _ -> redshift_idc_application_name_of_xml i)
                 ())
      | "IdcInstanceArn" ->
          r_idc_instance_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdcInstanceArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sso_tag_keys = ( ! ) r_sso_tag_keys;
     tags = ( ! ) r_tags;
     application_type = ( ! ) r_application_type;
     service_integrations = ( ! ) r_service_integrations;
     authorized_token_issuer_list = ( ! ) r_authorized_token_issuer_list;
     idc_onboard_status = ( ! ) r_idc_onboard_status;
     idc_managed_application_arn = ( ! ) r_idc_managed_application_arn;
     iam_role_arn = ( ! ) r_iam_role_arn;
     idc_display_name = ( ! ) r_idc_display_name;
     identity_namespace = ( ! ) r_identity_namespace;
     redshift_idc_application_arn = ( ! ) r_redshift_idc_application_arn;
     redshift_idc_application_name = ( ! ) r_redshift_idc_application_name;
     idc_instance_arn = ( ! ) r_idc_instance_arn;
   }
    : redshift_idc_application)

let modify_redshift_idc_application_result_of_xml i =
  let r_redshift_idc_application = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RedshiftIdcApplication" ] (fun tag _ ->
      match tag with
      | "RedshiftIdcApplication" ->
          r_redshift_idc_application :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplication"
                 (fun i _ -> redshift_idc_application_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ redshift_idc_application = ( ! ) r_redshift_idc_application }
    : modify_redshift_idc_application_result)

let modify_redshift_idc_application_message_of_xml i =
  let r_service_integrations = ref None in
  let r_authorized_token_issuer_list = ref None in
  let r_idc_display_name = ref None in
  let r_iam_role_arn = ref None in
  let r_identity_namespace = ref None in
  let r_redshift_idc_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ServiceIntegrations";
      "AuthorizedTokenIssuerList";
      "IdcDisplayName";
      "IamRoleArn";
      "IdentityNamespace";
      "RedshiftIdcApplicationArn";
    ] (fun tag _ ->
      match tag with
      | "ServiceIntegrations" ->
          r_service_integrations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceIntegrations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> service_integrations_union_of_xml i)
                     ())
                 ())
      | "AuthorizedTokenIssuerList" ->
          r_authorized_token_issuer_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthorizedTokenIssuerList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> authorized_token_issuer_of_xml i)
                     ())
                 ())
      | "IdcDisplayName" ->
          r_idc_display_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdcDisplayName"
                 (fun i _ -> idc_display_name_string_of_xml i)
                 ())
      | "IamRoleArn" ->
          r_iam_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IamRoleArn" (fun i _ -> string__of_xml i) ())
      | "IdentityNamespace" ->
          r_identity_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdentityNamespace"
                 (fun i _ -> identity_namespace_string_of_xml i)
                 ())
      | "RedshiftIdcApplicationArn" ->
          r_redshift_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     service_integrations = ( ! ) r_service_integrations;
     authorized_token_issuer_list = ( ! ) r_authorized_token_issuer_list;
     idc_display_name = ( ! ) r_idc_display_name;
     iam_role_arn = ( ! ) r_iam_role_arn;
     identity_namespace = ( ! ) r_identity_namespace;
     redshift_idc_application_arn =
       Smaws_Lib.Xml.Parse.required "RedshiftIdcApplicationArn"
         (( ! ) r_redshift_idc_application_arn)
         i;
   }
    : modify_redshift_idc_application_message)

let lakehouse_configuration_of_xml i =
  let r_catalog_arn = ref None in
  let r_lakehouse_registration_status = ref None in
  let r_lakehouse_idc_application_arn = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CatalogArn"; "LakehouseRegistrationStatus"; "LakehouseIdcApplicationArn"; "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "CatalogArn" ->
          r_catalog_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CatalogArn" (fun i _ -> string__of_xml i) ())
      | "LakehouseRegistrationStatus" ->
          r_lakehouse_registration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseRegistrationStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "LakehouseIdcApplicationArn" ->
          r_lakehouse_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     catalog_arn = ( ! ) r_catalog_arn;
     lakehouse_registration_status = ( ! ) r_lakehouse_registration_status;
     lakehouse_idc_application_arn = ( ! ) r_lakehouse_idc_application_arn;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : lakehouse_configuration)

let lakehouse_registration_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Deregister" -> DEREGISTER
   | "Register" -> REGISTER
   | _ -> failwith "unknown enum value"
    : lakehouse_registration)

let lakehouse_idc_registration_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Disassociate" -> DISASSOCIATE
   | "Associate" -> ASSOCIATE
   | _ -> failwith "unknown enum value"
    : lakehouse_idc_registration)

let modify_lakehouse_configuration_message_of_xml i =
  let r_dry_run = ref None in
  let r_lakehouse_idc_application_arn = ref None in
  let r_lakehouse_idc_registration = ref None in
  let r_catalog_name = ref None in
  let r_lakehouse_registration = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DryRun";
      "LakehouseIdcApplicationArn";
      "LakehouseIdcRegistration";
      "CatalogName";
      "LakehouseRegistration";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "DryRun" ->
          r_dry_run :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DryRun"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "LakehouseIdcApplicationArn" ->
          r_lakehouse_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "LakehouseIdcRegistration" ->
          r_lakehouse_idc_registration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseIdcRegistration"
                 (fun i _ -> lakehouse_idc_registration_of_xml i)
                 ())
      | "CatalogName" ->
          r_catalog_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CatalogName"
                 (fun i _ -> catalog_name_string_of_xml i)
                 ())
      | "LakehouseRegistration" ->
          r_lakehouse_registration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseRegistration"
                 (fun i _ -> lakehouse_registration_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     dry_run = ( ! ) r_dry_run;
     lakehouse_idc_application_arn = ( ! ) r_lakehouse_idc_application_arn;
     lakehouse_idc_registration = ( ! ) r_lakehouse_idc_registration;
     catalog_name = ( ! ) r_catalog_name;
     lakehouse_registration = ( ! ) r_lakehouse_registration;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : modify_lakehouse_configuration_message)

let integration_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : integration_not_found_fault)

let integration_conflict_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : integration_conflict_state_fault)

let integration_conflict_operation_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : integration_conflict_operation_fault)

let integration_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : integration_already_exists_fault)

let integration_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let integration_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let integration_error_of_xml i =
  let r_error_message = ref None in
  let r_error_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ErrorMessage"; "ErrorCode" ] (fun tag _ ->
      match tag with
      | "ErrorMessage" ->
          r_error_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorMessage" (fun i _ -> string__of_xml i) ())
      | "ErrorCode" ->
          r_error_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorCode" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     error_message = ( ! ) r_error_message;
     error_code = Smaws_Lib.Xml.Parse.required "ErrorCode" (( ! ) r_error_code) i;
   }
    : integration_error)

let integration_error_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "IntegrationError" (fun i _ -> integration_error_of_xml i) ()

let description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let encryption_context_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) () in
      let v = Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> string__of_xml i) () in
      (k, v))
    ()

let integration_of_xml i =
  let r_tags = ref None in
  let r_additional_encryption_context = ref None in
  let r_kms_key_id = ref None in
  let r_description = ref None in
  let r_create_time = ref None in
  let r_errors = ref None in
  let r_status = ref None in
  let r_target_arn = ref None in
  let r_source_arn = ref None in
  let r_integration_name = ref None in
  let r_integration_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "AdditionalEncryptionContext";
      "KMSKeyId";
      "Description";
      "CreateTime";
      "Errors";
      "Status";
      "TargetArn";
      "SourceArn";
      "IntegrationName";
      "IntegrationArn";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "AdditionalEncryptionContext" ->
          r_additional_encryption_context :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdditionalEncryptionContext"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "KMSKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KMSKeyId" (fun i _ -> string__of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "CreateTime" ->
          r_create_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CreateTime" (fun i _ -> t_stamp_of_xml i) ())
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "IntegrationError"
                     (fun i _ -> integration_error_of_xml i)
                     ())
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> zero_etl_integration_status_of_xml i)
                 ())
      | "TargetArn" ->
          r_target_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetArn" (fun i _ -> target_arn_of_xml i) ())
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn" (fun i _ -> source_arn_of_xml i) ())
      | "IntegrationName" ->
          r_integration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationName"
                 (fun i _ -> integration_name_of_xml i)
                 ())
      | "IntegrationArn" ->
          r_integration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationArn"
                 (fun i _ -> integration_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     additional_encryption_context = ( ! ) r_additional_encryption_context;
     kms_key_id = ( ! ) r_kms_key_id;
     description = ( ! ) r_description;
     create_time = ( ! ) r_create_time;
     errors = ( ! ) r_errors;
     status = ( ! ) r_status;
     target_arn = ( ! ) r_target_arn;
     source_arn = ( ! ) r_source_arn;
     integration_name = ( ! ) r_integration_name;
     integration_arn = ( ! ) r_integration_arn;
   }
    : integration)

let integration_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let modify_integration_message_of_xml i =
  let r_integration_name = ref None in
  let r_description = ref None in
  let r_integration_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "IntegrationName"; "Description"; "IntegrationArn" ] (fun tag _ ->
      match tag with
      | "IntegrationName" ->
          r_integration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationName"
                 (fun i _ -> integration_name_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> integration_description_of_xml i)
                 ())
      | "IntegrationArn" ->
          r_integration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationArn"
                 (fun i _ -> integration_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     integration_name = ( ! ) r_integration_name;
     description = ( ! ) r_description;
     integration_arn = Smaws_Lib.Xml.Parse.required "IntegrationArn" (( ! ) r_integration_arn) i;
   }
    : modify_integration_message)

let invalid_subscription_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_subscription_state_fault)

let event_categories_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory" (fun i _ -> string__of_xml i) ()

let event_subscription_of_xml i =
  let r_tags = ref None in
  let r_enabled = ref None in
  let r_severity = ref None in
  let r_event_categories_list = ref None in
  let r_source_ids_list = ref None in
  let r_source_type = ref None in
  let r_subscription_creation_time = ref None in
  let r_status = ref None in
  let r_sns_topic_arn = ref None in
  let r_cust_subscription_id = ref None in
  let r_customer_aws_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "Enabled";
      "Severity";
      "EventCategoriesList";
      "SourceIdsList";
      "SourceType";
      "SubscriptionCreationTime";
      "Status";
      "SnsTopicArn";
      "CustSubscriptionId";
      "CustomerAwsId";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> boolean__of_xml i) ())
      | "Severity" ->
          r_severity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Severity" (fun i _ -> string__of_xml i) ())
      | "EventCategoriesList" ->
          r_event_categories_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategoriesList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SourceIdsList" ->
          r_source_ids_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdsList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SourceId" (fun i _ -> string__of_xml i) ())
                 ())
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | "SubscriptionCreationTime" ->
          r_subscription_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionCreationTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "SnsTopicArn" ->
          r_sns_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnsTopicArn" (fun i _ -> string__of_xml i) ())
      | "CustSubscriptionId" ->
          r_cust_subscription_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustSubscriptionId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomerAwsId" ->
          r_customer_aws_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomerAwsId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     enabled = ( ! ) r_enabled;
     severity = ( ! ) r_severity;
     event_categories_list = ( ! ) r_event_categories_list;
     source_ids_list = ( ! ) r_source_ids_list;
     source_type = ( ! ) r_source_type;
     subscription_creation_time = ( ! ) r_subscription_creation_time;
     status = ( ! ) r_status;
     sns_topic_arn = ( ! ) r_sns_topic_arn;
     cust_subscription_id = ( ! ) r_cust_subscription_id;
     customer_aws_id = ( ! ) r_customer_aws_id;
   }
    : event_subscription)

let modify_event_subscription_result_of_xml i =
  let r_event_subscription = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EventSubscription" ] (fun tag _ ->
      match tag with
      | "EventSubscription" ->
          r_event_subscription :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventSubscription"
                 (fun i _ -> event_subscription_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ event_subscription = ( ! ) r_event_subscription } : modify_event_subscription_result)

let modify_event_subscription_message_of_xml i =
  let r_enabled = ref None in
  let r_severity = ref None in
  let r_event_categories = ref None in
  let r_source_ids = ref None in
  let r_source_type = ref None in
  let r_sns_topic_arn = ref None in
  let r_subscription_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Enabled";
      "Severity";
      "EventCategories";
      "SourceIds";
      "SourceType";
      "SnsTopicArn";
      "SubscriptionName";
    ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Severity" ->
          r_severity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Severity" (fun i _ -> string__of_xml i) ())
      | "EventCategories" ->
          r_event_categories :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategories"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SourceIds" ->
          r_source_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SourceId" (fun i _ -> string__of_xml i) ())
                 ())
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | "SnsTopicArn" ->
          r_sns_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnsTopicArn" (fun i _ -> string__of_xml i) ())
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enabled = ( ! ) r_enabled;
     severity = ( ! ) r_severity;
     event_categories = ( ! ) r_event_categories;
     source_ids = ( ! ) r_source_ids;
     source_type = ( ! ) r_source_type;
     sns_topic_arn = ( ! ) r_sns_topic_arn;
     subscription_name =
       Smaws_Lib.Xml.Parse.required "SubscriptionName" (( ! ) r_subscription_name) i;
   }
    : modify_event_subscription_message)

let endpoint_access_of_xml i =
  let r_vpc_endpoint = ref None in
  let r_vpc_security_groups = ref None in
  let r_address = ref None in
  let r_port = ref None in
  let r_endpoint_create_time = ref None in
  let r_endpoint_name = ref None in
  let r_endpoint_status = ref None in
  let r_subnet_group_name = ref None in
  let r_resource_owner = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "VpcEndpoint";
      "VpcSecurityGroups";
      "Address";
      "Port";
      "EndpointCreateTime";
      "EndpointName";
      "EndpointStatus";
      "SubnetGroupName";
      "ResourceOwner";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "VpcEndpoint" ->
          r_vpc_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcEndpoint"
                 (fun i _ -> vpc_endpoint_of_xml i)
                 ())
      | "VpcSecurityGroups" ->
          r_vpc_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroup"
                     (fun i _ -> vpc_security_group_membership_of_xml i)
                     ())
                 ())
      | "Address" ->
          r_address :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Address" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | "EndpointCreateTime" ->
          r_endpoint_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "EndpointName" ->
          r_endpoint_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointName" (fun i _ -> string__of_xml i) ())
      | "EndpointStatus" ->
          r_endpoint_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SubnetGroupName" ->
          r_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ResourceOwner" ->
          r_resource_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceOwner" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     vpc_endpoint = ( ! ) r_vpc_endpoint;
     vpc_security_groups = ( ! ) r_vpc_security_groups;
     address = ( ! ) r_address;
     port = ( ! ) r_port;
     endpoint_create_time = ( ! ) r_endpoint_create_time;
     endpoint_name = ( ! ) r_endpoint_name;
     endpoint_status = ( ! ) r_endpoint_status;
     subnet_group_name = ( ! ) r_subnet_group_name;
     resource_owner = ( ! ) r_resource_owner;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : endpoint_access)

let modify_endpoint_access_message_of_xml i =
  let r_vpc_security_group_ids = ref None in
  let r_endpoint_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VpcSecurityGroupIds"; "EndpointName" ]
    (fun tag _ ->
      match tag with
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "EndpointName" ->
          r_endpoint_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     endpoint_name = Smaws_Lib.Xml.Parse.required "EndpointName" (( ! ) r_endpoint_name) i;
   }
    : modify_endpoint_access_message)

let custom_domain_association_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : custom_domain_association_not_found_fault)

let custom_cname_association_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : custom_cname_association_fault)

let custom_domain_name_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let custom_domain_certificate_arn_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let modify_custom_domain_association_result_of_xml i =
  let r_custom_domain_cert_expiry_time = ref None in
  let r_cluster_identifier = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_custom_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CustomDomainCertExpiryTime";
      "ClusterIdentifier";
      "CustomDomainCertificateArn";
      "CustomDomainName";
    ] (fun tag _ ->
      match tag with
      | "CustomDomainCertExpiryTime" ->
          r_custom_domain_cert_expiry_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertExpiryTime"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> custom_domain_certificate_arn_string_of_xml i)
                 ())
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_domain_cert_expiry_time = ( ! ) r_custom_domain_cert_expiry_time;
     cluster_identifier = ( ! ) r_cluster_identifier;
     custom_domain_certificate_arn = ( ! ) r_custom_domain_certificate_arn;
     custom_domain_name = ( ! ) r_custom_domain_name;
   }
    : modify_custom_domain_association_result)

let modify_custom_domain_association_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_custom_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "CustomDomainCertificateArn"; "CustomDomainName" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> custom_domain_certificate_arn_string_of_xml i)
                 ())
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     custom_domain_certificate_arn =
       Smaws_Lib.Xml.Parse.required "CustomDomainCertificateArn"
         (( ! ) r_custom_domain_certificate_arn)
         i;
     custom_domain_name =
       Smaws_Lib.Xml.Parse.required "CustomDomainName" (( ! ) r_custom_domain_name) i;
   }
    : modify_custom_domain_association_message)

let cluster_subnet_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_subnet_quota_exceeded_fault)

let cluster_subnet_group_of_xml i =
  let r_supported_cluster_ip_address_types = ref None in
  let r_tags = ref None in
  let r_subnets = ref None in
  let r_subnet_group_status = ref None in
  let r_vpc_id = ref None in
  let r_description = ref None in
  let r_cluster_subnet_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SupportedClusterIpAddressTypes";
      "Tags";
      "Subnets";
      "SubnetGroupStatus";
      "VpcId";
      "Description";
      "ClusterSubnetGroupName";
    ] (fun tag _ ->
      match tag with
      | "SupportedClusterIpAddressTypes" ->
          r_supported_cluster_ip_address_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedClusterIpAddressTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "item" (fun i _ -> string__of_xml i) ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Subnets" ->
          r_subnets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subnets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Subnet" (fun i _ -> subnet_of_xml i) ())
                 ())
      | "SubnetGroupStatus" ->
          r_subnet_group_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetGroupStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     supported_cluster_ip_address_types = ( ! ) r_supported_cluster_ip_address_types;
     tags = ( ! ) r_tags;
     subnets = ( ! ) r_subnets;
     subnet_group_status = ( ! ) r_subnet_group_status;
     vpc_id = ( ! ) r_vpc_id;
     description = ( ! ) r_description;
     cluster_subnet_group_name = ( ! ) r_cluster_subnet_group_name;
   }
    : cluster_subnet_group)

let modify_cluster_subnet_group_result_of_xml i =
  let r_cluster_subnet_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterSubnetGroup" ] (fun tag _ ->
      match tag with
      | "ClusterSubnetGroup" ->
          r_cluster_subnet_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroup"
                 (fun i _ -> cluster_subnet_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_subnet_group = ( ! ) r_cluster_subnet_group } : modify_cluster_subnet_group_result)

let modify_cluster_subnet_group_message_of_xml i =
  let r_subnet_ids = ref None in
  let r_description = ref None in
  let r_cluster_subnet_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SubnetIds"; "Description"; "ClusterSubnetGroupName" ] (fun tag _ ->
      match tag with
      | "SubnetIds" ->
          r_subnet_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SubnetIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subnet_ids = Smaws_Lib.Xml.Parse.required "SubnetIds" (( ! ) r_subnet_ids) i;
     description = ( ! ) r_description;
     cluster_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSubnetGroupName" (( ! ) r_cluster_subnet_group_name) i;
   }
    : modify_cluster_subnet_group_message)

let invalid_cluster_snapshot_schedule_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_cluster_snapshot_schedule_state_fault)

let modify_cluster_snapshot_schedule_message_of_xml i =
  let r_disassociate_schedule = ref None in
  let r_schedule_identifier = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DisassociateSchedule"; "ScheduleIdentifier"; "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "DisassociateSchedule" ->
          r_disassociate_schedule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisassociateSchedule"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ScheduleIdentifier" ->
          r_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     disassociate_schedule = ( ! ) r_disassociate_schedule;
     schedule_identifier = ( ! ) r_schedule_identifier;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : modify_cluster_snapshot_schedule_message)

let modify_cluster_snapshot_result_of_xml i =
  let r_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Snapshot" ] (fun tag _ ->
      match tag with
      | "Snapshot" ->
          r_snapshot :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot = ( ! ) r_snapshot } : modify_cluster_snapshot_result)

let modify_cluster_snapshot_message_of_xml i =
  let r_force = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Force"; "ManualSnapshotRetentionPeriod"; "SnapshotIdentifier" ] (fun tag _ ->
      match tag with
      | "Force" ->
          r_force :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Force" (fun i _ -> boolean__of_xml i) ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     force = ( ! ) r_force;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifier" (( ! ) r_snapshot_identifier) i;
   }
    : modify_cluster_snapshot_message)

let modify_cluster_parameter_group_message_of_xml i =
  let r_parameters = ref None in
  let r_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Parameters"; "ParameterGroupName" ] (fun tag _ ->
      match tag with
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Parameter"
                     (fun i _ -> parameter_of_xml i)
                     ())
                 ())
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameters = Smaws_Lib.Xml.Parse.required "Parameters" (( ! ) r_parameters) i;
     parameter_group_name =
       Smaws_Lib.Xml.Parse.required "ParameterGroupName" (( ! ) r_parameter_group_name) i;
   }
    : modify_cluster_parameter_group_message)

let modify_cluster_maintenance_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : modify_cluster_maintenance_result)

let modify_cluster_maintenance_message_of_xml i =
  let r_defer_maintenance_duration = ref None in
  let r_defer_maintenance_end_time = ref None in
  let r_defer_maintenance_start_time = ref None in
  let r_defer_maintenance_identifier = ref None in
  let r_defer_maintenance = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DeferMaintenanceDuration";
      "DeferMaintenanceEndTime";
      "DeferMaintenanceStartTime";
      "DeferMaintenanceIdentifier";
      "DeferMaintenance";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "DeferMaintenanceDuration" ->
          r_defer_maintenance_duration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceDuration"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DeferMaintenanceEndTime" ->
          r_defer_maintenance_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceEndTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "DeferMaintenanceStartTime" ->
          r_defer_maintenance_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceStartTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "DeferMaintenanceIdentifier" ->
          r_defer_maintenance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DeferMaintenance" ->
          r_defer_maintenance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenance"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     defer_maintenance_duration = ( ! ) r_defer_maintenance_duration;
     defer_maintenance_end_time = ( ! ) r_defer_maintenance_end_time;
     defer_maintenance_start_time = ( ! ) r_defer_maintenance_start_time;
     defer_maintenance_identifier = ( ! ) r_defer_maintenance_identifier;
     defer_maintenance = ( ! ) r_defer_maintenance;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : modify_cluster_maintenance_message)

let modify_cluster_iam_roles_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : modify_cluster_iam_roles_result)

let modify_cluster_iam_roles_message_of_xml i =
  let r_default_iam_role_arn = ref None in
  let r_remove_iam_roles = ref None in
  let r_add_iam_roles = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DefaultIamRoleArn"; "RemoveIamRoles"; "AddIamRoles"; "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "DefaultIamRoleArn" ->
          r_default_iam_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultIamRoleArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RemoveIamRoles" ->
          r_remove_iam_roles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemoveIamRoles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "IamRoleArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "AddIamRoles" ->
          r_add_iam_roles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AddIamRoles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "IamRoleArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     default_iam_role_arn = ( ! ) r_default_iam_role_arn;
     remove_iam_roles = ( ! ) r_remove_iam_roles;
     add_iam_roles = ( ! ) r_add_iam_roles;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : modify_cluster_iam_roles_message)

let cluster_on_latest_revision_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_on_latest_revision_fault)

let modify_cluster_db_revision_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : modify_cluster_db_revision_result)

let modify_cluster_db_revision_message_of_xml i =
  let r_revision_target = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RevisionTarget"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "RevisionTarget" ->
          r_revision_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevisionTarget"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     revision_target = Smaws_Lib.Xml.Parse.required "RevisionTarget" (( ! ) r_revision_target) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : modify_cluster_db_revision_message)

let modify_cluster_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : modify_cluster_result)

let modify_cluster_message_of_xml i =
  let r_extra_compute_for_automatic_optimization = ref None in
  let r_multi_a_z = ref None in
  let r_ip_address_type = ref None in
  let r_master_password_secret_kms_key_id = ref None in
  let r_manage_master_password = ref None in
  let r_port = ref None in
  let r_availability_zone = ref None in
  let r_availability_zone_relocation = ref None in
  let r_kms_key_id = ref None in
  let r_encrypted = ref None in
  let r_maintenance_track_name = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_elastic_ip = ref None in
  let r_publicly_accessible = ref None in
  let r_new_cluster_identifier = ref None in
  let r_hsm_configuration_identifier = ref None in
  let r_hsm_client_certificate_identifier = ref None in
  let r_allow_version_upgrade = ref None in
  let r_cluster_version = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_automated_snapshot_retention_period = ref None in
  let r_cluster_parameter_group_name = ref None in
  let r_master_user_password = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_cluster_security_groups = ref None in
  let r_number_of_nodes = ref None in
  let r_node_type = ref None in
  let r_cluster_type = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ExtraComputeForAutomaticOptimization";
      "MultiAZ";
      "IpAddressType";
      "MasterPasswordSecretKmsKeyId";
      "ManageMasterPassword";
      "Port";
      "AvailabilityZone";
      "AvailabilityZoneRelocation";
      "KmsKeyId";
      "Encrypted";
      "MaintenanceTrackName";
      "EnhancedVpcRouting";
      "ElasticIp";
      "PubliclyAccessible";
      "NewClusterIdentifier";
      "HsmConfigurationIdentifier";
      "HsmClientCertificateIdentifier";
      "AllowVersionUpgrade";
      "ClusterVersion";
      "PreferredMaintenanceWindow";
      "ManualSnapshotRetentionPeriod";
      "AutomatedSnapshotRetentionPeriod";
      "ClusterParameterGroupName";
      "MasterUserPassword";
      "VpcSecurityGroupIds";
      "ClusterSecurityGroups";
      "NumberOfNodes";
      "NodeType";
      "ClusterType";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "ExtraComputeForAutomaticOptimization" ->
          r_extra_compute_for_automatic_optimization :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtraComputeForAutomaticOptimization"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType" (fun i _ -> string__of_xml i) ())
      | "MasterPasswordSecretKmsKeyId" ->
          r_master_password_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ManageMasterPassword" ->
          r_manage_master_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManageMasterPassword"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AvailabilityZoneRelocation" ->
          r_availability_zone_relocation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneRelocation"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "Encrypted" ->
          r_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ElasticIp" ->
          r_elastic_ip :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticIp" (fun i _ -> string__of_xml i) ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NewClusterIdentifier" ->
          r_new_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AllowVersionUpgrade" ->
          r_allow_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "AutomatedSnapshotRetentionPeriod" ->
          r_automated_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomatedSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterParameterGroupName" ->
          r_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MasterUserPassword" ->
          r_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserPassword"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ClusterSecurityGroups" ->
          r_cluster_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroupName"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "ClusterType" ->
          r_cluster_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterType" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     extra_compute_for_automatic_optimization = ( ! ) r_extra_compute_for_automatic_optimization;
     multi_a_z = ( ! ) r_multi_a_z;
     ip_address_type = ( ! ) r_ip_address_type;
     master_password_secret_kms_key_id = ( ! ) r_master_password_secret_kms_key_id;
     manage_master_password = ( ! ) r_manage_master_password;
     port = ( ! ) r_port;
     availability_zone = ( ! ) r_availability_zone;
     availability_zone_relocation = ( ! ) r_availability_zone_relocation;
     kms_key_id = ( ! ) r_kms_key_id;
     encrypted = ( ! ) r_encrypted;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     elastic_ip = ( ! ) r_elastic_ip;
     publicly_accessible = ( ! ) r_publicly_accessible;
     new_cluster_identifier = ( ! ) r_new_cluster_identifier;
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
     allow_version_upgrade = ( ! ) r_allow_version_upgrade;
     cluster_version = ( ! ) r_cluster_version;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     automated_snapshot_retention_period = ( ! ) r_automated_snapshot_retention_period;
     cluster_parameter_group_name = ( ! ) r_cluster_parameter_group_name;
     master_user_password = ( ! ) r_master_user_password;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     cluster_security_groups = ( ! ) r_cluster_security_groups;
     number_of_nodes = ( ! ) r_number_of_nodes;
     node_type = ( ! ) r_node_type;
     cluster_type = ( ! ) r_cluster_type;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : modify_cluster_message)

let invalid_authentication_profile_request_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_authentication_profile_request_fault)

let authentication_profile_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : authentication_profile_quota_exceeded_fault)

let authentication_profile_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : authentication_profile_not_found_fault)

let authentication_profile_name_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let modify_authentication_profile_result_of_xml i =
  let r_authentication_profile_content = ref None in
  let r_authentication_profile_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AuthenticationProfileContent"; "AuthenticationProfileName" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileContent" ->
          r_authentication_profile_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileContent"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authentication_profile_content = ( ! ) r_authentication_profile_content;
     authentication_profile_name = ( ! ) r_authentication_profile_name;
   }
    : modify_authentication_profile_result)

let modify_authentication_profile_message_of_xml i =
  let r_authentication_profile_content = ref None in
  let r_authentication_profile_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AuthenticationProfileContent"; "AuthenticationProfileName" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileContent" ->
          r_authentication_profile_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileContent"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authentication_profile_content =
       Smaws_Lib.Xml.Parse.required "AuthenticationProfileContent"
         (( ! ) r_authentication_profile_content)
         i;
     authentication_profile_name =
       Smaws_Lib.Xml.Parse.required "AuthenticationProfileName"
         (( ! ) r_authentication_profile_name)
         i;
   }
    : modify_authentication_profile_message)

let modify_aqua_output_message_of_xml i =
  let r_aqua_configuration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AquaConfiguration" ] (fun tag _ ->
      match tag with
      | "AquaConfiguration" ->
          r_aqua_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaConfiguration"
                 (fun i _ -> aqua_configuration_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ aqua_configuration = ( ! ) r_aqua_configuration } : modify_aqua_output_message)

let modify_aqua_input_message_of_xml i =
  let r_aqua_configuration_status = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AquaConfigurationStatus"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "AquaConfigurationStatus" ->
          r_aqua_configuration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaConfigurationStatus"
                 (fun i _ -> aqua_configuration_status_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     aqua_configuration_status = ( ! ) r_aqua_configuration_status;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : modify_aqua_input_message)

let impact_ranking_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "LOW" -> LOW
   | "MEDIUM" -> MEDIUM
   | "HIGH" -> HIGH
   | _ -> failwith "unknown enum value"
    : impact_ranking_type)

let recommended_action_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "CLI" -> CLI | "SQL" -> SQL | _ -> failwith "unknown enum value"
    : recommended_action_type)

let recommended_action_of_xml i =
  let r_type_ = ref None in
  let r_command = ref None in
  let r_database = ref None in
  let r_text = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Type"; "Command"; "Database"; "Text" ]
    (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> recommended_action_type_of_xml i)
                 ())
      | "Command" ->
          r_command :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Command" (fun i _ -> string__of_xml i) ())
      | "Database" ->
          r_database :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Database" (fun i _ -> string__of_xml i) ())
      | "Text" ->
          r_text :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Text" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     command = ( ! ) r_command;
     database = ( ! ) r_database;
     text = ( ! ) r_text;
   }
    : recommended_action)

let recommended_action_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "RecommendedAction"
    (fun i _ -> recommended_action_of_xml i)
    ()

let recommendation_of_xml i =
  let r_reference_links = ref None in
  let r_recommended_actions = ref None in
  let r_recommendation_text = ref None in
  let r_impact_ranking = ref None in
  let r_observation = ref None in
  let r_description = ref None in
  let r_title = ref None in
  let r_recommendation_type = ref None in
  let r_created_at = ref None in
  let r_namespace_arn = ref None in
  let r_cluster_identifier = ref None in
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReferenceLinks";
      "RecommendedActions";
      "RecommendationText";
      "ImpactRanking";
      "Observation";
      "Description";
      "Title";
      "RecommendationType";
      "CreatedAt";
      "NamespaceArn";
      "ClusterIdentifier";
      "Id";
    ] (fun tag _ ->
      match tag with
      | "ReferenceLinks" ->
          r_reference_links :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReferenceLinks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReferenceLink"
                     (fun i _ -> reference_link_of_xml i)
                     ())
                 ())
      | "RecommendedActions" ->
          r_recommended_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecommendedActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "RecommendedAction"
                     (fun i _ -> recommended_action_of_xml i)
                     ())
                 ())
      | "RecommendationText" ->
          r_recommendation_text :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecommendationText"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ImpactRanking" ->
          r_impact_ranking :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImpactRanking"
                 (fun i _ -> impact_ranking_type_of_xml i)
                 ())
      | "Observation" ->
          r_observation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Observation" (fun i _ -> string__of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "Title" ->
          r_title :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Title" (fun i _ -> string__of_xml i) ())
      | "RecommendationType" ->
          r_recommendation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecommendationType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CreatedAt" ->
          r_created_at :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedAt" (fun i _ -> t_stamp_of_xml i) ())
      | "NamespaceArn" ->
          r_namespace_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NamespaceArn" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Id" ->
          r_id := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reference_links = ( ! ) r_reference_links;
     recommended_actions = ( ! ) r_recommended_actions;
     recommendation_text = ( ! ) r_recommendation_text;
     impact_ranking = ( ! ) r_impact_ranking;
     observation = ( ! ) r_observation;
     description = ( ! ) r_description;
     title = ( ! ) r_title;
     recommendation_type = ( ! ) r_recommendation_type;
     created_at = ( ! ) r_created_at;
     namespace_arn = ( ! ) r_namespace_arn;
     cluster_identifier = ( ! ) r_cluster_identifier;
     id = ( ! ) r_id;
   }
    : recommendation)

let recommendation_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Recommendation" (fun i _ -> recommendation_of_xml i) ()

let list_recommendations_result_of_xml i =
  let r_marker = ref None in
  let r_recommendations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "Recommendations" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "Recommendations" ->
          r_recommendations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Recommendations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Recommendation"
                     (fun i _ -> recommendation_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; recommendations = ( ! ) r_recommendations }
    : list_recommendations_result)

let list_recommendations_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_namespace_arn = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "NamespaceArn"; "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "NamespaceArn" ->
          r_namespace_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NamespaceArn" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     namespace_arn = ( ! ) r_namespace_arn;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : list_recommendations_message)

let get_resource_policy_result_of_xml i =
  let r_resource_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourcePolicy" ] (fun tag _ ->
      match tag with
      | "ResourcePolicy" ->
          r_resource_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcePolicy"
                 (fun i _ -> resource_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_policy = ( ! ) r_resource_policy } : get_resource_policy_result)

let get_resource_policy_message_of_xml i =
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArn" ] (fun tag _ ->
      match tag with
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i }
    : get_resource_policy_message)

let get_reserved_node_exchange_offerings_output_message_of_xml i =
  let r_reserved_node_offerings = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedNodeOfferings"; "Marker" ] (fun tag _ ->
      match tag with
      | "ReservedNodeOfferings" ->
          r_reserved_node_offerings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeOffering"
                     (fun i _ -> reserved_node_offering_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ reserved_node_offerings = ( ! ) r_reserved_node_offerings; marker = ( ! ) r_marker }
    : get_reserved_node_exchange_offerings_output_message)

let get_reserved_node_exchange_offerings_input_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_reserved_node_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaxRecords"; "ReservedNodeId" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     reserved_node_id = Smaws_Lib.Xml.Parse.required "ReservedNodeId" (( ! ) r_reserved_node_id) i;
   }
    : get_reserved_node_exchange_offerings_input_message)

let get_reserved_node_exchange_configuration_options_output_message_of_xml i =
  let r_reserved_node_configuration_option_list = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedNodeConfigurationOptionList"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ReservedNodeConfigurationOptionList" ->
          r_reserved_node_configuration_option_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeConfigurationOptionList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeConfigurationOption"
                     (fun i _ -> reserved_node_configuration_option_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_node_configuration_option_list = ( ! ) r_reserved_node_configuration_option_list;
     marker = ( ! ) r_marker;
   }
    : get_reserved_node_exchange_configuration_options_output_message)

let get_reserved_node_exchange_configuration_options_input_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_snapshot_identifier = ref None in
  let r_cluster_identifier = ref None in
  let r_action_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "SnapshotIdentifier"; "ClusterIdentifier"; "ActionType" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ActionType" ->
          r_action_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionType"
                 (fun i _ -> reserved_node_exchange_action_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     cluster_identifier = ( ! ) r_cluster_identifier;
     action_type = Smaws_Lib.Xml.Parse.required "ActionType" (( ! ) r_action_type) i;
   }
    : get_reserved_node_exchange_configuration_options_input_message)

let redshift_invalid_parameter_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : redshift_invalid_parameter_fault)

let get_identity_center_auth_token_response_of_xml i =
  let r_expiration_time = ref None in
  let r_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ExpirationTime"; "Token" ] (fun tag _ ->
      match tag with
      | "ExpirationTime" ->
          r_expiration_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpirationTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Token" ->
          r_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Token"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ expiration_time = ( ! ) r_expiration_time; token = ( ! ) r_token }
    : get_identity_center_auth_token_response)

let cluster_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterIdentifier" (fun i _ -> string__of_xml i) ()

let get_identity_center_auth_token_request_of_xml i =
  let r_cluster_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIds" ] (fun tag _ ->
      match tag with
      | "ClusterIds" ->
          r_cluster_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_ids = Smaws_Lib.Xml.Parse.required "ClusterIds" (( ! ) r_cluster_ids) i }
    : get_identity_center_auth_token_request)

let cluster_extended_credentials_of_xml i =
  let r_next_refresh_time = ref None in
  let r_expiration = ref None in
  let r_db_password = ref None in
  let r_db_user = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NextRefreshTime"; "Expiration"; "DbPassword"; "DbUser" ] (fun tag _ ->
      match tag with
      | "NextRefreshTime" ->
          r_next_refresh_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextRefreshTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Expiration" ->
          r_expiration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Expiration" (fun i _ -> t_stamp_of_xml i) ())
      | "DbPassword" ->
          r_db_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbPassword"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | "DbUser" ->
          r_db_user :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DbUser" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_refresh_time = ( ! ) r_next_refresh_time;
     expiration = ( ! ) r_expiration;
     db_password = ( ! ) r_db_password;
     db_user = ( ! ) r_db_user;
   }
    : cluster_extended_credentials)

let get_cluster_credentials_with_iam_message_of_xml i =
  let r_custom_domain_name = ref None in
  let r_duration_seconds = ref None in
  let r_cluster_identifier = ref None in
  let r_db_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CustomDomainName"; "DurationSeconds"; "ClusterIdentifier"; "DbName" ] (fun tag _ ->
      match tag with
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DbName" ->
          r_db_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DbName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_domain_name = ( ! ) r_custom_domain_name;
     duration_seconds = ( ! ) r_duration_seconds;
     cluster_identifier = ( ! ) r_cluster_identifier;
     db_name = ( ! ) r_db_name;
   }
    : get_cluster_credentials_with_iam_message)

let cluster_credentials_of_xml i =
  let r_expiration = ref None in
  let r_db_password = ref None in
  let r_db_user = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Expiration"; "DbPassword"; "DbUser" ]
    (fun tag _ ->
      match tag with
      | "Expiration" ->
          r_expiration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Expiration" (fun i _ -> t_stamp_of_xml i) ())
      | "DbPassword" ->
          r_db_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbPassword"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | "DbUser" ->
          r_db_user :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DbUser" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ expiration = ( ! ) r_expiration; db_password = ( ! ) r_db_password; db_user = ( ! ) r_db_user }
    : cluster_credentials)

let db_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DbGroup" (fun i _ -> string__of_xml i) ()

let get_cluster_credentials_message_of_xml i =
  let r_custom_domain_name = ref None in
  let r_db_groups = ref None in
  let r_auto_create = ref None in
  let r_duration_seconds = ref None in
  let r_cluster_identifier = ref None in
  let r_db_name = ref None in
  let r_db_user = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CustomDomainName";
      "DbGroups";
      "AutoCreate";
      "DurationSeconds";
      "ClusterIdentifier";
      "DbName";
      "DbUser";
    ] (fun tag _ ->
      match tag with
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DbGroups" ->
          r_db_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DbGroup" (fun i _ -> string__of_xml i) ())
                 ())
      | "AutoCreate" ->
          r_auto_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoCreate"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DbName" ->
          r_db_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DbName" (fun i _ -> string__of_xml i) ())
      | "DbUser" ->
          r_db_user :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DbUser" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_domain_name = ( ! ) r_custom_domain_name;
     db_groups = ( ! ) r_db_groups;
     auto_create = ( ! ) r_auto_create;
     duration_seconds = ( ! ) r_duration_seconds;
     cluster_identifier = ( ! ) r_cluster_identifier;
     db_name = ( ! ) r_db_name;
     db_user = Smaws_Lib.Xml.Parse.required "DbUser" (( ! ) r_db_user) i;
   }
    : get_cluster_credentials_message)

let failover_primary_compute_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : failover_primary_compute_result)

let failover_primary_compute_input_message_of_xml i =
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : failover_primary_compute_input_message)

let incompatible_orderable_options_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : incompatible_orderable_options)

let copy_to_region_disabled_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : copy_to_region_disabled_fault)

let enable_snapshot_copy_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : enable_snapshot_copy_result)

let enable_snapshot_copy_message_of_xml i =
  let r_manual_snapshot_retention_period = ref None in
  let r_snapshot_copy_grant_name = ref None in
  let r_retention_period = ref None in
  let r_destination_region = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ManualSnapshotRetentionPeriod";
      "SnapshotCopyGrantName";
      "RetentionPeriod";
      "DestinationRegion";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotCopyGrantName" ->
          r_snapshot_copy_grant_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrantName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RetentionPeriod" ->
          r_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DestinationRegion" ->
          r_destination_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     snapshot_copy_grant_name = ( ! ) r_snapshot_copy_grant_name;
     retention_period = ( ! ) r_retention_period;
     destination_region =
       Smaws_Lib.Xml.Parse.required "DestinationRegion" (( ! ) r_destination_region) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : enable_snapshot_copy_message)

let invalid_s3_key_prefix_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_s3_key_prefix_fault)

let invalid_s3_bucket_name_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_s3_bucket_name_fault)

let insufficient_s3_bucket_policy_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : insufficient_s3_bucket_policy_fault)

let bucket_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : bucket_not_found_fault)

let log_destination_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "cloudwatch" -> CLOUDWATCH | "s3" -> S3 | _ -> failwith "unknown enum value"
    : log_destination_type)

let log_type_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let logging_status_of_xml i =
  let r_log_exports = ref None in
  let r_log_destination_type = ref None in
  let r_last_failure_message = ref None in
  let r_last_failure_time = ref None in
  let r_last_successful_delivery_time = ref None in
  let r_s3_key_prefix = ref None in
  let r_bucket_name = ref None in
  let r_logging_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LogExports";
      "LogDestinationType";
      "LastFailureMessage";
      "LastFailureTime";
      "LastSuccessfulDeliveryTime";
      "S3KeyPrefix";
      "BucketName";
      "LoggingEnabled";
    ] (fun tag _ ->
      match tag with
      | "LogExports" ->
          r_log_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "LogDestinationType" ->
          r_log_destination_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDestinationType"
                 (fun i _ -> log_destination_type_of_xml i)
                 ())
      | "LastFailureMessage" ->
          r_last_failure_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastFailureMessage"
                 (fun i _ -> string__of_xml i)
                 ())
      | "LastFailureTime" ->
          r_last_failure_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastFailureTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "LastSuccessfulDeliveryTime" ->
          r_last_successful_delivery_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastSuccessfulDeliveryTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "S3KeyPrefix" ->
          r_s3_key_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "S3KeyPrefix"
                 (fun i _ -> s3_key_prefix_value_of_xml i)
                 ())
      | "BucketName" ->
          r_bucket_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "BucketName" (fun i _ -> string__of_xml i) ())
      | "LoggingEnabled" ->
          r_logging_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoggingEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     log_exports = ( ! ) r_log_exports;
     log_destination_type = ( ! ) r_log_destination_type;
     last_failure_message = ( ! ) r_last_failure_message;
     last_failure_time = ( ! ) r_last_failure_time;
     last_successful_delivery_time = ( ! ) r_last_successful_delivery_time;
     s3_key_prefix = ( ! ) r_s3_key_prefix;
     bucket_name = ( ! ) r_bucket_name;
     logging_enabled = ( ! ) r_logging_enabled;
   }
    : logging_status)

let enable_logging_message_of_xml i =
  let r_log_exports = ref None in
  let r_log_destination_type = ref None in
  let r_s3_key_prefix = ref None in
  let r_bucket_name = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LogExports"; "LogDestinationType"; "S3KeyPrefix"; "BucketName"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "LogExports" ->
          r_log_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "LogDestinationType" ->
          r_log_destination_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDestinationType"
                 (fun i _ -> log_destination_type_of_xml i)
                 ())
      | "S3KeyPrefix" ->
          r_s3_key_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "S3KeyPrefix"
                 (fun i _ -> s3_key_prefix_value_of_xml i)
                 ())
      | "BucketName" ->
          r_bucket_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "BucketName" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     log_exports = ( ! ) r_log_exports;
     log_destination_type = ( ! ) r_log_destination_type;
     s3_key_prefix = ( ! ) r_s3_key_prefix;
     bucket_name = ( ! ) r_bucket_name;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : enable_logging_message)

let disassociate_data_share_consumer_message_of_xml i =
  let r_consumer_region = ref None in
  let r_consumer_arn = ref None in
  let r_disassociate_entire_account = ref None in
  let r_data_share_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ConsumerRegion"; "ConsumerArn"; "DisassociateEntireAccount"; "DataShareArn" ] (fun tag _ ->
      match tag with
      | "ConsumerRegion" ->
          r_consumer_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ConsumerArn" ->
          r_consumer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerArn" (fun i _ -> string__of_xml i) ())
      | "DisassociateEntireAccount" ->
          r_disassociate_entire_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisassociateEntireAccount"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     consumer_region = ( ! ) r_consumer_region;
     consumer_arn = ( ! ) r_consumer_arn;
     disassociate_entire_account = ( ! ) r_disassociate_entire_account;
     data_share_arn = Smaws_Lib.Xml.Parse.required "DataShareArn" (( ! ) r_data_share_arn) i;
   }
    : disassociate_data_share_consumer_message)

let disable_snapshot_copy_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : disable_snapshot_copy_result)

let disable_snapshot_copy_message_of_xml i =
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : disable_snapshot_copy_message)

let disable_logging_message_of_xml i =
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : disable_logging_message)

let describe_usage_limits_message_of_xml i =
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_feature_type = ref None in
  let r_cluster_identifier = ref None in
  let r_usage_limit_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TagValues";
      "TagKeys";
      "Marker";
      "MaxRecords";
      "FeatureType";
      "ClusterIdentifier";
      "UsageLimitId";
    ] (fun tag _ ->
      match tag with
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "FeatureType" ->
          r_feature_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FeatureType"
                 (fun i _ -> usage_limit_feature_type_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "UsageLimitId" ->
          r_usage_limit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsageLimitId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     feature_type = ( ! ) r_feature_type;
     cluster_identifier = ( ! ) r_cluster_identifier;
     usage_limit_id = ( ! ) r_usage_limit_id;
   }
    : describe_usage_limits_message)

let describe_tags_message_of_xml i =
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_resource_type = ref None in
  let r_resource_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TagValues"; "TagKeys"; "Marker"; "MaxRecords"; "ResourceType"; "ResourceName" ] (fun tag _ ->
      match tag with
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType" (fun i _ -> string__of_xml i) ())
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     resource_type = ( ! ) r_resource_type;
     resource_name = ( ! ) r_resource_name;
   }
    : describe_tags_message)

let describe_table_restore_status_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_table_restore_request_id = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "TableRestoreRequestId"; "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "TableRestoreRequestId" ->
          r_table_restore_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TableRestoreRequestId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     table_restore_request_id = ( ! ) r_table_restore_request_id;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : describe_table_restore_status_message)

let customer_storage_message_of_xml i =
  let r_total_provisioned_storage_in_mega_bytes = ref None in
  let r_total_backup_size_in_mega_bytes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TotalProvisionedStorageInMegaBytes"; "TotalBackupSizeInMegaBytes" ] (fun tag _ ->
      match tag with
      | "TotalProvisionedStorageInMegaBytes" ->
          r_total_provisioned_storage_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalProvisionedStorageInMegaBytes"
                 (fun i _ -> double_of_xml i)
                 ())
      | "TotalBackupSizeInMegaBytes" ->
          r_total_backup_size_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalBackupSizeInMegaBytes"
                 (fun i _ -> double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     total_provisioned_storage_in_mega_bytes = ( ! ) r_total_provisioned_storage_in_mega_bytes;
     total_backup_size_in_mega_bytes = ( ! ) r_total_backup_size_in_mega_bytes;
   }
    : customer_storage_message)

let describe_snapshot_schedules_output_message_of_xml i =
  let r_marker = ref None in
  let r_snapshot_schedules = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "SnapshotSchedules" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "SnapshotSchedules" ->
          r_snapshot_schedules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotSchedules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotSchedule"
                     (fun i _ -> snapshot_schedule_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; snapshot_schedules = ( ! ) r_snapshot_schedules }
    : describe_snapshot_schedules_output_message)

let describe_snapshot_schedules_message_of_xml i =
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_schedule_identifier = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxRecords"; "Marker"; "TagValues"; "TagKeys"; "ScheduleIdentifier"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "ScheduleIdentifier" ->
          r_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     schedule_identifier = ( ! ) r_schedule_identifier;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : describe_snapshot_schedules_message)

let describe_snapshot_copy_grants_message_of_xml i =
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_snapshot_copy_grant_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TagValues"; "TagKeys"; "Marker"; "MaxRecords"; "SnapshotCopyGrantName" ] (fun tag _ ->
      match tag with
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotCopyGrantName" ->
          r_snapshot_copy_grant_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrantName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     snapshot_copy_grant_name = ( ! ) r_snapshot_copy_grant_name;
   }
    : describe_snapshot_copy_grants_message)

let describe_scheduled_actions_message_of_xml i =
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_filters = ref None in
  let r_active = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_target_action_type = ref None in
  let r_scheduled_action_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MaxRecords";
      "Marker";
      "Filters";
      "Active";
      "EndTime";
      "StartTime";
      "TargetActionType";
      "ScheduledActionName";
    ] (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledActionFilter"
                     (fun i _ -> scheduled_action_filter_of_xml i)
                     ())
                 ())
      | "Active" ->
          r_active :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Active"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "TargetActionType" ->
          r_target_action_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetActionType"
                 (fun i _ -> scheduled_action_type_values_of_xml i)
                 ())
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     filters = ( ! ) r_filters;
     active = ( ! ) r_active;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     target_action_type = ( ! ) r_target_action_type;
     scheduled_action_name = ( ! ) r_scheduled_action_name;
   }
    : describe_scheduled_actions_message)

let describe_resize_message_of_xml i =
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : describe_resize_message)

let describe_reserved_nodes_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_reserved_node_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaxRecords"; "ReservedNodeId" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     reserved_node_id = ( ! ) r_reserved_node_id;
   }
    : describe_reserved_nodes_message)

let describe_reserved_node_offerings_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_reserved_node_offering_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaxRecords"; "ReservedNodeOfferingId" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ReservedNodeOfferingId" ->
          r_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     reserved_node_offering_id = ( ! ) r_reserved_node_offering_id;
   }
    : describe_reserved_node_offerings_message)

let describe_reserved_node_exchange_status_output_message_of_xml i =
  let r_marker = ref None in
  let r_reserved_node_exchange_status_details = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ReservedNodeExchangeStatusDetails" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ReservedNodeExchangeStatusDetails" ->
          r_reserved_node_exchange_status_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeExchangeStatusDetails"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeExchangeStatus"
                     (fun i _ -> reserved_node_exchange_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     reserved_node_exchange_status_details = ( ! ) r_reserved_node_exchange_status_details;
   }
    : describe_reserved_node_exchange_status_output_message)

let describe_reserved_node_exchange_status_input_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_reserved_node_exchange_request_id = ref None in
  let r_reserved_node_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "ReservedNodeExchangeRequestId"; "ReservedNodeId" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ReservedNodeExchangeRequestId" ->
          r_reserved_node_exchange_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeExchangeRequestId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     reserved_node_exchange_request_id = ( ! ) r_reserved_node_exchange_request_id;
     reserved_node_id = ( ! ) r_reserved_node_id;
   }
    : describe_reserved_node_exchange_status_input_message)

let redshift_idc_application_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> redshift_idc_application_of_xml i) ()

let describe_redshift_idc_applications_result_of_xml i =
  let r_marker = ref None in
  let r_redshift_idc_applications = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "RedshiftIdcApplications" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "RedshiftIdcApplications" ->
          r_redshift_idc_applications :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplications"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> redshift_idc_application_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; redshift_idc_applications = ( ! ) r_redshift_idc_applications }
    : describe_redshift_idc_applications_result)

let describe_redshift_idc_applications_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_redshift_idc_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "RedshiftIdcApplicationArn" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "RedshiftIdcApplicationArn" ->
          r_redshift_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     redshift_idc_application_arn = ( ! ) r_redshift_idc_application_arn;
   }
    : describe_redshift_idc_applications_message)

let partner_integration_info_of_xml i =
  let r_updated_at = ref None in
  let r_created_at = ref None in
  let r_status_message = ref None in
  let r_status = ref None in
  let r_partner_name = ref None in
  let r_database_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UpdatedAt"; "CreatedAt"; "StatusMessage"; "Status"; "PartnerName"; "DatabaseName" ]
    (fun tag _ ->
      match tag with
      | "UpdatedAt" ->
          r_updated_at :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UpdatedAt" (fun i _ -> t_stamp_of_xml i) ())
      | "CreatedAt" ->
          r_created_at :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedAt" (fun i _ -> t_stamp_of_xml i) ())
      | "StatusMessage" ->
          r_status_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusMessage"
                 (fun i _ -> partner_integration_status_message_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> partner_integration_status_of_xml i)
                 ())
      | "PartnerName" ->
          r_partner_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PartnerName"
                 (fun i _ -> partner_integration_partner_name_of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName"
                 (fun i _ -> partner_integration_database_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     updated_at = ( ! ) r_updated_at;
     created_at = ( ! ) r_created_at;
     status_message = ( ! ) r_status_message;
     status = ( ! ) r_status;
     partner_name = ( ! ) r_partner_name;
     database_name = ( ! ) r_database_name;
   }
    : partner_integration_info)

let partner_integration_info_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "PartnerIntegrationInfo"
    (fun i _ -> partner_integration_info_of_xml i)
    ()

let describe_partners_output_message_of_xml i =
  let r_partner_integration_info_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PartnerIntegrationInfoList" ] (fun tag _ ->
      match tag with
      | "PartnerIntegrationInfoList" ->
          r_partner_integration_info_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PartnerIntegrationInfoList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "PartnerIntegrationInfo"
                     (fun i _ -> partner_integration_info_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ partner_integration_info_list = ( ! ) r_partner_integration_info_list }
    : describe_partners_output_message)

let describe_partners_input_message_of_xml i =
  let r_partner_name = ref None in
  let r_database_name = ref None in
  let r_cluster_identifier = ref None in
  let r_account_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PartnerName"; "DatabaseName"; "ClusterIdentifier"; "AccountId" ] (fun tag _ ->
      match tag with
      | "PartnerName" ->
          r_partner_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PartnerName"
                 (fun i _ -> partner_integration_partner_name_of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName"
                 (fun i _ -> partner_integration_database_name_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> partner_integration_cluster_identifier_of_xml i)
                 ())
      | "AccountId" ->
          r_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId"
                 (fun i _ -> partner_integration_account_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     partner_name = ( ! ) r_partner_name;
     database_name = ( ! ) r_database_name;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     account_id = Smaws_Lib.Xml.Parse.required "AccountId" (( ! ) r_account_id) i;
   }
    : describe_partners_input_message)

let availability_zone_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone" (fun i _ -> availability_zone_of_xml i) ()

let orderable_cluster_option_of_xml i =
  let r_availability_zones = ref None in
  let r_node_type = ref None in
  let r_cluster_type = ref None in
  let r_cluster_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AvailabilityZones"; "NodeType"; "ClusterType"; "ClusterVersion" ] (fun tag _ ->
      match tag with
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "ClusterType" ->
          r_cluster_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterType" (fun i _ -> string__of_xml i) ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     availability_zones = ( ! ) r_availability_zones;
     node_type = ( ! ) r_node_type;
     cluster_type = ( ! ) r_cluster_type;
     cluster_version = ( ! ) r_cluster_version;
   }
    : orderable_cluster_option)

let orderable_cluster_options_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "OrderableClusterOption"
    (fun i _ -> orderable_cluster_option_of_xml i)
    ()

let orderable_cluster_options_message_of_xml i =
  let r_marker = ref None in
  let r_orderable_cluster_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "OrderableClusterOptions" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "OrderableClusterOptions" ->
          r_orderable_cluster_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrderableClusterOptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "OrderableClusterOption"
                     (fun i _ -> orderable_cluster_option_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; orderable_cluster_options = ( ! ) r_orderable_cluster_options }
    : orderable_cluster_options_message)

let describe_orderable_cluster_options_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_node_type = ref None in
  let r_cluster_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "NodeType"; "ClusterVersion" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     node_type = ( ! ) r_node_type;
     cluster_version = ( ! ) r_cluster_version;
   }
    : describe_orderable_cluster_options_message)

let mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "high-performance" -> HIGH_PERFORMANCE
   | "standard" -> STANDARD
   | _ -> failwith "unknown enum value"
    : mode)

let node_configuration_option_of_xml i =
  let r_mode = ref None in
  let r_estimated_disk_utilization_percent = ref None in
  let r_number_of_nodes = ref None in
  let r_node_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Mode"; "EstimatedDiskUtilizationPercent"; "NumberOfNodes"; "NodeType" ] (fun tag _ ->
      match tag with
      | "Mode" ->
          r_mode := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Mode" (fun i _ -> mode_of_xml i) ())
      | "EstimatedDiskUtilizationPercent" ->
          r_estimated_disk_utilization_percent :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedDiskUtilizationPercent"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes" (fun i _ -> integer_of_xml i) ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     mode = ( ! ) r_mode;
     estimated_disk_utilization_percent = ( ! ) r_estimated_disk_utilization_percent;
     number_of_nodes = ( ! ) r_number_of_nodes;
     node_type = ( ! ) r_node_type;
   }
    : node_configuration_option)

let node_configuration_option_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeConfigurationOption"
    (fun i _ -> node_configuration_option_of_xml i)
    ()

let node_configuration_options_message_of_xml i =
  let r_marker = ref None in
  let r_node_configuration_option_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "NodeConfigurationOptionList" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "NodeConfigurationOptionList" ->
          r_node_configuration_option_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeConfigurationOptionList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeConfigurationOption"
                     (fun i _ -> node_configuration_option_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     node_configuration_option_list = ( ! ) r_node_configuration_option_list;
   }
    : node_configuration_options_message)

let action_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "resize-cluster" -> RESIZE_CLUSTER
   | "recommend-node-config" -> RECOMMEND_NODE_CONFIG
   | "restore-cluster" -> RESTORE_CLUSTER
   | _ -> failwith "unknown enum value"
    : action_type)

let node_configuration_options_filter_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Mode" -> MODE
   | "EstimatedDiskUtilizationPercent" -> ESTIMATED_DISK_UTILIZATION_PERCENT
   | "NumberOfNodes" -> NUM_NODES
   | "NodeType" -> NODE_TYPE
   | _ -> failwith "unknown enum value"
    : node_configuration_options_filter_name)

let operator_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "between" -> BETWEEN
   | "in" -> IN
   | "ge" -> GE
   | "le" -> LE
   | "gt" -> GT
   | "lt" -> LT
   | "eq" -> EQ
   | _ -> failwith "unknown enum value"
    : operator_type)

let node_configuration_options_filter_of_xml i =
  let r_values = ref None in
  let r_operator = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Operator"; "Name" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "item" (fun i _ -> string__of_xml i) ())
                 ())
      | "Operator" ->
          r_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Operator"
                 (fun i _ -> operator_type_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> node_configuration_options_filter_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ values = ( ! ) r_values; operator = ( ! ) r_operator; name = ( ! ) r_name }
    : node_configuration_options_filter)

let node_configuration_options_filter_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeConfigurationOptionsFilter"
    (fun i _ -> node_configuration_options_filter_of_xml i)
    ()

let describe_node_configuration_options_message_of_xml i =
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_filters = ref None in
  let r_owner_account = ref None in
  let r_snapshot_arn = ref None in
  let r_snapshot_identifier = ref None in
  let r_cluster_identifier = ref None in
  let r_action_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MaxRecords";
      "Marker";
      "Filter";
      "OwnerAccount";
      "SnapshotArn";
      "SnapshotIdentifier";
      "ClusterIdentifier";
      "ActionType";
    ] (fun tag _ ->
      match tag with
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "Filter" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filter"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeConfigurationOptionsFilter"
                     (fun i _ -> node_configuration_options_filter_of_xml i)
                     ())
                 ())
      | "OwnerAccount" ->
          r_owner_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerAccount" (fun i _ -> string__of_xml i) ())
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ActionType" ->
          r_action_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionType"
                 (fun i _ -> action_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     filters = ( ! ) r_filters;
     owner_account = ( ! ) r_owner_account;
     snapshot_arn = ( ! ) r_snapshot_arn;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     cluster_identifier = ( ! ) r_cluster_identifier;
     action_type = Smaws_Lib.Xml.Parse.required "ActionType" (( ! ) r_action_type) i;
   }
    : describe_node_configuration_options_message)

let describe_logging_status_message_of_xml i =
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : describe_logging_status_message)

let integration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Integration" (fun i _ -> integration_of_xml i) ()

let integrations_message_of_xml i =
  let r_integrations = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Integrations"; "Marker" ] (fun tag _ ->
      match tag with
      | "Integrations" ->
          r_integrations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Integrations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Integration"
                     (fun i _ -> integration_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ integrations = ( ! ) r_integrations; marker = ( ! ) r_marker } : integrations_message)

let describe_integrations_filter_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "status" -> STATUS
   | "source-types" -> SOURCE_TYPES
   | "source-arn" -> SOURCE_ARN
   | "integration-arn" -> INTEGRATION_ARN
   | _ -> failwith "unknown enum value"
    : describe_integrations_filter_name)

let describe_integrations_filter_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Value" (fun i _ -> string__of_xml i) ()

let describe_integrations_filter_of_xml i =
  let r_values = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values"; "Name" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Value" (fun i _ -> string__of_xml i) ())
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> describe_integrations_filter_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     values = Smaws_Lib.Xml.Parse.required "Values" (( ! ) r_values) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : describe_integrations_filter)

let describe_integrations_filter_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DescribeIntegrationsFilter"
    (fun i _ -> describe_integrations_filter_of_xml i)
    ()

let describe_integrations_message_of_xml i =
  let r_filters = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_integration_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Filters"; "Marker"; "MaxRecords"; "IntegrationArn" ] (fun tag _ ->
      match tag with
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DescribeIntegrationsFilter"
                     (fun i _ -> describe_integrations_filter_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "IntegrationArn" ->
          r_integration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationArn"
                 (fun i _ -> integration_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     filters = ( ! ) r_filters;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     integration_arn = ( ! ) r_integration_arn;
   }
    : describe_integrations_message)

let inbound_integration_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let inbound_integration_of_xml i =
  let r_create_time = ref None in
  let r_errors = ref None in
  let r_status = ref None in
  let r_target_arn = ref None in
  let r_source_arn = ref None in
  let r_integration_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CreateTime"; "Errors"; "Status"; "TargetArn"; "SourceArn"; "IntegrationArn" ] (fun tag _ ->
      match tag with
      | "CreateTime" ->
          r_create_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CreateTime" (fun i _ -> t_stamp_of_xml i) ())
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "IntegrationError"
                     (fun i _ -> integration_error_of_xml i)
                     ())
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> zero_etl_integration_status_of_xml i)
                 ())
      | "TargetArn" ->
          r_target_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetArn" (fun i _ -> target_arn_of_xml i) ())
      | "SourceArn" ->
          r_source_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn" (fun i _ -> string__of_xml i) ())
      | "IntegrationArn" ->
          r_integration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationArn"
                 (fun i _ -> inbound_integration_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     create_time = ( ! ) r_create_time;
     errors = ( ! ) r_errors;
     status = ( ! ) r_status;
     target_arn = ( ! ) r_target_arn;
     source_arn = ( ! ) r_source_arn;
     integration_arn = ( ! ) r_integration_arn;
   }
    : inbound_integration)

let inbound_integration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "InboundIntegration"
    (fun i _ -> inbound_integration_of_xml i)
    ()

let inbound_integrations_message_of_xml i =
  let r_inbound_integrations = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InboundIntegrations"; "Marker" ] (fun tag _ ->
      match tag with
      | "InboundIntegrations" ->
          r_inbound_integrations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InboundIntegrations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "InboundIntegration"
                     (fun i _ -> inbound_integration_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ inbound_integrations = ( ! ) r_inbound_integrations; marker = ( ! ) r_marker }
    : inbound_integrations_message)

let describe_inbound_integrations_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_target_arn = ref None in
  let r_integration_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "TargetArn"; "IntegrationArn" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "TargetArn" ->
          r_target_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetArn" (fun i _ -> target_arn_of_xml i) ())
      | "IntegrationArn" ->
          r_integration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationArn"
                 (fun i _ -> inbound_integration_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     target_arn = ( ! ) r_target_arn;
     integration_arn = ( ! ) r_integration_arn;
   }
    : describe_inbound_integrations_message)

let hsm_configuration_of_xml i =
  let r_tags = ref None in
  let r_hsm_partition_name = ref None in
  let r_hsm_ip_address = ref None in
  let r_description = ref None in
  let r_hsm_configuration_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "HsmPartitionName"; "HsmIpAddress"; "Description"; "HsmConfigurationIdentifier" ]
    (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "HsmPartitionName" ->
          r_hsm_partition_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmPartitionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmIpAddress" ->
          r_hsm_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmIpAddress" (fun i _ -> string__of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     hsm_partition_name = ( ! ) r_hsm_partition_name;
     hsm_ip_address = ( ! ) r_hsm_ip_address;
     description = ( ! ) r_description;
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
   }
    : hsm_configuration)

let hsm_configuration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "HsmConfiguration" (fun i _ -> hsm_configuration_of_xml i) ()

let hsm_configuration_message_of_xml i =
  let r_hsm_configurations = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HsmConfigurations"; "Marker" ] (fun tag _ ->
      match tag with
      | "HsmConfigurations" ->
          r_hsm_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "HsmConfiguration"
                     (fun i _ -> hsm_configuration_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ hsm_configurations = ( ! ) r_hsm_configurations; marker = ( ! ) r_marker }
    : hsm_configuration_message)

let describe_hsm_configurations_message_of_xml i =
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_hsm_configuration_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TagValues"; "TagKeys"; "Marker"; "MaxRecords"; "HsmConfigurationIdentifier" ] (fun tag _ ->
      match tag with
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
   }
    : describe_hsm_configurations_message)

let hsm_client_certificate_of_xml i =
  let r_tags = ref None in
  let r_hsm_client_certificate_public_key = ref None in
  let r_hsm_client_certificate_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "HsmClientCertificatePublicKey"; "HsmClientCertificateIdentifier" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "HsmClientCertificatePublicKey" ->
          r_hsm_client_certificate_public_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificatePublicKey"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     hsm_client_certificate_public_key = ( ! ) r_hsm_client_certificate_public_key;
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
   }
    : hsm_client_certificate)

let hsm_client_certificate_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "HsmClientCertificate"
    (fun i _ -> hsm_client_certificate_of_xml i)
    ()

let hsm_client_certificate_message_of_xml i =
  let r_hsm_client_certificates = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HsmClientCertificates"; "Marker" ] (fun tag _ ->
      match tag with
      | "HsmClientCertificates" ->
          r_hsm_client_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "HsmClientCertificate"
                     (fun i _ -> hsm_client_certificate_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ hsm_client_certificates = ( ! ) r_hsm_client_certificates; marker = ( ! ) r_marker }
    : hsm_client_certificate_message)

let describe_hsm_client_certificates_message_of_xml i =
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_hsm_client_certificate_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TagValues"; "TagKeys"; "Marker"; "MaxRecords"; "HsmClientCertificateIdentifier" ]
    (fun tag _ ->
      match tag with
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
   }
    : describe_hsm_client_certificates_message)

let event_subscriptions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "EventSubscription"
    (fun i _ -> event_subscription_of_xml i)
    ()

let event_subscriptions_message_of_xml i =
  let r_event_subscriptions_list = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EventSubscriptionsList"; "Marker" ] (fun tag _ ->
      match tag with
      | "EventSubscriptionsList" ->
          r_event_subscriptions_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventSubscriptionsList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventSubscription"
                     (fun i _ -> event_subscription_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ event_subscriptions_list = ( ! ) r_event_subscriptions_list; marker = ( ! ) r_marker }
    : event_subscriptions_message)

let describe_event_subscriptions_message_of_xml i =
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_subscription_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TagValues"; "TagKeys"; "Marker"; "MaxRecords"; "SubscriptionName" ] (fun tag _ ->
      match tag with
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     subscription_name = ( ! ) r_subscription_name;
   }
    : describe_event_subscriptions_message)

let event_of_xml i =
  let r_event_id = ref None in
  let r_date = ref None in
  let r_severity = ref None in
  let r_event_categories = ref None in
  let r_message = ref None in
  let r_source_type = ref None in
  let r_source_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EventId"; "Date"; "Severity"; "EventCategories"; "Message"; "SourceType"; "SourceIdentifier";
    ] (fun tag _ ->
      match tag with
      | "EventId" ->
          r_event_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EventId" (fun i _ -> string__of_xml i) ())
      | "Date" ->
          r_date :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Date" (fun i _ -> t_stamp_of_xml i) ())
      | "Severity" ->
          r_severity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Severity" (fun i _ -> string__of_xml i) ())
      | "EventCategories" ->
          r_event_categories :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategories"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | "SourceType" ->
          r_source_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType"
                 (fun i _ -> source_type_of_xml i)
                 ())
      | "SourceIdentifier" ->
          r_source_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     event_id = ( ! ) r_event_id;
     date = ( ! ) r_date;
     severity = ( ! ) r_severity;
     event_categories = ( ! ) r_event_categories;
     message = ( ! ) r_message;
     source_type = ( ! ) r_source_type;
     source_identifier = ( ! ) r_source_identifier;
   }
    : event)

let event_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Event" (fun i _ -> event_of_xml i) ()

let events_message_of_xml i =
  let r_events = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Events"; "Marker" ] (fun tag _ ->
      match tag with
      | "Events" ->
          r_events :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Events"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Event" (fun i _ -> event_of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ events = ( ! ) r_events; marker = ( ! ) r_marker } : events_message)

let describe_events_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_duration = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_source_type = ref None in
  let r_source_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Duration"; "EndTime"; "StartTime"; "SourceType"; "SourceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Duration" ->
          r_duration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Duration"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "SourceType" ->
          r_source_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType"
                 (fun i _ -> source_type_of_xml i)
                 ())
      | "SourceIdentifier" ->
          r_source_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     duration = ( ! ) r_duration;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     source_type = ( ! ) r_source_type;
     source_identifier = ( ! ) r_source_identifier;
   }
    : describe_events_message)

let event_info_map_of_xml i =
  let r_severity = ref None in
  let r_event_description = ref None in
  let r_event_categories = ref None in
  let r_event_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Severity"; "EventDescription"; "EventCategories"; "EventId" ] (fun tag _ ->
      match tag with
      | "Severity" ->
          r_severity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Severity" (fun i _ -> string__of_xml i) ())
      | "EventDescription" ->
          r_event_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EventCategories" ->
          r_event_categories :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategories"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "EventId" ->
          r_event_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EventId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     severity = ( ! ) r_severity;
     event_description = ( ! ) r_event_description;
     event_categories = ( ! ) r_event_categories;
     event_id = ( ! ) r_event_id;
   }
    : event_info_map)

let event_info_map_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "EventInfoMap" (fun i _ -> event_info_map_of_xml i) ()

let event_categories_map_of_xml i =
  let r_events = ref None in
  let r_source_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Events"; "SourceType" ] (fun tag _ ->
      match tag with
      | "Events" ->
          r_events :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Events"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventInfoMap"
                     (fun i _ -> event_info_map_of_xml i)
                     ())
                 ())
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ events = ( ! ) r_events; source_type = ( ! ) r_source_type } : event_categories_map)

let event_categories_map_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "EventCategoriesMap"
    (fun i _ -> event_categories_map_of_xml i)
    ()

let event_categories_message_of_xml i =
  let r_event_categories_map_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EventCategoriesMapList" ] (fun tag _ ->
      match tag with
      | "EventCategoriesMapList" ->
          r_event_categories_map_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategoriesMapList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategoriesMap"
                     (fun i _ -> event_categories_map_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ event_categories_map_list = ( ! ) r_event_categories_map_list } : event_categories_message)

let describe_event_categories_message_of_xml i =
  let r_source_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SourceType" ] (fun tag _ ->
      match tag with
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ source_type = ( ! ) r_source_type } : describe_event_categories_message)

let endpoint_authorizations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> endpoint_authorization_of_xml i) ()

let endpoint_authorization_list_of_xml i =
  let r_marker = ref None in
  let r_endpoint_authorization_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "EndpointAuthorizationList" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "EndpointAuthorizationList" ->
          r_endpoint_authorization_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointAuthorizationList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> endpoint_authorization_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; endpoint_authorization_list = ( ! ) r_endpoint_authorization_list }
    : endpoint_authorization_list)

let describe_endpoint_authorization_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_grantee = ref None in
  let r_account = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Grantee"; "Account"; "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Grantee" ->
          r_grantee :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Grantee"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     grantee = ( ! ) r_grantee;
     account = ( ! ) r_account;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : describe_endpoint_authorization_message)

let endpoint_accesses_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> endpoint_access_of_xml i) ()

let endpoint_access_list_of_xml i =
  let r_marker = ref None in
  let r_endpoint_access_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "EndpointAccessList" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "EndpointAccessList" ->
          r_endpoint_access_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointAccessList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> endpoint_access_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; endpoint_access_list = ( ! ) r_endpoint_access_list }
    : endpoint_access_list)

let describe_endpoint_access_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_vpc_id = ref None in
  let r_endpoint_name = ref None in
  let r_resource_owner = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "VpcId"; "EndpointName"; "ResourceOwner"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "EndpointName" ->
          r_endpoint_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointName" (fun i _ -> string__of_xml i) ())
      | "ResourceOwner" ->
          r_resource_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceOwner" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     vpc_id = ( ! ) r_vpc_id;
     endpoint_name = ( ! ) r_endpoint_name;
     resource_owner = ( ! ) r_resource_owner;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : describe_endpoint_access_message)

let default_cluster_parameters_of_xml i =
  let r_parameters = ref None in
  let r_marker = ref None in
  let r_parameter_group_family = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Parameters"; "Marker"; "ParameterGroupFamily" ]
    (fun tag _ ->
      match tag with
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Parameter"
                     (fun i _ -> parameter_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ParameterGroupFamily" ->
          r_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameters = ( ! ) r_parameters;
     marker = ( ! ) r_marker;
     parameter_group_family = ( ! ) r_parameter_group_family;
   }
    : default_cluster_parameters)

let describe_default_cluster_parameters_result_of_xml i =
  let r_default_cluster_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DefaultClusterParameters" ] (fun tag _ ->
      match tag with
      | "DefaultClusterParameters" ->
          r_default_cluster_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultClusterParameters"
                 (fun i _ -> default_cluster_parameters_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ default_cluster_parameters = ( ! ) r_default_cluster_parameters }
    : describe_default_cluster_parameters_result)

let describe_default_cluster_parameters_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_parameter_group_family = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaxRecords"; "ParameterGroupFamily" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ParameterGroupFamily" ->
          r_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     parameter_group_family =
       Smaws_Lib.Xml.Parse.required "ParameterGroupFamily" (( ! ) r_parameter_group_family) i;
   }
    : describe_default_cluster_parameters_message)

let data_share_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> data_share_of_xml i) ()

let describe_data_shares_for_producer_result_of_xml i =
  let r_marker = ref None in
  let r_data_shares = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "DataShares" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "DataShares" ->
          r_data_shares :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShares"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> data_share_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; data_shares = ( ! ) r_data_shares }
    : describe_data_shares_for_producer_result)

let data_share_status_for_producer_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "REJECTED" -> REJECTED
   | "DEAUTHORIZED" -> DEAUTHORIZED
   | "PENDING_AUTHORIZATION" -> PENDING_AUTHORIZATION
   | "AUTHORIZED" -> AUTHORIZED
   | "ACTIVE" -> ACTIVE
   | _ -> failwith "unknown enum value"
    : data_share_status_for_producer)

let describe_data_shares_for_producer_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_status = ref None in
  let r_producer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaxRecords"; "Status"; "ProducerArn" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> data_share_status_for_producer_of_xml i)
                 ())
      | "ProducerArn" ->
          r_producer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProducerArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     status = ( ! ) r_status;
     producer_arn = ( ! ) r_producer_arn;
   }
    : describe_data_shares_for_producer_message)

let describe_data_shares_for_consumer_result_of_xml i =
  let r_marker = ref None in
  let r_data_shares = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "DataShares" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "DataShares" ->
          r_data_shares :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShares"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> data_share_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; data_shares = ( ! ) r_data_shares }
    : describe_data_shares_for_consumer_result)

let data_share_status_for_consumer_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "AVAILABLE" -> AVAILABLE | "ACTIVE" -> ACTIVE | _ -> failwith "unknown enum value"
    : data_share_status_for_consumer)

let describe_data_shares_for_consumer_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_status = ref None in
  let r_consumer_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaxRecords"; "Status"; "ConsumerArn" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> data_share_status_for_consumer_of_xml i)
                 ())
      | "ConsumerArn" ->
          r_consumer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     status = ( ! ) r_status;
     consumer_arn = ( ! ) r_consumer_arn;
   }
    : describe_data_shares_for_consumer_message)

let describe_data_shares_result_of_xml i =
  let r_marker = ref None in
  let r_data_shares = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "DataShares" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "DataShares" ->
          r_data_shares :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShares"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> data_share_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; data_shares = ( ! ) r_data_shares } : describe_data_shares_result)

let describe_data_shares_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_data_share_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaxRecords"; "DataShareArn" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     data_share_arn = ( ! ) r_data_share_arn;
   }
    : describe_data_shares_message)

let certificate_association_of_xml i =
  let r_cluster_identifier = ref None in
  let r_custom_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier"; "CustomDomainName" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier = ( ! ) r_cluster_identifier;
     custom_domain_name = ( ! ) r_custom_domain_name;
   }
    : certificate_association)

let certificate_association_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CertificateAssociation"
    (fun i _ -> certificate_association_of_xml i)
    ()

let association_of_xml i =
  let r_certificate_associations = ref None in
  let r_custom_domain_certificate_expiry_date = ref None in
  let r_custom_domain_certificate_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CertificateAssociations"; "CustomDomainCertificateExpiryDate"; "CustomDomainCertificateArn" ]
    (fun tag _ ->
      match tag with
      | "CertificateAssociations" ->
          r_certificate_associations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateAssociations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CertificateAssociation"
                     (fun i _ -> certificate_association_of_xml i)
                     ())
                 ())
      | "CustomDomainCertificateExpiryDate" ->
          r_custom_domain_certificate_expiry_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateExpiryDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     certificate_associations = ( ! ) r_certificate_associations;
     custom_domain_certificate_expiry_date = ( ! ) r_custom_domain_certificate_expiry_date;
     custom_domain_certificate_arn = ( ! ) r_custom_domain_certificate_arn;
   }
    : association)

let association_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Association" (fun i _ -> association_of_xml i) ()

let custom_domain_associations_message_of_xml i =
  let r_associations = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Associations"; "Marker" ] (fun tag _ ->
      match tag with
      | "Associations" ->
          r_associations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Associations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Association"
                     (fun i _ -> association_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ associations = ( ! ) r_associations; marker = ( ! ) r_marker }
    : custom_domain_associations_message)

let describe_custom_domain_associations_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_custom_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "CustomDomainCertificateArn"; "CustomDomainName" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> custom_domain_certificate_arn_string_of_xml i)
                 ())
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     custom_domain_certificate_arn = ( ! ) r_custom_domain_certificate_arn;
     custom_domain_name = ( ! ) r_custom_domain_name;
   }
    : describe_custom_domain_associations_message)

let cluster_version_of_xml i =
  let r_description = ref None in
  let r_cluster_parameter_group_family = ref None in
  let r_cluster_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Description"; "ClusterParameterGroupFamily"; "ClusterVersion" ] (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "ClusterParameterGroupFamily" ->
          r_cluster_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     description = ( ! ) r_description;
     cluster_parameter_group_family = ( ! ) r_cluster_parameter_group_family;
     cluster_version = ( ! ) r_cluster_version;
   }
    : cluster_version)

let cluster_version_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterVersion" (fun i _ -> cluster_version_of_xml i) ()

let cluster_versions_message_of_xml i =
  let r_cluster_versions = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterVersions"; "Marker" ] (fun tag _ ->
      match tag with
      | "ClusterVersions" ->
          r_cluster_versions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterVersion"
                     (fun i _ -> cluster_version_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_versions = ( ! ) r_cluster_versions; marker = ( ! ) r_marker }
    : cluster_versions_message)

let describe_cluster_versions_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_cluster_parameter_group_family = ref None in
  let r_cluster_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "ClusterParameterGroupFamily"; "ClusterVersion" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterParameterGroupFamily" ->
          r_cluster_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     cluster_parameter_group_family = ( ! ) r_cluster_parameter_group_family;
     cluster_version = ( ! ) r_cluster_version;
   }
    : describe_cluster_versions_message)

let describe_cluster_tracks_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_maintenance_track_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaxRecords"; "MaintenanceTrackName" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
   }
    : describe_cluster_tracks_message)

let cluster_subnet_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSubnetGroup"
    (fun i _ -> cluster_subnet_group_of_xml i)
    ()

let cluster_subnet_group_message_of_xml i =
  let r_cluster_subnet_groups = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterSubnetGroups"; "Marker" ] (fun tag _ ->
      match tag with
      | "ClusterSubnetGroups" ->
          r_cluster_subnet_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSubnetGroup"
                     (fun i _ -> cluster_subnet_group_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_subnet_groups = ( ! ) r_cluster_subnet_groups; marker = ( ! ) r_marker }
    : cluster_subnet_group_message)

let describe_cluster_subnet_groups_message_of_xml i =
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_cluster_subnet_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TagValues"; "TagKeys"; "Marker"; "MaxRecords"; "ClusterSubnetGroupName" ] (fun tag _ ->
      match tag with
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     cluster_subnet_group_name = ( ! ) r_cluster_subnet_group_name;
   }
    : describe_cluster_subnet_groups_message)

let describe_cluster_snapshots_message_of_xml i =
  let r_sorting_entities = ref None in
  let r_cluster_exists = ref None in
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_owner_account = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_snapshot_type = ref None in
  let r_snapshot_arn = ref None in
  let r_snapshot_identifier = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SortingEntities";
      "ClusterExists";
      "TagValues";
      "TagKeys";
      "OwnerAccount";
      "Marker";
      "MaxRecords";
      "EndTime";
      "StartTime";
      "SnapshotType";
      "SnapshotArn";
      "SnapshotIdentifier";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "SortingEntities" ->
          r_sorting_entities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortingEntities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotSortingEntity"
                     (fun i _ -> snapshot_sorting_entity_of_xml i)
                     ())
                 ())
      | "ClusterExists" ->
          r_cluster_exists :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterExists"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "OwnerAccount" ->
          r_owner_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerAccount" (fun i _ -> string__of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "SnapshotType" ->
          r_snapshot_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotType" (fun i _ -> string__of_xml i) ())
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sorting_entities = ( ! ) r_sorting_entities;
     cluster_exists = ( ! ) r_cluster_exists;
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     owner_account = ( ! ) r_owner_account;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     snapshot_type = ( ! ) r_snapshot_type;
     snapshot_arn = ( ! ) r_snapshot_arn;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : describe_cluster_snapshots_message)

let cluster_security_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroup"
    (fun i _ -> cluster_security_group_of_xml i)
    ()

let cluster_security_group_message_of_xml i =
  let r_cluster_security_groups = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterSecurityGroups"; "Marker" ] (fun tag _ ->
      match tag with
      | "ClusterSecurityGroups" ->
          r_cluster_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroup"
                     (fun i _ -> cluster_security_group_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_security_groups = ( ! ) r_cluster_security_groups; marker = ( ! ) r_marker }
    : cluster_security_group_message)

let describe_cluster_security_groups_message_of_xml i =
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_cluster_security_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TagValues"; "TagKeys"; "Marker"; "MaxRecords"; "ClusterSecurityGroupName" ] (fun tag _ ->
      match tag with
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     cluster_security_group_name = ( ! ) r_cluster_security_group_name;
   }
    : describe_cluster_security_groups_message)

let cluster_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Cluster" (fun i _ -> cluster_of_xml i) ()

let clusters_message_of_xml i =
  let r_clusters = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Clusters"; "Marker" ] (fun tag _ ->
      match tag with
      | "Clusters" ->
          r_clusters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Clusters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Cluster" (fun i _ -> cluster_of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ clusters = ( ! ) r_clusters; marker = ( ! ) r_marker } : clusters_message)

let describe_clusters_message_of_xml i =
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TagValues"; "TagKeys"; "Marker"; "MaxRecords"; "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : describe_clusters_message)

let cluster_parameter_group_details_of_xml i =
  let r_marker = ref None in
  let r_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "Parameters" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Parameter"
                     (fun i _ -> parameter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; parameters = ( ! ) r_parameters } : cluster_parameter_group_details)

let describe_cluster_parameters_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_source = ref None in
  let r_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Source"; "ParameterGroupName" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> string__of_xml i) ())
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     source = ( ! ) r_source;
     parameter_group_name =
       Smaws_Lib.Xml.Parse.required "ParameterGroupName" (( ! ) r_parameter_group_name) i;
   }
    : describe_cluster_parameters_message)

let cluster_parameter_group_of_xml i =
  let r_tags = ref None in
  let r_description = ref None in
  let r_parameter_group_family = ref None in
  let r_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "Description"; "ParameterGroupFamily"; "ParameterGroupName" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "ParameterGroupFamily" ->
          r_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     description = ( ! ) r_description;
     parameter_group_family = ( ! ) r_parameter_group_family;
     parameter_group_name = ( ! ) r_parameter_group_name;
   }
    : cluster_parameter_group)

let parameter_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterParameterGroup"
    (fun i _ -> cluster_parameter_group_of_xml i)
    ()

let cluster_parameter_groups_message_of_xml i =
  let r_parameter_groups = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ParameterGroups"; "Marker" ] (fun tag _ ->
      match tag with
      | "ParameterGroups" ->
          r_parameter_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterParameterGroup"
                     (fun i _ -> cluster_parameter_group_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ parameter_groups = ( ! ) r_parameter_groups; marker = ( ! ) r_marker }
    : cluster_parameter_groups_message)

let describe_cluster_parameter_groups_message_of_xml i =
  let r_tag_values = ref None in
  let r_tag_keys = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TagValues"; "TagKeys"; "Marker"; "MaxRecords"; "ParameterGroupName" ] (fun tag _ ->
      match tag with
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_values = ( ! ) r_tag_values;
     tag_keys = ( ! ) r_tag_keys;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     parameter_group_name = ( ! ) r_parameter_group_name;
   }
    : describe_cluster_parameter_groups_message)

let cluster_db_revision_of_xml i =
  let r_revision_targets = ref None in
  let r_database_revision_release_date = ref None in
  let r_current_database_revision = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RevisionTargets";
      "DatabaseRevisionReleaseDate";
      "CurrentDatabaseRevision";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "RevisionTargets" ->
          r_revision_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevisionTargets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "RevisionTarget"
                     (fun i _ -> revision_target_of_xml i)
                     ())
                 ())
      | "DatabaseRevisionReleaseDate" ->
          r_database_revision_release_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseRevisionReleaseDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "CurrentDatabaseRevision" ->
          r_current_database_revision :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentDatabaseRevision"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     revision_targets = ( ! ) r_revision_targets;
     database_revision_release_date = ( ! ) r_database_revision_release_date;
     current_database_revision = ( ! ) r_current_database_revision;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : cluster_db_revision)

let cluster_db_revisions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterDbRevision"
    (fun i _ -> cluster_db_revision_of_xml i)
    ()

let cluster_db_revisions_message_of_xml i =
  let r_cluster_db_revisions = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterDbRevisions"; "Marker" ] (fun tag _ ->
      match tag with
      | "ClusterDbRevisions" ->
          r_cluster_db_revisions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterDbRevisions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterDbRevision"
                     (fun i _ -> cluster_db_revision_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_db_revisions = ( ! ) r_cluster_db_revisions; marker = ( ! ) r_marker }
    : cluster_db_revisions_message)

let describe_cluster_db_revisions_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaxRecords"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : describe_cluster_db_revisions_message)

let authentication_profile_of_xml i =
  let r_authentication_profile_content = ref None in
  let r_authentication_profile_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AuthenticationProfileContent"; "AuthenticationProfileName" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileContent" ->
          r_authentication_profile_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileContent"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authentication_profile_content = ( ! ) r_authentication_profile_content;
     authentication_profile_name = ( ! ) r_authentication_profile_name;
   }
    : authentication_profile)

let authentication_profile_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> authentication_profile_of_xml i) ()

let describe_authentication_profiles_result_of_xml i =
  let r_authentication_profiles = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AuthenticationProfiles" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfiles" ->
          r_authentication_profiles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfiles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> authentication_profile_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ authentication_profiles = ( ! ) r_authentication_profiles }
    : describe_authentication_profiles_result)

let describe_authentication_profiles_message_of_xml i =
  let r_authentication_profile_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AuthenticationProfileName" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ authentication_profile_name = ( ! ) r_authentication_profile_name }
    : describe_authentication_profiles_message)

let attribute_value_target_of_xml i =
  let r_attribute_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AttributeValue" ] (fun tag _ ->
      match tag with
      | "AttributeValue" ->
          r_attribute_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeValue"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attribute_value = ( ! ) r_attribute_value } : attribute_value_target)

let attribute_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AttributeValueTarget"
    (fun i _ -> attribute_value_target_of_xml i)
    ()

let account_attribute_of_xml i =
  let r_attribute_values = ref None in
  let r_attribute_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AttributeValues"; "AttributeName" ] (fun tag _ ->
      match tag with
      | "AttributeValues" ->
          r_attribute_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AttributeValueTarget"
                     (fun i _ -> attribute_value_target_of_xml i)
                     ())
                 ())
      | "AttributeName" ->
          r_attribute_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attribute_values = ( ! ) r_attribute_values; attribute_name = ( ! ) r_attribute_name }
    : account_attribute)

let attribute_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AccountAttribute" (fun i _ -> account_attribute_of_xml i) ()

let account_attribute_list_of_xml i =
  let r_account_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccountAttributes" ] (fun tag _ ->
      match tag with
      | "AccountAttributes" ->
          r_account_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AccountAttribute"
                     (fun i _ -> account_attribute_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ account_attributes = ( ! ) r_account_attributes } : account_attribute_list)

let attribute_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AttributeName" (fun i _ -> string__of_xml i) ()

let describe_account_attributes_message_of_xml i =
  let r_attribute_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AttributeNames" ] (fun tag _ ->
      match tag with
      | "AttributeNames" ->
          r_attribute_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AttributeName"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attribute_names = ( ! ) r_attribute_names } : describe_account_attributes_message)

let deregister_namespace_output_message_of_xml i =
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> namespace_registration_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status } : deregister_namespace_output_message)

let deregister_namespace_input_message_of_xml i =
  let r_consumer_identifiers = ref None in
  let r_namespace_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConsumerIdentifiers"; "NamespaceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "ConsumerIdentifiers" ->
          r_consumer_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "NamespaceIdentifier" ->
          r_namespace_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NamespaceIdentifier"
                 (fun i _ -> namespace_identifier_union_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     consumer_identifiers =
       Smaws_Lib.Xml.Parse.required "ConsumerIdentifiers" (( ! ) r_consumer_identifiers) i;
     namespace_identifier =
       Smaws_Lib.Xml.Parse.required "NamespaceIdentifier" (( ! ) r_namespace_identifier) i;
   }
    : deregister_namespace_input_message)

let delete_usage_limit_message_of_xml i =
  let r_usage_limit_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UsageLimitId" ] (fun tag _ ->
      match tag with
      | "UsageLimitId" ->
          r_usage_limit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsageLimitId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ usage_limit_id = Smaws_Lib.Xml.Parse.required "UsageLimitId" (( ! ) r_usage_limit_id) i }
    : delete_usage_limit_message)

let delete_tags_message_of_xml i =
  let r_tag_keys = ref None in
  let r_resource_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TagKeys"; "ResourceName" ] (fun tag _ ->
      match tag with
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
     resource_name = Smaws_Lib.Xml.Parse.required "ResourceName" (( ! ) r_resource_name) i;
   }
    : delete_tags_message)

let delete_snapshot_schedule_message_of_xml i =
  let r_schedule_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScheduleIdentifier" ] (fun tag _ ->
      match tag with
      | "ScheduleIdentifier" ->
          r_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     schedule_identifier =
       Smaws_Lib.Xml.Parse.required "ScheduleIdentifier" (( ! ) r_schedule_identifier) i;
   }
    : delete_snapshot_schedule_message)

let invalid_snapshot_copy_grant_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_snapshot_copy_grant_state_fault)

let delete_snapshot_copy_grant_message_of_xml i =
  let r_snapshot_copy_grant_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SnapshotCopyGrantName" ] (fun tag _ ->
      match tag with
      | "SnapshotCopyGrantName" ->
          r_snapshot_copy_grant_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrantName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_copy_grant_name =
       Smaws_Lib.Xml.Parse.required "SnapshotCopyGrantName" (( ! ) r_snapshot_copy_grant_name) i;
   }
    : delete_snapshot_copy_grant_message)

let delete_scheduled_action_message_of_xml i =
  let r_scheduled_action_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScheduledActionName" ] (fun tag _ ->
      match tag with
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
   }
    : delete_scheduled_action_message)

let delete_resource_policy_message_of_xml i =
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArn" ] (fun tag _ ->
      match tag with
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i }
    : delete_resource_policy_message)

let delete_redshift_idc_application_message_of_xml i =
  let r_redshift_idc_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RedshiftIdcApplicationArn" ] (fun tag _ ->
      match tag with
      | "RedshiftIdcApplicationArn" ->
          r_redshift_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     redshift_idc_application_arn =
       Smaws_Lib.Xml.Parse.required "RedshiftIdcApplicationArn"
         (( ! ) r_redshift_idc_application_arn)
         i;
   }
    : delete_redshift_idc_application_message)

let partner_integration_input_message_of_xml i =
  let r_partner_name = ref None in
  let r_database_name = ref None in
  let r_cluster_identifier = ref None in
  let r_account_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PartnerName"; "DatabaseName"; "ClusterIdentifier"; "AccountId" ] (fun tag _ ->
      match tag with
      | "PartnerName" ->
          r_partner_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PartnerName"
                 (fun i _ -> partner_integration_partner_name_of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName"
                 (fun i _ -> partner_integration_database_name_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> partner_integration_cluster_identifier_of_xml i)
                 ())
      | "AccountId" ->
          r_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId"
                 (fun i _ -> partner_integration_account_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     partner_name = Smaws_Lib.Xml.Parse.required "PartnerName" (( ! ) r_partner_name) i;
     database_name = Smaws_Lib.Xml.Parse.required "DatabaseName" (( ! ) r_database_name) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     account_id = Smaws_Lib.Xml.Parse.required "AccountId" (( ! ) r_account_id) i;
   }
    : partner_integration_input_message)

let delete_integration_message_of_xml i =
  let r_integration_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IntegrationArn" ] (fun tag _ ->
      match tag with
      | "IntegrationArn" ->
          r_integration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationArn"
                 (fun i _ -> integration_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ integration_arn = Smaws_Lib.Xml.Parse.required "IntegrationArn" (( ! ) r_integration_arn) i }
    : delete_integration_message)

let invalid_hsm_configuration_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_hsm_configuration_state_fault)

let delete_hsm_configuration_message_of_xml i =
  let r_hsm_configuration_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HsmConfigurationIdentifier" ] (fun tag _ ->
      match tag with
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     hsm_configuration_identifier =
       Smaws_Lib.Xml.Parse.required "HsmConfigurationIdentifier"
         (( ! ) r_hsm_configuration_identifier)
         i;
   }
    : delete_hsm_configuration_message)

let invalid_hsm_client_certificate_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_hsm_client_certificate_state_fault)

let delete_hsm_client_certificate_message_of_xml i =
  let r_hsm_client_certificate_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HsmClientCertificateIdentifier" ] (fun tag _ ->
      match tag with
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     hsm_client_certificate_identifier =
       Smaws_Lib.Xml.Parse.required "HsmClientCertificateIdentifier"
         (( ! ) r_hsm_client_certificate_identifier)
         i;
   }
    : delete_hsm_client_certificate_message)

let delete_event_subscription_message_of_xml i =
  let r_subscription_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SubscriptionName" ] (fun tag _ ->
      match tag with
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subscription_name =
       Smaws_Lib.Xml.Parse.required "SubscriptionName" (( ! ) r_subscription_name) i;
   }
    : delete_event_subscription_message)

let delete_endpoint_access_message_of_xml i =
  let r_endpoint_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EndpointName" ] (fun tag _ ->
      match tag with
      | "EndpointName" ->
          r_endpoint_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ endpoint_name = Smaws_Lib.Xml.Parse.required "EndpointName" (( ! ) r_endpoint_name) i }
    : delete_endpoint_access_message)

let delete_custom_domain_association_message_of_xml i =
  let r_custom_domain_name = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CustomDomainName"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_domain_name =
       Smaws_Lib.Xml.Parse.required "CustomDomainName" (( ! ) r_custom_domain_name) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : delete_custom_domain_association_message)

let invalid_cluster_subnet_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_cluster_subnet_state_fault)

let delete_cluster_subnet_group_message_of_xml i =
  let r_cluster_subnet_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterSubnetGroupName" ] (fun tag _ ->
      match tag with
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSubnetGroupName" (( ! ) r_cluster_subnet_group_name) i;
   }
    : delete_cluster_subnet_group_message)

let delete_cluster_snapshot_result_of_xml i =
  let r_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Snapshot" ] (fun tag _ ->
      match tag with
      | "Snapshot" ->
          r_snapshot :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot = ( ! ) r_snapshot } : delete_cluster_snapshot_result)

let delete_cluster_snapshot_message_of_xml i =
  let r_snapshot_cluster_identifier = ref None in
  let r_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SnapshotClusterIdentifier"; "SnapshotIdentifier" ]
    (fun tag _ ->
      match tag with
      | "SnapshotClusterIdentifier" ->
          r_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_cluster_identifier = ( ! ) r_snapshot_cluster_identifier;
     snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifier" (( ! ) r_snapshot_identifier) i;
   }
    : delete_cluster_snapshot_message)

let delete_cluster_security_group_message_of_xml i =
  let r_cluster_security_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterSecurityGroupName" ] (fun tag _ ->
      match tag with
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_security_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSecurityGroupName"
         (( ! ) r_cluster_security_group_name)
         i;
   }
    : delete_cluster_security_group_message)

let delete_cluster_parameter_group_message_of_xml i =
  let r_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ParameterGroupName" ] (fun tag _ ->
      match tag with
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_group_name =
       Smaws_Lib.Xml.Parse.required "ParameterGroupName" (( ! ) r_parameter_group_name) i;
   }
    : delete_cluster_parameter_group_message)

let cluster_snapshot_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_snapshot_quota_exceeded_fault)

let cluster_snapshot_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_snapshot_already_exists_fault)

let delete_cluster_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : delete_cluster_result)

let delete_cluster_message_of_xml i =
  let r_final_cluster_snapshot_retention_period = ref None in
  let r_final_cluster_snapshot_identifier = ref None in
  let r_skip_final_cluster_snapshot = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "FinalClusterSnapshotRetentionPeriod";
      "FinalClusterSnapshotIdentifier";
      "SkipFinalClusterSnapshot";
      "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "FinalClusterSnapshotRetentionPeriod" ->
          r_final_cluster_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalClusterSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "FinalClusterSnapshotIdentifier" ->
          r_final_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SkipFinalClusterSnapshot" ->
          r_skip_final_cluster_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipFinalClusterSnapshot"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     final_cluster_snapshot_retention_period = ( ! ) r_final_cluster_snapshot_retention_period;
     final_cluster_snapshot_identifier = ( ! ) r_final_cluster_snapshot_identifier;
     skip_final_cluster_snapshot = ( ! ) r_skip_final_cluster_snapshot;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : delete_cluster_message)

let delete_authentication_profile_result_of_xml i =
  let r_authentication_profile_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AuthenticationProfileName" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ authentication_profile_name = ( ! ) r_authentication_profile_name }
    : delete_authentication_profile_result)

let delete_authentication_profile_message_of_xml i =
  let r_authentication_profile_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AuthenticationProfileName" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authentication_profile_name =
       Smaws_Lib.Xml.Parse.required "AuthenticationProfileName"
         (( ! ) r_authentication_profile_name)
         i;
   }
    : delete_authentication_profile_message)

let deauthorize_data_share_message_of_xml i =
  let r_consumer_identifier = ref None in
  let r_data_share_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConsumerIdentifier"; "DataShareArn" ]
    (fun tag _ ->
      match tag with
      | "ConsumerIdentifier" ->
          r_consumer_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     consumer_identifier =
       Smaws_Lib.Xml.Parse.required "ConsumerIdentifier" (( ! ) r_consumer_identifier) i;
     data_share_arn = Smaws_Lib.Xml.Parse.required "DataShareArn" (( ! ) r_data_share_arn) i;
   }
    : deauthorize_data_share_message)

let create_usage_limit_message_of_xml i =
  let r_tags = ref None in
  let r_breach_action = ref None in
  let r_period = ref None in
  let r_amount = ref None in
  let r_limit_type = ref None in
  let r_feature_type = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "BreachAction"; "Period"; "Amount"; "LimitType"; "FeatureType"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "BreachAction" ->
          r_breach_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BreachAction"
                 (fun i _ -> usage_limit_breach_action_of_xml i)
                 ())
      | "Period" ->
          r_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Period"
                 (fun i _ -> usage_limit_period_of_xml i)
                 ())
      | "Amount" ->
          r_amount :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Amount" (fun i _ -> long_of_xml i) ())
      | "LimitType" ->
          r_limit_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LimitType"
                 (fun i _ -> usage_limit_limit_type_of_xml i)
                 ())
      | "FeatureType" ->
          r_feature_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FeatureType"
                 (fun i _ -> usage_limit_feature_type_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     breach_action = ( ! ) r_breach_action;
     period = ( ! ) r_period;
     amount = Smaws_Lib.Xml.Parse.required "Amount" (( ! ) r_amount) i;
     limit_type = Smaws_Lib.Xml.Parse.required "LimitType" (( ! ) r_limit_type) i;
     feature_type = Smaws_Lib.Xml.Parse.required "FeatureType" (( ! ) r_feature_type) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : create_usage_limit_message)

let create_tags_message_of_xml i =
  let r_tags = ref None in
  let r_resource_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "ResourceName" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     resource_name = Smaws_Lib.Xml.Parse.required "ResourceName" (( ! ) r_resource_name) i;
   }
    : create_tags_message)

let create_snapshot_schedule_message_of_xml i =
  let r_next_invocations = ref None in
  let r_dry_run = ref None in
  let r_tags = ref None in
  let r_schedule_description = ref None in
  let r_schedule_identifier = ref None in
  let r_schedule_definitions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NextInvocations";
      "DryRun";
      "Tags";
      "ScheduleDescription";
      "ScheduleIdentifier";
      "ScheduleDefinitions";
    ] (fun tag _ ->
      match tag with
      | "NextInvocations" ->
          r_next_invocations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextInvocations"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DryRun" ->
          r_dry_run :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DryRun"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ScheduleDescription" ->
          r_schedule_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ScheduleIdentifier" ->
          r_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ScheduleDefinitions" ->
          r_schedule_definitions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleDefinitions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ScheduleDefinition"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_invocations = ( ! ) r_next_invocations;
     dry_run = ( ! ) r_dry_run;
     tags = ( ! ) r_tags;
     schedule_description = ( ! ) r_schedule_description;
     schedule_identifier = ( ! ) r_schedule_identifier;
     schedule_definitions = ( ! ) r_schedule_definitions;
   }
    : create_snapshot_schedule_message)

let create_snapshot_copy_grant_result_of_xml i =
  let r_snapshot_copy_grant = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SnapshotCopyGrant" ] (fun tag _ ->
      match tag with
      | "SnapshotCopyGrant" ->
          r_snapshot_copy_grant :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrant"
                 (fun i _ -> snapshot_copy_grant_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot_copy_grant = ( ! ) r_snapshot_copy_grant } : create_snapshot_copy_grant_result)

let create_snapshot_copy_grant_message_of_xml i =
  let r_tags = ref None in
  let r_kms_key_id = ref None in
  let r_snapshot_copy_grant_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "KmsKeyId"; "SnapshotCopyGrantName" ]
    (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "SnapshotCopyGrantName" ->
          r_snapshot_copy_grant_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrantName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     kms_key_id = ( ! ) r_kms_key_id;
     snapshot_copy_grant_name =
       Smaws_Lib.Xml.Parse.required "SnapshotCopyGrantName" (( ! ) r_snapshot_copy_grant_name) i;
   }
    : create_snapshot_copy_grant_message)

let create_scheduled_action_message_of_xml i =
  let r_enable = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_scheduled_action_description = ref None in
  let r_iam_role = ref None in
  let r_schedule = ref None in
  let r_target_action = ref None in
  let r_scheduled_action_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Enable";
      "EndTime";
      "StartTime";
      "ScheduledActionDescription";
      "IamRole";
      "Schedule";
      "TargetAction";
      "ScheduledActionName";
    ] (fun tag _ ->
      match tag with
      | "Enable" ->
          r_enable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enable"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "ScheduledActionDescription" ->
          r_scheduled_action_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IamRole" ->
          r_iam_role :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IamRole" (fun i _ -> string__of_xml i) ())
      | "Schedule" ->
          r_schedule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Schedule" (fun i _ -> string__of_xml i) ())
      | "TargetAction" ->
          r_target_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetAction"
                 (fun i _ -> scheduled_action_type_of_xml i)
                 ())
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enable = ( ! ) r_enable;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     scheduled_action_description = ( ! ) r_scheduled_action_description;
     iam_role = Smaws_Lib.Xml.Parse.required "IamRole" (( ! ) r_iam_role) i;
     schedule = Smaws_Lib.Xml.Parse.required "Schedule" (( ! ) r_schedule) i;
     target_action = Smaws_Lib.Xml.Parse.required "TargetAction" (( ! ) r_target_action) i;
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
   }
    : create_scheduled_action_message)

let redshift_idc_application_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : redshift_idc_application_quota_exceeded_fault)

let redshift_idc_application_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : redshift_idc_application_already_exists_fault)

let create_redshift_idc_application_result_of_xml i =
  let r_redshift_idc_application = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RedshiftIdcApplication" ] (fun tag _ ->
      match tag with
      | "RedshiftIdcApplication" ->
          r_redshift_idc_application :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplication"
                 (fun i _ -> redshift_idc_application_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ redshift_idc_application = ( ! ) r_redshift_idc_application }
    : create_redshift_idc_application_result)

let create_redshift_idc_application_message_of_xml i =
  let r_sso_tag_keys = ref None in
  let r_tags = ref None in
  let r_application_type = ref None in
  let r_service_integrations = ref None in
  let r_authorized_token_issuer_list = ref None in
  let r_iam_role_arn = ref None in
  let r_idc_display_name = ref None in
  let r_identity_namespace = ref None in
  let r_redshift_idc_application_name = ref None in
  let r_idc_instance_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SsoTagKeys";
      "Tags";
      "ApplicationType";
      "ServiceIntegrations";
      "AuthorizedTokenIssuerList";
      "IamRoleArn";
      "IdcDisplayName";
      "IdentityNamespace";
      "RedshiftIdcApplicationName";
      "IdcInstanceArn";
    ] (fun tag _ ->
      match tag with
      | "SsoTagKeys" ->
          r_sso_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SsoTagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ApplicationType" ->
          r_application_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationType"
                 (fun i _ -> application_type_of_xml i)
                 ())
      | "ServiceIntegrations" ->
          r_service_integrations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceIntegrations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> service_integrations_union_of_xml i)
                     ())
                 ())
      | "AuthorizedTokenIssuerList" ->
          r_authorized_token_issuer_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthorizedTokenIssuerList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> authorized_token_issuer_of_xml i)
                     ())
                 ())
      | "IamRoleArn" ->
          r_iam_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IamRoleArn" (fun i _ -> string__of_xml i) ())
      | "IdcDisplayName" ->
          r_idc_display_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdcDisplayName"
                 (fun i _ -> idc_display_name_string_of_xml i)
                 ())
      | "IdentityNamespace" ->
          r_identity_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdentityNamespace"
                 (fun i _ -> identity_namespace_string_of_xml i)
                 ())
      | "RedshiftIdcApplicationName" ->
          r_redshift_idc_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationName"
                 (fun i _ -> redshift_idc_application_name_of_xml i)
                 ())
      | "IdcInstanceArn" ->
          r_idc_instance_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdcInstanceArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sso_tag_keys = ( ! ) r_sso_tag_keys;
     tags = ( ! ) r_tags;
     application_type = ( ! ) r_application_type;
     service_integrations = ( ! ) r_service_integrations;
     authorized_token_issuer_list = ( ! ) r_authorized_token_issuer_list;
     iam_role_arn = Smaws_Lib.Xml.Parse.required "IamRoleArn" (( ! ) r_iam_role_arn) i;
     idc_display_name = Smaws_Lib.Xml.Parse.required "IdcDisplayName" (( ! ) r_idc_display_name) i;
     identity_namespace = ( ! ) r_identity_namespace;
     redshift_idc_application_name =
       Smaws_Lib.Xml.Parse.required "RedshiftIdcApplicationName"
         (( ! ) r_redshift_idc_application_name)
         i;
     idc_instance_arn = Smaws_Lib.Xml.Parse.required "IdcInstanceArn" (( ! ) r_idc_instance_arn) i;
   }
    : create_redshift_idc_application_message)

let integration_target_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : integration_target_not_found_fault)

let integration_source_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : integration_source_not_found_fault)

let integration_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : integration_quota_exceeded_fault)

let create_integration_message_of_xml i =
  let r_description = ref None in
  let r_additional_encryption_context = ref None in
  let r_tag_list = ref None in
  let r_kms_key_id = ref None in
  let r_integration_name = ref None in
  let r_target_arn = ref None in
  let r_source_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Description";
      "AdditionalEncryptionContext";
      "TagList";
      "KMSKeyId";
      "IntegrationName";
      "TargetArn";
      "SourceArn";
    ] (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> integration_description_of_xml i)
                 ())
      | "AdditionalEncryptionContext" ->
          r_additional_encryption_context :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdditionalEncryptionContext"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "TagList" ->
          r_tag_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "KMSKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KMSKeyId" (fun i _ -> string__of_xml i) ())
      | "IntegrationName" ->
          r_integration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationName"
                 (fun i _ -> integration_name_of_xml i)
                 ())
      | "TargetArn" ->
          r_target_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetArn" (fun i _ -> target_arn_of_xml i) ())
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn" (fun i _ -> source_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     description = ( ! ) r_description;
     additional_encryption_context = ( ! ) r_additional_encryption_context;
     tag_list = ( ! ) r_tag_list;
     kms_key_id = ( ! ) r_kms_key_id;
     integration_name = Smaws_Lib.Xml.Parse.required "IntegrationName" (( ! ) r_integration_name) i;
     target_arn = Smaws_Lib.Xml.Parse.required "TargetArn" (( ! ) r_target_arn) i;
     source_arn = Smaws_Lib.Xml.Parse.required "SourceArn" (( ! ) r_source_arn) i;
   }
    : create_integration_message)

let hsm_configuration_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : hsm_configuration_quota_exceeded_fault)

let hsm_configuration_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : hsm_configuration_already_exists_fault)

let create_hsm_configuration_result_of_xml i =
  let r_hsm_configuration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HsmConfiguration" ] (fun tag _ ->
      match tag with
      | "HsmConfiguration" ->
          r_hsm_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfiguration"
                 (fun i _ -> hsm_configuration_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ hsm_configuration = ( ! ) r_hsm_configuration } : create_hsm_configuration_result)

let create_hsm_configuration_message_of_xml i =
  let r_tags = ref None in
  let r_hsm_server_public_certificate = ref None in
  let r_hsm_partition_password = ref None in
  let r_hsm_partition_name = ref None in
  let r_hsm_ip_address = ref None in
  let r_description = ref None in
  let r_hsm_configuration_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "HsmServerPublicCertificate";
      "HsmPartitionPassword";
      "HsmPartitionName";
      "HsmIpAddress";
      "Description";
      "HsmConfigurationIdentifier";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "HsmServerPublicCertificate" ->
          r_hsm_server_public_certificate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmServerPublicCertificate"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmPartitionPassword" ->
          r_hsm_partition_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmPartitionPassword"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmPartitionName" ->
          r_hsm_partition_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmPartitionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmIpAddress" ->
          r_hsm_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmIpAddress" (fun i _ -> string__of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     hsm_server_public_certificate =
       Smaws_Lib.Xml.Parse.required "HsmServerPublicCertificate"
         (( ! ) r_hsm_server_public_certificate)
         i;
     hsm_partition_password =
       Smaws_Lib.Xml.Parse.required "HsmPartitionPassword" (( ! ) r_hsm_partition_password) i;
     hsm_partition_name =
       Smaws_Lib.Xml.Parse.required "HsmPartitionName" (( ! ) r_hsm_partition_name) i;
     hsm_ip_address = Smaws_Lib.Xml.Parse.required "HsmIpAddress" (( ! ) r_hsm_ip_address) i;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     hsm_configuration_identifier =
       Smaws_Lib.Xml.Parse.required "HsmConfigurationIdentifier"
         (( ! ) r_hsm_configuration_identifier)
         i;
   }
    : create_hsm_configuration_message)

let hsm_client_certificate_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : hsm_client_certificate_quota_exceeded_fault)

let hsm_client_certificate_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : hsm_client_certificate_already_exists_fault)

let create_hsm_client_certificate_result_of_xml i =
  let r_hsm_client_certificate = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HsmClientCertificate" ] (fun tag _ ->
      match tag with
      | "HsmClientCertificate" ->
          r_hsm_client_certificate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificate"
                 (fun i _ -> hsm_client_certificate_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ hsm_client_certificate = ( ! ) r_hsm_client_certificate }
    : create_hsm_client_certificate_result)

let create_hsm_client_certificate_message_of_xml i =
  let r_tags = ref None in
  let r_hsm_client_certificate_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "HsmClientCertificateIdentifier" ]
    (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     hsm_client_certificate_identifier =
       Smaws_Lib.Xml.Parse.required "HsmClientCertificateIdentifier"
         (( ! ) r_hsm_client_certificate_identifier)
         i;
   }
    : create_hsm_client_certificate_message)

let event_subscription_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : event_subscription_quota_exceeded_fault)

let create_event_subscription_result_of_xml i =
  let r_event_subscription = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EventSubscription" ] (fun tag _ ->
      match tag with
      | "EventSubscription" ->
          r_event_subscription :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventSubscription"
                 (fun i _ -> event_subscription_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ event_subscription = ( ! ) r_event_subscription } : create_event_subscription_result)

let create_event_subscription_message_of_xml i =
  let r_tags = ref None in
  let r_enabled = ref None in
  let r_severity = ref None in
  let r_event_categories = ref None in
  let r_source_ids = ref None in
  let r_source_type = ref None in
  let r_sns_topic_arn = ref None in
  let r_subscription_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "Enabled";
      "Severity";
      "EventCategories";
      "SourceIds";
      "SourceType";
      "SnsTopicArn";
      "SubscriptionName";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Severity" ->
          r_severity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Severity" (fun i _ -> string__of_xml i) ())
      | "EventCategories" ->
          r_event_categories :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategories"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SourceIds" ->
          r_source_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SourceId" (fun i _ -> string__of_xml i) ())
                 ())
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | "SnsTopicArn" ->
          r_sns_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnsTopicArn" (fun i _ -> string__of_xml i) ())
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     enabled = ( ! ) r_enabled;
     severity = ( ! ) r_severity;
     event_categories = ( ! ) r_event_categories;
     source_ids = ( ! ) r_source_ids;
     source_type = ( ! ) r_source_type;
     sns_topic_arn = Smaws_Lib.Xml.Parse.required "SnsTopicArn" (( ! ) r_sns_topic_arn) i;
     subscription_name =
       Smaws_Lib.Xml.Parse.required "SubscriptionName" (( ! ) r_subscription_name) i;
   }
    : create_event_subscription_message)

let endpoints_per_cluster_limit_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : endpoints_per_cluster_limit_exceeded_fault)

let endpoints_per_authorization_limit_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : endpoints_per_authorization_limit_exceeded_fault)

let endpoint_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : endpoint_already_exists_fault)

let access_to_cluster_denied_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : access_to_cluster_denied_fault)

let create_endpoint_access_message_of_xml i =
  let r_vpc_security_group_ids = ref None in
  let r_subnet_group_name = ref None in
  let r_endpoint_name = ref None in
  let r_resource_owner = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "VpcSecurityGroupIds"; "SubnetGroupName"; "EndpointName"; "ResourceOwner"; "ClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SubnetGroupName" ->
          r_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EndpointName" ->
          r_endpoint_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointName" (fun i _ -> string__of_xml i) ())
      | "ResourceOwner" ->
          r_resource_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceOwner" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     subnet_group_name =
       Smaws_Lib.Xml.Parse.required "SubnetGroupName" (( ! ) r_subnet_group_name) i;
     endpoint_name = Smaws_Lib.Xml.Parse.required "EndpointName" (( ! ) r_endpoint_name) i;
     resource_owner = ( ! ) r_resource_owner;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : create_endpoint_access_message)

let create_custom_domain_association_result_of_xml i =
  let r_custom_domain_cert_expiry_time = ref None in
  let r_cluster_identifier = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_custom_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CustomDomainCertExpiryTime";
      "ClusterIdentifier";
      "CustomDomainCertificateArn";
      "CustomDomainName";
    ] (fun tag _ ->
      match tag with
      | "CustomDomainCertExpiryTime" ->
          r_custom_domain_cert_expiry_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertExpiryTime"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> custom_domain_certificate_arn_string_of_xml i)
                 ())
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_domain_cert_expiry_time = ( ! ) r_custom_domain_cert_expiry_time;
     cluster_identifier = ( ! ) r_cluster_identifier;
     custom_domain_certificate_arn = ( ! ) r_custom_domain_certificate_arn;
     custom_domain_name = ( ! ) r_custom_domain_name;
   }
    : create_custom_domain_association_result)

let create_custom_domain_association_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_custom_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "CustomDomainCertificateArn"; "CustomDomainName" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> custom_domain_certificate_arn_string_of_xml i)
                 ())
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     custom_domain_certificate_arn =
       Smaws_Lib.Xml.Parse.required "CustomDomainCertificateArn"
         (( ! ) r_custom_domain_certificate_arn)
         i;
     custom_domain_name =
       Smaws_Lib.Xml.Parse.required "CustomDomainName" (( ! ) r_custom_domain_name) i;
   }
    : create_custom_domain_association_message)

let cluster_subnet_group_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_subnet_group_quota_exceeded_fault)

let cluster_subnet_group_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_subnet_group_already_exists_fault)

let create_cluster_subnet_group_result_of_xml i =
  let r_cluster_subnet_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterSubnetGroup" ] (fun tag _ ->
      match tag with
      | "ClusterSubnetGroup" ->
          r_cluster_subnet_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroup"
                 (fun i _ -> cluster_subnet_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_subnet_group = ( ! ) r_cluster_subnet_group } : create_cluster_subnet_group_result)

let create_cluster_subnet_group_message_of_xml i =
  let r_tags = ref None in
  let r_subnet_ids = ref None in
  let r_description = ref None in
  let r_cluster_subnet_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "SubnetIds"; "Description"; "ClusterSubnetGroupName" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "SubnetIds" ->
          r_subnet_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SubnetIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     subnet_ids = Smaws_Lib.Xml.Parse.required "SubnetIds" (( ! ) r_subnet_ids) i;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     cluster_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSubnetGroupName" (( ! ) r_cluster_subnet_group_name) i;
   }
    : create_cluster_subnet_group_message)

let create_cluster_snapshot_result_of_xml i =
  let r_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Snapshot" ] (fun tag _ ->
      match tag with
      | "Snapshot" ->
          r_snapshot :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot = ( ! ) r_snapshot } : create_cluster_snapshot_result)

let create_cluster_snapshot_message_of_xml i =
  let r_tags = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_cluster_identifier = ref None in
  let r_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "ManualSnapshotRetentionPeriod"; "ClusterIdentifier"; "SnapshotIdentifier" ]
    (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifier" (( ! ) r_snapshot_identifier) i;
   }
    : create_cluster_snapshot_message)

let cluster_security_group_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_security_group_quota_exceeded_fault)

let cluster_security_group_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_security_group_already_exists_fault)

let create_cluster_security_group_result_of_xml i =
  let r_cluster_security_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterSecurityGroup" ] (fun tag _ ->
      match tag with
      | "ClusterSecurityGroup" ->
          r_cluster_security_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroup"
                 (fun i _ -> cluster_security_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_security_group = ( ! ) r_cluster_security_group }
    : create_cluster_security_group_result)

let create_cluster_security_group_message_of_xml i =
  let r_tags = ref None in
  let r_description = ref None in
  let r_cluster_security_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "Description"; "ClusterSecurityGroupName" ]
    (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     cluster_security_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSecurityGroupName"
         (( ! ) r_cluster_security_group_name)
         i;
   }
    : create_cluster_security_group_message)

let cluster_parameter_group_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_parameter_group_quota_exceeded_fault)

let cluster_parameter_group_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cluster_parameter_group_already_exists_fault)

let create_cluster_parameter_group_result_of_xml i =
  let r_cluster_parameter_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterParameterGroup" ] (fun tag _ ->
      match tag with
      | "ClusterParameterGroup" ->
          r_cluster_parameter_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroup"
                 (fun i _ -> cluster_parameter_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_parameter_group = ( ! ) r_cluster_parameter_group }
    : create_cluster_parameter_group_result)

let create_cluster_parameter_group_message_of_xml i =
  let r_tags = ref None in
  let r_description = ref None in
  let r_parameter_group_family = ref None in
  let r_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "Description"; "ParameterGroupFamily"; "ParameterGroupName" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "ParameterGroupFamily" ->
          r_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     parameter_group_family =
       Smaws_Lib.Xml.Parse.required "ParameterGroupFamily" (( ! ) r_parameter_group_family) i;
     parameter_group_name =
       Smaws_Lib.Xml.Parse.required "ParameterGroupName" (( ! ) r_parameter_group_name) i;
   }
    : create_cluster_parameter_group_message)

let create_cluster_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : create_cluster_result)

let create_cluster_message_of_xml i =
  let r_extra_compute_for_automatic_optimization = ref None in
  let r_catalog_name = ref None in
  let r_redshift_idc_application_arn = ref None in
  let r_multi_a_z = ref None in
  let r_ip_address_type = ref None in
  let r_master_password_secret_kms_key_id = ref None in
  let r_manage_master_password = ref None in
  let r_load_sample_data = ref None in
  let r_default_iam_role_arn = ref None in
  let r_aqua_configuration_status = ref None in
  let r_availability_zone_relocation = ref None in
  let r_snapshot_schedule_identifier = ref None in
  let r_maintenance_track_name = ref None in
  let r_iam_roles = ref None in
  let r_additional_info = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_kms_key_id = ref None in
  let r_tags = ref None in
  let r_elastic_ip = ref None in
  let r_hsm_configuration_identifier = ref None in
  let r_hsm_client_certificate_identifier = ref None in
  let r_encrypted = ref None in
  let r_publicly_accessible = ref None in
  let r_number_of_nodes = ref None in
  let r_allow_version_upgrade = ref None in
  let r_cluster_version = ref None in
  let r_port = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_automated_snapshot_retention_period = ref None in
  let r_cluster_parameter_group_name = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_availability_zone = ref None in
  let r_cluster_subnet_group_name = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_cluster_security_groups = ref None in
  let r_master_user_password = ref None in
  let r_master_username = ref None in
  let r_node_type = ref None in
  let r_cluster_type = ref None in
  let r_cluster_identifier = ref None in
  let r_db_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ExtraComputeForAutomaticOptimization";
      "CatalogName";
      "RedshiftIdcApplicationArn";
      "MultiAZ";
      "IpAddressType";
      "MasterPasswordSecretKmsKeyId";
      "ManageMasterPassword";
      "LoadSampleData";
      "DefaultIamRoleArn";
      "AquaConfigurationStatus";
      "AvailabilityZoneRelocation";
      "SnapshotScheduleIdentifier";
      "MaintenanceTrackName";
      "IamRoles";
      "AdditionalInfo";
      "EnhancedVpcRouting";
      "KmsKeyId";
      "Tags";
      "ElasticIp";
      "HsmConfigurationIdentifier";
      "HsmClientCertificateIdentifier";
      "Encrypted";
      "PubliclyAccessible";
      "NumberOfNodes";
      "AllowVersionUpgrade";
      "ClusterVersion";
      "Port";
      "ManualSnapshotRetentionPeriod";
      "AutomatedSnapshotRetentionPeriod";
      "ClusterParameterGroupName";
      "PreferredMaintenanceWindow";
      "AvailabilityZone";
      "ClusterSubnetGroupName";
      "VpcSecurityGroupIds";
      "ClusterSecurityGroups";
      "MasterUserPassword";
      "MasterUsername";
      "NodeType";
      "ClusterType";
      "ClusterIdentifier";
      "DBName";
    ] (fun tag _ ->
      match tag with
      | "ExtraComputeForAutomaticOptimization" ->
          r_extra_compute_for_automatic_optimization :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtraComputeForAutomaticOptimization"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "CatalogName" ->
          r_catalog_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CatalogName"
                 (fun i _ -> catalog_name_string_of_xml i)
                 ())
      | "RedshiftIdcApplicationArn" ->
          r_redshift_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType" (fun i _ -> string__of_xml i) ())
      | "MasterPasswordSecretKmsKeyId" ->
          r_master_password_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ManageMasterPassword" ->
          r_manage_master_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManageMasterPassword"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "LoadSampleData" ->
          r_load_sample_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadSampleData"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DefaultIamRoleArn" ->
          r_default_iam_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultIamRoleArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AquaConfigurationStatus" ->
          r_aqua_configuration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaConfigurationStatus"
                 (fun i _ -> aqua_configuration_status_of_xml i)
                 ())
      | "AvailabilityZoneRelocation" ->
          r_availability_zone_relocation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneRelocation"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "SnapshotScheduleIdentifier" ->
          r_snapshot_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IamRoles" ->
          r_iam_roles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IamRoles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "IamRoleArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "AdditionalInfo" ->
          r_additional_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdditionalInfo"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ElasticIp" ->
          r_elastic_ip :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticIp" (fun i _ -> string__of_xml i) ())
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Encrypted" ->
          r_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "AllowVersionUpgrade" ->
          r_allow_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "AutomatedSnapshotRetentionPeriod" ->
          r_automated_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomatedSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterParameterGroupName" ->
          r_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ClusterSecurityGroups" ->
          r_cluster_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroupName"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "MasterUserPassword" ->
          r_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserPassword"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | "MasterUsername" ->
          r_master_username :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUsername"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "ClusterType" ->
          r_cluster_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterType" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBName" ->
          r_db_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DBName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     extra_compute_for_automatic_optimization = ( ! ) r_extra_compute_for_automatic_optimization;
     catalog_name = ( ! ) r_catalog_name;
     redshift_idc_application_arn = ( ! ) r_redshift_idc_application_arn;
     multi_a_z = ( ! ) r_multi_a_z;
     ip_address_type = ( ! ) r_ip_address_type;
     master_password_secret_kms_key_id = ( ! ) r_master_password_secret_kms_key_id;
     manage_master_password = ( ! ) r_manage_master_password;
     load_sample_data = ( ! ) r_load_sample_data;
     default_iam_role_arn = ( ! ) r_default_iam_role_arn;
     aqua_configuration_status = ( ! ) r_aqua_configuration_status;
     availability_zone_relocation = ( ! ) r_availability_zone_relocation;
     snapshot_schedule_identifier = ( ! ) r_snapshot_schedule_identifier;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     iam_roles = ( ! ) r_iam_roles;
     additional_info = ( ! ) r_additional_info;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     kms_key_id = ( ! ) r_kms_key_id;
     tags = ( ! ) r_tags;
     elastic_ip = ( ! ) r_elastic_ip;
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
     encrypted = ( ! ) r_encrypted;
     publicly_accessible = ( ! ) r_publicly_accessible;
     number_of_nodes = ( ! ) r_number_of_nodes;
     allow_version_upgrade = ( ! ) r_allow_version_upgrade;
     cluster_version = ( ! ) r_cluster_version;
     port = ( ! ) r_port;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     automated_snapshot_retention_period = ( ! ) r_automated_snapshot_retention_period;
     cluster_parameter_group_name = ( ! ) r_cluster_parameter_group_name;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     availability_zone = ( ! ) r_availability_zone;
     cluster_subnet_group_name = ( ! ) r_cluster_subnet_group_name;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     cluster_security_groups = ( ! ) r_cluster_security_groups;
     master_user_password = ( ! ) r_master_user_password;
     master_username = Smaws_Lib.Xml.Parse.required "MasterUsername" (( ! ) r_master_username) i;
     node_type = Smaws_Lib.Xml.Parse.required "NodeType" (( ! ) r_node_type) i;
     cluster_type = ( ! ) r_cluster_type;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     db_name = ( ! ) r_db_name;
   }
    : create_cluster_message)

let authentication_profile_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : authentication_profile_already_exists_fault)

let create_authentication_profile_result_of_xml i =
  let r_authentication_profile_content = ref None in
  let r_authentication_profile_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AuthenticationProfileContent"; "AuthenticationProfileName" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileContent" ->
          r_authentication_profile_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileContent"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authentication_profile_content = ( ! ) r_authentication_profile_content;
     authentication_profile_name = ( ! ) r_authentication_profile_name;
   }
    : create_authentication_profile_result)

let create_authentication_profile_message_of_xml i =
  let r_authentication_profile_content = ref None in
  let r_authentication_profile_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AuthenticationProfileContent"; "AuthenticationProfileName" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileContent" ->
          r_authentication_profile_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileContent"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authentication_profile_content =
       Smaws_Lib.Xml.Parse.required "AuthenticationProfileContent"
         (( ! ) r_authentication_profile_content)
         i;
     authentication_profile_name =
       Smaws_Lib.Xml.Parse.required "AuthenticationProfileName"
         (( ! ) r_authentication_profile_name)
         i;
   }
    : create_authentication_profile_message)

let copy_cluster_snapshot_result_of_xml i =
  let r_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Snapshot" ] (fun tag _ ->
      match tag with
      | "Snapshot" ->
          r_snapshot :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot = ( ! ) r_snapshot } : copy_cluster_snapshot_result)

let copy_cluster_snapshot_message_of_xml i =
  let r_manual_snapshot_retention_period = ref None in
  let r_target_snapshot_identifier = ref None in
  let r_source_snapshot_cluster_identifier = ref None in
  let r_source_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ManualSnapshotRetentionPeriod";
      "TargetSnapshotIdentifier";
      "SourceSnapshotClusterIdentifier";
      "SourceSnapshotIdentifier";
    ] (fun tag _ ->
      match tag with
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "TargetSnapshotIdentifier" ->
          r_target_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceSnapshotClusterIdentifier" ->
          r_source_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceSnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceSnapshotIdentifier" ->
          r_source_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     target_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "TargetSnapshotIdentifier"
         (( ! ) r_target_snapshot_identifier)
         i;
     source_snapshot_cluster_identifier = ( ! ) r_source_snapshot_cluster_identifier;
     source_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SourceSnapshotIdentifier"
         (( ! ) r_source_snapshot_identifier)
         i;
   }
    : copy_cluster_snapshot_message)

let cancel_resize_message_of_xml i =
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : cancel_resize_message)

let batch_modify_cluster_snapshots_limit_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : batch_modify_cluster_snapshots_limit_exceeded_fault)

let batch_snapshot_operation_errors_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotErrorMessage"
    (fun i _ -> snapshot_error_message_of_xml i)
    ()

let batch_modify_cluster_snapshots_output_message_of_xml i =
  let r_errors = ref None in
  let r_resources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Errors"; "Resources" ] (fun tag _ ->
      match tag with
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotErrorMessage"
                     (fun i _ -> snapshot_error_message_of_xml i)
                     ())
                 ())
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "String" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ errors = ( ! ) r_errors; resources = ( ! ) r_resources }
    : batch_modify_cluster_snapshots_output_message)

let batch_modify_cluster_snapshots_message_of_xml i =
  let r_force = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_snapshot_identifier_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Force"; "ManualSnapshotRetentionPeriod"; "SnapshotIdentifierList" ] (fun tag _ ->
      match tag with
      | "Force" ->
          r_force :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Force" (fun i _ -> boolean__of_xml i) ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotIdentifierList" ->
          r_snapshot_identifier_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifierList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "String" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     force = ( ! ) r_force;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     snapshot_identifier_list =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifierList" (( ! ) r_snapshot_identifier_list) i;
   }
    : batch_modify_cluster_snapshots_message)

let batch_delete_request_size_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : batch_delete_request_size_exceeded_fault)

let batch_snapshot_operation_error_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotErrorMessage"
    (fun i _ -> snapshot_error_message_of_xml i)
    ()

let batch_delete_cluster_snapshots_result_of_xml i =
  let r_errors = ref None in
  let r_resources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Errors"; "Resources" ] (fun tag _ ->
      match tag with
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotErrorMessage"
                     (fun i _ -> snapshot_error_message_of_xml i)
                     ())
                 ())
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "String" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ errors = ( ! ) r_errors; resources = ( ! ) r_resources }
    : batch_delete_cluster_snapshots_result)

let delete_cluster_snapshot_message_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DeleteClusterSnapshotMessage"
    (fun i _ -> delete_cluster_snapshot_message_of_xml i)
    ()

let batch_delete_cluster_snapshots_request_of_xml i =
  let r_identifiers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Identifiers" ] (fun tag _ ->
      match tag with
      | "Identifiers" ->
          r_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Identifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DeleteClusterSnapshotMessage"
                     (fun i _ -> delete_cluster_snapshot_message_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ identifiers = Smaws_Lib.Xml.Parse.required "Identifiers" (( ! ) r_identifiers) i }
    : batch_delete_cluster_snapshots_request)

let authorization_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : authorization_quota_exceeded_fault)

let authorization_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : authorization_already_exists_fault)

let authorize_snapshot_access_result_of_xml i =
  let r_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Snapshot" ] (fun tag _ ->
      match tag with
      | "Snapshot" ->
          r_snapshot :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot = ( ! ) r_snapshot } : authorize_snapshot_access_result)

let authorize_snapshot_access_message_of_xml i =
  let r_account_with_restore_access = ref None in
  let r_snapshot_cluster_identifier = ref None in
  let r_snapshot_arn = ref None in
  let r_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AccountWithRestoreAccess"; "SnapshotClusterIdentifier"; "SnapshotArn"; "SnapshotIdentifier" ]
    (fun tag _ ->
      match tag with
      | "AccountWithRestoreAccess" ->
          r_account_with_restore_access :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountWithRestoreAccess"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotClusterIdentifier" ->
          r_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     account_with_restore_access =
       Smaws_Lib.Xml.Parse.required "AccountWithRestoreAccess"
         (( ! ) r_account_with_restore_access)
         i;
     snapshot_cluster_identifier = ( ! ) r_snapshot_cluster_identifier;
     snapshot_arn = ( ! ) r_snapshot_arn;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
   }
    : authorize_snapshot_access_message)

let endpoint_authorizations_per_cluster_limit_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : endpoint_authorizations_per_cluster_limit_exceeded_fault)

let endpoint_authorization_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : endpoint_authorization_already_exists_fault)

let authorize_endpoint_access_message_of_xml i =
  let r_vpc_ids = ref None in
  let r_account = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VpcIds"; "Account"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "VpcIds" ->
          r_vpc_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     vpc_ids = ( ! ) r_vpc_ids;
     account = Smaws_Lib.Xml.Parse.required "Account" (( ! ) r_account) i;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : authorize_endpoint_access_message)

let authorize_data_share_message_of_xml i =
  let r_allow_writes = ref None in
  let r_consumer_identifier = ref None in
  let r_data_share_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AllowWrites"; "ConsumerIdentifier"; "DataShareArn" ] (fun tag _ ->
      match tag with
      | "AllowWrites" ->
          r_allow_writes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowWrites"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ConsumerIdentifier" ->
          r_consumer_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     allow_writes = ( ! ) r_allow_writes;
     consumer_identifier =
       Smaws_Lib.Xml.Parse.required "ConsumerIdentifier" (( ! ) r_consumer_identifier) i;
     data_share_arn = Smaws_Lib.Xml.Parse.required "DataShareArn" (( ! ) r_data_share_arn) i;
   }
    : authorize_data_share_message)

let authorize_cluster_security_group_ingress_result_of_xml i =
  let r_cluster_security_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterSecurityGroup" ] (fun tag _ ->
      match tag with
      | "ClusterSecurityGroup" ->
          r_cluster_security_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroup"
                 (fun i _ -> cluster_security_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_security_group = ( ! ) r_cluster_security_group }
    : authorize_cluster_security_group_ingress_result)

let authorize_cluster_security_group_ingress_message_of_xml i =
  let r_ec2_security_group_owner_id = ref None in
  let r_ec2_security_group_name = ref None in
  let r_cidri_p = ref None in
  let r_cluster_security_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EC2SecurityGroupOwnerId"; "EC2SecurityGroupName"; "CIDRIP"; "ClusterSecurityGroupName" ]
    (fun tag _ ->
      match tag with
      | "EC2SecurityGroupOwnerId" ->
          r_ec2_security_group_owner_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupOwnerId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EC2SecurityGroupName" ->
          r_ec2_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CIDRIP" ->
          r_cidri_p :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CIDRIP" (fun i _ -> string__of_xml i) ())
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     ec2_security_group_owner_id = ( ! ) r_ec2_security_group_owner_id;
     ec2_security_group_name = ( ! ) r_ec2_security_group_name;
     cidri_p = ( ! ) r_cidri_p;
     cluster_security_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSecurityGroupName"
         (( ! ) r_cluster_security_group_name)
         i;
   }
    : authorize_cluster_security_group_ingress_message)

let associate_data_share_consumer_message_of_xml i =
  let r_allow_writes = ref None in
  let r_consumer_region = ref None in
  let r_consumer_arn = ref None in
  let r_associate_entire_account = ref None in
  let r_data_share_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AllowWrites"; "ConsumerRegion"; "ConsumerArn"; "AssociateEntireAccount"; "DataShareArn" ]
    (fun tag _ ->
      match tag with
      | "AllowWrites" ->
          r_allow_writes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowWrites"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ConsumerRegion" ->
          r_consumer_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ConsumerArn" ->
          r_consumer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerArn" (fun i _ -> string__of_xml i) ())
      | "AssociateEntireAccount" ->
          r_associate_entire_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociateEntireAccount"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     allow_writes = ( ! ) r_allow_writes;
     consumer_region = ( ! ) r_consumer_region;
     consumer_arn = ( ! ) r_consumer_arn;
     associate_entire_account = ( ! ) r_associate_entire_account;
     data_share_arn = Smaws_Lib.Xml.Parse.required "DataShareArn" (( ! ) r_data_share_arn) i;
   }
    : associate_data_share_consumer_message)

let accept_reserved_node_exchange_output_message_of_xml i =
  let r_exchanged_reserved_node = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ExchangedReservedNode" ] (fun tag _ ->
      match tag with
      | "ExchangedReservedNode" ->
          r_exchanged_reserved_node :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExchangedReservedNode"
                 (fun i _ -> reserved_node_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ exchanged_reserved_node = ( ! ) r_exchanged_reserved_node }
    : accept_reserved_node_exchange_output_message)

let accept_reserved_node_exchange_input_message_of_xml i =
  let r_target_reserved_node_offering_id = ref None in
  let r_reserved_node_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TargetReservedNodeOfferingId"; "ReservedNodeId" ]
    (fun tag _ ->
      match tag with
      | "TargetReservedNodeOfferingId" ->
          r_target_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_reserved_node_offering_id =
       Smaws_Lib.Xml.Parse.required "TargetReservedNodeOfferingId"
         (( ! ) r_target_reserved_node_offering_id)
         i;
     reserved_node_id = Smaws_Lib.Xml.Parse.required "ReservedNodeId" (( ! ) r_reserved_node_id) i;
   }
    : accept_reserved_node_exchange_input_message)
