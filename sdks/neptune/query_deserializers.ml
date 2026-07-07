open Types

let unit_of_xml _ = ()
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
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupMembership"
    (fun i _ -> vpc_security_group_membership_of_xml i)
    ()

let vpc_security_group_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId" (fun i _ -> string__of_xml i) ()

let boolean__of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let boolean_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let upgrade_target_of_xml i =
  let r_supports_global_databases = ref None in
  let r_is_major_version_upgrade = ref None in
  let r_auto_upgrade = ref None in
  let r_description = ref None in
  let r_engine_version = ref None in
  let r_engine = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SupportsGlobalDatabases";
      "IsMajorVersionUpgrade";
      "AutoUpgrade";
      "Description";
      "EngineVersion";
      "Engine";
    ] (fun tag _ ->
      match tag with
      | "SupportsGlobalDatabases" ->
          r_supports_global_databases :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsGlobalDatabases"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "IsMajorVersionUpgrade" ->
          r_is_major_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsMajorVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "AutoUpgrade" ->
          r_auto_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoUpgrade" (fun i _ -> boolean__of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     supports_global_databases = ( ! ) r_supports_global_databases;
     is_major_version_upgrade = ( ! ) r_is_major_version_upgrade;
     auto_upgrade = ( ! ) r_auto_upgrade;
     description = ( ! ) r_description;
     engine_version = ( ! ) r_engine_version;
     engine = ( ! ) r_engine;
   }
    : upgrade_target)

let valid_upgrade_target_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "UpgradeTarget" (fun i _ -> upgrade_target_of_xml i) ()

let integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let integer_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let range_of_xml i =
  let r_step = ref None in
  let r_to_ = ref None in
  let r_from_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Step"; "To"; "From" ] (fun tag _ ->
      match tag with
      | "Step" ->
          r_step :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Step" (fun i _ -> integer_optional_of_xml i) ())
      | "To" ->
          r_to_ := Some (Smaws_Lib.Xml.Parse.Read.sequence i "To" (fun i _ -> integer_of_xml i) ())
      | "From" ->
          r_from_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "From" (fun i _ -> integer_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ step = ( ! ) r_step; to_ = ( ! ) r_to_; from_ = ( ! ) r_from_ } : range)

let range_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Range" (fun i _ -> range_of_xml i) ()

let double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let double_range_of_xml i =
  let r_to_ = ref None in
  let r_from_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "To"; "From" ] (fun tag _ ->
      match tag with
      | "To" ->
          r_to_ := Some (Smaws_Lib.Xml.Parse.Read.sequence i "To" (fun i _ -> double_of_xml i) ())
      | "From" ->
          r_from_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "From" (fun i _ -> double_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ to_ = ( ! ) r_to_; from_ = ( ! ) r_from_ } : double_range)

let double_range_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DoubleRange" (fun i _ -> double_range_of_xml i) ()

let valid_storage_options_of_xml i =
  let r_iops_to_storage_ratio = ref None in
  let r_provisioned_iops = ref None in
  let r_storage_size = ref None in
  let r_storage_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "IopsToStorageRatio"; "ProvisionedIops"; "StorageSize"; "StorageType" ] (fun tag _ ->
      match tag with
      | "IopsToStorageRatio" ->
          r_iops_to_storage_ratio :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IopsToStorageRatio"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DoubleRange"
                     (fun i _ -> double_range_of_xml i)
                     ())
                 ())
      | "ProvisionedIops" ->
          r_provisioned_iops :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProvisionedIops"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Range" (fun i _ -> range_of_xml i) ())
                 ())
      | "StorageSize" ->
          r_storage_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageSize"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Range" (fun i _ -> range_of_xml i) ())
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     iops_to_storage_ratio = ( ! ) r_iops_to_storage_ratio;
     provisioned_iops = ( ! ) r_provisioned_iops;
     storage_size = ( ! ) r_storage_size;
     storage_type = ( ! ) r_storage_type;
   }
    : valid_storage_options)

let valid_storage_options_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ValidStorageOptions"
    (fun i _ -> valid_storage_options_of_xml i)
    ()

let valid_db_instance_modifications_message_of_xml i =
  let r_storage = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Storage" ] (fun tag _ ->
      match tag with
      | "Storage" ->
          r_storage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Storage"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ValidStorageOptions"
                     (fun i _ -> valid_storage_options_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ storage = ( ! ) r_storage } : valid_db_instance_modifications_message)

let timezone_of_xml i =
  let r_timezone_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TimezoneName" ] (fun tag _ ->
      match tag with
      | "TimezoneName" ->
          r_timezone_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimezoneName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ timezone_name = ( ! ) r_timezone_name } : timezone)

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

let t_stamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let global_cluster_identifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let readers_arn_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let global_cluster_member_of_xml i =
  let r_is_writer = ref None in
  let r_readers = ref None in
  let r_db_cluster_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IsWriter"; "Readers"; "DBClusterArn" ]
    (fun tag _ ->
      match tag with
      | "IsWriter" ->
          r_is_writer :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IsWriter" (fun i _ -> boolean__of_xml i) ())
      | "Readers" ->
          r_readers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Readers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "DBClusterArn" ->
          r_db_cluster_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     is_writer = ( ! ) r_is_writer;
     readers = ( ! ) r_readers;
     db_cluster_arn = ( ! ) r_db_cluster_arn;
   }
    : global_cluster_member)

let global_cluster_member_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "GlobalClusterMember"
    (fun i _ -> global_cluster_member_of_xml i)
    ()

let failover_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "cancelling" -> CANCELLING
   | "failing-over" -> FAILING_OVER
   | "pending" -> PENDING
   | _ -> failwith "unknown enum value"
    : failover_status)

let failover_state_of_xml i =
  let r_is_data_loss_allowed = ref None in
  let r_to_db_cluster_arn = ref None in
  let r_from_db_cluster_arn = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "IsDataLossAllowed"; "ToDbClusterArn"; "FromDbClusterArn"; "Status" ] (fun tag _ ->
      match tag with
      | "IsDataLossAllowed" ->
          r_is_data_loss_allowed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsDataLossAllowed"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ToDbClusterArn" ->
          r_to_db_cluster_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ToDbClusterArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "FromDbClusterArn" ->
          r_from_db_cluster_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FromDbClusterArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> failover_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     is_data_loss_allowed = ( ! ) r_is_data_loss_allowed;
     to_db_cluster_arn = ( ! ) r_to_db_cluster_arn;
     from_db_cluster_arn = ( ! ) r_from_db_cluster_arn;
     status = ( ! ) r_status;
   }
    : failover_state)

let global_cluster_of_xml i =
  let r_tag_list = ref None in
  let r_failover_state = ref None in
  let r_global_cluster_members = ref None in
  let r_deletion_protection = ref None in
  let r_storage_encrypted = ref None in
  let r_database_name = ref None in
  let r_engine_version = ref None in
  let r_engine = ref None in
  let r_status = ref None in
  let r_global_cluster_arn = ref None in
  let r_global_cluster_resource_id = ref None in
  let r_global_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TagList";
      "FailoverState";
      "GlobalClusterMembers";
      "DeletionProtection";
      "StorageEncrypted";
      "DatabaseName";
      "EngineVersion";
      "Engine";
      "Status";
      "GlobalClusterArn";
      "GlobalClusterResourceId";
      "GlobalClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "TagList" ->
          r_tag_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "FailoverState" ->
          r_failover_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailoverState"
                 (fun i _ -> failover_state_of_xml i)
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
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "GlobalClusterArn" ->
          r_global_cluster_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalClusterResourceId" ->
          r_global_cluster_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterResourceId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_list = ( ! ) r_tag_list;
     failover_state = ( ! ) r_failover_state;
     global_cluster_members = ( ! ) r_global_cluster_members;
     deletion_protection = ( ! ) r_deletion_protection;
     storage_encrypted = ( ! ) r_storage_encrypted;
     database_name = ( ! ) r_database_name;
     engine_version = ( ! ) r_engine_version;
     engine = ( ! ) r_engine;
     status = ( ! ) r_status;
     global_cluster_arn = ( ! ) r_global_cluster_arn;
     global_cluster_resource_id = ( ! ) r_global_cluster_resource_id;
     global_cluster_identifier = ( ! ) r_global_cluster_identifier;
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

let switchover_global_cluster_message_of_xml i =
  let r_target_db_cluster_identifier = ref None in
  let r_global_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TargetDbClusterIdentifier"; "GlobalClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "TargetDbClusterIdentifier" ->
          r_target_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDbClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "TargetDbClusterIdentifier"
         (( ! ) r_target_db_cluster_identifier)
         i;
     global_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "GlobalClusterIdentifier" (( ! ) r_global_cluster_identifier) i;
   }
    : switchover_global_cluster_message)

let exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let supported_timezones_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Timezone" (fun i _ -> timezone_of_xml i) ()

let character_set_of_xml i =
  let r_character_set_description = ref None in
  let r_character_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CharacterSetDescription"; "CharacterSetName" ]
    (fun tag _ ->
      match tag with
      | "CharacterSetDescription" ->
          r_character_set_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CharacterSetDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CharacterSetName" ->
          r_character_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CharacterSetName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     character_set_description = ( ! ) r_character_set_description;
     character_set_name = ( ! ) r_character_set_name;
   }
    : character_set)

let supported_character_sets_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CharacterSet" (fun i _ -> character_set_of_xml i) ()

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
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name } : availability_zone)

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

let string_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

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

let availability_zones_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone" (fun i _ -> string__of_xml i) ()

let db_cluster_option_group_status_of_xml i =
  let r_status = ref None in
  let r_db_cluster_option_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "DBClusterOptionGroupName" ]
    (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "DBClusterOptionGroupName" ->
          r_db_cluster_option_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterOptionGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status; db_cluster_option_group_name = ( ! ) r_db_cluster_option_group_name }
    : db_cluster_option_group_status)

let db_cluster_option_group_memberships_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterOptionGroup"
    (fun i _ -> db_cluster_option_group_status_of_xml i)
    ()

let read_replica_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReadReplicaIdentifier" (fun i _ -> string__of_xml i) ()

let db_cluster_member_of_xml i =
  let r_promotion_tier = ref None in
  let r_db_cluster_parameter_group_status = ref None in
  let r_is_cluster_writer = ref None in
  let r_db_instance_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PromotionTier"; "DBClusterParameterGroupStatus"; "IsClusterWriter"; "DBInstanceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "PromotionTier" ->
          r_promotion_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PromotionTier"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DBClusterParameterGroupStatus" ->
          r_db_cluster_parameter_group_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IsClusterWriter" ->
          r_is_cluster_writer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsClusterWriter"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     promotion_tier = ( ! ) r_promotion_tier;
     db_cluster_parameter_group_status = ( ! ) r_db_cluster_parameter_group_status;
     is_cluster_writer = ( ! ) r_is_cluster_writer;
     db_instance_identifier = ( ! ) r_db_instance_identifier;
   }
    : db_cluster_member)

let db_cluster_member_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterMember" (fun i _ -> db_cluster_member_of_xml i) ()

let db_cluster_role_of_xml i =
  let r_feature_name = ref None in
  let r_status = ref None in
  let r_role_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FeatureName"; "Status"; "RoleArn" ] (fun tag _ ->
      match tag with
      | "FeatureName" ->
          r_feature_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FeatureName" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "RoleArn" ->
          r_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ feature_name = ( ! ) r_feature_name; status = ( ! ) r_status; role_arn = ( ! ) r_role_arn }
    : db_cluster_role)

let db_cluster_roles_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterRole" (fun i _ -> db_cluster_role_of_xml i) ()

let log_type_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let pending_cloudwatch_logs_exports_of_xml i =
  let r_log_types_to_disable = ref None in
  let r_log_types_to_enable = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LogTypesToDisable"; "LogTypesToEnable" ]
    (fun tag _ ->
      match tag with
      | "LogTypesToDisable" ->
          r_log_types_to_disable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogTypesToDisable"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "LogTypesToEnable" ->
          r_log_types_to_enable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogTypesToEnable"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     log_types_to_disable = ( ! ) r_log_types_to_disable;
     log_types_to_enable = ( ! ) r_log_types_to_enable;
   }
    : pending_cloudwatch_logs_exports)

let cluster_pending_modified_values_of_xml i =
  let r_network_type = ref None in
  let r_iops = ref None in
  let r_allocated_storage = ref None in
  let r_storage_type = ref None in
  let r_backup_retention_period = ref None in
  let r_engine_version = ref None in
  let r_iam_database_authentication_enabled = ref None in
  let r_db_cluster_identifier = ref None in
  let r_pending_cloudwatch_logs_exports = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NetworkType";
      "Iops";
      "AllocatedStorage";
      "StorageType";
      "BackupRetentionPeriod";
      "EngineVersion";
      "IAMDatabaseAuthenticationEnabled";
      "DBClusterIdentifier";
      "PendingCloudwatchLogsExports";
    ] (fun tag _ ->
      match tag with
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
      | "Iops" ->
          r_iops :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Iops" (fun i _ -> integer_optional_of_xml i) ())
      | "AllocatedStorage" ->
          r_allocated_storage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllocatedStorage"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "BackupRetentionPeriod" ->
          r_backup_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "IAMDatabaseAuthenticationEnabled" ->
          r_iam_database_authentication_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IAMDatabaseAuthenticationEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
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
     network_type = ( ! ) r_network_type;
     iops = ( ! ) r_iops;
     allocated_storage = ( ! ) r_allocated_storage;
     storage_type = ( ! ) r_storage_type;
     backup_retention_period = ( ! ) r_backup_retention_period;
     engine_version = ( ! ) r_engine_version;
     iam_database_authentication_enabled = ( ! ) r_iam_database_authentication_enabled;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     pending_cloudwatch_logs_exports = ( ! ) r_pending_cloudwatch_logs_exports;
   }
    : cluster_pending_modified_values)

let double_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let serverless_v2_scaling_configuration_info_of_xml i =
  let r_max_capacity = ref None in
  let r_min_capacity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxCapacity"; "MinCapacity" ] (fun tag _ ->
      match tag with
      | "MaxCapacity" ->
          r_max_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCapacity"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "MinCapacity" ->
          r_min_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinCapacity"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_capacity = ( ! ) r_max_capacity; min_capacity = ( ! ) r_min_capacity }
    : serverless_v2_scaling_configuration_info)

