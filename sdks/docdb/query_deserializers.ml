open Types

let unit_of_xml _ = ()
let exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let boolean__of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let event_categories_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory" (fun i _ -> string__of_xml i) ()

let source_ids_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SourceId" (fun i _ -> string__of_xml i) ()

let event_subscription_of_xml i =
  let r_customer_aws_id = ref None in
  let r_cust_subscription_id = ref None in
  let r_sns_topic_arn = ref None in
  let r_status = ref None in
  let r_subscription_creation_time = ref None in
  let r_source_type = ref None in
  let r_source_ids_list = ref None in
  let r_event_categories_list = ref None in
  let r_enabled = ref None in
  let r_event_subscription_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CustomerAwsId";
      "CustSubscriptionId";
      "SnsTopicArn";
      "Status";
      "SubscriptionCreationTime";
      "SourceType";
      "SourceIdsList";
      "EventCategoriesList";
      "Enabled";
      "EventSubscriptionArn";
    ] (fun tag _ ->
      match tag with
      | "CustomerAwsId" ->
          r_customer_aws_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomerAwsId" (fun i _ -> string__of_xml i) ())
      | "CustSubscriptionId" ->
          r_cust_subscription_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustSubscriptionId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnsTopicArn" ->
          r_sns_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnsTopicArn" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "SubscriptionCreationTime" ->
          r_subscription_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionCreationTime"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | "SourceIdsList" ->
          r_source_ids_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdsList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SourceId" (fun i _ -> string__of_xml i) ())
                 ())
      | "EventCategoriesList" ->
          r_event_categories_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategoriesList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> boolean__of_xml i) ())
      | "EventSubscriptionArn" ->
          r_event_subscription_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventSubscriptionArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     customer_aws_id = ( ! ) r_customer_aws_id;
     cust_subscription_id = ( ! ) r_cust_subscription_id;
     sns_topic_arn = ( ! ) r_sns_topic_arn;
     status = ( ! ) r_status;
     subscription_creation_time = ( ! ) r_subscription_creation_time;
     source_type = ( ! ) r_source_type;
     source_ids_list = ( ! ) r_source_ids_list;
     event_categories_list = ( ! ) r_event_categories_list;
     enabled = ( ! ) r_enabled;
     event_subscription_arn = ( ! ) r_event_subscription_arn;
   }
    : event_subscription)

let add_source_identifier_to_subscription_result_of_xml i =
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
  ({ event_subscription = ( ! ) r_event_subscription }
    : add_source_identifier_to_subscription_result)

let add_source_identifier_to_subscription_message_of_xml i =
  let r_subscription_name = ref None in
  let r_source_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SubscriptionName"; "SourceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceIdentifier" ->
          r_source_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subscription_name =
       Smaws_Lib.Xml.Parse.required "SubscriptionName" (( ! ) r_subscription_name) i;
     source_identifier =
       Smaws_Lib.Xml.Parse.required "SourceIdentifier" (( ! ) r_source_identifier) i;
   }
    : add_source_identifier_to_subscription_message)

let db_snapshot_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_snapshot_not_found_fault)

let db_instance_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_instance_not_found_fault)

let db_cluster_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_cluster_not_found_fault)

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

let invalid_global_cluster_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_global_cluster_state_fault)

let invalid_db_cluster_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_db_cluster_state_fault)

let global_cluster_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : global_cluster_not_found_fault)

let failover_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "pending" -> PENDING
   | "failing-over" -> FAILING_OVER
   | "cancelling" -> CANCELLING
   | _ -> failwith "unknown enum value"
    : failover_status)

let failover_state_of_xml i =
  let r_status = ref None in
  let r_from_db_cluster_arn = ref None in
  let r_to_db_cluster_arn = ref None in
  let r_is_data_loss_allowed = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Status"; "FromDbClusterArn"; "ToDbClusterArn"; "IsDataLossAllowed" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> failover_status_of_xml i)
                 ())
      | "FromDbClusterArn" ->
          r_from_db_cluster_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromDbClusterArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ToDbClusterArn" ->
          r_to_db_cluster_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ToDbClusterArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IsDataLossAllowed" ->
          r_is_data_loss_allowed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsDataLossAllowed"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = ( ! ) r_status;
     from_db_cluster_arn = ( ! ) r_from_db_cluster_arn;
     to_db_cluster_arn = ( ! ) r_to_db_cluster_arn;
     is_data_loss_allowed = ( ! ) r_is_data_loss_allowed;
   }
    : failover_state)

let global_cluster_member_synchronization_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "connected" -> CONNECTED
   | "pending-resync" -> PENDING_RESYNC
   | _ -> failwith "unknown enum value"
    : global_cluster_member_synchronization_status)

let readers_arn_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let global_cluster_member_of_xml i =
  let r_db_cluster_arn = ref None in
  let r_readers = ref None in
  let r_is_writer = ref None in
  let r_synchronization_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterArn"; "Readers"; "IsWriter"; "SynchronizationStatus" ] (fun tag _ ->
      match tag with
      | "DBClusterArn" ->
          r_db_cluster_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterArn" (fun i _ -> string__of_xml i) ())
      | "Readers" ->
          r_readers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Readers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "IsWriter" ->
          r_is_writer :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IsWriter" (fun i _ -> boolean__of_xml i) ())
      | "SynchronizationStatus" ->
          r_synchronization_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SynchronizationStatus"
                 (fun i _ -> global_cluster_member_synchronization_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_arn = ( ! ) r_db_cluster_arn;
     readers = ( ! ) r_readers;
     is_writer = ( ! ) r_is_writer;
     synchronization_status = ( ! ) r_synchronization_status;
   }
    : global_cluster_member)

let global_cluster_member_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "GlobalClusterMember"
    (fun i _ -> global_cluster_member_of_xml i)
    ()

let boolean_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let global_cluster_identifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let global_cluster_of_xml i =
  let r_global_cluster_identifier = ref None in
  let r_global_cluster_resource_id = ref None in
  let r_global_cluster_arn = ref None in
  let r_status = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_database_name = ref None in
  let r_storage_encrypted = ref None in
  let r_deletion_protection = ref None in
  let r_global_cluster_members = ref None in
  let r_failover_state = ref None in
  let r_tag_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "GlobalClusterIdentifier";
      "GlobalClusterResourceId";
      "GlobalClusterArn";
      "Status";
      "Engine";
      "EngineVersion";
      "DatabaseName";
      "StorageEncrypted";
      "DeletionProtection";
      "GlobalClusterMembers";
      "FailoverState";
      "TagList";
    ] (fun tag _ ->
      match tag with
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "GlobalClusterResourceId" ->
          r_global_cluster_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterResourceId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalClusterArn" ->
          r_global_cluster_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName" (fun i _ -> string__of_xml i) ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "GlobalClusterMembers" ->
          r_global_cluster_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "GlobalClusterMember"
                     (fun i _ -> global_cluster_member_of_xml i)
                     ())
                 ())
      | "FailoverState" ->
          r_failover_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailoverState"
                 (fun i _ -> failover_state_of_xml i)
                 ())
      | "TagList" ->
          r_tag_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_cluster_identifier = ( ! ) r_global_cluster_identifier;
     global_cluster_resource_id = ( ! ) r_global_cluster_resource_id;
     global_cluster_arn = ( ! ) r_global_cluster_arn;
     status = ( ! ) r_status;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     database_name = ( ! ) r_database_name;
     storage_encrypted = ( ! ) r_storage_encrypted;
     deletion_protection = ( ! ) r_deletion_protection;
     global_cluster_members = ( ! ) r_global_cluster_members;
     failover_state = ( ! ) r_failover_state;
     tag_list = ( ! ) r_tag_list;
   }
    : global_cluster)

let switchover_global_cluster_result_of_xml i =
  let r_global_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalCluster" ] (fun tag _ ->
      match tag with
      | "GlobalCluster" ->
          r_global_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalCluster"
                 (fun i _ -> global_cluster_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_cluster = ( ! ) r_global_cluster } : switchover_global_cluster_result)

let db_cluster_identifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let switchover_global_cluster_message_of_xml i =
  let r_global_cluster_identifier = ref None in
  let r_target_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "GlobalClusterIdentifier"; "TargetDbClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "TargetDbClusterIdentifier" ->
          r_target_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDbClusterIdentifier"
                 (fun i _ -> db_cluster_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "GlobalClusterIdentifier" (( ! ) r_global_cluster_identifier) i;
     target_db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "TargetDbClusterIdentifier"
         (( ! ) r_target_db_cluster_identifier)
         i;
   }
    : switchover_global_cluster_message)

let invalid_db_instance_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_db_instance_state_fault)

let cluster_master_user_secret_of_xml i =
  let r_secret_arn = ref None in
  let r_secret_status = ref None in
  let r_kms_key_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SecretArn"; "SecretStatus"; "KmsKeyId" ]
    (fun tag _ ->
      match tag with
      | "SecretArn" ->
          r_secret_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SecretArn" (fun i _ -> string__of_xml i) ())
      | "SecretStatus" ->
          r_secret_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecretStatus" (fun i _ -> string__of_xml i) ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     secret_arn = ( ! ) r_secret_arn;
     secret_status = ( ! ) r_secret_status;
     kms_key_id = ( ! ) r_kms_key_id;
   }
    : cluster_master_user_secret)

let double_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let serverless_v2_scaling_configuration_info_of_xml i =
  let r_min_capacity = ref None in
  let r_max_capacity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MinCapacity"; "MaxCapacity" ] (fun tag _ ->
      match tag with
      | "MinCapacity" ->
          r_min_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinCapacity"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "MaxCapacity" ->
          r_max_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCapacity"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min_capacity = ( ! ) r_min_capacity; max_capacity = ( ! ) r_max_capacity }
    : serverless_v2_scaling_configuration_info)

let t_stamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let log_type_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let db_cluster_role_of_xml i =
  let r_role_arn = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RoleArn"; "Status" ] (fun tag _ ->
      match tag with
      | "RoleArn" ->
          r_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ role_arn = ( ! ) r_role_arn; status = ( ! ) r_status } : db_cluster_role)

let db_cluster_roles_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterRole" (fun i _ -> db_cluster_role_of_xml i) ()

let vpc_security_group_membership_of_xml i =
  let r_vpc_security_group_id = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VpcSecurityGroupId"; "Status" ] (fun tag _ ->
      match tag with
      | "VpcSecurityGroupId" ->
          r_vpc_security_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ vpc_security_group_id = ( ! ) r_vpc_security_group_id; status = ( ! ) r_status }
    : vpc_security_group_membership)

let vpc_security_group_membership_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupMembership"
    (fun i _ -> vpc_security_group_membership_of_xml i)
    ()

let integer_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let db_cluster_member_of_xml i =
  let r_db_instance_identifier = ref None in
  let r_is_cluster_writer = ref None in
  let r_db_cluster_parameter_group_status = ref None in
  let r_promotion_tier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBInstanceIdentifier"; "IsClusterWriter"; "DBClusterParameterGroupStatus"; "PromotionTier" ]
    (fun tag _ ->
      match tag with
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IsClusterWriter" ->
          r_is_cluster_writer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsClusterWriter"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "DBClusterParameterGroupStatus" ->
          r_db_cluster_parameter_group_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PromotionTier" ->
          r_promotion_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PromotionTier"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_instance_identifier = ( ! ) r_db_instance_identifier;
     is_cluster_writer = ( ! ) r_is_cluster_writer;
     db_cluster_parameter_group_status = ( ! ) r_db_cluster_parameter_group_status;
     promotion_tier = ( ! ) r_promotion_tier;
   }
    : db_cluster_member)

let db_cluster_member_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterMember" (fun i _ -> db_cluster_member_of_xml i) ()

let read_replica_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReadReplicaIdentifier" (fun i _ -> string__of_xml i) ()

let availability_zones_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone" (fun i _ -> string__of_xml i) ()

