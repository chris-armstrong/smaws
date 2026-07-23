open Types

let unit_of_xml _ = ()
let exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let api_call_rate_for_customer_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : api_call_rate_for_customer_exceeded_fault)

let az_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "single-az" -> SINGLE_AZ
   | "cross-az" -> CROSS_AZ
   | _ -> failwith "unknown enum value"
    : az_mode)

let access_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let user_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : user_not_found_fault)

let user_group_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : user_group_not_found_fault)

let tag_quota_per_resource_exceeded_of_xml i =
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
  ({ message = ( ! ) r_message } : tag_quota_per_resource_exceeded)

let snapshot_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : snapshot_not_found_fault)

let serverless_cache_snapshot_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : serverless_cache_snapshot_not_found_fault)

let serverless_cache_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : serverless_cache_not_found_fault)

let reserved_cache_node_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : reserved_cache_node_not_found_fault)

let replication_group_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : replication_group_not_found_fault)

let invalid_serverless_cache_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_serverless_cache_state_fault)

let invalid_serverless_cache_snapshot_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_serverless_cache_snapshot_state_fault)

let invalid_replication_group_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_replication_group_state_fault)

let invalid_arn_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_arn_fault)

let cache_subnet_group_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_subnet_group_not_found_fault)

let cache_security_group_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_security_group_not_found_fault)

let cache_parameter_group_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_parameter_group_not_found_fault)

let cache_cluster_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_cluster_not_found_fault)

let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_of_xml i =
  let r_key = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Key"; "Value" ] (fun tag _ ->
      match tag with
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> string__of_xml i) ())
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ key = ( ! ) r_key; value = ( ! ) r_value } : tag)

let tag_list_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ()

let tag_list_message_of_xml i =
  let r_tag_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TagList" ] (fun tag _ ->
      match tag with
      | "TagList" ->
          r_tag_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tag_list = ( ! ) r_tag_list } : tag_list_message)

let add_tags_to_resource_message_of_xml i =
  let r_resource_name = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceName"; "Tags" ] (fun tag _ ->
      match tag with
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName" (fun i _ -> string__of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_name = Smaws_Lib.Xml.Parse.required "ResourceName" (( ! ) r_resource_name) i;
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
   }
    : add_tags_to_resource_message)

let allowed_node_group_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let node_type_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let allowed_node_type_modifications_message_of_xml i =
  let r_scale_up_modifications = ref None in
  let r_scale_down_modifications = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScaleUpModifications"; "ScaleDownModifications" ]
    (fun tag _ ->
      match tag with
      | "ScaleUpModifications" ->
          r_scale_up_modifications :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScaleUpModifications"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "ScaleDownModifications" ->
          r_scale_down_modifications :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScaleDownModifications"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scale_up_modifications = ( ! ) r_scale_up_modifications;
     scale_down_modifications = ( ! ) r_scale_down_modifications;
   }
    : allowed_node_type_modifications_message)

let replication_group_already_under_migration_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : replication_group_already_under_migration_fault)

let aws_query_error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let invalid_parameter_value_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> aws_query_error_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_parameter_value_exception)

let effective_durability_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "async" -> ASYNC
   | "sync" -> SYNC
   | "disabled" -> DISABLED
   | _ -> failwith "unknown enum value"
    : effective_durability)

let durability_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "default" -> DEFAULT
   | "async" -> ASYNC
   | "sync" -> SYNC
   | "disabled" -> DISABLED
   | _ -> failwith "unknown enum value"
    : durability)

let cluster_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "enabled" -> ENABLED
   | "disabled" -> DISABLED
   | "compatible" -> COMPATIBLE
   | _ -> failwith "unknown enum value"
    : cluster_mode)

let transit_encryption_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "preferred" -> PREFERRED
   | "required" -> REQUIRED
   | _ -> failwith "unknown enum value"
    : transit_encryption_mode)

let ip_discovery_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "ipv4" -> IPV4 | "ipv6" -> IPV6 | _ -> failwith "unknown enum value"
    : ip_discovery)

let network_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ipv4" -> IPV4
   | "ipv6" -> IPV6
   | "dual_stack" -> DUAL_STACK
   | _ -> failwith "unknown enum value"
    : network_type)

let boolean__of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let data_tiering_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "enabled" -> ENABLED | "disabled" -> DISABLED | _ -> failwith "unknown enum value"
    : data_tiering_status)

let t_stamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let log_delivery_configuration_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "active" -> ACTIVE
   | "enabling" -> ENABLING
   | "modifying" -> MODIFYING
   | "disabling" -> DISABLING
   | "error" -> ERROR
   | _ -> failwith "unknown enum value"
    : log_delivery_configuration_status)

let log_format_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "text" -> TEXT | "json" -> JSON | _ -> failwith "unknown enum value" : log_format)

let kinesis_firehose_destination_details_of_xml i =
  let r_delivery_stream = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DeliveryStream" ] (fun tag _ ->
      match tag with
      | "DeliveryStream" ->
          r_delivery_stream :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeliveryStream"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ delivery_stream = ( ! ) r_delivery_stream } : kinesis_firehose_destination_details)

let cloud_watch_logs_destination_details_of_xml i =
  let r_log_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LogGroup" ] (fun tag _ ->
      match tag with
      | "LogGroup" ->
          r_log_group :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "LogGroup" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ log_group = ( ! ) r_log_group } : cloud_watch_logs_destination_details)

let destination_details_of_xml i =
  let r_cloud_watch_logs_details = ref None in
  let r_kinesis_firehose_details = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CloudWatchLogsDetails"; "KinesisFirehoseDetails" ]
    (fun tag _ ->
      match tag with
      | "CloudWatchLogsDetails" ->
          r_cloud_watch_logs_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CloudWatchLogsDetails"
                 (fun i _ -> cloud_watch_logs_destination_details_of_xml i)
                 ())
      | "KinesisFirehoseDetails" ->
          r_kinesis_firehose_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KinesisFirehoseDetails"
                 (fun i _ -> kinesis_firehose_destination_details_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cloud_watch_logs_details = ( ! ) r_cloud_watch_logs_details;
     kinesis_firehose_details = ( ! ) r_kinesis_firehose_details;
   }
    : destination_details)

let destination_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "cloudwatch-logs" -> CloudWatchLogs
   | "kinesis-firehose" -> KinesisFirehose
   | _ -> failwith "unknown enum value"
    : destination_type)

let log_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "slow-log" -> SLOW_LOG
   | "engine-log" -> ENGINE_LOG
   | _ -> failwith "unknown enum value"
    : log_type)

let log_delivery_configuration_of_xml i =
  let r_log_type = ref None in
  let r_destination_type = ref None in
  let r_destination_details = ref None in
  let r_log_format = ref None in
  let r_status = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LogType"; "DestinationType"; "DestinationDetails"; "LogFormat"; "Status"; "Message" ]
    (fun tag _ ->
      match tag with
      | "LogType" ->
          r_log_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "LogType" (fun i _ -> log_type_of_xml i) ())
      | "DestinationType" ->
          r_destination_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationType"
                 (fun i _ -> destination_type_of_xml i)
                 ())
      | "DestinationDetails" ->
          r_destination_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationDetails"
                 (fun i _ -> destination_details_of_xml i)
                 ())
      | "LogFormat" ->
          r_log_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogFormat" (fun i _ -> log_format_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> log_delivery_configuration_status_of_xml i)
                 ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     log_type = ( ! ) r_log_type;
     destination_type = ( ! ) r_destination_type;
     destination_details = ( ! ) r_destination_details;
     log_format = ( ! ) r_log_format;
     status = ( ! ) r_status;
     message = ( ! ) r_message;
   }
    : log_delivery_configuration)

let log_delivery_configuration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "LogDeliveryConfiguration"
    (fun i _ -> log_delivery_configuration_of_xml i)
    ()

let user_group_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let user_group_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_group_id_of_xml i) ()

let storage_encryption_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "none" -> NONE
   | "sse-elasticache" -> SSE_ELASTICACHE
   | "sse-kms" -> SSE_KMS
   | _ -> failwith "unknown enum value"
    : storage_encryption_type)

let replication_group_outpost_arn_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReplicationGroupOutpostArn" (fun i _ -> string__of_xml i) ()

let boolean_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let integer_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let endpoint_of_xml i =
  let r_address = ref None in
  let r_port = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Address"; "Port" ] (fun tag _ ->
      match tag with
      | "Address" ->
          r_address :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Address" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ address = ( ! ) r_address; port = ( ! ) r_port } : endpoint)

let multi_az_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "enabled" -> ENABLED | "disabled" -> DISABLED | _ -> failwith "unknown enum value"
    : multi_az_status)

let automatic_failover_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "enabled" -> ENABLED
   | "disabled" -> DISABLED
   | "enabling" -> ENABLING
   | "disabling" -> DISABLING
   | _ -> failwith "unknown enum value"
    : automatic_failover_status)

let node_group_member_of_xml i =
  let r_cache_cluster_id = ref None in
  let r_cache_node_id = ref None in
  let r_read_endpoint = ref None in
  let r_preferred_availability_zone = ref None in
  let r_preferred_outpost_arn = ref None in
  let r_current_role = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CacheClusterId";
      "CacheNodeId";
      "ReadEndpoint";
      "PreferredAvailabilityZone";
      "PreferredOutpostArn";
      "CurrentRole";
    ] (fun tag _ ->
      match tag with
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeId" ->
          r_cache_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeId" (fun i _ -> string__of_xml i) ())
      | "ReadEndpoint" ->
          r_read_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReadEndpoint" (fun i _ -> endpoint_of_xml i) ())
      | "PreferredAvailabilityZone" ->
          r_preferred_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredAvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredOutpostArn" ->
          r_preferred_outpost_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredOutpostArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CurrentRole" ->
          r_current_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentRole" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     cache_node_id = ( ! ) r_cache_node_id;
     read_endpoint = ( ! ) r_read_endpoint;
     preferred_availability_zone = ( ! ) r_preferred_availability_zone;
     preferred_outpost_arn = ( ! ) r_preferred_outpost_arn;
     current_role = ( ! ) r_current_role;
   }
    : node_group_member)

let node_group_member_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupMember" (fun i _ -> node_group_member_of_xml i) ()

let node_group_of_xml i =
  let r_node_group_id = ref None in
  let r_status = ref None in
  let r_primary_endpoint = ref None in
  let r_reader_endpoint = ref None in
  let r_slots = ref None in
  let r_node_group_members = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NodeGroupId"; "Status"; "PrimaryEndpoint"; "ReaderEndpoint"; "Slots"; "NodeGroupMembers" ]
    (fun tag _ ->
      match tag with
      | "NodeGroupId" ->
          r_node_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupId" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "PrimaryEndpoint" ->
          r_primary_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrimaryEndpoint"
                 (fun i _ -> endpoint_of_xml i)
                 ())
      | "ReaderEndpoint" ->
          r_reader_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReaderEndpoint"
                 (fun i _ -> endpoint_of_xml i)
                 ())
      | "Slots" ->
          r_slots :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Slots" (fun i _ -> string__of_xml i) ())
      | "NodeGroupMembers" ->
          r_node_group_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupMember"
                     (fun i _ -> node_group_member_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     node_group_id = ( ! ) r_node_group_id;
     status = ( ! ) r_status;
     primary_endpoint = ( ! ) r_primary_endpoint;
     reader_endpoint = ( ! ) r_reader_endpoint;
     slots = ( ! ) r_slots;
     node_group_members = ( ! ) r_node_group_members;
   }
    : node_group)

let node_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroup" (fun i _ -> node_group_of_xml i) ()

let cluster_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterId" (fun i _ -> string__of_xml i) ()

let pending_log_delivery_configuration_of_xml i =
  let r_log_type = ref None in
  let r_destination_type = ref None in
  let r_destination_details = ref None in
  let r_log_format = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LogType"; "DestinationType"; "DestinationDetails"; "LogFormat" ] (fun tag _ ->
      match tag with
      | "LogType" ->
          r_log_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "LogType" (fun i _ -> log_type_of_xml i) ())
      | "DestinationType" ->
          r_destination_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationType"
                 (fun i _ -> destination_type_of_xml i)
                 ())
      | "DestinationDetails" ->
          r_destination_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationDetails"
                 (fun i _ -> destination_details_of_xml i)
                 ())
      | "LogFormat" ->
          r_log_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogFormat" (fun i _ -> log_format_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     log_type = ( ! ) r_log_type;
     destination_type = ( ! ) r_destination_type;
     destination_details = ( ! ) r_destination_details;
     log_format = ( ! ) r_log_format;
   }
    : pending_log_delivery_configuration)

let pending_log_delivery_configuration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> pending_log_delivery_configuration_of_xml i)
    ()

let user_groups_update_status_of_xml i =
  let r_user_group_ids_to_add = ref None in
  let r_user_group_ids_to_remove = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserGroupIdsToAdd"; "UserGroupIdsToRemove" ]
    (fun tag _ ->
      match tag with
      | "UserGroupIdsToAdd" ->
          r_user_group_ids_to_add :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupIdsToAdd"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> user_group_id_of_xml i)
                     ())
                 ())
      | "UserGroupIdsToRemove" ->
          r_user_group_ids_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupIdsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> user_group_id_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_group_ids_to_add = ( ! ) r_user_group_ids_to_add;
     user_group_ids_to_remove = ( ! ) r_user_group_ids_to_remove;
   }
    : user_groups_update_status)

let auth_token_update_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "SETTING" -> SETTING | "ROTATING" -> ROTATING | _ -> failwith "unknown enum value"
    : auth_token_update_status)

let double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let slot_migration_of_xml i =
  let r_progress_percentage = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ProgressPercentage" ] (fun tag _ ->
      match tag with
      | "ProgressPercentage" ->
          r_progress_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressPercentage"
                 (fun i _ -> double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ progress_percentage = ( ! ) r_progress_percentage } : slot_migration)

let resharding_status_of_xml i =
  let r_slot_migration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SlotMigration" ] (fun tag _ ->
      match tag with
      | "SlotMigration" ->
          r_slot_migration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SlotMigration"
                 (fun i _ -> slot_migration_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ slot_migration = ( ! ) r_slot_migration } : resharding_status)

let pending_automatic_failover_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "enabled" -> ENABLED | "disabled" -> DISABLED | _ -> failwith "unknown enum value"
    : pending_automatic_failover_status)

let replication_group_pending_modified_values_of_xml i =
  let r_primary_cluster_id = ref None in
  let r_automatic_failover_status = ref None in
  let r_resharding = ref None in
  let r_auth_token_status = ref None in
  let r_user_groups = ref None in
  let r_log_delivery_configurations = ref None in
  let r_transit_encryption_enabled = ref None in
  let r_transit_encryption_mode = ref None in
  let r_cluster_mode = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PrimaryClusterId";
      "AutomaticFailoverStatus";
      "Resharding";
      "AuthTokenStatus";
      "UserGroups";
      "LogDeliveryConfigurations";
      "TransitEncryptionEnabled";
      "TransitEncryptionMode";
      "ClusterMode";
    ] (fun tag _ ->
      match tag with
      | "PrimaryClusterId" ->
          r_primary_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrimaryClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutomaticFailoverStatus" ->
          r_automatic_failover_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomaticFailoverStatus"
                 (fun i _ -> pending_automatic_failover_status_of_xml i)
                 ())
      | "Resharding" ->
          r_resharding :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resharding"
                 (fun i _ -> resharding_status_of_xml i)
                 ())
      | "AuthTokenStatus" ->
          r_auth_token_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthTokenStatus"
                 (fun i _ -> auth_token_update_status_of_xml i)
                 ())
      | "UserGroups" ->
          r_user_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroups"
                 (fun i _ -> user_groups_update_status_of_xml i)
                 ())
      | "LogDeliveryConfigurations" ->
          r_log_delivery_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDeliveryConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> pending_log_delivery_configuration_of_xml i)
                     ())
                 ())
      | "TransitEncryptionEnabled" ->
          r_transit_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "TransitEncryptionMode" ->
          r_transit_encryption_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionMode"
                 (fun i _ -> transit_encryption_mode_of_xml i)
                 ())
      | "ClusterMode" ->
          r_cluster_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterMode"
                 (fun i _ -> cluster_mode_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     primary_cluster_id = ( ! ) r_primary_cluster_id;
     automatic_failover_status = ( ! ) r_automatic_failover_status;
     resharding = ( ! ) r_resharding;
     auth_token_status = ( ! ) r_auth_token_status;
     user_groups = ( ! ) r_user_groups;
     log_delivery_configurations = ( ! ) r_log_delivery_configurations;
     transit_encryption_enabled = ( ! ) r_transit_encryption_enabled;
     transit_encryption_mode = ( ! ) r_transit_encryption_mode;
     cluster_mode = ( ! ) r_cluster_mode;
   }
    : replication_group_pending_modified_values)

let global_replication_group_info_of_xml i =
  let r_global_replication_group_id = ref None in
  let r_global_replication_group_member_role = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "GlobalReplicationGroupId"; "GlobalReplicationGroupMemberRole" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroupId" ->
          r_global_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalReplicationGroupMemberRole" ->
          r_global_replication_group_member_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupMemberRole"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_replication_group_id = ( ! ) r_global_replication_group_id;
     global_replication_group_member_role = ( ! ) r_global_replication_group_member_role;
   }
    : global_replication_group_info)

let replication_group_of_xml i =
  let r_replication_group_id = ref None in
  let r_description = ref None in
  let r_global_replication_group_info = ref None in
  let r_status = ref None in
  let r_pending_modified_values = ref None in
  let r_member_clusters = ref None in
  let r_node_groups = ref None in
  let r_snapshotting_cluster_id = ref None in
  let r_automatic_failover = ref None in
  let r_multi_a_z = ref None in
  let r_configuration_endpoint = ref None in
  let r_snapshot_retention_limit = ref None in
  let r_snapshot_window = ref None in
  let r_cluster_enabled = ref None in
  let r_cache_node_type = ref None in
  let r_auth_token_enabled = ref None in
  let r_auth_token_last_modified_date = ref None in
  let r_transit_encryption_enabled = ref None in
  let r_at_rest_encryption_enabled = ref None in
  let r_member_clusters_outpost_arns = ref None in
  let r_kms_key_id = ref None in
  let r_storage_encryption_type = ref None in
  let r_ar_n = ref None in
  let r_user_group_ids = ref None in
  let r_log_delivery_configurations = ref None in
  let r_replication_group_create_time = ref None in
  let r_data_tiering = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_network_type = ref None in
  let r_ip_discovery = ref None in
  let r_transit_encryption_mode = ref None in
  let r_cluster_mode = ref None in
  let r_engine = ref None in
  let r_durability = ref None in
  let r_effective_durability = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReplicationGroupId";
      "Description";
      "GlobalReplicationGroupInfo";
      "Status";
      "PendingModifiedValues";
      "MemberClusters";
      "NodeGroups";
      "SnapshottingClusterId";
      "AutomaticFailover";
      "MultiAZ";
      "ConfigurationEndpoint";
      "SnapshotRetentionLimit";
      "SnapshotWindow";
      "ClusterEnabled";
      "CacheNodeType";
      "AuthTokenEnabled";
      "AuthTokenLastModifiedDate";
      "TransitEncryptionEnabled";
      "AtRestEncryptionEnabled";
      "MemberClustersOutpostArns";
      "KmsKeyId";
      "StorageEncryptionType";
      "ARN";
      "UserGroupIds";
      "LogDeliveryConfigurations";
      "ReplicationGroupCreateTime";
      "DataTiering";
      "AutoMinorVersionUpgrade";
      "NetworkType";
      "IpDiscovery";
      "TransitEncryptionMode";
      "ClusterMode";
      "Engine";
      "Durability";
      "EffectiveDurability";
    ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "GlobalReplicationGroupInfo" ->
          r_global_replication_group_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupInfo"
                 (fun i _ -> global_replication_group_info_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "PendingModifiedValues" ->
          r_pending_modified_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingModifiedValues"
                 (fun i _ -> replication_group_pending_modified_values_of_xml i)
                 ())
      | "MemberClusters" ->
          r_member_clusters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MemberClusters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterId" (fun i _ -> string__of_xml i) ())
                 ())
      | "NodeGroups" ->
          r_node_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroup"
                     (fun i _ -> node_group_of_xml i)
                     ())
                 ())
      | "SnapshottingClusterId" ->
          r_snapshotting_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshottingClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutomaticFailover" ->
          r_automatic_failover :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomaticFailover"
                 (fun i _ -> automatic_failover_status_of_xml i)
                 ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ"
                 (fun i _ -> multi_az_status_of_xml i)
                 ())
      | "ConfigurationEndpoint" ->
          r_configuration_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationEndpoint"
                 (fun i _ -> endpoint_of_xml i)
                 ())
      | "SnapshotRetentionLimit" ->
          r_snapshot_retention_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionLimit"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotWindow" ->
          r_snapshot_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterEnabled" ->
          r_cluster_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "AuthTokenEnabled" ->
          r_auth_token_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthTokenEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AuthTokenLastModifiedDate" ->
          r_auth_token_last_modified_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthTokenLastModifiedDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "TransitEncryptionEnabled" ->
          r_transit_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AtRestEncryptionEnabled" ->
          r_at_rest_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AtRestEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MemberClustersOutpostArns" ->
          r_member_clusters_outpost_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MemberClustersOutpostArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReplicationGroupOutpostArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "StorageEncryptionType" ->
          r_storage_encryption_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncryptionType"
                 (fun i _ -> storage_encryption_type_of_xml i)
                 ())
      | "ARN" ->
          r_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> string__of_xml i) ())
      | "UserGroupIds" ->
          r_user_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> user_group_id_of_xml i)
                     ())
                 ())
      | "LogDeliveryConfigurations" ->
          r_log_delivery_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDeliveryConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "LogDeliveryConfiguration"
                     (fun i _ -> log_delivery_configuration_of_xml i)
                     ())
                 ())
      | "ReplicationGroupCreateTime" ->
          r_replication_group_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "DataTiering" ->
          r_data_tiering :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataTiering"
                 (fun i _ -> data_tiering_status_of_xml i)
                 ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType"
                 (fun i _ -> network_type_of_xml i)
                 ())
      | "IpDiscovery" ->
          r_ip_discovery :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpDiscovery"
                 (fun i _ -> ip_discovery_of_xml i)
                 ())
      | "TransitEncryptionMode" ->
          r_transit_encryption_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionMode"
                 (fun i _ -> transit_encryption_mode_of_xml i)
                 ())
      | "ClusterMode" ->
          r_cluster_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterMode"
                 (fun i _ -> cluster_mode_of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "Durability" ->
          r_durability :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Durability" (fun i _ -> durability_of_xml i) ())
      | "EffectiveDurability" ->
          r_effective_durability :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EffectiveDurability"
                 (fun i _ -> effective_durability_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id = ( ! ) r_replication_group_id;
     description = ( ! ) r_description;
     global_replication_group_info = ( ! ) r_global_replication_group_info;
     status = ( ! ) r_status;
     pending_modified_values = ( ! ) r_pending_modified_values;
     member_clusters = ( ! ) r_member_clusters;
     node_groups = ( ! ) r_node_groups;
     snapshotting_cluster_id = ( ! ) r_snapshotting_cluster_id;
     automatic_failover = ( ! ) r_automatic_failover;
     multi_a_z = ( ! ) r_multi_a_z;
     configuration_endpoint = ( ! ) r_configuration_endpoint;
     snapshot_retention_limit = ( ! ) r_snapshot_retention_limit;
     snapshot_window = ( ! ) r_snapshot_window;
     cluster_enabled = ( ! ) r_cluster_enabled;
     cache_node_type = ( ! ) r_cache_node_type;
     auth_token_enabled = ( ! ) r_auth_token_enabled;
     auth_token_last_modified_date = ( ! ) r_auth_token_last_modified_date;
     transit_encryption_enabled = ( ! ) r_transit_encryption_enabled;
     at_rest_encryption_enabled = ( ! ) r_at_rest_encryption_enabled;
     member_clusters_outpost_arns = ( ! ) r_member_clusters_outpost_arns;
     kms_key_id = ( ! ) r_kms_key_id;
     storage_encryption_type = ( ! ) r_storage_encryption_type;
     ar_n = ( ! ) r_ar_n;
     user_group_ids = ( ! ) r_user_group_ids;
     log_delivery_configurations = ( ! ) r_log_delivery_configurations;
     replication_group_create_time = ( ! ) r_replication_group_create_time;
     data_tiering = ( ! ) r_data_tiering;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     network_type = ( ! ) r_network_type;
     ip_discovery = ( ! ) r_ip_discovery;
     transit_encryption_mode = ( ! ) r_transit_encryption_mode;
     cluster_mode = ( ! ) r_cluster_mode;
     engine = ( ! ) r_engine;
     durability = ( ! ) r_durability;
     effective_durability = ( ! ) r_effective_durability;
   }
    : replication_group)

let test_migration_response_of_xml i =
  let r_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroup" ] (fun tag _ ->
      match tag with
      | "ReplicationGroup" ->
          r_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroup"
                 (fun i _ -> replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ replication_group = ( ! ) r_replication_group } : test_migration_response)

let customer_node_endpoint_of_xml i =
  let r_address = ref None in
  let r_port = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Address"; "Port" ] (fun tag _ ->
      match tag with
      | "Address" ->
          r_address :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Address" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ address = ( ! ) r_address; port = ( ! ) r_port } : customer_node_endpoint)

let customer_node_endpoint_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> customer_node_endpoint_of_xml i) ()

let test_migration_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_customer_node_endpoint_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroupId"; "CustomerNodeEndpointList" ]
    (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomerNodeEndpointList" ->
          r_customer_node_endpoint_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomerNodeEndpointList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> customer_node_endpoint_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     customer_node_endpoint_list =
       Smaws_Lib.Xml.Parse.required "CustomerNodeEndpointList"
         (( ! ) r_customer_node_endpoint_list)
         i;
   }
    : test_migration_message)