let db_cluster_of_xml i =
  let r_network_type = ref None in
  let r_storage_type = ref None in
  let r_io_optimized_next_allowed_modification_time = ref None in
  let r_global_cluster_identifier = ref None in
  let r_serverless_v2_scaling_configuration = ref None in
  let r_automatic_restart_time = ref None in
  let r_cross_account_clone = ref None in
  let r_deletion_protection = ref None in
  let r_pending_modified_values = ref None in
  let r_enabled_cloudwatch_logs_exports = ref None in
  let r_copy_tags_to_snapshot = ref None in
  let r_cluster_create_time = ref None in
  let r_clone_group_id = ref None in
  let r_iam_database_authentication_enabled = ref None in
  let r_associated_roles = ref None in
  let r_db_cluster_arn = ref None in
  let r_db_cluster_resource_id = ref None in
  let r_kms_key_id = ref None in
  let r_storage_encrypted = ref None in
  let r_hosted_zone_id = ref None in
  let r_vpc_security_groups = ref None in
  let r_db_cluster_members = ref None in
  let r_read_replica_identifiers = ref None in
  let r_replication_source_identifier = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_preferred_backup_window = ref None in
  let r_db_cluster_option_group_memberships = ref None in
  let r_master_username = ref None in
  let r_port = ref None in
  let r_latest_restorable_time = ref None in
  let r_engine_version = ref None in
  let r_engine = ref None in
  let r_multi_a_z = ref None in
  let r_reader_endpoint = ref None in
  let r_endpoint = ref None in
  let r_earliest_restorable_time = ref None in
  let r_percent_progress = ref None in
  let r_status = ref None in
  let r_db_subnet_group = ref None in
  let r_db_cluster_parameter_group = ref None in
  let r_db_cluster_identifier = ref None in
  let r_database_name = ref None in
  let r_character_set_name = ref None in
  let r_backup_retention_period = ref None in
  let r_availability_zones = ref None in
  let r_allocated_storage = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NetworkType";
      "StorageType";
      "IOOptimizedNextAllowedModificationTime";
      "GlobalClusterIdentifier";
      "ServerlessV2ScalingConfiguration";
      "AutomaticRestartTime";
      "CrossAccountClone";
      "DeletionProtection";
      "PendingModifiedValues";
      "EnabledCloudwatchLogsExports";
      "CopyTagsToSnapshot";
      "ClusterCreateTime";
      "CloneGroupId";
      "IAMDatabaseAuthenticationEnabled";
      "AssociatedRoles";
      "DBClusterArn";
      "DbClusterResourceId";
      "KmsKeyId";
      "StorageEncrypted";
      "HostedZoneId";
      "VpcSecurityGroups";
      "DBClusterMembers";
      "ReadReplicaIdentifiers";
      "ReplicationSourceIdentifier";
      "PreferredMaintenanceWindow";
      "PreferredBackupWindow";
      "DBClusterOptionGroupMemberships";
      "MasterUsername";
      "Port";
      "LatestRestorableTime";
      "EngineVersion";
      "Engine";
      "MultiAZ";
      "ReaderEndpoint";
      "Endpoint";
      "EarliestRestorableTime";
      "PercentProgress";
      "Status";
      "DBSubnetGroup";
      "DBClusterParameterGroup";
      "DBClusterIdentifier";
      "DatabaseName";
      "CharacterSetName";
      "BackupRetentionPeriod";
      "AvailabilityZones";
      "AllocatedStorage";
    ] (fun tag _ ->
      match tag with
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "IOOptimizedNextAllowedModificationTime" ->
          r_io_optimized_next_allowed_modification_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IOOptimizedNextAllowedModificationTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "ServerlessV2ScalingConfiguration" ->
          r_serverless_v2_scaling_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessV2ScalingConfiguration"
                 (fun i _ -> serverless_v2_scaling_configuration_info_of_xml i)
                 ())
      | "AutomaticRestartTime" ->
          r_automatic_restart_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomaticRestartTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "CrossAccountClone" ->
          r_cross_account_clone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CrossAccountClone"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PendingModifiedValues" ->
          r_pending_modified_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingModifiedValues"
                 (fun i _ -> cluster_pending_modified_values_of_xml i)
                 ())
      | "EnabledCloudwatchLogsExports" ->
          r_enabled_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnabledCloudwatchLogsExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "CopyTagsToSnapshot" ->
          r_copy_tags_to_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTagsToSnapshot"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ClusterCreateTime" ->
          r_cluster_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "CloneGroupId" ->
          r_clone_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CloneGroupId" (fun i _ -> string__of_xml i) ())
      | "IAMDatabaseAuthenticationEnabled" ->
          r_iam_database_authentication_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IAMDatabaseAuthenticationEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "AssociatedRoles" ->
          r_associated_roles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociatedRoles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterRole"
                     (fun i _ -> db_cluster_role_of_xml i)
                     ())
                 ())
      | "DBClusterArn" ->
          r_db_cluster_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterArn" (fun i _ -> string__of_xml i) ())
      | "DbClusterResourceId" ->
          r_db_cluster_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbClusterResourceId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "HostedZoneId" ->
          r_hosted_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HostedZoneId" (fun i _ -> string__of_xml i) ())
      | "VpcSecurityGroups" ->
          r_vpc_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupMembership"
                     (fun i _ -> vpc_security_group_membership_of_xml i)
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
      | "ReadReplicaIdentifiers" ->
          r_read_replica_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReadReplicaIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReadReplicaIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ReplicationSourceIdentifier" ->
          r_replication_source_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationSourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredBackupWindow" ->
          r_preferred_backup_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredBackupWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterOptionGroupMemberships" ->
          r_db_cluster_option_group_memberships :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterOptionGroupMemberships"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterOptionGroup"
                     (fun i _ -> db_cluster_option_group_status_of_xml i)
                     ())
                 ())
      | "MasterUsername" ->
          r_master_username :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUsername"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
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
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ" (fun i _ -> boolean__of_xml i) ())
      | "ReaderEndpoint" ->
          r_reader_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReaderEndpoint"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> string__of_xml i) ())
      | "EarliestRestorableTime" ->
          r_earliest_restorable_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EarliestRestorableTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "PercentProgress" ->
          r_percent_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentProgress"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "DBSubnetGroup" ->
          r_db_subnet_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroup" (fun i _ -> string__of_xml i) ())
      | "DBClusterParameterGroup" ->
          r_db_cluster_parameter_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroup"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName" (fun i _ -> string__of_xml i) ())
      | "CharacterSetName" ->
          r_character_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CharacterSetName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "BackupRetentionPeriod" ->
          r_backup_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "AllocatedStorage" ->
          r_allocated_storage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllocatedStorage"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     network_type = ( ! ) r_network_type;
     storage_type = ( ! ) r_storage_type;
     io_optimized_next_allowed_modification_time =
       ( ! ) r_io_optimized_next_allowed_modification_time;
     global_cluster_identifier = ( ! ) r_global_cluster_identifier;
     serverless_v2_scaling_configuration = ( ! ) r_serverless_v2_scaling_configuration;
     automatic_restart_time = ( ! ) r_automatic_restart_time;
     cross_account_clone = ( ! ) r_cross_account_clone;
     deletion_protection = ( ! ) r_deletion_protection;
     pending_modified_values = ( ! ) r_pending_modified_values;
     enabled_cloudwatch_logs_exports = ( ! ) r_enabled_cloudwatch_logs_exports;
     copy_tags_to_snapshot = ( ! ) r_copy_tags_to_snapshot;
     cluster_create_time = ( ! ) r_cluster_create_time;
     clone_group_id = ( ! ) r_clone_group_id;
     iam_database_authentication_enabled = ( ! ) r_iam_database_authentication_enabled;
     associated_roles = ( ! ) r_associated_roles;
     db_cluster_arn = ( ! ) r_db_cluster_arn;
     db_cluster_resource_id = ( ! ) r_db_cluster_resource_id;
     kms_key_id = ( ! ) r_kms_key_id;
     storage_encrypted = ( ! ) r_storage_encrypted;
     hosted_zone_id = ( ! ) r_hosted_zone_id;
     vpc_security_groups = ( ! ) r_vpc_security_groups;
     db_cluster_members = ( ! ) r_db_cluster_members;
     read_replica_identifiers = ( ! ) r_read_replica_identifiers;
     replication_source_identifier = ( ! ) r_replication_source_identifier;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     preferred_backup_window = ( ! ) r_preferred_backup_window;
     db_cluster_option_group_memberships = ( ! ) r_db_cluster_option_group_memberships;
     master_username = ( ! ) r_master_username;
     port = ( ! ) r_port;
     latest_restorable_time = ( ! ) r_latest_restorable_time;
     engine_version = ( ! ) r_engine_version;
     engine = ( ! ) r_engine;
     multi_a_z = ( ! ) r_multi_a_z;
     reader_endpoint = ( ! ) r_reader_endpoint;
     endpoint = ( ! ) r_endpoint;
     earliest_restorable_time = ( ! ) r_earliest_restorable_time;
     percent_progress = ( ! ) r_percent_progress;
     status = ( ! ) r_status;
     db_subnet_group = ( ! ) r_db_subnet_group;
     db_cluster_parameter_group = ( ! ) r_db_cluster_parameter_group;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     database_name = ( ! ) r_database_name;
     character_set_name = ( ! ) r_character_set_name;
     backup_retention_period = ( ! ) r_backup_retention_period;
     availability_zones = ( ! ) r_availability_zones;
     allocated_storage = ( ! ) r_allocated_storage;
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

let source_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "db-cluster-snapshot" -> Db_cluster_snapshot
   | "db-cluster" -> Db_cluster
   | "db-snapshot" -> Db_snapshot
   | "db-security-group" -> Db_security_group
   | "db-parameter-group" -> Db_parameter_group
   | "db-instance" -> Db_instance
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

let serverless_v2_scaling_configuration_of_xml i =
  let r_max_capacity = ref None in
  let r_min_capacity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxCapacity"; "MinCapacity" ] (fun tag _ ->
      match tag with
      | "MaxCapacity" ->
          r_max_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCapacity"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "MinCapacity" ->
          r_min_capacity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinCapacity"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_capacity = ( ! ) r_max_capacity; min_capacity = ( ! ) r_min_capacity }
    : serverless_v2_scaling_configuration)

let sensitive_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let restore_db_cluster_to_point_in_time_message_of_xml i =
  let r_network_type = ref None in
  let r_storage_type = ref None in
  let r_serverless_v2_scaling_configuration = ref None in
  let r_deletion_protection = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  let r_enable_cloudwatch_logs_exports = ref None in
  let r_enable_iam_database_authentication = ref None in
  let r_kms_key_id = ref None in
  let r_tags = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_option_group_name = ref None in
  let r_db_subnet_group_name = ref None in
  let r_port = ref None in
  let r_use_latest_restorable_time = ref None in
  let r_restore_to_time = ref None in
  let r_source_db_cluster_identifier = ref None in
  let r_restore_type = ref None in
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NetworkType";
      "StorageType";
      "ServerlessV2ScalingConfiguration";
      "DeletionProtection";
      "DBClusterParameterGroupName";
      "EnableCloudwatchLogsExports";
      "EnableIAMDatabaseAuthentication";
      "KmsKeyId";
      "Tags";
      "VpcSecurityGroupIds";
      "OptionGroupName";
      "DBSubnetGroupName";
      "Port";
      "UseLatestRestorableTime";
      "RestoreToTime";
      "SourceDBClusterIdentifier";
      "RestoreType";
      "DBClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
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
      | "EnableCloudwatchLogsExports" ->
          r_enable_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableCloudwatchLogsExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "EnableIAMDatabaseAuthentication" ->
          r_enable_iam_database_authentication :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableIAMDatabaseAuthentication"
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
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "OptionGroupName" ->
          r_option_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "UseLatestRestorableTime" ->
          r_use_latest_restorable_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UseLatestRestorableTime"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "RestoreToTime" ->
          r_restore_to_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RestoreToTime" (fun i _ -> t_stamp_of_xml i) ())
      | "SourceDBClusterIdentifier" ->
          r_source_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RestoreType" ->
          r_restore_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RestoreType" (fun i _ -> string__of_xml i) ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     network_type = ( ! ) r_network_type;
     storage_type = ( ! ) r_storage_type;
     serverless_v2_scaling_configuration = ( ! ) r_serverless_v2_scaling_configuration;
     deletion_protection = ( ! ) r_deletion_protection;
     db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name;
     enable_cloudwatch_logs_exports = ( ! ) r_enable_cloudwatch_logs_exports;
     enable_iam_database_authentication = ( ! ) r_enable_iam_database_authentication;
     kms_key_id = ( ! ) r_kms_key_id;
     tags = ( ! ) r_tags;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     option_group_name = ( ! ) r_option_group_name;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     port = ( ! ) r_port;
     use_latest_restorable_time = ( ! ) r_use_latest_restorable_time;
     restore_to_time = ( ! ) r_restore_to_time;
     source_db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "SourceDBClusterIdentifier"
         (( ! ) r_source_db_cluster_identifier)
         i;
     restore_type = ( ! ) r_restore_type;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
   }
    : restore_db_cluster_to_point_in_time_message)

let option_group_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : option_group_not_found_fault)

let network_type_not_supported_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : network_type_not_supported_fault)

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
  let r_network_type = ref None in
  let r_storage_type = ref None in
  let r_serverless_v2_scaling_configuration = ref None in
  let r_copy_tags_to_snapshot = ref None in
  let r_deletion_protection = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  let r_enable_cloudwatch_logs_exports = ref None in
  let r_enable_iam_database_authentication = ref None in
  let r_kms_key_id = ref None in
  let r_tags = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_option_group_name = ref None in
  let r_database_name = ref None in
  let r_db_subnet_group_name = ref None in
  let r_port = ref None in
  let r_engine_version = ref None in
  let r_engine = ref None in
  let r_snapshot_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  let r_availability_zones = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NetworkType";
      "StorageType";
      "ServerlessV2ScalingConfiguration";
      "CopyTagsToSnapshot";
      "DeletionProtection";
      "DBClusterParameterGroupName";
      "EnableCloudwatchLogsExports";
      "EnableIAMDatabaseAuthentication";
      "KmsKeyId";
      "Tags";
      "VpcSecurityGroupIds";
      "OptionGroupName";
      "DatabaseName";
      "DBSubnetGroupName";
      "Port";
      "EngineVersion";
      "Engine";
      "SnapshotIdentifier";
      "DBClusterIdentifier";
      "AvailabilityZones";
    ] (fun tag _ ->
      match tag with
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
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
      | "CopyTagsToSnapshot" ->
          r_copy_tags_to_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTagsToSnapshot"
                 (fun i _ -> boolean_optional_of_xml i)
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
      | "EnableCloudwatchLogsExports" ->
          r_enable_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableCloudwatchLogsExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "EnableIAMDatabaseAuthentication" ->
          r_enable_iam_database_authentication :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableIAMDatabaseAuthentication"
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
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "OptionGroupName" ->
          r_option_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName" (fun i _ -> string__of_xml i) ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     network_type = ( ! ) r_network_type;
     storage_type = ( ! ) r_storage_type;
     serverless_v2_scaling_configuration = ( ! ) r_serverless_v2_scaling_configuration;
     copy_tags_to_snapshot = ( ! ) r_copy_tags_to_snapshot;
     deletion_protection = ( ! ) r_deletion_protection;
     db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name;
     enable_cloudwatch_logs_exports = ( ! ) r_enable_cloudwatch_logs_exports;
     enable_iam_database_authentication = ( ! ) r_enable_iam_database_authentication;
     kms_key_id = ( ! ) r_kms_key_id;
     tags = ( ! ) r_tags;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     option_group_name = ( ! ) r_option_group_name;
     database_name = ( ! ) r_database_name;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     port = ( ! ) r_port;
     engine_version = ( ! ) r_engine_version;
     engine = Smaws_Lib.Xml.Parse.required "Engine" (( ! ) r_engine) i;
     snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifier" (( ! ) r_snapshot_identifier) i;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     availability_zones = ( ! ) r_availability_zones;
   }
    : restore_db_cluster_from_snapshot_message)

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

let pending_maintenance_action_of_xml i =
  let r_description = ref None in
  let r_current_apply_date = ref None in
  let r_opt_in_status = ref None in
  let r_forced_apply_date = ref None in
  let r_auto_applied_after_date = ref None in
  let r_action = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Description";
      "CurrentApplyDate";
      "OptInStatus";
      "ForcedApplyDate";
      "AutoAppliedAfterDate";
      "Action";
    ] (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "CurrentApplyDate" ->
          r_current_apply_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentApplyDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "OptInStatus" ->
          r_opt_in_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptInStatus" (fun i _ -> string__of_xml i) ())
      | "ForcedApplyDate" ->
          r_forced_apply_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForcedApplyDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "AutoAppliedAfterDate" ->
          r_auto_applied_after_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoAppliedAfterDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Action" ->
          r_action :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Action" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     description = ( ! ) r_description;
     current_apply_date = ( ! ) r_current_apply_date;
     opt_in_status = ( ! ) r_opt_in_status;
     forced_apply_date = ( ! ) r_forced_apply_date;
     auto_applied_after_date = ( ! ) r_auto_applied_after_date;
     action = ( ! ) r_action;
   }
    : pending_maintenance_action)

let pending_maintenance_action_details_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "PendingMaintenanceAction"
    (fun i _ -> pending_maintenance_action_of_xml i)
    ()

let resource_pending_maintenance_actions_of_xml i =
  let r_pending_maintenance_action_details = ref None in
  let r_resource_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PendingMaintenanceActionDetails"; "ResourceIdentifier" ] (fun tag _ ->
      match tag with
      | "PendingMaintenanceActionDetails" ->
          r_pending_maintenance_action_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingMaintenanceActionDetails"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "PendingMaintenanceAction"
                     (fun i _ -> pending_maintenance_action_of_xml i)
                     ())
                 ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     pending_maintenance_action_details = ( ! ) r_pending_maintenance_action_details;
     resource_identifier = ( ! ) r_resource_identifier;
   }
    : resource_pending_maintenance_actions)

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

let apply_method_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "pending-reboot" -> Pending_reboot
   | "immediate" -> Immediate
   | _ -> failwith "unknown enum value"
    : apply_method)

let parameter_of_xml i =
  let r_apply_method = ref None in
  let r_minimum_engine_version = ref None in
  let r_is_modifiable = ref None in
  let r_allowed_values = ref None in
  let r_data_type = ref None in
  let r_apply_type = ref None in
  let r_source = ref None in
  let r_description = ref None in
  let r_parameter_value = ref None in
  let r_parameter_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ApplyMethod";
      "MinimumEngineVersion";
      "IsModifiable";
      "AllowedValues";
      "DataType";
      "ApplyType";
      "Source";
      "Description";
      "ParameterValue";
      "ParameterName";
    ] (fun tag _ ->
      match tag with
      | "ApplyMethod" ->
          r_apply_method :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyMethod"
                 (fun i _ -> apply_method_of_xml i)
                 ())
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
      | "AllowedValues" ->
          r_allowed_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedValues" (fun i _ -> string__of_xml i) ())
      | "DataType" ->
          r_data_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DataType" (fun i _ -> string__of_xml i) ())
      | "ApplyType" ->
          r_apply_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyType" (fun i _ -> string__of_xml i) ())
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
     apply_method = ( ! ) r_apply_method;
     minimum_engine_version = ( ! ) r_minimum_engine_version;
     is_modifiable = ( ! ) r_is_modifiable;
     allowed_values = ( ! ) r_allowed_values;
     data_type = ( ! ) r_data_type;
     apply_type = ( ! ) r_apply_type;
     source = ( ! ) r_source;
     description = ( ! ) r_description;
     parameter_value = ( ! ) r_parameter_value;
     parameter_name = ( ! ) r_parameter_name;
   }
    : parameter)

let parameters_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Parameter" (fun i _ -> parameter_of_xml i) ()

let reset_db_parameter_group_message_of_xml i =
  let r_parameters = ref None in
  let r_reset_all_parameters = ref None in
  let r_db_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Parameters"; "ResetAllParameters"; "DBParameterGroupName" ] (fun tag _ ->
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
      | "DBParameterGroupName" ->
          r_db_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameters = ( ! ) r_parameters;
     reset_all_parameters = ( ! ) r_reset_all_parameters;
     db_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBParameterGroupName" (( ! ) r_db_parameter_group_name) i;
   }
    : reset_db_parameter_group_message)

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

let db_parameter_group_name_message_of_xml i =
  let r_db_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBParameterGroupName" ] (fun tag _ ->
      match tag with
      | "DBParameterGroupName" ->
          r_db_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_parameter_group_name = ( ! ) r_db_parameter_group_name } : db_parameter_group_name_message)