let db_cluster_of_xml i =
  let r_availability_zones = ref None in
  let r_backup_retention_period = ref None in
  let r_db_cluster_identifier = ref None in
  let r_db_cluster_parameter_group = ref None in
  let r_db_subnet_group = ref None in
  let r_status = ref None in
  let r_percent_progress = ref None in
  let r_earliest_restorable_time = ref None in
  let r_endpoint = ref None in
  let r_reader_endpoint = ref None in
  let r_multi_a_z = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_latest_restorable_time = ref None in
  let r_port = ref None in
  let r_master_username = ref None in
  let r_preferred_backup_window = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_replication_source_identifier = ref None in
  let r_read_replica_identifiers = ref None in
  let r_db_cluster_members = ref None in
  let r_vpc_security_groups = ref None in
  let r_hosted_zone_id = ref None in
  let r_storage_encrypted = ref None in
  let r_kms_key_id = ref None in
  let r_db_cluster_resource_id = ref None in
  let r_db_cluster_arn = ref None in
  let r_associated_roles = ref None in
  let r_clone_group_id = ref None in
  let r_cluster_create_time = ref None in
  let r_enabled_cloudwatch_logs_exports = ref None in
  let r_deletion_protection = ref None in
  let r_io_optimized_next_allowed_modification_time = ref None in
  let r_storage_type = ref None in
  let r_serverless_v2_scaling_configuration = ref None in
  let r_master_user_secret = ref None in
  let r_network_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AvailabilityZones";
      "BackupRetentionPeriod";
      "DBClusterIdentifier";
      "DBClusterParameterGroup";
      "DBSubnetGroup";
      "Status";
      "PercentProgress";
      "EarliestRestorableTime";
      "Endpoint";
      "ReaderEndpoint";
      "MultiAZ";
      "Engine";
      "EngineVersion";
      "LatestRestorableTime";
      "Port";
      "MasterUsername";
      "PreferredBackupWindow";
      "PreferredMaintenanceWindow";
      "ReplicationSourceIdentifier";
      "ReadReplicaIdentifiers";
      "DBClusterMembers";
      "VpcSecurityGroups";
      "HostedZoneId";
      "StorageEncrypted";
      "KmsKeyId";
      "DbClusterResourceId";
      "DBClusterArn";
      "AssociatedRoles";
      "CloneGroupId";
      "ClusterCreateTime";
      "EnabledCloudwatchLogsExports";
      "DeletionProtection";
      "IOOptimizedNextAllowedModificationTime";
      "StorageType";
      "ServerlessV2ScalingConfiguration";
      "MasterUserSecret";
      "NetworkType";
    ] (fun tag _ ->
      match tag with
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "BackupRetentionPeriod" ->
          r_backup_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterParameterGroup" ->
          r_db_cluster_parameter_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroup"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBSubnetGroup" ->
          r_db_subnet_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroup" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "PercentProgress" ->
          r_percent_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentProgress"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EarliestRestorableTime" ->
          r_earliest_restorable_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EarliestRestorableTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> string__of_xml i) ())
      | "ReaderEndpoint" ->
          r_reader_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReaderEndpoint"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ" (fun i _ -> boolean__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "LatestRestorableTime" ->
          r_latest_restorable_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LatestRestorableTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "MasterUsername" ->
          r_master_username :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUsername"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredBackupWindow" ->
          r_preferred_backup_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredBackupWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReplicationSourceIdentifier" ->
          r_replication_source_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationSourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReadReplicaIdentifiers" ->
          r_read_replica_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReadReplicaIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReadReplicaIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "DBClusterMembers" ->
          r_db_cluster_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterMember"
                     (fun i _ -> db_cluster_member_of_xml i)
                     ())
                 ())
      | "VpcSecurityGroups" ->
          r_vpc_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupMembership"
                     (fun i _ -> vpc_security_group_membership_of_xml i)
                     ())
                 ())
      | "HostedZoneId" ->
          r_hosted_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HostedZoneId" (fun i _ -> string__of_xml i) ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "DbClusterResourceId" ->
          r_db_cluster_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbClusterResourceId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterArn" ->
          r_db_cluster_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterArn" (fun i _ -> string__of_xml i) ())
      | "AssociatedRoles" ->
          r_associated_roles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociatedRoles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterRole"
                     (fun i _ -> db_cluster_role_of_xml i)
                     ())
                 ())
      | "CloneGroupId" ->
          r_clone_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CloneGroupId" (fun i _ -> string__of_xml i) ())
      | "ClusterCreateTime" ->
          r_cluster_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "EnabledCloudwatchLogsExports" ->
          r_enabled_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnabledCloudwatchLogsExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "IOOptimizedNextAllowedModificationTime" ->
          r_io_optimized_next_allowed_modification_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IOOptimizedNextAllowedModificationTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "ServerlessV2ScalingConfiguration" ->
          r_serverless_v2_scaling_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessV2ScalingConfiguration"
                 (fun i _ -> serverless_v2_scaling_configuration_info_of_xml i)
                 ())
      | "MasterUserSecret" ->
          r_master_user_secret :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserSecret"
                 (fun i _ -> cluster_master_user_secret_of_xml i)
                 ())
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     availability_zones = ( ! ) r_availability_zones;
     backup_retention_period = ( ! ) r_backup_retention_period;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     db_cluster_parameter_group = ( ! ) r_db_cluster_parameter_group;
     db_subnet_group = ( ! ) r_db_subnet_group;
     status = ( ! ) r_status;
     percent_progress = ( ! ) r_percent_progress;
     earliest_restorable_time = ( ! ) r_earliest_restorable_time;
     endpoint = ( ! ) r_endpoint;
     reader_endpoint = ( ! ) r_reader_endpoint;
     multi_a_z = ( ! ) r_multi_a_z;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     latest_restorable_time = ( ! ) r_latest_restorable_time;
     port = ( ! ) r_port;
     master_username = ( ! ) r_master_username;
     preferred_backup_window = ( ! ) r_preferred_backup_window;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     replication_source_identifier = ( ! ) r_replication_source_identifier;
     read_replica_identifiers = ( ! ) r_read_replica_identifiers;
     db_cluster_members = ( ! ) r_db_cluster_members;
     vpc_security_groups = ( ! ) r_vpc_security_groups;
     hosted_zone_id = ( ! ) r_hosted_zone_id;
     storage_encrypted = ( ! ) r_storage_encrypted;
     kms_key_id = ( ! ) r_kms_key_id;
     db_cluster_resource_id = ( ! ) r_db_cluster_resource_id;
     db_cluster_arn = ( ! ) r_db_cluster_arn;
     associated_roles = ( ! ) r_associated_roles;
     clone_group_id = ( ! ) r_clone_group_id;
     cluster_create_time = ( ! ) r_cluster_create_time;
     enabled_cloudwatch_logs_exports = ( ! ) r_enabled_cloudwatch_logs_exports;
     deletion_protection = ( ! ) r_deletion_protection;
     io_optimized_next_allowed_modification_time =
       ( ! ) r_io_optimized_next_allowed_modification_time;
     storage_type = ( ! ) r_storage_type;
     serverless_v2_scaling_configuration = ( ! ) r_serverless_v2_scaling_configuration;
     master_user_secret = ( ! ) r_master_user_secret;
     network_type = ( ! ) r_network_type;
   }
    : db_cluster)

let stop_db_cluster_result_of_xml i =
  let r_db_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBCluster" ] (fun tag _ ->
      match tag with
      | "DBCluster" ->
          r_db_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBCluster" (fun i _ -> db_cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster = ( ! ) r_db_cluster } : stop_db_cluster_result)

let stop_db_cluster_message_of_xml i =
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
   }
    : stop_db_cluster_message)

let start_db_cluster_result_of_xml i =
  let r_db_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBCluster" ] (fun tag _ ->
      match tag with
      | "DBCluster" ->
          r_db_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBCluster" (fun i _ -> db_cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster = ( ! ) r_db_cluster } : start_db_cluster_result)

let start_db_cluster_message_of_xml i =
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
   }
    : start_db_cluster_message)

let storage_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : storage_quota_exceeded_fault)

let network_type_not_supported_of_xml i =
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
  ({ message = ( ! ) r_message } : network_type_not_supported)

let kms_key_not_accessible_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : kms_key_not_accessible_fault)

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

let invalid_db_snapshot_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_db_snapshot_state_fault)

let invalid_db_cluster_snapshot_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_db_cluster_snapshot_state_fault)

let insufficient_storage_cluster_capacity_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : insufficient_storage_cluster_capacity_fault)

let insufficient_db_cluster_capacity_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : insufficient_db_cluster_capacity_fault)

let db_subnet_group_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_subnet_group_not_found_fault)

let db_cluster_snapshot_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_cluster_snapshot_not_found_fault)

let db_cluster_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_cluster_quota_exceeded_fault)

let db_cluster_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_cluster_already_exists_fault)

let restore_db_cluster_to_point_in_time_result_of_xml i =
  let r_db_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBCluster" ] (fun tag _ ->
      match tag with
      | "DBCluster" ->
          r_db_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBCluster" (fun i _ -> db_cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster = ( ! ) r_db_cluster } : restore_db_cluster_to_point_in_time_result)

let serverless_v2_scaling_configuration_of_xml i =
  let r_min_capacity = ref None in
  let r_max_capacity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MinCapacity"; "MaxCapacity" ] (fun tag _ ->
      match tag with
      | "MinCapacity" ->
          r_min_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinCapacity"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "MaxCapacity" ->
          r_max_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCapacity"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min_capacity = ( ! ) r_min_capacity; max_capacity = ( ! ) r_max_capacity }
    : serverless_v2_scaling_configuration)

let vpc_security_group_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId" (fun i _ -> string__of_xml i) ()

let restore_db_cluster_to_point_in_time_message_of_xml i =
  let r_db_cluster_identifier = ref None in
  let r_restore_type = ref None in
  let r_source_db_cluster_identifier = ref None in
  let r_restore_to_time = ref None in
  let r_use_latest_restorable_time = ref None in
  let r_port = ref None in
  let r_db_subnet_group_name = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_tags = ref None in
  let r_kms_key_id = ref None in
  let r_enable_cloudwatch_logs_exports = ref None in
  let r_deletion_protection = ref None in
  let r_serverless_v2_scaling_configuration = ref None in
  let r_storage_type = ref None in
  let r_network_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBClusterIdentifier";
      "RestoreType";
      "SourceDBClusterIdentifier";
      "RestoreToTime";
      "UseLatestRestorableTime";
      "Port";
      "DBSubnetGroupName";
      "VpcSecurityGroupIds";
      "Tags";
      "KmsKeyId";
      "EnableCloudwatchLogsExports";
      "DeletionProtection";
      "ServerlessV2ScalingConfiguration";
      "StorageType";
      "NetworkType";
    ] (fun tag _ ->
      match tag with
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RestoreType" ->
          r_restore_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RestoreType" (fun i _ -> string__of_xml i) ())
      | "SourceDBClusterIdentifier" ->
          r_source_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RestoreToTime" ->
          r_restore_to_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RestoreToTime" (fun i _ -> t_stamp_of_xml i) ())
      | "UseLatestRestorableTime" ->
          r_use_latest_restorable_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UseLatestRestorableTime"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
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
      | "EnableCloudwatchLogsExports" ->
          r_enable_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableCloudwatchLogsExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ServerlessV2ScalingConfiguration" ->
          r_serverless_v2_scaling_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessV2ScalingConfiguration"
                 (fun i _ -> serverless_v2_scaling_configuration_of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     restore_type = ( ! ) r_restore_type;
     source_db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "SourceDBClusterIdentifier"
         (( ! ) r_source_db_cluster_identifier)
         i;
     restore_to_time = ( ! ) r_restore_to_time;
     use_latest_restorable_time = ( ! ) r_use_latest_restorable_time;
     port = ( ! ) r_port;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     tags = ( ! ) r_tags;
     kms_key_id = ( ! ) r_kms_key_id;
     enable_cloudwatch_logs_exports = ( ! ) r_enable_cloudwatch_logs_exports;
     deletion_protection = ( ! ) r_deletion_protection;
     serverless_v2_scaling_configuration = ( ! ) r_serverless_v2_scaling_configuration;
     storage_type = ( ! ) r_storage_type;
     network_type = ( ! ) r_network_type;
   }
    : restore_db_cluster_to_point_in_time_message)

let restore_db_cluster_from_snapshot_result_of_xml i =
  let r_db_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBCluster" ] (fun tag _ ->
      match tag with
      | "DBCluster" ->
          r_db_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBCluster" (fun i _ -> db_cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster = ( ! ) r_db_cluster } : restore_db_cluster_from_snapshot_result)

let restore_db_cluster_from_snapshot_message_of_xml i =
  let r_availability_zones = ref None in
  let r_db_cluster_identifier = ref None in
  let r_snapshot_identifier = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_port = ref None in
  let r_db_subnet_group_name = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_tags = ref None in
  let r_kms_key_id = ref None in
  let r_enable_cloudwatch_logs_exports = ref None in
  let r_deletion_protection = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  let r_serverless_v2_scaling_configuration = ref None in
  let r_storage_type = ref None in
  let r_network_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AvailabilityZones";
      "DBClusterIdentifier";
      "SnapshotIdentifier";
      "Engine";
      "EngineVersion";
      "Port";
      "DBSubnetGroupName";
      "VpcSecurityGroupIds";
      "Tags";
      "KmsKeyId";
      "EnableCloudwatchLogsExports";
      "DeletionProtection";
      "DBClusterParameterGroupName";
      "ServerlessV2ScalingConfiguration";
      "StorageType";
      "NetworkType";
    ] (fun tag _ ->
      match tag with
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
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
      | "EnableCloudwatchLogsExports" ->
          r_enable_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableCloudwatchLogsExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ServerlessV2ScalingConfiguration" ->
          r_serverless_v2_scaling_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessV2ScalingConfiguration"
                 (fun i _ -> serverless_v2_scaling_configuration_of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     availability_zones = ( ! ) r_availability_zones;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifier" (( ! ) r_snapshot_identifier) i;
     engine = Smaws_Lib.Xml.Parse.required "Engine" (( ! ) r_engine) i;
     engine_version = ( ! ) r_engine_version;
     port = ( ! ) r_port;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     tags = ( ! ) r_tags;
     kms_key_id = ( ! ) r_kms_key_id;
     enable_cloudwatch_logs_exports = ( ! ) r_enable_cloudwatch_logs_exports;
     deletion_protection = ( ! ) r_deletion_protection;
     db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name;
     serverless_v2_scaling_configuration = ( ! ) r_serverless_v2_scaling_configuration;
     storage_type = ( ! ) r_storage_type;
     network_type = ( ! ) r_network_type;
   }
    : restore_db_cluster_from_snapshot_message)

let invalid_db_parameter_group_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_db_parameter_group_state_fault)

let db_parameter_group_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_parameter_group_not_found_fault)

let db_cluster_parameter_group_name_message_of_xml i =
  let r_db_cluster_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterParameterGroupName" ] (fun tag _ ->
      match tag with
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name }
    : db_cluster_parameter_group_name_message)

let apply_method_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "immediate" -> Immediate
   | "pending-reboot" -> Pending_reboot
   | _ -> failwith "unknown enum value"
    : apply_method)