let test_failover_not_available_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : test_failover_not_available_fault)

let node_group_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : node_group_not_found_fault)

let invalid_parameter_combination_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> aws_query_error_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_parameter_combination_exception)

let invalid_kms_key_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_kms_key_fault)

let invalid_cache_cluster_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_cache_cluster_state_fault)

let test_failover_result_of_xml i =
  let r_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroup" ] (fun tag _ ->
      match tag with
      | "ReplicationGroup" ->
          r_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroup"
                 (fun i _ -> replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ replication_group = ( ! ) r_replication_group } : test_failover_result)

let test_failover_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_node_group_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroupId"; "NodeGroupId" ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeGroupId" ->
          r_node_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupId"
                 (fun i _ -> allowed_node_group_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     node_group_id = Smaws_Lib.Xml.Parse.required "NodeGroupId" (( ! ) r_node_group_id) i;
   }
    : test_failover_message)

let start_migration_response_of_xml i =
  let r_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroup" ] (fun tag _ ->
      match tag with
      | "ReplicationGroup" ->
          r_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroup"
                 (fun i _ -> replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ replication_group = ( ! ) r_replication_group } : start_migration_response)

let start_migration_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_customer_node_endpoint_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroupId"; "CustomerNodeEndpointList" ]
    (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomerNodeEndpointList" ->
          r_customer_node_endpoint_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomerNodeEndpointList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> customer_node_endpoint_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     customer_node_endpoint_list =
       Smaws_Lib.Xml.Parse.required "CustomerNodeEndpointList"
         (( ! ) r_customer_node_endpoint_list)
         i;
   }
    : start_migration_message)

let invalid_cache_security_group_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_cache_security_group_state_fault)

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

let ec2_security_group_of_xml i =
  let r_status = ref None in
  let r_ec2_security_group_name = ref None in
  let r_ec2_security_group_owner_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Status"; "EC2SecurityGroupName"; "EC2SecurityGroupOwnerId" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "EC2SecurityGroupName" ->
          r_ec2_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EC2SecurityGroupOwnerId" ->
          r_ec2_security_group_owner_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupOwnerId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = ( ! ) r_status;
     ec2_security_group_name = ( ! ) r_ec2_security_group_name;
     ec2_security_group_owner_id = ( ! ) r_ec2_security_group_owner_id;
   }
    : ec2_security_group)

let ec2_security_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "EC2SecurityGroup"
    (fun i _ -> ec2_security_group_of_xml i)
    ()

let cache_security_group_of_xml i =
  let r_owner_id = ref None in
  let r_cache_security_group_name = ref None in
  let r_description = ref None in
  let r_ec2_security_groups = ref None in
  let r_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "OwnerId"; "CacheSecurityGroupName"; "Description"; "EC2SecurityGroups"; "ARN" ] (fun tag _ ->
      match tag with
      | "OwnerId" ->
          r_owner_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerId" (fun i _ -> string__of_xml i) ())
      | "CacheSecurityGroupName" ->
          r_cache_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "EC2SecurityGroups" ->
          r_ec2_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EC2SecurityGroup"
                     (fun i _ -> ec2_security_group_of_xml i)
                     ())
                 ())
      | "ARN" ->
          r_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     owner_id = ( ! ) r_owner_id;
     cache_security_group_name = ( ! ) r_cache_security_group_name;
     description = ( ! ) r_description;
     ec2_security_groups = ( ! ) r_ec2_security_groups;
     ar_n = ( ! ) r_ar_n;
   }
    : cache_security_group)

let revoke_cache_security_group_ingress_result_of_xml i =
  let r_cache_security_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheSecurityGroup" ] (fun tag _ ->
      match tag with
      | "CacheSecurityGroup" ->
          r_cache_security_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroup"
                 (fun i _ -> cache_security_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_security_group = ( ! ) r_cache_security_group }
    : revoke_cache_security_group_ingress_result)

let revoke_cache_security_group_ingress_message_of_xml i =
  let r_cache_security_group_name = ref None in
  let r_ec2_security_group_name = ref None in
  let r_ec2_security_group_owner_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CacheSecurityGroupName"; "EC2SecurityGroupName"; "EC2SecurityGroupOwnerId" ] (fun tag _ ->
      match tag with
      | "CacheSecurityGroupName" ->
          r_cache_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EC2SecurityGroupName" ->
          r_ec2_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EC2SecurityGroupOwnerId" ->
          r_ec2_security_group_owner_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupOwnerId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_security_group_name =
       Smaws_Lib.Xml.Parse.required "CacheSecurityGroupName" (( ! ) r_cache_security_group_name) i;
     ec2_security_group_name =
       Smaws_Lib.Xml.Parse.required "EC2SecurityGroupName" (( ! ) r_ec2_security_group_name) i;
     ec2_security_group_owner_id =
       Smaws_Lib.Xml.Parse.required "EC2SecurityGroupOwnerId"
         (( ! ) r_ec2_security_group_owner_id)
         i;
   }
    : revoke_cache_security_group_ingress_message)

let invalid_global_replication_group_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_global_replication_group_state_fault)

let invalid_cache_parameter_group_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_cache_parameter_group_state_fault)

let cache_parameter_group_name_message_of_xml i =
  let r_cache_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheParameterGroupName" ] (fun tag _ ->
      match tag with
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_parameter_group_name = ( ! ) r_cache_parameter_group_name }
    : cache_parameter_group_name_message)

let parameter_name_value_of_xml i =
  let r_parameter_name = ref None in
  let r_parameter_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ParameterName"; "ParameterValue" ] (fun tag _ ->
      match tag with
      | "ParameterName" ->
          r_parameter_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterName" (fun i _ -> string__of_xml i) ())
      | "ParameterValue" ->
          r_parameter_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterValue"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ parameter_name = ( ! ) r_parameter_name; parameter_value = ( ! ) r_parameter_value }
    : parameter_name_value)

let parameter_name_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ParameterNameValue"
    (fun i _ -> parameter_name_value_of_xml i)
    ()

let reset_cache_parameter_group_message_of_xml i =
  let r_cache_parameter_group_name = ref None in
  let r_reset_all_parameters = ref None in
  let r_parameter_name_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CacheParameterGroupName"; "ResetAllParameters"; "ParameterNameValues" ] (fun tag _ ->
      match tag with
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ResetAllParameters" ->
          r_reset_all_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResetAllParameters"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ParameterNameValues" ->
          r_parameter_name_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterNameValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ParameterNameValue"
                     (fun i _ -> parameter_name_value_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "CacheParameterGroupName" (( ! ) r_cache_parameter_group_name) i;
     reset_all_parameters = ( ! ) r_reset_all_parameters;
     parameter_name_values = ( ! ) r_parameter_name_values;
   }
    : reset_cache_parameter_group_message)

let tag_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : tag_not_found_fault)

let key_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let remove_tags_from_resource_message_of_xml i =
  let r_resource_name = ref None in
  let r_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceName"; "TagKeys" ] (fun tag _ ->
      match tag with
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName" (fun i _ -> string__of_xml i) ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_name = Smaws_Lib.Xml.Parse.required "ResourceName" (( ! ) r_resource_name) i;
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
   }
    : remove_tags_from_resource_message)

let security_group_membership_of_xml i =
  let r_security_group_id = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SecurityGroupId"; "Status" ] (fun tag _ ->
      match tag with
      | "SecurityGroupId" ->
          r_security_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ security_group_id = ( ! ) r_security_group_id; status = ( ! ) r_status }
    : security_group_membership)

let security_group_membership_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> security_group_membership_of_xml i) ()

let cache_node_of_xml i =
  let r_cache_node_id = ref None in
  let r_cache_node_status = ref None in
  let r_cache_node_create_time = ref None in
  let r_endpoint = ref None in
  let r_parameter_group_status = ref None in
  let r_source_cache_node_id = ref None in
  let r_customer_availability_zone = ref None in
  let r_customer_outpost_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CacheNodeId";
      "CacheNodeStatus";
      "CacheNodeCreateTime";
      "Endpoint";
      "ParameterGroupStatus";
      "SourceCacheNodeId";
      "CustomerAvailabilityZone";
      "CustomerOutpostArn";
    ] (fun tag _ ->
      match tag with
      | "CacheNodeId" ->
          r_cache_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeId" (fun i _ -> string__of_xml i) ())
      | "CacheNodeStatus" ->
          r_cache_node_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeCreateTime" ->
          r_cache_node_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> endpoint_of_xml i) ())
      | "ParameterGroupStatus" ->
          r_parameter_group_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceCacheNodeId" ->
          r_source_cache_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceCacheNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomerAvailabilityZone" ->
          r_customer_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomerAvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomerOutpostArn" ->
          r_customer_outpost_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomerOutpostArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_node_id = ( ! ) r_cache_node_id;
     cache_node_status = ( ! ) r_cache_node_status;
     cache_node_create_time = ( ! ) r_cache_node_create_time;
     endpoint = ( ! ) r_endpoint;
     parameter_group_status = ( ! ) r_parameter_group_status;
     source_cache_node_id = ( ! ) r_source_cache_node_id;
     customer_availability_zone = ( ! ) r_customer_availability_zone;
     customer_outpost_arn = ( ! ) r_customer_outpost_arn;
   }
    : cache_node)

let cache_node_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheNode" (fun i _ -> cache_node_of_xml i) ()

let cache_node_ids_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeId" (fun i _ -> string__of_xml i) ()

let cache_parameter_group_status_of_xml i =
  let r_cache_parameter_group_name = ref None in
  let r_parameter_apply_status = ref None in
  let r_cache_node_ids_to_reboot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CacheParameterGroupName"; "ParameterApplyStatus"; "CacheNodeIdsToReboot" ] (fun tag _ ->
      match tag with
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterApplyStatus" ->
          r_parameter_apply_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterApplyStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeIdsToReboot" ->
          r_cache_node_ids_to_reboot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeIdsToReboot"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_parameter_group_name = ( ! ) r_cache_parameter_group_name;
     parameter_apply_status = ( ! ) r_parameter_apply_status;
     cache_node_ids_to_reboot = ( ! ) r_cache_node_ids_to_reboot;
   }
    : cache_parameter_group_status)

let cache_security_group_membership_of_xml i =
  let r_cache_security_group_name = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheSecurityGroupName"; "Status" ] (fun tag _ ->
      match tag with
      | "CacheSecurityGroupName" ->
          r_cache_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_security_group_name = ( ! ) r_cache_security_group_name; status = ( ! ) r_status }
    : cache_security_group_membership)

let cache_security_group_membership_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheSecurityGroup"
    (fun i _ -> cache_security_group_membership_of_xml i)
    ()

let notification_configuration_of_xml i =
  let r_topic_arn = ref None in
  let r_topic_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TopicArn"; "TopicStatus" ] (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> string__of_xml i) ())
      | "TopicStatus" ->
          r_topic_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicStatus" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ topic_arn = ( ! ) r_topic_arn; topic_status = ( ! ) r_topic_status }
    : notification_configuration)

let scale_config_of_xml i =
  let r_scale_percentage = ref None in
  let r_scale_interval_minutes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScalePercentage"; "ScaleIntervalMinutes" ]
    (fun tag _ ->
      match tag with
      | "ScalePercentage" ->
          r_scale_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScalePercentage"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ScaleIntervalMinutes" ->
          r_scale_interval_minutes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScaleIntervalMinutes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scale_percentage = ( ! ) r_scale_percentage;
     scale_interval_minutes = ( ! ) r_scale_interval_minutes;
   }
    : scale_config)

let pending_modified_values_of_xml i =
  let r_num_cache_nodes = ref None in
  let r_cache_node_ids_to_remove = ref None in
  let r_engine_version = ref None in
  let r_cache_node_type = ref None in
  let r_auth_token_status = ref None in
  let r_log_delivery_configurations = ref None in
  let r_transit_encryption_enabled = ref None in
  let r_transit_encryption_mode = ref None in
  let r_scale_config = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NumCacheNodes";
      "CacheNodeIdsToRemove";
      "EngineVersion";
      "CacheNodeType";
      "AuthTokenStatus";
      "LogDeliveryConfigurations";
      "TransitEncryptionEnabled";
      "TransitEncryptionMode";
      "ScaleConfig";
    ] (fun tag _ ->
      match tag with
      | "NumCacheNodes" ->
          r_num_cache_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumCacheNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "CacheNodeIdsToRemove" ->
          r_cache_node_ids_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeIdsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "AuthTokenStatus" ->
          r_auth_token_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthTokenStatus"
                 (fun i _ -> auth_token_update_status_of_xml i)
                 ())
      | "LogDeliveryConfigurations" ->
          r_log_delivery_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDeliveryConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> pending_log_delivery_configuration_of_xml i)
                     ())
                 ())
      | "TransitEncryptionEnabled" ->
          r_transit_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "TransitEncryptionMode" ->
          r_transit_encryption_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionMode"
                 (fun i _ -> transit_encryption_mode_of_xml i)
                 ())
      | "ScaleConfig" ->
          r_scale_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScaleConfig"
                 (fun i _ -> scale_config_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     num_cache_nodes = ( ! ) r_num_cache_nodes;
     cache_node_ids_to_remove = ( ! ) r_cache_node_ids_to_remove;
     engine_version = ( ! ) r_engine_version;
     cache_node_type = ( ! ) r_cache_node_type;
     auth_token_status = ( ! ) r_auth_token_status;
     log_delivery_configurations = ( ! ) r_log_delivery_configurations;
     transit_encryption_enabled = ( ! ) r_transit_encryption_enabled;
     transit_encryption_mode = ( ! ) r_transit_encryption_mode;
     scale_config = ( ! ) r_scale_config;
   }
    : pending_modified_values)

let cache_cluster_of_xml i =
  let r_cache_cluster_id = ref None in
  let r_configuration_endpoint = ref None in
  let r_client_download_landing_page = ref None in
  let r_cache_node_type = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_cache_cluster_status = ref None in
  let r_num_cache_nodes = ref None in
  let r_preferred_availability_zone = ref None in
  let r_preferred_outpost_arn = ref None in
  let r_cache_cluster_create_time = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_pending_modified_values = ref None in
  let r_notification_configuration = ref None in
  let r_cache_security_groups = ref None in
  let r_cache_parameter_group = ref None in
  let r_cache_subnet_group_name = ref None in
  let r_cache_nodes = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_security_groups = ref None in
  let r_replication_group_id = ref None in
  let r_snapshot_retention_limit = ref None in
  let r_snapshot_window = ref None in
  let r_auth_token_enabled = ref None in
  let r_auth_token_last_modified_date = ref None in
  let r_transit_encryption_enabled = ref None in
  let r_at_rest_encryption_enabled = ref None in
  let r_ar_n = ref None in
  let r_replication_group_log_delivery_enabled = ref None in
  let r_log_delivery_configurations = ref None in
  let r_network_type = ref None in
  let r_ip_discovery = ref None in
  let r_transit_encryption_mode = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CacheClusterId";
      "ConfigurationEndpoint";
      "ClientDownloadLandingPage";
      "CacheNodeType";
      "Engine";
      "EngineVersion";
      "CacheClusterStatus";
      "NumCacheNodes";
      "PreferredAvailabilityZone";
      "PreferredOutpostArn";
      "CacheClusterCreateTime";
      "PreferredMaintenanceWindow";
      "PendingModifiedValues";
      "NotificationConfiguration";
      "CacheSecurityGroups";
      "CacheParameterGroup";
      "CacheSubnetGroupName";
      "CacheNodes";
      "AutoMinorVersionUpgrade";
      "SecurityGroups";
      "ReplicationGroupId";
      "SnapshotRetentionLimit";
      "SnapshotWindow";
      "AuthTokenEnabled";
      "AuthTokenLastModifiedDate";
      "TransitEncryptionEnabled";
      "AtRestEncryptionEnabled";
      "ARN";
      "ReplicationGroupLogDeliveryEnabled";
      "LogDeliveryConfigurations";
      "NetworkType";
      "IpDiscovery";
      "TransitEncryptionMode";
    ] (fun tag _ ->
      match tag with
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ConfigurationEndpoint" ->
          r_configuration_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationEndpoint"
                 (fun i _ -> endpoint_of_xml i)
                 ())
      | "ClientDownloadLandingPage" ->
          r_client_download_landing_page :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientDownloadLandingPage"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "CacheClusterStatus" ->
          r_cache_cluster_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NumCacheNodes" ->
          r_num_cache_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumCacheNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "PreferredAvailabilityZone" ->
          r_preferred_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredAvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredOutpostArn" ->
          r_preferred_outpost_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredOutpostArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheClusterCreateTime" ->
          r_cache_cluster_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PendingModifiedValues" ->
          r_pending_modified_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingModifiedValues"
                 (fun i _ -> pending_modified_values_of_xml i)
                 ())
      | "NotificationConfiguration" ->
          r_notification_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationConfiguration"
                 (fun i _ -> notification_configuration_of_xml i)
                 ())
      | "CacheSecurityGroups" ->
          r_cache_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheSecurityGroup"
                     (fun i _ -> cache_security_group_membership_of_xml i)
                     ())
                 ())
      | "CacheParameterGroup" ->
          r_cache_parameter_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroup"
                 (fun i _ -> cache_parameter_group_status_of_xml i)
                 ())
      | "CacheSubnetGroupName" ->
          r_cache_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodes" ->
          r_cache_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheNode"
                     (fun i _ -> cache_node_of_xml i)
                     ())
                 ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> security_group_membership_of_xml i)
                     ())
                 ())
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotRetentionLimit" ->
          r_snapshot_retention_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionLimit"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotWindow" ->
          r_snapshot_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AuthTokenEnabled" ->
          r_auth_token_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthTokenEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AuthTokenLastModifiedDate" ->
          r_auth_token_last_modified_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthTokenLastModifiedDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "TransitEncryptionEnabled" ->
          r_transit_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AtRestEncryptionEnabled" ->
          r_at_rest_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AtRestEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ARN" ->
          r_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> string__of_xml i) ())
      | "ReplicationGroupLogDeliveryEnabled" ->
          r_replication_group_log_delivery_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupLogDeliveryEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "LogDeliveryConfigurations" ->
          r_log_delivery_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDeliveryConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "LogDeliveryConfiguration"
                     (fun i _ -> log_delivery_configuration_of_xml i)
                     ())
                 ())
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType"
                 (fun i _ -> network_type_of_xml i)
                 ())
      | "IpDiscovery" ->
          r_ip_discovery :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpDiscovery"
                 (fun i _ -> ip_discovery_of_xml i)
                 ())
      | "TransitEncryptionMode" ->
          r_transit_encryption_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionMode"
                 (fun i _ -> transit_encryption_mode_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     configuration_endpoint = ( ! ) r_configuration_endpoint;
     client_download_landing_page = ( ! ) r_client_download_landing_page;
     cache_node_type = ( ! ) r_cache_node_type;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     cache_cluster_status = ( ! ) r_cache_cluster_status;
     num_cache_nodes = ( ! ) r_num_cache_nodes;
     preferred_availability_zone = ( ! ) r_preferred_availability_zone;
     preferred_outpost_arn = ( ! ) r_preferred_outpost_arn;
     cache_cluster_create_time = ( ! ) r_cache_cluster_create_time;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     pending_modified_values = ( ! ) r_pending_modified_values;
     notification_configuration = ( ! ) r_notification_configuration;
     cache_security_groups = ( ! ) r_cache_security_groups;
     cache_parameter_group = ( ! ) r_cache_parameter_group;
     cache_subnet_group_name = ( ! ) r_cache_subnet_group_name;
     cache_nodes = ( ! ) r_cache_nodes;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     security_groups = ( ! ) r_security_groups;
     replication_group_id = ( ! ) r_replication_group_id;
     snapshot_retention_limit = ( ! ) r_snapshot_retention_limit;
     snapshot_window = ( ! ) r_snapshot_window;
     auth_token_enabled = ( ! ) r_auth_token_enabled;
     auth_token_last_modified_date = ( ! ) r_auth_token_last_modified_date;
     transit_encryption_enabled = ( ! ) r_transit_encryption_enabled;
     at_rest_encryption_enabled = ( ! ) r_at_rest_encryption_enabled;
     ar_n = ( ! ) r_ar_n;
     replication_group_log_delivery_enabled = ( ! ) r_replication_group_log_delivery_enabled;
     log_delivery_configurations = ( ! ) r_log_delivery_configurations;
     network_type = ( ! ) r_network_type;
     ip_discovery = ( ! ) r_ip_discovery;
     transit_encryption_mode = ( ! ) r_transit_encryption_mode;
   }
    : cache_cluster)

let reboot_cache_cluster_result_of_xml i =
  let r_cache_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheCluster" ] (fun tag _ ->
      match tag with
      | "CacheCluster" ->
          r_cache_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheCluster"
                 (fun i _ -> cache_cluster_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_cluster = ( ! ) r_cache_cluster } : reboot_cache_cluster_result)

let reboot_cache_cluster_message_of_xml i =
  let r_cache_cluster_id = ref None in
  let r_cache_node_ids_to_reboot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheClusterId"; "CacheNodeIdsToReboot" ]
    (fun tag _ ->
      match tag with
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeIdsToReboot" ->
          r_cache_node_ids_to_reboot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeIdsToReboot"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_cluster_id = Smaws_Lib.Xml.Parse.required "CacheClusterId" (( ! ) r_cache_cluster_id) i;
     cache_node_ids_to_reboot =
       Smaws_Lib.Xml.Parse.required "CacheNodeIdsToReboot" (( ! ) r_cache_node_ids_to_reboot) i;
   }
    : reboot_cache_cluster_message)

let global_replication_group_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : global_replication_group_not_found_fault)

let global_node_group_of_xml i =
  let r_global_node_group_id = ref None in
  let r_slots = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalNodeGroupId"; "Slots" ] (fun tag _ ->
      match tag with
      | "GlobalNodeGroupId" ->
          r_global_node_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalNodeGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Slots" ->
          r_slots :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Slots" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_node_group_id = ( ! ) r_global_node_group_id; slots = ( ! ) r_slots }
    : global_node_group)

let global_node_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "GlobalNodeGroup" (fun i _ -> global_node_group_of_xml i) ()

let global_replication_group_member_of_xml i =
  let r_replication_group_id = ref None in
  let r_replication_group_region = ref None in
  let r_role = ref None in
  let r_automatic_failover = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReplicationGroupId"; "ReplicationGroupRegion"; "Role"; "AutomaticFailover"; "Status" ]
    (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicationGroupRegion" ->
          r_replication_group_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Role" ->
          r_role :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Role" (fun i _ -> string__of_xml i) ())
      | "AutomaticFailover" ->
          r_automatic_failover :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomaticFailover"
                 (fun i _ -> automatic_failover_status_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id = ( ! ) r_replication_group_id;
     replication_group_region = ( ! ) r_replication_group_region;
     role = ( ! ) r_role;
     automatic_failover = ( ! ) r_automatic_failover;
     status = ( ! ) r_status;
   }
    : global_replication_group_member)

let global_replication_group_member_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "GlobalReplicationGroupMember"
    (fun i _ -> global_replication_group_member_of_xml i)
    ()

let global_replication_group_of_xml i =
  let r_global_replication_group_id = ref None in
  let r_global_replication_group_description = ref None in
  let r_status = ref None in
  let r_cache_node_type = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_members = ref None in
  let r_cluster_enabled = ref None in
  let r_global_node_groups = ref None in
  let r_auth_token_enabled = ref None in
  let r_transit_encryption_enabled = ref None in
  let r_at_rest_encryption_enabled = ref None in
  let r_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "GlobalReplicationGroupId";
      "GlobalReplicationGroupDescription";
      "Status";
      "CacheNodeType";
      "Engine";
      "EngineVersion";
      "Members";
      "ClusterEnabled";
      "GlobalNodeGroups";
      "AuthTokenEnabled";
      "TransitEncryptionEnabled";
      "AtRestEncryptionEnabled";
      "ARN";
    ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroupId" ->
          r_global_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalReplicationGroupDescription" ->
          r_global_replication_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Members" ->
          r_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Members"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "GlobalReplicationGroupMember"
                     (fun i _ -> global_replication_group_member_of_xml i)
                     ())
                 ())
      | "ClusterEnabled" ->
          r_cluster_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "GlobalNodeGroups" ->
          r_global_node_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalNodeGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "GlobalNodeGroup"
                     (fun i _ -> global_node_group_of_xml i)
                     ())
                 ())
      | "AuthTokenEnabled" ->
          r_auth_token_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthTokenEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "TransitEncryptionEnabled" ->
          r_transit_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AtRestEncryptionEnabled" ->
          r_at_rest_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AtRestEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ARN" ->
          r_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_replication_group_id = ( ! ) r_global_replication_group_id;
     global_replication_group_description = ( ! ) r_global_replication_group_description;
     status = ( ! ) r_status;
     cache_node_type = ( ! ) r_cache_node_type;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     members = ( ! ) r_members;
     cluster_enabled = ( ! ) r_cluster_enabled;
     global_node_groups = ( ! ) r_global_node_groups;
     auth_token_enabled = ( ! ) r_auth_token_enabled;
     transit_encryption_enabled = ( ! ) r_transit_encryption_enabled;
     at_rest_encryption_enabled = ( ! ) r_at_rest_encryption_enabled;
     ar_n = ( ! ) r_ar_n;
   }
    : global_replication_group)

let rebalance_slots_in_global_replication_group_result_of_xml i =
  let r_global_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalReplicationGroup" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroup" ->
          r_global_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroup"
                 (fun i _ -> global_replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_replication_group = ( ! ) r_global_replication_group }
    : rebalance_slots_in_global_replication_group_result)

let rebalance_slots_in_global_replication_group_message_of_xml i =
  let r_global_replication_group_id = ref None in
  let r_apply_immediately = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalReplicationGroupId"; "ApplyImmediately" ]
    (fun tag _ ->
      match tag with
      | "GlobalReplicationGroupId" ->
          r_global_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_replication_group_id =
       Smaws_Lib.Xml.Parse.required "GlobalReplicationGroupId"
         (( ! ) r_global_replication_group_id)
         i;
     apply_immediately =
       Smaws_Lib.Xml.Parse.required "ApplyImmediately" (( ! ) r_apply_immediately) i;
   }
    : rebalance_slots_in_global_replication_group_message)