let reset_db_cluster_parameter_group_message_of_xml i =
  let r_parameters = ref None in
  let r_reset_all_parameters = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Parameters"; "ResetAllParameters"; "DBClusterParameterGroupName" ] (fun tag _ ->
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
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameters = ( ! ) r_parameters;
     reset_all_parameters = ( ! ) r_reset_all_parameters;
     db_cluster_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBClusterParameterGroupName"
         (( ! ) r_db_cluster_parameter_group_name)
         i;
   }
    : reset_db_cluster_parameter_group_message)

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

let key_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let remove_tags_from_resource_message_of_xml i =
  let r_tag_keys = ref None in
  let r_resource_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TagKeys"; "ResourceName" ] (fun tag _ ->
      match tag with
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
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
    : remove_tags_from_resource_message)

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

let event_categories_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory" (fun i _ -> string__of_xml i) ()

let event_subscription_of_xml i =
  let r_event_subscription_arn = ref None in
  let r_enabled = ref None in
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
      "EventSubscriptionArn";
      "Enabled";
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
      | "EventSubscriptionArn" ->
          r_event_subscription_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventSubscriptionArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> boolean__of_xml i) ())
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
                 (fun i _ -> string__of_xml i)
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
     event_subscription_arn = ( ! ) r_event_subscription_arn;
     enabled = ( ! ) r_enabled;
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
  let r_source_identifier = ref None in
  let r_subscription_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SourceIdentifier"; "SubscriptionName" ]
    (fun tag _ ->
      match tag with
      | "SourceIdentifier" ->
          r_source_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_identifier =
       Smaws_Lib.Xml.Parse.required "SourceIdentifier" (( ! ) r_source_identifier) i;
     subscription_name =
       Smaws_Lib.Xml.Parse.required "SubscriptionName" (( ! ) r_subscription_name) i;
   }
    : remove_source_identifier_from_subscription_message)

let remove_role_from_db_cluster_message_of_xml i =
  let r_feature_name = ref None in
  let r_role_arn = ref None in
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FeatureName"; "RoleArn"; "DBClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "FeatureName" ->
          r_feature_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FeatureName" (fun i _ -> string__of_xml i) ())
      | "RoleArn" ->
          r_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn" (fun i _ -> string__of_xml i) ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     feature_name = ( ! ) r_feature_name;
     role_arn = Smaws_Lib.Xml.Parse.required "RoleArn" (( ! ) r_role_arn) i;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
   }
    : remove_role_from_db_cluster_message)

let db_cluster_role_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : db_cluster_role_not_found_fault)

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
  let r_db_cluster_identifier = ref None in
  let r_global_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DbClusterIdentifier"; "GlobalClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "DbClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DbClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     global_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "GlobalClusterIdentifier" (( ! ) r_global_cluster_identifier) i;
   }
    : remove_from_global_cluster_message)

let endpoint_of_xml i =
  let r_hosted_zone_id = ref None in
  let r_port = ref None in
  let r_address = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HostedZoneId"; "Port"; "Address" ] (fun tag _ ->
      match tag with
      | "HostedZoneId" ->
          r_hosted_zone_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HostedZoneId" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | "Address" ->
          r_address :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Address" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ hosted_zone_id = ( ! ) r_hosted_zone_id; port = ( ! ) r_port; address = ( ! ) r_address }
    : endpoint)

let db_security_group_membership_of_xml i =
  let r_status = ref None in
  let r_db_security_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "DBSecurityGroupName" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "DBSecurityGroupName" ->
          r_db_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status; db_security_group_name = ( ! ) r_db_security_group_name }
    : db_security_group_membership)

let db_security_group_membership_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBSecurityGroup"
    (fun i _ -> db_security_group_membership_of_xml i)
    ()

let db_parameter_group_status_of_xml i =
  let r_parameter_apply_status = ref None in
  let r_db_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ParameterApplyStatus"; "DBParameterGroupName" ]
    (fun tag _ ->
      match tag with
      | "ParameterApplyStatus" ->
          r_parameter_apply_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterApplyStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBParameterGroupName" ->
          r_db_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_apply_status = ( ! ) r_parameter_apply_status;
     db_parameter_group_name = ( ! ) r_db_parameter_group_name;
   }
    : db_parameter_group_status)

let db_parameter_group_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBParameterGroup"
    (fun i _ -> db_parameter_group_status_of_xml i)
    ()

let db_subnet_group_of_xml i =
  let r_supported_network_types = ref None in
  let r_db_subnet_group_arn = ref None in
  let r_subnets = ref None in
  let r_subnet_group_status = ref None in
  let r_vpc_id = ref None in
  let r_db_subnet_group_description = ref None in
  let r_db_subnet_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SupportedNetworkTypes";
      "DBSubnetGroupArn";
      "Subnets";
      "SubnetGroupStatus";
      "VpcId";
      "DBSubnetGroupDescription";
      "DBSubnetGroupName";
    ] (fun tag _ ->
      match tag with
      | "SupportedNetworkTypes" ->
          r_supported_network_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedNetworkTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "DBSubnetGroupArn" ->
          r_db_subnet_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupArn"
                 (fun i _ -> string__of_xml i)
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
      | "DBSubnetGroupDescription" ->
          r_db_subnet_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     supported_network_types = ( ! ) r_supported_network_types;
     db_subnet_group_arn = ( ! ) r_db_subnet_group_arn;
     subnets = ( ! ) r_subnets;
     subnet_group_status = ( ! ) r_subnet_group_status;
     vpc_id = ( ! ) r_vpc_id;
     db_subnet_group_description = ( ! ) r_db_subnet_group_description;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
   }
    : db_subnet_group)

let pending_modified_values_of_xml i =
  let r_pending_cloudwatch_logs_exports = ref None in
  let r_db_subnet_group_name = ref None in
  let r_ca_certificate_identifier = ref None in
  let r_storage_type = ref None in
  let r_db_instance_identifier = ref None in
  let r_iops = ref None in
  let r_license_model = ref None in
  let r_engine_version = ref None in
  let r_multi_a_z = ref None in
  let r_backup_retention_period = ref None in
  let r_port = ref None in
  let r_master_user_password = ref None in
  let r_allocated_storage = ref None in
  let r_db_instance_class = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PendingCloudwatchLogsExports";
      "DBSubnetGroupName";
      "CACertificateIdentifier";
      "StorageType";
      "DBInstanceIdentifier";
      "Iops";
      "LicenseModel";
      "EngineVersion";
      "MultiAZ";
      "BackupRetentionPeriod";
      "Port";
      "MasterUserPassword";
      "AllocatedStorage";
      "DBInstanceClass";
    ] (fun tag _ ->
      match tag with
      | "PendingCloudwatchLogsExports" ->
          r_pending_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingCloudwatchLogsExports"
                 (fun i _ -> pending_cloudwatch_logs_exports_of_xml i)
                 ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CACertificateIdentifier" ->
          r_ca_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CACertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Iops" ->
          r_iops :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Iops" (fun i _ -> integer_optional_of_xml i) ())
      | "LicenseModel" ->
          r_license_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LicenseModel" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "BackupRetentionPeriod" ->
          r_backup_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
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
      | "AllocatedStorage" ->
          r_allocated_storage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllocatedStorage"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DBInstanceClass" ->
          r_db_instance_class :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceClass"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     pending_cloudwatch_logs_exports = ( ! ) r_pending_cloudwatch_logs_exports;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     ca_certificate_identifier = ( ! ) r_ca_certificate_identifier;
     storage_type = ( ! ) r_storage_type;
     db_instance_identifier = ( ! ) r_db_instance_identifier;
     iops = ( ! ) r_iops;
     license_model = ( ! ) r_license_model;
     engine_version = ( ! ) r_engine_version;
     multi_a_z = ( ! ) r_multi_a_z;
     backup_retention_period = ( ! ) r_backup_retention_period;
     port = ( ! ) r_port;
     master_user_password = ( ! ) r_master_user_password;
     allocated_storage = ( ! ) r_allocated_storage;
     db_instance_class = ( ! ) r_db_instance_class;
   }
    : pending_modified_values)

let read_replica_db_instance_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReadReplicaDBInstanceIdentifier"
    (fun i _ -> string__of_xml i)
    ()

let read_replica_db_cluster_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReadReplicaDBClusterIdentifier"
    (fun i _ -> string__of_xml i)
    ()

let option_group_membership_of_xml i =
  let r_status = ref None in
  let r_option_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "OptionGroupName" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "OptionGroupName" ->
          r_option_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status; option_group_name = ( ! ) r_option_group_name }
    : option_group_membership)

let option_group_membership_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "OptionGroupMembership"
    (fun i _ -> option_group_membership_of_xml i)
    ()

let db_instance_status_info_of_xml i =
  let r_message = ref None in
  let r_status = ref None in
  let r_normal = ref None in
  let r_status_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "Status"; "Normal"; "StatusType" ]
    (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Normal" ->
          r_normal :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Normal" (fun i _ -> boolean__of_xml i) ())
      | "StatusType" ->
          r_status_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StatusType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     status = ( ! ) r_status;
     normal = ( ! ) r_normal;
     status_type = ( ! ) r_status_type;
   }
    : db_instance_status_info)

let db_instance_status_info_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBInstanceStatusInfo"
    (fun i _ -> db_instance_status_info_of_xml i)
    ()

let domain_membership_of_xml i =
  let r_iam_role_name = ref None in
  let r_fqd_n = ref None in
  let r_status = ref None in
  let r_domain = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IAMRoleName"; "FQDN"; "Status"; "Domain" ]
    (fun tag _ ->
      match tag with
      | "IAMRoleName" ->
          r_iam_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IAMRoleName" (fun i _ -> string__of_xml i) ())
      | "FQDN" ->
          r_fqd_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "FQDN" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Domain" ->
          r_domain :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Domain" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     iam_role_name = ( ! ) r_iam_role_name;
     fqd_n = ( ! ) r_fqd_n;
     status = ( ! ) r_status;
     domain = ( ! ) r_domain;
   }
    : domain_membership)

let domain_membership_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DomainMembership" (fun i _ -> domain_membership_of_xml i) ()

let db_instance_of_xml i =
  let r_network_type = ref None in
  let r_deletion_protection = ref None in
  let r_enabled_cloudwatch_logs_exports = ref None in
  let r_performance_insights_kms_key_id = ref None in
  let r_performance_insights_enabled = ref None in
  let r_iam_database_authentication_enabled = ref None in
  let r_timezone = ref None in
  let r_db_instance_arn = ref None in
  let r_promotion_tier = ref None in
  let r_monitoring_role_arn = ref None in
  let r_enhanced_monitoring_resource_arn = ref None in
  let r_monitoring_interval = ref None in
  let r_copy_tags_to_snapshot = ref None in
  let r_domain_memberships = ref None in
  let r_ca_certificate_identifier = ref None in
  let r_dbi_resource_id = ref None in
  let r_kms_key_id = ref None in
  let r_storage_encrypted = ref None in
  let r_db_cluster_identifier = ref None in
  let r_db_instance_port = ref None in
  let r_tde_credential_arn = ref None in
  let r_storage_type = ref None in
  let r_status_infos = ref None in
  let r_publicly_accessible = ref None in
  let r_secondary_availability_zone = ref None in
  let r_character_set_name = ref None in
  let r_option_group_memberships = ref None in
  let r_iops = ref None in
  let r_license_model = ref None in
  let r_read_replica_db_cluster_identifiers = ref None in
  let r_read_replica_db_instance_identifiers = ref None in
  let r_read_replica_source_db_instance_identifier = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_engine_version = ref None in
  let r_multi_a_z = ref None in
  let r_latest_restorable_time = ref None in
  let r_pending_modified_values = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_db_subnet_group = ref None in
  let r_availability_zone = ref None in
  let r_db_parameter_groups = ref None in
  let r_vpc_security_groups = ref None in
  let r_db_security_groups = ref None in
  let r_backup_retention_period = ref None in
  let r_preferred_backup_window = ref None in
  let r_instance_create_time = ref None in
  let r_allocated_storage = ref None in
  let r_endpoint = ref None in
  let r_db_name = ref None in
  let r_master_username = ref None in
  let r_db_instance_status = ref None in
  let r_engine = ref None in
  let r_db_instance_class = ref None in
  let r_db_instance_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NetworkType";
      "DeletionProtection";
      "EnabledCloudwatchLogsExports";
      "PerformanceInsightsKMSKeyId";
      "PerformanceInsightsEnabled";
      "IAMDatabaseAuthenticationEnabled";
      "Timezone";
      "DBInstanceArn";
      "PromotionTier";
      "MonitoringRoleArn";
      "EnhancedMonitoringResourceArn";
      "MonitoringInterval";
      "CopyTagsToSnapshot";
      "DomainMemberships";
      "CACertificateIdentifier";
      "DbiResourceId";
      "KmsKeyId";
      "StorageEncrypted";
      "DBClusterIdentifier";
      "DbInstancePort";
      "TdeCredentialArn";
      "StorageType";
      "StatusInfos";
      "PubliclyAccessible";
      "SecondaryAvailabilityZone";
      "CharacterSetName";
      "OptionGroupMemberships";
      "Iops";
      "LicenseModel";
      "ReadReplicaDBClusterIdentifiers";
      "ReadReplicaDBInstanceIdentifiers";
      "ReadReplicaSourceDBInstanceIdentifier";
      "AutoMinorVersionUpgrade";
      "EngineVersion";
      "MultiAZ";
      "LatestRestorableTime";
      "PendingModifiedValues";
      "PreferredMaintenanceWindow";
      "DBSubnetGroup";
      "AvailabilityZone";
      "DBParameterGroups";
      "VpcSecurityGroups";
      "DBSecurityGroups";
      "BackupRetentionPeriod";
      "PreferredBackupWindow";
      "InstanceCreateTime";
      "AllocatedStorage";
      "Endpoint";
      "DBName";
      "MasterUsername";
      "DBInstanceStatus";
      "Engine";
      "DBInstanceClass";
      "DBInstanceIdentifier";
    ] (fun tag _ ->
      match tag with
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EnabledCloudwatchLogsExports" ->
          r_enabled_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnabledCloudwatchLogsExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "PerformanceInsightsKMSKeyId" ->
          r_performance_insights_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PerformanceInsightsKMSKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PerformanceInsightsEnabled" ->
          r_performance_insights_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PerformanceInsightsEnabled"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "IAMDatabaseAuthenticationEnabled" ->
          r_iam_database_authentication_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IAMDatabaseAuthenticationEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "Timezone" ->
          r_timezone :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Timezone" (fun i _ -> string__of_xml i) ())
      | "DBInstanceArn" ->
          r_db_instance_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceArn" (fun i _ -> string__of_xml i) ())
      | "PromotionTier" ->
          r_promotion_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PromotionTier"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "MonitoringRoleArn" ->
          r_monitoring_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MonitoringRoleArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EnhancedMonitoringResourceArn" ->
          r_enhanced_monitoring_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedMonitoringResourceArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MonitoringInterval" ->
          r_monitoring_interval :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MonitoringInterval"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "CopyTagsToSnapshot" ->
          r_copy_tags_to_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTagsToSnapshot"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "DomainMemberships" ->
          r_domain_memberships :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainMemberships"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DomainMembership"
                     (fun i _ -> domain_membership_of_xml i)
                     ())
                 ())
      | "CACertificateIdentifier" ->
          r_ca_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CACertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DbiResourceId" ->
          r_dbi_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbiResourceId" (fun i _ -> string__of_xml i) ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DbInstancePort" ->
          r_db_instance_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbInstancePort"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "TdeCredentialArn" ->
          r_tde_credential_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TdeCredentialArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "StatusInfos" ->
          r_status_infos :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusInfos"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBInstanceStatusInfo"
                     (fun i _ -> db_instance_status_info_of_xml i)
                     ())
                 ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SecondaryAvailabilityZone" ->
          r_secondary_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecondaryAvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CharacterSetName" ->
          r_character_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CharacterSetName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "OptionGroupMemberships" ->
          r_option_group_memberships :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionGroupMemberships"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "OptionGroupMembership"
                     (fun i _ -> option_group_membership_of_xml i)
                     ())
                 ())
      | "Iops" ->
          r_iops :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Iops" (fun i _ -> integer_optional_of_xml i) ())
      | "LicenseModel" ->
          r_license_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LicenseModel" (fun i _ -> string__of_xml i) ())
      | "ReadReplicaDBClusterIdentifiers" ->
          r_read_replica_db_cluster_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReadReplicaDBClusterIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReadReplicaDBClusterIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ReadReplicaDBInstanceIdentifiers" ->
          r_read_replica_db_instance_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReadReplicaDBInstanceIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReadReplicaDBInstanceIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ReadReplicaSourceDBInstanceIdentifier" ->
          r_read_replica_source_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReadReplicaSourceDBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ" (fun i _ -> boolean__of_xml i) ())
      | "LatestRestorableTime" ->
          r_latest_restorable_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LatestRestorableTime"
                 (fun i _ -> t_stamp_of_xml i)
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
      | "DBSubnetGroup" ->
          r_db_subnet_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroup"
                 (fun i _ -> db_subnet_group_of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBParameterGroups" ->
          r_db_parameter_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBParameterGroup"
                     (fun i _ -> db_parameter_group_status_of_xml i)
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
      | "DBSecurityGroups" ->
          r_db_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBSecurityGroup"
                     (fun i _ -> db_security_group_membership_of_xml i)
                     ())
                 ())
      | "BackupRetentionPeriod" ->
          r_backup_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupRetentionPeriod"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "PreferredBackupWindow" ->
          r_preferred_backup_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredBackupWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "InstanceCreateTime" ->
          r_instance_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "AllocatedStorage" ->
          r_allocated_storage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllocatedStorage"
                 (fun i _ -> integer_of_xml i)
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
      | "DBInstanceStatus" ->
          r_db_instance_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "DBInstanceClass" ->
          r_db_instance_class :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceClass"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     network_type = ( ! ) r_network_type;
     deletion_protection = ( ! ) r_deletion_protection;
     enabled_cloudwatch_logs_exports = ( ! ) r_enabled_cloudwatch_logs_exports;
     performance_insights_kms_key_id = ( ! ) r_performance_insights_kms_key_id;
     performance_insights_enabled = ( ! ) r_performance_insights_enabled;
     iam_database_authentication_enabled = ( ! ) r_iam_database_authentication_enabled;
     timezone = ( ! ) r_timezone;
     db_instance_arn = ( ! ) r_db_instance_arn;
     promotion_tier = ( ! ) r_promotion_tier;
     monitoring_role_arn = ( ! ) r_monitoring_role_arn;
     enhanced_monitoring_resource_arn = ( ! ) r_enhanced_monitoring_resource_arn;
     monitoring_interval = ( ! ) r_monitoring_interval;
     copy_tags_to_snapshot = ( ! ) r_copy_tags_to_snapshot;
     domain_memberships = ( ! ) r_domain_memberships;
     ca_certificate_identifier = ( ! ) r_ca_certificate_identifier;
     dbi_resource_id = ( ! ) r_dbi_resource_id;
     kms_key_id = ( ! ) r_kms_key_id;
     storage_encrypted = ( ! ) r_storage_encrypted;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     db_instance_port = ( ! ) r_db_instance_port;
     tde_credential_arn = ( ! ) r_tde_credential_arn;
     storage_type = ( ! ) r_storage_type;
     status_infos = ( ! ) r_status_infos;
     publicly_accessible = ( ! ) r_publicly_accessible;
     secondary_availability_zone = ( ! ) r_secondary_availability_zone;
     character_set_name = ( ! ) r_character_set_name;
     option_group_memberships = ( ! ) r_option_group_memberships;
     iops = ( ! ) r_iops;
     license_model = ( ! ) r_license_model;
     read_replica_db_cluster_identifiers = ( ! ) r_read_replica_db_cluster_identifiers;
     read_replica_db_instance_identifiers = ( ! ) r_read_replica_db_instance_identifiers;
     read_replica_source_db_instance_identifier = ( ! ) r_read_replica_source_db_instance_identifier;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     engine_version = ( ! ) r_engine_version;
     multi_a_z = ( ! ) r_multi_a_z;
     latest_restorable_time = ( ! ) r_latest_restorable_time;
     pending_modified_values = ( ! ) r_pending_modified_values;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     db_subnet_group = ( ! ) r_db_subnet_group;
     availability_zone = ( ! ) r_availability_zone;
     db_parameter_groups = ( ! ) r_db_parameter_groups;
     vpc_security_groups = ( ! ) r_vpc_security_groups;
     db_security_groups = ( ! ) r_db_security_groups;
     backup_retention_period = ( ! ) r_backup_retention_period;
     preferred_backup_window = ( ! ) r_preferred_backup_window;
     instance_create_time = ( ! ) r_instance_create_time;
     allocated_storage = ( ! ) r_allocated_storage;
     endpoint = ( ! ) r_endpoint;
     db_name = ( ! ) r_db_name;
     master_username = ( ! ) r_master_username;
     db_instance_status = ( ! ) r_db_instance_status;
     engine = ( ! ) r_engine;
     db_instance_class = ( ! ) r_db_instance_class;
     db_instance_identifier = ( ! ) r_db_instance_identifier;
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
  let r_force_failover = ref None in
  let r_db_instance_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ForceFailover"; "DBInstanceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "ForceFailover" ->
          r_force_failover :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForceFailover"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     force_failover = ( ! ) r_force_failover;
     db_instance_identifier =
       Smaws_Lib.Xml.Parse.required "DBInstanceIdentifier" (( ! ) r_db_instance_identifier) i;
   }
    : reboot_db_instance_message)