let parameter_of_xml i =
  let r_parameter_name = ref None in
  let r_parameter_value = ref None in
  let r_description = ref None in
  let r_source = ref None in
  let r_apply_type = ref None in
  let r_data_type = ref None in
  let r_allowed_values = ref None in
  let r_is_modifiable = ref None in
  let r_minimum_engine_version = ref None in
  let r_apply_method = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ParameterName";
      "ParameterValue";
      "Description";
      "Source";
      "ApplyType";
      "DataType";
      "AllowedValues";
      "IsModifiable";
      "MinimumEngineVersion";
      "ApplyMethod";
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
      | "ApplyType" ->
          r_apply_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyType" (fun i _ -> string__of_xml i) ())
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
      | "ApplyMethod" ->
          r_apply_method :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyMethod"
                 (fun i _ -> apply_method_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_name = ( ! ) r_parameter_name;
     parameter_value = ( ! ) r_parameter_value;
     description = ( ! ) r_description;
     source = ( ! ) r_source;
     apply_type = ( ! ) r_apply_type;
     data_type = ( ! ) r_data_type;
     allowed_values = ( ! ) r_allowed_values;
     is_modifiable = ( ! ) r_is_modifiable;
     minimum_engine_version = ( ! ) r_minimum_engine_version;
     apply_method = ( ! ) r_apply_method;
   }
    : parameter)

let parameters_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Parameter" (fun i _ -> parameter_of_xml i) ()

let reset_db_cluster_parameter_group_message_of_xml i =
  let r_db_cluster_parameter_group_name = ref None in
  let r_reset_all_parameters = ref None in
  let r_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterParameterGroupName"; "ResetAllParameters"; "Parameters" ] (fun tag _ ->
      match tag with
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ResetAllParameters" ->
          r_reset_all_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResetAllParameters"
                 (fun i _ -> boolean__of_xml i)
                 ())
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
  ({
     db_cluster_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBClusterParameterGroupName"
         (( ! ) r_db_cluster_parameter_group_name)
         i;
     reset_all_parameters = ( ! ) r_reset_all_parameters;
     parameters = ( ! ) r_parameters;
   }
    : reset_db_cluster_parameter_group_message)

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

let remove_source_identifier_from_subscription_result_of_xml i =
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
  ({ event_subscription = ( ! ) r_event_subscription }
    : remove_source_identifier_from_subscription_result)

let remove_source_identifier_from_subscription_message_of_xml i =
  let r_subscription_name = ref None in
  let r_source_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SubscriptionName"; "SourceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceIdentifier" ->
          r_source_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subscription_name =
       Smaws_Lib.Xml.Parse.required "SubscriptionName" (( ! ) r_subscription_name) i;
     source_identifier =
       Smaws_Lib.Xml.Parse.required "SourceIdentifier" (( ! ) r_source_identifier) i;
   }
    : remove_source_identifier_from_subscription_message)

let remove_from_global_cluster_result_of_xml i =
  let r_global_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalCluster" ] (fun tag _ ->
      match tag with
      | "GlobalCluster" ->
          r_global_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalCluster"
                 (fun i _ -> global_cluster_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_cluster = ( ! ) r_global_cluster } : remove_from_global_cluster_result)

let remove_from_global_cluster_message_of_xml i =
  let r_global_cluster_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalClusterIdentifier"; "DbClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "DbClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "GlobalClusterIdentifier" (( ! ) r_global_cluster_identifier) i;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DbClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
   }
    : remove_from_global_cluster_message)

let certificate_details_of_xml i =
  let r_ca_identifier = ref None in
  let r_valid_till = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CAIdentifier"; "ValidTill" ] (fun tag _ ->
      match tag with
      | "CAIdentifier" ->
          r_ca_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CAIdentifier" (fun i _ -> string__of_xml i) ())
      | "ValidTill" ->
          r_valid_till :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ValidTill" (fun i _ -> t_stamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ ca_identifier = ( ! ) r_ca_identifier; valid_till = ( ! ) r_valid_till } : certificate_details)

let db_instance_status_info_of_xml i =
  let r_status_type = ref None in
  let r_normal = ref None in
  let r_status = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StatusType"; "Normal"; "Status"; "Message" ]
    (fun tag _ ->
      match tag with
      | "StatusType" ->
          r_status_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StatusType" (fun i _ -> string__of_xml i) ())
      | "Normal" ->
          r_normal :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Normal" (fun i _ -> boolean__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status_type = ( ! ) r_status_type;
     normal = ( ! ) r_normal;
     status = ( ! ) r_status;
     message = ( ! ) r_message;
   }
    : db_instance_status_info)

let db_instance_status_info_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBInstanceStatusInfo"
    (fun i _ -> db_instance_status_info_of_xml i)
    ()

let pending_cloudwatch_logs_exports_of_xml i =
  let r_log_types_to_enable = ref None in
  let r_log_types_to_disable = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LogTypesToEnable"; "LogTypesToDisable" ]
    (fun tag _ ->
      match tag with
      | "LogTypesToEnable" ->
          r_log_types_to_enable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogTypesToEnable"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "LogTypesToDisable" ->
          r_log_types_to_disable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogTypesToDisable"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     log_types_to_enable = ( ! ) r_log_types_to_enable;
     log_types_to_disable = ( ! ) r_log_types_to_disable;
   }
    : pending_cloudwatch_logs_exports)

let pending_modified_values_of_xml i =
  let r_db_instance_class = ref None in
  let r_allocated_storage = ref None in
  let r_master_user_password = ref None in
  let r_port = ref None in
  let r_backup_retention_period = ref None in
  let r_multi_a_z = ref None in
  let r_engine_version = ref None in
  let r_license_model = ref None in
  let r_iops = ref None in
  let r_db_instance_identifier = ref None in
  let r_storage_type = ref None in
  let r_ca_certificate_identifier = ref None in
  let r_db_subnet_group_name = ref None in
  let r_pending_cloudwatch_logs_exports = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBInstanceClass";
      "AllocatedStorage";
      "MasterUserPassword";
      "Port";
      "BackupRetentionPeriod";
      "MultiAZ";
      "EngineVersion";
      "LicenseModel";
      "Iops";
      "DBInstanceIdentifier";
      "StorageType";
      "CACertificateIdentifier";
      "DBSubnetGroupName";
      "PendingCloudwatchLogsExports";
    ] (fun tag _ ->
      match tag with
      | "DBInstanceClass" ->
          r_db_instance_class :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceClass"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AllocatedStorage" ->
          r_allocated_storage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllocatedStorage"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "MasterUserPassword" ->
          r_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserPassword"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "BackupRetentionPeriod" ->
          r_backup_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "LicenseModel" ->
          r_license_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LicenseModel" (fun i _ -> string__of_xml i) ())
      | "Iops" ->
          r_iops :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Iops" (fun i _ -> integer_optional_of_xml i) ())
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "CACertificateIdentifier" ->
          r_ca_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CACertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PendingCloudwatchLogsExports" ->
          r_pending_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingCloudwatchLogsExports"
                 (fun i _ -> pending_cloudwatch_logs_exports_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_instance_class = ( ! ) r_db_instance_class;
     allocated_storage = ( ! ) r_allocated_storage;
     master_user_password = ( ! ) r_master_user_password;
     port = ( ! ) r_port;
     backup_retention_period = ( ! ) r_backup_retention_period;
     multi_a_z = ( ! ) r_multi_a_z;
     engine_version = ( ! ) r_engine_version;
     license_model = ( ! ) r_license_model;
     iops = ( ! ) r_iops;
     db_instance_identifier = ( ! ) r_db_instance_identifier;
     storage_type = ( ! ) r_storage_type;
     ca_certificate_identifier = ( ! ) r_ca_certificate_identifier;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     pending_cloudwatch_logs_exports = ( ! ) r_pending_cloudwatch_logs_exports;
   }
    : pending_modified_values)

let network_type_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

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
  let r_subnet_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SubnetIdentifier"; "SubnetAvailabilityZone"; "SubnetStatus" ] (fun tag _ ->
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
      | "SubnetStatus" ->
          r_subnet_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetStatus" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subnet_identifier = ( ! ) r_subnet_identifier;
     subnet_availability_zone = ( ! ) r_subnet_availability_zone;
     subnet_status = ( ! ) r_subnet_status;
   }
    : subnet)

let subnet_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Subnet" (fun i _ -> subnet_of_xml i) ()

let db_subnet_group_of_xml i =
  let r_db_subnet_group_name = ref None in
  let r_db_subnet_group_description = ref None in
  let r_vpc_id = ref None in
  let r_subnet_group_status = ref None in
  let r_subnets = ref None in
  let r_db_subnet_group_arn = ref None in
  let r_supported_network_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBSubnetGroupName";
      "DBSubnetGroupDescription";
      "VpcId";
      "SubnetGroupStatus";
      "Subnets";
      "DBSubnetGroupArn";
      "SupportedNetworkTypes";
    ] (fun tag _ ->
      match tag with
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBSubnetGroupDescription" ->
          r_db_subnet_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "SubnetGroupStatus" ->
          r_subnet_group_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetGroupStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Subnets" ->
          r_subnets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subnets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Subnet" (fun i _ -> subnet_of_xml i) ())
                 ())
      | "DBSubnetGroupArn" ->
          r_db_subnet_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SupportedNetworkTypes" ->
          r_supported_network_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedNetworkTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     db_subnet_group_description = ( ! ) r_db_subnet_group_description;
     vpc_id = ( ! ) r_vpc_id;
     subnet_group_status = ( ! ) r_subnet_group_status;
     subnets = ( ! ) r_subnets;
     db_subnet_group_arn = ( ! ) r_db_subnet_group_arn;
     supported_network_types = ( ! ) r_supported_network_types;
   }
    : db_subnet_group)

let integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let endpoint_of_xml i =
  let r_address = ref None in
  let r_port = ref None in
  let r_hosted_zone_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Address"; "Port"; "HostedZoneId" ] (fun tag _ ->
      match tag with
      | "Address" ->
          r_address :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Address" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | "HostedZoneId" ->
          r_hosted_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HostedZoneId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ address = ( ! ) r_address; port = ( ! ) r_port; hosted_zone_id = ( ! ) r_hosted_zone_id }
    : endpoint)

let db_instance_of_xml i =
  let r_db_instance_identifier = ref None in
  let r_db_instance_class = ref None in
  let r_engine = ref None in
  let r_db_instance_status = ref None in
  let r_endpoint = ref None in
  let r_instance_create_time = ref None in
  let r_preferred_backup_window = ref None in
  let r_backup_retention_period = ref None in
  let r_vpc_security_groups = ref None in
  let r_availability_zone = ref None in
  let r_db_subnet_group = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_pending_modified_values = ref None in
  let r_latest_restorable_time = ref None in
  let r_engine_version = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_publicly_accessible = ref None in
  let r_status_infos = ref None in
  let r_db_cluster_identifier = ref None in
  let r_storage_encrypted = ref None in
  let r_kms_key_id = ref None in
  let r_dbi_resource_id = ref None in
  let r_ca_certificate_identifier = ref None in
  let r_copy_tags_to_snapshot = ref None in
  let r_promotion_tier = ref None in
  let r_db_instance_arn = ref None in
  let r_enabled_cloudwatch_logs_exports = ref None in
  let r_certificate_details = ref None in
  let r_performance_insights_enabled = ref None in
  let r_performance_insights_kms_key_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBInstanceIdentifier";
      "DBInstanceClass";
      "Engine";
      "DBInstanceStatus";
      "Endpoint";
      "InstanceCreateTime";
      "PreferredBackupWindow";
      "BackupRetentionPeriod";
      "VpcSecurityGroups";
      "AvailabilityZone";
      "DBSubnetGroup";
      "PreferredMaintenanceWindow";
      "PendingModifiedValues";
      "LatestRestorableTime";
      "EngineVersion";
      "AutoMinorVersionUpgrade";
      "PubliclyAccessible";
      "StatusInfos";
      "DBClusterIdentifier";
      "StorageEncrypted";
      "KmsKeyId";
      "DbiResourceId";
      "CACertificateIdentifier";
      "CopyTagsToSnapshot";
      "PromotionTier";
      "DBInstanceArn";
      "EnabledCloudwatchLogsExports";
      "CertificateDetails";
      "PerformanceInsightsEnabled";
      "PerformanceInsightsKMSKeyId";
    ] (fun tag _ ->
      match tag with
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBInstanceClass" ->
          r_db_instance_class :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceClass"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "DBInstanceStatus" ->
          r_db_instance_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> endpoint_of_xml i) ())
      | "InstanceCreateTime" ->
          r_instance_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "PreferredBackupWindow" ->
          r_preferred_backup_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredBackupWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "BackupRetentionPeriod" ->
          r_backup_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupRetentionPeriod"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "VpcSecurityGroups" ->
          r_vpc_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupMembership"
                     (fun i _ -> vpc_security_group_membership_of_xml i)
                     ())
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBSubnetGroup" ->
          r_db_subnet_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroup"
                 (fun i _ -> db_subnet_group_of_xml i)
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
      | "LatestRestorableTime" ->
          r_latest_restorable_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LatestRestorableTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "StatusInfos" ->
          r_status_infos :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusInfos"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBInstanceStatusInfo"
                     (fun i _ -> db_instance_status_info_of_xml i)
                     ())
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "DbiResourceId" ->
          r_dbi_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbiResourceId" (fun i _ -> string__of_xml i) ())
      | "CACertificateIdentifier" ->
          r_ca_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CACertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CopyTagsToSnapshot" ->
          r_copy_tags_to_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTagsToSnapshot"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PromotionTier" ->
          r_promotion_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PromotionTier"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DBInstanceArn" ->
          r_db_instance_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceArn" (fun i _ -> string__of_xml i) ())
      | "EnabledCloudwatchLogsExports" ->
          r_enabled_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnabledCloudwatchLogsExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "CertificateDetails" ->
          r_certificate_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateDetails"
                 (fun i _ -> certificate_details_of_xml i)
                 ())
      | "PerformanceInsightsEnabled" ->
          r_performance_insights_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PerformanceInsightsEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PerformanceInsightsKMSKeyId" ->
          r_performance_insights_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PerformanceInsightsKMSKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_instance_identifier = ( ! ) r_db_instance_identifier;
     db_instance_class = ( ! ) r_db_instance_class;
     engine = ( ! ) r_engine;
     db_instance_status = ( ! ) r_db_instance_status;
     endpoint = ( ! ) r_endpoint;
     instance_create_time = ( ! ) r_instance_create_time;
     preferred_backup_window = ( ! ) r_preferred_backup_window;
     backup_retention_period = ( ! ) r_backup_retention_period;
     vpc_security_groups = ( ! ) r_vpc_security_groups;
     availability_zone = ( ! ) r_availability_zone;
     db_subnet_group = ( ! ) r_db_subnet_group;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     pending_modified_values = ( ! ) r_pending_modified_values;
     latest_restorable_time = ( ! ) r_latest_restorable_time;
     engine_version = ( ! ) r_engine_version;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     publicly_accessible = ( ! ) r_publicly_accessible;
     status_infos = ( ! ) r_status_infos;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     storage_encrypted = ( ! ) r_storage_encrypted;
     kms_key_id = ( ! ) r_kms_key_id;
     dbi_resource_id = ( ! ) r_dbi_resource_id;
     ca_certificate_identifier = ( ! ) r_ca_certificate_identifier;
     copy_tags_to_snapshot = ( ! ) r_copy_tags_to_snapshot;
     promotion_tier = ( ! ) r_promotion_tier;
     db_instance_arn = ( ! ) r_db_instance_arn;
     enabled_cloudwatch_logs_exports = ( ! ) r_enabled_cloudwatch_logs_exports;
     certificate_details = ( ! ) r_certificate_details;
     performance_insights_enabled = ( ! ) r_performance_insights_enabled;
     performance_insights_kms_key_id = ( ! ) r_performance_insights_kms_key_id;
   }
    : db_instance)