let reserved_cache_nodes_offering_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : reserved_cache_nodes_offering_not_found_fault)

let reserved_cache_node_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : reserved_cache_node_quota_exceeded_fault)

let reserved_cache_node_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : reserved_cache_node_already_exists_fault)

let recurring_charge_of_xml i =
  let r_recurring_charge_amount = ref None in
  let r_recurring_charge_frequency = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "RecurringChargeAmount"; "RecurringChargeFrequency" ] (fun tag _ ->
      match tag with
      | "RecurringChargeAmount" ->
          r_recurring_charge_amount :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecurringChargeAmount"
                 (fun i _ -> double_of_xml i)
                 ())
      | "RecurringChargeFrequency" ->
          r_recurring_charge_frequency :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecurringChargeFrequency"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     recurring_charge_amount = ( ! ) r_recurring_charge_amount;
     recurring_charge_frequency = ( ! ) r_recurring_charge_frequency;
   }
    : recurring_charge)

let recurring_charge_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "RecurringCharge" (fun i _ -> recurring_charge_of_xml i) ()

let reserved_cache_node_of_xml i =
  let r_reserved_cache_node_id = ref None in
  let r_reserved_cache_nodes_offering_id = ref None in
  let r_cache_node_type = ref None in
  let r_start_time = ref None in
  let r_duration = ref None in
  let r_fixed_price = ref None in
  let r_usage_price = ref None in
  let r_cache_node_count = ref None in
  let r_product_description = ref None in
  let r_offering_type = ref None in
  let r_state = ref None in
  let r_recurring_charges = ref None in
  let r_reservation_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReservedCacheNodeId";
      "ReservedCacheNodesOfferingId";
      "CacheNodeType";
      "StartTime";
      "Duration";
      "FixedPrice";
      "UsagePrice";
      "CacheNodeCount";
      "ProductDescription";
      "OfferingType";
      "State";
      "RecurringCharges";
      "ReservationARN";
    ] (fun tag _ ->
      match tag with
      | "ReservedCacheNodeId" ->
          r_reserved_cache_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedCacheNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedCacheNodesOfferingId" ->
          r_reserved_cache_nodes_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedCacheNodesOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "Duration" ->
          r_duration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Duration" (fun i _ -> integer_of_xml i) ())
      | "FixedPrice" ->
          r_fixed_price :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "FixedPrice" (fun i _ -> double_of_xml i) ())
      | "UsagePrice" ->
          r_usage_price :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UsagePrice" (fun i _ -> double_of_xml i) ())
      | "CacheNodeCount" ->
          r_cache_node_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeCount"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "ProductDescription" ->
          r_product_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProductDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "OfferingType" ->
          r_offering_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OfferingType" (fun i _ -> string__of_xml i) ())
      | "State" ->
          r_state :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "State" (fun i _ -> string__of_xml i) ())
      | "RecurringCharges" ->
          r_recurring_charges :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecurringCharges"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "RecurringCharge"
                     (fun i _ -> recurring_charge_of_xml i)
                     ())
                 ())
      | "ReservationARN" ->
          r_reservation_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservationARN"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_cache_node_id = ( ! ) r_reserved_cache_node_id;
     reserved_cache_nodes_offering_id = ( ! ) r_reserved_cache_nodes_offering_id;
     cache_node_type = ( ! ) r_cache_node_type;
     start_time = ( ! ) r_start_time;
     duration = ( ! ) r_duration;
     fixed_price = ( ! ) r_fixed_price;
     usage_price = ( ! ) r_usage_price;
     cache_node_count = ( ! ) r_cache_node_count;
     product_description = ( ! ) r_product_description;
     offering_type = ( ! ) r_offering_type;
     state = ( ! ) r_state;
     recurring_charges = ( ! ) r_recurring_charges;
     reservation_ar_n = ( ! ) r_reservation_ar_n;
   }
    : reserved_cache_node)

let purchase_reserved_cache_nodes_offering_result_of_xml i =
  let r_reserved_cache_node = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedCacheNode" ] (fun tag _ ->
      match tag with
      | "ReservedCacheNode" ->
          r_reserved_cache_node :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedCacheNode"
                 (fun i _ -> reserved_cache_node_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ reserved_cache_node = ( ! ) r_reserved_cache_node }
    : purchase_reserved_cache_nodes_offering_result)

let purchase_reserved_cache_nodes_offering_message_of_xml i =
  let r_reserved_cache_nodes_offering_id = ref None in
  let r_reserved_cache_node_id = ref None in
  let r_cache_node_count = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReservedCacheNodesOfferingId"; "ReservedCacheNodeId"; "CacheNodeCount"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "ReservedCacheNodesOfferingId" ->
          r_reserved_cache_nodes_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedCacheNodesOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedCacheNodeId" ->
          r_reserved_cache_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedCacheNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeCount" ->
          r_cache_node_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeCount"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_cache_nodes_offering_id =
       Smaws_Lib.Xml.Parse.required "ReservedCacheNodesOfferingId"
         (( ! ) r_reserved_cache_nodes_offering_id)
         i;
     reserved_cache_node_id = ( ! ) r_reserved_cache_node_id;
     cache_node_count = ( ! ) r_cache_node_count;
     tags = ( ! ) r_tags;
   }
    : purchase_reserved_cache_nodes_offering_message)

let service_linked_role_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : service_linked_role_not_found_fault)

let invalid_user_group_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_user_group_state_fault)

let duplicate_user_name_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : duplicate_user_name_fault)

let default_user_required_of_xml i =
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
  ({ message = ( ! ) r_message } : default_user_required)

let ug_serverless_cache_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let ug_replication_group_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let user_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let user_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_id_of_xml i) ()

let user_group_pending_changes_of_xml i =
  let r_user_ids_to_remove = ref None in
  let r_user_ids_to_add = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserIdsToRemove"; "UserIdsToAdd" ] (fun tag _ ->
      match tag with
      | "UserIdsToRemove" ->
          r_user_ids_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserIdsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_id_of_xml i) ())
                 ())
      | "UserIdsToAdd" ->
          r_user_ids_to_add :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserIdsToAdd"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_id_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_ids_to_remove = ( ! ) r_user_ids_to_remove; user_ids_to_add = ( ! ) r_user_ids_to_add }
    : user_group_pending_changes)

let engine_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let user_group_of_xml i =
  let r_user_group_id = ref None in
  let r_status = ref None in
  let r_engine = ref None in
  let r_user_ids = ref None in
  let r_minimum_engine_version = ref None in
  let r_pending_changes = ref None in
  let r_replication_groups = ref None in
  let r_serverless_caches = ref None in
  let r_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "UserGroupId";
      "Status";
      "Engine";
      "UserIds";
      "MinimumEngineVersion";
      "PendingChanges";
      "ReplicationGroups";
      "ServerlessCaches";
      "ARN";
    ] (fun tag _ ->
      match tag with
      | "UserGroupId" ->
          r_user_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupId" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> engine_type_of_xml i) ())
      | "UserIds" ->
          r_user_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_id_of_xml i) ())
                 ())
      | "MinimumEngineVersion" ->
          r_minimum_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinimumEngineVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PendingChanges" ->
          r_pending_changes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingChanges"
                 (fun i _ -> user_group_pending_changes_of_xml i)
                 ())
      | "ReplicationGroups" ->
          r_replication_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "ServerlessCaches" ->
          r_serverless_caches :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCaches"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "ARN" ->
          r_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_group_id = ( ! ) r_user_group_id;
     status = ( ! ) r_status;
     engine = ( ! ) r_engine;
     user_ids = ( ! ) r_user_ids;
     minimum_engine_version = ( ! ) r_minimum_engine_version;
     pending_changes = ( ! ) r_pending_changes;
     replication_groups = ( ! ) r_replication_groups;
     serverless_caches = ( ! ) r_serverless_caches;
     ar_n = ( ! ) r_ar_n;
   }
    : user_group)

let user_id_list_input_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_id_of_xml i) ()

let modify_user_group_message_of_xml i =
  let r_user_group_id = ref None in
  let r_user_ids_to_add = ref None in
  let r_user_ids_to_remove = ref None in
  let r_engine = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "UserGroupId"; "UserIdsToAdd"; "UserIdsToRemove"; "Engine" ] (fun tag _ ->
      match tag with
      | "UserGroupId" ->
          r_user_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupId" (fun i _ -> string__of_xml i) ())
      | "UserIdsToAdd" ->
          r_user_ids_to_add :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserIdsToAdd"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_id_of_xml i) ())
                 ())
      | "UserIdsToRemove" ->
          r_user_ids_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserIdsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_id_of_xml i) ())
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> engine_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_group_id = Smaws_Lib.Xml.Parse.required "UserGroupId" (( ! ) r_user_group_id) i;
     user_ids_to_add = ( ! ) r_user_ids_to_add;
     user_ids_to_remove = ( ! ) r_user_ids_to_remove;
     engine = ( ! ) r_engine;
   }
    : modify_user_group_message)

let invalid_user_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_user_state_fault)

let authentication_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "password" -> PASSWORD
   | "no-password" -> NO_PASSWORD
   | "iam" -> IAM
   | _ -> failwith "unknown enum value"
    : authentication_type)

let authentication_of_xml i =
  let r_type_ = ref None in
  let r_password_count = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Type"; "PasswordCount" ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> authentication_type_of_xml i)
                 ())
      | "PasswordCount" ->
          r_password_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PasswordCount"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ type_ = ( ! ) r_type_; password_count = ( ! ) r_password_count } : authentication)

let user_of_xml i =
  let r_user_id = ref None in
  let r_user_name = ref None in
  let r_status = ref None in
  let r_engine = ref None in
  let r_minimum_engine_version = ref None in
  let r_access_string = ref None in
  let r_user_group_ids = ref None in
  let r_authentication = ref None in
  let r_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "UserId";
      "UserName";
      "Status";
      "Engine";
      "MinimumEngineVersion";
      "AccessString";
      "UserGroupIds";
      "Authentication";
      "ARN";
    ] (fun tag _ ->
      match tag with
      | "UserId" ->
          r_user_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UserId" (fun i _ -> string__of_xml i) ())
      | "UserName" ->
          r_user_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UserName" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> engine_type_of_xml i) ())
      | "MinimumEngineVersion" ->
          r_minimum_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinimumEngineVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AccessString" ->
          r_access_string :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessString" (fun i _ -> string__of_xml i) ())
      | "UserGroupIds" ->
          r_user_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> user_group_id_of_xml i)
                     ())
                 ())
      | "Authentication" ->
          r_authentication :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Authentication"
                 (fun i _ -> authentication_of_xml i)
                 ())
      | "ARN" ->
          r_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_id = ( ! ) r_user_id;
     user_name = ( ! ) r_user_name;
     status = ( ! ) r_status;
     engine = ( ! ) r_engine;
     minimum_engine_version = ( ! ) r_minimum_engine_version;
     access_string = ( ! ) r_access_string;
     user_group_ids = ( ! ) r_user_group_ids;
     authentication = ( ! ) r_authentication;
     ar_n = ( ! ) r_ar_n;
   }
    : user)

let password_list_input_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let input_authentication_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "password" -> PASSWORD
   | "no-password-required" -> NO_PASSWORD
   | "iam" -> IAM
   | _ -> failwith "unknown enum value"
    : input_authentication_type)

let authentication_mode_of_xml i =
  let r_type_ = ref None in
  let r_passwords = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Type"; "Passwords" ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> input_authentication_type_of_xml i)
                 ())
      | "Passwords" ->
          r_passwords :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Passwords"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ type_ = ( ! ) r_type_; passwords = ( ! ) r_passwords } : authentication_mode)

let modify_user_message_of_xml i =
  let r_user_id = ref None in
  let r_access_string = ref None in
  let r_append_access_string = ref None in
  let r_passwords = ref None in
  let r_no_password_required = ref None in
  let r_authentication_mode = ref None in
  let r_engine = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "UserId";
      "AccessString";
      "AppendAccessString";
      "Passwords";
      "NoPasswordRequired";
      "AuthenticationMode";
      "Engine";
    ] (fun tag _ ->
      match tag with
      | "UserId" ->
          r_user_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UserId" (fun i _ -> user_id_of_xml i) ())
      | "AccessString" ->
          r_access_string :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessString"
                 (fun i _ -> access_string_of_xml i)
                 ())
      | "AppendAccessString" ->
          r_append_access_string :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AppendAccessString"
                 (fun i _ -> access_string_of_xml i)
                 ())
      | "Passwords" ->
          r_passwords :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Passwords"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "NoPasswordRequired" ->
          r_no_password_required :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NoPasswordRequired"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AuthenticationMode" ->
          r_authentication_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationMode"
                 (fun i _ -> authentication_mode_of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> engine_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_id = Smaws_Lib.Xml.Parse.required "UserId" (( ! ) r_user_id) i;
     access_string = ( ! ) r_access_string;
     append_access_string = ( ! ) r_append_access_string;
     passwords = ( ! ) r_passwords;
     no_password_required = ( ! ) r_no_password_required;
     authentication_mode = ( ! ) r_authentication_mode;
     engine = ( ! ) r_engine;
   }
    : modify_user_message)

let invalid_credentials_exception_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_credentials_exception)

let subnet_ids_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SubnetId" (fun i _ -> string__of_xml i) ()

let security_group_ids_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SecurityGroupId" (fun i _ -> string__of_xml i) ()

let ecpu_per_second_of_xml i =
  let r_maximum = ref None in
  let r_minimum = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Maximum"; "Minimum" ] (fun tag _ ->
      match tag with
      | "Maximum" ->
          r_maximum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Maximum"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Minimum" ->
          r_minimum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Minimum"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ maximum = ( ! ) r_maximum; minimum = ( ! ) r_minimum } : ecpu_per_second)

let data_storage_unit_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "GB" -> GB | _ -> failwith "unknown enum value" : data_storage_unit)

let data_storage_of_xml i =
  let r_maximum = ref None in
  let r_minimum = ref None in
  let r_unit_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Maximum"; "Minimum"; "Unit" ] (fun tag _ ->
      match tag with
      | "Maximum" ->
          r_maximum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Maximum"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Minimum" ->
          r_minimum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Minimum"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Unit" ->
          r_unit_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Unit"
                 (fun i _ -> data_storage_unit_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     maximum = ( ! ) r_maximum;
     minimum = ( ! ) r_minimum;
     unit_ = Smaws_Lib.Xml.Parse.required "Unit" (( ! ) r_unit_) i;
   }
    : data_storage)

let cache_usage_limits_of_xml i =
  let r_data_storage = ref None in
  let r_ecpu_per_second = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DataStorage"; "ECPUPerSecond" ] (fun tag _ ->
      match tag with
      | "DataStorage" ->
          r_data_storage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataStorage"
                 (fun i _ -> data_storage_of_xml i)
                 ())
      | "ECPUPerSecond" ->
          r_ecpu_per_second :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ECPUPerSecond"
                 (fun i _ -> ecpu_per_second_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data_storage = ( ! ) r_data_storage; ecpu_per_second = ( ! ) r_ecpu_per_second }
    : cache_usage_limits)

let serverless_cache_of_xml i =
  let r_serverless_cache_name = ref None in
  let r_description = ref None in
  let r_create_time = ref None in
  let r_status = ref None in
  let r_engine = ref None in
  let r_major_engine_version = ref None in
  let r_full_engine_version = ref None in
  let r_cache_usage_limits = ref None in
  let r_kms_key_id = ref None in
  let r_storage_encryption_type = ref None in
  let r_security_group_ids = ref None in
  let r_endpoint = ref None in
  let r_reader_endpoint = ref None in
  let r_ar_n = ref None in
  let r_user_group_id = ref None in
  let r_subnet_ids = ref None in
  let r_snapshot_retention_limit = ref None in
  let r_daily_snapshot_time = ref None in
  let r_network_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ServerlessCacheName";
      "Description";
      "CreateTime";
      "Status";
      "Engine";
      "MajorEngineVersion";
      "FullEngineVersion";
      "CacheUsageLimits";
      "KmsKeyId";
      "StorageEncryptionType";
      "SecurityGroupIds";
      "Endpoint";
      "ReaderEndpoint";
      "ARN";
      "UserGroupId";
      "SubnetIds";
      "SnapshotRetentionLimit";
      "DailySnapshotTime";
      "NetworkType";
    ] (fun tag _ ->
      match tag with
      | "ServerlessCacheName" ->
          r_serverless_cache_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "CreateTime" ->
          r_create_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CreateTime" (fun i _ -> t_stamp_of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "MajorEngineVersion" ->
          r_major_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MajorEngineVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "FullEngineVersion" ->
          r_full_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FullEngineVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheUsageLimits" ->
          r_cache_usage_limits :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheUsageLimits"
                 (fun i _ -> cache_usage_limits_of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "StorageEncryptionType" ->
          r_storage_encryption_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncryptionType"
                 (fun i _ -> storage_encryption_type_of_xml i)
                 ())
      | "SecurityGroupIds" ->
          r_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> endpoint_of_xml i) ())
      | "ReaderEndpoint" ->
          r_reader_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReaderEndpoint"
                 (fun i _ -> endpoint_of_xml i)
                 ())
      | "ARN" ->
          r_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> string__of_xml i) ())
      | "UserGroupId" ->
          r_user_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupId" (fun i _ -> string__of_xml i) ())
      | "SubnetIds" ->
          r_subnet_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SubnetId" (fun i _ -> string__of_xml i) ())
                 ())
      | "SnapshotRetentionLimit" ->
          r_snapshot_retention_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionLimit"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DailySnapshotTime" ->
          r_daily_snapshot_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DailySnapshotTime"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType"
                 (fun i _ -> network_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serverless_cache_name = ( ! ) r_serverless_cache_name;
     description = ( ! ) r_description;
     create_time = ( ! ) r_create_time;
     status = ( ! ) r_status;
     engine = ( ! ) r_engine;
     major_engine_version = ( ! ) r_major_engine_version;
     full_engine_version = ( ! ) r_full_engine_version;
     cache_usage_limits = ( ! ) r_cache_usage_limits;
     kms_key_id = ( ! ) r_kms_key_id;
     storage_encryption_type = ( ! ) r_storage_encryption_type;
     security_group_ids = ( ! ) r_security_group_ids;
     endpoint = ( ! ) r_endpoint;
     reader_endpoint = ( ! ) r_reader_endpoint;
     ar_n = ( ! ) r_ar_n;
     user_group_id = ( ! ) r_user_group_id;
     subnet_ids = ( ! ) r_subnet_ids;
     snapshot_retention_limit = ( ! ) r_snapshot_retention_limit;
     daily_snapshot_time = ( ! ) r_daily_snapshot_time;
     network_type = ( ! ) r_network_type;
   }
    : serverless_cache)

let modify_serverless_cache_response_of_xml i =
  let r_serverless_cache = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessCache" ] (fun tag _ ->
      match tag with
      | "ServerlessCache" ->
          r_serverless_cache :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCache"
                 (fun i _ -> serverless_cache_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ serverless_cache = ( ! ) r_serverless_cache } : modify_serverless_cache_response)

let modify_serverless_cache_request_of_xml i =
  let r_serverless_cache_name = ref None in
  let r_description = ref None in
  let r_cache_usage_limits = ref None in
  let r_remove_user_group = ref None in
  let r_user_group_id = ref None in
  let r_security_group_ids = ref None in
  let r_snapshot_retention_limit = ref None in
  let r_daily_snapshot_time = ref None in
  let r_engine = ref None in
  let r_major_engine_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ServerlessCacheName";
      "Description";
      "CacheUsageLimits";
      "RemoveUserGroup";
      "UserGroupId";
      "SecurityGroupIds";
      "SnapshotRetentionLimit";
      "DailySnapshotTime";
      "Engine";
      "MajorEngineVersion";
    ] (fun tag _ ->
      match tag with
      | "ServerlessCacheName" ->
          r_serverless_cache_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "CacheUsageLimits" ->
          r_cache_usage_limits :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheUsageLimits"
                 (fun i _ -> cache_usage_limits_of_xml i)
                 ())
      | "RemoveUserGroup" ->
          r_remove_user_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemoveUserGroup"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "UserGroupId" ->
          r_user_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupId" (fun i _ -> string__of_xml i) ())
      | "SecurityGroupIds" ->
          r_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SnapshotRetentionLimit" ->
          r_snapshot_retention_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionLimit"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DailySnapshotTime" ->
          r_daily_snapshot_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DailySnapshotTime"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "MajorEngineVersion" ->
          r_major_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MajorEngineVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serverless_cache_name =
       Smaws_Lib.Xml.Parse.required "ServerlessCacheName" (( ! ) r_serverless_cache_name) i;
     description = ( ! ) r_description;
     cache_usage_limits = ( ! ) r_cache_usage_limits;
     remove_user_group = ( ! ) r_remove_user_group;
     user_group_id = ( ! ) r_user_group_id;
     security_group_ids = ( ! ) r_security_group_ids;
     snapshot_retention_limit = ( ! ) r_snapshot_retention_limit;
     daily_snapshot_time = ( ! ) r_daily_snapshot_time;
     engine = ( ! ) r_engine;
     major_engine_version = ( ! ) r_major_engine_version;
   }
    : modify_serverless_cache_request)

let node_quota_for_customer_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : node_quota_for_customer_exceeded_fault)

let node_groups_per_replication_group_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : node_groups_per_replication_group_quota_exceeded_fault)

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

let insufficient_cache_cluster_capacity_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : insufficient_cache_cluster_capacity_fault)

let modify_replication_group_shard_configuration_result_of_xml i =
  let r_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroup" ] (fun tag _ ->
      match tag with
      | "ReplicationGroup" ->
          r_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroup"
                 (fun i _ -> replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ replication_group = ( ! ) r_replication_group }
    : modify_replication_group_shard_configuration_result)

let node_groups_to_retain_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupToRetain"
    (fun i _ -> allowed_node_group_id_of_xml i)
    ()

let node_groups_to_remove_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupToRemove"
    (fun i _ -> allowed_node_group_id_of_xml i)
    ()

let availability_zones_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone" (fun i _ -> string__of_xml i) ()

let resharding_configuration_of_xml i =
  let r_node_group_id = ref None in
  let r_preferred_availability_zones = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NodeGroupId"; "PreferredAvailabilityZones" ]
    (fun tag _ ->
      match tag with
      | "NodeGroupId" ->
          r_node_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupId"
                 (fun i _ -> allowed_node_group_id_of_xml i)
                 ())
      | "PreferredAvailabilityZones" ->
          r_preferred_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredAvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     node_group_id = ( ! ) r_node_group_id;
     preferred_availability_zones = ( ! ) r_preferred_availability_zones;
   }
    : resharding_configuration)

let resharding_configuration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReshardingConfiguration"
    (fun i _ -> resharding_configuration_of_xml i)
    ()

let modify_replication_group_shard_configuration_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_node_group_count = ref None in
  let r_apply_immediately = ref None in
  let r_resharding_configuration = ref None in
  let r_node_groups_to_remove = ref None in
  let r_node_groups_to_retain = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReplicationGroupId";
      "NodeGroupCount";
      "ApplyImmediately";
      "ReshardingConfiguration";
      "NodeGroupsToRemove";
      "NodeGroupsToRetain";
    ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeGroupCount" ->
          r_node_group_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupCount"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ReshardingConfiguration" ->
          r_resharding_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReshardingConfiguration"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReshardingConfiguration"
                     (fun i _ -> resharding_configuration_of_xml i)
                     ())
                 ())
      | "NodeGroupsToRemove" ->
          r_node_groups_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupToRemove"
                     (fun i _ -> allowed_node_group_id_of_xml i)
                     ())
                 ())
      | "NodeGroupsToRetain" ->
          r_node_groups_to_retain :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupsToRetain"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupToRetain"
                     (fun i _ -> allowed_node_group_id_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     node_group_count = Smaws_Lib.Xml.Parse.required "NodeGroupCount" (( ! ) r_node_group_count) i;
     apply_immediately =
       Smaws_Lib.Xml.Parse.required "ApplyImmediately" (( ! ) r_apply_immediately) i;
     resharding_configuration = ( ! ) r_resharding_configuration;
     node_groups_to_remove = ( ! ) r_node_groups_to_remove;
     node_groups_to_retain = ( ! ) r_node_groups_to_retain;
   }
    : modify_replication_group_shard_configuration_message)

let node_quota_for_cluster_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : node_quota_for_cluster_exceeded_fault)

let modify_replication_group_result_of_xml i =
  let r_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroup" ] (fun tag _ ->
      match tag with
      | "ReplicationGroup" ->
          r_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroup"
                 (fun i _ -> replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ replication_group = ( ! ) r_replication_group } : modify_replication_group_result)

let log_delivery_configuration_request_of_xml i =
  let r_log_type = ref None in
  let r_destination_type = ref None in
  let r_destination_details = ref None in
  let r_log_format = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LogType"; "DestinationType"; "DestinationDetails"; "LogFormat"; "Enabled" ] (fun tag _ ->
      match tag with
      | "LogType" ->
          r_log_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "LogType" (fun i _ -> log_type_of_xml i) ())
      | "DestinationType" ->
          r_destination_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationType"
                 (fun i _ -> destination_type_of_xml i)
                 ())
      | "DestinationDetails" ->
          r_destination_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationDetails"
                 (fun i _ -> destination_details_of_xml i)
                 ())
      | "LogFormat" ->
          r_log_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogFormat" (fun i _ -> log_format_of_xml i) ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     log_type = ( ! ) r_log_type;
     destination_type = ( ! ) r_destination_type;
     destination_details = ( ! ) r_destination_details;
     log_format = ( ! ) r_log_format;
     enabled = ( ! ) r_enabled;
   }
    : log_delivery_configuration_request)