let provisioned_iops_not_available_in_az_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : provisioned_iops_not_available_in_az_fault)

let promote_read_replica_db_cluster_result_of_xml i =
  let r_db_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBCluster" ] (fun tag _ ->
      match tag with
      | "DBCluster" ->
          r_db_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBCluster" (fun i _ -> db_cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster = ( ! ) r_db_cluster } : promote_read_replica_db_cluster_result)

let promote_read_replica_db_cluster_message_of_xml i =
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
    : promote_read_replica_db_cluster_message)

let pending_maintenance_actions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ResourcePendingMaintenanceActions"
    (fun i _ -> resource_pending_maintenance_actions_of_xml i)
    ()

let pending_maintenance_actions_message_of_xml i =
  let r_marker = ref None in
  let r_pending_maintenance_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "PendingMaintenanceActions" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "PendingMaintenanceActions" ->
          r_pending_maintenance_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingMaintenanceActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ResourcePendingMaintenanceActions"
                     (fun i _ -> resource_pending_maintenance_actions_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; pending_maintenance_actions = ( ! ) r_pending_maintenance_actions }
    : pending_maintenance_actions_message)

let availability_zone_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone" (fun i _ -> availability_zone_of_xml i) ()

let orderable_db_instance_option_of_xml i =
  let r_supported_network_types = ref None in
  let r_supports_global_databases = ref None in
  let r_max_iops_per_gib = ref None in
  let r_min_iops_per_gib = ref None in
  let r_max_iops_per_db_instance = ref None in
  let r_min_iops_per_db_instance = ref None in
  let r_max_storage_size = ref None in
  let r_min_storage_size = ref None in
  let r_supports_performance_insights = ref None in
  let r_supports_iam_database_authentication = ref None in
  let r_supports_enhanced_monitoring = ref None in
  let r_supports_iops = ref None in
  let r_storage_type = ref None in
  let r_supports_storage_encryption = ref None in
  let r_vpc = ref None in
  let r_read_replica_capable = ref None in
  let r_multi_az_capable = ref None in
  let r_availability_zones = ref None in
  let r_license_model = ref None in
  let r_db_instance_class = ref None in
  let r_engine_version = ref None in
  let r_engine = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SupportedNetworkTypes";
      "SupportsGlobalDatabases";
      "MaxIopsPerGib";
      "MinIopsPerGib";
      "MaxIopsPerDbInstance";
      "MinIopsPerDbInstance";
      "MaxStorageSize";
      "MinStorageSize";
      "SupportsPerformanceInsights";
      "SupportsIAMDatabaseAuthentication";
      "SupportsEnhancedMonitoring";
      "SupportsIops";
      "StorageType";
      "SupportsStorageEncryption";
      "Vpc";
      "ReadReplicaCapable";
      "MultiAZCapable";
      "AvailabilityZones";
      "LicenseModel";
      "DBInstanceClass";
      "EngineVersion";
      "Engine";
    ] (fun tag _ ->
      match tag with
      | "SupportedNetworkTypes" ->
          r_supported_network_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedNetworkTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "SupportsGlobalDatabases" ->
          r_supports_global_databases :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsGlobalDatabases"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "MaxIopsPerGib" ->
          r_max_iops_per_gib :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxIopsPerGib"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "MinIopsPerGib" ->
          r_min_iops_per_gib :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinIopsPerGib"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "MaxIopsPerDbInstance" ->
          r_max_iops_per_db_instance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxIopsPerDbInstance"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "MinIopsPerDbInstance" ->
          r_min_iops_per_db_instance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinIopsPerDbInstance"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "MaxStorageSize" ->
          r_max_storage_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxStorageSize"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "MinStorageSize" ->
          r_min_storage_size :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinStorageSize"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SupportsPerformanceInsights" ->
          r_supports_performance_insights :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsPerformanceInsights"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SupportsIAMDatabaseAuthentication" ->
          r_supports_iam_database_authentication :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsIAMDatabaseAuthentication"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SupportsEnhancedMonitoring" ->
          r_supports_enhanced_monitoring :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsEnhancedMonitoring"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SupportsIops" ->
          r_supports_iops :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsIops" (fun i _ -> boolean__of_xml i) ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "SupportsStorageEncryption" ->
          r_supports_storage_encryption :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsStorageEncryption"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "Vpc" ->
          r_vpc :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Vpc" (fun i _ -> boolean__of_xml i) ())
      | "ReadReplicaCapable" ->
          r_read_replica_capable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReadReplicaCapable"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "MultiAZCapable" ->
          r_multi_az_capable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZCapable"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | "LicenseModel" ->
          r_license_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LicenseModel" (fun i _ -> string__of_xml i) ())
      | "DBInstanceClass" ->
          r_db_instance_class :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceClass"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     supported_network_types = ( ! ) r_supported_network_types;
     supports_global_databases = ( ! ) r_supports_global_databases;
     max_iops_per_gib = ( ! ) r_max_iops_per_gib;
     min_iops_per_gib = ( ! ) r_min_iops_per_gib;
     max_iops_per_db_instance = ( ! ) r_max_iops_per_db_instance;
     min_iops_per_db_instance = ( ! ) r_min_iops_per_db_instance;
     max_storage_size = ( ! ) r_max_storage_size;
     min_storage_size = ( ! ) r_min_storage_size;
     supports_performance_insights = ( ! ) r_supports_performance_insights;
     supports_iam_database_authentication = ( ! ) r_supports_iam_database_authentication;
     supports_enhanced_monitoring = ( ! ) r_supports_enhanced_monitoring;
     supports_iops = ( ! ) r_supports_iops;
     storage_type = ( ! ) r_storage_type;
     supports_storage_encryption = ( ! ) r_supports_storage_encryption;
     vpc = ( ! ) r_vpc;
     read_replica_capable = ( ! ) r_read_replica_capable;
     multi_az_capable = ( ! ) r_multi_az_capable;
     availability_zones = ( ! ) r_availability_zones;
     license_model = ( ! ) r_license_model;
     db_instance_class = ( ! ) r_db_instance_class;
     engine_version = ( ! ) r_engine_version;
     engine = ( ! ) r_engine;
   }
    : orderable_db_instance_option)

let orderable_db_instance_options_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "OrderableDBInstanceOption"
    (fun i _ -> orderable_db_instance_option_of_xml i)
    ()

let orderable_db_instance_options_message_of_xml i =
  let r_marker = ref None in
  let r_orderable_db_instance_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "OrderableDBInstanceOptions" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "OrderableDBInstanceOptions" ->
          r_orderable_db_instance_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrderableDBInstanceOptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "OrderableDBInstanceOption"
                     (fun i _ -> orderable_db_instance_option_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     orderable_db_instance_options = ( ! ) r_orderable_db_instance_options;
   }
    : orderable_db_instance_options_message)

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
  let r_allow_major_version_upgrade = ref None in
  let r_engine_version = ref None in
  let r_deletion_protection = ref None in
  let r_new_global_cluster_identifier = ref None in
  let r_global_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AllowMajorVersionUpgrade";
      "EngineVersion";
      "DeletionProtection";
      "NewGlobalClusterIdentifier";
      "GlobalClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "AllowMajorVersionUpgrade" ->
          r_allow_major_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowMajorVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
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
      | "NewGlobalClusterIdentifier" ->
          r_new_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewGlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     allow_major_version_upgrade = ( ! ) r_allow_major_version_upgrade;
     engine_version = ( ! ) r_engine_version;
     deletion_protection = ( ! ) r_deletion_protection;
     new_global_cluster_identifier = ( ! ) r_new_global_cluster_identifier;
     global_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "GlobalClusterIdentifier" (( ! ) r_global_cluster_identifier) i;
   }
    : modify_global_cluster_message)

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
  let r_event_categories = ref None in
  let r_source_type = ref None in
  let r_sns_topic_arn = ref None in
  let r_subscription_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Enabled"; "EventCategories"; "SourceType"; "SnsTopicArn"; "SubscriptionName" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> boolean_optional_of_xml i)
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
     event_categories = ( ! ) r_event_categories;
     source_type = ( ! ) r_source_type;
     sns_topic_arn = ( ! ) r_sns_topic_arn;
     subscription_name =
       Smaws_Lib.Xml.Parse.required "SubscriptionName" (( ! ) r_subscription_name) i;
   }
    : modify_event_subscription_message)

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

let modify_db_subnet_group_message_of_xml i =
  let r_subnet_ids = ref None in
  let r_db_subnet_group_description = ref None in
  let r_db_subnet_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SubnetIds"; "DBSubnetGroupDescription"; "DBSubnetGroupName" ] (fun tag _ ->
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
      | "DBSubnetGroupDescription" ->
          r_db_subnet_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subnet_ids = Smaws_Lib.Xml.Parse.required "SubnetIds" (( ! ) r_subnet_ids) i;
     db_subnet_group_description = ( ! ) r_db_subnet_group_description;
     db_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "DBSubnetGroupName" (( ! ) r_db_subnet_group_name) i;
   }
    : modify_db_subnet_group_message)

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

let modify_db_parameter_group_message_of_xml i =
  let r_parameters = ref None in
  let r_db_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Parameters"; "DBParameterGroupName" ]
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
      | "DBParameterGroupName" ->
          r_db_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameters = Smaws_Lib.Xml.Parse.required "Parameters" (( ! ) r_parameters) i;
     db_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBParameterGroupName" (( ! ) r_db_parameter_group_name) i;
   }
    : modify_db_parameter_group_message)

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

let db_security_group_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBSecurityGroupName" (fun i _ -> string__of_xml i) ()

let cloudwatch_logs_export_configuration_of_xml i =
  let r_disable_log_types = ref None in
  let r_enable_log_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DisableLogTypes"; "EnableLogTypes" ] (fun tag _ ->
      match tag with
      | "DisableLogTypes" ->
          r_disable_log_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableLogTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "EnableLogTypes" ->
          r_enable_log_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableLogTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ disable_log_types = ( ! ) r_disable_log_types; enable_log_types = ( ! ) r_enable_log_types }
    : cloudwatch_logs_export_configuration)

let modify_db_instance_message_of_xml i =
  let r_deletion_protection = ref None in
  let r_cloudwatch_logs_export_configuration = ref None in
  let r_performance_insights_kms_key_id = ref None in
  let r_enable_performance_insights = ref None in
  let r_enable_iam_database_authentication = ref None in
  let r_promotion_tier = ref None in
  let r_domain_iam_role_name = ref None in
  let r_monitoring_role_arn = ref None in
  let r_publicly_accessible = ref None in
  let r_db_port_number = ref None in
  let r_monitoring_interval = ref None in
  let r_copy_tags_to_snapshot = ref None in
  let r_domain = ref None in
  let r_ca_certificate_identifier = ref None in
  let r_tde_credential_password = ref None in
  let r_tde_credential_arn = ref None in
  let r_storage_type = ref None in
  let r_new_db_instance_identifier = ref None in
  let r_option_group_name = ref None in
  let r_iops = ref None in
  let r_license_model = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_allow_major_version_upgrade = ref None in
  let r_engine_version = ref None in
  let r_multi_a_z = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_preferred_backup_window = ref None in
  let r_backup_retention_period = ref None in
  let r_db_parameter_group_name = ref None in
  let r_master_user_password = ref None in
  let r_apply_immediately = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_db_security_groups = ref None in
  let r_db_subnet_group_name = ref None in
  let r_db_instance_class = ref None in
  let r_allocated_storage = ref None in
  let r_db_instance_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DeletionProtection";
      "CloudwatchLogsExportConfiguration";
      "PerformanceInsightsKMSKeyId";
      "EnablePerformanceInsights";
      "EnableIAMDatabaseAuthentication";
      "PromotionTier";
      "DomainIAMRoleName";
      "MonitoringRoleArn";
      "PubliclyAccessible";
      "DBPortNumber";
      "MonitoringInterval";
      "CopyTagsToSnapshot";
      "Domain";
      "CACertificateIdentifier";
      "TdeCredentialPassword";
      "TdeCredentialArn";
      "StorageType";
      "NewDBInstanceIdentifier";
      "OptionGroupName";
      "Iops";
      "LicenseModel";
      "AutoMinorVersionUpgrade";
      "AllowMajorVersionUpgrade";
      "EngineVersion";
      "MultiAZ";
      "PreferredMaintenanceWindow";
      "PreferredBackupWindow";
      "BackupRetentionPeriod";
      "DBParameterGroupName";
      "MasterUserPassword";
      "ApplyImmediately";
      "VpcSecurityGroupIds";
      "DBSecurityGroups";
      "DBSubnetGroupName";
      "DBInstanceClass";
      "AllocatedStorage";
      "DBInstanceIdentifier";
    ] (fun tag _ ->
      match tag with
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "CloudwatchLogsExportConfiguration" ->
          r_cloudwatch_logs_export_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CloudwatchLogsExportConfiguration"
                 (fun i _ -> cloudwatch_logs_export_configuration_of_xml i)
                 ())
      | "PerformanceInsightsKMSKeyId" ->
          r_performance_insights_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PerformanceInsightsKMSKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EnablePerformanceInsights" ->
          r_enable_performance_insights :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnablePerformanceInsights"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EnableIAMDatabaseAuthentication" ->
          r_enable_iam_database_authentication :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableIAMDatabaseAuthentication"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PromotionTier" ->
          r_promotion_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PromotionTier"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DomainIAMRoleName" ->
          r_domain_iam_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainIAMRoleName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MonitoringRoleArn" ->
          r_monitoring_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MonitoringRoleArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DBPortNumber" ->
          r_db_port_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBPortNumber"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "MonitoringInterval" ->
          r_monitoring_interval :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MonitoringInterval"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "CopyTagsToSnapshot" ->
          r_copy_tags_to_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTagsToSnapshot"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Domain" ->
          r_domain :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Domain" (fun i _ -> string__of_xml i) ())
      | "CACertificateIdentifier" ->
          r_ca_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CACertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TdeCredentialPassword" ->
          r_tde_credential_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TdeCredentialPassword"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | "TdeCredentialArn" ->
          r_tde_credential_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TdeCredentialArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "NewDBInstanceIdentifier" ->
          r_new_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewDBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "OptionGroupName" ->
          r_option_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Iops" ->
          r_iops :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Iops" (fun i _ -> integer_optional_of_xml i) ())
      | "LicenseModel" ->
          r_license_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LicenseModel" (fun i _ -> string__of_xml i) ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AllowMajorVersionUpgrade" ->
          r_allow_major_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowMajorVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
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
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DBParameterGroupName" ->
          r_db_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MasterUserPassword" ->
          r_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserPassword"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
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
      | "DBSecurityGroups" ->
          r_db_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBSecurityGroupName"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
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
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deletion_protection = ( ! ) r_deletion_protection;
     cloudwatch_logs_export_configuration = ( ! ) r_cloudwatch_logs_export_configuration;
     performance_insights_kms_key_id = ( ! ) r_performance_insights_kms_key_id;
     enable_performance_insights = ( ! ) r_enable_performance_insights;
     enable_iam_database_authentication = ( ! ) r_enable_iam_database_authentication;
     promotion_tier = ( ! ) r_promotion_tier;
     domain_iam_role_name = ( ! ) r_domain_iam_role_name;
     monitoring_role_arn = ( ! ) r_monitoring_role_arn;
     publicly_accessible = ( ! ) r_publicly_accessible;
     db_port_number = ( ! ) r_db_port_number;
     monitoring_interval = ( ! ) r_monitoring_interval;
     copy_tags_to_snapshot = ( ! ) r_copy_tags_to_snapshot;
     domain = ( ! ) r_domain;
     ca_certificate_identifier = ( ! ) r_ca_certificate_identifier;
     tde_credential_password = ( ! ) r_tde_credential_password;
     tde_credential_arn = ( ! ) r_tde_credential_arn;
     storage_type = ( ! ) r_storage_type;
     new_db_instance_identifier = ( ! ) r_new_db_instance_identifier;
     option_group_name = ( ! ) r_option_group_name;
     iops = ( ! ) r_iops;
     license_model = ( ! ) r_license_model;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     allow_major_version_upgrade = ( ! ) r_allow_major_version_upgrade;
     engine_version = ( ! ) r_engine_version;
     multi_a_z = ( ! ) r_multi_a_z;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     preferred_backup_window = ( ! ) r_preferred_backup_window;
     backup_retention_period = ( ! ) r_backup_retention_period;
     db_parameter_group_name = ( ! ) r_db_parameter_group_name;
     master_user_password = ( ! ) r_master_user_password;
     apply_immediately = ( ! ) r_apply_immediately;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     db_security_groups = ( ! ) r_db_security_groups;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     db_instance_class = ( ! ) r_db_instance_class;
     allocated_storage = ( ! ) r_allocated_storage;
     db_instance_identifier =
       Smaws_Lib.Xml.Parse.required "DBInstanceIdentifier" (( ! ) r_db_instance_identifier) i;
   }
    : modify_db_instance_message)

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