let reboot_db_instance_result_of_xml i =
  let r_db_instance = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBInstance" ] (fun tag _ ->
      match tag with
      | "DBInstance" ->
          r_db_instance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstance"
                 (fun i _ -> db_instance_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_instance = ( ! ) r_db_instance } : reboot_db_instance_result)

let reboot_db_instance_message_of_xml i =
  let r_db_instance_identifier = ref None in
  let r_force_failover = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBInstanceIdentifier"; "ForceFailover" ]
    (fun tag _ ->
      match tag with
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ForceFailover" ->
          r_force_failover :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForceFailover"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_instance_identifier =
       Smaws_Lib.Xml.Parse.required "DBInstanceIdentifier" (( ! ) r_db_instance_identifier) i;
     force_failover = ( ! ) r_force_failover;
   }
    : reboot_db_instance_message)

let modify_global_cluster_result_of_xml i =
  let r_global_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalCluster" ] (fun tag _ ->
      match tag with
      | "GlobalCluster" ->
          r_global_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalCluster"
                 (fun i _ -> global_cluster_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_cluster = ( ! ) r_global_cluster } : modify_global_cluster_result)

let modify_global_cluster_message_of_xml i =
  let r_global_cluster_identifier = ref None in
  let r_new_global_cluster_identifier = ref None in
  let r_deletion_protection = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "GlobalClusterIdentifier"; "NewGlobalClusterIdentifier"; "DeletionProtection" ] (fun tag _ ->
      match tag with
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "NewGlobalClusterIdentifier" ->
          r_new_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewGlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "GlobalClusterIdentifier" (( ! ) r_global_cluster_identifier) i;
     new_global_cluster_identifier = ( ! ) r_new_global_cluster_identifier;
     deletion_protection = ( ! ) r_deletion_protection;
   }
    : modify_global_cluster_message)

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
  let r_subscription_name = ref None in
  let r_sns_topic_arn = ref None in
  let r_source_type = ref None in
  let r_event_categories = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SubscriptionName"; "SnsTopicArn"; "SourceType"; "EventCategories"; "Enabled" ] (fun tag _ ->
      match tag with
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnsTopicArn" ->
          r_sns_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnsTopicArn" (fun i _ -> string__of_xml i) ())
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | "EventCategories" ->
          r_event_categories :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategories"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subscription_name =
       Smaws_Lib.Xml.Parse.required "SubscriptionName" (( ! ) r_subscription_name) i;
     sns_topic_arn = ( ! ) r_sns_topic_arn;
     source_type = ( ! ) r_source_type;
     event_categories = ( ! ) r_event_categories;
     enabled = ( ! ) r_enabled;
   }
    : modify_event_subscription_message)

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

let db_subnet_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_subnet_quota_exceeded_fault)

let db_subnet_group_does_not_cover_enough_a_zs_of_xml i =
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
  ({ message = ( ! ) r_message } : db_subnet_group_does_not_cover_enough_a_zs)

let modify_db_subnet_group_result_of_xml i =
  let r_db_subnet_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBSubnetGroup" ] (fun tag _ ->
      match tag with
      | "DBSubnetGroup" ->
          r_db_subnet_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroup"
                 (fun i _ -> db_subnet_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_subnet_group = ( ! ) r_db_subnet_group } : modify_db_subnet_group_result)

let subnet_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SubnetIdentifier" (fun i _ -> string__of_xml i) ()

let modify_db_subnet_group_message_of_xml i =
  let r_db_subnet_group_name = ref None in
  let r_db_subnet_group_description = ref None in
  let r_subnet_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBSubnetGroupName"; "DBSubnetGroupDescription"; "SubnetIds" ] (fun tag _ ->
      match tag with
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBSubnetGroupDescription" ->
          r_db_subnet_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupDescription"
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
     db_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "DBSubnetGroupName" (( ! ) r_db_subnet_group_name) i;
     db_subnet_group_description = ( ! ) r_db_subnet_group_description;
     subnet_ids = Smaws_Lib.Xml.Parse.required "SubnetIds" (( ! ) r_subnet_ids) i;
   }
    : modify_db_subnet_group_message)

let storage_type_not_supported_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : storage_type_not_supported_fault)

let invalid_db_security_group_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_db_security_group_state_fault)

let insufficient_db_instance_capacity_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : insufficient_db_instance_capacity_fault)

let db_upgrade_dependency_failure_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_upgrade_dependency_failure_fault)

let db_security_group_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_security_group_not_found_fault)

let db_instance_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_instance_already_exists_fault)

let certificate_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : certificate_not_found_fault)

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

let modify_db_instance_result_of_xml i =
  let r_db_instance = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBInstance" ] (fun tag _ ->
      match tag with
      | "DBInstance" ->
          r_db_instance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstance"
                 (fun i _ -> db_instance_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_instance = ( ! ) r_db_instance } : modify_db_instance_result)

let modify_db_instance_message_of_xml i =
  let r_db_instance_identifier = ref None in
  let r_db_instance_class = ref None in
  let r_apply_immediately = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_new_db_instance_identifier = ref None in
  let r_ca_certificate_identifier = ref None in
  let r_copy_tags_to_snapshot = ref None in
  let r_promotion_tier = ref None in
  let r_enable_performance_insights = ref None in
  let r_performance_insights_kms_key_id = ref None in
  let r_certificate_rotation_restart = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBInstanceIdentifier";
      "DBInstanceClass";
      "ApplyImmediately";
      "PreferredMaintenanceWindow";
      "AutoMinorVersionUpgrade";
      "NewDBInstanceIdentifier";
      "CACertificateIdentifier";
      "CopyTagsToSnapshot";
      "PromotionTier";
      "EnablePerformanceInsights";
      "PerformanceInsightsKMSKeyId";
      "CertificateRotationRestart";
    ] (fun tag _ ->
      match tag with
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBInstanceClass" ->
          r_db_instance_class :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceClass"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NewDBInstanceIdentifier" ->
          r_new_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewDBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CACertificateIdentifier" ->
          r_ca_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CACertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CopyTagsToSnapshot" ->
          r_copy_tags_to_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTagsToSnapshot"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PromotionTier" ->
          r_promotion_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PromotionTier"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "EnablePerformanceInsights" ->
          r_enable_performance_insights :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnablePerformanceInsights"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PerformanceInsightsKMSKeyId" ->
          r_performance_insights_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PerformanceInsightsKMSKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CertificateRotationRestart" ->
          r_certificate_rotation_restart :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateRotationRestart"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_instance_identifier =
       Smaws_Lib.Xml.Parse.required "DBInstanceIdentifier" (( ! ) r_db_instance_identifier) i;
     db_instance_class = ( ! ) r_db_instance_class;
     apply_immediately = ( ! ) r_apply_immediately;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     new_db_instance_identifier = ( ! ) r_new_db_instance_identifier;
     ca_certificate_identifier = ( ! ) r_ca_certificate_identifier;
     copy_tags_to_snapshot = ( ! ) r_copy_tags_to_snapshot;
     promotion_tier = ( ! ) r_promotion_tier;
     enable_performance_insights = ( ! ) r_enable_performance_insights;
     performance_insights_kms_key_id = ( ! ) r_performance_insights_kms_key_id;
     certificate_rotation_restart = ( ! ) r_certificate_rotation_restart;
   }
    : modify_db_instance_message)

let shared_snapshot_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : shared_snapshot_quota_exceeded_fault)

let attribute_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AttributeValue" (fun i _ -> string__of_xml i) ()

let db_cluster_snapshot_attribute_of_xml i =
  let r_attribute_name = ref None in
  let r_attribute_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AttributeName"; "AttributeValues" ] (fun tag _ ->
      match tag with
      | "AttributeName" ->
          r_attribute_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeName" (fun i _ -> string__of_xml i) ())
      | "AttributeValues" ->
          r_attribute_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AttributeValue"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attribute_name = ( ! ) r_attribute_name; attribute_values = ( ! ) r_attribute_values }
    : db_cluster_snapshot_attribute)

let db_cluster_snapshot_attribute_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterSnapshotAttribute"
    (fun i _ -> db_cluster_snapshot_attribute_of_xml i)
    ()

let db_cluster_snapshot_attributes_result_of_xml i =
  let r_db_cluster_snapshot_identifier = ref None in
  let r_db_cluster_snapshot_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterSnapshotIdentifier"; "DBClusterSnapshotAttributes" ] (fun tag _ ->
      match tag with
      | "DBClusterSnapshotIdentifier" ->
          r_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterSnapshotAttributes" ->
          r_db_cluster_snapshot_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterSnapshotAttribute"
                     (fun i _ -> db_cluster_snapshot_attribute_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_snapshot_identifier = ( ! ) r_db_cluster_snapshot_identifier;
     db_cluster_snapshot_attributes = ( ! ) r_db_cluster_snapshot_attributes;
   }
    : db_cluster_snapshot_attributes_result)

let modify_db_cluster_snapshot_attribute_result_of_xml i =
  let r_db_cluster_snapshot_attributes_result = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterSnapshotAttributesResult" ] (fun tag _ ->
      match tag with
      | "DBClusterSnapshotAttributesResult" ->
          r_db_cluster_snapshot_attributes_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotAttributesResult"
                 (fun i _ -> db_cluster_snapshot_attributes_result_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster_snapshot_attributes_result = ( ! ) r_db_cluster_snapshot_attributes_result }
    : modify_db_cluster_snapshot_attribute_result)

let modify_db_cluster_snapshot_attribute_message_of_xml i =
  let r_db_cluster_snapshot_identifier = ref None in
  let r_attribute_name = ref None in
  let r_values_to_add = ref None in
  let r_values_to_remove = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterSnapshotIdentifier"; "AttributeName"; "ValuesToAdd"; "ValuesToRemove" ]
    (fun tag _ ->
      match tag with
      | "DBClusterSnapshotIdentifier" ->
          r_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AttributeName" ->
          r_attribute_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeName" (fun i _ -> string__of_xml i) ())
      | "ValuesToAdd" ->
          r_values_to_add :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValuesToAdd"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AttributeValue"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ValuesToRemove" ->
          r_values_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValuesToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AttributeValue"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterSnapshotIdentifier"
         (( ! ) r_db_cluster_snapshot_identifier)
         i;
     attribute_name = Smaws_Lib.Xml.Parse.required "AttributeName" (( ! ) r_attribute_name) i;
     values_to_add = ( ! ) r_values_to_add;
     values_to_remove = ( ! ) r_values_to_remove;
   }
    : modify_db_cluster_snapshot_attribute_message)

let modify_db_cluster_parameter_group_message_of_xml i =
  let r_db_cluster_parameter_group_name = ref None in
  let r_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterParameterGroupName"; "Parameters" ]
    (fun tag _ ->
      match tag with
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
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
  ({
     db_cluster_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBClusterParameterGroupName"
         (( ! ) r_db_cluster_parameter_group_name)
         i;
     parameters = Smaws_Lib.Xml.Parse.required "Parameters" (( ! ) r_parameters) i;
   }
    : modify_db_cluster_parameter_group_message)

let invalid_db_subnet_group_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_db_subnet_group_state_fault)

let db_cluster_parameter_group_not_found_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_cluster_parameter_group_not_found_fault)

let modify_db_cluster_result_of_xml i =
  let r_db_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBCluster" ] (fun tag _ ->
      match tag with
      | "DBCluster" ->
          r_db_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBCluster" (fun i _ -> db_cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster = ( ! ) r_db_cluster } : modify_db_cluster_result)

let cloudwatch_logs_export_configuration_of_xml i =
  let r_enable_log_types = ref None in
  let r_disable_log_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnableLogTypes"; "DisableLogTypes" ] (fun tag _ ->
      match tag with
      | "EnableLogTypes" ->
          r_enable_log_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableLogTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "DisableLogTypes" ->
          r_disable_log_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableLogTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ enable_log_types = ( ! ) r_enable_log_types; disable_log_types = ( ! ) r_disable_log_types }
    : cloudwatch_logs_export_configuration)