let log_delivery_configuration_request_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "LogDeliveryConfigurationRequest"
    (fun i _ -> log_delivery_configuration_request_of_xml i)
    ()

let auth_token_update_strategy_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SET" -> SET
   | "ROTATE" -> ROTATE
   | "DELETE" -> DELETE
   | _ -> failwith "unknown enum value"
    : auth_token_update_strategy_type)

let cache_security_group_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheSecurityGroupName" (fun i _ -> string__of_xml i) ()

let modify_replication_group_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_replication_group_description = ref None in
  let r_primary_cluster_id = ref None in
  let r_snapshotting_cluster_id = ref None in
  let r_automatic_failover_enabled = ref None in
  let r_multi_az_enabled = ref None in
  let r_node_group_id = ref None in
  let r_cache_security_group_names = ref None in
  let r_security_group_ids = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_notification_topic_arn = ref None in
  let r_cache_parameter_group_name = ref None in
  let r_notification_topic_status = ref None in
  let r_apply_immediately = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_snapshot_retention_limit = ref None in
  let r_snapshot_window = ref None in
  let r_cache_node_type = ref None in
  let r_auth_token = ref None in
  let r_auth_token_update_strategy = ref None in
  let r_user_group_ids_to_add = ref None in
  let r_user_group_ids_to_remove = ref None in
  let r_remove_user_groups = ref None in
  let r_log_delivery_configurations = ref None in
  let r_ip_discovery = ref None in
  let r_transit_encryption_enabled = ref None in
  let r_transit_encryption_mode = ref None in
  let r_cluster_mode = ref None in
  let r_durability = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReplicationGroupId";
      "ReplicationGroupDescription";
      "PrimaryClusterId";
      "SnapshottingClusterId";
      "AutomaticFailoverEnabled";
      "MultiAZEnabled";
      "NodeGroupId";
      "CacheSecurityGroupNames";
      "SecurityGroupIds";
      "PreferredMaintenanceWindow";
      "NotificationTopicArn";
      "CacheParameterGroupName";
      "NotificationTopicStatus";
      "ApplyImmediately";
      "Engine";
      "EngineVersion";
      "AutoMinorVersionUpgrade";
      "SnapshotRetentionLimit";
      "SnapshotWindow";
      "CacheNodeType";
      "AuthToken";
      "AuthTokenUpdateStrategy";
      "UserGroupIdsToAdd";
      "UserGroupIdsToRemove";
      "RemoveUserGroups";
      "LogDeliveryConfigurations";
      "IpDiscovery";
      "TransitEncryptionEnabled";
      "TransitEncryptionMode";
      "ClusterMode";
      "Durability";
    ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicationGroupDescription" ->
          r_replication_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PrimaryClusterId" ->
          r_primary_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrimaryClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshottingClusterId" ->
          r_snapshotting_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshottingClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutomaticFailoverEnabled" ->
          r_automatic_failover_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomaticFailoverEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MultiAZEnabled" ->
          r_multi_az_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NodeGroupId" ->
          r_node_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupId" (fun i _ -> string__of_xml i) ())
      | "CacheSecurityGroupNames" ->
          r_cache_security_group_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroupNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheSecurityGroupName"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SecurityGroupIds" ->
          r_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NotificationTopicArn" ->
          r_notification_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTopicArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NotificationTopicStatus" ->
          r_notification_topic_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTopicStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "SnapshotRetentionLimit" ->
          r_snapshot_retention_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionLimit"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotWindow" ->
          r_snapshot_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "AuthToken" ->
          r_auth_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AuthToken" (fun i _ -> string__of_xml i) ())
      | "AuthTokenUpdateStrategy" ->
          r_auth_token_update_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthTokenUpdateStrategy"
                 (fun i _ -> auth_token_update_strategy_type_of_xml i)
                 ())
      | "UserGroupIdsToAdd" ->
          r_user_group_ids_to_add :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupIdsToAdd"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> user_group_id_of_xml i)
                     ())
                 ())
      | "UserGroupIdsToRemove" ->
          r_user_group_ids_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupIdsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> user_group_id_of_xml i)
                     ())
                 ())
      | "RemoveUserGroups" ->
          r_remove_user_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemoveUserGroups"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "LogDeliveryConfigurations" ->
          r_log_delivery_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDeliveryConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "LogDeliveryConfigurationRequest"
                     (fun i _ -> log_delivery_configuration_request_of_xml i)
                     ())
                 ())
      | "IpDiscovery" ->
          r_ip_discovery :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpDiscovery"
                 (fun i _ -> ip_discovery_of_xml i)
                 ())
      | "TransitEncryptionEnabled" ->
          r_transit_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "TransitEncryptionMode" ->
          r_transit_encryption_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionMode"
                 (fun i _ -> transit_encryption_mode_of_xml i)
                 ())
      | "ClusterMode" ->
          r_cluster_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterMode"
                 (fun i _ -> cluster_mode_of_xml i)
                 ())
      | "Durability" ->
          r_durability :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Durability" (fun i _ -> durability_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     replication_group_description = ( ! ) r_replication_group_description;
     primary_cluster_id = ( ! ) r_primary_cluster_id;
     snapshotting_cluster_id = ( ! ) r_snapshotting_cluster_id;
     automatic_failover_enabled = ( ! ) r_automatic_failover_enabled;
     multi_az_enabled = ( ! ) r_multi_az_enabled;
     node_group_id = ( ! ) r_node_group_id;
     cache_security_group_names = ( ! ) r_cache_security_group_names;
     security_group_ids = ( ! ) r_security_group_ids;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     notification_topic_arn = ( ! ) r_notification_topic_arn;
     cache_parameter_group_name = ( ! ) r_cache_parameter_group_name;
     notification_topic_status = ( ! ) r_notification_topic_status;
     apply_immediately = ( ! ) r_apply_immediately;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     snapshot_retention_limit = ( ! ) r_snapshot_retention_limit;
     snapshot_window = ( ! ) r_snapshot_window;
     cache_node_type = ( ! ) r_cache_node_type;
     auth_token = ( ! ) r_auth_token;
     auth_token_update_strategy = ( ! ) r_auth_token_update_strategy;
     user_group_ids_to_add = ( ! ) r_user_group_ids_to_add;
     user_group_ids_to_remove = ( ! ) r_user_group_ids_to_remove;
     remove_user_groups = ( ! ) r_remove_user_groups;
     log_delivery_configurations = ( ! ) r_log_delivery_configurations;
     ip_discovery = ( ! ) r_ip_discovery;
     transit_encryption_enabled = ( ! ) r_transit_encryption_enabled;
     transit_encryption_mode = ( ! ) r_transit_encryption_mode;
     cluster_mode = ( ! ) r_cluster_mode;
     durability = ( ! ) r_durability;
   }
    : modify_replication_group_message)

let modify_global_replication_group_result_of_xml i =
  let r_global_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalReplicationGroup" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroup" ->
          r_global_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroup"
                 (fun i _ -> global_replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_replication_group = ( ! ) r_global_replication_group }
    : modify_global_replication_group_result)

let modify_global_replication_group_message_of_xml i =
  let r_global_replication_group_id = ref None in
  let r_apply_immediately = ref None in
  let r_cache_node_type = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_cache_parameter_group_name = ref None in
  let r_global_replication_group_description = ref None in
  let r_automatic_failover_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "GlobalReplicationGroupId";
      "ApplyImmediately";
      "CacheNodeType";
      "Engine";
      "EngineVersion";
      "CacheParameterGroupName";
      "GlobalReplicationGroupDescription";
      "AutomaticFailoverEnabled";
    ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroupId" ->
          r_global_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalReplicationGroupDescription" ->
          r_global_replication_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutomaticFailoverEnabled" ->
          r_automatic_failover_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomaticFailoverEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_replication_group_id =
       Smaws_Lib.Xml.Parse.required "GlobalReplicationGroupId"
         (( ! ) r_global_replication_group_id)
         i;
     apply_immediately =
       Smaws_Lib.Xml.Parse.required "ApplyImmediately" (( ! ) r_apply_immediately) i;
     cache_node_type = ( ! ) r_cache_node_type;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     cache_parameter_group_name = ( ! ) r_cache_parameter_group_name;
     global_replication_group_description = ( ! ) r_global_replication_group_description;
     automatic_failover_enabled = ( ! ) r_automatic_failover_enabled;
   }
    : modify_global_replication_group_message)

let subnet_not_allowed_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : subnet_not_allowed_fault)

let subnet_in_use_of_xml i =
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
  ({ message = ( ! ) r_message } : subnet_in_use)

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

let cache_subnet_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_subnet_quota_exceeded_fault)

let network_type_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> network_type_of_xml i) ()

let subnet_outpost_of_xml i =
  let r_subnet_outpost_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SubnetOutpostArn" ] (fun tag _ ->
      match tag with
      | "SubnetOutpostArn" ->
          r_subnet_outpost_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetOutpostArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ subnet_outpost_arn = ( ! ) r_subnet_outpost_arn } : subnet_outpost)

let availability_zone_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name } : availability_zone)

let subnet_of_xml i =
  let r_subnet_identifier = ref None in
  let r_subnet_availability_zone = ref None in
  let r_subnet_outpost = ref None in
  let r_supported_network_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SubnetIdentifier"; "SubnetAvailabilityZone"; "SubnetOutpost"; "SupportedNetworkTypes" ]
    (fun tag _ ->
      match tag with
      | "SubnetIdentifier" ->
          r_subnet_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SubnetAvailabilityZone" ->
          r_subnet_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetAvailabilityZone"
                 (fun i _ -> availability_zone_of_xml i)
                 ())
      | "SubnetOutpost" ->
          r_subnet_outpost :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetOutpost"
                 (fun i _ -> subnet_outpost_of_xml i)
                 ())
      | "SupportedNetworkTypes" ->
          r_supported_network_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedNetworkTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> network_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subnet_identifier = ( ! ) r_subnet_identifier;
     subnet_availability_zone = ( ! ) r_subnet_availability_zone;
     subnet_outpost = ( ! ) r_subnet_outpost;
     supported_network_types = ( ! ) r_supported_network_types;
   }
    : subnet)

let subnet_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Subnet" (fun i _ -> subnet_of_xml i) ()

let cache_subnet_group_of_xml i =
  let r_cache_subnet_group_name = ref None in
  let r_cache_subnet_group_description = ref None in
  let r_vpc_id = ref None in
  let r_subnets = ref None in
  let r_ar_n = ref None in
  let r_supported_network_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CacheSubnetGroupName";
      "CacheSubnetGroupDescription";
      "VpcId";
      "Subnets";
      "ARN";
      "SupportedNetworkTypes";
    ] (fun tag _ ->
      match tag with
      | "CacheSubnetGroupName" ->
          r_cache_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheSubnetGroupDescription" ->
          r_cache_subnet_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "Subnets" ->
          r_subnets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subnets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Subnet" (fun i _ -> subnet_of_xml i) ())
                 ())
      | "ARN" ->
          r_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> string__of_xml i) ())
      | "SupportedNetworkTypes" ->
          r_supported_network_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedNetworkTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> network_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_subnet_group_name = ( ! ) r_cache_subnet_group_name;
     cache_subnet_group_description = ( ! ) r_cache_subnet_group_description;
     vpc_id = ( ! ) r_vpc_id;
     subnets = ( ! ) r_subnets;
     ar_n = ( ! ) r_ar_n;
     supported_network_types = ( ! ) r_supported_network_types;
   }
    : cache_subnet_group)

let modify_cache_subnet_group_result_of_xml i =
  let r_cache_subnet_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheSubnetGroup" ] (fun tag _ ->
      match tag with
      | "CacheSubnetGroup" ->
          r_cache_subnet_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroup"
                 (fun i _ -> cache_subnet_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_subnet_group = ( ! ) r_cache_subnet_group } : modify_cache_subnet_group_result)

let subnet_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SubnetIdentifier" (fun i _ -> string__of_xml i) ()

let modify_cache_subnet_group_message_of_xml i =
  let r_cache_subnet_group_name = ref None in
  let r_cache_subnet_group_description = ref None in
  let r_subnet_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CacheSubnetGroupName"; "CacheSubnetGroupDescription"; "SubnetIds" ] (fun tag _ ->
      match tag with
      | "CacheSubnetGroupName" ->
          r_cache_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheSubnetGroupDescription" ->
          r_cache_subnet_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupDescription"
                 (fun i _ -> string__of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "CacheSubnetGroupName" (( ! ) r_cache_subnet_group_name) i;
     cache_subnet_group_description = ( ! ) r_cache_subnet_group_description;
     subnet_ids = ( ! ) r_subnet_ids;
   }
    : modify_cache_subnet_group_message)

let modify_cache_parameter_group_message_of_xml i =
  let r_cache_parameter_group_name = ref None in
  let r_parameter_name_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheParameterGroupName"; "ParameterNameValues" ]
    (fun tag _ ->
      match tag with
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterNameValues" ->
          r_parameter_name_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterNameValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ParameterNameValue"
                     (fun i _ -> parameter_name_value_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "CacheParameterGroupName" (( ! ) r_cache_parameter_group_name) i;
     parameter_name_values =
       Smaws_Lib.Xml.Parse.required "ParameterNameValues" (( ! ) r_parameter_name_values) i;
   }
    : modify_cache_parameter_group_message)

let modify_cache_cluster_result_of_xml i =
  let r_cache_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheCluster" ] (fun tag _ ->
      match tag with
      | "CacheCluster" ->
          r_cache_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheCluster"
                 (fun i _ -> cache_cluster_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_cluster = ( ! ) r_cache_cluster } : modify_cache_cluster_result)

let preferred_availability_zone_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "PreferredAvailabilityZone" (fun i _ -> string__of_xml i) ()

let modify_cache_cluster_message_of_xml i =
  let r_cache_cluster_id = ref None in
  let r_num_cache_nodes = ref None in
  let r_cache_node_ids_to_remove = ref None in
  let r_az_mode = ref None in
  let r_new_availability_zones = ref None in
  let r_cache_security_group_names = ref None in
  let r_security_group_ids = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_notification_topic_arn = ref None in
  let r_cache_parameter_group_name = ref None in
  let r_notification_topic_status = ref None in
  let r_apply_immediately = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_snapshot_retention_limit = ref None in
  let r_snapshot_window = ref None in
  let r_cache_node_type = ref None in
  let r_auth_token = ref None in
  let r_auth_token_update_strategy = ref None in
  let r_log_delivery_configurations = ref None in
  let r_ip_discovery = ref None in
  let r_scale_config = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CacheClusterId";
      "NumCacheNodes";
      "CacheNodeIdsToRemove";
      "AZMode";
      "NewAvailabilityZones";
      "CacheSecurityGroupNames";
      "SecurityGroupIds";
      "PreferredMaintenanceWindow";
      "NotificationTopicArn";
      "CacheParameterGroupName";
      "NotificationTopicStatus";
      "ApplyImmediately";
      "Engine";
      "EngineVersion";
      "AutoMinorVersionUpgrade";
      "SnapshotRetentionLimit";
      "SnapshotWindow";
      "CacheNodeType";
      "AuthToken";
      "AuthTokenUpdateStrategy";
      "LogDeliveryConfigurations";
      "IpDiscovery";
      "ScaleConfig";
    ] (fun tag _ ->
      match tag with
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NumCacheNodes" ->
          r_num_cache_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumCacheNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "CacheNodeIdsToRemove" ->
          r_cache_node_ids_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeIdsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "AZMode" ->
          r_az_mode :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AZMode" (fun i _ -> az_mode_of_xml i) ())
      | "NewAvailabilityZones" ->
          r_new_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewAvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "PreferredAvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "CacheSecurityGroupNames" ->
          r_cache_security_group_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroupNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheSecurityGroupName"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SecurityGroupIds" ->
          r_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NotificationTopicArn" ->
          r_notification_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTopicArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NotificationTopicStatus" ->
          r_notification_topic_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTopicStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "SnapshotRetentionLimit" ->
          r_snapshot_retention_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionLimit"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotWindow" ->
          r_snapshot_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "AuthToken" ->
          r_auth_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AuthToken" (fun i _ -> string__of_xml i) ())
      | "AuthTokenUpdateStrategy" ->
          r_auth_token_update_strategy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthTokenUpdateStrategy"
                 (fun i _ -> auth_token_update_strategy_type_of_xml i)
                 ())
      | "LogDeliveryConfigurations" ->
          r_log_delivery_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDeliveryConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "LogDeliveryConfigurationRequest"
                     (fun i _ -> log_delivery_configuration_request_of_xml i)
                     ())
                 ())
      | "IpDiscovery" ->
          r_ip_discovery :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpDiscovery"
                 (fun i _ -> ip_discovery_of_xml i)
                 ())
      | "ScaleConfig" ->
          r_scale_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScaleConfig"
                 (fun i _ -> scale_config_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_cluster_id = Smaws_Lib.Xml.Parse.required "CacheClusterId" (( ! ) r_cache_cluster_id) i;
     num_cache_nodes = ( ! ) r_num_cache_nodes;
     cache_node_ids_to_remove = ( ! ) r_cache_node_ids_to_remove;
     az_mode = ( ! ) r_az_mode;
     new_availability_zones = ( ! ) r_new_availability_zones;
     cache_security_group_names = ( ! ) r_cache_security_group_names;
     security_group_ids = ( ! ) r_security_group_ids;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     notification_topic_arn = ( ! ) r_notification_topic_arn;
     cache_parameter_group_name = ( ! ) r_cache_parameter_group_name;
     notification_topic_status = ( ! ) r_notification_topic_status;
     apply_immediately = ( ! ) r_apply_immediately;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     snapshot_retention_limit = ( ! ) r_snapshot_retention_limit;
     snapshot_window = ( ! ) r_snapshot_window;
     cache_node_type = ( ! ) r_cache_node_type;
     auth_token = ( ! ) r_auth_token;
     auth_token_update_strategy = ( ! ) r_auth_token_update_strategy;
     log_delivery_configurations = ( ! ) r_log_delivery_configurations;
     ip_discovery = ( ! ) r_ip_discovery;
     scale_config = ( ! ) r_scale_config;
   }
    : modify_cache_cluster_message)

let list_tags_for_resource_message_of_xml i =
  let r_resource_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceName" ] (fun tag _ ->
      match tag with
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_name = Smaws_Lib.Xml.Parse.required "ResourceName" (( ! ) r_resource_name) i }
    : list_tags_for_resource_message)

let list_allowed_node_type_modifications_message_of_xml i =
  let r_cache_cluster_id = ref None in
  let r_replication_group_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheClusterId"; "ReplicationGroupId" ]
    (fun tag _ ->
      match tag with
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     replication_group_id = ( ! ) r_replication_group_id;
   }
    : list_allowed_node_type_modifications_message)

let no_operation_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : no_operation_fault)

let cluster_quota_for_customer_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cluster_quota_for_customer_exceeded_fault)

let increase_replica_count_result_of_xml i =
  let r_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroup" ] (fun tag _ ->
      match tag with
      | "ReplicationGroup" ->
          r_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroup"
                 (fun i _ -> replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ replication_group = ( ! ) r_replication_group } : increase_replica_count_result)

let preferred_outpost_arn_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "PreferredOutpostArn" (fun i _ -> string__of_xml i) ()

let configure_shard_of_xml i =
  let r_node_group_id = ref None in
  let r_new_replica_count = ref None in
  let r_preferred_availability_zones = ref None in
  let r_preferred_outpost_arns = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NodeGroupId"; "NewReplicaCount"; "PreferredAvailabilityZones"; "PreferredOutpostArns" ]
    (fun tag _ ->
      match tag with
      | "NodeGroupId" ->
          r_node_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupId"
                 (fun i _ -> allowed_node_group_id_of_xml i)
                 ())
      | "NewReplicaCount" ->
          r_new_replica_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewReplicaCount"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "PreferredAvailabilityZones" ->
          r_preferred_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredAvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "PreferredAvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "PreferredOutpostArns" ->
          r_preferred_outpost_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredOutpostArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "PreferredOutpostArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     node_group_id = Smaws_Lib.Xml.Parse.required "NodeGroupId" (( ! ) r_node_group_id) i;
     new_replica_count =
       Smaws_Lib.Xml.Parse.required "NewReplicaCount" (( ! ) r_new_replica_count) i;
     preferred_availability_zones = ( ! ) r_preferred_availability_zones;
     preferred_outpost_arns = ( ! ) r_preferred_outpost_arns;
   }
    : configure_shard)

let replica_configuration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ConfigureShard" (fun i _ -> configure_shard_of_xml i) ()

let increase_replica_count_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_new_replica_count = ref None in
  let r_replica_configuration = ref None in
  let r_apply_immediately = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReplicationGroupId"; "NewReplicaCount"; "ReplicaConfiguration"; "ApplyImmediately" ]
    (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NewReplicaCount" ->
          r_new_replica_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewReplicaCount"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ReplicaConfiguration" ->
          r_replica_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicaConfiguration"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ConfigureShard"
                     (fun i _ -> configure_shard_of_xml i)
                     ())
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     new_replica_count = ( ! ) r_new_replica_count;
     replica_configuration = ( ! ) r_replica_configuration;
     apply_immediately =
       Smaws_Lib.Xml.Parse.required "ApplyImmediately" (( ! ) r_apply_immediately) i;
   }
    : increase_replica_count_message)

let increase_node_groups_in_global_replication_group_result_of_xml i =
  let r_global_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalReplicationGroup" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroup" ->
          r_global_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroup"
                 (fun i _ -> global_replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_replication_group = ( ! ) r_global_replication_group }
    : increase_node_groups_in_global_replication_group_result)

let regional_configuration_of_xml i =
  let r_replication_group_id = ref None in
  let r_replication_group_region = ref None in
  let r_resharding_configuration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReplicationGroupId"; "ReplicationGroupRegion"; "ReshardingConfiguration" ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicationGroupRegion" ->
          r_replication_group_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReshardingConfiguration" ->
          r_resharding_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReshardingConfiguration"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReshardingConfiguration"
                     (fun i _ -> resharding_configuration_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     replication_group_region =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupRegion" (( ! ) r_replication_group_region) i;
     resharding_configuration =
       Smaws_Lib.Xml.Parse.required "ReshardingConfiguration" (( ! ) r_resharding_configuration) i;
   }
    : regional_configuration)

let regional_configuration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "RegionalConfiguration"
    (fun i _ -> regional_configuration_of_xml i)
    ()

let increase_node_groups_in_global_replication_group_message_of_xml i =
  let r_global_replication_group_id = ref None in
  let r_node_group_count = ref None in
  let r_regional_configurations = ref None in
  let r_apply_immediately = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "GlobalReplicationGroupId"; "NodeGroupCount"; "RegionalConfigurations"; "ApplyImmediately" ]
    (fun tag _ ->
      match tag with
      | "GlobalReplicationGroupId" ->
          r_global_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeGroupCount" ->
          r_node_group_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupCount"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "RegionalConfigurations" ->
          r_regional_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegionalConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "RegionalConfiguration"
                     (fun i _ -> regional_configuration_of_xml i)
                     ())
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_replication_group_id =
       Smaws_Lib.Xml.Parse.required "GlobalReplicationGroupId"
         (( ! ) r_global_replication_group_id)
         i;
     node_group_count = Smaws_Lib.Xml.Parse.required "NodeGroupCount" (( ! ) r_node_group_count) i;
     regional_configurations = ( ! ) r_regional_configurations;
     apply_immediately =
       Smaws_Lib.Xml.Parse.required "ApplyImmediately" (( ! ) r_apply_immediately) i;
   }
    : increase_node_groups_in_global_replication_group_message)

let failover_global_replication_group_result_of_xml i =
  let r_global_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalReplicationGroup" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroup" ->
          r_global_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroup"
                 (fun i _ -> global_replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_replication_group = ( ! ) r_global_replication_group }
    : failover_global_replication_group_result)

let failover_global_replication_group_message_of_xml i =
  let r_global_replication_group_id = ref None in
  let r_primary_region = ref None in
  let r_primary_replication_group_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "GlobalReplicationGroupId"; "PrimaryRegion"; "PrimaryReplicationGroupId" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroupId" ->
          r_global_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PrimaryRegion" ->
          r_primary_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrimaryRegion" (fun i _ -> string__of_xml i) ())
      | "PrimaryReplicationGroupId" ->
          r_primary_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrimaryReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_replication_group_id =
       Smaws_Lib.Xml.Parse.required "GlobalReplicationGroupId"
         (( ! ) r_global_replication_group_id)
         i;
     primary_region = Smaws_Lib.Xml.Parse.required "PrimaryRegion" (( ! ) r_primary_region) i;
     primary_replication_group_id =
       Smaws_Lib.Xml.Parse.required "PrimaryReplicationGroupId"
         (( ! ) r_primary_replication_group_id)
         i;
   }
    : failover_global_replication_group_message)

let serverless_cache_configuration_of_xml i =
  let r_serverless_cache_name = ref None in
  let r_engine = ref None in
  let r_major_engine_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ServerlessCacheName"; "Engine"; "MajorEngineVersion" ] (fun tag _ ->
      match tag with
      | "ServerlessCacheName" ->
          r_serverless_cache_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "MajorEngineVersion" ->
          r_major_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MajorEngineVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serverless_cache_name = ( ! ) r_serverless_cache_name;
     engine = ( ! ) r_engine;
     major_engine_version = ( ! ) r_major_engine_version;
   }
    : serverless_cache_configuration)