let domain_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : domain_not_found_fault)

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

let attribute_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AttributeValue" (fun i _ -> string__of_xml i) ()

let db_cluster_snapshot_attribute_of_xml i =
  let r_attribute_values = ref None in
  let r_attribute_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AttributeValues"; "AttributeName" ] (fun tag _ ->
      match tag with
      | "AttributeValues" ->
          r_attribute_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AttributeValue"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "AttributeName" ->
          r_attribute_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attribute_values = ( ! ) r_attribute_values; attribute_name = ( ! ) r_attribute_name }
    : db_cluster_snapshot_attribute)

let db_cluster_snapshot_attribute_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterSnapshotAttribute"
    (fun i _ -> db_cluster_snapshot_attribute_of_xml i)
    ()

let db_cluster_snapshot_attributes_result_of_xml i =
  let r_db_cluster_snapshot_attributes = ref None in
  let r_db_cluster_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBClusterSnapshotAttributes"; "DBClusterSnapshotIdentifier" ] (fun tag _ ->
      match tag with
      | "DBClusterSnapshotAttributes" ->
          r_db_cluster_snapshot_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterSnapshotAttribute"
                     (fun i _ -> db_cluster_snapshot_attribute_of_xml i)
                     ())
                 ())
      | "DBClusterSnapshotIdentifier" ->
          r_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_snapshot_attributes = ( ! ) r_db_cluster_snapshot_attributes;
     db_cluster_snapshot_identifier = ( ! ) r_db_cluster_snapshot_identifier;
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
  let r_values_to_remove = ref None in
  let r_values_to_add = ref None in
  let r_attribute_name = ref None in
  let r_db_cluster_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ValuesToRemove"; "ValuesToAdd"; "AttributeName"; "DBClusterSnapshotIdentifier" ]
    (fun tag _ ->
      match tag with
      | "ValuesToRemove" ->
          r_values_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValuesToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AttributeValue"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ValuesToAdd" ->
          r_values_to_add :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValuesToAdd"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AttributeValue"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "AttributeName" ->
          r_attribute_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeName" (fun i _ -> string__of_xml i) ())
      | "DBClusterSnapshotIdentifier" ->
          r_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     values_to_remove = ( ! ) r_values_to_remove;
     values_to_add = ( ! ) r_values_to_add;
     attribute_name = Smaws_Lib.Xml.Parse.required "AttributeName" (( ! ) r_attribute_name) i;
     db_cluster_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterSnapshotIdentifier"
         (( ! ) r_db_cluster_snapshot_identifier)
         i;
   }
    : modify_db_cluster_snapshot_attribute_message)

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

let modify_db_cluster_parameter_group_message_of_xml i =
  let r_parameters = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Parameters"; "DBClusterParameterGroupName" ]
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
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameters = Smaws_Lib.Xml.Parse.required "Parameters" (( ! ) r_parameters) i;
     db_cluster_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBClusterParameterGroupName"
         (( ! ) r_db_cluster_parameter_group_name)
         i;
   }
    : modify_db_cluster_parameter_group_message)

let modify_db_cluster_message_of_xml i =
  let r_network_type = ref None in
  let r_storage_type = ref None in
  let r_serverless_v2_scaling_configuration = ref None in
  let r_copy_tags_to_snapshot = ref None in
  let r_deletion_protection = ref None in
  let r_db_instance_parameter_group_name = ref None in
  let r_allow_major_version_upgrade = ref None in
  let r_engine_version = ref None in
  let r_cloudwatch_logs_export_configuration = ref None in
  let r_enable_iam_database_authentication = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_preferred_backup_window = ref None in
  let r_option_group_name = ref None in
  let r_master_user_password = ref None in
  let r_port = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  let r_backup_retention_period = ref None in
  let r_apply_immediately = ref None in
  let r_new_db_cluster_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NetworkType";
      "StorageType";
      "ServerlessV2ScalingConfiguration";
      "CopyTagsToSnapshot";
      "DeletionProtection";
      "DBInstanceParameterGroupName";
      "AllowMajorVersionUpgrade";
      "EngineVersion";
      "CloudwatchLogsExportConfiguration";
      "EnableIAMDatabaseAuthentication";
      "PreferredMaintenanceWindow";
      "PreferredBackupWindow";
      "OptionGroupName";
      "MasterUserPassword";
      "Port";
      "VpcSecurityGroupIds";
      "DBClusterParameterGroupName";
      "BackupRetentionPeriod";
      "ApplyImmediately";
      "NewDBClusterIdentifier";
      "DBClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
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
      | "CopyTagsToSnapshot" ->
          r_copy_tags_to_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTagsToSnapshot"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DBInstanceParameterGroupName" ->
          r_db_instance_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AllowMajorVersionUpgrade" ->
          r_allow_major_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowMajorVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "CloudwatchLogsExportConfiguration" ->
          r_cloudwatch_logs_export_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CloudwatchLogsExportConfiguration"
                 (fun i _ -> cloudwatch_logs_export_configuration_of_xml i)
                 ())
      | "EnableIAMDatabaseAuthentication" ->
          r_enable_iam_database_authentication :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableIAMDatabaseAuthentication"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredBackupWindow" ->
          r_preferred_backup_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredBackupWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "OptionGroupName" ->
          r_option_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionGroupName"
                 (fun i _ -> string__of_xml i)
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
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "BackupRetentionPeriod" ->
          r_backup_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ApplyImmediately" ->
          r_apply_immediately :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyImmediately"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "NewDBClusterIdentifier" ->
          r_new_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewDBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     network_type = ( ! ) r_network_type;
     storage_type = ( ! ) r_storage_type;
     serverless_v2_scaling_configuration = ( ! ) r_serverless_v2_scaling_configuration;
     copy_tags_to_snapshot = ( ! ) r_copy_tags_to_snapshot;
     deletion_protection = ( ! ) r_deletion_protection;
     db_instance_parameter_group_name = ( ! ) r_db_instance_parameter_group_name;
     allow_major_version_upgrade = ( ! ) r_allow_major_version_upgrade;
     engine_version = ( ! ) r_engine_version;
     cloudwatch_logs_export_configuration = ( ! ) r_cloudwatch_logs_export_configuration;
     enable_iam_database_authentication = ( ! ) r_enable_iam_database_authentication;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     preferred_backup_window = ( ! ) r_preferred_backup_window;
     option_group_name = ( ! ) r_option_group_name;
     master_user_password = ( ! ) r_master_user_password;
     port = ( ! ) r_port;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name;
     backup_retention_period = ( ! ) r_backup_retention_period;
     apply_immediately = ( ! ) r_apply_immediately;
     new_db_cluster_identifier = ( ! ) r_new_db_cluster_identifier;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
   }
    : modify_db_cluster_message)

let modify_db_cluster_endpoint_output_of_xml i =
  let r_db_cluster_endpoint_arn = ref None in
  let r_excluded_members = ref None in
  let r_static_members = ref None in
  let r_custom_endpoint_type = ref None in
  let r_endpoint_type = ref None in
  let r_status = ref None in
  let r_endpoint = ref None in
  let r_db_cluster_endpoint_resource_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  let r_db_cluster_endpoint_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBClusterEndpointArn";
      "ExcludedMembers";
      "StaticMembers";
      "CustomEndpointType";
      "EndpointType";
      "Status";
      "Endpoint";
      "DBClusterEndpointResourceIdentifier";
      "DBClusterIdentifier";
      "DBClusterEndpointIdentifier";
    ] (fun tag _ ->
      match tag with
      | "DBClusterEndpointArn" ->
          r_db_cluster_endpoint_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ExcludedMembers" ->
          r_excluded_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludedMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "StaticMembers" ->
          r_static_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StaticMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "CustomEndpointType" ->
          r_custom_endpoint_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomEndpointType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EndpointType" ->
          r_endpoint_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointType" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> string__of_xml i) ())
      | "DBClusterEndpointResourceIdentifier" ->
          r_db_cluster_endpoint_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointResourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterEndpointIdentifier" ->
          r_db_cluster_endpoint_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_endpoint_arn = ( ! ) r_db_cluster_endpoint_arn;
     excluded_members = ( ! ) r_excluded_members;
     static_members = ( ! ) r_static_members;
     custom_endpoint_type = ( ! ) r_custom_endpoint_type;
     endpoint_type = ( ! ) r_endpoint_type;
     status = ( ! ) r_status;
     endpoint = ( ! ) r_endpoint;
     db_cluster_endpoint_resource_identifier = ( ! ) r_db_cluster_endpoint_resource_identifier;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     db_cluster_endpoint_identifier = ( ! ) r_db_cluster_endpoint_identifier;
   }
    : modify_db_cluster_endpoint_output)

let modify_db_cluster_endpoint_message_of_xml i =
  let r_excluded_members = ref None in
  let r_static_members = ref None in
  let r_endpoint_type = ref None in
  let r_db_cluster_endpoint_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ExcludedMembers"; "StaticMembers"; "EndpointType"; "DBClusterEndpointIdentifier" ]
    (fun tag _ ->
      match tag with
      | "ExcludedMembers" ->
          r_excluded_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludedMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "StaticMembers" ->
          r_static_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StaticMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "EndpointType" ->
          r_endpoint_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointType" (fun i _ -> string__of_xml i) ())
      | "DBClusterEndpointIdentifier" ->
          r_db_cluster_endpoint_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     excluded_members = ( ! ) r_excluded_members;
     static_members = ( ! ) r_static_members;
     endpoint_type = ( ! ) r_endpoint_type;
     db_cluster_endpoint_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterEndpointIdentifier"
         (( ! ) r_db_cluster_endpoint_identifier)
         i;
   }
    : modify_db_cluster_endpoint_message)

let invalid_db_cluster_endpoint_state_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_db_cluster_endpoint_state_fault)

let db_cluster_endpoint_not_found_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : db_cluster_endpoint_not_found_fault)

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

let filter_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Value" (fun i _ -> string__of_xml i) ()

let filter_of_xml i =
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
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     values = Smaws_Lib.Xml.Parse.required "Values" (( ! ) r_values) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : filter)

let filter_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ()

let list_tags_for_resource_message_of_xml i =
  let r_filters = ref None in
  let r_resource_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Filters"; "ResourceName" ] (fun tag _ ->
      match tag with
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     filters = ( ! ) r_filters;
     resource_name = Smaws_Lib.Xml.Parse.required "ResourceName" (( ! ) r_resource_name) i;
   }
    : list_tags_for_resource_message)

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

let global_cluster_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "GlobalClusterMember" (fun i _ -> global_cluster_of_xml i) ()

let global_clusters_message_of_xml i =
  let r_global_clusters = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GlobalClusters"; "Marker" ] (fun tag _ ->
      match tag with
      | "GlobalClusters" ->
          r_global_clusters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "GlobalClusterMember"
                     (fun i _ -> global_cluster_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ global_clusters = ( ! ) r_global_clusters; marker = ( ! ) r_marker } : global_clusters_message)

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
  let r_switchover = ref None in
  let r_allow_data_loss = ref None in
  let r_target_db_cluster_identifier = ref None in
  let r_global_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Switchover"; "AllowDataLoss"; "TargetDbClusterIdentifier"; "GlobalClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "Switchover" ->
          r_switchover :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Switchover"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AllowDataLoss" ->
          r_allow_data_loss :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowDataLoss"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "TargetDbClusterIdentifier" ->
          r_target_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDbClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     switchover = ( ! ) r_switchover;
     allow_data_loss = ( ! ) r_allow_data_loss;
     target_db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "TargetDbClusterIdentifier"
         (( ! ) r_target_db_cluster_identifier)
         i;
     global_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "GlobalClusterIdentifier" (( ! ) r_global_cluster_identifier) i;
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
  let r_target_db_instance_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TargetDBInstanceIdentifier"; "DBClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "TargetDBInstanceIdentifier" ->
          r_target_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_db_instance_identifier = ( ! ) r_target_db_instance_identifier;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
   }
    : failover_db_cluster_message)

let event_of_xml i =
  let r_source_arn = ref None in
  let r_date = ref None in
  let r_event_categories = ref None in
  let r_message = ref None in
  let r_source_type = ref None in
  let r_source_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourceArn"; "Date"; "EventCategories"; "Message"; "SourceType"; "SourceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "SourceArn" ->
          r_source_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn" (fun i _ -> string__of_xml i) ())
      | "Date" ->
          r_date :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Date" (fun i _ -> t_stamp_of_xml i) ())
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
     source_arn = ( ! ) r_source_arn;
     date = ( ! ) r_date;
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

let event_categories_map_of_xml i =
  let r_event_categories = ref None in
  let r_source_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EventCategories"; "SourceType" ] (fun tag _ ->
      match tag with
      | "EventCategories" ->
          r_event_categories :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategories"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ event_categories = ( ! ) r_event_categories; source_type = ( ! ) r_source_type }
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

let engine_defaults_of_xml i =
  let r_parameters = ref None in
  let r_marker = ref None in
  let r_db_parameter_group_family = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Parameters"; "Marker"; "DBParameterGroupFamily" ]
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
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameters = ( ! ) r_parameters;
     marker = ( ! ) r_marker;
     db_parameter_group_family = ( ! ) r_db_parameter_group_family;
   }
    : engine_defaults)

let describe_valid_db_instance_modifications_result_of_xml i =
  let r_valid_db_instance_modifications_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ValidDBInstanceModificationsMessage" ]
    (fun tag _ ->
      match tag with
      | "ValidDBInstanceModificationsMessage" ->
          r_valid_db_instance_modifications_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidDBInstanceModificationsMessage"
                 (fun i _ -> valid_db_instance_modifications_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ valid_db_instance_modifications_message = ( ! ) r_valid_db_instance_modifications_message }
    : describe_valid_db_instance_modifications_result)

let describe_valid_db_instance_modifications_message_of_xml i =
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
    : describe_valid_db_instance_modifications_message)

let describe_pending_maintenance_actions_message_of_xml i =
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_filters = ref None in
  let r_resource_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxRecords"; "Marker"; "Filters"; "ResourceIdentifier" ] (fun tag _ ->
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
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     filters = ( ! ) r_filters;
     resource_identifier = ( ! ) r_resource_identifier;
   }
    : describe_pending_maintenance_actions_message)