let modify_db_cluster_message_of_xml i =
  let r_db_cluster_identifier = ref None in
  let r_new_db_cluster_identifier = ref None in
  let r_apply_immediately = ref None in
  let r_backup_retention_period = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_port = ref None in
  let r_master_user_password = ref None in
  let r_preferred_backup_window = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_cloudwatch_logs_export_configuration = ref None in
  let r_engine_version = ref None in
  let r_allow_major_version_upgrade = ref None in
  let r_deletion_protection = ref None in
  let r_storage_type = ref None in
  let r_serverless_v2_scaling_configuration = ref None in
  let r_manage_master_user_password = ref None in
  let r_master_user_secret_kms_key_id = ref None in
  let r_rotate_master_user_password = ref None in
  let r_network_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBClusterIdentifier";
      "NewDBClusterIdentifier";
      "ApplyImmediately";
      "BackupRetentionPeriod";
      "DBClusterParameterGroupName";
      "VpcSecurityGroupIds";
      "Port";
      "MasterUserPassword";
      "PreferredBackupWindow";
      "PreferredMaintenanceWindow";
      "CloudwatchLogsExportConfiguration";
      "EngineVersion";
      "AllowMajorVersionUpgrade";
      "DeletionProtection";
      "StorageType";
      "ServerlessV2ScalingConfiguration";
      "ManageMasterUserPassword";
      "MasterUserSecretKmsKeyId";
      "RotateMasterUserPassword";
      "NetworkType";
    ] (fun tag _ ->
      match tag with
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NewDBClusterIdentifier" ->
          r_new_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewDBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "BackupRetentionPeriod" ->
          r_backup_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
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
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "MasterUserPassword" ->
          r_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserPassword"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredBackupWindow" ->
          r_preferred_backup_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredBackupWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CloudwatchLogsExportConfiguration" ->
          r_cloudwatch_logs_export_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CloudwatchLogsExportConfiguration"
                 (fun i _ -> cloudwatch_logs_export_configuration_of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "AllowMajorVersionUpgrade" ->
          r_allow_major_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowMajorVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "ServerlessV2ScalingConfiguration" ->
          r_serverless_v2_scaling_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessV2ScalingConfiguration"
                 (fun i _ -> serverless_v2_scaling_configuration_of_xml i)
                 ())
      | "ManageMasterUserPassword" ->
          r_manage_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManageMasterUserPassword"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MasterUserSecretKmsKeyId" ->
          r_master_user_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RotateMasterUserPassword" ->
          r_rotate_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RotateMasterUserPassword"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     new_db_cluster_identifier = ( ! ) r_new_db_cluster_identifier;
     apply_immediately = ( ! ) r_apply_immediately;
     backup_retention_period = ( ! ) r_backup_retention_period;
     db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     port = ( ! ) r_port;
     master_user_password = ( ! ) r_master_user_password;
     preferred_backup_window = ( ! ) r_preferred_backup_window;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     cloudwatch_logs_export_configuration = ( ! ) r_cloudwatch_logs_export_configuration;
     engine_version = ( ! ) r_engine_version;
     allow_major_version_upgrade = ( ! ) r_allow_major_version_upgrade;
     deletion_protection = ( ! ) r_deletion_protection;
     storage_type = ( ! ) r_storage_type;
     serverless_v2_scaling_configuration = ( ! ) r_serverless_v2_scaling_configuration;
     manage_master_user_password = ( ! ) r_manage_master_user_password;
     master_user_secret_kms_key_id = ( ! ) r_master_user_secret_kms_key_id;
     rotate_master_user_password = ( ! ) r_rotate_master_user_password;
     network_type = ( ! ) r_network_type;
   }
    : modify_db_cluster_message)

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

let filter_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Value" (fun i _ -> string__of_xml i) ()

let filter_of_xml i =
  let r_name = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Values" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Value" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     values = Smaws_Lib.Xml.Parse.required "Values" (( ! ) r_values) i;
   }
    : filter)

let filter_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ()

let list_tags_for_resource_message_of_xml i =
  let r_resource_name = ref None in
  let r_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceName"; "Filters" ] (fun tag _ ->
      match tag with
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName" (fun i _ -> string__of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_name = Smaws_Lib.Xml.Parse.required "ResourceName" (( ! ) r_resource_name) i;
     filters = ( ! ) r_filters;
   }
    : list_tags_for_resource_message)

let failover_global_cluster_result_of_xml i =
  let r_global_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalCluster" ] (fun tag _ ->
      match tag with
      | "GlobalCluster" ->
          r_global_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalCluster"
                 (fun i _ -> global_cluster_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_cluster = ( ! ) r_global_cluster } : failover_global_cluster_result)

let failover_global_cluster_message_of_xml i =
  let r_global_cluster_identifier = ref None in
  let r_target_db_cluster_identifier = ref None in
  let r_allow_data_loss = ref None in
  let r_switchover = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "GlobalClusterIdentifier"; "TargetDbClusterIdentifier"; "AllowDataLoss"; "Switchover" ]
    (fun tag _ ->
      match tag with
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "TargetDbClusterIdentifier" ->
          r_target_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDbClusterIdentifier"
                 (fun i _ -> db_cluster_identifier_of_xml i)
                 ())
      | "AllowDataLoss" ->
          r_allow_data_loss :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowDataLoss"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Switchover" ->
          r_switchover :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Switchover"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "GlobalClusterIdentifier" (( ! ) r_global_cluster_identifier) i;
     target_db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "TargetDbClusterIdentifier"
         (( ! ) r_target_db_cluster_identifier)
         i;
     allow_data_loss = ( ! ) r_allow_data_loss;
     switchover = ( ! ) r_switchover;
   }
    : failover_global_cluster_message)

let failover_db_cluster_result_of_xml i =
  let r_db_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBCluster" ] (fun tag _ ->
      match tag with
      | "DBCluster" ->
          r_db_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBCluster" (fun i _ -> db_cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster = ( ! ) r_db_cluster } : failover_db_cluster_result)

let failover_db_cluster_message_of_xml i =
  let r_db_cluster_identifier = ref None in
  let r_target_db_instance_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterIdentifier"; "TargetDBInstanceIdentifier" ] (fun tag _ ->
      match tag with
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetDBInstanceIdentifier" ->
          r_target_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     target_db_instance_identifier = ( ! ) r_target_db_instance_identifier;
   }
    : failover_db_cluster_message)

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

let pending_maintenance_action_of_xml i =
  let r_action = ref None in
  let r_auto_applied_after_date = ref None in
  let r_forced_apply_date = ref None in
  let r_opt_in_status = ref None in
  let r_current_apply_date = ref None in
  let r_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Action";
      "AutoAppliedAfterDate";
      "ForcedApplyDate";
      "OptInStatus";
      "CurrentApplyDate";
      "Description";
    ] (fun tag _ ->
      match tag with
      | "Action" ->
          r_action :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Action" (fun i _ -> string__of_xml i) ())
      | "AutoAppliedAfterDate" ->
          r_auto_applied_after_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoAppliedAfterDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ForcedApplyDate" ->
          r_forced_apply_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForcedApplyDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "OptInStatus" ->
          r_opt_in_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptInStatus" (fun i _ -> string__of_xml i) ())
      | "CurrentApplyDate" ->
          r_current_apply_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentApplyDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     action = ( ! ) r_action;
     auto_applied_after_date = ( ! ) r_auto_applied_after_date;
     forced_apply_date = ( ! ) r_forced_apply_date;
     opt_in_status = ( ! ) r_opt_in_status;
     current_apply_date = ( ! ) r_current_apply_date;
     description = ( ! ) r_description;
   }
    : pending_maintenance_action)

let pending_maintenance_action_details_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "PendingMaintenanceAction"
    (fun i _ -> pending_maintenance_action_of_xml i)
    ()

let resource_pending_maintenance_actions_of_xml i =
  let r_resource_identifier = ref None in
  let r_pending_maintenance_action_details = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceIdentifier"; "PendingMaintenanceActionDetails" ] (fun tag _ ->
      match tag with
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PendingMaintenanceActionDetails" ->
          r_pending_maintenance_action_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingMaintenanceActionDetails"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "PendingMaintenanceAction"
                     (fun i _ -> pending_maintenance_action_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_identifier = ( ! ) r_resource_identifier;
     pending_maintenance_action_details = ( ! ) r_pending_maintenance_action_details;
   }
    : resource_pending_maintenance_actions)

let pending_maintenance_actions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ResourcePendingMaintenanceActions"
    (fun i _ -> resource_pending_maintenance_actions_of_xml i)
    ()

let pending_maintenance_actions_message_of_xml i =
  let r_pending_maintenance_actions = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PendingMaintenanceActions"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "PendingMaintenanceActions" ->
          r_pending_maintenance_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingMaintenanceActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ResourcePendingMaintenanceActions"
                     (fun i _ -> resource_pending_maintenance_actions_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ pending_maintenance_actions = ( ! ) r_pending_maintenance_actions; marker = ( ! ) r_marker }
    : pending_maintenance_actions_message)

let describe_pending_maintenance_actions_message_of_xml i =
  let r_resource_identifier = ref None in
  let r_filters = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceIdentifier"; "Filters"; "Marker"; "MaxRecords" ] (fun tag _ ->
      match tag with
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_identifier = ( ! ) r_resource_identifier;
     filters = ( ! ) r_filters;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
   }
    : describe_pending_maintenance_actions_message)

let availability_zone_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone" (fun i _ -> availability_zone_of_xml i) ()

let orderable_db_instance_option_of_xml i =
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_db_instance_class = ref None in
  let r_license_model = ref None in
  let r_availability_zones = ref None in
  let r_vpc = ref None in
  let r_storage_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Engine";
      "EngineVersion";
      "DBInstanceClass";
      "LicenseModel";
      "AvailabilityZones";
      "Vpc";
      "StorageType";
    ] (fun tag _ ->
      match tag with
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "DBInstanceClass" ->
          r_db_instance_class :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceClass"
                 (fun i _ -> string__of_xml i)
                 ())
      | "LicenseModel" ->
          r_license_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LicenseModel" (fun i _ -> string__of_xml i) ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | "Vpc" ->
          r_vpc :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Vpc" (fun i _ -> boolean__of_xml i) ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     db_instance_class = ( ! ) r_db_instance_class;
     license_model = ( ! ) r_license_model;
     availability_zones = ( ! ) r_availability_zones;
     vpc = ( ! ) r_vpc;
     storage_type = ( ! ) r_storage_type;
   }
    : orderable_db_instance_option)

let orderable_db_instance_options_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "OrderableDBInstanceOption"
    (fun i _ -> orderable_db_instance_option_of_xml i)
    ()

let orderable_db_instance_options_message_of_xml i =
  let r_orderable_db_instance_options = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OrderableDBInstanceOptions"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "OrderableDBInstanceOptions" ->
          r_orderable_db_instance_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrderableDBInstanceOptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "OrderableDBInstanceOption"
                     (fun i _ -> orderable_db_instance_option_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     orderable_db_instance_options = ( ! ) r_orderable_db_instance_options;
     marker = ( ! ) r_marker;
   }
    : orderable_db_instance_options_message)

let describe_orderable_db_instance_options_message_of_xml i =
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_db_instance_class = ref None in
  let r_license_model = ref None in
  let r_vpc = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Engine";
      "EngineVersion";
      "DBInstanceClass";
      "LicenseModel";
      "Vpc";
      "Filters";
      "MaxRecords";
      "Marker";
    ] (fun tag _ ->
      match tag with
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "DBInstanceClass" ->
          r_db_instance_class :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceClass"
                 (fun i _ -> string__of_xml i)
                 ())
      | "LicenseModel" ->
          r_license_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LicenseModel" (fun i _ -> string__of_xml i) ())
      | "Vpc" ->
          r_vpc :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Vpc" (fun i _ -> boolean_optional_of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     engine = Smaws_Lib.Xml.Parse.required "Engine" (( ! ) r_engine) i;
     engine_version = ( ! ) r_engine_version;
     db_instance_class = ( ! ) r_db_instance_class;
     license_model = ( ! ) r_license_model;
     vpc = ( ! ) r_vpc;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_orderable_db_instance_options_message)

let global_cluster_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "GlobalClusterMember" (fun i _ -> global_cluster_of_xml i) ()

let global_clusters_message_of_xml i =
  let r_marker = ref None in
  let r_global_clusters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "GlobalClusters" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "GlobalClusters" ->
          r_global_clusters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "GlobalClusterMember"
                     (fun i _ -> global_cluster_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; global_clusters = ( ! ) r_global_clusters } : global_clusters_message)

let describe_global_clusters_message_of_xml i =
  let r_global_cluster_identifier = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "GlobalClusterIdentifier"; "Filters"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     global_cluster_identifier = ( ! ) r_global_cluster_identifier;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_global_clusters_message)

let event_subscriptions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "EventSubscription"
    (fun i _ -> event_subscription_of_xml i)
    ()

let event_subscriptions_message_of_xml i =
  let r_marker = ref None in
  let r_event_subscriptions_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "EventSubscriptionsList" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "EventSubscriptionsList" ->
          r_event_subscriptions_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventSubscriptionsList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventSubscription"
                     (fun i _ -> event_subscription_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; event_subscriptions_list = ( ! ) r_event_subscriptions_list }
    : event_subscriptions_message)

let describe_event_subscriptions_message_of_xml i =
  let r_subscription_name = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SubscriptionName"; "Filters"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     subscription_name = ( ! ) r_subscription_name;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_event_subscriptions_message)

let source_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "db-instance" -> Db_instance
   | "db-parameter-group" -> Db_parameter_group
   | "db-security-group" -> Db_security_group
   | "db-snapshot" -> Db_snapshot
   | "db-cluster" -> Db_cluster
   | "db-cluster-snapshot" -> Db_cluster_snapshot
   | _ -> failwith "unknown enum value"
    : source_type)