let serverless_cache_snapshot_of_xml i =
  let r_serverless_cache_snapshot_name = ref None in
  let r_ar_n = ref None in
  let r_kms_key_id = ref None in
  let r_snapshot_type = ref None in
  let r_status = ref None in
  let r_create_time = ref None in
  let r_expiry_time = ref None in
  let r_bytes_used_for_cache = ref None in
  let r_serverless_cache_configuration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ServerlessCacheSnapshotName";
      "ARN";
      "KmsKeyId";
      "SnapshotType";
      "Status";
      "CreateTime";
      "ExpiryTime";
      "BytesUsedForCache";
      "ServerlessCacheConfiguration";
    ] (fun tag _ ->
      match tag with
      | "ServerlessCacheSnapshotName" ->
          r_serverless_cache_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheSnapshotName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ARN" ->
          r_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> string__of_xml i) ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "SnapshotType" ->
          r_snapshot_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotType" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "CreateTime" ->
          r_create_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CreateTime" (fun i _ -> t_stamp_of_xml i) ())
      | "ExpiryTime" ->
          r_expiry_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ExpiryTime" (fun i _ -> t_stamp_of_xml i) ())
      | "BytesUsedForCache" ->
          r_bytes_used_for_cache :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BytesUsedForCache"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ServerlessCacheConfiguration" ->
          r_serverless_cache_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheConfiguration"
                 (fun i _ -> serverless_cache_configuration_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serverless_cache_snapshot_name = ( ! ) r_serverless_cache_snapshot_name;
     ar_n = ( ! ) r_ar_n;
     kms_key_id = ( ! ) r_kms_key_id;
     snapshot_type = ( ! ) r_snapshot_type;
     status = ( ! ) r_status;
     create_time = ( ! ) r_create_time;
     expiry_time = ( ! ) r_expiry_time;
     bytes_used_for_cache = ( ! ) r_bytes_used_for_cache;
     serverless_cache_configuration = ( ! ) r_serverless_cache_configuration;
   }
    : serverless_cache_snapshot)

let export_serverless_cache_snapshot_response_of_xml i =
  let r_serverless_cache_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessCacheSnapshot" ] (fun tag _ ->
      match tag with
      | "ServerlessCacheSnapshot" ->
          r_serverless_cache_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheSnapshot"
                 (fun i _ -> serverless_cache_snapshot_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ serverless_cache_snapshot = ( ! ) r_serverless_cache_snapshot }
    : export_serverless_cache_snapshot_response)

let export_serverless_cache_snapshot_request_of_xml i =
  let r_serverless_cache_snapshot_name = ref None in
  let r_s3_bucket_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessCacheSnapshotName"; "S3BucketName" ]
    (fun tag _ ->
      match tag with
      | "ServerlessCacheSnapshotName" ->
          r_serverless_cache_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheSnapshotName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "S3BucketName" ->
          r_s3_bucket_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "S3BucketName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serverless_cache_snapshot_name =
       Smaws_Lib.Xml.Parse.required "ServerlessCacheSnapshotName"
         (( ! ) r_serverless_cache_snapshot_name)
         i;
     s3_bucket_name = Smaws_Lib.Xml.Parse.required "S3BucketName" (( ! ) r_s3_bucket_name) i;
   }
    : export_serverless_cache_snapshot_request)

let disassociate_global_replication_group_result_of_xml i =
  let r_global_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalReplicationGroup" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroup" ->
          r_global_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroup"
                 (fun i _ -> global_replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_replication_group = ( ! ) r_global_replication_group }
    : disassociate_global_replication_group_result)

let disassociate_global_replication_group_message_of_xml i =
  let r_global_replication_group_id = ref None in
  let r_replication_group_id = ref None in
  let r_replication_group_region = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "GlobalReplicationGroupId"; "ReplicationGroupId"; "ReplicationGroupRegion" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroupId" ->
          r_global_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicationGroupRegion" ->
          r_replication_group_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_replication_group_id =
       Smaws_Lib.Xml.Parse.required "GlobalReplicationGroupId"
         (( ! ) r_global_replication_group_id)
         i;
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     replication_group_region =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupRegion" (( ! ) r_replication_group_region) i;
   }
    : disassociate_global_replication_group_message)

let user_list_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_of_xml i) ()

let describe_users_result_of_xml i =
  let r_users = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Users"; "Marker" ] (fun tag _ ->
      match tag with
      | "Users" ->
          r_users :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Users"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ users = ( ! ) r_users; marker = ( ! ) r_marker } : describe_users_result)

let filter_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let filter_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> filter_value_of_xml i) ()

let filter_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let filter_of_xml i =
  let r_name = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Values" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> filter_name_of_xml i) ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> filter_value_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     values = Smaws_Lib.Xml.Parse.required "Values" (( ! ) r_values) i;
   }
    : filter)

let filter_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> filter_of_xml i) ()

let describe_users_message_of_xml i =
  let r_engine = ref None in
  let r_user_id = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Engine"; "UserId"; "Filters"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> engine_type_of_xml i) ())
      | "UserId" ->
          r_user_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UserId" (fun i _ -> user_id_of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> filter_of_xml i) ())
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     engine = ( ! ) r_engine;
     user_id = ( ! ) r_user_id;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_users_message)

let user_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_group_of_xml i) ()

let describe_user_groups_result_of_xml i =
  let r_user_groups = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserGroups"; "Marker" ] (fun tag _ ->
      match tag with
      | "UserGroups" ->
          r_user_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_group_of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_groups = ( ! ) r_user_groups; marker = ( ! ) r_marker } : describe_user_groups_result)

let describe_user_groups_message_of_xml i =
  let r_user_group_id = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserGroupId"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "UserGroupId" ->
          r_user_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupId" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_group_id = ( ! ) r_user_group_id;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_user_groups_message)

let node_update_initiated_by_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "system" -> SYSTEM | "customer" -> CUSTOMER | _ -> failwith "unknown enum value"
    : node_update_initiated_by)

let node_update_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "not-applied" -> NOT_APPLIED
   | "waiting-to-start" -> WAITING_TO_START
   | "in-progress" -> IN_PROGRESS
   | "stopping" -> STOPPING
   | "stopped" -> STOPPED
   | "complete" -> COMPLETE
   | _ -> failwith "unknown enum value"
    : node_update_status)

let cache_node_update_status_of_xml i =
  let r_cache_node_id = ref None in
  let r_node_update_status = ref None in
  let r_node_deletion_date = ref None in
  let r_node_update_start_date = ref None in
  let r_node_update_end_date = ref None in
  let r_node_update_initiated_by = ref None in
  let r_node_update_initiated_date = ref None in
  let r_node_update_status_modified_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CacheNodeId";
      "NodeUpdateStatus";
      "NodeDeletionDate";
      "NodeUpdateStartDate";
      "NodeUpdateEndDate";
      "NodeUpdateInitiatedBy";
      "NodeUpdateInitiatedDate";
      "NodeUpdateStatusModifiedDate";
    ] (fun tag _ ->
      match tag with
      | "CacheNodeId" ->
          r_cache_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeId" (fun i _ -> string__of_xml i) ())
      | "NodeUpdateStatus" ->
          r_node_update_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateStatus"
                 (fun i _ -> node_update_status_of_xml i)
                 ())
      | "NodeDeletionDate" ->
          r_node_deletion_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeDeletionDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "NodeUpdateStartDate" ->
          r_node_update_start_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateStartDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "NodeUpdateEndDate" ->
          r_node_update_end_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateEndDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "NodeUpdateInitiatedBy" ->
          r_node_update_initiated_by :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateInitiatedBy"
                 (fun i _ -> node_update_initiated_by_of_xml i)
                 ())
      | "NodeUpdateInitiatedDate" ->
          r_node_update_initiated_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateInitiatedDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "NodeUpdateStatusModifiedDate" ->
          r_node_update_status_modified_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateStatusModifiedDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_node_id = ( ! ) r_cache_node_id;
     node_update_status = ( ! ) r_node_update_status;
     node_deletion_date = ( ! ) r_node_deletion_date;
     node_update_start_date = ( ! ) r_node_update_start_date;
     node_update_end_date = ( ! ) r_node_update_end_date;
     node_update_initiated_by = ( ! ) r_node_update_initiated_by;
     node_update_initiated_date = ( ! ) r_node_update_initiated_date;
     node_update_status_modified_date = ( ! ) r_node_update_status_modified_date;
   }
    : cache_node_update_status)

let cache_node_update_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeUpdateStatus"
    (fun i _ -> cache_node_update_status_of_xml i)
    ()

let node_group_member_update_status_of_xml i =
  let r_cache_cluster_id = ref None in
  let r_cache_node_id = ref None in
  let r_node_update_status = ref None in
  let r_node_deletion_date = ref None in
  let r_node_update_start_date = ref None in
  let r_node_update_end_date = ref None in
  let r_node_update_initiated_by = ref None in
  let r_node_update_initiated_date = ref None in
  let r_node_update_status_modified_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CacheClusterId";
      "CacheNodeId";
      "NodeUpdateStatus";
      "NodeDeletionDate";
      "NodeUpdateStartDate";
      "NodeUpdateEndDate";
      "NodeUpdateInitiatedBy";
      "NodeUpdateInitiatedDate";
      "NodeUpdateStatusModifiedDate";
    ] (fun tag _ ->
      match tag with
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeId" ->
          r_cache_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeId" (fun i _ -> string__of_xml i) ())
      | "NodeUpdateStatus" ->
          r_node_update_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateStatus"
                 (fun i _ -> node_update_status_of_xml i)
                 ())
      | "NodeDeletionDate" ->
          r_node_deletion_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeDeletionDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "NodeUpdateStartDate" ->
          r_node_update_start_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateStartDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "NodeUpdateEndDate" ->
          r_node_update_end_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateEndDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "NodeUpdateInitiatedBy" ->
          r_node_update_initiated_by :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateInitiatedBy"
                 (fun i _ -> node_update_initiated_by_of_xml i)
                 ())
      | "NodeUpdateInitiatedDate" ->
          r_node_update_initiated_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateInitiatedDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "NodeUpdateStatusModifiedDate" ->
          r_node_update_status_modified_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeUpdateStatusModifiedDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     cache_node_id = ( ! ) r_cache_node_id;
     node_update_status = ( ! ) r_node_update_status;
     node_deletion_date = ( ! ) r_node_deletion_date;
     node_update_start_date = ( ! ) r_node_update_start_date;
     node_update_end_date = ( ! ) r_node_update_end_date;
     node_update_initiated_by = ( ! ) r_node_update_initiated_by;
     node_update_initiated_date = ( ! ) r_node_update_initiated_date;
     node_update_status_modified_date = ( ! ) r_node_update_status_modified_date;
   }
    : node_group_member_update_status)

let node_group_member_update_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupMemberUpdateStatus"
    (fun i _ -> node_group_member_update_status_of_xml i)
    ()

let node_group_update_status_of_xml i =
  let r_node_group_id = ref None in
  let r_node_group_member_update_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NodeGroupId"; "NodeGroupMemberUpdateStatus" ]
    (fun tag _ ->
      match tag with
      | "NodeGroupId" ->
          r_node_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupId" (fun i _ -> string__of_xml i) ())
      | "NodeGroupMemberUpdateStatus" ->
          r_node_group_member_update_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupMemberUpdateStatus"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupMemberUpdateStatus"
                     (fun i _ -> node_group_member_update_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     node_group_id = ( ! ) r_node_group_id;
     node_group_member_update_status = ( ! ) r_node_group_member_update_status;
   }
    : node_group_update_status)

let node_group_update_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupUpdateStatus"
    (fun i _ -> node_group_update_status_of_xml i)
    ()

let sla_met_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "yes" -> YES | "no" -> NO | "n/a" -> NA | _ -> failwith "unknown enum value"
    : sla_met)

let update_action_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "not-applied" -> NOT_APPLIED
   | "waiting-to-start" -> WAITING_TO_START
   | "in-progress" -> IN_PROGRESS
   | "stopping" -> STOPPING
   | "stopped" -> STOPPED
   | "complete" -> COMPLETE
   | "scheduling" -> SCHEDULING
   | "scheduled" -> SCHEDULED
   | "not-applicable" -> NOT_APPLICABLE
   | _ -> failwith "unknown enum value"
    : update_action_status)

let service_update_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "security-update" -> SECURITY_UPDATE | _ -> failwith "unknown enum value"
    : service_update_type)

let service_update_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "available" -> AVAILABLE
   | "cancelled" -> CANCELLED
   | "expired" -> EXPIRED
   | _ -> failwith "unknown enum value"
    : service_update_status)

let service_update_severity_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "critical" -> CRITICAL
   | "important" -> IMPORTANT
   | "medium" -> MEDIUM
   | "low" -> LOW
   | _ -> failwith "unknown enum value"
    : service_update_severity)

let update_action_of_xml i =
  let r_replication_group_id = ref None in
  let r_cache_cluster_id = ref None in
  let r_service_update_name = ref None in
  let r_service_update_release_date = ref None in
  let r_service_update_severity = ref None in
  let r_service_update_status = ref None in
  let r_service_update_recommended_apply_by_date = ref None in
  let r_service_update_type = ref None in
  let r_update_action_available_date = ref None in
  let r_update_action_status = ref None in
  let r_nodes_updated = ref None in
  let r_update_action_status_modified_date = ref None in
  let r_sla_met = ref None in
  let r_node_group_update_status = ref None in
  let r_cache_node_update_status = ref None in
  let r_estimated_update_time = ref None in
  let r_engine = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReplicationGroupId";
      "CacheClusterId";
      "ServiceUpdateName";
      "ServiceUpdateReleaseDate";
      "ServiceUpdateSeverity";
      "ServiceUpdateStatus";
      "ServiceUpdateRecommendedApplyByDate";
      "ServiceUpdateType";
      "UpdateActionAvailableDate";
      "UpdateActionStatus";
      "NodesUpdated";
      "UpdateActionStatusModifiedDate";
      "SlaMet";
      "NodeGroupUpdateStatus";
      "CacheNodeUpdateStatus";
      "EstimatedUpdateTime";
      "Engine";
    ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ServiceUpdateName" ->
          r_service_update_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ServiceUpdateReleaseDate" ->
          r_service_update_release_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateReleaseDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ServiceUpdateSeverity" ->
          r_service_update_severity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateSeverity"
                 (fun i _ -> service_update_severity_of_xml i)
                 ())
      | "ServiceUpdateStatus" ->
          r_service_update_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateStatus"
                 (fun i _ -> service_update_status_of_xml i)
                 ())
      | "ServiceUpdateRecommendedApplyByDate" ->
          r_service_update_recommended_apply_by_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateRecommendedApplyByDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ServiceUpdateType" ->
          r_service_update_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateType"
                 (fun i _ -> service_update_type_of_xml i)
                 ())
      | "UpdateActionAvailableDate" ->
          r_update_action_available_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateActionAvailableDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "UpdateActionStatus" ->
          r_update_action_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateActionStatus"
                 (fun i _ -> update_action_status_of_xml i)
                 ())
      | "NodesUpdated" ->
          r_nodes_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodesUpdated" (fun i _ -> string__of_xml i) ())
      | "UpdateActionStatusModifiedDate" ->
          r_update_action_status_modified_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateActionStatusModifiedDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "SlaMet" ->
          r_sla_met :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SlaMet" (fun i _ -> sla_met_of_xml i) ())
      | "NodeGroupUpdateStatus" ->
          r_node_group_update_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupUpdateStatus"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupUpdateStatus"
                     (fun i _ -> node_group_update_status_of_xml i)
                     ())
                 ())
      | "CacheNodeUpdateStatus" ->
          r_cache_node_update_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeUpdateStatus"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeUpdateStatus"
                     (fun i _ -> cache_node_update_status_of_xml i)
                     ())
                 ())
      | "EstimatedUpdateTime" ->
          r_estimated_update_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedUpdateTime"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id = ( ! ) r_replication_group_id;
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     service_update_name = ( ! ) r_service_update_name;
     service_update_release_date = ( ! ) r_service_update_release_date;
     service_update_severity = ( ! ) r_service_update_severity;
     service_update_status = ( ! ) r_service_update_status;
     service_update_recommended_apply_by_date = ( ! ) r_service_update_recommended_apply_by_date;
     service_update_type = ( ! ) r_service_update_type;
     update_action_available_date = ( ! ) r_update_action_available_date;
     update_action_status = ( ! ) r_update_action_status;
     nodes_updated = ( ! ) r_nodes_updated;
     update_action_status_modified_date = ( ! ) r_update_action_status_modified_date;
     sla_met = ( ! ) r_sla_met;
     node_group_update_status = ( ! ) r_node_group_update_status;
     cache_node_update_status = ( ! ) r_cache_node_update_status;
     estimated_update_time = ( ! ) r_estimated_update_time;
     engine = ( ! ) r_engine;
   }
    : update_action)

let update_action_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "UpdateAction" (fun i _ -> update_action_of_xml i) ()

let update_actions_message_of_xml i =
  let r_marker = ref None in
  let r_update_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "UpdateActions" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "UpdateActions" ->
          r_update_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "UpdateAction"
                     (fun i _ -> update_action_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; update_actions = ( ! ) r_update_actions } : update_actions_message)

let update_action_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> update_action_status_of_xml i) ()

let time_range_filter_of_xml i =
  let r_start_time = ref None in
  let r_end_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StartTime"; "EndTime" ] (fun tag _ ->
      match tag with
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ start_time = ( ! ) r_start_time; end_time = ( ! ) r_end_time } : time_range_filter)

let service_update_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> service_update_status_of_xml i) ()

let cache_cluster_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let replication_group_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let describe_update_actions_message_of_xml i =
  let r_service_update_name = ref None in
  let r_replication_group_ids = ref None in
  let r_cache_cluster_ids = ref None in
  let r_engine = ref None in
  let r_service_update_status = ref None in
  let r_service_update_time_range = ref None in
  let r_update_action_status = ref None in
  let r_show_node_level_update_status = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ServiceUpdateName";
      "ReplicationGroupIds";
      "CacheClusterIds";
      "Engine";
      "ServiceUpdateStatus";
      "ServiceUpdateTimeRange";
      "UpdateActionStatus";
      "ShowNodeLevelUpdateStatus";
      "MaxRecords";
      "Marker";
    ] (fun tag _ ->
      match tag with
      | "ServiceUpdateName" ->
          r_service_update_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicationGroupIds" ->
          r_replication_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "CacheClusterIds" ->
          r_cache_cluster_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "ServiceUpdateStatus" ->
          r_service_update_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateStatus"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> service_update_status_of_xml i)
                     ())
                 ())
      | "ServiceUpdateTimeRange" ->
          r_service_update_time_range :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateTimeRange"
                 (fun i _ -> time_range_filter_of_xml i)
                 ())
      | "UpdateActionStatus" ->
          r_update_action_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateActionStatus"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> update_action_status_of_xml i)
                     ())
                 ())
      | "ShowNodeLevelUpdateStatus" ->
          r_show_node_level_update_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShowNodeLevelUpdateStatus"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     service_update_name = ( ! ) r_service_update_name;
     replication_group_ids = ( ! ) r_replication_group_ids;
     cache_cluster_ids = ( ! ) r_cache_cluster_ids;
     engine = ( ! ) r_engine;
     service_update_status = ( ! ) r_service_update_status;
     service_update_time_range = ( ! ) r_service_update_time_range;
     update_action_status = ( ! ) r_update_action_status;
     show_node_level_update_status = ( ! ) r_show_node_level_update_status;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_update_actions_message)

let outpost_arns_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "OutpostArn" (fun i _ -> string__of_xml i) ()

let node_group_configuration_of_xml i =
  let r_node_group_id = ref None in
  let r_slots = ref None in
  let r_replica_count = ref None in
  let r_primary_availability_zone = ref None in
  let r_replica_availability_zones = ref None in
  let r_primary_outpost_arn = ref None in
  let r_replica_outpost_arns = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NodeGroupId";
      "Slots";
      "ReplicaCount";
      "PrimaryAvailabilityZone";
      "ReplicaAvailabilityZones";
      "PrimaryOutpostArn";
      "ReplicaOutpostArns";
    ] (fun tag _ ->
      match tag with
      | "NodeGroupId" ->
          r_node_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupId"
                 (fun i _ -> allowed_node_group_id_of_xml i)
                 ())
      | "Slots" ->
          r_slots :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Slots" (fun i _ -> string__of_xml i) ())
      | "ReplicaCount" ->
          r_replica_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicaCount"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "PrimaryAvailabilityZone" ->
          r_primary_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrimaryAvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicaAvailabilityZones" ->
          r_replica_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicaAvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "PrimaryOutpostArn" ->
          r_primary_outpost_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrimaryOutpostArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicaOutpostArns" ->
          r_replica_outpost_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicaOutpostArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "OutpostArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     node_group_id = ( ! ) r_node_group_id;
     slots = ( ! ) r_slots;
     replica_count = ( ! ) r_replica_count;
     primary_availability_zone = ( ! ) r_primary_availability_zone;
     replica_availability_zones = ( ! ) r_replica_availability_zones;
     primary_outpost_arn = ( ! ) r_primary_outpost_arn;
     replica_outpost_arns = ( ! ) r_replica_outpost_arns;
   }
    : node_group_configuration)

let node_snapshot_of_xml i =
  let r_cache_cluster_id = ref None in
  let r_node_group_id = ref None in
  let r_cache_node_id = ref None in
  let r_node_group_configuration = ref None in
  let r_cache_size = ref None in
  let r_cache_node_create_time = ref None in
  let r_snapshot_create_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CacheClusterId";
      "NodeGroupId";
      "CacheNodeId";
      "NodeGroupConfiguration";
      "CacheSize";
      "CacheNodeCreateTime";
      "SnapshotCreateTime";
    ] (fun tag _ ->
      match tag with
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeGroupId" ->
          r_node_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupId" (fun i _ -> string__of_xml i) ())
      | "CacheNodeId" ->
          r_cache_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeId" (fun i _ -> string__of_xml i) ())
      | "NodeGroupConfiguration" ->
          r_node_group_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupConfiguration"
                 (fun i _ -> node_group_configuration_of_xml i)
                 ())
      | "CacheSize" ->
          r_cache_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSize" (fun i _ -> string__of_xml i) ())
      | "CacheNodeCreateTime" ->
          r_cache_node_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "SnapshotCreateTime" ->
          r_snapshot_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     node_group_id = ( ! ) r_node_group_id;
     cache_node_id = ( ! ) r_cache_node_id;
     node_group_configuration = ( ! ) r_node_group_configuration;
     cache_size = ( ! ) r_cache_size;
     cache_node_create_time = ( ! ) r_cache_node_create_time;
     snapshot_create_time = ( ! ) r_snapshot_create_time;
   }
    : node_snapshot)

let node_snapshot_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeSnapshot" (fun i _ -> node_snapshot_of_xml i) ()

let snapshot_of_xml i =
  let r_snapshot_name = ref None in
  let r_replication_group_id = ref None in
  let r_replication_group_description = ref None in
  let r_cache_cluster_id = ref None in
  let r_snapshot_status = ref None in
  let r_snapshot_source = ref None in
  let r_cache_node_type = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_num_cache_nodes = ref None in
  let r_preferred_availability_zone = ref None in
  let r_preferred_outpost_arn = ref None in
  let r_cache_cluster_create_time = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_topic_arn = ref None in
  let r_port = ref None in
  let r_cache_parameter_group_name = ref None in
  let r_cache_subnet_group_name = ref None in
  let r_vpc_id = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_snapshot_retention_limit = ref None in
  let r_snapshot_window = ref None in
  let r_num_node_groups = ref None in
  let r_automatic_failover = ref None in
  let r_node_snapshots = ref None in
  let r_kms_key_id = ref None in
  let r_ar_n = ref None in
  let r_data_tiering = ref None in
  let r_durability = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SnapshotName";
      "ReplicationGroupId";
      "ReplicationGroupDescription";
      "CacheClusterId";
      "SnapshotStatus";
      "SnapshotSource";
      "CacheNodeType";
      "Engine";
      "EngineVersion";
      "NumCacheNodes";
      "PreferredAvailabilityZone";
      "PreferredOutpostArn";
      "CacheClusterCreateTime";
      "PreferredMaintenanceWindow";
      "TopicArn";
      "Port";
      "CacheParameterGroupName";
      "CacheSubnetGroupName";
      "VpcId";
      "AutoMinorVersionUpgrade";
      "SnapshotRetentionLimit";
      "SnapshotWindow";
      "NumNodeGroups";
      "AutomaticFailover";
      "NodeSnapshots";
      "KmsKeyId";
      "ARN";
      "DataTiering";
      "Durability";
    ] (fun tag _ ->
      match tag with
      | "SnapshotName" ->
          r_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotName" (fun i _ -> string__of_xml i) ())
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicationGroupDescription" ->
          r_replication_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotStatus" ->
          r_snapshot_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotSource" ->
          r_snapshot_source :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotSource"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "NumCacheNodes" ->
          r_num_cache_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumCacheNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "PreferredAvailabilityZone" ->
          r_preferred_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredAvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredOutpostArn" ->
          r_preferred_outpost_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredOutpostArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheClusterCreateTime" ->
          r_cache_cluster_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TopicArn" ->
          r_topic_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheSubnetGroupName" ->
          r_cache_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SnapshotRetentionLimit" ->
          r_snapshot_retention_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionLimit"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotWindow" ->
          r_snapshot_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NumNodeGroups" ->
          r_num_node_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumNodeGroups"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "AutomaticFailover" ->
          r_automatic_failover :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomaticFailover"
                 (fun i _ -> automatic_failover_status_of_xml i)
                 ())
      | "NodeSnapshots" ->
          r_node_snapshots :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeSnapshots"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeSnapshot"
                     (fun i _ -> node_snapshot_of_xml i)
                     ())
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "ARN" ->
          r_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> string__of_xml i) ())
      | "DataTiering" ->
          r_data_tiering :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataTiering"
                 (fun i _ -> data_tiering_status_of_xml i)
                 ())
      | "Durability" ->
          r_durability :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Durability" (fun i _ -> durability_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_name = ( ! ) r_snapshot_name;
     replication_group_id = ( ! ) r_replication_group_id;
     replication_group_description = ( ! ) r_replication_group_description;
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     snapshot_status = ( ! ) r_snapshot_status;
     snapshot_source = ( ! ) r_snapshot_source;
     cache_node_type = ( ! ) r_cache_node_type;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     num_cache_nodes = ( ! ) r_num_cache_nodes;
     preferred_availability_zone = ( ! ) r_preferred_availability_zone;
     preferred_outpost_arn = ( ! ) r_preferred_outpost_arn;
     cache_cluster_create_time = ( ! ) r_cache_cluster_create_time;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     topic_arn = ( ! ) r_topic_arn;
     port = ( ! ) r_port;
     cache_parameter_group_name = ( ! ) r_cache_parameter_group_name;
     cache_subnet_group_name = ( ! ) r_cache_subnet_group_name;
     vpc_id = ( ! ) r_vpc_id;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     snapshot_retention_limit = ( ! ) r_snapshot_retention_limit;
     snapshot_window = ( ! ) r_snapshot_window;
     num_node_groups = ( ! ) r_num_node_groups;
     automatic_failover = ( ! ) r_automatic_failover;
     node_snapshots = ( ! ) r_node_snapshots;
     kms_key_id = ( ! ) r_kms_key_id;
     ar_n = ( ! ) r_ar_n;
     data_tiering = ( ! ) r_data_tiering;
     durability = ( ! ) r_durability;
   }
    : snapshot)