let describe_orderable_db_instance_options_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_vpc = ref None in
  let r_license_model = ref None in
  let r_db_instance_class = ref None in
  let r_engine_version = ref None in
  let r_engine = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Marker";
      "MaxRecords";
      "Filters";
      "Vpc";
      "LicenseModel";
      "DBInstanceClass";
      "EngineVersion";
      "Engine";
    ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "Vpc" ->
          r_vpc :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Vpc" (fun i _ -> boolean_optional_of_xml i) ())
      | "LicenseModel" ->
          r_license_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LicenseModel" (fun i _ -> string__of_xml i) ())
      | "DBInstanceClass" ->
          r_db_instance_class :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceClass"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     vpc = ( ! ) r_vpc;
     license_model = ( ! ) r_license_model;
     db_instance_class = ( ! ) r_db_instance_class;
     engine_version = ( ! ) r_engine_version;
     engine = Smaws_Lib.Xml.Parse.required "Engine" (( ! ) r_engine) i;
   }
    : describe_orderable_db_instance_options_message)

let describe_global_clusters_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_global_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "MaxRecords"; "GlobalClusterIdentifier" ]
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
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     global_cluster_identifier = ( ! ) r_global_cluster_identifier;
   }
    : describe_global_clusters_message)

let describe_events_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_event_categories = ref None in
  let r_duration = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_source_type = ref None in
  let r_source_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Marker";
      "MaxRecords";
      "Filters";
      "EventCategories";
      "Duration";
      "EndTime";
      "StartTime";
      "SourceType";
      "SourceIdentifier";
    ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
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
     filters = ( ! ) r_filters;
     event_categories = ( ! ) r_event_categories;
     duration = ( ! ) r_duration;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     source_type = ( ! ) r_source_type;
     source_identifier = ( ! ) r_source_identifier;
   }
    : describe_events_message)

let describe_event_subscriptions_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_subscription_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Filters"; "SubscriptionName" ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     subscription_name = ( ! ) r_subscription_name;
   }
    : describe_event_subscriptions_message)

let describe_event_categories_message_of_xml i =
  let r_filters = ref None in
  let r_source_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Filters"; "SourceType" ] (fun tag _ ->
      match tag with
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ filters = ( ! ) r_filters; source_type = ( ! ) r_source_type }
    : describe_event_categories_message)

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
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_db_parameter_group_family = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Filters"; "DBParameterGroupFamily" ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     db_parameter_group_family =
       Smaws_Lib.Xml.Parse.required "DBParameterGroupFamily" (( ! ) r_db_parameter_group_family) i;
   }
    : describe_engine_default_parameters_message)

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
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_db_parameter_group_family = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Filters"; "DBParameterGroupFamily" ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     db_parameter_group_family =
       Smaws_Lib.Xml.Parse.required "DBParameterGroupFamily" (( ! ) r_db_parameter_group_family) i;
   }
    : describe_engine_default_cluster_parameters_message)

let describe_db_subnet_groups_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_db_subnet_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Filters"; "DBSubnetGroupName" ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
   }
    : describe_db_subnet_groups_message)

let db_subnet_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBSubnetGroup" (fun i _ -> db_subnet_group_of_xml i) ()

let db_subnet_group_message_of_xml i =
  let r_db_subnet_groups = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBSubnetGroups"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBSubnetGroups" ->
          r_db_subnet_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBSubnetGroup"
                     (fun i _ -> db_subnet_group_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_subnet_groups = ( ! ) r_db_subnet_groups; marker = ( ! ) r_marker }
    : db_subnet_group_message)

let describe_db_parameters_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_source = ref None in
  let r_db_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Filters"; "Source"; "DBParameterGroupName" ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> string__of_xml i) ())
      | "DBParameterGroupName" ->
          r_db_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     source = ( ! ) r_source;
     db_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBParameterGroupName" (( ! ) r_db_parameter_group_name) i;
   }
    : describe_db_parameters_message)

let db_parameter_group_details_of_xml i =
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
  ({ marker = ( ! ) r_marker; parameters = ( ! ) r_parameters } : db_parameter_group_details)

let describe_db_parameter_groups_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_db_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Filters"; "DBParameterGroupName" ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "DBParameterGroupName" ->
          r_db_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     db_parameter_group_name = ( ! ) r_db_parameter_group_name;
   }
    : describe_db_parameter_groups_message)

let db_parameter_group_of_xml i =
  let r_db_parameter_group_arn = ref None in
  let r_description = ref None in
  let r_db_parameter_group_family = ref None in
  let r_db_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DBParameterGroupArn"; "Description"; "DBParameterGroupFamily"; "DBParameterGroupName" ]
    (fun tag _ ->
      match tag with
      | "DBParameterGroupArn" ->
          r_db_parameter_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBParameterGroupName" ->
          r_db_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_parameter_group_arn = ( ! ) r_db_parameter_group_arn;
     description = ( ! ) r_description;
     db_parameter_group_family = ( ! ) r_db_parameter_group_family;
     db_parameter_group_name = ( ! ) r_db_parameter_group_name;
   }
    : db_parameter_group)

let db_parameter_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBParameterGroup"
    (fun i _ -> db_parameter_group_of_xml i)
    ()

let db_parameter_groups_message_of_xml i =
  let r_db_parameter_groups = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBParameterGroups"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBParameterGroups" ->
          r_db_parameter_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBParameterGroup"
                     (fun i _ -> db_parameter_group_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_parameter_groups = ( ! ) r_db_parameter_groups; marker = ( ! ) r_marker }
    : db_parameter_groups_message)

let describe_db_instances_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_db_instance_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Filters"; "DBInstanceIdentifier" ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     db_instance_identifier = ( ! ) r_db_instance_identifier;
   }
    : describe_db_instances_message)

let db_instance_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBInstance" (fun i _ -> db_instance_of_xml i) ()

let db_instance_message_of_xml i =
  let r_db_instances = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBInstances"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBInstances" ->
          r_db_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBInstance"
                     (fun i _ -> db_instance_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_instances = ( ! ) r_db_instances; marker = ( ! ) r_marker } : db_instance_message)

let describe_db_engine_versions_message_of_xml i =
  let r_list_supported_timezones = ref None in
  let r_list_supported_character_sets = ref None in
  let r_default_only = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_db_parameter_group_family = ref None in
  let r_engine_version = ref None in
  let r_engine = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ListSupportedTimezones";
      "ListSupportedCharacterSets";
      "DefaultOnly";
      "Marker";
      "MaxRecords";
      "Filters";
      "DBParameterGroupFamily";
      "EngineVersion";
      "Engine";
    ] (fun tag _ ->
      match tag with
      | "ListSupportedTimezones" ->
          r_list_supported_timezones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListSupportedTimezones"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ListSupportedCharacterSets" ->
          r_list_supported_character_sets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListSupportedCharacterSets"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DefaultOnly" ->
          r_default_only :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultOnly" (fun i _ -> boolean__of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     list_supported_timezones = ( ! ) r_list_supported_timezones;
     list_supported_character_sets = ( ! ) r_list_supported_character_sets;
     default_only = ( ! ) r_default_only;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     db_parameter_group_family = ( ! ) r_db_parameter_group_family;
     engine_version = ( ! ) r_engine_version;
     engine = ( ! ) r_engine;
   }
    : describe_db_engine_versions_message)

let db_engine_version_of_xml i =
  let r_supports_global_databases = ref None in
  let r_supports_read_replica = ref None in
  let r_supports_log_exports_to_cloudwatch_logs = ref None in
  let r_exportable_log_types = ref None in
  let r_supported_timezones = ref None in
  let r_valid_upgrade_target = ref None in
  let r_supported_character_sets = ref None in
  let r_default_character_set = ref None in
  let r_db_engine_version_description = ref None in
  let r_db_engine_description = ref None in
  let r_db_parameter_group_family = ref None in
  let r_engine_version = ref None in
  let r_engine = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SupportsGlobalDatabases";
      "SupportsReadReplica";
      "SupportsLogExportsToCloudwatchLogs";
      "ExportableLogTypes";
      "SupportedTimezones";
      "ValidUpgradeTarget";
      "SupportedCharacterSets";
      "DefaultCharacterSet";
      "DBEngineVersionDescription";
      "DBEngineDescription";
      "DBParameterGroupFamily";
      "EngineVersion";
      "Engine";
    ] (fun tag _ ->
      match tag with
      | "SupportsGlobalDatabases" ->
          r_supports_global_databases :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsGlobalDatabases"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SupportsReadReplica" ->
          r_supports_read_replica :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsReadReplica"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SupportsLogExportsToCloudwatchLogs" ->
          r_supports_log_exports_to_cloudwatch_logs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportsLogExportsToCloudwatchLogs"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "ExportableLogTypes" ->
          r_exportable_log_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExportableLogTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "SupportedTimezones" ->
          r_supported_timezones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedTimezones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Timezone" (fun i _ -> timezone_of_xml i) ())
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
      | "SupportedCharacterSets" ->
          r_supported_character_sets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedCharacterSets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CharacterSet"
                     (fun i _ -> character_set_of_xml i)
                     ())
                 ())
      | "DefaultCharacterSet" ->
          r_default_character_set :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultCharacterSet"
                 (fun i _ -> character_set_of_xml i)
                 ())
      | "DBEngineVersionDescription" ->
          r_db_engine_version_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBEngineVersionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBEngineDescription" ->
          r_db_engine_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBEngineDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     supports_global_databases = ( ! ) r_supports_global_databases;
     supports_read_replica = ( ! ) r_supports_read_replica;
     supports_log_exports_to_cloudwatch_logs = ( ! ) r_supports_log_exports_to_cloudwatch_logs;
     exportable_log_types = ( ! ) r_exportable_log_types;
     supported_timezones = ( ! ) r_supported_timezones;
     valid_upgrade_target = ( ! ) r_valid_upgrade_target;
     supported_character_sets = ( ! ) r_supported_character_sets;
     default_character_set = ( ! ) r_default_character_set;
     db_engine_version_description = ( ! ) r_db_engine_version_description;
     db_engine_description = ( ! ) r_db_engine_description;
     db_parameter_group_family = ( ! ) r_db_parameter_group_family;
     engine_version = ( ! ) r_engine_version;
     engine = ( ! ) r_engine;
   }
    : db_engine_version)

let db_engine_version_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBEngineVersion" (fun i _ -> db_engine_version_of_xml i) ()

let db_engine_version_message_of_xml i =
  let r_db_engine_versions = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBEngineVersions"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBEngineVersions" ->
          r_db_engine_versions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBEngineVersions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBEngineVersion"
                     (fun i _ -> db_engine_version_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_engine_versions = ( ! ) r_db_engine_versions; marker = ( ! ) r_marker }
    : db_engine_version_message)

let describe_db_clusters_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Filters"; "DBClusterIdentifier" ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
   }
    : describe_db_clusters_message)

let db_cluster_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBCluster" (fun i _ -> db_cluster_of_xml i) ()

let db_cluster_message_of_xml i =
  let r_db_clusters = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusters"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBClusters" ->
          r_db_clusters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBCluster"
                     (fun i _ -> db_cluster_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_clusters = ( ! ) r_db_clusters; marker = ( ! ) r_marker } : db_cluster_message)

let describe_db_cluster_snapshots_message_of_xml i =
  let r_include_public = ref None in
  let r_include_shared = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_snapshot_type = ref None in
  let r_db_cluster_snapshot_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "IncludePublic";
      "IncludeShared";
      "Marker";
      "MaxRecords";
      "Filters";
      "SnapshotType";
      "DBClusterSnapshotIdentifier";
      "DBClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "IncludePublic" ->
          r_include_public :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludePublic"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "IncludeShared" ->
          r_include_shared :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeShared"
                 (fun i _ -> boolean__of_xml i)
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "SnapshotType" ->
          r_snapshot_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotType" (fun i _ -> string__of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     include_public = ( ! ) r_include_public;
     include_shared = ( ! ) r_include_shared;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     snapshot_type = ( ! ) r_snapshot_type;
     db_cluster_snapshot_identifier = ( ! ) r_db_cluster_snapshot_identifier;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
   }
    : describe_db_cluster_snapshots_message)

let db_cluster_snapshot_of_xml i =
  let r_storage_type = ref None in
  let r_iam_database_authentication_enabled = ref None in
  let r_source_db_cluster_snapshot_arn = ref None in
  let r_db_cluster_snapshot_arn = ref None in
  let r_kms_key_id = ref None in
  let r_storage_encrypted = ref None in
  let r_percent_progress = ref None in
  let r_snapshot_type = ref None in
  let r_license_model = ref None in
  let r_engine_version = ref None in
  let r_master_username = ref None in
  let r_cluster_create_time = ref None in
  let r_vpc_id = ref None in
  let r_port = ref None in
  let r_status = ref None in
  let r_allocated_storage = ref None in
  let r_engine = ref None in
  let r_snapshot_create_time = ref None in
  let r_db_cluster_identifier = ref None in
  let r_db_cluster_snapshot_identifier = ref None in
  let r_availability_zones = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StorageType";
      "IAMDatabaseAuthenticationEnabled";
      "SourceDBClusterSnapshotArn";
      "DBClusterSnapshotArn";
      "KmsKeyId";
      "StorageEncrypted";
      "PercentProgress";
      "SnapshotType";
      "LicenseModel";
      "EngineVersion";
      "MasterUsername";
      "ClusterCreateTime";
      "VpcId";
      "Port";
      "Status";
      "AllocatedStorage";
      "Engine";
      "SnapshotCreateTime";
      "DBClusterIdentifier";
      "DBClusterSnapshotIdentifier";
      "AvailabilityZones";
    ] (fun tag _ ->
      match tag with
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "IAMDatabaseAuthenticationEnabled" ->
          r_iam_database_authentication_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IAMDatabaseAuthenticationEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "SourceDBClusterSnapshotArn" ->
          r_source_db_cluster_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDBClusterSnapshotArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterSnapshotArn" ->
          r_db_cluster_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "PercentProgress" ->
          r_percent_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentProgress"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "SnapshotType" ->
          r_snapshot_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotType" (fun i _ -> string__of_xml i) ())
      | "LicenseModel" ->
          r_license_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LicenseModel" (fun i _ -> string__of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
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
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "AllocatedStorage" ->
          r_allocated_storage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllocatedStorage"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "SnapshotCreateTime" ->
          r_snapshot_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
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
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     storage_type = ( ! ) r_storage_type;
     iam_database_authentication_enabled = ( ! ) r_iam_database_authentication_enabled;
     source_db_cluster_snapshot_arn = ( ! ) r_source_db_cluster_snapshot_arn;
     db_cluster_snapshot_arn = ( ! ) r_db_cluster_snapshot_arn;
     kms_key_id = ( ! ) r_kms_key_id;
     storage_encrypted = ( ! ) r_storage_encrypted;
     percent_progress = ( ! ) r_percent_progress;
     snapshot_type = ( ! ) r_snapshot_type;
     license_model = ( ! ) r_license_model;
     engine_version = ( ! ) r_engine_version;
     master_username = ( ! ) r_master_username;
     cluster_create_time = ( ! ) r_cluster_create_time;
     vpc_id = ( ! ) r_vpc_id;
     port = ( ! ) r_port;
     status = ( ! ) r_status;
     allocated_storage = ( ! ) r_allocated_storage;
     engine = ( ! ) r_engine;
     snapshot_create_time = ( ! ) r_snapshot_create_time;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     db_cluster_snapshot_identifier = ( ! ) r_db_cluster_snapshot_identifier;
     availability_zones = ( ! ) r_availability_zones;
   }
    : db_cluster_snapshot)

let db_cluster_snapshot_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterSnapshot"
    (fun i _ -> db_cluster_snapshot_of_xml i)
    ()

let db_cluster_snapshot_message_of_xml i =
  let r_db_cluster_snapshots = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterSnapshots"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBClusterSnapshots" ->
          r_db_cluster_snapshots :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshots"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterSnapshot"
                     (fun i _ -> db_cluster_snapshot_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster_snapshots = ( ! ) r_db_cluster_snapshots; marker = ( ! ) r_marker }
    : db_cluster_snapshot_message)

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

let describe_db_cluster_parameters_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_source = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Filters"; "Source"; "DBClusterParameterGroupName" ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "Source" ->
          r_source :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Source" (fun i _ -> string__of_xml i) ())
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     source = ( ! ) r_source;
     db_cluster_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBClusterParameterGroupName"
         (( ! ) r_db_cluster_parameter_group_name)
         i;
   }
    : describe_db_cluster_parameters_message)

let db_cluster_parameter_group_details_of_xml i =
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
  ({ marker = ( ! ) r_marker; parameters = ( ! ) r_parameters }
    : db_cluster_parameter_group_details)

let describe_db_cluster_parameter_groups_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Filters"; "DBClusterParameterGroupName" ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name;
   }
    : describe_db_cluster_parameter_groups_message)

let db_cluster_parameter_group_of_xml i =
  let r_db_cluster_parameter_group_arn = ref None in
  let r_description = ref None in
  let r_db_parameter_group_family = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBClusterParameterGroupArn";
      "Description";
      "DBParameterGroupFamily";
      "DBClusterParameterGroupName";
    ] (fun tag _ ->
      match tag with
      | "DBClusterParameterGroupArn" ->
          r_db_cluster_parameter_group_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_parameter_group_arn = ( ! ) r_db_cluster_parameter_group_arn;
     description = ( ! ) r_description;
     db_parameter_group_family = ( ! ) r_db_parameter_group_family;
     db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name;
   }
    : db_cluster_parameter_group)

let db_cluster_parameter_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterParameterGroup"
    (fun i _ -> db_cluster_parameter_group_of_xml i)
    ()

let db_cluster_parameter_groups_message_of_xml i =
  let r_db_cluster_parameter_groups = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterParameterGroups"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "DBClusterParameterGroups" ->
          r_db_cluster_parameter_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterParameterGroup"
                     (fun i _ -> db_cluster_parameter_group_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster_parameter_groups = ( ! ) r_db_cluster_parameter_groups; marker = ( ! ) r_marker }
    : db_cluster_parameter_groups_message)