let event_of_xml i =
  let r_source_identifier = ref None in
  let r_source_type = ref None in
  let r_message = ref None in
  let r_event_categories = ref None in
  let r_date = ref None in
  let r_source_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourceIdentifier"; "SourceType"; "Message"; "EventCategories"; "Date"; "SourceArn" ]
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
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | "EventCategories" ->
          r_event_categories :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategories"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Date" ->
          r_date :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Date" (fun i _ -> t_stamp_of_xml i) ())
      | "SourceArn" ->
          r_source_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_identifier = ( ! ) r_source_identifier;
     source_type = ( ! ) r_source_type;
     message = ( ! ) r_message;
     event_categories = ( ! ) r_event_categories;
     date = ( ! ) r_date;
     source_arn = ( ! ) r_source_arn;
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
  let r_event_categories = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SourceIdentifier";
      "SourceType";
      "StartTime";
      "EndTime";
      "Duration";
      "EventCategories";
      "Filters";
      "MaxRecords";
      "Marker";
    ] (fun tag _ ->
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
      | "EventCategories" ->
          r_event_categories :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategories"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     event_categories = ( ! ) r_event_categories;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_events_message)

let event_categories_map_of_xml i =
  let r_source_type = ref None in
  let r_event_categories = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SourceType"; "EventCategories" ] (fun tag _ ->
      match tag with
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | "EventCategories" ->
          r_event_categories :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategories"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ source_type = ( ! ) r_source_type; event_categories = ( ! ) r_event_categories }
    : event_categories_map)

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
  let r_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SourceType"; "Filters" ] (fun tag _ ->
      match tag with
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ source_type = ( ! ) r_source_type; filters = ( ! ) r_filters }
    : describe_event_categories_message)

let engine_defaults_of_xml i =
  let r_db_parameter_group_family = ref None in
  let r_marker = ref None in
  let r_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBParameterGroupFamily"; "Marker"; "Parameters" ]
    (fun tag _ ->
      match tag with
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_parameter_group_family = ( ! ) r_db_parameter_group_family;
     marker = ( ! ) r_marker;
     parameters = ( ! ) r_parameters;
   }
    : engine_defaults)

let describe_engine_default_cluster_parameters_result_of_xml i =
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
  ({ engine_defaults = ( ! ) r_engine_defaults }
    : describe_engine_default_cluster_parameters_result)

let describe_engine_default_cluster_parameters_message_of_xml i =
  let r_db_parameter_group_family = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBParameterGroupFamily"; "Filters"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     db_parameter_group_family =
       Smaws_Lib.Xml.Parse.required "DBParameterGroupFamily" (( ! ) r_db_parameter_group_family) i;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_engine_default_cluster_parameters_message)

let db_subnet_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBSubnetGroup" (fun i _ -> db_subnet_group_of_xml i) ()

let db_subnet_group_message_of_xml i =
  let r_marker = ref None in
  let r_db_subnet_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "DBSubnetGroups" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "DBSubnetGroups" ->
          r_db_subnet_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBSubnetGroup"
                     (fun i _ -> db_subnet_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; db_subnet_groups = ( ! ) r_db_subnet_groups }
    : db_subnet_group_message)

let describe_db_subnet_groups_message_of_xml i =
  let r_db_subnet_group_name = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBSubnetGroupName"; "Filters"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_db_subnet_groups_message)

let db_instance_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBInstance" (fun i _ -> db_instance_of_xml i) ()

let db_instance_message_of_xml i =
  let r_marker = ref None in
  let r_db_instances = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "DBInstances" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "DBInstances" ->
          r_db_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBInstance"
                     (fun i _ -> db_instance_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; db_instances = ( ! ) r_db_instances } : db_instance_message)

let describe_db_instances_message_of_xml i =
  let r_db_instance_identifier = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBInstanceIdentifier"; "Filters"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     db_instance_identifier = ( ! ) r_db_instance_identifier;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_db_instances_message)

let serverless_v2_features_support_of_xml i =
  let r_min_capacity = ref None in
  let r_max_capacity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MinCapacity"; "MaxCapacity" ] (fun tag _ ->
      match tag with
      | "MinCapacity" ->
          r_min_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinCapacity"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "MaxCapacity" ->
          r_max_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCapacity"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ min_capacity = ( ! ) r_min_capacity; max_capacity = ( ! ) r_max_capacity }
    : serverless_v2_features_support)

let ca_certificate_identifiers_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let upgrade_target_of_xml i =
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_description = ref None in
  let r_auto_upgrade = ref None in
  let r_is_major_version_upgrade = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Engine"; "EngineVersion"; "Description"; "AutoUpgrade"; "IsMajorVersionUpgrade" ]
    (fun tag _ ->
      match tag with
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "AutoUpgrade" ->
          r_auto_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoUpgrade" (fun i _ -> boolean__of_xml i) ())
      | "IsMajorVersionUpgrade" ->
          r_is_major_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsMajorVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     description = ( ! ) r_description;
     auto_upgrade = ( ! ) r_auto_upgrade;
     is_major_version_upgrade = ( ! ) r_is_major_version_upgrade;
   }
    : upgrade_target)

let valid_upgrade_target_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "UpgradeTarget" (fun i _ -> upgrade_target_of_xml i) ()

let db_engine_version_of_xml i =
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_db_parameter_group_family = ref None in
  let r_db_engine_description = ref None in
  let r_db_engine_version_description = ref None in
  let r_valid_upgrade_target = ref None in
  let r_exportable_log_types = ref None in
  let r_supports_log_exports_to_cloudwatch_logs = ref None in
  let r_supported_ca_certificate_identifiers = ref None in
  let r_supports_certificate_rotation_without_restart = ref None in
  let r_serverless_v2_features_support = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Engine";
      "EngineVersion";
      "DBParameterGroupFamily";
      "DBEngineDescription";
      "DBEngineVersionDescription";
      "ValidUpgradeTarget";
      "ExportableLogTypes";
      "SupportsLogExportsToCloudwatchLogs";
      "SupportedCACertificateIdentifiers";
      "SupportsCertificateRotationWithoutRestart";
      "ServerlessV2FeaturesSupport";
    ] (fun tag _ ->
      match tag with
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBEngineDescription" ->
          r_db_engine_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBEngineDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBEngineVersionDescription" ->
          r_db_engine_version_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBEngineVersionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ValidUpgradeTarget" ->
          r_valid_upgrade_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidUpgradeTarget"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "UpgradeTarget"
                     (fun i _ -> upgrade_target_of_xml i)
                     ())
                 ())
      | "ExportableLogTypes" ->
          r_exportable_log_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExportableLogTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "SupportsLogExportsToCloudwatchLogs" ->
          r_supports_log_exports_to_cloudwatch_logs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsLogExportsToCloudwatchLogs"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SupportedCACertificateIdentifiers" ->
          r_supported_ca_certificate_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedCACertificateIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "SupportsCertificateRotationWithoutRestart" ->
          r_supports_certificate_rotation_without_restart :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsCertificateRotationWithoutRestart"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ServerlessV2FeaturesSupport" ->
          r_serverless_v2_features_support :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessV2FeaturesSupport"
                 (fun i _ -> serverless_v2_features_support_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     db_parameter_group_family = ( ! ) r_db_parameter_group_family;
     db_engine_description = ( ! ) r_db_engine_description;
     db_engine_version_description = ( ! ) r_db_engine_version_description;
     valid_upgrade_target = ( ! ) r_valid_upgrade_target;
     exportable_log_types = ( ! ) r_exportable_log_types;
     supports_log_exports_to_cloudwatch_logs = ( ! ) r_supports_log_exports_to_cloudwatch_logs;
     supported_ca_certificate_identifiers = ( ! ) r_supported_ca_certificate_identifiers;
     supports_certificate_rotation_without_restart =
       ( ! ) r_supports_certificate_rotation_without_restart;
     serverless_v2_features_support = ( ! ) r_serverless_v2_features_support;
   }
    : db_engine_version)

let db_engine_version_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBEngineVersion" (fun i _ -> db_engine_version_of_xml i) ()

let db_engine_version_message_of_xml i =
  let r_marker = ref None in
  let r_db_engine_versions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "DBEngineVersions" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "DBEngineVersions" ->
          r_db_engine_versions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBEngineVersions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBEngineVersion"
                     (fun i _ -> db_engine_version_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; db_engine_versions = ( ! ) r_db_engine_versions }
    : db_engine_version_message)

let describe_db_engine_versions_message_of_xml i =
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_db_parameter_group_family = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_default_only = ref None in
  let r_list_supported_character_sets = ref None in
  let r_list_supported_timezones = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Engine";
      "EngineVersion";
      "DBParameterGroupFamily";
      "Filters";
      "MaxRecords";
      "Marker";
      "DefaultOnly";
      "ListSupportedCharacterSets";
      "ListSupportedTimezones";
    ] (fun tag _ ->
      match tag with
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
      | "ListSupportedCharacterSets" ->
          r_list_supported_character_sets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListSupportedCharacterSets"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ListSupportedTimezones" ->
          r_list_supported_timezones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListSupportedTimezones"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     db_parameter_group_family = ( ! ) r_db_parameter_group_family;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     default_only = ( ! ) r_default_only;
     list_supported_character_sets = ( ! ) r_list_supported_character_sets;
     list_supported_timezones = ( ! ) r_list_supported_timezones;
   }
    : describe_db_engine_versions_message)

let db_cluster_snapshot_of_xml i =
  let r_availability_zones = ref None in
  let r_db_cluster_snapshot_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  let r_snapshot_create_time = ref None in
  let r_engine = ref None in
  let r_status = ref None in
  let r_port = ref None in
  let r_vpc_id = ref None in
  let r_cluster_create_time = ref None in
  let r_master_username = ref None in
  let r_engine_version = ref None in
  let r_snapshot_type = ref None in
  let r_percent_progress = ref None in
  let r_storage_encrypted = ref None in
  let r_kms_key_id = ref None in
  let r_db_cluster_snapshot_arn = ref None in
  let r_source_db_cluster_snapshot_arn = ref None in
  let r_storage_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AvailabilityZones";
      "DBClusterSnapshotIdentifier";
      "DBClusterIdentifier";
      "SnapshotCreateTime";
      "Engine";
      "Status";
      "Port";
      "VpcId";
      "ClusterCreateTime";
      "MasterUsername";
      "EngineVersion";
      "SnapshotType";
      "PercentProgress";
      "StorageEncrypted";
      "KmsKeyId";
      "DBClusterSnapshotArn";
      "SourceDBClusterSnapshotArn";
      "StorageType";
    ] (fun tag _ ->
      match tag with
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "DBClusterSnapshotIdentifier" ->
          r_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotCreateTime" ->
          r_snapshot_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "ClusterCreateTime" ->
          r_cluster_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "MasterUsername" ->
          r_master_username :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUsername"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "SnapshotType" ->
          r_snapshot_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotType" (fun i _ -> string__of_xml i) ())
      | "PercentProgress" ->
          r_percent_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentProgress"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "DBClusterSnapshotArn" ->
          r_db_cluster_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceDBClusterSnapshotArn" ->
          r_source_db_cluster_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDBClusterSnapshotArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     availability_zones = ( ! ) r_availability_zones;
     db_cluster_snapshot_identifier = ( ! ) r_db_cluster_snapshot_identifier;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     snapshot_create_time = ( ! ) r_snapshot_create_time;
     engine = ( ! ) r_engine;
     status = ( ! ) r_status;
     port = ( ! ) r_port;
     vpc_id = ( ! ) r_vpc_id;
     cluster_create_time = ( ! ) r_cluster_create_time;
     master_username = ( ! ) r_master_username;
     engine_version = ( ! ) r_engine_version;
     snapshot_type = ( ! ) r_snapshot_type;
     percent_progress = ( ! ) r_percent_progress;
     storage_encrypted = ( ! ) r_storage_encrypted;
     kms_key_id = ( ! ) r_kms_key_id;
     db_cluster_snapshot_arn = ( ! ) r_db_cluster_snapshot_arn;
     source_db_cluster_snapshot_arn = ( ! ) r_source_db_cluster_snapshot_arn;
     storage_type = ( ! ) r_storage_type;
   }
    : db_cluster_snapshot)

let db_cluster_snapshot_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterSnapshot"
    (fun i _ -> db_cluster_snapshot_of_xml i)
    ()

let db_cluster_snapshot_message_of_xml i =
  let r_marker = ref None in
  let r_db_cluster_snapshots = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "DBClusterSnapshots" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "DBClusterSnapshots" ->
          r_db_cluster_snapshots :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshots"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterSnapshot"
                     (fun i _ -> db_cluster_snapshot_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; db_cluster_snapshots = ( ! ) r_db_cluster_snapshots }
    : db_cluster_snapshot_message)

let describe_db_cluster_snapshots_message_of_xml i =
  let r_db_cluster_identifier = ref None in
  let r_db_cluster_snapshot_identifier = ref None in
  let r_snapshot_type = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_include_shared = ref None in
  let r_include_public = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBClusterIdentifier";
      "DBClusterSnapshotIdentifier";
      "SnapshotType";
      "Filters";
      "MaxRecords";
      "Marker";
      "IncludeShared";
      "IncludePublic";
    ] (fun tag _ ->
      match tag with
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterSnapshotIdentifier" ->
          r_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotType" ->
          r_snapshot_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotType" (fun i _ -> string__of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
      | "IncludeShared" ->
          r_include_shared :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeShared"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "IncludePublic" ->
          r_include_public :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludePublic"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     db_cluster_snapshot_identifier = ( ! ) r_db_cluster_snapshot_identifier;
     snapshot_type = ( ! ) r_snapshot_type;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     include_shared = ( ! ) r_include_shared;
     include_public = ( ! ) r_include_public;
   }
    : describe_db_cluster_snapshots_message)