let snapshot_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Snapshot" (fun i _ -> snapshot_of_xml i) ()

let describe_snapshots_list_message_of_xml i =
  let r_marker = ref None in
  let r_snapshots = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "Snapshots" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "Snapshots" ->
          r_snapshots :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshots"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; snapshots = ( ! ) r_snapshots } : describe_snapshots_list_message)

let describe_snapshots_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_cache_cluster_id = ref None in
  let r_snapshot_name = ref None in
  let r_snapshot_source = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_show_node_group_config = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReplicationGroupId";
      "CacheClusterId";
      "SnapshotName";
      "SnapshotSource";
      "Marker";
      "MaxRecords";
      "ShowNodeGroupConfig";
    ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotName" ->
          r_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotName" (fun i _ -> string__of_xml i) ())
      | "SnapshotSource" ->
          r_snapshot_source :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotSource"
                 (fun i _ -> string__of_xml i)
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
      | "ShowNodeGroupConfig" ->
          r_show_node_group_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShowNodeGroupConfig"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id = ( ! ) r_replication_group_id;
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     snapshot_name = ( ! ) r_snapshot_name;
     snapshot_source = ( ! ) r_snapshot_source;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     show_node_group_config = ( ! ) r_show_node_group_config;
   }
    : describe_snapshots_message)

let service_update_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : service_update_not_found_fault)

let service_update_of_xml i =
  let r_service_update_name = ref None in
  let r_service_update_release_date = ref None in
  let r_service_update_end_date = ref None in
  let r_service_update_severity = ref None in
  let r_service_update_recommended_apply_by_date = ref None in
  let r_service_update_status = ref None in
  let r_service_update_description = ref None in
  let r_service_update_type = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_auto_update_after_recommended_apply_by_date = ref None in
  let r_estimated_update_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ServiceUpdateName";
      "ServiceUpdateReleaseDate";
      "ServiceUpdateEndDate";
      "ServiceUpdateSeverity";
      "ServiceUpdateRecommendedApplyByDate";
      "ServiceUpdateStatus";
      "ServiceUpdateDescription";
      "ServiceUpdateType";
      "Engine";
      "EngineVersion";
      "AutoUpdateAfterRecommendedApplyByDate";
      "EstimatedUpdateTime";
    ] (fun tag _ ->
      match tag with
      | "ServiceUpdateName" ->
          r_service_update_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ServiceUpdateReleaseDate" ->
          r_service_update_release_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateReleaseDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ServiceUpdateEndDate" ->
          r_service_update_end_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateEndDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ServiceUpdateSeverity" ->
          r_service_update_severity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateSeverity"
                 (fun i _ -> service_update_severity_of_xml i)
                 ())
      | "ServiceUpdateRecommendedApplyByDate" ->
          r_service_update_recommended_apply_by_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateRecommendedApplyByDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ServiceUpdateStatus" ->
          r_service_update_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateStatus"
                 (fun i _ -> service_update_status_of_xml i)
                 ())
      | "ServiceUpdateDescription" ->
          r_service_update_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ServiceUpdateType" ->
          r_service_update_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateType"
                 (fun i _ -> service_update_type_of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "AutoUpdateAfterRecommendedApplyByDate" ->
          r_auto_update_after_recommended_apply_by_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoUpdateAfterRecommendedApplyByDate"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EstimatedUpdateTime" ->
          r_estimated_update_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedUpdateTime"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     service_update_name = ( ! ) r_service_update_name;
     service_update_release_date = ( ! ) r_service_update_release_date;
     service_update_end_date = ( ! ) r_service_update_end_date;
     service_update_severity = ( ! ) r_service_update_severity;
     service_update_recommended_apply_by_date = ( ! ) r_service_update_recommended_apply_by_date;
     service_update_status = ( ! ) r_service_update_status;
     service_update_description = ( ! ) r_service_update_description;
     service_update_type = ( ! ) r_service_update_type;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     auto_update_after_recommended_apply_by_date =
       ( ! ) r_auto_update_after_recommended_apply_by_date;
     estimated_update_time = ( ! ) r_estimated_update_time;
   }
    : service_update)

let service_update_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ServiceUpdate" (fun i _ -> service_update_of_xml i) ()

let service_updates_message_of_xml i =
  let r_marker = ref None in
  let r_service_updates = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ServiceUpdates" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ServiceUpdates" ->
          r_service_updates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ServiceUpdate"
                     (fun i _ -> service_update_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; service_updates = ( ! ) r_service_updates } : service_updates_message)

let describe_service_updates_message_of_xml i =
  let r_service_update_name = ref None in
  let r_service_update_status = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ServiceUpdateName"; "ServiceUpdateStatus"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "ServiceUpdateName" ->
          r_service_update_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ServiceUpdateStatus" ->
          r_service_update_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateStatus"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> service_update_status_of_xml i)
                     ())
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     service_update_name = ( ! ) r_service_update_name;
     service_update_status = ( ! ) r_service_update_status;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_service_updates_message)

let serverless_cache_snapshot_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ServerlessCacheSnapshot"
    (fun i _ -> serverless_cache_snapshot_of_xml i)
    ()

let describe_serverless_cache_snapshots_response_of_xml i =
  let r_next_token = ref None in
  let r_serverless_cache_snapshots = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "ServerlessCacheSnapshots" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | "ServerlessCacheSnapshots" ->
          r_serverless_cache_snapshots :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheSnapshots"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ServerlessCacheSnapshot"
                     (fun i _ -> serverless_cache_snapshot_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     serverless_cache_snapshots = ( ! ) r_serverless_cache_snapshots;
   }
    : describe_serverless_cache_snapshots_response)

let describe_serverless_cache_snapshots_request_of_xml i =
  let r_serverless_cache_name = ref None in
  let r_serverless_cache_snapshot_name = ref None in
  let r_snapshot_type = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ServerlessCacheName";
      "ServerlessCacheSnapshotName";
      "SnapshotType";
      "NextToken";
      "MaxResults";
    ] (fun tag _ ->
      match tag with
      | "ServerlessCacheName" ->
          r_serverless_cache_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ServerlessCacheSnapshotName" ->
          r_serverless_cache_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheSnapshotName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotType" ->
          r_snapshot_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotType" (fun i _ -> string__of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serverless_cache_name = ( ! ) r_serverless_cache_name;
     serverless_cache_snapshot_name = ( ! ) r_serverless_cache_snapshot_name;
     snapshot_type = ( ! ) r_snapshot_type;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
   }
    : describe_serverless_cache_snapshots_request)

let serverless_cache_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> serverless_cache_of_xml i) ()

let describe_serverless_caches_response_of_xml i =
  let r_next_token = ref None in
  let r_serverless_caches = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "ServerlessCaches" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | "ServerlessCaches" ->
          r_serverless_caches :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCaches"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> serverless_cache_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; serverless_caches = ( ! ) r_serverless_caches }
    : describe_serverless_caches_response)

let describe_serverless_caches_request_of_xml i =
  let r_serverless_cache_name = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessCacheName"; "MaxResults"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "ServerlessCacheName" ->
          r_serverless_cache_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serverless_cache_name = ( ! ) r_serverless_cache_name;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
   }
    : describe_serverless_caches_request)

let reserved_cache_nodes_offering_of_xml i =
  let r_reserved_cache_nodes_offering_id = ref None in
  let r_cache_node_type = ref None in
  let r_duration = ref None in
  let r_fixed_price = ref None in
  let r_usage_price = ref None in
  let r_product_description = ref None in
  let r_offering_type = ref None in
  let r_recurring_charges = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReservedCacheNodesOfferingId";
      "CacheNodeType";
      "Duration";
      "FixedPrice";
      "UsagePrice";
      "ProductDescription";
      "OfferingType";
      "RecurringCharges";
    ] (fun tag _ ->
      match tag with
      | "ReservedCacheNodesOfferingId" ->
          r_reserved_cache_nodes_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedCacheNodesOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "Duration" ->
          r_duration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Duration" (fun i _ -> integer_of_xml i) ())
      | "FixedPrice" ->
          r_fixed_price :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "FixedPrice" (fun i _ -> double_of_xml i) ())
      | "UsagePrice" ->
          r_usage_price :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UsagePrice" (fun i _ -> double_of_xml i) ())
      | "ProductDescription" ->
          r_product_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProductDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "OfferingType" ->
          r_offering_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OfferingType" (fun i _ -> string__of_xml i) ())
      | "RecurringCharges" ->
          r_recurring_charges :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecurringCharges"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "RecurringCharge"
                     (fun i _ -> recurring_charge_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_cache_nodes_offering_id = ( ! ) r_reserved_cache_nodes_offering_id;
     cache_node_type = ( ! ) r_cache_node_type;
     duration = ( ! ) r_duration;
     fixed_price = ( ! ) r_fixed_price;
     usage_price = ( ! ) r_usage_price;
     product_description = ( ! ) r_product_description;
     offering_type = ( ! ) r_offering_type;
     recurring_charges = ( ! ) r_recurring_charges;
   }
    : reserved_cache_nodes_offering)

let reserved_cache_nodes_offering_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReservedCacheNodesOffering"
    (fun i _ -> reserved_cache_nodes_offering_of_xml i)
    ()

let reserved_cache_nodes_offering_message_of_xml i =
  let r_marker = ref None in
  let r_reserved_cache_nodes_offerings = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ReservedCacheNodesOfferings" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ReservedCacheNodesOfferings" ->
          r_reserved_cache_nodes_offerings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedCacheNodesOfferings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedCacheNodesOffering"
                     (fun i _ -> reserved_cache_nodes_offering_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     reserved_cache_nodes_offerings = ( ! ) r_reserved_cache_nodes_offerings;
   }
    : reserved_cache_nodes_offering_message)

let describe_reserved_cache_nodes_offerings_message_of_xml i =
  let r_reserved_cache_nodes_offering_id = ref None in
  let r_cache_node_type = ref None in
  let r_duration = ref None in
  let r_product_description = ref None in
  let r_offering_type = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReservedCacheNodesOfferingId";
      "CacheNodeType";
      "Duration";
      "ProductDescription";
      "OfferingType";
      "MaxRecords";
      "Marker";
    ] (fun tag _ ->
      match tag with
      | "ReservedCacheNodesOfferingId" ->
          r_reserved_cache_nodes_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedCacheNodesOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "Duration" ->
          r_duration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Duration" (fun i _ -> string__of_xml i) ())
      | "ProductDescription" ->
          r_product_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProductDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "OfferingType" ->
          r_offering_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OfferingType" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_cache_nodes_offering_id = ( ! ) r_reserved_cache_nodes_offering_id;
     cache_node_type = ( ! ) r_cache_node_type;
     duration = ( ! ) r_duration;
     product_description = ( ! ) r_product_description;
     offering_type = ( ! ) r_offering_type;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_reserved_cache_nodes_offerings_message)

let reserved_cache_node_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReservedCacheNode"
    (fun i _ -> reserved_cache_node_of_xml i)
    ()

let reserved_cache_node_message_of_xml i =
  let r_marker = ref None in
  let r_reserved_cache_nodes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ReservedCacheNodes" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ReservedCacheNodes" ->
          r_reserved_cache_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedCacheNodes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedCacheNode"
                     (fun i _ -> reserved_cache_node_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; reserved_cache_nodes = ( ! ) r_reserved_cache_nodes }
    : reserved_cache_node_message)

let describe_reserved_cache_nodes_message_of_xml i =
  let r_reserved_cache_node_id = ref None in
  let r_reserved_cache_nodes_offering_id = ref None in
  let r_cache_node_type = ref None in
  let r_duration = ref None in
  let r_product_description = ref None in
  let r_offering_type = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReservedCacheNodeId";
      "ReservedCacheNodesOfferingId";
      "CacheNodeType";
      "Duration";
      "ProductDescription";
      "OfferingType";
      "MaxRecords";
      "Marker";
    ] (fun tag _ ->
      match tag with
      | "ReservedCacheNodeId" ->
          r_reserved_cache_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedCacheNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedCacheNodesOfferingId" ->
          r_reserved_cache_nodes_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedCacheNodesOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "Duration" ->
          r_duration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Duration" (fun i _ -> string__of_xml i) ())
      | "ProductDescription" ->
          r_product_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProductDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "OfferingType" ->
          r_offering_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OfferingType" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_cache_node_id = ( ! ) r_reserved_cache_node_id;
     reserved_cache_nodes_offering_id = ( ! ) r_reserved_cache_nodes_offering_id;
     cache_node_type = ( ! ) r_cache_node_type;
     duration = ( ! ) r_duration;
     product_description = ( ! ) r_product_description;
     offering_type = ( ! ) r_offering_type;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_reserved_cache_nodes_message)

let replication_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReplicationGroup" (fun i _ -> replication_group_of_xml i) ()

let replication_group_message_of_xml i =
  let r_marker = ref None in
  let r_replication_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ReplicationGroups" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ReplicationGroups" ->
          r_replication_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReplicationGroup"
                     (fun i _ -> replication_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; replication_groups = ( ! ) r_replication_groups }
    : replication_group_message)

let describe_replication_groups_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroupId"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id = ( ! ) r_replication_group_id;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_replication_groups_message)

let global_replication_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "GlobalReplicationGroup"
    (fun i _ -> global_replication_group_of_xml i)
    ()

let describe_global_replication_groups_result_of_xml i =
  let r_marker = ref None in
  let r_global_replication_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "GlobalReplicationGroups" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "GlobalReplicationGroups" ->
          r_global_replication_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "GlobalReplicationGroup"
                     (fun i _ -> global_replication_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; global_replication_groups = ( ! ) r_global_replication_groups }
    : describe_global_replication_groups_result)

let describe_global_replication_groups_message_of_xml i =
  let r_global_replication_group_id = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_show_member_info = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "GlobalReplicationGroupId"; "MaxRecords"; "Marker"; "ShowMemberInfo" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroupId" ->
          r_global_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ShowMemberInfo" ->
          r_show_member_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShowMemberInfo"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_replication_group_id = ( ! ) r_global_replication_group_id;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     show_member_info = ( ! ) r_show_member_info;
   }
    : describe_global_replication_groups_message)

let source_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "cache-cluster" -> Cache_cluster
   | "cache-parameter-group" -> Cache_parameter_group
   | "cache-security-group" -> Cache_security_group
   | "cache-subnet-group" -> Cache_subnet_group
   | "replication-group" -> Replication_group
   | "serverless-cache" -> Serverless_cache
   | "serverless-cache-snapshot" -> Serverless_cache_snapshot
   | "user" -> User
   | "user-group" -> User_group
   | _ -> failwith "unknown enum value"
    : source_type)

let event_of_xml i =
  let r_source_identifier = ref None in
  let r_source_type = ref None in
  let r_message = ref None in
  let r_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourceIdentifier"; "SourceType"; "Message"; "Date" ] (fun tag _ ->
      match tag with
      | "SourceIdentifier" ->
          r_source_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceType" ->
          r_source_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType"
                 (fun i _ -> source_type_of_xml i)
                 ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | "Date" ->
          r_date :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Date" (fun i _ -> t_stamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_identifier = ( ! ) r_source_identifier;
     source_type = ( ! ) r_source_type;
     message = ( ! ) r_message;
     date = ( ! ) r_date;
   }
    : event)

let event_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Event" (fun i _ -> event_of_xml i) ()

let events_message_of_xml i =
  let r_marker = ref None in
  let r_events = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "Events" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "Events" ->
          r_events :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Events"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Event" (fun i _ -> event_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; events = ( ! ) r_events } : events_message)

let describe_events_message_of_xml i =
  let r_source_identifier = ref None in
  let r_source_type = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_duration = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourceIdentifier"; "SourceType"; "StartTime"; "EndTime"; "Duration"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "SourceIdentifier" ->
          r_source_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceType" ->
          r_source_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType"
                 (fun i _ -> source_type_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | "Duration" ->
          r_duration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Duration"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_identifier = ( ! ) r_source_identifier;
     source_type = ( ! ) r_source_type;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     duration = ( ! ) r_duration;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_events_message)

let change_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "immediate" -> Immediate
   | "requires-reboot" -> Requires_reboot
   | _ -> failwith "unknown enum value"
    : change_type)

let cache_node_type_specific_value_of_xml i =
  let r_cache_node_type = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheNodeType"; "Value" ] (fun tag _ ->
      match tag with
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_node_type = ( ! ) r_cache_node_type; value = ( ! ) r_value }
    : cache_node_type_specific_value)

let cache_node_type_specific_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeTypeSpecificValue"
    (fun i _ -> cache_node_type_specific_value_of_xml i)
    ()

let cache_node_type_specific_parameter_of_xml i =
  let r_parameter_name = ref None in
  let r_description = ref None in
  let r_source = ref None in
  let r_data_type = ref None in
  let r_allowed_values = ref None in
  let r_is_modifiable = ref None in
  let r_minimum_engine_version = ref None in
  let r_cache_node_type_specific_values = ref None in
  let r_change_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ParameterName";
      "Description";
      "Source";
      "DataType";
      "AllowedValues";
      "IsModifiable";
      "MinimumEngineVersion";
      "CacheNodeTypeSpecificValues";
      "ChangeType";
    ] (fun tag _ ->
      match tag with
      | "ParameterName" ->
          r_parameter_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterName" (fun i _ -> string__of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> string__of_xml i) ())
      | "DataType" ->
          r_data_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DataType" (fun i _ -> string__of_xml i) ())
      | "AllowedValues" ->
          r_allowed_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedValues" (fun i _ -> string__of_xml i) ())
      | "IsModifiable" ->
          r_is_modifiable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsModifiable" (fun i _ -> boolean__of_xml i) ())
      | "MinimumEngineVersion" ->
          r_minimum_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinimumEngineVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheNodeTypeSpecificValues" ->
          r_cache_node_type_specific_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeTypeSpecificValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeTypeSpecificValue"
                     (fun i _ -> cache_node_type_specific_value_of_xml i)
                     ())
                 ())
      | "ChangeType" ->
          r_change_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeType"
                 (fun i _ -> change_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_name = ( ! ) r_parameter_name;
     description = ( ! ) r_description;
     source = ( ! ) r_source;
     data_type = ( ! ) r_data_type;
     allowed_values = ( ! ) r_allowed_values;
     is_modifiable = ( ! ) r_is_modifiable;
     minimum_engine_version = ( ! ) r_minimum_engine_version;
     cache_node_type_specific_values = ( ! ) r_cache_node_type_specific_values;
     change_type = ( ! ) r_change_type;
   }
    : cache_node_type_specific_parameter)

let cache_node_type_specific_parameters_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeTypeSpecificParameter"
    (fun i _ -> cache_node_type_specific_parameter_of_xml i)
    ()

let parameter_of_xml i =
  let r_parameter_name = ref None in
  let r_parameter_value = ref None in
  let r_description = ref None in
  let r_source = ref None in
  let r_data_type = ref None in
  let r_allowed_values = ref None in
  let r_is_modifiable = ref None in
  let r_minimum_engine_version = ref None in
  let r_change_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ParameterName";
      "ParameterValue";
      "Description";
      "Source";
      "DataType";
      "AllowedValues";
      "IsModifiable";
      "MinimumEngineVersion";
      "ChangeType";
    ] (fun tag _ ->
      match tag with
      | "ParameterName" ->
          r_parameter_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterName" (fun i _ -> string__of_xml i) ())
      | "ParameterValue" ->
          r_parameter_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterValue"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> string__of_xml i) ())
      | "DataType" ->
          r_data_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DataType" (fun i _ -> string__of_xml i) ())
      | "AllowedValues" ->
          r_allowed_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedValues" (fun i _ -> string__of_xml i) ())
      | "IsModifiable" ->
          r_is_modifiable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsModifiable" (fun i _ -> boolean__of_xml i) ())
      | "MinimumEngineVersion" ->
          r_minimum_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinimumEngineVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ChangeType" ->
          r_change_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeType"
                 (fun i _ -> change_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_name = ( ! ) r_parameter_name;
     parameter_value = ( ! ) r_parameter_value;
     description = ( ! ) r_description;
     source = ( ! ) r_source;
     data_type = ( ! ) r_data_type;
     allowed_values = ( ! ) r_allowed_values;
     is_modifiable = ( ! ) r_is_modifiable;
     minimum_engine_version = ( ! ) r_minimum_engine_version;
     change_type = ( ! ) r_change_type;
   }
    : parameter)

let parameters_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Parameter" (fun i _ -> parameter_of_xml i) ()

let engine_defaults_of_xml i =
  let r_cache_parameter_group_family = ref None in
  let r_marker = ref None in
  let r_parameters = ref None in
  let r_cache_node_type_specific_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CacheParameterGroupFamily"; "Marker"; "Parameters"; "CacheNodeTypeSpecificParameters" ]
    (fun tag _ ->
      match tag with
      | "CacheParameterGroupFamily" ->
          r_cache_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
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
      | "CacheNodeTypeSpecificParameters" ->
          r_cache_node_type_specific_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeTypeSpecificParameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeTypeSpecificParameter"
                     (fun i _ -> cache_node_type_specific_parameter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_parameter_group_family = ( ! ) r_cache_parameter_group_family;
     marker = ( ! ) r_marker;
     parameters = ( ! ) r_parameters;
     cache_node_type_specific_parameters = ( ! ) r_cache_node_type_specific_parameters;
   }
    : engine_defaults)

let describe_engine_default_parameters_result_of_xml i =
  let r_engine_defaults = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EngineDefaults" ] (fun tag _ ->
      match tag with
      | "EngineDefaults" ->
          r_engine_defaults :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineDefaults"
                 (fun i _ -> engine_defaults_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ engine_defaults = ( ! ) r_engine_defaults } : describe_engine_default_parameters_result)

let describe_engine_default_parameters_message_of_xml i =
  let r_cache_parameter_group_family = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CacheParameterGroupFamily"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "CacheParameterGroupFamily" ->
          r_cache_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_parameter_group_family =
       Smaws_Lib.Xml.Parse.required "CacheParameterGroupFamily"
         (( ! ) r_cache_parameter_group_family)
         i;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_engine_default_parameters_message)

let cache_subnet_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheSubnetGroup"
    (fun i _ -> cache_subnet_group_of_xml i)
    ()

let cache_subnet_group_message_of_xml i =
  let r_marker = ref None in
  let r_cache_subnet_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "CacheSubnetGroups" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "CacheSubnetGroups" ->
          r_cache_subnet_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheSubnetGroup"
                     (fun i _ -> cache_subnet_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; cache_subnet_groups = ( ! ) r_cache_subnet_groups }
    : cache_subnet_group_message)

let describe_cache_subnet_groups_message_of_xml i =
  let r_cache_subnet_group_name = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheSubnetGroupName"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "CacheSubnetGroupName" ->
          r_cache_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_subnet_group_name = ( ! ) r_cache_subnet_group_name;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_cache_subnet_groups_message)

let cache_security_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheSecurityGroup"
    (fun i _ -> cache_security_group_of_xml i)
    ()

let cache_security_group_message_of_xml i =
  let r_marker = ref None in
  let r_cache_security_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "CacheSecurityGroups" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "CacheSecurityGroups" ->
          r_cache_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheSecurityGroup"
                     (fun i _ -> cache_security_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; cache_security_groups = ( ! ) r_cache_security_groups }
    : cache_security_group_message)

let describe_cache_security_groups_message_of_xml i =
  let r_cache_security_group_name = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheSecurityGroupName"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "CacheSecurityGroupName" ->
          r_cache_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_security_group_name = ( ! ) r_cache_security_group_name;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_cache_security_groups_message)

let cache_parameter_group_details_of_xml i =
  let r_marker = ref None in
  let r_parameters = ref None in
  let r_cache_node_type_specific_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "Parameters"; "CacheNodeTypeSpecificParameters" ] (fun tag _ ->
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
      | "CacheNodeTypeSpecificParameters" ->
          r_cache_node_type_specific_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeTypeSpecificParameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheNodeTypeSpecificParameter"
                     (fun i _ -> cache_node_type_specific_parameter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     parameters = ( ! ) r_parameters;
     cache_node_type_specific_parameters = ( ! ) r_cache_node_type_specific_parameters;
   }
    : cache_parameter_group_details)

let describe_cache_parameters_message_of_xml i =
  let r_cache_parameter_group_name = ref None in
  let r_source = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CacheParameterGroupName"; "Source"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "CacheParameterGroupName" (( ! ) r_cache_parameter_group_name) i;
     source = ( ! ) r_source;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_cache_parameters_message)

let cache_parameter_group_of_xml i =
  let r_cache_parameter_group_name = ref None in
  let r_cache_parameter_group_family = ref None in
  let r_description = ref None in
  let r_is_global = ref None in
  let r_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CacheParameterGroupName"; "CacheParameterGroupFamily"; "Description"; "IsGlobal"; "ARN" ]
    (fun tag _ ->
      match tag with
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheParameterGroupFamily" ->
          r_cache_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "IsGlobal" ->
          r_is_global :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IsGlobal" (fun i _ -> boolean__of_xml i) ())
      | "ARN" ->
          r_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_parameter_group_name = ( ! ) r_cache_parameter_group_name;
     cache_parameter_group_family = ( ! ) r_cache_parameter_group_family;
     description = ( ! ) r_description;
     is_global = ( ! ) r_is_global;
     ar_n = ( ! ) r_ar_n;
   }
    : cache_parameter_group)