let describe_db_cluster_endpoints_message_of_xml i =
  let r_marker = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  let r_db_cluster_endpoint_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Marker"; "MaxRecords"; "Filters"; "DBClusterEndpointIdentifier"; "DBClusterIdentifier" ]
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Filter" (fun i _ -> filter_of_xml i) ())
                 ())
      | "DBClusterEndpointIdentifier" ->
          r_db_cluster_endpoint_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
     filters = ( ! ) r_filters;
     db_cluster_endpoint_identifier = ( ! ) r_db_cluster_endpoint_identifier;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
   }
    : describe_db_cluster_endpoints_message)

let db_cluster_endpoint_of_xml i =
  let r_db_cluster_endpoint_arn = ref None in
  let r_excluded_members = ref None in
  let r_static_members = ref None in
  let r_custom_endpoint_type = ref None in
  let r_endpoint_type = ref None in
  let r_status = ref None in
  let r_endpoint = ref None in
  let r_db_cluster_endpoint_resource_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  let r_db_cluster_endpoint_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBClusterEndpointArn";
      "ExcludedMembers";
      "StaticMembers";
      "CustomEndpointType";
      "EndpointType";
      "Status";
      "Endpoint";
      "DBClusterEndpointResourceIdentifier";
      "DBClusterIdentifier";
      "DBClusterEndpointIdentifier";
    ] (fun tag _ ->
      match tag with
      | "DBClusterEndpointArn" ->
          r_db_cluster_endpoint_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ExcludedMembers" ->
          r_excluded_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludedMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "StaticMembers" ->
          r_static_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StaticMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "CustomEndpointType" ->
          r_custom_endpoint_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomEndpointType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EndpointType" ->
          r_endpoint_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointType" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> string__of_xml i) ())
      | "DBClusterEndpointResourceIdentifier" ->
          r_db_cluster_endpoint_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointResourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterEndpointIdentifier" ->
          r_db_cluster_endpoint_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_endpoint_arn = ( ! ) r_db_cluster_endpoint_arn;
     excluded_members = ( ! ) r_excluded_members;
     static_members = ( ! ) r_static_members;
     custom_endpoint_type = ( ! ) r_custom_endpoint_type;
     endpoint_type = ( ! ) r_endpoint_type;
     status = ( ! ) r_status;
     endpoint = ( ! ) r_endpoint;
     db_cluster_endpoint_resource_identifier = ( ! ) r_db_cluster_endpoint_resource_identifier;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     db_cluster_endpoint_identifier = ( ! ) r_db_cluster_endpoint_identifier;
   }
    : db_cluster_endpoint)

let db_cluster_endpoint_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterEndpointList"
    (fun i _ -> db_cluster_endpoint_of_xml i)
    ()

let db_cluster_endpoint_message_of_xml i =
  let r_db_cluster_endpoints = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterEndpoints"; "Marker" ] (fun tag _ ->
      match tag with
      | "DBClusterEndpoints" ->
          r_db_cluster_endpoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpoints"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBClusterEndpointList"
                     (fun i _ -> db_cluster_endpoint_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_cluster_endpoints = ( ! ) r_db_cluster_endpoints; marker = ( ! ) r_marker }
    : db_cluster_endpoint_message)

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

let delete_db_parameter_group_message_of_xml i =
  let r_db_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBParameterGroupName" ] (fun tag _ ->
      match tag with
      | "DBParameterGroupName" ->
          r_db_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBParameterGroupName" (( ! ) r_db_parameter_group_name) i;
   }
    : delete_db_parameter_group_message)

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
  let r_final_db_snapshot_identifier = ref None in
  let r_skip_final_snapshot = ref None in
  let r_db_instance_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "FinalDBSnapshotIdentifier"; "SkipFinalSnapshot"; "DBInstanceIdentifier" ] (fun tag _ ->
      match tag with
      | "FinalDBSnapshotIdentifier" ->
          r_final_db_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalDBSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SkipFinalSnapshot" ->
          r_skip_final_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipFinalSnapshot"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     final_db_snapshot_identifier = ( ! ) r_final_db_snapshot_identifier;
     skip_final_snapshot = ( ! ) r_skip_final_snapshot;
     db_instance_identifier =
       Smaws_Lib.Xml.Parse.required "DBInstanceIdentifier" (( ! ) r_db_instance_identifier) i;
   }
    : delete_db_instance_message)

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

let delete_db_cluster_message_of_xml i =
  let r_final_db_snapshot_identifier = ref None in
  let r_skip_final_snapshot = ref None in
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "FinalDBSnapshotIdentifier"; "SkipFinalSnapshot"; "DBClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "FinalDBSnapshotIdentifier" ->
          r_final_db_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalDBSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SkipFinalSnapshot" ->
          r_skip_final_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipFinalSnapshot"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     final_db_snapshot_identifier = ( ! ) r_final_db_snapshot_identifier;
     skip_final_snapshot = ( ! ) r_skip_final_snapshot;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
   }
    : delete_db_cluster_message)

let delete_db_cluster_endpoint_output_of_xml i =
  let r_db_cluster_endpoint_arn = ref None in
  let r_excluded_members = ref None in
  let r_static_members = ref None in
  let r_custom_endpoint_type = ref None in
  let r_endpoint_type = ref None in
  let r_status = ref None in
  let r_endpoint = ref None in
  let r_db_cluster_endpoint_resource_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  let r_db_cluster_endpoint_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBClusterEndpointArn";
      "ExcludedMembers";
      "StaticMembers";
      "CustomEndpointType";
      "EndpointType";
      "Status";
      "Endpoint";
      "DBClusterEndpointResourceIdentifier";
      "DBClusterIdentifier";
      "DBClusterEndpointIdentifier";
    ] (fun tag _ ->
      match tag with
      | "DBClusterEndpointArn" ->
          r_db_cluster_endpoint_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ExcludedMembers" ->
          r_excluded_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludedMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "StaticMembers" ->
          r_static_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StaticMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "CustomEndpointType" ->
          r_custom_endpoint_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomEndpointType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EndpointType" ->
          r_endpoint_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointType" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> string__of_xml i) ())
      | "DBClusterEndpointResourceIdentifier" ->
          r_db_cluster_endpoint_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointResourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterEndpointIdentifier" ->
          r_db_cluster_endpoint_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_endpoint_arn = ( ! ) r_db_cluster_endpoint_arn;
     excluded_members = ( ! ) r_excluded_members;
     static_members = ( ! ) r_static_members;
     custom_endpoint_type = ( ! ) r_custom_endpoint_type;
     endpoint_type = ( ! ) r_endpoint_type;
     status = ( ! ) r_status;
     endpoint = ( ! ) r_endpoint;
     db_cluster_endpoint_resource_identifier = ( ! ) r_db_cluster_endpoint_resource_identifier;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     db_cluster_endpoint_identifier = ( ! ) r_db_cluster_endpoint_identifier;
   }
    : delete_db_cluster_endpoint_output)

let delete_db_cluster_endpoint_message_of_xml i =
  let r_db_cluster_endpoint_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBClusterEndpointIdentifier" ] (fun tag _ ->
      match tag with
      | "DBClusterEndpointIdentifier" ->
          r_db_cluster_endpoint_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_endpoint_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterEndpointIdentifier"
         (( ! ) r_db_cluster_endpoint_identifier)
         i;
   }
    : delete_db_cluster_endpoint_message)

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

let db_cluster_role_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : db_cluster_role_quota_exceeded_fault)

let db_cluster_role_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : db_cluster_role_already_exists_fault)

let db_cluster_endpoint_quota_exceeded_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : db_cluster_endpoint_quota_exceeded_fault)

let db_cluster_endpoint_already_exists_fault_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : db_cluster_endpoint_already_exists_fault)

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
  let r_storage_encrypted = ref None in
  let r_tags = ref None in
  let r_database_name = ref None in
  let r_deletion_protection = ref None in
  let r_engine_version = ref None in
  let r_engine = ref None in
  let r_source_db_cluster_identifier = ref None in
  let r_global_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StorageEncrypted";
      "Tags";
      "DatabaseName";
      "DeletionProtection";
      "EngineVersion";
      "Engine";
      "SourceDBClusterIdentifier";
      "GlobalClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName" (fun i _ -> string__of_xml i) ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
      | "SourceDBClusterIdentifier" ->
          r_source_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     storage_encrypted = ( ! ) r_storage_encrypted;
     tags = ( ! ) r_tags;
     database_name = ( ! ) r_database_name;
     deletion_protection = ( ! ) r_deletion_protection;
     engine_version = ( ! ) r_engine_version;
     engine = ( ! ) r_engine;
     source_db_cluster_identifier = ( ! ) r_source_db_cluster_identifier;
     global_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "GlobalClusterIdentifier" (( ! ) r_global_cluster_identifier) i;
   }
    : create_global_cluster_message)

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
  let r_source_ids = ref None in
  let r_event_categories = ref None in
  let r_source_type = ref None in
  let r_sns_topic_arn = ref None in
  let r_subscription_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "Enabled";
      "SourceIds";
      "EventCategories";
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
      | "SourceIds" ->
          r_source_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SourceId" (fun i _ -> string__of_xml i) ())
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
     source_ids = ( ! ) r_source_ids;
     event_categories = ( ! ) r_event_categories;
     source_type = ( ! ) r_source_type;
     sns_topic_arn = Smaws_Lib.Xml.Parse.required "SnsTopicArn" (( ! ) r_sns_topic_arn) i;
     subscription_name =
       Smaws_Lib.Xml.Parse.required "SubscriptionName" (( ! ) r_subscription_name) i;
   }
    : create_event_subscription_message)

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
  let r_tags = ref None in
  let r_subnet_ids = ref None in
  let r_db_subnet_group_description = ref None in
  let r_db_subnet_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "SubnetIds"; "DBSubnetGroupDescription"; "DBSubnetGroupName" ] (fun tag _ ->
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
      | "DBSubnetGroupDescription" ->
          r_db_subnet_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     subnet_ids = Smaws_Lib.Xml.Parse.required "SubnetIds" (( ! ) r_subnet_ids) i;
     db_subnet_group_description =
       Smaws_Lib.Xml.Parse.required "DBSubnetGroupDescription"
         (( ! ) r_db_subnet_group_description)
         i;
     db_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "DBSubnetGroupName" (( ! ) r_db_subnet_group_name) i;
   }
    : create_db_subnet_group_message)

let create_db_parameter_group_result_of_xml i =
  let r_db_parameter_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBParameterGroup" ] (fun tag _ ->
      match tag with
      | "DBParameterGroup" ->
          r_db_parameter_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroup"
                 (fun i _ -> db_parameter_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_parameter_group = ( ! ) r_db_parameter_group } : create_db_parameter_group_result)

let create_db_parameter_group_message_of_xml i =
  let r_tags = ref None in
  let r_description = ref None in
  let r_db_parameter_group_family = ref None in
  let r_db_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "Description"; "DBParameterGroupFamily"; "DBParameterGroupName" ] (fun tag _ ->
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
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBParameterGroupName" ->
          r_db_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     db_parameter_group_family =
       Smaws_Lib.Xml.Parse.required "DBParameterGroupFamily" (( ! ) r_db_parameter_group_family) i;
     db_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBParameterGroupName" (( ! ) r_db_parameter_group_name) i;
   }
    : create_db_parameter_group_message)

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
  let r_deletion_protection = ref None in
  let r_enable_cloudwatch_logs_exports = ref None in
  let r_performance_insights_kms_key_id = ref None in
  let r_enable_performance_insights = ref None in
  let r_enable_iam_database_authentication = ref None in
  let r_timezone = ref None in
  let r_promotion_tier = ref None in
  let r_domain_iam_role_name = ref None in
  let r_monitoring_role_arn = ref None in
  let r_monitoring_interval = ref None in
  let r_copy_tags_to_snapshot = ref None in
  let r_domain = ref None in
  let r_kms_key_id = ref None in
  let r_storage_encrypted = ref None in
  let r_tde_credential_password = ref None in
  let r_tde_credential_arn = ref None in
  let r_storage_type = ref None in
  let r_db_cluster_identifier = ref None in
  let r_tags = ref None in
  let r_publicly_accessible = ref None in
  let r_character_set_name = ref None in
  let r_option_group_name = ref None in
  let r_iops = ref None in
  let r_license_model = ref None in
  let r_auto_minor_version_upgrade = ref None in
  let r_engine_version = ref None in
  let r_multi_a_z = ref None in
  let r_port = ref None in
  let r_preferred_backup_window = ref None in
  let r_backup_retention_period = ref None in
  let r_db_parameter_group_name = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_db_subnet_group_name = ref None in
  let r_availability_zone = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_db_security_groups = ref None in
  let r_master_user_password = ref None in
  let r_master_username = ref None in
  let r_engine = ref None in
  let r_db_instance_class = ref None in
  let r_allocated_storage = ref None in
  let r_db_instance_identifier = ref None in
  let r_db_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DeletionProtection";
      "EnableCloudwatchLogsExports";
      "PerformanceInsightsKMSKeyId";
      "EnablePerformanceInsights";
      "EnableIAMDatabaseAuthentication";
      "Timezone";
      "PromotionTier";
      "DomainIAMRoleName";
      "MonitoringRoleArn";
      "MonitoringInterval";
      "CopyTagsToSnapshot";
      "Domain";
      "KmsKeyId";
      "StorageEncrypted";
      "TdeCredentialPassword";
      "TdeCredentialArn";
      "StorageType";
      "DBClusterIdentifier";
      "Tags";
      "PubliclyAccessible";
      "CharacterSetName";
      "OptionGroupName";
      "Iops";
      "LicenseModel";
      "AutoMinorVersionUpgrade";
      "EngineVersion";
      "MultiAZ";
      "Port";
      "PreferredBackupWindow";
      "BackupRetentionPeriod";
      "DBParameterGroupName";
      "PreferredMaintenanceWindow";
      "DBSubnetGroupName";
      "AvailabilityZone";
      "VpcSecurityGroupIds";
      "DBSecurityGroups";
      "MasterUserPassword";
      "MasterUsername";
      "Engine";
      "DBInstanceClass";
      "AllocatedStorage";
      "DBInstanceIdentifier";
      "DBName";
    ] (fun tag _ ->
      match tag with
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EnableCloudwatchLogsExports" ->
          r_enable_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableCloudwatchLogsExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "PerformanceInsightsKMSKeyId" ->
          r_performance_insights_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PerformanceInsightsKMSKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EnablePerformanceInsights" ->
          r_enable_performance_insights :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnablePerformanceInsights"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EnableIAMDatabaseAuthentication" ->
          r_enable_iam_database_authentication :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableIAMDatabaseAuthentication"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Timezone" ->
          r_timezone :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Timezone" (fun i _ -> string__of_xml i) ())
      | "PromotionTier" ->
          r_promotion_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PromotionTier"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DomainIAMRoleName" ->
          r_domain_iam_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DomainIAMRoleName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MonitoringRoleArn" ->
          r_monitoring_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MonitoringRoleArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MonitoringInterval" ->
          r_monitoring_interval :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MonitoringInterval"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "CopyTagsToSnapshot" ->
          r_copy_tags_to_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTagsToSnapshot"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Domain" ->
          r_domain :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Domain" (fun i _ -> string__of_xml i) ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "TdeCredentialPassword" ->
          r_tde_credential_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TdeCredentialPassword"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | "TdeCredentialArn" ->
          r_tde_credential_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TdeCredentialArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
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
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "CharacterSetName" ->
          r_character_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CharacterSetName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "OptionGroupName" ->
          r_option_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Iops" ->
          r_iops :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Iops" (fun i _ -> integer_optional_of_xml i) ())
      | "LicenseModel" ->
          r_license_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LicenseModel" (fun i _ -> string__of_xml i) ())
      | "AutoMinorVersionUpgrade" ->
          r_auto_minor_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoMinorVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
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
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "DBParameterGroupName" ->
          r_db_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBSubnetGroupName" ->
          r_db_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
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
      | "DBSecurityGroups" ->
          r_db_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DBSecurityGroupName"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "MasterUserPassword" ->
          r_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserPassword"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MasterUsername" ->
          r_master_username :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUsername"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
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
      | "DBInstanceIdentifier" ->
          r_db_instance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBInstanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBName" ->
          r_db_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DBName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deletion_protection = ( ! ) r_deletion_protection;
     enable_cloudwatch_logs_exports = ( ! ) r_enable_cloudwatch_logs_exports;
     performance_insights_kms_key_id = ( ! ) r_performance_insights_kms_key_id;
     enable_performance_insights = ( ! ) r_enable_performance_insights;
     enable_iam_database_authentication = ( ! ) r_enable_iam_database_authentication;
     timezone = ( ! ) r_timezone;
     promotion_tier = ( ! ) r_promotion_tier;
     domain_iam_role_name = ( ! ) r_domain_iam_role_name;
     monitoring_role_arn = ( ! ) r_monitoring_role_arn;
     monitoring_interval = ( ! ) r_monitoring_interval;
     copy_tags_to_snapshot = ( ! ) r_copy_tags_to_snapshot;
     domain = ( ! ) r_domain;
     kms_key_id = ( ! ) r_kms_key_id;
     storage_encrypted = ( ! ) r_storage_encrypted;
     tde_credential_password = ( ! ) r_tde_credential_password;
     tde_credential_arn = ( ! ) r_tde_credential_arn;
     storage_type = ( ! ) r_storage_type;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     tags = ( ! ) r_tags;
     publicly_accessible = ( ! ) r_publicly_accessible;
     character_set_name = ( ! ) r_character_set_name;
     option_group_name = ( ! ) r_option_group_name;
     iops = ( ! ) r_iops;
     license_model = ( ! ) r_license_model;
     auto_minor_version_upgrade = ( ! ) r_auto_minor_version_upgrade;
     engine_version = ( ! ) r_engine_version;
     multi_a_z = ( ! ) r_multi_a_z;
     port = ( ! ) r_port;
     preferred_backup_window = ( ! ) r_preferred_backup_window;
     backup_retention_period = ( ! ) r_backup_retention_period;
     db_parameter_group_name = ( ! ) r_db_parameter_group_name;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     availability_zone = ( ! ) r_availability_zone;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     db_security_groups = ( ! ) r_db_security_groups;
     master_user_password = ( ! ) r_master_user_password;
     master_username = ( ! ) r_master_username;
     engine = Smaws_Lib.Xml.Parse.required "Engine" (( ! ) r_engine) i;
     db_instance_class =
       Smaws_Lib.Xml.Parse.required "DBInstanceClass" (( ! ) r_db_instance_class) i;
     allocated_storage = ( ! ) r_allocated_storage;
     db_instance_identifier =
       Smaws_Lib.Xml.Parse.required "DBInstanceIdentifier" (( ! ) r_db_instance_identifier) i;
     db_name = ( ! ) r_db_name;
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
  let r_tags = ref None in
  let r_db_cluster_identifier = ref None in
  let r_db_cluster_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "DBClusterIdentifier"; "DBClusterSnapshotIdentifier" ] (fun tag _ ->
      match tag with
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
      | "DBClusterSnapshotIdentifier" ->
          r_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     db_cluster_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterSnapshotIdentifier"
         (( ! ) r_db_cluster_snapshot_identifier)
         i;
   }
    : create_db_cluster_snapshot_message)

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
  let r_tags = ref None in
  let r_description = ref None in
  let r_db_parameter_group_family = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "Description"; "DBParameterGroupFamily"; "DBClusterParameterGroupName" ] (fun tag _ ->
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
      | "DBParameterGroupFamily" ->
          r_db_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     db_parameter_group_family =
       Smaws_Lib.Xml.Parse.required "DBParameterGroupFamily" (( ! ) r_db_parameter_group_family) i;
     db_cluster_parameter_group_name =
       Smaws_Lib.Xml.Parse.required "DBClusterParameterGroupName"
         (( ! ) r_db_cluster_parameter_group_name)
         i;
   }
    : create_db_cluster_parameter_group_message)