let describe_db_cluster_snapshot_attributes_result_of_xml i =
  let r_db_cluster_snapshot_attributes_result = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterSnapshotAttributesResult" ] (fun tag _ ->
      match tag with
      | "DBClusterSnapshotAttributesResult" ->
          r_db_cluster_snapshot_attributes_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotAttributesResult"
                 (fun i _ -> db_cluster_snapshot_attributes_result_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster_snapshot_attributes_result = ( ! ) r_db_cluster_snapshot_attributes_result }
    : describe_db_cluster_snapshot_attributes_result)

let describe_db_cluster_snapshot_attributes_message_of_xml i =
  let r_db_cluster_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterSnapshotIdentifier" ] (fun tag _ ->
      match tag with
      | "DBClusterSnapshotIdentifier" ->
          r_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterSnapshotIdentifier"
         (( ! ) r_db_cluster_snapshot_identifier)
         i;
   }
    : describe_db_cluster_snapshot_attributes_message)

let db_cluster_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBCluster" (fun i _ -> db_cluster_of_xml i) ()

let db_cluster_message_of_xml i =
  let r_marker = ref None in
  let r_db_clusters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "DBClusters" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "DBClusters" ->
          r_db_clusters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBCluster"
                     (fun i _ -> db_cluster_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; db_clusters = ( ! ) r_db_clusters } : db_cluster_message)

let describe_db_clusters_message_of_xml i =
  let r_db_cluster_identifier = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterIdentifier"; "Filters"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_db_clusters_message)

let db_cluster_parameter_group_details_of_xml i =
  let r_parameters = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Parameters"; "Marker" ] (fun tag _ ->
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ parameters = ( ! ) r_parameters; marker = ( ! ) r_marker }
    : db_cluster_parameter_group_details)

let describe_db_cluster_parameters_message_of_xml i =
  let r_db_cluster_parameter_group_name = ref None in
  let r_source = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterParameterGroupName"; "Source"; "Filters"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> string__of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     db_cluster_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBClusterParameterGroupName"
         (( ! ) r_db_cluster_parameter_group_name)
         i;
     source = ( ! ) r_source;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_db_cluster_parameters_message)

let db_cluster_parameter_group_of_xml i =
  let r_db_cluster_parameter_group_name = ref None in
  let r_db_parameter_group_family = ref None in
  let r_description = ref None in
  let r_db_cluster_parameter_group_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBClusterParameterGroupName";
      "DBParameterGroupFamily";
      "Description";
      "DBClusterParameterGroupArn";
    ] (fun tag _ ->
      match tag with
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "DBClusterParameterGroupArn" ->
          r_db_cluster_parameter_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name;
     db_parameter_group_family = ( ! ) r_db_parameter_group_family;
     description = ( ! ) r_description;
     db_cluster_parameter_group_arn = ( ! ) r_db_cluster_parameter_group_arn;
   }
    : db_cluster_parameter_group)

let db_cluster_parameter_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterParameterGroup"
    (fun i _ -> db_cluster_parameter_group_of_xml i)
    ()

let db_cluster_parameter_groups_message_of_xml i =
  let r_marker = ref None in
  let r_db_cluster_parameter_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "DBClusterParameterGroups" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "DBClusterParameterGroups" ->
          r_db_cluster_parameter_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterParameterGroup"
                     (fun i _ -> db_cluster_parameter_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; db_cluster_parameter_groups = ( ! ) r_db_cluster_parameter_groups }
    : db_cluster_parameter_groups_message)

let describe_db_cluster_parameter_groups_message_of_xml i =
  let r_db_cluster_parameter_group_name = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterParameterGroupName"; "Filters"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_db_cluster_parameter_groups_message)

let certificate_of_xml i =
  let r_certificate_identifier = ref None in
  let r_certificate_type = ref None in
  let r_thumbprint = ref None in
  let r_valid_from = ref None in
  let r_valid_till = ref None in
  let r_certificate_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CertificateIdentifier";
      "CertificateType";
      "Thumbprint";
      "ValidFrom";
      "ValidTill";
      "CertificateArn";
    ] (fun tag _ ->
      match tag with
      | "CertificateIdentifier" ->
          r_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CertificateType" ->
          r_certificate_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Thumbprint" ->
          r_thumbprint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Thumbprint" (fun i _ -> string__of_xml i) ())
      | "ValidFrom" ->
          r_valid_from :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ValidFrom" (fun i _ -> t_stamp_of_xml i) ())
      | "ValidTill" ->
          r_valid_till :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ValidTill" (fun i _ -> t_stamp_of_xml i) ())
      | "CertificateArn" ->
          r_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     certificate_identifier = ( ! ) r_certificate_identifier;
     certificate_type = ( ! ) r_certificate_type;
     thumbprint = ( ! ) r_thumbprint;
     valid_from = ( ! ) r_valid_from;
     valid_till = ( ! ) r_valid_till;
     certificate_arn = ( ! ) r_certificate_arn;
   }
    : certificate)

let certificate_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Certificate" (fun i _ -> certificate_of_xml i) ()

let certificate_message_of_xml i =
  let r_certificates = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Certificates"; "Marker" ] (fun tag _ ->
      match tag with
      | "Certificates" ->
          r_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Certificates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Certificate"
                     (fun i _ -> certificate_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ certificates = ( ! ) r_certificates; marker = ( ! ) r_marker } : certificate_message)

let describe_certificates_message_of_xml i =
  let r_certificate_identifier = ref None in
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CertificateIdentifier"; "Filters"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "CertificateIdentifier" ->
          r_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     certificate_identifier = ( ! ) r_certificate_identifier;
     filters = ( ! ) r_filters;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_certificates_message)

let delete_global_cluster_result_of_xml i =
  let r_global_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalCluster" ] (fun tag _ ->
      match tag with
      | "GlobalCluster" ->
          r_global_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalCluster"
                 (fun i _ -> global_cluster_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_cluster = ( ! ) r_global_cluster } : delete_global_cluster_result)

let delete_global_cluster_message_of_xml i =
  let r_global_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "GlobalClusterIdentifier" (( ! ) r_global_cluster_identifier) i;
   }
    : delete_global_cluster_message)

let invalid_event_subscription_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_event_subscription_state_fault)

let delete_event_subscription_result_of_xml i =
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
  ({ event_subscription = ( ! ) r_event_subscription } : delete_event_subscription_result)

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

let invalid_db_subnet_state_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : invalid_db_subnet_state_fault)

let delete_db_subnet_group_message_of_xml i =
  let r_db_subnet_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBSubnetGroupName" ] (fun tag _ ->
      match tag with
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "DBSubnetGroupName" (( ! ) r_db_subnet_group_name) i;
   }
    : delete_db_subnet_group_message)

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

let db_snapshot_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_snapshot_already_exists_fault)

let delete_db_instance_result_of_xml i =
  let r_db_instance = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBInstance" ] (fun tag _ ->
      match tag with
      | "DBInstance" ->
          r_db_instance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstance"
                 (fun i _ -> db_instance_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_instance = ( ! ) r_db_instance } : delete_db_instance_result)

let delete_db_instance_message_of_xml i =
  let r_db_instance_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBInstanceIdentifier" ] (fun tag _ ->
      match tag with
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_instance_identifier =
       Smaws_Lib.Xml.Parse.required "DBInstanceIdentifier" (( ! ) r_db_instance_identifier) i;
   }
    : delete_db_instance_message)

let delete_db_cluster_snapshot_result_of_xml i =
  let r_db_cluster_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterSnapshot" ] (fun tag _ ->
      match tag with
      | "DBClusterSnapshot" ->
          r_db_cluster_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshot"
                 (fun i _ -> db_cluster_snapshot_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster_snapshot = ( ! ) r_db_cluster_snapshot } : delete_db_cluster_snapshot_result)

let delete_db_cluster_snapshot_message_of_xml i =
  let r_db_cluster_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterSnapshotIdentifier" ] (fun tag _ ->
      match tag with
      | "DBClusterSnapshotIdentifier" ->
          r_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterSnapshotIdentifier"
         (( ! ) r_db_cluster_snapshot_identifier)
         i;
   }
    : delete_db_cluster_snapshot_message)

let delete_db_cluster_parameter_group_message_of_xml i =
  let r_db_cluster_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterParameterGroupName" ] (fun tag _ ->
      match tag with
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBClusterParameterGroupName"
         (( ! ) r_db_cluster_parameter_group_name)
         i;
   }
    : delete_db_cluster_parameter_group_message)

let db_cluster_snapshot_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_cluster_snapshot_already_exists_fault)

let delete_db_cluster_result_of_xml i =
  let r_db_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBCluster" ] (fun tag _ ->
      match tag with
      | "DBCluster" ->
          r_db_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBCluster" (fun i _ -> db_cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster = ( ! ) r_db_cluster } : delete_db_cluster_result)

let delete_db_cluster_message_of_xml i =
  let r_db_cluster_identifier = ref None in
  let r_skip_final_snapshot = ref None in
  let r_final_db_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterIdentifier"; "SkipFinalSnapshot"; "FinalDBSnapshotIdentifier" ] (fun tag _ ->
      match tag with
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SkipFinalSnapshot" ->
          r_skip_final_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipFinalSnapshot"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "FinalDBSnapshotIdentifier" ->
          r_final_db_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalDBSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     skip_final_snapshot = ( ! ) r_skip_final_snapshot;
     final_db_snapshot_identifier = ( ! ) r_final_db_snapshot_identifier;
   }
    : delete_db_cluster_message)

let global_cluster_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : global_cluster_quota_exceeded_fault)

let global_cluster_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : global_cluster_already_exists_fault)

let create_global_cluster_result_of_xml i =
  let r_global_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalCluster" ] (fun tag _ ->
      match tag with
      | "GlobalCluster" ->
          r_global_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalCluster"
                 (fun i _ -> global_cluster_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_cluster = ( ! ) r_global_cluster } : create_global_cluster_result)

let create_global_cluster_message_of_xml i =
  let r_global_cluster_identifier = ref None in
  let r_source_db_cluster_identifier = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_deletion_protection = ref None in
  let r_database_name = ref None in
  let r_storage_encrypted = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "GlobalClusterIdentifier";
      "SourceDBClusterIdentifier";
      "Engine";
      "EngineVersion";
      "DeletionProtection";
      "DatabaseName";
      "StorageEncrypted";
    ] (fun tag _ ->
      match tag with
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "SourceDBClusterIdentifier" ->
          r_source_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName" (fun i _ -> string__of_xml i) ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     global_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "GlobalClusterIdentifier" (( ! ) r_global_cluster_identifier) i;
     source_db_cluster_identifier = ( ! ) r_source_db_cluster_identifier;
     engine = ( ! ) r_engine;
     engine_version = ( ! ) r_engine_version;
     deletion_protection = ( ! ) r_deletion_protection;
     database_name = ( ! ) r_database_name;
     storage_encrypted = ( ! ) r_storage_encrypted;
   }
    : create_global_cluster_message)

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
  let r_subscription_name = ref None in
  let r_sns_topic_arn = ref None in
  let r_source_type = ref None in
  let r_event_categories = ref None in
  let r_source_ids = ref None in
  let r_enabled = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SubscriptionName";
      "SnsTopicArn";
      "SourceType";
      "EventCategories";
      "SourceIds";
      "Enabled";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnsTopicArn" ->
          r_sns_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnsTopicArn" (fun i _ -> string__of_xml i) ())
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
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
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> boolean_optional_of_xml i)
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
     subscription_name =
       Smaws_Lib.Xml.Parse.required "SubscriptionName" (( ! ) r_subscription_name) i;
     sns_topic_arn = Smaws_Lib.Xml.Parse.required "SnsTopicArn" (( ! ) r_sns_topic_arn) i;
     source_type = ( ! ) r_source_type;
     event_categories = ( ! ) r_event_categories;
     source_ids = ( ! ) r_source_ids;
     enabled = ( ! ) r_enabled;
     tags = ( ! ) r_tags;
   }
    : create_event_subscription_message)

let db_subnet_group_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_subnet_group_quota_exceeded_fault)

let db_subnet_group_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_subnet_group_already_exists_fault)

let create_db_subnet_group_result_of_xml i =
  let r_db_subnet_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBSubnetGroup" ] (fun tag _ ->
      match tag with
      | "DBSubnetGroup" ->
          r_db_subnet_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroup"
                 (fun i _ -> db_subnet_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_subnet_group = ( ! ) r_db_subnet_group } : create_db_subnet_group_result)

let create_db_subnet_group_message_of_xml i =
  let r_db_subnet_group_name = ref None in
  let r_db_subnet_group_description = ref None in
  let r_subnet_ids = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBSubnetGroupName"; "DBSubnetGroupDescription"; "SubnetIds"; "Tags" ] (fun tag _ ->
      match tag with
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBSubnetGroupDescription" ->
          r_db_subnet_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupDescription"
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
     db_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "DBSubnetGroupName" (( ! ) r_db_subnet_group_name) i;
     db_subnet_group_description =
       Smaws_Lib.Xml.Parse.required "DBSubnetGroupDescription"
         (( ! ) r_db_subnet_group_description)
         i;
     subnet_ids = Smaws_Lib.Xml.Parse.required "SubnetIds" (( ! ) r_subnet_ids) i;
     tags = ( ! ) r_tags;
   }
    : create_db_subnet_group_message)

let instance_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : instance_quota_exceeded_fault)

let create_db_instance_result_of_xml i =
  let r_db_instance = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBInstance" ] (fun tag _ ->
      match tag with
      | "DBInstance" ->
          r_db_instance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstance"
                 (fun i _ -> db_instance_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_instance = ( ! ) r_db_instance } : create_db_instance_result)