let cache_parameter_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheParameterGroup"
    (fun i _ -> cache_parameter_group_of_xml i)
    ()

let cache_parameter_groups_message_of_xml i =
  let r_marker = ref None in
  let r_cache_parameter_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "CacheParameterGroups" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "CacheParameterGroups" ->
          r_cache_parameter_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheParameterGroup"
                     (fun i _ -> cache_parameter_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; cache_parameter_groups = ( ! ) r_cache_parameter_groups }
    : cache_parameter_groups_message)

let describe_cache_parameter_groups_message_of_xml i =
  let r_cache_parameter_group_name = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheParameterGroupName"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_parameter_group_name = ( ! ) r_cache_parameter_group_name;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_cache_parameter_groups_message)

let cache_engine_version_of_xml i =
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_cache_parameter_group_family = ref None in
  let r_cache_engine_description = ref None in
  let r_cache_engine_version_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Engine";
      "EngineVersion";
      "CacheParameterGroupFamily";
      "CacheEngineDescription";
      "CacheEngineVersionDescription";
    ] (fun tag _ ->
      match tag with
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "CacheParameterGroupFamily" ->
          r_cache_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheEngineDescription" ->
          r_cache_engine_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheEngineDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheEngineVersionDescription" ->
          r_cache_engine_version_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheEngineVersionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     cache_parameter_group_family = ( ! ) r_cache_parameter_group_family;
     cache_engine_description = ( ! ) r_cache_engine_description;
     cache_engine_version_description = ( ! ) r_cache_engine_version_description;
   }
    : cache_engine_version)

let cache_engine_version_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheEngineVersion"
    (fun i _ -> cache_engine_version_of_xml i)
    ()

let cache_engine_version_message_of_xml i =
  let r_marker = ref None in
  let r_cache_engine_versions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "CacheEngineVersions" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "CacheEngineVersions" ->
          r_cache_engine_versions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheEngineVersions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheEngineVersion"
                     (fun i _ -> cache_engine_version_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; cache_engine_versions = ( ! ) r_cache_engine_versions }
    : cache_engine_version_message)

let describe_cache_engine_versions_message_of_xml i =
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_cache_parameter_group_family = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_default_only = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Engine"; "EngineVersion"; "CacheParameterGroupFamily"; "MaxRecords"; "Marker"; "DefaultOnly";
    ] (fun tag _ ->
      match tag with
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "CacheParameterGroupFamily" ->
          r_cache_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "DefaultOnly" ->
          r_default_only :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultOnly" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     cache_parameter_group_family = ( ! ) r_cache_parameter_group_family;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     default_only = ( ! ) r_default_only;
   }
    : describe_cache_engine_versions_message)

let cache_cluster_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CacheCluster" (fun i _ -> cache_cluster_of_xml i) ()

let cache_cluster_message_of_xml i =
  let r_marker = ref None in
  let r_cache_clusters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "CacheClusters" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "CacheClusters" ->
          r_cache_clusters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheCluster"
                     (fun i _ -> cache_cluster_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; cache_clusters = ( ! ) r_cache_clusters } : cache_cluster_message)

let describe_cache_clusters_message_of_xml i =
  let r_cache_cluster_id = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_show_cache_node_info = ref None in
  let r_show_cache_clusters_not_in_replication_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CacheClusterId";
      "MaxRecords";
      "Marker";
      "ShowCacheNodeInfo";
      "ShowCacheClustersNotInReplicationGroups";
    ] (fun tag _ ->
      match tag with
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ShowCacheNodeInfo" ->
          r_show_cache_node_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShowCacheNodeInfo"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ShowCacheClustersNotInReplicationGroups" ->
          r_show_cache_clusters_not_in_replication_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ShowCacheClustersNotInReplicationGroups"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     show_cache_node_info = ( ! ) r_show_cache_node_info;
     show_cache_clusters_not_in_replication_groups =
       ( ! ) r_show_cache_clusters_not_in_replication_groups;
   }
    : describe_cache_clusters_message)

let delete_user_group_message_of_xml i =
  let r_user_group_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserGroupId" ] (fun tag _ ->
      match tag with
      | "UserGroupId" ->
          r_user_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_group_id = Smaws_Lib.Xml.Parse.required "UserGroupId" (( ! ) r_user_group_id) i }
    : delete_user_group_message)

let default_user_associated_to_user_group_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : default_user_associated_to_user_group_fault)

let delete_user_message_of_xml i =
  let r_user_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserId" ] (fun tag _ ->
      match tag with
      | "UserId" ->
          r_user_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UserId" (fun i _ -> user_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ user_id = Smaws_Lib.Xml.Parse.required "UserId" (( ! ) r_user_id) i } : delete_user_message)

let invalid_snapshot_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_snapshot_state_fault)

let delete_snapshot_result_of_xml i =
  let r_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Snapshot" ] (fun tag _ ->
      match tag with
      | "Snapshot" ->
          r_snapshot :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot = ( ! ) r_snapshot } : delete_snapshot_result)

let delete_snapshot_message_of_xml i =
  let r_snapshot_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SnapshotName" ] (fun tag _ ->
      match tag with
      | "SnapshotName" ->
          r_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot_name = Smaws_Lib.Xml.Parse.required "SnapshotName" (( ! ) r_snapshot_name) i }
    : delete_snapshot_message)

let delete_serverless_cache_snapshot_response_of_xml i =
  let r_serverless_cache_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessCacheSnapshot" ] (fun tag _ ->
      match tag with
      | "ServerlessCacheSnapshot" ->
          r_serverless_cache_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheSnapshot"
                 (fun i _ -> serverless_cache_snapshot_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ serverless_cache_snapshot = ( ! ) r_serverless_cache_snapshot }
    : delete_serverless_cache_snapshot_response)

let delete_serverless_cache_snapshot_request_of_xml i =
  let r_serverless_cache_snapshot_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessCacheSnapshotName" ] (fun tag _ ->
      match tag with
      | "ServerlessCacheSnapshotName" ->
          r_serverless_cache_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheSnapshotName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serverless_cache_snapshot_name =
       Smaws_Lib.Xml.Parse.required "ServerlessCacheSnapshotName"
         (( ! ) r_serverless_cache_snapshot_name)
         i;
   }
    : delete_serverless_cache_snapshot_request)

let serverless_cache_snapshot_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : serverless_cache_snapshot_already_exists_fault)

let delete_serverless_cache_response_of_xml i =
  let r_serverless_cache = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessCache" ] (fun tag _ ->
      match tag with
      | "ServerlessCache" ->
          r_serverless_cache :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCache"
                 (fun i _ -> serverless_cache_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ serverless_cache = ( ! ) r_serverless_cache } : delete_serverless_cache_response)

let delete_serverless_cache_request_of_xml i =
  let r_serverless_cache_name = ref None in
  let r_final_snapshot_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessCacheName"; "FinalSnapshotName" ]
    (fun tag _ ->
      match tag with
      | "ServerlessCacheName" ->
          r_serverless_cache_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "FinalSnapshotName" ->
          r_final_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalSnapshotName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serverless_cache_name =
       Smaws_Lib.Xml.Parse.required "ServerlessCacheName" (( ! ) r_serverless_cache_name) i;
     final_snapshot_name = ( ! ) r_final_snapshot_name;
   }
    : delete_serverless_cache_request)

let snapshot_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : snapshot_quota_exceeded_fault)

let snapshot_feature_not_supported_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : snapshot_feature_not_supported_fault)

let snapshot_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : snapshot_already_exists_fault)

let delete_replication_group_result_of_xml i =
  let r_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroup" ] (fun tag _ ->
      match tag with
      | "ReplicationGroup" ->
          r_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroup"
                 (fun i _ -> replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ replication_group = ( ! ) r_replication_group } : delete_replication_group_result)

let delete_replication_group_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_retain_primary_cluster = ref None in
  let r_final_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReplicationGroupId"; "RetainPrimaryCluster"; "FinalSnapshotIdentifier" ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RetainPrimaryCluster" ->
          r_retain_primary_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainPrimaryCluster"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "FinalSnapshotIdentifier" ->
          r_final_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     retain_primary_cluster = ( ! ) r_retain_primary_cluster;
     final_snapshot_identifier = ( ! ) r_final_snapshot_identifier;
   }
    : delete_replication_group_message)

let delete_global_replication_group_result_of_xml i =
  let r_global_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalReplicationGroup" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroup" ->
          r_global_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroup"
                 (fun i _ -> global_replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_replication_group = ( ! ) r_global_replication_group }
    : delete_global_replication_group_result)

let delete_global_replication_group_message_of_xml i =
  let r_global_replication_group_id = ref None in
  let r_retain_primary_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "GlobalReplicationGroupId"; "RetainPrimaryReplicationGroup" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroupId" ->
          r_global_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RetainPrimaryReplicationGroup" ->
          r_retain_primary_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainPrimaryReplicationGroup"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_replication_group_id =
       Smaws_Lib.Xml.Parse.required "GlobalReplicationGroupId"
         (( ! ) r_global_replication_group_id)
         i;
     retain_primary_replication_group =
       Smaws_Lib.Xml.Parse.required "RetainPrimaryReplicationGroup"
         (( ! ) r_retain_primary_replication_group)
         i;
   }
    : delete_global_replication_group_message)

let cache_subnet_group_in_use_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_subnet_group_in_use)

let delete_cache_subnet_group_message_of_xml i =
  let r_cache_subnet_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheSubnetGroupName" ] (fun tag _ ->
      match tag with
      | "CacheSubnetGroupName" ->
          r_cache_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "CacheSubnetGroupName" (( ! ) r_cache_subnet_group_name) i;
   }
    : delete_cache_subnet_group_message)

let delete_cache_security_group_message_of_xml i =
  let r_cache_security_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheSecurityGroupName" ] (fun tag _ ->
      match tag with
      | "CacheSecurityGroupName" ->
          r_cache_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_security_group_name =
       Smaws_Lib.Xml.Parse.required "CacheSecurityGroupName" (( ! ) r_cache_security_group_name) i;
   }
    : delete_cache_security_group_message)

let delete_cache_parameter_group_message_of_xml i =
  let r_cache_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheParameterGroupName" ] (fun tag _ ->
      match tag with
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "CacheParameterGroupName" (( ! ) r_cache_parameter_group_name) i;
   }
    : delete_cache_parameter_group_message)

let delete_cache_cluster_result_of_xml i =
  let r_cache_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheCluster" ] (fun tag _ ->
      match tag with
      | "CacheCluster" ->
          r_cache_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheCluster"
                 (fun i _ -> cache_cluster_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_cluster = ( ! ) r_cache_cluster } : delete_cache_cluster_result)

let delete_cache_cluster_message_of_xml i =
  let r_cache_cluster_id = ref None in
  let r_final_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheClusterId"; "FinalSnapshotIdentifier" ]
    (fun tag _ ->
      match tag with
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "FinalSnapshotIdentifier" ->
          r_final_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_cluster_id = Smaws_Lib.Xml.Parse.required "CacheClusterId" (( ! ) r_cache_cluster_id) i;
     final_snapshot_identifier = ( ! ) r_final_snapshot_identifier;
   }
    : delete_cache_cluster_message)

let decrease_replica_count_result_of_xml i =
  let r_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroup" ] (fun tag _ ->
      match tag with
      | "ReplicationGroup" ->
          r_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroup"
                 (fun i _ -> replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ replication_group = ( ! ) r_replication_group } : decrease_replica_count_result)

let remove_replicas_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let decrease_replica_count_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_new_replica_count = ref None in
  let r_replica_configuration = ref None in
  let r_replicas_to_remove = ref None in
  let r_apply_immediately = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReplicationGroupId";
      "NewReplicaCount";
      "ReplicaConfiguration";
      "ReplicasToRemove";
      "ApplyImmediately";
    ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NewReplicaCount" ->
          r_new_replica_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewReplicaCount"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ReplicaConfiguration" ->
          r_replica_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicaConfiguration"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ConfigureShard"
                     (fun i _ -> configure_shard_of_xml i)
                     ())
                 ())
      | "ReplicasToRemove" ->
          r_replicas_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicasToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     new_replica_count = ( ! ) r_new_replica_count;
     replica_configuration = ( ! ) r_replica_configuration;
     replicas_to_remove = ( ! ) r_replicas_to_remove;
     apply_immediately =
       Smaws_Lib.Xml.Parse.required "ApplyImmediately" (( ! ) r_apply_immediately) i;
   }
    : decrease_replica_count_message)

let decrease_node_groups_in_global_replication_group_result_of_xml i =
  let r_global_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalReplicationGroup" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroup" ->
          r_global_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroup"
                 (fun i _ -> global_replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_replication_group = ( ! ) r_global_replication_group }
    : decrease_node_groups_in_global_replication_group_result)

let global_node_group_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "GlobalNodeGroupId" (fun i _ -> string__of_xml i) ()

let decrease_node_groups_in_global_replication_group_message_of_xml i =
  let r_global_replication_group_id = ref None in
  let r_node_group_count = ref None in
  let r_global_node_groups_to_remove = ref None in
  let r_global_node_groups_to_retain = ref None in
  let r_apply_immediately = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "GlobalReplicationGroupId";
      "NodeGroupCount";
      "GlobalNodeGroupsToRemove";
      "GlobalNodeGroupsToRetain";
      "ApplyImmediately";
    ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroupId" ->
          r_global_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeGroupCount" ->
          r_node_group_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupCount"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "GlobalNodeGroupsToRemove" ->
          r_global_node_groups_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalNodeGroupsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "GlobalNodeGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "GlobalNodeGroupsToRetain" ->
          r_global_node_groups_to_retain :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalNodeGroupsToRetain"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "GlobalNodeGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_replication_group_id =
       Smaws_Lib.Xml.Parse.required "GlobalReplicationGroupId"
         (( ! ) r_global_replication_group_id)
         i;
     node_group_count = Smaws_Lib.Xml.Parse.required "NodeGroupCount" (( ! ) r_node_group_count) i;
     global_node_groups_to_remove = ( ! ) r_global_node_groups_to_remove;
     global_node_groups_to_retain = ( ! ) r_global_node_groups_to_retain;
     apply_immediately =
       Smaws_Lib.Xml.Parse.required "ApplyImmediately" (( ! ) r_apply_immediately) i;
   }
    : decrease_node_groups_in_global_replication_group_message)

let user_group_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : user_group_quota_exceeded_fault)

let user_group_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : user_group_already_exists_fault)

let create_user_group_message_of_xml i =
  let r_user_group_id = ref None in
  let r_engine = ref None in
  let r_user_ids = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UserGroupId"; "Engine"; "UserIds"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "UserGroupId" ->
          r_user_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupId" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> engine_type_of_xml i) ())
      | "UserIds" ->
          r_user_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_id_of_xml i) ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_group_id = Smaws_Lib.Xml.Parse.required "UserGroupId" (( ! ) r_user_group_id) i;
     engine = Smaws_Lib.Xml.Parse.required "Engine" (( ! ) r_engine) i;
     user_ids = ( ! ) r_user_ids;
     tags = ( ! ) r_tags;
   }
    : create_user_group_message)

let user_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : user_quota_exceeded_fault)

let user_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : user_already_exists_fault)

let user_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let create_user_message_of_xml i =
  let r_user_id = ref None in
  let r_user_name = ref None in
  let r_engine = ref None in
  let r_passwords = ref None in
  let r_access_string = ref None in
  let r_no_password_required = ref None in
  let r_tags = ref None in
  let r_authentication_mode = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "UserId";
      "UserName";
      "Engine";
      "Passwords";
      "AccessString";
      "NoPasswordRequired";
      "Tags";
      "AuthenticationMode";
    ] (fun tag _ ->
      match tag with
      | "UserId" ->
          r_user_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UserId" (fun i _ -> user_id_of_xml i) ())
      | "UserName" ->
          r_user_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UserName" (fun i _ -> user_name_of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> engine_type_of_xml i) ())
      | "Passwords" ->
          r_passwords :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Passwords"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "AccessString" ->
          r_access_string :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessString"
                 (fun i _ -> access_string_of_xml i)
                 ())
      | "NoPasswordRequired" ->
          r_no_password_required :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NoPasswordRequired"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "AuthenticationMode" ->
          r_authentication_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationMode"
                 (fun i _ -> authentication_mode_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user_id = Smaws_Lib.Xml.Parse.required "UserId" (( ! ) r_user_id) i;
     user_name = Smaws_Lib.Xml.Parse.required "UserName" (( ! ) r_user_name) i;
     engine = Smaws_Lib.Xml.Parse.required "Engine" (( ! ) r_engine) i;
     passwords = ( ! ) r_passwords;
     access_string = Smaws_Lib.Xml.Parse.required "AccessString" (( ! ) r_access_string) i;
     no_password_required = ( ! ) r_no_password_required;
     tags = ( ! ) r_tags;
     authentication_mode = ( ! ) r_authentication_mode;
   }
    : create_user_message)

let create_snapshot_result_of_xml i =
  let r_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Snapshot" ] (fun tag _ ->
      match tag with
      | "Snapshot" ->
          r_snapshot :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot = ( ! ) r_snapshot } : create_snapshot_result)

let create_snapshot_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_cache_cluster_id = ref None in
  let r_snapshot_name = ref None in
  let r_kms_key_id = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReplicationGroupId"; "CacheClusterId"; "SnapshotName"; "KmsKeyId"; "Tags" ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotName" ->
          r_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotName" (fun i _ -> string__of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id = ( ! ) r_replication_group_id;
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     snapshot_name = Smaws_Lib.Xml.Parse.required "SnapshotName" (( ! ) r_snapshot_name) i;
     kms_key_id = ( ! ) r_kms_key_id;
     tags = ( ! ) r_tags;
   }
    : create_snapshot_message)

let serverless_cache_snapshot_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : serverless_cache_snapshot_quota_exceeded_fault)

let create_serverless_cache_snapshot_response_of_xml i =
  let r_serverless_cache_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessCacheSnapshot" ] (fun tag _ ->
      match tag with
      | "ServerlessCacheSnapshot" ->
          r_serverless_cache_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheSnapshot"
                 (fun i _ -> serverless_cache_snapshot_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ serverless_cache_snapshot = ( ! ) r_serverless_cache_snapshot }
    : create_serverless_cache_snapshot_response)

let create_serverless_cache_snapshot_request_of_xml i =
  let r_serverless_cache_snapshot_name = ref None in
  let r_serverless_cache_name = ref None in
  let r_kms_key_id = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ServerlessCacheSnapshotName"; "ServerlessCacheName"; "KmsKeyId"; "Tags" ] (fun tag _ ->
      match tag with
      | "ServerlessCacheSnapshotName" ->
          r_serverless_cache_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheSnapshotName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ServerlessCacheName" ->
          r_serverless_cache_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheName"
                 (fun i _ -> string__of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serverless_cache_snapshot_name =
       Smaws_Lib.Xml.Parse.required "ServerlessCacheSnapshotName"
         (( ! ) r_serverless_cache_snapshot_name)
         i;
     serverless_cache_name =
       Smaws_Lib.Xml.Parse.required "ServerlessCacheName" (( ! ) r_serverless_cache_name) i;
     kms_key_id = ( ! ) r_kms_key_id;
     tags = ( ! ) r_tags;
   }
    : create_serverless_cache_snapshot_request)

let serverless_cache_quota_for_customer_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : serverless_cache_quota_for_customer_exceeded_fault)

let serverless_cache_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : serverless_cache_already_exists_fault)

let create_serverless_cache_response_of_xml i =
  let r_serverless_cache = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessCache" ] (fun tag _ ->
      match tag with
      | "ServerlessCache" ->
          r_serverless_cache :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCache"
                 (fun i _ -> serverless_cache_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ serverless_cache = ( ! ) r_serverless_cache } : create_serverless_cache_response)

let snapshot_arns_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotArn" (fun i _ -> string__of_xml i) ()

let create_serverless_cache_request_of_xml i =
  let r_serverless_cache_name = ref None in
  let r_description = ref None in
  let r_engine = ref None in
  let r_major_engine_version = ref None in
  let r_cache_usage_limits = ref None in
  let r_kms_key_id = ref None in
  let r_security_group_ids = ref None in
  let r_snapshot_arns_to_restore = ref None in
  let r_tags = ref None in
  let r_user_group_id = ref None in
  let r_subnet_ids = ref None in
  let r_snapshot_retention_limit = ref None in
  let r_daily_snapshot_time = ref None in
  let r_network_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ServerlessCacheName";
      "Description";
      "Engine";
      "MajorEngineVersion";
      "CacheUsageLimits";
      "KmsKeyId";
      "SecurityGroupIds";
      "SnapshotArnsToRestore";
      "Tags";
      "UserGroupId";
      "SubnetIds";
      "SnapshotRetentionLimit";
      "DailySnapshotTime";
      "NetworkType";
    ] (fun tag _ ->
      match tag with
      | "ServerlessCacheName" ->
          r_serverless_cache_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "MajorEngineVersion" ->
          r_major_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MajorEngineVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheUsageLimits" ->
          r_cache_usage_limits :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheUsageLimits"
                 (fun i _ -> cache_usage_limits_of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "SecurityGroupIds" ->
          r_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SnapshotArnsToRestore" ->
          r_snapshot_arns_to_restore :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArnsToRestore"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "UserGroupId" ->
          r_user_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupId" (fun i _ -> string__of_xml i) ())
      | "SubnetIds" ->
          r_subnet_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SubnetId" (fun i _ -> string__of_xml i) ())
                 ())
      | "SnapshotRetentionLimit" ->
          r_snapshot_retention_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionLimit"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DailySnapshotTime" ->
          r_daily_snapshot_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DailySnapshotTime"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType"
                 (fun i _ -> network_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     serverless_cache_name =
       Smaws_Lib.Xml.Parse.required "ServerlessCacheName" (( ! ) r_serverless_cache_name) i;
     description = ( ! ) r_description;
     engine = Smaws_Lib.Xml.Parse.required "Engine" (( ! ) r_engine) i;
     major_engine_version = ( ! ) r_major_engine_version;
     cache_usage_limits = ( ! ) r_cache_usage_limits;
     kms_key_id = ( ! ) r_kms_key_id;
     security_group_ids = ( ! ) r_security_group_ids;
     snapshot_arns_to_restore = ( ! ) r_snapshot_arns_to_restore;
     tags = ( ! ) r_tags;
     user_group_id = ( ! ) r_user_group_id;
     subnet_ids = ( ! ) r_subnet_ids;
     snapshot_retention_limit = ( ! ) r_snapshot_retention_limit;
     daily_snapshot_time = ( ! ) r_daily_snapshot_time;
     network_type = ( ! ) r_network_type;
   }
    : create_serverless_cache_request)

let replication_group_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : replication_group_already_exists_fault)

let create_replication_group_result_of_xml i =
  let r_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroup" ] (fun tag _ ->
      match tag with
      | "ReplicationGroup" ->
          r_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroup"
                 (fun i _ -> replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ replication_group = ( ! ) r_replication_group } : create_replication_group_result)

let user_group_id_list_input_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> user_group_id_of_xml i) ()

let node_group_configuration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupConfiguration"
    (fun i _ -> node_group_configuration_of_xml i)
    ()