let create_db_cluster_message_of_xml i =
  let r_network_type = ref None in
  let r_storage_type = ref None in
  let r_global_cluster_identifier = ref None in
  let r_serverless_v2_scaling_configuration = ref None in
  let r_deletion_protection = ref None in
  let r_enable_cloudwatch_logs_exports = ref None in
  let r_enable_iam_database_authentication = ref None in
  let r_pre_signed_url = ref None in
  let r_kms_key_id = ref None in
  let r_storage_encrypted = ref None in
  let r_tags = ref None in
  let r_replication_source_identifier = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_preferred_backup_window = ref None in
  let r_option_group_name = ref None in
  let r_master_user_password = ref None in
  let r_master_username = ref None in
  let r_port = ref None in
  let r_engine_version = ref None in
  let r_engine = ref None in
  let r_db_subnet_group_name = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_db_cluster_parameter_group_name = ref None in
  let r_db_cluster_identifier = ref None in
  let r_database_name = ref None in
  let r_copy_tags_to_snapshot = ref None in
  let r_character_set_name = ref None in
  let r_backup_retention_period = ref None in
  let r_availability_zones = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NetworkType";
      "StorageType";
      "GlobalClusterIdentifier";
      "ServerlessV2ScalingConfiguration";
      "DeletionProtection";
      "EnableCloudwatchLogsExports";
      "EnableIAMDatabaseAuthentication";
      "PreSignedUrl";
      "KmsKeyId";
      "StorageEncrypted";
      "Tags";
      "ReplicationSourceIdentifier";
      "PreferredMaintenanceWindow";
      "PreferredBackupWindow";
      "OptionGroupName";
      "MasterUserPassword";
      "MasterUsername";
      "Port";
      "EngineVersion";
      "Engine";
      "DBSubnetGroupName";
      "VpcSecurityGroupIds";
      "DBClusterParameterGroupName";
      "DBClusterIdentifier";
      "DatabaseName";
      "CopyTagsToSnapshot";
      "CharacterSetName";
      "BackupRetentionPeriod";
      "AvailabilityZones";
    ] (fun tag _ ->
      match tag with
      | "NetworkType" ->
          r_network_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkType" (fun i _ -> string__of_xml i) ())
      | "StorageType" ->
          r_storage_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageType" (fun i _ -> string__of_xml i) ())
      | "GlobalClusterIdentifier" ->
          r_global_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GlobalClusterIdentifier"
                 (fun i _ -> global_cluster_identifier_of_xml i)
                 ())
      | "ServerlessV2ScalingConfiguration" ->
          r_serverless_v2_scaling_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessV2ScalingConfiguration"
                 (fun i _ -> serverless_v2_scaling_configuration_of_xml i)
                 ())
      | "DeletionProtection" ->
          r_deletion_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionProtection"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EnableCloudwatchLogsExports" ->
          r_enable_cloudwatch_logs_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableCloudwatchLogsExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "EnableIAMDatabaseAuthentication" ->
          r_enable_iam_database_authentication :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableIAMDatabaseAuthentication"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PreSignedUrl" ->
          r_pre_signed_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreSignedUrl" (fun i _ -> string__of_xml i) ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "StorageEncrypted" ->
          r_storage_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StorageEncrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ReplicationSourceIdentifier" ->
          r_replication_source_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReplicationSourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PreferredBackupWindow" ->
          r_preferred_backup_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredBackupWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "OptionGroupName" ->
          r_option_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MasterUserPassword" ->
          r_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserPassword"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MasterUsername" ->
          r_master_username :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUsername"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "EngineVersion" ->
          r_engine_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineVersion" (fun i _ -> string__of_xml i) ())
      | "Engine" ->
          r_engine :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Engine" (fun i _ -> string__of_xml i) ())
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
      | "DBClusterParameterGroupName" ->
          r_db_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName" (fun i _ -> string__of_xml i) ())
      | "CopyTagsToSnapshot" ->
          r_copy_tags_to_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTagsToSnapshot"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "CharacterSetName" ->
          r_character_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CharacterSetName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "BackupRetentionPeriod" ->
          r_backup_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     network_type = ( ! ) r_network_type;
     storage_type = ( ! ) r_storage_type;
     global_cluster_identifier = ( ! ) r_global_cluster_identifier;
     serverless_v2_scaling_configuration = ( ! ) r_serverless_v2_scaling_configuration;
     deletion_protection = ( ! ) r_deletion_protection;
     enable_cloudwatch_logs_exports = ( ! ) r_enable_cloudwatch_logs_exports;
     enable_iam_database_authentication = ( ! ) r_enable_iam_database_authentication;
     pre_signed_url = ( ! ) r_pre_signed_url;
     kms_key_id = ( ! ) r_kms_key_id;
     storage_encrypted = ( ! ) r_storage_encrypted;
     tags = ( ! ) r_tags;
     replication_source_identifier = ( ! ) r_replication_source_identifier;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     preferred_backup_window = ( ! ) r_preferred_backup_window;
     option_group_name = ( ! ) r_option_group_name;
     master_user_password = ( ! ) r_master_user_password;
     master_username = ( ! ) r_master_username;
     port = ( ! ) r_port;
     engine_version = ( ! ) r_engine_version;
     engine = Smaws_Lib.Xml.Parse.required "Engine" (( ! ) r_engine) i;
     db_subnet_group_name = ( ! ) r_db_subnet_group_name;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     db_cluster_parameter_group_name = ( ! ) r_db_cluster_parameter_group_name;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
     database_name = ( ! ) r_database_name;
     copy_tags_to_snapshot = ( ! ) r_copy_tags_to_snapshot;
     character_set_name = ( ! ) r_character_set_name;
     backup_retention_period = ( ! ) r_backup_retention_period;
     availability_zones = ( ! ) r_availability_zones;
   }
    : create_db_cluster_message)

let create_db_cluster_endpoint_output_of_xml i =
  let r_db_cluster_endpoint_arn = ref None in
  let r_excluded_members = ref None in
  let r_static_members = ref None in
  let r_custom_endpoint_type = ref None in
  let r_endpoint_type = ref None in
  let r_status = ref None in
  let r_endpoint = ref None in
  let r_db_cluster_endpoint_resource_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  let r_db_cluster_endpoint_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBClusterEndpointArn";
      "ExcludedMembers";
      "StaticMembers";
      "CustomEndpointType";
      "EndpointType";
      "Status";
      "Endpoint";
      "DBClusterEndpointResourceIdentifier";
      "DBClusterIdentifier";
      "DBClusterEndpointIdentifier";
    ] (fun tag _ ->
      match tag with
      | "DBClusterEndpointArn" ->
          r_db_cluster_endpoint_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ExcludedMembers" ->
          r_excluded_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludedMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "StaticMembers" ->
          r_static_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StaticMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "CustomEndpointType" ->
          r_custom_endpoint_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomEndpointType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EndpointType" ->
          r_endpoint_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointType" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> string__of_xml i) ())
      | "DBClusterEndpointResourceIdentifier" ->
          r_db_cluster_endpoint_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointResourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterEndpointIdentifier" ->
          r_db_cluster_endpoint_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_cluster_endpoint_arn = ( ! ) r_db_cluster_endpoint_arn;
     excluded_members = ( ! ) r_excluded_members;
     static_members = ( ! ) r_static_members;
     custom_endpoint_type = ( ! ) r_custom_endpoint_type;
     endpoint_type = ( ! ) r_endpoint_type;
     status = ( ! ) r_status;
     endpoint = ( ! ) r_endpoint;
     db_cluster_endpoint_resource_identifier = ( ! ) r_db_cluster_endpoint_resource_identifier;
     db_cluster_identifier = ( ! ) r_db_cluster_identifier;
     db_cluster_endpoint_identifier = ( ! ) r_db_cluster_endpoint_identifier;
   }
    : create_db_cluster_endpoint_output)

let create_db_cluster_endpoint_message_of_xml i =
  let r_tags = ref None in
  let r_excluded_members = ref None in
  let r_static_members = ref None in
  let r_endpoint_type = ref None in
  let r_db_cluster_endpoint_identifier = ref None in
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "ExcludedMembers";
      "StaticMembers";
      "EndpointType";
      "DBClusterEndpointIdentifier";
      "DBClusterIdentifier";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ExcludedMembers" ->
          r_excluded_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExcludedMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "StaticMembers" ->
          r_static_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StaticMembers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "EndpointType" ->
          r_endpoint_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointType" (fun i _ -> string__of_xml i) ())
      | "DBClusterEndpointIdentifier" ->
          r_db_cluster_endpoint_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterEndpointIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     excluded_members = ( ! ) r_excluded_members;
     static_members = ( ! ) r_static_members;
     endpoint_type = Smaws_Lib.Xml.Parse.required "EndpointType" (( ! ) r_endpoint_type) i;
     db_cluster_endpoint_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterEndpointIdentifier"
         (( ! ) r_db_cluster_endpoint_identifier)
         i;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
   }
    : create_db_cluster_endpoint_message)

let copy_db_parameter_group_result_of_xml i =
  let r_db_parameter_group = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DBParameterGroup" ] (fun tag _ ->
      match tag with
      | "DBParameterGroup" ->
          r_db_parameter_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBParameterGroup"
                 (fun i _ -> db_parameter_group_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_parameter_group = ( ! ) r_db_parameter_group } : copy_db_parameter_group_result)

let copy_db_parameter_group_message_of_xml i =
  let r_tags = ref None in
  let r_target_db_parameter_group_description = ref None in
  let r_target_db_parameter_group_identifier = ref None in
  let r_source_db_parameter_group_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "TargetDBParameterGroupDescription";
      "TargetDBParameterGroupIdentifier";
      "SourceDBParameterGroupIdentifier";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "TargetDBParameterGroupDescription" ->
          r_target_db_parameter_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDBParameterGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetDBParameterGroupIdentifier" ->
          r_target_db_parameter_group_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDBParameterGroupIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceDBParameterGroupIdentifier" ->
          r_source_db_parameter_group_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDBParameterGroupIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     target_db_parameter_group_description =
       Smaws_Lib.Xml.Parse.required "TargetDBParameterGroupDescription"
         (( ! ) r_target_db_parameter_group_description)
         i;
     target_db_parameter_group_identifier =
       Smaws_Lib.Xml.Parse.required "TargetDBParameterGroupIdentifier"
         (( ! ) r_target_db_parameter_group_identifier)
         i;
     source_db_parameter_group_identifier =
       Smaws_Lib.Xml.Parse.required "SourceDBParameterGroupIdentifier"
         (( ! ) r_source_db_parameter_group_identifier)
         i;
   }
    : copy_db_parameter_group_message)

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
  let r_tags = ref None in
  let r_copy_tags = ref None in
  let r_pre_signed_url = ref None in
  let r_kms_key_id = ref None in
  let r_target_db_cluster_snapshot_identifier = ref None in
  let r_source_db_cluster_snapshot_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "CopyTags";
      "PreSignedUrl";
      "KmsKeyId";
      "TargetDBClusterSnapshotIdentifier";
      "SourceDBClusterSnapshotIdentifier";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "CopyTags" ->
          r_copy_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CopyTags"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "PreSignedUrl" ->
          r_pre_signed_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreSignedUrl" (fun i _ -> string__of_xml i) ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "TargetDBClusterSnapshotIdentifier" ->
          r_target_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceDBClusterSnapshotIdentifier" ->
          r_source_db_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDBClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     copy_tags = ( ! ) r_copy_tags;
     pre_signed_url = ( ! ) r_pre_signed_url;
     kms_key_id = ( ! ) r_kms_key_id;
     target_db_cluster_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "TargetDBClusterSnapshotIdentifier"
         (( ! ) r_target_db_cluster_snapshot_identifier)
         i;
     source_db_cluster_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SourceDBClusterSnapshotIdentifier"
         (( ! ) r_source_db_cluster_snapshot_identifier)
         i;
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
  let r_tags = ref None in
  let r_target_db_cluster_parameter_group_description = ref None in
  let r_target_db_cluster_parameter_group_identifier = ref None in
  let r_source_db_cluster_parameter_group_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "TargetDBClusterParameterGroupDescription";
      "TargetDBClusterParameterGroupIdentifier";
      "SourceDBClusterParameterGroupIdentifier";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "TargetDBClusterParameterGroupDescription" ->
          r_target_db_cluster_parameter_group_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDBClusterParameterGroupDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetDBClusterParameterGroupIdentifier" ->
          r_target_db_cluster_parameter_group_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDBClusterParameterGroupIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceDBClusterParameterGroupIdentifier" ->
          r_source_db_cluster_parameter_group_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDBClusterParameterGroupIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     target_db_cluster_parameter_group_description =
       Smaws_Lib.Xml.Parse.required "TargetDBClusterParameterGroupDescription"
         (( ! ) r_target_db_cluster_parameter_group_description)
         i;
     target_db_cluster_parameter_group_identifier =
       Smaws_Lib.Xml.Parse.required "TargetDBClusterParameterGroupIdentifier"
         (( ! ) r_target_db_cluster_parameter_group_identifier)
         i;
     source_db_cluster_parameter_group_identifier =
       Smaws_Lib.Xml.Parse.required "SourceDBClusterParameterGroupIdentifier"
         (( ! ) r_source_db_cluster_parameter_group_identifier)
         i;
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
  let r_opt_in_type = ref None in
  let r_apply_action = ref None in
  let r_resource_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OptInType"; "ApplyAction"; "ResourceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "OptInType" ->
          r_opt_in_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "OptInType" (fun i _ -> string__of_xml i) ())
      | "ApplyAction" ->
          r_apply_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyAction" (fun i _ -> string__of_xml i) ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     opt_in_type = Smaws_Lib.Xml.Parse.required "OptInType" (( ! ) r_opt_in_type) i;
     apply_action = Smaws_Lib.Xml.Parse.required "ApplyAction" (( ! ) r_apply_action) i;
     resource_identifier =
       Smaws_Lib.Xml.Parse.required "ResourceIdentifier" (( ! ) r_resource_identifier) i;
   }
    : apply_pending_maintenance_action_message)

let add_tags_to_resource_message_of_xml i =
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
    : add_tags_to_resource_message)

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
  let r_source_identifier = ref None in
  let r_subscription_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SourceIdentifier"; "SubscriptionName" ]
    (fun tag _ ->
      match tag with
      | "SourceIdentifier" ->
          r_source_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_identifier =
       Smaws_Lib.Xml.Parse.required "SourceIdentifier" (( ! ) r_source_identifier) i;
     subscription_name =
       Smaws_Lib.Xml.Parse.required "SubscriptionName" (( ! ) r_subscription_name) i;
   }
    : add_source_identifier_to_subscription_message)

let add_role_to_db_cluster_message_of_xml i =
  let r_feature_name = ref None in
  let r_role_arn = ref None in
  let r_db_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FeatureName"; "RoleArn"; "DBClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "FeatureName" ->
          r_feature_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FeatureName" (fun i _ -> string__of_xml i) ())
      | "RoleArn" ->
          r_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleArn" (fun i _ -> string__of_xml i) ())
      | "DBClusterIdentifier" ->
          r_db_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DBClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     feature_name = ( ! ) r_feature_name;
     role_arn = Smaws_Lib.Xml.Parse.required "RoleArn" (( ! ) r_role_arn) i;
     db_cluster_identifier =
       Smaws_Lib.Xml.Parse.required "DBClusterIdentifier" (( ! ) r_db_cluster_identifier) i;
   }
    : add_role_to_db_cluster_message)