let create_db_instance_message_of_xml i =
  let r_db_instance_identifier = ref None in
  let r_db_instance_class = ref None in
  let r_engine = ref None in
  let r_availability_zone = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_tags = ref None in
  let r_db_cluster_identifier = ref None in
  let r_copy_tags_to_snapshot = ref None in
  let r_promotion_tier = ref None in
  let r_enable_performance_insights = ref None in
  let r_performance_insights_kms_key_id = ref None in
  let r_ca_certificate_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBInstanceIdentifier";
      "DBInstanceClass";
      "Engine";
      "AvailabilityZone";
      "PreferredMaintenanceWindow";
      "AutoMinorVersionUpgrade";
      "Tags";
      "DBClusterIdentifier";
      "CopyTagsToSnapshot";
      "PromotionTier";
      "EnablePerformanceInsights";
      "PerformanceInsightsKMSKeyId";
      "CACertificateIdentifier";
    ] (fun tag _ ->
      match tag with
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBInstanceClass" ->
          r_db_instance_class :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceClass"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CopyTagsToSnapshot" ->
          r_copy_tags_to_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTagsToSnapshot"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PromotionTier" ->
          r_promotion_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PromotionTier"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "EnablePerformanceInsights" ->
          r_enable_performance_insights :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnablePerformanceInsights"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PerformanceInsightsKMSKeyId" ->
          r_performance_insights_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PerformanceInsightsKMSKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CACertificateIdentifier" ->
          r_ca_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CACertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_instance_identifier =
       Smaws_Lib.Xml.Parse.required "DBInstanceIdentifier" (( ! ) r_db_instance_identifier) i;
     db_instance_class =
       Smaws_Lib.Xml.Parse.required "DBInstanceClass" (( ! ) r_db_instance_class) i;
     engine = Smaws_Lib.Xml.Parse.required "Engine" (( ! ) r_engine) i;
     availability_zone = ( ! ) r_availability_zone;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     tags = ( ! ) r_tags;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     copy_tags_to_snapshot = ( ! ) r_copy_tags_to_snapshot;
     promotion_tier = ( ! ) r_promotion_tier;
     enable_performance_insights = ( ! ) r_enable_performance_insights;
     performance_insights_kms_key_id = ( ! ) r_performance_insights_kms_key_id;
     ca_certificate_identifier = ( ! ) r_ca_certificate_identifier;
   }
    : create_db_instance_message)

let create_db_cluster_snapshot_result_of_xml i =
  let r_db_cluster_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterSnapshot" ] (fun tag _ ->
      match tag with
      | "DBClusterSnapshot" ->
          r_db_cluster_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshot"
                 (fun i _ -> db_cluster_snapshot_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster_snapshot = ( ! ) r_db_cluster_snapshot } : create_db_cluster_snapshot_result)

let create_db_cluster_snapshot_message_of_xml i =
  let r_db_cluster_snapshot_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterSnapshotIdentifier"; "DBClusterIdentifier"; "Tags" ] (fun tag _ ->
      match tag with
      | "DBClusterSnapshotIdentifier" ->
          r_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
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
     db_cluster_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterSnapshotIdentifier"
         (( ! ) r_db_cluster_snapshot_identifier)
         i;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     tags = ( ! ) r_tags;
   }
    : create_db_cluster_snapshot_message)

let db_parameter_group_quota_exceeded_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_parameter_group_quota_exceeded_fault)

let db_parameter_group_already_exists_fault_of_xml i =
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
  ({ message = ( ! ) r_message } : db_parameter_group_already_exists_fault)

let create_db_cluster_parameter_group_result_of_xml i =
  let r_db_cluster_parameter_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterParameterGroup" ] (fun tag _ ->
      match tag with
      | "DBClusterParameterGroup" ->
          r_db_cluster_parameter_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroup"
                 (fun i _ -> db_cluster_parameter_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster_parameter_group = ( ! ) r_db_cluster_parameter_group }
    : create_db_cluster_parameter_group_result)

let create_db_cluster_parameter_group_message_of_xml i =
  let r_db_cluster_parameter_group_name = ref None in
  let r_db_parameter_group_family = ref None in
  let r_description = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterParameterGroupName"; "DBParameterGroupFamily"; "Description"; "Tags" ] (fun tag _ ->
      match tag with
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
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
     db_cluster_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBClusterParameterGroupName"
         (( ! ) r_db_cluster_parameter_group_name)
         i;
     db_parameter_group_family =
       Smaws_Lib.Xml.Parse.required "DBParameterGroupFamily" (( ! ) r_db_parameter_group_family) i;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     tags = ( ! ) r_tags;
   }
    : create_db_cluster_parameter_group_message)

let create_db_cluster_result_of_xml i =
  let r_db_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBCluster" ] (fun tag _ ->
      match tag with
      | "DBCluster" ->
          r_db_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBCluster" (fun i _ -> db_cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster = ( ! ) r_db_cluster } : create_db_cluster_result)

let create_db_cluster_message_of_xml i =
  let r_availability_zones = ref None in
  let r_backup_retention_period = ref None in
  let r_db_cluster_identifier = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_db_subnet_group_name = ref None in
  let r_engine = ref None in
  let r_engine_version = ref None in
  let r_port = ref None in
  let r_master_username = ref None in
  let r_master_user_password = ref None in
  let r_preferred_backup_window = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_tags = ref None in
  let r_storage_encrypted = ref None in
  let r_kms_key_id = ref None in
  let r_pre_signed_url = ref None in
  let r_enable_cloudwatch_logs_exports = ref None in
  let r_deletion_protection = ref None in
  let r_global_cluster_identifier = ref None in
  let r_storage_type = ref None in
  let r_serverless_v2_scaling_configuration = ref None in
  let r_manage_master_user_password = ref None in
  let r_master_user_secret_kms_key_id = ref None in
  let r_network_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AvailabilityZones";
      "BackupRetentionPeriod";
      "DBClusterIdentifier";
      "DBClusterParameterGroupName";
      "VpcSecurityGroupIds";
      "DBSubnetGroupName";
      "Engine";
      "EngineVersion";
      "Port";
      "MasterUsername";
      "MasterUserPassword";
      "PreferredBackupWindow";
      "PreferredMaintenanceWindow";
      "Tags";
      "StorageEncrypted";
      "KmsKeyId";
      "PreSignedUrl";
      "EnableCloudwatchLogsExports";
      "DeletionProtection";
      "GlobalClusterIdentifier";
      "StorageType";
      "ServerlessV2ScalingConfiguration";
      "ManageMasterUserPassword";
      "MasterUserSecretKmsKeyId";
      "NetworkType";
    ] (fun tag _ ->
      match tag with
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "BackupRetentionPeriod" ->
          r_backup_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
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
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "MasterUsername" ->
          r_master_username :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUsername"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MasterUserPassword" ->
          r_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserPassword"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredBackupWindow" ->
          r_preferred_backup_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredBackupWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "PreSignedUrl" ->
          r_pre_signed_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreSignedUrl" (fun i _ -> string__of_xml i) ())
      | "EnableCloudwatchLogsExports" ->
          r_enable_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableCloudwatchLogsExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "ServerlessV2ScalingConfiguration" ->
          r_serverless_v2_scaling_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessV2ScalingConfiguration"
                 (fun i _ -> serverless_v2_scaling_configuration_of_xml i)
                 ())
      | "ManageMasterUserPassword" ->
          r_manage_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManageMasterUserPassword"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MasterUserSecretKmsKeyId" ->
          r_master_user_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     availability_zones = ( ! ) r_availability_zones;
     backup_retention_period = ( ! ) r_backup_retention_period;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     engine = Smaws_Lib.Xml.Parse.required "Engine" (( ! ) r_engine) i;
     engine_version = ( ! ) r_engine_version;
     port = ( ! ) r_port;
     master_username = ( ! ) r_master_username;
     master_user_password = ( ! ) r_master_user_password;
     preferred_backup_window = ( ! ) r_preferred_backup_window;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     tags = ( ! ) r_tags;
     storage_encrypted = ( ! ) r_storage_encrypted;
     kms_key_id = ( ! ) r_kms_key_id;
     pre_signed_url = ( ! ) r_pre_signed_url;
     enable_cloudwatch_logs_exports = ( ! ) r_enable_cloudwatch_logs_exports;
     deletion_protection = ( ! ) r_deletion_protection;
     global_cluster_identifier = ( ! ) r_global_cluster_identifier;
     storage_type = ( ! ) r_storage_type;
     serverless_v2_scaling_configuration = ( ! ) r_serverless_v2_scaling_configuration;
     manage_master_user_password = ( ! ) r_manage_master_user_password;
     master_user_secret_kms_key_id = ( ! ) r_master_user_secret_kms_key_id;
     network_type = ( ! ) r_network_type;
   }
    : create_db_cluster_message)

let copy_db_cluster_snapshot_result_of_xml i =
  let r_db_cluster_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterSnapshot" ] (fun tag _ ->
      match tag with
      | "DBClusterSnapshot" ->
          r_db_cluster_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshot"
                 (fun i _ -> db_cluster_snapshot_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster_snapshot = ( ! ) r_db_cluster_snapshot } : copy_db_cluster_snapshot_result)

let copy_db_cluster_snapshot_message_of_xml i =
  let r_source_db_cluster_snapshot_identifier = ref None in
  let r_target_db_cluster_snapshot_identifier = ref None in
  let r_kms_key_id = ref None in
  let r_pre_signed_url = ref None in
  let r_copy_tags = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SourceDBClusterSnapshotIdentifier";
      "TargetDBClusterSnapshotIdentifier";
      "KmsKeyId";
      "PreSignedUrl";
      "CopyTags";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "SourceDBClusterSnapshotIdentifier" ->
          r_source_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetDBClusterSnapshotIdentifier" ->
          r_target_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "PreSignedUrl" ->
          r_pre_signed_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreSignedUrl" (fun i _ -> string__of_xml i) ())
      | "CopyTags" ->
          r_copy_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTags"
                 (fun i _ -> boolean_optional_of_xml i)
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
     source_db_cluster_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SourceDBClusterSnapshotIdentifier"
         (( ! ) r_source_db_cluster_snapshot_identifier)
         i;
     target_db_cluster_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "TargetDBClusterSnapshotIdentifier"
         (( ! ) r_target_db_cluster_snapshot_identifier)
         i;
     kms_key_id = ( ! ) r_kms_key_id;
     pre_signed_url = ( ! ) r_pre_signed_url;
     copy_tags = ( ! ) r_copy_tags;
     tags = ( ! ) r_tags;
   }
    : copy_db_cluster_snapshot_message)

let copy_db_cluster_parameter_group_result_of_xml i =
  let r_db_cluster_parameter_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterParameterGroup" ] (fun tag _ ->
      match tag with
      | "DBClusterParameterGroup" ->
          r_db_cluster_parameter_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroup"
                 (fun i _ -> db_cluster_parameter_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster_parameter_group = ( ! ) r_db_cluster_parameter_group }
    : copy_db_cluster_parameter_group_result)

let copy_db_cluster_parameter_group_message_of_xml i =
  let r_source_db_cluster_parameter_group_identifier = ref None in
  let r_target_db_cluster_parameter_group_identifier = ref None in
  let r_target_db_cluster_parameter_group_description = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SourceDBClusterParameterGroupIdentifier";
      "TargetDBClusterParameterGroupIdentifier";
      "TargetDBClusterParameterGroupDescription";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "SourceDBClusterParameterGroupIdentifier" ->
          r_source_db_cluster_parameter_group_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDBClusterParameterGroupIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetDBClusterParameterGroupIdentifier" ->
          r_target_db_cluster_parameter_group_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDBClusterParameterGroupIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetDBClusterParameterGroupDescription" ->
          r_target_db_cluster_parameter_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDBClusterParameterGroupDescription"
                 (fun i _ -> string__of_xml i)
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
     source_db_cluster_parameter_group_identifier =
       Smaws_Lib.Xml.Parse.required "SourceDBClusterParameterGroupIdentifier"
         (( ! ) r_source_db_cluster_parameter_group_identifier)
         i;
     target_db_cluster_parameter_group_identifier =
       Smaws_Lib.Xml.Parse.required "TargetDBClusterParameterGroupIdentifier"
         (( ! ) r_target_db_cluster_parameter_group_identifier)
         i;
     target_db_cluster_parameter_group_description =
       Smaws_Lib.Xml.Parse.required "TargetDBClusterParameterGroupDescription"
         (( ! ) r_target_db_cluster_parameter_group_description)
         i;
     tags = ( ! ) r_tags;
   }
    : copy_db_cluster_parameter_group_message)

let apply_pending_maintenance_action_result_of_xml i =
  let r_resource_pending_maintenance_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourcePendingMaintenanceActions" ] (fun tag _ ->
      match tag with
      | "ResourcePendingMaintenanceActions" ->
          r_resource_pending_maintenance_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcePendingMaintenanceActions"
                 (fun i _ -> resource_pending_maintenance_actions_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_pending_maintenance_actions = ( ! ) r_resource_pending_maintenance_actions }
    : apply_pending_maintenance_action_result)

let apply_pending_maintenance_action_message_of_xml i =
  let r_resource_identifier = ref None in
  let r_apply_action = ref None in
  let r_opt_in_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceIdentifier"; "ApplyAction"; "OptInType" ]
    (fun tag _ ->
      match tag with
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ApplyAction" ->
          r_apply_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyAction" (fun i _ -> string__of_xml i) ())
      | "OptInType" ->
          r_opt_in_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "OptInType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_identifier =
       Smaws_Lib.Xml.Parse.required "ResourceIdentifier" (( ! ) r_resource_identifier) i;
     apply_action = Smaws_Lib.Xml.Parse.required "ApplyAction" (( ! ) r_apply_action) i;
     opt_in_type = Smaws_Lib.Xml.Parse.required "OptInType" (( ! ) r_opt_in_type) i;
   }
    : apply_pending_maintenance_action_message)