let create_replication_group_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_replication_group_description = ref None in
  let r_global_replication_group_id = ref None in
  let r_primary_cluster_id = ref None in
  let r_automatic_failover_enabled = ref None in
  let r_multi_az_enabled = ref None in
  let r_num_cache_clusters = ref None in
  let r_preferred_cache_cluster_a_zs = ref None in
  let r_num_node_groups = ref None in
  let r_replicas_per_node_group = ref None in
  let r_node_group_configuration = ref None in
  let r_cache_node_type = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_cache_parameter_group_name = ref None in
  let r_cache_subnet_group_name = ref None in
  let r_cache_security_group_names = ref None in
  let r_security_group_ids = ref None in
  let r_tags = ref None in
  let r_snapshot_arns = ref None in
  let r_snapshot_name = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_port = ref None in
  let r_notification_topic_arn = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_snapshot_retention_limit = ref None in
  let r_snapshot_window = ref None in
  let r_auth_token = ref None in
  let r_transit_encryption_enabled = ref None in
  let r_at_rest_encryption_enabled = ref None in
  let r_kms_key_id = ref None in
  let r_user_group_ids = ref None in
  let r_log_delivery_configurations = ref None in
  let r_data_tiering_enabled = ref None in
  let r_network_type = ref None in
  let r_ip_discovery = ref None in
  let r_transit_encryption_mode = ref None in
  let r_cluster_mode = ref None in
  let r_serverless_cache_snapshot_name = ref None in
  let r_durability = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReplicationGroupId";
      "ReplicationGroupDescription";
      "GlobalReplicationGroupId";
      "PrimaryClusterId";
      "AutomaticFailoverEnabled";
      "MultiAZEnabled";
      "NumCacheClusters";
      "PreferredCacheClusterAZs";
      "NumNodeGroups";
      "ReplicasPerNodeGroup";
      "NodeGroupConfiguration";
      "CacheNodeType";
      "Engine";
      "EngineVersion";
      "CacheParameterGroupName";
      "CacheSubnetGroupName";
      "CacheSecurityGroupNames";
      "SecurityGroupIds";
      "Tags";
      "SnapshotArns";
      "SnapshotName";
      "PreferredMaintenanceWindow";
      "Port";
      "NotificationTopicArn";
      "AutoMinorVersionUpgrade";
      "SnapshotRetentionLimit";
      "SnapshotWindow";
      "AuthToken";
      "TransitEncryptionEnabled";
      "AtRestEncryptionEnabled";
      "KmsKeyId";
      "UserGroupIds";
      "LogDeliveryConfigurations";
      "DataTieringEnabled";
      "NetworkType";
      "IpDiscovery";
      "TransitEncryptionMode";
      "ClusterMode";
      "ServerlessCacheSnapshotName";
      "Durability";
    ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicationGroupDescription" ->
          r_replication_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalReplicationGroupId" ->
          r_global_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PrimaryClusterId" ->
          r_primary_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrimaryClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutomaticFailoverEnabled" ->
          r_automatic_failover_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomaticFailoverEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MultiAZEnabled" ->
          r_multi_az_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NumCacheClusters" ->
          r_num_cache_clusters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumCacheClusters"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "PreferredCacheClusterAZs" ->
          r_preferred_cache_cluster_a_zs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredCacheClusterAZs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "NumNodeGroups" ->
          r_num_node_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumNodeGroups"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ReplicasPerNodeGroup" ->
          r_replicas_per_node_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicasPerNodeGroup"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "NodeGroupConfiguration" ->
          r_node_group_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeGroupConfiguration"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeGroupConfiguration"
                     (fun i _ -> node_group_configuration_of_xml i)
                     ())
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheSubnetGroupName" ->
          r_cache_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheSecurityGroupNames" ->
          r_cache_security_group_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroupNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheSecurityGroupName"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SecurityGroupIds" ->
          r_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "SnapshotArns" ->
          r_snapshot_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SnapshotName" ->
          r_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotName" (fun i _ -> string__of_xml i) ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "NotificationTopicArn" ->
          r_notification_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTopicArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "SnapshotRetentionLimit" ->
          r_snapshot_retention_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionLimit"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotWindow" ->
          r_snapshot_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AuthToken" ->
          r_auth_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AuthToken" (fun i _ -> string__of_xml i) ())
      | "TransitEncryptionEnabled" ->
          r_transit_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AtRestEncryptionEnabled" ->
          r_at_rest_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AtRestEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "UserGroupIds" ->
          r_user_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> user_group_id_of_xml i)
                     ())
                 ())
      | "LogDeliveryConfigurations" ->
          r_log_delivery_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDeliveryConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "LogDeliveryConfigurationRequest"
                     (fun i _ -> log_delivery_configuration_request_of_xml i)
                     ())
                 ())
      | "DataTieringEnabled" ->
          r_data_tiering_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataTieringEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType"
                 (fun i _ -> network_type_of_xml i)
                 ())
      | "IpDiscovery" ->
          r_ip_discovery :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpDiscovery"
                 (fun i _ -> ip_discovery_of_xml i)
                 ())
      | "TransitEncryptionMode" ->
          r_transit_encryption_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionMode"
                 (fun i _ -> transit_encryption_mode_of_xml i)
                 ())
      | "ClusterMode" ->
          r_cluster_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterMode"
                 (fun i _ -> cluster_mode_of_xml i)
                 ())
      | "ServerlessCacheSnapshotName" ->
          r_serverless_cache_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheSnapshotName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Durability" ->
          r_durability :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Durability" (fun i _ -> durability_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     replication_group_description =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupDescription"
         (( ! ) r_replication_group_description)
         i;
     global_replication_group_id = ( ! ) r_global_replication_group_id;
     primary_cluster_id = ( ! ) r_primary_cluster_id;
     automatic_failover_enabled = ( ! ) r_automatic_failover_enabled;
     multi_az_enabled = ( ! ) r_multi_az_enabled;
     num_cache_clusters = ( ! ) r_num_cache_clusters;
     preferred_cache_cluster_a_zs = ( ! ) r_preferred_cache_cluster_a_zs;
     num_node_groups = ( ! ) r_num_node_groups;
     replicas_per_node_group = ( ! ) r_replicas_per_node_group;
     node_group_configuration = ( ! ) r_node_group_configuration;
     cache_node_type = ( ! ) r_cache_node_type;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     cache_parameter_group_name = ( ! ) r_cache_parameter_group_name;
     cache_subnet_group_name = ( ! ) r_cache_subnet_group_name;
     cache_security_group_names = ( ! ) r_cache_security_group_names;
     security_group_ids = ( ! ) r_security_group_ids;
     tags = ( ! ) r_tags;
     snapshot_arns = ( ! ) r_snapshot_arns;
     snapshot_name = ( ! ) r_snapshot_name;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     port = ( ! ) r_port;
     notification_topic_arn = ( ! ) r_notification_topic_arn;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     snapshot_retention_limit = ( ! ) r_snapshot_retention_limit;
     snapshot_window = ( ! ) r_snapshot_window;
     auth_token = ( ! ) r_auth_token;
     transit_encryption_enabled = ( ! ) r_transit_encryption_enabled;
     at_rest_encryption_enabled = ( ! ) r_at_rest_encryption_enabled;
     kms_key_id = ( ! ) r_kms_key_id;
     user_group_ids = ( ! ) r_user_group_ids;
     log_delivery_configurations = ( ! ) r_log_delivery_configurations;
     data_tiering_enabled = ( ! ) r_data_tiering_enabled;
     network_type = ( ! ) r_network_type;
     ip_discovery = ( ! ) r_ip_discovery;
     transit_encryption_mode = ( ! ) r_transit_encryption_mode;
     cluster_mode = ( ! ) r_cluster_mode;
     serverless_cache_snapshot_name = ( ! ) r_serverless_cache_snapshot_name;
     durability = ( ! ) r_durability;
   }
    : create_replication_group_message)

let global_replication_group_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : global_replication_group_already_exists_fault)

let create_global_replication_group_result_of_xml i =
  let r_global_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalReplicationGroup" ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroup" ->
          r_global_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroup"
                 (fun i _ -> global_replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_replication_group = ( ! ) r_global_replication_group }
    : create_global_replication_group_result)

let create_global_replication_group_message_of_xml i =
  let r_global_replication_group_id_suffix = ref None in
  let r_global_replication_group_description = ref None in
  let r_primary_replication_group_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "GlobalReplicationGroupIdSuffix";
      "GlobalReplicationGroupDescription";
      "PrimaryReplicationGroupId";
    ] (fun tag _ ->
      match tag with
      | "GlobalReplicationGroupIdSuffix" ->
          r_global_replication_group_id_suffix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupIdSuffix"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalReplicationGroupDescription" ->
          r_global_replication_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalReplicationGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PrimaryReplicationGroupId" ->
          r_primary_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrimaryReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_replication_group_id_suffix =
       Smaws_Lib.Xml.Parse.required "GlobalReplicationGroupIdSuffix"
         (( ! ) r_global_replication_group_id_suffix)
         i;
     global_replication_group_description = ( ! ) r_global_replication_group_description;
     primary_replication_group_id =
       Smaws_Lib.Xml.Parse.required "PrimaryReplicationGroupId"
         (( ! ) r_primary_replication_group_id)
         i;
   }
    : create_global_replication_group_message)

let cache_subnet_group_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_subnet_group_quota_exceeded_fault)

let cache_subnet_group_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_subnet_group_already_exists_fault)

let create_cache_subnet_group_result_of_xml i =
  let r_cache_subnet_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheSubnetGroup" ] (fun tag _ ->
      match tag with
      | "CacheSubnetGroup" ->
          r_cache_subnet_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroup"
                 (fun i _ -> cache_subnet_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_subnet_group = ( ! ) r_cache_subnet_group } : create_cache_subnet_group_result)

let create_cache_subnet_group_message_of_xml i =
  let r_cache_subnet_group_name = ref None in
  let r_cache_subnet_group_description = ref None in
  let r_subnet_ids = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CacheSubnetGroupName"; "CacheSubnetGroupDescription"; "SubnetIds"; "Tags" ] (fun tag _ ->
      match tag with
      | "CacheSubnetGroupName" ->
          r_cache_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheSubnetGroupDescription" ->
          r_cache_subnet_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupDescription"
                 (fun i _ -> string__of_xml i)
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
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "CacheSubnetGroupName" (( ! ) r_cache_subnet_group_name) i;
     cache_subnet_group_description =
       Smaws_Lib.Xml.Parse.required "CacheSubnetGroupDescription"
         (( ! ) r_cache_subnet_group_description)
         i;
     subnet_ids = Smaws_Lib.Xml.Parse.required "SubnetIds" (( ! ) r_subnet_ids) i;
     tags = ( ! ) r_tags;
   }
    : create_cache_subnet_group_message)

let cache_security_group_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_security_group_quota_exceeded_fault)

let cache_security_group_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_security_group_already_exists_fault)

let create_cache_security_group_result_of_xml i =
  let r_cache_security_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheSecurityGroup" ] (fun tag _ ->
      match tag with
      | "CacheSecurityGroup" ->
          r_cache_security_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroup"
                 (fun i _ -> cache_security_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_security_group = ( ! ) r_cache_security_group } : create_cache_security_group_result)

let create_cache_security_group_message_of_xml i =
  let r_cache_security_group_name = ref None in
  let r_description = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheSecurityGroupName"; "Description"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "CacheSecurityGroupName" ->
          r_cache_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_security_group_name =
       Smaws_Lib.Xml.Parse.required "CacheSecurityGroupName" (( ! ) r_cache_security_group_name) i;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     tags = ( ! ) r_tags;
   }
    : create_cache_security_group_message)

let cache_parameter_group_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_parameter_group_quota_exceeded_fault)

let cache_parameter_group_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_parameter_group_already_exists_fault)

let create_cache_parameter_group_result_of_xml i =
  let r_cache_parameter_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheParameterGroup" ] (fun tag _ ->
      match tag with
      | "CacheParameterGroup" ->
          r_cache_parameter_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroup"
                 (fun i _ -> cache_parameter_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_parameter_group = ( ! ) r_cache_parameter_group } : create_cache_parameter_group_result)

let create_cache_parameter_group_message_of_xml i =
  let r_cache_parameter_group_name = ref None in
  let r_cache_parameter_group_family = ref None in
  let r_description = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CacheParameterGroupName"; "CacheParameterGroupFamily"; "Description"; "Tags" ] (fun tag _ ->
      match tag with
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheParameterGroupFamily" ->
          r_cache_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "CacheParameterGroupName" (( ! ) r_cache_parameter_group_name) i;
     cache_parameter_group_family =
       Smaws_Lib.Xml.Parse.required "CacheParameterGroupFamily"
         (( ! ) r_cache_parameter_group_family)
         i;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     tags = ( ! ) r_tags;
   }
    : create_cache_parameter_group_message)

let cache_cluster_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : cache_cluster_already_exists_fault)

let create_cache_cluster_result_of_xml i =
  let r_cache_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheCluster" ] (fun tag _ ->
      match tag with
      | "CacheCluster" ->
          r_cache_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheCluster"
                 (fun i _ -> cache_cluster_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_cluster = ( ! ) r_cache_cluster } : create_cache_cluster_result)

let outpost_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "single-outpost" -> SINGLE_OUTPOST
   | "cross-outpost" -> CROSS_OUTPOST
   | _ -> failwith "unknown enum value"
    : outpost_mode)

let create_cache_cluster_message_of_xml i =
  let r_cache_cluster_id = ref None in
  let r_replication_group_id = ref None in
  let r_az_mode = ref None in
  let r_preferred_availability_zone = ref None in
  let r_preferred_availability_zones = ref None in
  let r_num_cache_nodes = ref None in
  let r_cache_node_type = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_cache_parameter_group_name = ref None in
  let r_cache_subnet_group_name = ref None in
  let r_cache_security_group_names = ref None in
  let r_security_group_ids = ref None in
  let r_tags = ref None in
  let r_snapshot_arns = ref None in
  let r_snapshot_name = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_port = ref None in
  let r_notification_topic_arn = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_snapshot_retention_limit = ref None in
  let r_snapshot_window = ref None in
  let r_auth_token = ref None in
  let r_outpost_mode = ref None in
  let r_preferred_outpost_arn = ref None in
  let r_preferred_outpost_arns = ref None in
  let r_log_delivery_configurations = ref None in
  let r_transit_encryption_enabled = ref None in
  let r_network_type = ref None in
  let r_ip_discovery = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CacheClusterId";
      "ReplicationGroupId";
      "AZMode";
      "PreferredAvailabilityZone";
      "PreferredAvailabilityZones";
      "NumCacheNodes";
      "CacheNodeType";
      "Engine";
      "EngineVersion";
      "CacheParameterGroupName";
      "CacheSubnetGroupName";
      "CacheSecurityGroupNames";
      "SecurityGroupIds";
      "Tags";
      "SnapshotArns";
      "SnapshotName";
      "PreferredMaintenanceWindow";
      "Port";
      "NotificationTopicArn";
      "AutoMinorVersionUpgrade";
      "SnapshotRetentionLimit";
      "SnapshotWindow";
      "AuthToken";
      "OutpostMode";
      "PreferredOutpostArn";
      "PreferredOutpostArns";
      "LogDeliveryConfigurations";
      "TransitEncryptionEnabled";
      "NetworkType";
      "IpDiscovery";
    ] (fun tag _ ->
      match tag with
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AZMode" ->
          r_az_mode :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AZMode" (fun i _ -> az_mode_of_xml i) ())
      | "PreferredAvailabilityZone" ->
          r_preferred_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredAvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredAvailabilityZones" ->
          r_preferred_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredAvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "PreferredAvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "NumCacheNodes" ->
          r_num_cache_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumCacheNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "CacheNodeType" ->
          r_cache_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheNodeType" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "CacheParameterGroupName" ->
          r_cache_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheSubnetGroupName" ->
          r_cache_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheSecurityGroupNames" ->
          r_cache_security_group_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroupNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CacheSecurityGroupName"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SecurityGroupIds" ->
          r_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "SnapshotArns" ->
          r_snapshot_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SnapshotName" ->
          r_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotName" (fun i _ -> string__of_xml i) ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "NotificationTopicArn" ->
          r_notification_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationTopicArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "SnapshotRetentionLimit" ->
          r_snapshot_retention_limit :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionLimit"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotWindow" ->
          r_snapshot_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AuthToken" ->
          r_auth_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AuthToken" (fun i _ -> string__of_xml i) ())
      | "OutpostMode" ->
          r_outpost_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutpostMode"
                 (fun i _ -> outpost_mode_of_xml i)
                 ())
      | "PreferredOutpostArn" ->
          r_preferred_outpost_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredOutpostArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredOutpostArns" ->
          r_preferred_outpost_arns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredOutpostArns"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "PreferredOutpostArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "LogDeliveryConfigurations" ->
          r_log_delivery_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDeliveryConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "LogDeliveryConfigurationRequest"
                     (fun i _ -> log_delivery_configuration_request_of_xml i)
                     ())
                 ())
      | "TransitEncryptionEnabled" ->
          r_transit_encryption_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TransitEncryptionEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType"
                 (fun i _ -> network_type_of_xml i)
                 ())
      | "IpDiscovery" ->
          r_ip_discovery :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpDiscovery"
                 (fun i _ -> ip_discovery_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_cluster_id = Smaws_Lib.Xml.Parse.required "CacheClusterId" (( ! ) r_cache_cluster_id) i;
     replication_group_id = ( ! ) r_replication_group_id;
     az_mode = ( ! ) r_az_mode;
     preferred_availability_zone = ( ! ) r_preferred_availability_zone;
     preferred_availability_zones = ( ! ) r_preferred_availability_zones;
     num_cache_nodes = ( ! ) r_num_cache_nodes;
     cache_node_type = ( ! ) r_cache_node_type;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     cache_parameter_group_name = ( ! ) r_cache_parameter_group_name;
     cache_subnet_group_name = ( ! ) r_cache_subnet_group_name;
     cache_security_group_names = ( ! ) r_cache_security_group_names;
     security_group_ids = ( ! ) r_security_group_ids;
     tags = ( ! ) r_tags;
     snapshot_arns = ( ! ) r_snapshot_arns;
     snapshot_name = ( ! ) r_snapshot_name;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     port = ( ! ) r_port;
     notification_topic_arn = ( ! ) r_notification_topic_arn;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     snapshot_retention_limit = ( ! ) r_snapshot_retention_limit;
     snapshot_window = ( ! ) r_snapshot_window;
     auth_token = ( ! ) r_auth_token;
     outpost_mode = ( ! ) r_outpost_mode;
     preferred_outpost_arn = ( ! ) r_preferred_outpost_arn;
     preferred_outpost_arns = ( ! ) r_preferred_outpost_arns;
     log_delivery_configurations = ( ! ) r_log_delivery_configurations;
     transit_encryption_enabled = ( ! ) r_transit_encryption_enabled;
     network_type = ( ! ) r_network_type;
     ip_discovery = ( ! ) r_ip_discovery;
   }
    : create_cache_cluster_message)

let copy_snapshot_result_of_xml i =
  let r_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Snapshot" ] (fun tag _ ->
      match tag with
      | "Snapshot" ->
          r_snapshot :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot = ( ! ) r_snapshot } : copy_snapshot_result)

let copy_snapshot_message_of_xml i =
  let r_source_snapshot_name = ref None in
  let r_target_snapshot_name = ref None in
  let r_target_bucket = ref None in
  let r_kms_key_id = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourceSnapshotName"; "TargetSnapshotName"; "TargetBucket"; "KmsKeyId"; "Tags" ] (fun tag _ ->
      match tag with
      | "SourceSnapshotName" ->
          r_source_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceSnapshotName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetSnapshotName" ->
          r_target_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetSnapshotName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetBucket" ->
          r_target_bucket :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetBucket" (fun i _ -> string__of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_snapshot_name =
       Smaws_Lib.Xml.Parse.required "SourceSnapshotName" (( ! ) r_source_snapshot_name) i;
     target_snapshot_name =
       Smaws_Lib.Xml.Parse.required "TargetSnapshotName" (( ! ) r_target_snapshot_name) i;
     target_bucket = ( ! ) r_target_bucket;
     kms_key_id = ( ! ) r_kms_key_id;
     tags = ( ! ) r_tags;
   }
    : copy_snapshot_message)

let copy_serverless_cache_snapshot_response_of_xml i =
  let r_serverless_cache_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessCacheSnapshot" ] (fun tag _ ->
      match tag with
      | "ServerlessCacheSnapshot" ->
          r_serverless_cache_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessCacheSnapshot"
                 (fun i _ -> serverless_cache_snapshot_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ serverless_cache_snapshot = ( ! ) r_serverless_cache_snapshot }
    : copy_serverless_cache_snapshot_response)

let copy_serverless_cache_snapshot_request_of_xml i =
  let r_source_serverless_cache_snapshot_name = ref None in
  let r_target_serverless_cache_snapshot_name = ref None in
  let r_kms_key_id = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourceServerlessCacheSnapshotName"; "TargetServerlessCacheSnapshotName"; "KmsKeyId"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "SourceServerlessCacheSnapshotName" ->
          r_source_serverless_cache_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceServerlessCacheSnapshotName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetServerlessCacheSnapshotName" ->
          r_target_serverless_cache_snapshot_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetServerlessCacheSnapshotName"
                 (fun i _ -> string__of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_serverless_cache_snapshot_name =
       Smaws_Lib.Xml.Parse.required "SourceServerlessCacheSnapshotName"
         (( ! ) r_source_serverless_cache_snapshot_name)
         i;
     target_serverless_cache_snapshot_name =
       Smaws_Lib.Xml.Parse.required "TargetServerlessCacheSnapshotName"
         (( ! ) r_target_serverless_cache_snapshot_name)
         i;
     kms_key_id = ( ! ) r_kms_key_id;
     tags = ( ! ) r_tags;
   }
    : copy_serverless_cache_snapshot_request)

let replication_group_not_under_migration_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : replication_group_not_under_migration_fault)

let complete_migration_response_of_xml i =
  let r_replication_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroup" ] (fun tag _ ->
      match tag with
      | "ReplicationGroup" ->
          r_replication_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroup"
                 (fun i _ -> replication_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ replication_group = ( ! ) r_replication_group } : complete_migration_response)

let complete_migration_message_of_xml i =
  let r_replication_group_id = ref None in
  let r_force = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReplicationGroupId"; "Force" ] (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Force" ->
          r_force :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Force" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id =
       Smaws_Lib.Xml.Parse.required "ReplicationGroupId" (( ! ) r_replication_group_id) i;
     force = ( ! ) r_force;
   }
    : complete_migration_message)

let unprocessed_update_action_of_xml i =
  let r_replication_group_id = ref None in
  let r_cache_cluster_id = ref None in
  let r_service_update_name = ref None in
  let r_error_type = ref None in
  let r_error_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReplicationGroupId"; "CacheClusterId"; "ServiceUpdateName"; "ErrorType"; "ErrorMessage" ]
    (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ServiceUpdateName" ->
          r_service_update_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ErrorType" ->
          r_error_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorType" (fun i _ -> string__of_xml i) ())
      | "ErrorMessage" ->
          r_error_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorMessage" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id = ( ! ) r_replication_group_id;
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     service_update_name = ( ! ) r_service_update_name;
     error_type = ( ! ) r_error_type;
     error_message = ( ! ) r_error_message;
   }
    : unprocessed_update_action)

let unprocessed_update_action_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "UnprocessedUpdateAction"
    (fun i _ -> unprocessed_update_action_of_xml i)
    ()

let processed_update_action_of_xml i =
  let r_replication_group_id = ref None in
  let r_cache_cluster_id = ref None in
  let r_service_update_name = ref None in
  let r_update_action_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReplicationGroupId"; "CacheClusterId"; "ServiceUpdateName"; "UpdateActionStatus" ]
    (fun tag _ ->
      match tag with
      | "ReplicationGroupId" ->
          r_replication_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CacheClusterId" ->
          r_cache_cluster_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ServiceUpdateName" ->
          r_service_update_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "UpdateActionStatus" ->
          r_update_action_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateActionStatus"
                 (fun i _ -> update_action_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_id = ( ! ) r_replication_group_id;
     cache_cluster_id = ( ! ) r_cache_cluster_id;
     service_update_name = ( ! ) r_service_update_name;
     update_action_status = ( ! ) r_update_action_status;
   }
    : processed_update_action)

let processed_update_action_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ProcessedUpdateAction"
    (fun i _ -> processed_update_action_of_xml i)
    ()

let update_action_results_message_of_xml i =
  let r_processed_update_actions = ref None in
  let r_unprocessed_update_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ProcessedUpdateActions"; "UnprocessedUpdateActions" ] (fun tag _ ->
      match tag with
      | "ProcessedUpdateActions" ->
          r_processed_update_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProcessedUpdateActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ProcessedUpdateAction"
                     (fun i _ -> processed_update_action_of_xml i)
                     ())
                 ())
      | "UnprocessedUpdateActions" ->
          r_unprocessed_update_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UnprocessedUpdateActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "UnprocessedUpdateAction"
                     (fun i _ -> unprocessed_update_action_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     processed_update_actions = ( ! ) r_processed_update_actions;
     unprocessed_update_actions = ( ! ) r_unprocessed_update_actions;
   }
    : update_action_results_message)

let batch_stop_update_action_message_of_xml i =
  let r_replication_group_ids = ref None in
  let r_cache_cluster_ids = ref None in
  let r_service_update_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReplicationGroupIds"; "CacheClusterIds"; "ServiceUpdateName" ] (fun tag _ ->
      match tag with
      | "ReplicationGroupIds" ->
          r_replication_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "CacheClusterIds" ->
          r_cache_cluster_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "ServiceUpdateName" ->
          r_service_update_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_ids = ( ! ) r_replication_group_ids;
     cache_cluster_ids = ( ! ) r_cache_cluster_ids;
     service_update_name =
       Smaws_Lib.Xml.Parse.required "ServiceUpdateName" (( ! ) r_service_update_name) i;
   }
    : batch_stop_update_action_message)

let batch_apply_update_action_message_of_xml i =
  let r_replication_group_ids = ref None in
  let r_cache_cluster_ids = ref None in
  let r_service_update_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReplicationGroupIds"; "CacheClusterIds"; "ServiceUpdateName" ] (fun tag _ ->
      match tag with
      | "ReplicationGroupIds" ->
          r_replication_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "CacheClusterIds" ->
          r_cache_cluster_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheClusterIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "ServiceUpdateName" ->
          r_service_update_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceUpdateName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     replication_group_ids = ( ! ) r_replication_group_ids;
     cache_cluster_ids = ( ! ) r_cache_cluster_ids;
     service_update_name =
       Smaws_Lib.Xml.Parse.required "ServiceUpdateName" (( ! ) r_service_update_name) i;
   }
    : batch_apply_update_action_message)

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

let authorize_cache_security_group_ingress_result_of_xml i =
  let r_cache_security_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CacheSecurityGroup" ] (fun tag _ ->
      match tag with
      | "CacheSecurityGroup" ->
          r_cache_security_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroup"
                 (fun i _ -> cache_security_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cache_security_group = ( ! ) r_cache_security_group }
    : authorize_cache_security_group_ingress_result)

let authorize_cache_security_group_ingress_message_of_xml i =
  let r_cache_security_group_name = ref None in
  let r_ec2_security_group_name = ref None in
  let r_ec2_security_group_owner_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CacheSecurityGroupName"; "EC2SecurityGroupName"; "EC2SecurityGroupOwnerId" ] (fun tag _ ->
      match tag with
      | "CacheSecurityGroupName" ->
          r_cache_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CacheSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EC2SecurityGroupName" ->
          r_ec2_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EC2SecurityGroupOwnerId" ->
          r_ec2_security_group_owner_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EC2SecurityGroupOwnerId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cache_security_group_name =
       Smaws_Lib.Xml.Parse.required "CacheSecurityGroupName" (( ! ) r_cache_security_group_name) i;
     ec2_security_group_name =
       Smaws_Lib.Xml.Parse.required "EC2SecurityGroupName" (( ! ) r_ec2_security_group_name) i;
     ec2_security_group_owner_id =
       Smaws_Lib.Xml.Parse.required "EC2SecurityGroupOwnerId"
         (( ! ) r_ec2_security_group_owner_id)
         i;
   }
    : authorize_cache_security_group_ingress_message)
