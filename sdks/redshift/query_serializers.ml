open Types

let exception_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let unsupported_operation_fault_to_query path (x : unsupported_operation_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let reserved_node_offering_not_found_fault_to_query path
    (x : reserved_node_offering_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let reserved_node_not_found_fault_to_query path (x : reserved_node_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let reserved_node_already_migrated_fault_to_query path (x : reserved_node_already_migrated_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let reserved_node_already_exists_fault_to_query path (x : reserved_node_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_reserved_node_state_fault_to_query path (x : invalid_reserved_node_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let dependent_service_unavailable_fault_to_query path (x : dependent_service_unavailable_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let reserved_node_offering_type_to_query path (x : reserved_node_offering_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Regular -> "Regular" | Upgradable -> "Upgradable")

let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let double_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let recurring_charge_to_query path (x : recurring_charge) =
  List.concat
    [
      (match x.recurring_charge_amount with
      | None -> []
      | Some v -> double_to_query (List.append path [ "RecurringChargeAmount" ]) v);
      (match x.recurring_charge_frequency with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RecurringChargeFrequency" ]) v);
    ]

let recurring_charge_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "RecurringCharge" recurring_charge_to_query
    path xs

let integer_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let t_stamp_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let reserved_node_to_query path (x : reserved_node) =
  List.concat
    [
      (match x.reserved_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedNodeId" ]) v);
      (match x.reserved_node_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedNodeOfferingId" ]) v);
      (match x.node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeType" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "Duration" ]) v);
      (match x.fixed_price with
      | None -> []
      | Some v -> double_to_query (List.append path [ "FixedPrice" ]) v);
      (match x.usage_price with
      | None -> []
      | Some v -> double_to_query (List.append path [ "UsagePrice" ]) v);
      (match x.currency_code with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CurrencyCode" ]) v);
      (match x.node_count with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "NodeCount" ]) v);
      (match x.state with
      | None -> []
      | Some v -> string__to_query (List.append path [ "State" ]) v);
      (match x.offering_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OfferingType" ]) v);
      (match x.recurring_charges with
      | None -> []
      | Some v -> recurring_charge_list_to_query (List.append path [ "RecurringCharges" ]) v);
      (match x.reserved_node_offering_type with
      | None -> []
      | Some v ->
          reserved_node_offering_type_to_query (List.append path [ "ReservedNodeOfferingType" ]) v);
    ]

let accept_reserved_node_exchange_output_message_to_query path
    (x : accept_reserved_node_exchange_output_message) =
  List.concat
    [
      (match x.exchanged_reserved_node with
      | None -> []
      | Some v -> reserved_node_to_query (List.append path [ "ExchangedReservedNode" ]) v);
    ]

let accept_reserved_node_exchange_input_message_to_query path
    (x : accept_reserved_node_exchange_input_message) =
  List.concat
    [
      string__to_query (List.append path [ "ReservedNodeId" ]) x.reserved_node_id;
      string__to_query
        (List.append path [ "TargetReservedNodeOfferingId" ])
        x.target_reserved_node_offering_id;
    ]

let access_to_cluster_denied_fault_to_query path (x : access_to_cluster_denied_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let access_to_snapshot_denied_fault_to_query path (x : access_to_snapshot_denied_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let attribute_value_target_to_query path (x : attribute_value_target) =
  List.concat
    [
      (match x.attribute_value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AttributeValue" ]) v);
    ]

let attribute_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AttributeValueTarget"
    attribute_value_target_to_query path xs

let account_attribute_to_query path (x : account_attribute) =
  List.concat
    [
      (match x.attribute_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AttributeName" ]) v);
      (match x.attribute_values with
      | None -> []
      | Some v -> attribute_value_list_to_query (List.append path [ "AttributeValues" ]) v);
    ]

let attribute_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AccountAttribute" account_attribute_to_query
    path xs

let account_attribute_list_to_query path (x : account_attribute_list) =
  List.concat
    [
      (match x.account_attributes with
      | None -> []
      | Some v -> attribute_list_to_query (List.append path [ "AccountAttributes" ]) v);
    ]

let account_with_restore_access_to_query path (x : account_with_restore_access) =
  List.concat
    [
      (match x.account_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AccountId" ]) v);
      (match x.account_alias with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AccountAlias" ]) v);
    ]

let accounts_with_restore_access_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AccountWithRestoreAccess"
    account_with_restore_access_to_query path xs

let action_type_to_query path (x : action_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | RESTORE_CLUSTER -> "restore-cluster"
    | RECOMMEND_NODE_CONFIG -> "recommend-node-config"
    | RESIZE_CLUSTER -> "resize-cluster")

let unauthorized_partner_integration_fault_to_query path
    (x : unauthorized_partner_integration_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let partner_not_found_fault_to_query path (x : partner_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_not_found_fault_to_query path (x : cluster_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let partner_integration_partner_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let partner_integration_database_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let partner_integration_output_message_to_query path (x : partner_integration_output_message) =
  List.concat
    [
      (match x.database_name with
      | None -> []
      | Some v -> partner_integration_database_name_to_query (List.append path [ "DatabaseName" ]) v);
      (match x.partner_name with
      | None -> []
      | Some v -> partner_integration_partner_name_to_query (List.append path [ "PartnerName" ]) v);
    ]

let partner_integration_cluster_identifier_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let partner_integration_account_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let partner_integration_input_message_to_query path (x : partner_integration_input_message) =
  List.concat
    [
      partner_integration_account_id_to_query (List.append path [ "AccountId" ]) x.account_id;
      partner_integration_cluster_identifier_to_query
        (List.append path [ "ClusterIdentifier" ])
        x.cluster_identifier;
      partner_integration_database_name_to_query
        (List.append path [ "DatabaseName" ])
        x.database_name;
      partner_integration_partner_name_to_query (List.append path [ "PartnerName" ]) x.partner_name;
    ]

let application_type_to_query path (x : application_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with NONE -> "None" | LAKEHOUSE -> "Lakehouse")

let aqua_configuration_status_to_query path (x : aqua_configuration_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ENABLED -> "enabled" | DISABLED -> "disabled" | AUTO -> "auto")

let aqua_status_to_query path (x : aqua_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ENABLED -> "enabled" | DISABLED -> "disabled" | APPLYING -> "applying")

let aqua_configuration_to_query path (x : aqua_configuration) =
  List.concat
    [
      (match x.aqua_status with
      | None -> []
      | Some v -> aqua_status_to_query (List.append path [ "AquaStatus" ]) v);
      (match x.aqua_configuration_status with
      | None -> []
      | Some v ->
          aqua_configuration_status_to_query (List.append path [ "AquaConfigurationStatus" ]) v);
    ]

let invalid_namespace_fault_to_query path (x : invalid_namespace_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_data_share_fault_to_query path (x : invalid_data_share_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let data_share_type_to_query path (x : data_share_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with INTERNAL -> "INTERNAL")

let boolean_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let data_share_status_to_query path (x : data_share_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ACTIVE -> "ACTIVE"
    | PENDING_AUTHORIZATION -> "PENDING_AUTHORIZATION"
    | AUTHORIZED -> "AUTHORIZED"
    | DEAUTHORIZED -> "DEAUTHORIZED"
    | REJECTED -> "REJECTED"
    | AVAILABLE -> "AVAILABLE")

let data_share_association_to_query path (x : data_share_association) =
  List.concat
    [
      (match x.consumer_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ConsumerIdentifier" ]) v);
      (match x.status with
      | None -> []
      | Some v -> data_share_status_to_query (List.append path [ "Status" ]) v);
      (match x.consumer_region with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ConsumerRegion" ]) v);
      (match x.created_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreatedDate" ]) v);
      (match x.status_change_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StatusChangeDate" ]) v);
      (match x.producer_allowed_writes with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ProducerAllowedWrites" ]) v);
      (match x.consumer_accepted_writes with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ConsumerAcceptedWrites" ]) v);
    ]

let data_share_association_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" data_share_association_to_query path
    xs

let boolean__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let data_share_to_query path (x : data_share) =
  List.concat
    [
      (match x.data_share_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DataShareArn" ]) v);
      (match x.producer_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ProducerArn" ]) v);
      (match x.allow_publicly_accessible_consumers with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AllowPubliclyAccessibleConsumers" ]) v);
      (match x.data_share_associations with
      | None -> []
      | Some v ->
          data_share_association_list_to_query (List.append path [ "DataShareAssociations" ]) v);
      (match x.managed_by with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ManagedBy" ]) v);
      (match x.data_share_type with
      | None -> []
      | Some v -> data_share_type_to_query (List.append path [ "DataShareType" ]) v);
    ]

let associate_data_share_consumer_message_to_query path (x : associate_data_share_consumer_message)
    =
  List.concat
    [
      string__to_query (List.append path [ "DataShareArn" ]) x.data_share_arn;
      (match x.associate_entire_account with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AssociateEntireAccount" ]) v);
      (match x.consumer_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ConsumerArn" ]) v);
      (match x.consumer_region with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ConsumerRegion" ]) v);
      (match x.allow_writes with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AllowWrites" ]) v);
    ]

let schedule_state_to_query path (x : schedule_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with MODIFYING -> "MODIFYING" | ACTIVE -> "ACTIVE" | FAILED -> "FAILED")

let cluster_associated_to_schedule_to_query path (x : cluster_associated_to_schedule) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.schedule_association_state with
      | None -> []
      | Some v -> schedule_state_to_query (List.append path [ "ScheduleAssociationState" ]) v);
    ]

let associated_cluster_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterAssociatedToSchedule"
    cluster_associated_to_schedule_to_query path xs

let certificate_association_to_query path (x : certificate_association) =
  List.concat
    [
      (match x.custom_domain_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomDomainName" ]) v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
    ]

let certificate_association_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CertificateAssociation"
    certificate_association_to_query path xs

let association_to_query path (x : association) =
  List.concat
    [
      (match x.custom_domain_certificate_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomDomainCertificateArn" ]) v);
      (match x.custom_domain_certificate_expiry_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CustomDomainCertificateExpiryDate" ]) v);
      (match x.certificate_associations with
      | None -> []
      | Some v ->
          certificate_association_list_to_query (List.append path [ "CertificateAssociations" ]) v);
    ]

let association_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Association" association_to_query path xs

let attribute_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AttributeName" string__to_query path xs

let authentication_profile_name_string_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let authentication_profile_to_query path (x : authentication_profile) =
  List.concat
    [
      (match x.authentication_profile_name with
      | None -> []
      | Some v ->
          authentication_profile_name_string_to_query
            (List.append path [ "AuthenticationProfileName" ])
            v);
      (match x.authentication_profile_content with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AuthenticationProfileContent" ]) v);
    ]

let authentication_profile_already_exists_fault_to_query path
    (x : authentication_profile_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let authentication_profile_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" authentication_profile_to_query path
    xs

let authentication_profile_not_found_fault_to_query path
    (x : authentication_profile_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let authentication_profile_quota_exceeded_fault_to_query path
    (x : authentication_profile_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let authorization_already_exists_fault_to_query path (x : authorization_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let authorization_not_found_fault_to_query path (x : authorization_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let authorization_quota_exceeded_fault_to_query path (x : authorization_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let authorization_status_to_query path (x : authorization_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with AUTHORIZED -> "Authorized" | REVOKING -> "Revoking")

let invalid_cluster_security_group_state_fault_to_query path
    (x : invalid_cluster_security_group_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_security_group_not_found_fault_to_query path
    (x : cluster_security_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let tag_to_query path (x : tag) =
  List.concat
    [
      (match x.key with None -> [] | Some v -> string__to_query (List.append path [ "Key" ]) v);
      (match x.value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Value" ]) v);
    ]

let tag_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Tag" tag_to_query path xs

let ip_range_to_query path (x : ip_range) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.cidri_p with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CIDRIP" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let ip_range_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "IPRange" ip_range_to_query path xs

let ec2_security_group_to_query path (x : ec2_security_group) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.ec2_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupName" ]) v);
      (match x.ec2_security_group_owner_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupOwnerId" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let ec2_security_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "EC2SecurityGroup"
    ec2_security_group_to_query path xs

let cluster_security_group_to_query path (x : cluster_security_group) =
  List.concat
    [
      (match x.cluster_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterSecurityGroupName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.ec2_security_groups with
      | None -> []
      | Some v -> ec2_security_group_list_to_query (List.append path [ "EC2SecurityGroups" ]) v);
      (match x.ip_ranges with
      | None -> []
      | Some v -> ip_range_list_to_query (List.append path [ "IPRanges" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let authorize_cluster_security_group_ingress_result_to_query path
    (x : authorize_cluster_security_group_ingress_result) =
  List.concat
    [
      (match x.cluster_security_group with
      | None -> []
      | Some v -> cluster_security_group_to_query (List.append path [ "ClusterSecurityGroup" ]) v);
    ]

let authorize_cluster_security_group_ingress_message_to_query path
    (x : authorize_cluster_security_group_ingress_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "ClusterSecurityGroupName" ])
        x.cluster_security_group_name;
      (match x.cidri_p with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CIDRIP" ]) v);
      (match x.ec2_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupName" ]) v);
      (match x.ec2_security_group_owner_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupOwnerId" ]) v);
    ]

let authorize_data_share_message_to_query path (x : authorize_data_share_message) =
  List.concat
    [
      string__to_query (List.append path [ "DataShareArn" ]) x.data_share_arn;
      string__to_query (List.append path [ "ConsumerIdentifier" ]) x.consumer_identifier;
      (match x.allow_writes with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AllowWrites" ]) v);
    ]

let invalid_cluster_state_fault_to_query path (x : invalid_cluster_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_authorization_state_fault_to_query path (x : invalid_authorization_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let endpoint_authorizations_per_cluster_limit_exceeded_fault_to_query path
    (x : endpoint_authorizations_per_cluster_limit_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let endpoint_authorization_already_exists_fault_to_query path
    (x : endpoint_authorization_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let vpc_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "VpcIdentifier" string__to_query path xs

let endpoint_authorization_to_query path (x : endpoint_authorization) =
  List.concat
    [
      (match x.grantor with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Grantor" ]) v);
      (match x.grantee with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Grantee" ]) v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.authorize_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "AuthorizeTime" ]) v);
      (match x.cluster_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterStatus" ]) v);
      (match x.status with
      | None -> []
      | Some v -> authorization_status_to_query (List.append path [ "Status" ]) v);
      (match x.allowed_all_vp_cs with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AllowedAllVPCs" ]) v);
      (match x.allowed_vp_cs with
      | None -> []
      | Some v -> vpc_identifier_list_to_query (List.append path [ "AllowedVPCs" ]) v);
      (match x.endpoint_count with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "EndpointCount" ]) v);
    ]

let authorize_endpoint_access_message_to_query path (x : authorize_endpoint_access_message) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      string__to_query (List.append path [ "Account" ]) x.account;
      (match x.vpc_ids with
      | None -> []
      | Some v -> vpc_identifier_list_to_query (List.append path [ "VpcIds" ]) v);
    ]

let limit_exceeded_fault_to_query path (x : limit_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_cluster_snapshot_state_fault_to_query path (x : invalid_cluster_snapshot_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let dependent_service_request_throttling_fault_to_query path
    (x : dependent_service_request_throttling_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_snapshot_not_found_fault_to_query path (x : cluster_snapshot_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integer_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let restorable_node_type_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NodeType" string__to_query path xs

let long_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let snapshot_to_query path (x : snapshot) =
  List.concat
    [
      (match x.snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotIdentifier" ]) v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.snapshot_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "SnapshotCreateTime" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.cluster_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ClusterCreateTime" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.cluster_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterVersion" ]) v);
      (match x.engine_full_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineFullVersion" ]) v);
      (match x.snapshot_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotType" ]) v);
      (match x.node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeType" ]) v);
      (match x.number_of_nodes with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "NumberOfNodes" ]) v);
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBName" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Encrypted" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.encrypted_with_hs_m with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "EncryptedWithHSM" ]) v);
      (match x.accounts_with_restore_access with
      | None -> []
      | Some v ->
          accounts_with_restore_access_list_to_query
            (List.append path [ "AccountsWithRestoreAccess" ])
            v);
      (match x.owner_account with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OwnerAccount" ]) v);
      (match x.total_backup_size_in_mega_bytes with
      | None -> []
      | Some v -> double_to_query (List.append path [ "TotalBackupSizeInMegaBytes" ]) v);
      (match x.actual_incremental_backup_size_in_mega_bytes with
      | None -> []
      | Some v -> double_to_query (List.append path [ "ActualIncrementalBackupSizeInMegaBytes" ]) v);
      (match x.backup_progress_in_mega_bytes with
      | None -> []
      | Some v -> double_to_query (List.append path [ "BackupProgressInMegaBytes" ]) v);
      (match x.current_backup_rate_in_mega_bytes_per_second with
      | None -> []
      | Some v -> double_to_query (List.append path [ "CurrentBackupRateInMegaBytesPerSecond" ]) v);
      (match x.estimated_seconds_to_completion with
      | None -> []
      | Some v -> long_to_query (List.append path [ "EstimatedSecondsToCompletion" ]) v);
      (match x.elapsed_time_in_seconds with
      | None -> []
      | Some v -> long_to_query (List.append path [ "ElapsedTimeInSeconds" ]) v);
      (match x.source_region with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceRegion" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.restorable_node_types with
      | None -> []
      | Some v -> restorable_node_type_list_to_query (List.append path [ "RestorableNodeTypes" ]) v);
      (match x.enhanced_vpc_routing with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "EnhancedVpcRouting" ]) v);
      (match x.maintenance_track_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MaintenanceTrackName" ]) v);
      (match x.manual_snapshot_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ManualSnapshotRetentionPeriod" ]) v);
      (match x.manual_snapshot_remaining_days with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ManualSnapshotRemainingDays" ]) v);
      (match x.snapshot_retention_start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "SnapshotRetentionStartTime" ]) v);
      (match x.master_password_secret_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterPasswordSecretArn" ]) v);
      (match x.master_password_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterPasswordSecretKmsKeyId" ]) v);
      (match x.snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotArn" ]) v);
    ]

let authorize_snapshot_access_result_to_query path (x : authorize_snapshot_access_result) =
  List.concat
    [
      (match x.snapshot with
      | None -> []
      | Some v -> snapshot_to_query (List.append path [ "Snapshot" ]) v);
    ]

let authorize_snapshot_access_message_to_query path (x : authorize_snapshot_access_message) =
  List.concat
    [
      (match x.snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotIdentifier" ]) v);
      (match x.snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotArn" ]) v);
      (match x.snapshot_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotClusterIdentifier" ]) v);
      string__to_query
        (List.append path [ "AccountWithRestoreAccess" ])
        x.account_with_restore_access;
    ]

let authorized_audience_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let authorized_token_issuer_to_query path (x : authorized_token_issuer) =
  List.concat
    [
      (match x.trusted_token_issuer_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TrustedTokenIssuerArn" ]) v);
      (match x.authorized_audiences_list with
      | None -> []
      | Some v ->
          authorized_audience_list_to_query (List.append path [ "AuthorizedAudiencesList" ]) v);
    ]

let authorized_token_issuer_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" authorized_token_issuer_to_query
    path xs

let supported_platform_to_query path (x : supported_platform) =
  List.concat
    [
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
    ]

let supported_platforms_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SupportedPlatform"
    supported_platform_to_query path xs

let availability_zone_to_query path (x : availability_zone) =
  List.concat
    [
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
      (match x.supported_platforms with
      | None -> []
      | Some v -> supported_platforms_list_to_query (List.append path [ "SupportedPlatforms" ]) v);
    ]

let availability_zone_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AvailabilityZone" availability_zone_to_query
    path xs

let batch_delete_request_size_exceeded_fault_to_query path
    (x : batch_delete_request_size_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let snapshot_error_message_to_query path (x : snapshot_error_message) =
  List.concat
    [
      (match x.snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotIdentifier" ]) v);
      (match x.snapshot_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotClusterIdentifier" ]) v);
      (match x.failure_code with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FailureCode" ]) v);
      (match x.failure_reason with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FailureReason" ]) v);
    ]

let batch_snapshot_operation_error_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SnapshotErrorMessage"
    snapshot_error_message_to_query path xs

let snapshot_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "String" string__to_query path xs

let batch_delete_cluster_snapshots_result_to_query path (x : batch_delete_cluster_snapshots_result)
    =
  List.concat
    [
      (match x.resources with
      | None -> []
      | Some v -> snapshot_identifier_list_to_query (List.append path [ "Resources" ]) v);
      (match x.errors with
      | None -> []
      | Some v -> batch_snapshot_operation_error_list_to_query (List.append path [ "Errors" ]) v);
    ]

let delete_cluster_snapshot_message_to_query path (x : delete_cluster_snapshot_message) =
  List.concat
    [
      string__to_query (List.append path [ "SnapshotIdentifier" ]) x.snapshot_identifier;
      (match x.snapshot_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotClusterIdentifier" ]) v);
    ]

let delete_cluster_snapshot_message_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DeleteClusterSnapshotMessage"
    delete_cluster_snapshot_message_to_query path xs

let batch_delete_cluster_snapshots_request_to_query path
    (x : batch_delete_cluster_snapshots_request) =
  List.concat
    [
      delete_cluster_snapshot_message_list_to_query
        (List.append path [ "Identifiers" ])
        x.identifiers;
    ]

let invalid_retention_period_fault_to_query path (x : invalid_retention_period_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let batch_modify_cluster_snapshots_limit_exceeded_fault_to_query path
    (x : batch_modify_cluster_snapshots_limit_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let batch_snapshot_operation_errors_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SnapshotErrorMessage"
    snapshot_error_message_to_query path xs

let batch_modify_cluster_snapshots_output_message_to_query path
    (x : batch_modify_cluster_snapshots_output_message) =
  List.concat
    [
      (match x.resources with
      | None -> []
      | Some v -> snapshot_identifier_list_to_query (List.append path [ "Resources" ]) v);
      (match x.errors with
      | None -> []
      | Some v -> batch_snapshot_operation_errors_to_query (List.append path [ "Errors" ]) v);
    ]

let batch_modify_cluster_snapshots_message_to_query path
    (x : batch_modify_cluster_snapshots_message) =
  List.concat
    [
      snapshot_identifier_list_to_query
        (List.append path [ "SnapshotIdentifierList" ])
        x.snapshot_identifier_list;
      (match x.manual_snapshot_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ManualSnapshotRetentionPeriod" ]) v);
      (match x.force with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Force" ]) v);
    ]

let bucket_not_found_fault_to_query path (x : bucket_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let resize_not_found_fault_to_query path (x : resize_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let double_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v
let long_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let import_tables_not_started_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let import_tables_in_progress_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let import_tables_completed_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let resize_progress_message_to_query path (x : resize_progress_message) =
  List.concat
    [
      (match x.target_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetNodeType" ]) v);
      (match x.target_number_of_nodes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "TargetNumberOfNodes" ]) v);
      (match x.target_cluster_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetClusterType" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.import_tables_completed with
      | None -> []
      | Some v -> import_tables_completed_to_query (List.append path [ "ImportTablesCompleted" ]) v);
      (match x.import_tables_in_progress with
      | None -> []
      | Some v ->
          import_tables_in_progress_to_query (List.append path [ "ImportTablesInProgress" ]) v);
      (match x.import_tables_not_started with
      | None -> []
      | Some v ->
          import_tables_not_started_to_query (List.append path [ "ImportTablesNotStarted" ]) v);
      (match x.avg_resize_rate_in_mega_bytes_per_second with
      | None -> []
      | Some v ->
          double_optional_to_query (List.append path [ "AvgResizeRateInMegaBytesPerSecond" ]) v);
      (match x.total_resize_data_in_mega_bytes with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "TotalResizeDataInMegaBytes" ]) v);
      (match x.progress_in_mega_bytes with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "ProgressInMegaBytes" ]) v);
      (match x.elapsed_time_in_seconds with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "ElapsedTimeInSeconds" ]) v);
      (match x.estimated_time_to_completion_in_seconds with
      | None -> []
      | Some v ->
          long_optional_to_query (List.append path [ "EstimatedTimeToCompletionInSeconds" ]) v);
      (match x.resize_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResizeType" ]) v);
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Message" ]) v);
      (match x.target_encryption_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetEncryptionType" ]) v);
      (match x.data_transfer_progress_percent with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "DataTransferProgressPercent" ]) v);
    ]

let cancel_resize_message_to_query path (x : cancel_resize_message) =
  List.concat [ string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier ]

let catalog_name_string_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let cluster_node_to_query path (x : cluster_node) =
  List.concat
    [
      (match x.node_role with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeRole" ]) v);
      (match x.private_ip_address with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PrivateIPAddress" ]) v);
      (match x.public_ip_address with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PublicIPAddress" ]) v);
    ]

let cluster_nodes_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" cluster_node_to_query path xs

let secondary_cluster_info_to_query path (x : secondary_cluster_info) =
  List.concat
    [
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.cluster_nodes with
      | None -> []
      | Some v -> cluster_nodes_list_to_query (List.append path [ "ClusterNodes" ]) v);
    ]

let reserved_node_exchange_status_type_to_query path (x : reserved_node_exchange_status_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | REQUESTED -> "REQUESTED"
    | PENDING -> "PENDING"
    | IN_PROGRESS -> "IN_PROGRESS"
    | RETRYING -> "RETRYING"
    | SUCCEEDED -> "SUCCEEDED"
    | FAILED -> "FAILED")

let reserved_node_exchange_status_to_query path (x : reserved_node_exchange_status) =
  List.concat
    [
      (match x.reserved_node_exchange_request_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedNodeExchangeRequestId" ]) v);
      (match x.status with
      | None -> []
      | Some v -> reserved_node_exchange_status_type_to_query (List.append path [ "Status" ]) v);
      (match x.request_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "RequestTime" ]) v);
      (match x.source_reserved_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceReservedNodeId" ]) v);
      (match x.source_reserved_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceReservedNodeType" ]) v);
      (match x.source_reserved_node_count with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "SourceReservedNodeCount" ]) v);
      (match x.target_reserved_node_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetReservedNodeOfferingId" ]) v);
      (match x.target_reserved_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetReservedNodeType" ]) v);
      (match x.target_reserved_node_count with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "TargetReservedNodeCount" ]) v);
    ]

let resize_info_to_query path (x : resize_info) =
  List.concat
    [
      (match x.resize_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResizeType" ]) v);
      (match x.allow_cancel_resize with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AllowCancelResize" ]) v);
    ]

let deferred_maintenance_window_to_query path (x : deferred_maintenance_window) =
  List.concat
    [
      (match x.defer_maintenance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DeferMaintenanceIdentifier" ]) v);
      (match x.defer_maintenance_start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "DeferMaintenanceStartTime" ]) v);
      (match x.defer_maintenance_end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "DeferMaintenanceEndTime" ]) v);
    ]

let deferred_maintenance_windows_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DeferredMaintenanceWindow"
    deferred_maintenance_window_to_query path xs

let pending_actions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let cluster_iam_role_to_query path (x : cluster_iam_role) =
  List.concat
    [
      (match x.iam_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IamRoleArn" ]) v);
      (match x.apply_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ApplyStatus" ]) v);
    ]

let cluster_iam_role_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterIamRole" cluster_iam_role_to_query
    path xs

let elastic_ip_status_to_query path (x : elastic_ip_status) =
  List.concat
    [
      (match x.elastic_ip with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ElasticIp" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
    ]

let cluster_snapshot_copy_status_to_query path (x : cluster_snapshot_copy_status) =
  List.concat
    [
      (match x.destination_region with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DestinationRegion" ]) v);
      (match x.retention_period with
      | None -> []
      | Some v -> long_to_query (List.append path [ "RetentionPeriod" ]) v);
      (match x.manual_snapshot_retention_period with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "ManualSnapshotRetentionPeriod" ]) v);
      (match x.snapshot_copy_grant_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotCopyGrantName" ]) v);
    ]

let hsm_status_to_query path (x : hsm_status) =
  List.concat
    [
      (match x.hsm_client_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmClientCertificateIdentifier" ]) v);
      (match x.hsm_configuration_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmConfigurationIdentifier" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
    ]

let data_transfer_progress_to_query path (x : data_transfer_progress) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.current_rate_in_mega_bytes_per_second with
      | None -> []
      | Some v ->
          double_optional_to_query (List.append path [ "CurrentRateInMegaBytesPerSecond" ]) v);
      (match x.total_data_in_mega_bytes with
      | None -> []
      | Some v -> long_to_query (List.append path [ "TotalDataInMegaBytes" ]) v);
      (match x.data_transferred_in_mega_bytes with
      | None -> []
      | Some v -> long_to_query (List.append path [ "DataTransferredInMegaBytes" ]) v);
      (match x.estimated_time_to_completion_in_seconds with
      | None -> []
      | Some v ->
          long_optional_to_query (List.append path [ "EstimatedTimeToCompletionInSeconds" ]) v);
      (match x.elapsed_time_in_seconds with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "ElapsedTimeInSeconds" ]) v);
    ]

let restore_status_to_query path (x : restore_status) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.current_restore_rate_in_mega_bytes_per_second with
      | None -> []
      | Some v -> double_to_query (List.append path [ "CurrentRestoreRateInMegaBytesPerSecond" ]) v);
      (match x.snapshot_size_in_mega_bytes with
      | None -> []
      | Some v -> long_to_query (List.append path [ "SnapshotSizeInMegaBytes" ]) v);
      (match x.progress_in_mega_bytes with
      | None -> []
      | Some v -> long_to_query (List.append path [ "ProgressInMegaBytes" ]) v);
      (match x.elapsed_time_in_seconds with
      | None -> []
      | Some v -> long_to_query (List.append path [ "ElapsedTimeInSeconds" ]) v);
      (match x.estimated_time_to_completion_in_seconds with
      | None -> []
      | Some v -> long_to_query (List.append path [ "EstimatedTimeToCompletionInSeconds" ]) v);
    ]

let sensitive_string_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let pending_modified_values_to_query path (x : pending_modified_values) =
  List.concat
    [
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeType" ]) v);
      (match x.number_of_nodes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumberOfNodes" ]) v);
      (match x.cluster_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterType" ]) v);
      (match x.cluster_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterVersion" ]) v);
      (match x.automated_snapshot_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "AutomatedSnapshotRetentionPeriod" ]) v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.enhanced_vpc_routing with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnhancedVpcRouting" ]) v);
      (match x.maintenance_track_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MaintenanceTrackName" ]) v);
      (match x.encryption_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EncryptionType" ]) v);
    ]

let cluster_parameter_status_to_query path (x : cluster_parameter_status) =
  List.concat
    [
      (match x.parameter_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterName" ]) v);
      (match x.parameter_apply_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterApplyStatus" ]) v);
      (match x.parameter_apply_error_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterApplyErrorDescription" ]) v);
    ]

let cluster_parameter_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" cluster_parameter_status_to_query
    path xs

let cluster_parameter_group_status_to_query path (x : cluster_parameter_group_status) =
  List.concat
    [
      (match x.parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterGroupName" ]) v);
      (match x.parameter_apply_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterApplyStatus" ]) v);
      (match x.cluster_parameter_status_list with
      | None -> []
      | Some v ->
          cluster_parameter_status_list_to_query
            (List.append path [ "ClusterParameterStatusList" ])
            v);
    ]

let cluster_parameter_group_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterParameterGroup"
    cluster_parameter_group_status_to_query path xs

let vpc_security_group_membership_to_query path (x : vpc_security_group_membership) =
  List.concat
    [
      (match x.vpc_security_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcSecurityGroupId" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
    ]

let vpc_security_group_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "VpcSecurityGroup"
    vpc_security_group_membership_to_query path xs

let cluster_security_group_membership_to_query path (x : cluster_security_group_membership) =
  List.concat
    [
      (match x.cluster_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterSecurityGroupName" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
    ]

let cluster_security_group_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterSecurityGroup"
    cluster_security_group_membership_to_query path xs

let network_interface_to_query path (x : network_interface) =
  List.concat
    [
      (match x.network_interface_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkInterfaceId" ]) v);
      (match x.subnet_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetId" ]) v);
      (match x.private_ip_address with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PrivateIpAddress" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.ipv6_address with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Ipv6Address" ]) v);
    ]

let network_interface_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NetworkInterface" network_interface_to_query
    path xs

let vpc_endpoint_to_query path (x : vpc_endpoint) =
  List.concat
    [
      (match x.vpc_endpoint_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcEndpointId" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.network_interfaces with
      | None -> []
      | Some v -> network_interface_list_to_query (List.append path [ "NetworkInterfaces" ]) v);
    ]

let vpc_endpoints_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "VpcEndpoint" vpc_endpoint_to_query path xs

let endpoint_to_query path (x : endpoint) =
  List.concat
    [
      (match x.address with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Address" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.vpc_endpoints with
      | None -> []
      | Some v -> vpc_endpoints_list_to_query (List.append path [ "VpcEndpoints" ]) v);
    ]

let cluster_to_query path (x : cluster) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeType" ]) v);
      (match x.cluster_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterStatus" ]) v);
      (match x.cluster_availability_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterAvailabilityStatus" ]) v);
      (match x.modify_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ModifyStatus" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBName" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "Endpoint" ]) v);
      (match x.cluster_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ClusterCreateTime" ]) v);
      (match x.automated_snapshot_retention_period with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "AutomatedSnapshotRetentionPeriod" ]) v);
      (match x.manual_snapshot_retention_period with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "ManualSnapshotRetentionPeriod" ]) v);
      (match x.cluster_security_groups with
      | None -> []
      | Some v ->
          cluster_security_group_membership_list_to_query
            (List.append path [ "ClusterSecurityGroups" ])
            v);
      (match x.vpc_security_groups with
      | None -> []
      | Some v ->
          vpc_security_group_membership_list_to_query (List.append path [ "VpcSecurityGroups" ]) v);
      (match x.cluster_parameter_groups with
      | None -> []
      | Some v ->
          cluster_parameter_group_status_list_to_query
            (List.append path [ "ClusterParameterGroups" ])
            v);
      (match x.cluster_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterSubnetGroupName" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.pending_modified_values with
      | None -> []
      | Some v -> pending_modified_values_to_query (List.append path [ "PendingModifiedValues" ]) v);
      (match x.cluster_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterVersion" ]) v);
      (match x.allow_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AllowVersionUpgrade" ]) v);
      (match x.number_of_nodes with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "NumberOfNodes" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Encrypted" ]) v);
      (match x.restore_status with
      | None -> []
      | Some v -> restore_status_to_query (List.append path [ "RestoreStatus" ]) v);
      (match x.data_transfer_progress with
      | None -> []
      | Some v -> data_transfer_progress_to_query (List.append path [ "DataTransferProgress" ]) v);
      (match x.hsm_status with
      | None -> []
      | Some v -> hsm_status_to_query (List.append path [ "HsmStatus" ]) v);
      (match x.cluster_snapshot_copy_status with
      | None -> []
      | Some v ->
          cluster_snapshot_copy_status_to_query (List.append path [ "ClusterSnapshotCopyStatus" ]) v);
      (match x.cluster_public_key with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterPublicKey" ]) v);
      (match x.cluster_nodes with
      | None -> []
      | Some v -> cluster_nodes_list_to_query (List.append path [ "ClusterNodes" ]) v);
      (match x.elastic_ip_status with
      | None -> []
      | Some v -> elastic_ip_status_to_query (List.append path [ "ElasticIpStatus" ]) v);
      (match x.cluster_revision_number with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterRevisionNumber" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.enhanced_vpc_routing with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "EnhancedVpcRouting" ]) v);
      (match x.iam_roles with
      | None -> []
      | Some v -> cluster_iam_role_list_to_query (List.append path [ "IamRoles" ]) v);
      (match x.pending_actions with
      | None -> []
      | Some v -> pending_actions_list_to_query (List.append path [ "PendingActions" ]) v);
      (match x.maintenance_track_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MaintenanceTrackName" ]) v);
      (match x.elastic_resize_number_of_node_options with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ElasticResizeNumberOfNodeOptions" ]) v);
      (match x.deferred_maintenance_windows with
      | None -> []
      | Some v ->
          deferred_maintenance_windows_list_to_query
            (List.append path [ "DeferredMaintenanceWindows" ])
            v);
      (match x.snapshot_schedule_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotScheduleIdentifier" ]) v);
      (match x.snapshot_schedule_state with
      | None -> []
      | Some v -> schedule_state_to_query (List.append path [ "SnapshotScheduleState" ]) v);
      (match x.expected_next_snapshot_schedule_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ExpectedNextSnapshotScheduleTime" ]) v);
      (match x.expected_next_snapshot_schedule_time_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ExpectedNextSnapshotScheduleTimeStatus" ]) v);
      (match x.next_maintenance_window_start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NextMaintenanceWindowStartTime" ]) v);
      (match x.resize_info with
      | None -> []
      | Some v -> resize_info_to_query (List.append path [ "ResizeInfo" ]) v);
      (match x.availability_zone_relocation_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZoneRelocationStatus" ]) v);
      (match x.cluster_namespace_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterNamespaceArn" ]) v);
      (match x.total_storage_capacity_in_mega_bytes with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "TotalStorageCapacityInMegaBytes" ]) v);
      (match x.aqua_configuration with
      | None -> []
      | Some v -> aqua_configuration_to_query (List.append path [ "AquaConfiguration" ]) v);
      (match x.default_iam_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DefaultIamRoleArn" ]) v);
      (match x.reserved_node_exchange_status with
      | None -> []
      | Some v ->
          reserved_node_exchange_status_to_query
            (List.append path [ "ReservedNodeExchangeStatus" ])
            v);
      (match x.custom_domain_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomDomainName" ]) v);
      (match x.custom_domain_certificate_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomDomainCertificateArn" ]) v);
      (match x.custom_domain_certificate_expiry_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CustomDomainCertificateExpiryDate" ]) v);
      (match x.master_password_secret_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterPasswordSecretArn" ]) v);
      (match x.master_password_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterPasswordSecretKmsKeyId" ]) v);
      (match x.ip_address_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IpAddressType" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MultiAZ" ]) v);
      (match x.multi_az_secondary with
      | None -> []
      | Some v -> secondary_cluster_info_to_query (List.append path [ "MultiAZSecondary" ]) v);
      (match x.lakehouse_registration_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LakehouseRegistrationStatus" ]) v);
      (match x.catalog_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CatalogArn" ]) v);
      (match x.extra_compute_for_automatic_optimization with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ExtraComputeForAutomaticOptimization" ]) v);
    ]

let cluster_already_exists_fault_to_query path (x : cluster_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_credentials_to_query path (x : cluster_credentials) =
  List.concat
    [
      (match x.db_user with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbUser" ]) v);
      (match x.db_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "DbPassword" ]) v);
      (match x.expiration with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "Expiration" ]) v);
    ]

let revision_target_to_query path (x : revision_target) =
  List.concat
    [
      (match x.database_revision with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseRevision" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.database_revision_release_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "DatabaseRevisionReleaseDate" ]) v);
    ]

let revision_targets_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "RevisionTarget" revision_target_to_query
    path xs

let cluster_db_revision_to_query path (x : cluster_db_revision) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.current_database_revision with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CurrentDatabaseRevision" ]) v);
      (match x.database_revision_release_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "DatabaseRevisionReleaseDate" ]) v);
      (match x.revision_targets with
      | None -> []
      | Some v -> revision_targets_list_to_query (List.append path [ "RevisionTargets" ]) v);
    ]

let cluster_db_revisions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterDbRevision"
    cluster_db_revision_to_query path xs

let cluster_db_revisions_message_to_query path (x : cluster_db_revisions_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.cluster_db_revisions with
      | None -> []
      | Some v -> cluster_db_revisions_list_to_query (List.append path [ "ClusterDbRevisions" ]) v);
    ]

let cluster_extended_credentials_to_query path (x : cluster_extended_credentials) =
  List.concat
    [
      (match x.db_user with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbUser" ]) v);
      (match x.db_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "DbPassword" ]) v);
      (match x.expiration with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "Expiration" ]) v);
      (match x.next_refresh_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NextRefreshTime" ]) v);
    ]

let cluster_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterIdentifier" string__to_query path xs

let cluster_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Cluster" cluster_to_query path xs

let cluster_on_latest_revision_fault_to_query path (x : cluster_on_latest_revision_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_parameter_group_to_query path (x : cluster_parameter_group) =
  List.concat
    [
      (match x.parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterGroupName" ]) v);
      (match x.parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterGroupFamily" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let cluster_parameter_group_already_exists_fault_to_query path
    (x : cluster_parameter_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let parameter_apply_type_to_query path (x : parameter_apply_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Static -> "static" | Dynamic -> "dynamic")

let parameter_to_query path (x : parameter) =
  List.concat
    [
      (match x.parameter_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterName" ]) v);
      (match x.parameter_value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterValue" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Source" ]) v);
      (match x.data_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DataType" ]) v);
      (match x.allowed_values with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AllowedValues" ]) v);
      (match x.apply_type with
      | None -> []
      | Some v -> parameter_apply_type_to_query (List.append path [ "ApplyType" ]) v);
      (match x.is_modifiable with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsModifiable" ]) v);
      (match x.minimum_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MinimumEngineVersion" ]) v);
    ]

let parameters_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Parameter" parameter_to_query path xs

let cluster_parameter_group_details_to_query path (x : cluster_parameter_group_details) =
  List.concat
    [
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let cluster_parameter_group_name_message_to_query path (x : cluster_parameter_group_name_message) =
  List.concat
    [
      (match x.parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterGroupName" ]) v);
      (match x.parameter_group_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterGroupStatus" ]) v);
    ]

let cluster_parameter_group_not_found_fault_to_query path
    (x : cluster_parameter_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_parameter_group_quota_exceeded_fault_to_query path
    (x : cluster_parameter_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let parameter_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterParameterGroup"
    cluster_parameter_group_to_query path xs

let cluster_parameter_groups_message_to_query path (x : cluster_parameter_groups_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.parameter_groups with
      | None -> []
      | Some v -> parameter_group_list_to_query (List.append path [ "ParameterGroups" ]) v);
    ]

let cluster_quota_exceeded_fault_to_query path (x : cluster_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_security_group_already_exists_fault_to_query path
    (x : cluster_security_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_security_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterSecurityGroup"
    cluster_security_group_to_query path xs

let cluster_security_group_message_to_query path (x : cluster_security_group_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.cluster_security_groups with
      | None -> []
      | Some v -> cluster_security_groups_to_query (List.append path [ "ClusterSecurityGroups" ]) v);
    ]

let cluster_security_group_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterSecurityGroupName" string__to_query
    path xs

let cluster_security_group_quota_exceeded_fault_to_query path
    (x : cluster_security_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_snapshot_already_exists_fault_to_query path (x : cluster_snapshot_already_exists_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_snapshot_quota_exceeded_fault_to_query path (x : cluster_snapshot_quota_exceeded_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let value_string_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "item" string__to_query path xs

let subnet_to_query path (x : subnet) =
  List.concat
    [
      (match x.subnet_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetIdentifier" ]) v);
      (match x.subnet_availability_zone with
      | None -> []
      | Some v -> availability_zone_to_query (List.append path [ "SubnetAvailabilityZone" ]) v);
      (match x.subnet_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetStatus" ]) v);
    ]

let subnet_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Subnet" subnet_to_query path xs

let cluster_subnet_group_to_query path (x : cluster_subnet_group) =
  List.concat
    [
      (match x.cluster_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterSubnetGroupName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.subnet_group_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetGroupStatus" ]) v);
      (match x.subnets with
      | None -> []
      | Some v -> subnet_list_to_query (List.append path [ "Subnets" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.supported_cluster_ip_address_types with
      | None -> []
      | Some v ->
          value_string_list_to_query (List.append path [ "SupportedClusterIpAddressTypes" ]) v);
    ]

let cluster_subnet_group_already_exists_fault_to_query path
    (x : cluster_subnet_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_subnet_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterSubnetGroup"
    cluster_subnet_group_to_query path xs

let cluster_subnet_group_message_to_query path (x : cluster_subnet_group_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.cluster_subnet_groups with
      | None -> []
      | Some v -> cluster_subnet_groups_to_query (List.append path [ "ClusterSubnetGroups" ]) v);
    ]

let cluster_subnet_group_not_found_fault_to_query path (x : cluster_subnet_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_subnet_group_quota_exceeded_fault_to_query path
    (x : cluster_subnet_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_subnet_quota_exceeded_fault_to_query path (x : cluster_subnet_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cluster_version_to_query path (x : cluster_version) =
  List.concat
    [
      (match x.cluster_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterVersion" ]) v);
      (match x.cluster_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterParameterGroupFamily" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
    ]

let cluster_version_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterVersion" cluster_version_to_query
    path xs

let cluster_versions_message_to_query path (x : cluster_versions_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.cluster_versions with
      | None -> []
      | Some v -> cluster_version_list_to_query (List.append path [ "ClusterVersions" ]) v);
    ]

let clusters_message_to_query path (x : clusters_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.clusters with
      | None -> []
      | Some v -> cluster_list_to_query (List.append path [ "Clusters" ]) v);
    ]

let conflict_policy_update_fault_to_query path (x : conflict_policy_update_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let service_authorization_to_query path (x : service_authorization) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ENABLED -> "Enabled" | DISABLED -> "Disabled")

let connect_to_query path (x : connect) =
  List.concat
    [ service_authorization_to_query (List.append path [ "Authorization" ]) x.authorization ]

let consumer_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let copy_cluster_snapshot_result_to_query path (x : copy_cluster_snapshot_result) =
  List.concat
    [
      (match x.snapshot with
      | None -> []
      | Some v -> snapshot_to_query (List.append path [ "Snapshot" ]) v);
    ]

let copy_cluster_snapshot_message_to_query path (x : copy_cluster_snapshot_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "SourceSnapshotIdentifier" ])
        x.source_snapshot_identifier;
      (match x.source_snapshot_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceSnapshotClusterIdentifier" ]) v);
      string__to_query
        (List.append path [ "TargetSnapshotIdentifier" ])
        x.target_snapshot_identifier;
      (match x.manual_snapshot_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ManualSnapshotRetentionPeriod" ]) v);
    ]

let copy_to_region_disabled_fault_to_query path (x : copy_to_region_disabled_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_authentication_profile_request_fault_to_query path
    (x : invalid_authentication_profile_request_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_authentication_profile_result_to_query path (x : create_authentication_profile_result) =
  List.concat
    [
      (match x.authentication_profile_name with
      | None -> []
      | Some v ->
          authentication_profile_name_string_to_query
            (List.append path [ "AuthenticationProfileName" ])
            v);
      (match x.authentication_profile_content with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AuthenticationProfileContent" ]) v);
    ]

let create_authentication_profile_message_to_query path (x : create_authentication_profile_message)
    =
  List.concat
    [
      authentication_profile_name_string_to_query
        (List.append path [ "AuthenticationProfileName" ])
        x.authentication_profile_name;
      string__to_query
        (List.append path [ "AuthenticationProfileContent" ])
        x.authentication_profile_content;
    ]

let unauthorized_operation_to_query path (x : unauthorized_operation) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let tag_limit_exceeded_fault_to_query path (x : tag_limit_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let snapshot_schedule_not_found_fault_to_query path (x : snapshot_schedule_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let redshift_idc_application_not_exists_fault_to_query path
    (x : redshift_idc_application_not_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let number_of_nodes_quota_exceeded_fault_to_query path (x : number_of_nodes_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let number_of_nodes_per_cluster_limit_exceeded_fault_to_query path
    (x : number_of_nodes_per_cluster_limit_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let ipv6_cidr_block_not_found_fault_to_query path (x : ipv6_cidr_block_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_vpc_network_state_fault_to_query path (x : invalid_vpc_network_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_tag_fault_to_query path (x : invalid_tag_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_subnet_to_query path (x : invalid_subnet) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_elastic_ip_fault_to_query path (x : invalid_elastic_ip_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_cluster_track_fault_to_query path (x : invalid_cluster_track_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_cluster_subnet_group_state_fault_to_query path
    (x : invalid_cluster_subnet_group_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let insufficient_cluster_capacity_fault_to_query path (x : insufficient_cluster_capacity_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let hsm_configuration_not_found_fault_to_query path (x : hsm_configuration_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let hsm_client_certificate_not_found_fault_to_query path
    (x : hsm_client_certificate_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let dependent_service_access_denied_fault_to_query path (x : dependent_service_access_denied_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_cluster_result_to_query path (x : create_cluster_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let iam_role_arn_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "IamRoleArn" string__to_query path xs

let vpc_security_group_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "VpcSecurityGroupId" string__to_query path xs

let create_cluster_message_to_query path (x : create_cluster_message) =
  List.concat
    [
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBName" ]) v);
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.cluster_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterType" ]) v);
      string__to_query (List.append path [ "NodeType" ]) x.node_type;
      string__to_query (List.append path [ "MasterUsername" ]) x.master_username;
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.cluster_security_groups with
      | None -> []
      | Some v ->
          cluster_security_group_name_list_to_query (List.append path [ "ClusterSecurityGroups" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.cluster_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterSubnetGroupName" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterParameterGroupName" ]) v);
      (match x.automated_snapshot_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "AutomatedSnapshotRetentionPeriod" ]) v);
      (match x.manual_snapshot_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ManualSnapshotRetentionPeriod" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.cluster_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterVersion" ]) v);
      (match x.allow_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AllowVersionUpgrade" ]) v);
      (match x.number_of_nodes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumberOfNodes" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Encrypted" ]) v);
      (match x.hsm_client_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmClientCertificateIdentifier" ]) v);
      (match x.hsm_configuration_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmConfigurationIdentifier" ]) v);
      (match x.elastic_ip with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ElasticIp" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.enhanced_vpc_routing with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnhancedVpcRouting" ]) v);
      (match x.additional_info with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AdditionalInfo" ]) v);
      (match x.iam_roles with
      | None -> []
      | Some v -> iam_role_arn_list_to_query (List.append path [ "IamRoles" ]) v);
      (match x.maintenance_track_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MaintenanceTrackName" ]) v);
      (match x.snapshot_schedule_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotScheduleIdentifier" ]) v);
      (match x.availability_zone_relocation with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AvailabilityZoneRelocation" ]) v);
      (match x.aqua_configuration_status with
      | None -> []
      | Some v ->
          aqua_configuration_status_to_query (List.append path [ "AquaConfigurationStatus" ]) v);
      (match x.default_iam_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DefaultIamRoleArn" ]) v);
      (match x.load_sample_data with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LoadSampleData" ]) v);
      (match x.manage_master_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterPassword" ]) v);
      (match x.master_password_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterPasswordSecretKmsKeyId" ]) v);
      (match x.ip_address_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IpAddressType" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.redshift_idc_application_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RedshiftIdcApplicationArn" ]) v);
      (match x.catalog_name with
      | None -> []
      | Some v -> catalog_name_string_to_query (List.append path [ "CatalogName" ]) v);
      (match x.extra_compute_for_automatic_optimization with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "ExtraComputeForAutomaticOptimization" ]) v);
    ]

let create_cluster_parameter_group_result_to_query path (x : create_cluster_parameter_group_result)
    =
  List.concat
    [
      (match x.cluster_parameter_group with
      | None -> []
      | Some v -> cluster_parameter_group_to_query (List.append path [ "ClusterParameterGroup" ]) v);
    ]

let create_cluster_parameter_group_message_to_query path
    (x : create_cluster_parameter_group_message) =
  List.concat
    [
      string__to_query (List.append path [ "ParameterGroupName" ]) x.parameter_group_name;
      string__to_query (List.append path [ "ParameterGroupFamily" ]) x.parameter_group_family;
      string__to_query (List.append path [ "Description" ]) x.description;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let create_cluster_security_group_result_to_query path (x : create_cluster_security_group_result) =
  List.concat
    [
      (match x.cluster_security_group with
      | None -> []
      | Some v -> cluster_security_group_to_query (List.append path [ "ClusterSecurityGroup" ]) v);
    ]

let create_cluster_security_group_message_to_query path (x : create_cluster_security_group_message)
    =
  List.concat
    [
      string__to_query
        (List.append path [ "ClusterSecurityGroupName" ])
        x.cluster_security_group_name;
      string__to_query (List.append path [ "Description" ]) x.description;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let create_cluster_snapshot_result_to_query path (x : create_cluster_snapshot_result) =
  List.concat
    [
      (match x.snapshot with
      | None -> []
      | Some v -> snapshot_to_query (List.append path [ "Snapshot" ]) v);
    ]

let create_cluster_snapshot_message_to_query path (x : create_cluster_snapshot_message) =
  List.concat
    [
      string__to_query (List.append path [ "SnapshotIdentifier" ]) x.snapshot_identifier;
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.manual_snapshot_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ManualSnapshotRetentionPeriod" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let create_cluster_subnet_group_result_to_query path (x : create_cluster_subnet_group_result) =
  List.concat
    [
      (match x.cluster_subnet_group with
      | None -> []
      | Some v -> cluster_subnet_group_to_query (List.append path [ "ClusterSubnetGroup" ]) v);
    ]

let subnet_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SubnetIdentifier" string__to_query path xs

let create_cluster_subnet_group_message_to_query path (x : create_cluster_subnet_group_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterSubnetGroupName" ]) x.cluster_subnet_group_name;
      string__to_query (List.append path [ "Description" ]) x.description;
      subnet_identifier_list_to_query (List.append path [ "SubnetIds" ]) x.subnet_ids;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let custom_cname_association_fault_to_query path (x : custom_cname_association_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let custom_domain_certificate_arn_string_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let custom_domain_name_string_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let create_custom_domain_association_result_to_query path
    (x : create_custom_domain_association_result) =
  List.concat
    [
      (match x.custom_domain_name with
      | None -> []
      | Some v -> custom_domain_name_string_to_query (List.append path [ "CustomDomainName" ]) v);
      (match x.custom_domain_certificate_arn with
      | None -> []
      | Some v ->
          custom_domain_certificate_arn_string_to_query
            (List.append path [ "CustomDomainCertificateArn" ])
            v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.custom_domain_cert_expiry_time with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomDomainCertExpiryTime" ]) v);
    ]

let create_custom_domain_association_message_to_query path
    (x : create_custom_domain_association_message) =
  List.concat
    [
      custom_domain_name_string_to_query
        (List.append path [ "CustomDomainName" ])
        x.custom_domain_name;
      custom_domain_certificate_arn_string_to_query
        (List.append path [ "CustomDomainCertificateArn" ])
        x.custom_domain_certificate_arn;
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
    ]

let endpoints_per_cluster_limit_exceeded_fault_to_query path
    (x : endpoints_per_cluster_limit_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let endpoints_per_authorization_limit_exceeded_fault_to_query path
    (x : endpoints_per_authorization_limit_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let endpoint_already_exists_fault_to_query path (x : endpoint_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let endpoint_access_to_query path (x : endpoint_access) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.resource_owner with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceOwner" ]) v);
      (match x.subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetGroupName" ]) v);
      (match x.endpoint_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointStatus" ]) v);
      (match x.endpoint_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointName" ]) v);
      (match x.endpoint_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EndpointCreateTime" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.address with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Address" ]) v);
      (match x.vpc_security_groups with
      | None -> []
      | Some v ->
          vpc_security_group_membership_list_to_query (List.append path [ "VpcSecurityGroups" ]) v);
      (match x.vpc_endpoint with
      | None -> []
      | Some v -> vpc_endpoint_to_query (List.append path [ "VpcEndpoint" ]) v);
    ]

let create_endpoint_access_message_to_query path (x : create_endpoint_access_message) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.resource_owner with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceOwner" ]) v);
      string__to_query (List.append path [ "EndpointName" ]) x.endpoint_name;
      string__to_query (List.append path [ "SubnetGroupName" ]) x.subnet_group_name;
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
    ]

let subscription_severity_not_found_fault_to_query path (x : subscription_severity_not_found_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let subscription_event_id_not_found_fault_to_query path (x : subscription_event_id_not_found_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let subscription_category_not_found_fault_to_query path (x : subscription_category_not_found_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let subscription_already_exist_fault_to_query path (x : subscription_already_exist_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let source_not_found_fault_to_query path (x : source_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let sns_topic_arn_not_found_fault_to_query path (x : sns_topic_arn_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let sns_no_authorization_fault_to_query path (x : sns_no_authorization_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let sns_invalid_topic_fault_to_query path (x : sns_invalid_topic_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let event_subscription_quota_exceeded_fault_to_query path
    (x : event_subscription_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let event_categories_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "EventCategory" string__to_query path xs

let source_ids_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SourceId" string__to_query path xs

let event_subscription_to_query path (x : event_subscription) =
  List.concat
    [
      (match x.customer_aws_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomerAwsId" ]) v);
      (match x.cust_subscription_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustSubscriptionId" ]) v);
      (match x.sns_topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnsTopicArn" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.subscription_creation_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "SubscriptionCreationTime" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      (match x.source_ids_list with
      | None -> []
      | Some v -> source_ids_list_to_query (List.append path [ "SourceIdsList" ]) v);
      (match x.event_categories_list with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategoriesList" ]) v);
      (match x.severity with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Severity" ]) v);
      (match x.enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Enabled" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let create_event_subscription_result_to_query path (x : create_event_subscription_result) =
  List.concat
    [
      (match x.event_subscription with
      | None -> []
      | Some v -> event_subscription_to_query (List.append path [ "EventSubscription" ]) v);
    ]

let create_event_subscription_message_to_query path (x : create_event_subscription_message) =
  List.concat
    [
      string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name;
      string__to_query (List.append path [ "SnsTopicArn" ]) x.sns_topic_arn;
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      (match x.source_ids with
      | None -> []
      | Some v -> source_ids_list_to_query (List.append path [ "SourceIds" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
      (match x.severity with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Severity" ]) v);
      (match x.enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Enabled" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let hsm_client_certificate_quota_exceeded_fault_to_query path
    (x : hsm_client_certificate_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let hsm_client_certificate_already_exists_fault_to_query path
    (x : hsm_client_certificate_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let hsm_client_certificate_to_query path (x : hsm_client_certificate) =
  List.concat
    [
      (match x.hsm_client_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmClientCertificateIdentifier" ]) v);
      (match x.hsm_client_certificate_public_key with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmClientCertificatePublicKey" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let create_hsm_client_certificate_result_to_query path (x : create_hsm_client_certificate_result) =
  List.concat
    [
      (match x.hsm_client_certificate with
      | None -> []
      | Some v -> hsm_client_certificate_to_query (List.append path [ "HsmClientCertificate" ]) v);
    ]

let create_hsm_client_certificate_message_to_query path (x : create_hsm_client_certificate_message)
    =
  List.concat
    [
      string__to_query
        (List.append path [ "HsmClientCertificateIdentifier" ])
        x.hsm_client_certificate_identifier;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let hsm_configuration_quota_exceeded_fault_to_query path
    (x : hsm_configuration_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let hsm_configuration_already_exists_fault_to_query path
    (x : hsm_configuration_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let hsm_configuration_to_query path (x : hsm_configuration) =
  List.concat
    [
      (match x.hsm_configuration_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmConfigurationIdentifier" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.hsm_ip_address with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmIpAddress" ]) v);
      (match x.hsm_partition_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmPartitionName" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let create_hsm_configuration_result_to_query path (x : create_hsm_configuration_result) =
  List.concat
    [
      (match x.hsm_configuration with
      | None -> []
      | Some v -> hsm_configuration_to_query (List.append path [ "HsmConfiguration" ]) v);
    ]

let create_hsm_configuration_message_to_query path (x : create_hsm_configuration_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "HsmConfigurationIdentifier" ])
        x.hsm_configuration_identifier;
      string__to_query (List.append path [ "Description" ]) x.description;
      string__to_query (List.append path [ "HsmIpAddress" ]) x.hsm_ip_address;
      string__to_query (List.append path [ "HsmPartitionName" ]) x.hsm_partition_name;
      string__to_query (List.append path [ "HsmPartitionPassword" ]) x.hsm_partition_password;
      string__to_query
        (List.append path [ "HsmServerPublicCertificate" ])
        x.hsm_server_public_certificate;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let integration_target_not_found_fault_to_query path (x : integration_target_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integration_source_not_found_fault_to_query path (x : integration_source_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integration_quota_exceeded_fault_to_query path (x : integration_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integration_conflict_operation_fault_to_query path (x : integration_conflict_operation_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integration_already_exists_fault_to_query path (x : integration_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let encryption_context_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" string__to_query
    string__to_query path pairs

let description_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let integration_error_to_query path (x : integration_error) =
  List.concat
    [
      string__to_query (List.append path [ "ErrorCode" ]) x.error_code;
      (match x.error_message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ErrorMessage" ]) v);
    ]

let integration_error_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "IntegrationError" integration_error_to_query
    path xs

let zero_etl_integration_status_to_query path (x : zero_etl_integration_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | CREATING -> "creating"
    | ACTIVE -> "active"
    | MODIFYING -> "modifying"
    | FAILED -> "failed"
    | DELETING -> "deleting"
    | SYNCING -> "syncing"
    | NEEDS_ATTENTION -> "needs_attention")

let target_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let source_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let integration_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let integration_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let integration_to_query path (x : integration) =
  List.concat
    [
      (match x.integration_arn with
      | None -> []
      | Some v -> integration_arn_to_query (List.append path [ "IntegrationArn" ]) v);
      (match x.integration_name with
      | None -> []
      | Some v -> integration_name_to_query (List.append path [ "IntegrationName" ]) v);
      (match x.source_arn with
      | None -> []
      | Some v -> source_arn_to_query (List.append path [ "SourceArn" ]) v);
      (match x.target_arn with
      | None -> []
      | Some v -> target_arn_to_query (List.append path [ "TargetArn" ]) v);
      (match x.status with
      | None -> []
      | Some v -> zero_etl_integration_status_to_query (List.append path [ "Status" ]) v);
      (match x.errors with
      | None -> []
      | Some v -> integration_error_list_to_query (List.append path [ "Errors" ]) v);
      (match x.create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreateTime" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KMSKeyId" ]) v);
      (match x.additional_encryption_context with
      | None -> []
      | Some v ->
          encryption_context_map_to_query (List.append path [ "AdditionalEncryptionContext" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let integration_description_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let create_integration_message_to_query path (x : create_integration_message) =
  List.concat
    [
      source_arn_to_query (List.append path [ "SourceArn" ]) x.source_arn;
      target_arn_to_query (List.append path [ "TargetArn" ]) x.target_arn;
      integration_name_to_query (List.append path [ "IntegrationName" ]) x.integration_name;
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KMSKeyId" ]) v);
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.additional_encryption_context with
      | None -> []
      | Some v ->
          encryption_context_map_to_query (List.append path [ "AdditionalEncryptionContext" ]) v);
      (match x.description with
      | None -> []
      | Some v -> integration_description_to_query (List.append path [ "Description" ]) v);
    ]

let redshift_idc_application_quota_exceeded_fault_to_query path
    (x : redshift_idc_application_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let redshift_idc_application_already_exists_fault_to_query path
    (x : redshift_idc_application_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let tag_key_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "TagKey" string__to_query path xs

let redshift_scope_union_to_query path (x : redshift_scope_union) =
  match x with Connect v -> connect_to_query (List.append path [ "Connect" ]) v

let redshift_service_integrations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" redshift_scope_union_to_query path
    xs

let read_write_access_to_query path (x : read_write_access) =
  List.concat
    [ service_authorization_to_query (List.append path [ "Authorization" ]) x.authorization ]

let s3_access_grants_scope_union_to_query path (x : s3_access_grants_scope_union) =
  match x with
  | ReadWriteAccess v -> read_write_access_to_query (List.append path [ "ReadWriteAccess" ]) v

let s3_access_grants_service_integrations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    s3_access_grants_scope_union_to_query path xs

let lake_formation_query_to_query path (x : lake_formation_query) =
  List.concat
    [ service_authorization_to_query (List.append path [ "Authorization" ]) x.authorization ]

let lake_formation_scope_union_to_query path (x : lake_formation_scope_union) =
  match x with
  | LakeFormationQuery v ->
      lake_formation_query_to_query (List.append path [ "LakeFormationQuery" ]) v

let lake_formation_service_integrations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" lake_formation_scope_union_to_query
    path xs

let service_integrations_union_to_query path (x : service_integrations_union) =
  match x with
  | LakeFormation v ->
      lake_formation_service_integrations_to_query (List.append path [ "LakeFormation" ]) v
  | S3AccessGrants v ->
      s3_access_grants_service_integrations_to_query (List.append path [ "S3AccessGrants" ]) v
  | Redshift v -> redshift_service_integrations_to_query (List.append path [ "Redshift" ]) v

let service_integration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" service_integrations_union_to_query
    path xs

let idc_display_name_string_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let identity_namespace_string_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let redshift_idc_application_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let redshift_idc_application_to_query path (x : redshift_idc_application) =
  List.concat
    [
      (match x.idc_instance_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IdcInstanceArn" ]) v);
      (match x.redshift_idc_application_name with
      | None -> []
      | Some v ->
          redshift_idc_application_name_to_query
            (List.append path [ "RedshiftIdcApplicationName" ])
            v);
      (match x.redshift_idc_application_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RedshiftIdcApplicationArn" ]) v);
      (match x.identity_namespace with
      | None -> []
      | Some v -> identity_namespace_string_to_query (List.append path [ "IdentityNamespace" ]) v);
      (match x.idc_display_name with
      | None -> []
      | Some v -> idc_display_name_string_to_query (List.append path [ "IdcDisplayName" ]) v);
      (match x.iam_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IamRoleArn" ]) v);
      (match x.idc_managed_application_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IdcManagedApplicationArn" ]) v);
      (match x.idc_onboard_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IdcOnboardStatus" ]) v);
      (match x.authorized_token_issuer_list with
      | None -> []
      | Some v ->
          authorized_token_issuer_list_to_query (List.append path [ "AuthorizedTokenIssuerList" ]) v);
      (match x.service_integrations with
      | None -> []
      | Some v -> service_integration_list_to_query (List.append path [ "ServiceIntegrations" ]) v);
      (match x.application_type with
      | None -> []
      | Some v -> application_type_to_query (List.append path [ "ApplicationType" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.sso_tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "SsoTagKeys" ]) v);
    ]

let create_redshift_idc_application_result_to_query path
    (x : create_redshift_idc_application_result) =
  List.concat
    [
      (match x.redshift_idc_application with
      | None -> []
      | Some v ->
          redshift_idc_application_to_query (List.append path [ "RedshiftIdcApplication" ]) v);
    ]

let create_redshift_idc_application_message_to_query path
    (x : create_redshift_idc_application_message) =
  List.concat
    [
      string__to_query (List.append path [ "IdcInstanceArn" ]) x.idc_instance_arn;
      redshift_idc_application_name_to_query
        (List.append path [ "RedshiftIdcApplicationName" ])
        x.redshift_idc_application_name;
      (match x.identity_namespace with
      | None -> []
      | Some v -> identity_namespace_string_to_query (List.append path [ "IdentityNamespace" ]) v);
      idc_display_name_string_to_query (List.append path [ "IdcDisplayName" ]) x.idc_display_name;
      string__to_query (List.append path [ "IamRoleArn" ]) x.iam_role_arn;
      (match x.authorized_token_issuer_list with
      | None -> []
      | Some v ->
          authorized_token_issuer_list_to_query (List.append path [ "AuthorizedTokenIssuerList" ]) v);
      (match x.service_integrations with
      | None -> []
      | Some v -> service_integration_list_to_query (List.append path [ "ServiceIntegrations" ]) v);
      (match x.application_type with
      | None -> []
      | Some v -> application_type_to_query (List.append path [ "ApplicationType" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.sso_tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "SsoTagKeys" ]) v);
    ]

let scheduled_action_type_unsupported_fault_to_query path
    (x : scheduled_action_type_unsupported_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let scheduled_action_quota_exceeded_fault_to_query path (x : scheduled_action_quota_exceeded_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let scheduled_action_already_exists_fault_to_query path (x : scheduled_action_already_exists_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_schedule_fault_to_query path (x : invalid_schedule_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_scheduled_action_fault_to_query path (x : invalid_scheduled_action_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let scheduled_action_time_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ScheduledActionTime" t_stamp_to_query path
    xs

let scheduled_action_state_to_query path (x : scheduled_action_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ACTIVE -> "ACTIVE" | DISABLED -> "DISABLED")

let resume_cluster_message_to_query path (x : resume_cluster_message) =
  List.concat [ string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier ]

let pause_cluster_message_to_query path (x : pause_cluster_message) =
  List.concat [ string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier ]

let resize_cluster_message_to_query path (x : resize_cluster_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.cluster_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterType" ]) v);
      (match x.node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeType" ]) v);
      (match x.number_of_nodes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumberOfNodes" ]) v);
      (match x.classic with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Classic" ]) v);
      (match x.reserved_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedNodeId" ]) v);
      (match x.target_reserved_node_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetReservedNodeOfferingId" ]) v);
    ]

let scheduled_action_type_to_query path (x : scheduled_action_type) =
  List.concat
    [
      (match x.resize_cluster with
      | None -> []
      | Some v -> resize_cluster_message_to_query (List.append path [ "ResizeCluster" ]) v);
      (match x.pause_cluster with
      | None -> []
      | Some v -> pause_cluster_message_to_query (List.append path [ "PauseCluster" ]) v);
      (match x.resume_cluster with
      | None -> []
      | Some v -> resume_cluster_message_to_query (List.append path [ "ResumeCluster" ]) v);
    ]

let scheduled_action_to_query path (x : scheduled_action) =
  List.concat
    [
      (match x.scheduled_action_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ScheduledActionName" ]) v);
      (match x.target_action with
      | None -> []
      | Some v -> scheduled_action_type_to_query (List.append path [ "TargetAction" ]) v);
      (match x.schedule with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Schedule" ]) v);
      (match x.iam_role with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IamRole" ]) v);
      (match x.scheduled_action_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ScheduledActionDescription" ]) v);
      (match x.state with
      | None -> []
      | Some v -> scheduled_action_state_to_query (List.append path [ "State" ]) v);
      (match x.next_invocations with
      | None -> []
      | Some v -> scheduled_action_time_list_to_query (List.append path [ "NextInvocations" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EndTime" ]) v);
    ]

let create_scheduled_action_message_to_query path (x : create_scheduled_action_message) =
  List.concat
    [
      string__to_query (List.append path [ "ScheduledActionName" ]) x.scheduled_action_name;
      scheduled_action_type_to_query (List.append path [ "TargetAction" ]) x.target_action;
      string__to_query (List.append path [ "Schedule" ]) x.schedule;
      string__to_query (List.append path [ "IamRole" ]) x.iam_role;
      (match x.scheduled_action_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ScheduledActionDescription" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.enable with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Enable" ]) v);
    ]

let snapshot_copy_grant_quota_exceeded_fault_to_query path
    (x : snapshot_copy_grant_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let snapshot_copy_grant_already_exists_fault_to_query path
    (x : snapshot_copy_grant_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let snapshot_copy_grant_to_query path (x : snapshot_copy_grant) =
  List.concat
    [
      (match x.snapshot_copy_grant_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotCopyGrantName" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let create_snapshot_copy_grant_result_to_query path (x : create_snapshot_copy_grant_result) =
  List.concat
    [
      (match x.snapshot_copy_grant with
      | None -> []
      | Some v -> snapshot_copy_grant_to_query (List.append path [ "SnapshotCopyGrant" ]) v);
    ]

let create_snapshot_copy_grant_message_to_query path (x : create_snapshot_copy_grant_message) =
  List.concat
    [
      string__to_query (List.append path [ "SnapshotCopyGrantName" ]) x.snapshot_copy_grant_name;
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let snapshot_schedule_quota_exceeded_fault_to_query path
    (x : snapshot_schedule_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let snapshot_schedule_already_exists_fault_to_query path
    (x : snapshot_schedule_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let schedule_definition_type_unsupported_fault_to_query path
    (x : schedule_definition_type_unsupported_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let scheduled_snapshot_time_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SnapshotTime" t_stamp_to_query path xs

let schedule_definition_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ScheduleDefinition" string__to_query path xs

let snapshot_schedule_to_query path (x : snapshot_schedule) =
  List.concat
    [
      (match x.schedule_definitions with
      | None -> []
      | Some v -> schedule_definition_list_to_query (List.append path [ "ScheduleDefinitions" ]) v);
      (match x.schedule_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ScheduleIdentifier" ]) v);
      (match x.schedule_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ScheduleDescription" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.next_invocations with
      | None -> []
      | Some v -> scheduled_snapshot_time_list_to_query (List.append path [ "NextInvocations" ]) v);
      (match x.associated_cluster_count with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AssociatedClusterCount" ]) v);
      (match x.associated_clusters with
      | None -> []
      | Some v -> associated_cluster_list_to_query (List.append path [ "AssociatedClusters" ]) v);
    ]

let create_snapshot_schedule_message_to_query path (x : create_snapshot_schedule_message) =
  List.concat
    [
      (match x.schedule_definitions with
      | None -> []
      | Some v -> schedule_definition_list_to_query (List.append path [ "ScheduleDefinitions" ]) v);
      (match x.schedule_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ScheduleIdentifier" ]) v);
      (match x.schedule_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ScheduleDescription" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.dry_run with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DryRun" ]) v);
      (match x.next_invocations with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NextInvocations" ]) v);
    ]

let resource_not_found_fault_to_query path (x : resource_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_tags_message_to_query path (x : create_tags_message) =
  List.concat
    [
      string__to_query (List.append path [ "ResourceName" ]) x.resource_name;
      tag_list_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let usage_limit_already_exists_fault_to_query path (x : usage_limit_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_usage_limit_fault_to_query path (x : invalid_usage_limit_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let usage_limit_breach_action_to_query path (x : usage_limit_breach_action) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with LOG -> "log" | EMIT_METRIC -> "emit-metric" | DISABLE -> "disable")

let usage_limit_period_to_query path (x : usage_limit_period) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DAILY -> "daily" | WEEKLY -> "weekly" | MONTHLY -> "monthly")

let usage_limit_limit_type_to_query path (x : usage_limit_limit_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with TIME -> "time" | DATA_SCANNED -> "data-scanned")

let usage_limit_feature_type_to_query path (x : usage_limit_feature_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | SPECTRUM -> "spectrum"
    | CONCURRENCY_SCALING -> "concurrency-scaling"
    | CROSS_REGION_DATASHARING -> "cross-region-datasharing"
    | EXTRA_COMPUTE_FOR_AUTOMATIC_OPTIMIZATION -> "extra-compute-for-automatic-optimization")

let usage_limit_to_query path (x : usage_limit) =
  List.concat
    [
      (match x.usage_limit_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "UsageLimitId" ]) v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.feature_type with
      | None -> []
      | Some v -> usage_limit_feature_type_to_query (List.append path [ "FeatureType" ]) v);
      (match x.limit_type with
      | None -> []
      | Some v -> usage_limit_limit_type_to_query (List.append path [ "LimitType" ]) v);
      (match x.amount with None -> [] | Some v -> long_to_query (List.append path [ "Amount" ]) v);
      (match x.period with
      | None -> []
      | Some v -> usage_limit_period_to_query (List.append path [ "Period" ]) v);
      (match x.breach_action with
      | None -> []
      | Some v -> usage_limit_breach_action_to_query (List.append path [ "BreachAction" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let create_usage_limit_message_to_query path (x : create_usage_limit_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      usage_limit_feature_type_to_query (List.append path [ "FeatureType" ]) x.feature_type;
      usage_limit_limit_type_to_query (List.append path [ "LimitType" ]) x.limit_type;
      long_to_query (List.append path [ "Amount" ]) x.amount;
      (match x.period with
      | None -> []
      | Some v -> usage_limit_period_to_query (List.append path [ "Period" ]) v);
      (match x.breach_action with
      | None -> []
      | Some v -> usage_limit_breach_action_to_query (List.append path [ "BreachAction" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let custom_domain_association_not_found_fault_to_query path
    (x : custom_domain_association_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let custom_domain_associations_message_to_query path (x : custom_domain_associations_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.associations with
      | None -> []
      | Some v -> association_list_to_query (List.append path [ "Associations" ]) v);
    ]

let customer_storage_message_to_query path (x : customer_storage_message) =
  List.concat
    [
      (match x.total_backup_size_in_mega_bytes with
      | None -> []
      | Some v -> double_to_query (List.append path [ "TotalBackupSizeInMegaBytes" ]) v);
      (match x.total_provisioned_storage_in_mega_bytes with
      | None -> []
      | Some v -> double_to_query (List.append path [ "TotalProvisionedStorageInMegaBytes" ]) v);
    ]

let data_share_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" data_share_to_query path xs

let data_share_status_for_consumer_to_query path (x : data_share_status_for_consumer) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ACTIVE -> "ACTIVE" | AVAILABLE -> "AVAILABLE")

let data_share_status_for_producer_to_query path (x : data_share_status_for_producer) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ACTIVE -> "ACTIVE"
    | AUTHORIZED -> "AUTHORIZED"
    | PENDING_AUTHORIZATION -> "PENDING_AUTHORIZATION"
    | DEAUTHORIZED -> "DEAUTHORIZED"
    | REJECTED -> "REJECTED")

let db_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DbGroup" string__to_query path xs

let deauthorize_data_share_message_to_query path (x : deauthorize_data_share_message) =
  List.concat
    [
      string__to_query (List.append path [ "DataShareArn" ]) x.data_share_arn;
      string__to_query (List.append path [ "ConsumerIdentifier" ]) x.consumer_identifier;
    ]

let default_cluster_parameters_to_query path (x : default_cluster_parameters) =
  List.concat
    [
      (match x.parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterGroupFamily" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
    ]

let delete_authentication_profile_result_to_query path (x : delete_authentication_profile_result) =
  List.concat
    [
      (match x.authentication_profile_name with
      | None -> []
      | Some v ->
          authentication_profile_name_string_to_query
            (List.append path [ "AuthenticationProfileName" ])
            v);
    ]

let delete_authentication_profile_message_to_query path (x : delete_authentication_profile_message)
    =
  List.concat
    [
      authentication_profile_name_string_to_query
        (List.append path [ "AuthenticationProfileName" ])
        x.authentication_profile_name;
    ]

let delete_cluster_result_to_query path (x : delete_cluster_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let delete_cluster_message_to_query path (x : delete_cluster_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.skip_final_cluster_snapshot with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SkipFinalClusterSnapshot" ]) v);
      (match x.final_cluster_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FinalClusterSnapshotIdentifier" ]) v);
      (match x.final_cluster_snapshot_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "FinalClusterSnapshotRetentionPeriod" ]) v);
    ]

let invalid_cluster_parameter_group_state_fault_to_query path
    (x : invalid_cluster_parameter_group_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_cluster_parameter_group_message_to_query path
    (x : delete_cluster_parameter_group_message) =
  List.concat
    [ string__to_query (List.append path [ "ParameterGroupName" ]) x.parameter_group_name ]

let delete_cluster_security_group_message_to_query path (x : delete_cluster_security_group_message)
    =
  List.concat
    [
      string__to_query
        (List.append path [ "ClusterSecurityGroupName" ])
        x.cluster_security_group_name;
    ]

let delete_cluster_snapshot_result_to_query path (x : delete_cluster_snapshot_result) =
  List.concat
    [
      (match x.snapshot with
      | None -> []
      | Some v -> snapshot_to_query (List.append path [ "Snapshot" ]) v);
    ]

let invalid_cluster_subnet_state_fault_to_query path (x : invalid_cluster_subnet_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_cluster_subnet_group_message_to_query path (x : delete_cluster_subnet_group_message) =
  List.concat
    [ string__to_query (List.append path [ "ClusterSubnetGroupName" ]) x.cluster_subnet_group_name ]

let delete_custom_domain_association_message_to_query path
    (x : delete_custom_domain_association_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      custom_domain_name_string_to_query
        (List.append path [ "CustomDomainName" ])
        x.custom_domain_name;
    ]

let invalid_endpoint_state_fault_to_query path (x : invalid_endpoint_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let endpoint_not_found_fault_to_query path (x : endpoint_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_endpoint_access_message_to_query path (x : delete_endpoint_access_message) =
  List.concat [ string__to_query (List.append path [ "EndpointName" ]) x.endpoint_name ]

let subscription_not_found_fault_to_query path (x : subscription_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_subscription_state_fault_to_query path (x : invalid_subscription_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_event_subscription_message_to_query path (x : delete_event_subscription_message) =
  List.concat [ string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name ]

let invalid_hsm_client_certificate_state_fault_to_query path
    (x : invalid_hsm_client_certificate_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_hsm_client_certificate_message_to_query path (x : delete_hsm_client_certificate_message)
    =
  List.concat
    [
      string__to_query
        (List.append path [ "HsmClientCertificateIdentifier" ])
        x.hsm_client_certificate_identifier;
    ]

let invalid_hsm_configuration_state_fault_to_query path (x : invalid_hsm_configuration_state_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_hsm_configuration_message_to_query path (x : delete_hsm_configuration_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "HsmConfigurationIdentifier" ])
        x.hsm_configuration_identifier;
    ]

let integration_not_found_fault_to_query path (x : integration_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integration_conflict_state_fault_to_query path (x : integration_conflict_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_integration_message_to_query path (x : delete_integration_message) =
  List.concat [ integration_arn_to_query (List.append path [ "IntegrationArn" ]) x.integration_arn ]

let delete_redshift_idc_application_message_to_query path
    (x : delete_redshift_idc_application_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "RedshiftIdcApplicationArn" ])
        x.redshift_idc_application_arn;
    ]

let delete_resource_policy_message_to_query path (x : delete_resource_policy_message) =
  List.concat [ string__to_query (List.append path [ "ResourceArn" ]) x.resource_arn ]

let scheduled_action_not_found_fault_to_query path (x : scheduled_action_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_scheduled_action_message_to_query path (x : delete_scheduled_action_message) =
  List.concat
    [ string__to_query (List.append path [ "ScheduledActionName" ]) x.scheduled_action_name ]

let snapshot_copy_grant_not_found_fault_to_query path (x : snapshot_copy_grant_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_snapshot_copy_grant_state_fault_to_query path
    (x : invalid_snapshot_copy_grant_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_snapshot_copy_grant_message_to_query path (x : delete_snapshot_copy_grant_message) =
  List.concat
    [ string__to_query (List.append path [ "SnapshotCopyGrantName" ]) x.snapshot_copy_grant_name ]

let invalid_cluster_snapshot_schedule_state_fault_to_query path
    (x : invalid_cluster_snapshot_schedule_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_snapshot_schedule_message_to_query path (x : delete_snapshot_schedule_message) =
  List.concat [ string__to_query (List.append path [ "ScheduleIdentifier" ]) x.schedule_identifier ]

let delete_tags_message_to_query path (x : delete_tags_message) =
  List.concat
    [
      string__to_query (List.append path [ "ResourceName" ]) x.resource_name;
      tag_key_list_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
    ]

let usage_limit_not_found_fault_to_query path (x : usage_limit_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_usage_limit_message_to_query path (x : delete_usage_limit_message) =
  List.concat [ string__to_query (List.append path [ "UsageLimitId" ]) x.usage_limit_id ]

let namespace_registration_status_to_query path (x : namespace_registration_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with REGISTERING -> "Registering" | DEREGISTERING -> "Deregistering")

let deregister_namespace_output_message_to_query path (x : deregister_namespace_output_message) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> namespace_registration_status_to_query (List.append path [ "Status" ]) v);
    ]

let provisioned_identifier_to_query path (x : provisioned_identifier) =
  List.concat [ string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier ]

let serverless_identifier_to_query path (x : serverless_identifier) =
  List.concat
    [
      string__to_query (List.append path [ "NamespaceIdentifier" ]) x.namespace_identifier;
      string__to_query (List.append path [ "WorkgroupIdentifier" ]) x.workgroup_identifier;
    ]

let namespace_identifier_union_to_query path (x : namespace_identifier_union) =
  match x with
  | ServerlessIdentifier v ->
      serverless_identifier_to_query (List.append path [ "ServerlessIdentifier" ]) v
  | ProvisionedIdentifier v ->
      provisioned_identifier_to_query (List.append path [ "ProvisionedIdentifier" ]) v

let deregister_namespace_input_message_to_query path (x : deregister_namespace_input_message) =
  List.concat
    [
      namespace_identifier_union_to_query
        (List.append path [ "NamespaceIdentifier" ])
        x.namespace_identifier;
      consumer_identifier_list_to_query
        (List.append path [ "ConsumerIdentifiers" ])
        x.consumer_identifiers;
    ]

let describe_account_attributes_message_to_query path (x : describe_account_attributes_message) =
  List.concat
    [
      (match x.attribute_names with
      | None -> []
      | Some v -> attribute_name_list_to_query (List.append path [ "AttributeNames" ]) v);
    ]

let describe_authentication_profiles_result_to_query path
    (x : describe_authentication_profiles_result) =
  List.concat
    [
      (match x.authentication_profiles with
      | None -> []
      | Some v ->
          authentication_profile_list_to_query (List.append path [ "AuthenticationProfiles" ]) v);
    ]

let describe_authentication_profiles_message_to_query path
    (x : describe_authentication_profiles_message) =
  List.concat
    [
      (match x.authentication_profile_name with
      | None -> []
      | Some v ->
          authentication_profile_name_string_to_query
            (List.append path [ "AuthenticationProfileName" ])
            v);
    ]

let describe_cluster_db_revisions_message_to_query path (x : describe_cluster_db_revisions_message)
    =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let tag_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "TagValue" string__to_query path xs

let describe_cluster_parameter_groups_message_to_query path
    (x : describe_cluster_parameter_groups_message) =
  List.concat
    [
      (match x.parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterGroupName" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
    ]

let describe_cluster_parameters_message_to_query path (x : describe_cluster_parameters_message) =
  List.concat
    [
      string__to_query (List.append path [ "ParameterGroupName" ]) x.parameter_group_name;
      (match x.source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Source" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_cluster_security_groups_message_to_query path
    (x : describe_cluster_security_groups_message) =
  List.concat
    [
      (match x.cluster_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterSecurityGroupName" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
    ]

let snapshot_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Snapshot" snapshot_to_query path xs

let snapshot_message_to_query path (x : snapshot_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.snapshots with
      | None -> []
      | Some v -> snapshot_list_to_query (List.append path [ "Snapshots" ]) v);
    ]

let sort_by_order_to_query path (x : sort_by_order) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ASCENDING -> "ASC" | DESCENDING -> "DESC")

let snapshot_attribute_to_sort_by_to_query path (x : snapshot_attribute_to_sort_by) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | SOURCE_TYPE -> "SOURCE_TYPE"
    | TOTAL_SIZE -> "TOTAL_SIZE"
    | CREATE_TIME -> "CREATE_TIME")

let snapshot_sorting_entity_to_query path (x : snapshot_sorting_entity) =
  List.concat
    [
      snapshot_attribute_to_sort_by_to_query (List.append path [ "Attribute" ]) x.attribute;
      (match x.sort_order with
      | None -> []
      | Some v -> sort_by_order_to_query (List.append path [ "SortOrder" ]) v);
    ]

let snapshot_sorting_entity_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SnapshotSortingEntity"
    snapshot_sorting_entity_to_query path xs

let describe_cluster_snapshots_message_to_query path (x : describe_cluster_snapshots_message) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotIdentifier" ]) v);
      (match x.snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotArn" ]) v);
      (match x.snapshot_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotType" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.owner_account with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OwnerAccount" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
      (match x.cluster_exists with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ClusterExists" ]) v);
      (match x.sorting_entities with
      | None -> []
      | Some v -> snapshot_sorting_entity_list_to_query (List.append path [ "SortingEntities" ]) v);
    ]

let describe_cluster_subnet_groups_message_to_query path
    (x : describe_cluster_subnet_groups_message) =
  List.concat
    [
      (match x.cluster_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterSubnetGroupName" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
    ]

let supported_operation_to_query path (x : supported_operation) =
  List.concat
    [
      (match x.operation_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OperationName" ]) v);
    ]

let supported_operation_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SupportedOperation"
    supported_operation_to_query path xs

let update_target_to_query path (x : update_target) =
  List.concat
    [
      (match x.maintenance_track_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MaintenanceTrackName" ]) v);
      (match x.database_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseVersion" ]) v);
      (match x.supported_operations with
      | None -> []
      | Some v -> supported_operation_list_to_query (List.append path [ "SupportedOperations" ]) v);
    ]

let eligible_tracks_to_update_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "UpdateTarget" update_target_to_query path xs

let maintenance_track_to_query path (x : maintenance_track) =
  List.concat
    [
      (match x.maintenance_track_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MaintenanceTrackName" ]) v);
      (match x.database_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseVersion" ]) v);
      (match x.update_targets with
      | None -> []
      | Some v -> eligible_tracks_to_update_list_to_query (List.append path [ "UpdateTargets" ]) v);
    ]

let track_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "MaintenanceTrack" maintenance_track_to_query
    path xs

let track_list_message_to_query path (x : track_list_message) =
  List.concat
    [
      (match x.maintenance_tracks with
      | None -> []
      | Some v -> track_list_to_query (List.append path [ "MaintenanceTracks" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_cluster_tracks_message_to_query path (x : describe_cluster_tracks_message) =
  List.concat
    [
      (match x.maintenance_track_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MaintenanceTrackName" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_cluster_versions_message_to_query path (x : describe_cluster_versions_message) =
  List.concat
    [
      (match x.cluster_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterVersion" ]) v);
      (match x.cluster_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterParameterGroupFamily" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_clusters_message_to_query path (x : describe_clusters_message) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
    ]

let describe_custom_domain_associations_message_to_query path
    (x : describe_custom_domain_associations_message) =
  List.concat
    [
      (match x.custom_domain_name with
      | None -> []
      | Some v -> custom_domain_name_string_to_query (List.append path [ "CustomDomainName" ]) v);
      (match x.custom_domain_certificate_arn with
      | None -> []
      | Some v ->
          custom_domain_certificate_arn_string_to_query
            (List.append path [ "CustomDomainCertificateArn" ])
            v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_data_shares_result_to_query path (x : describe_data_shares_result) =
  List.concat
    [
      (match x.data_shares with
      | None -> []
      | Some v -> data_share_list_to_query (List.append path [ "DataShares" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_data_shares_message_to_query path (x : describe_data_shares_message) =
  List.concat
    [
      (match x.data_share_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DataShareArn" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_data_shares_for_consumer_result_to_query path
    (x : describe_data_shares_for_consumer_result) =
  List.concat
    [
      (match x.data_shares with
      | None -> []
      | Some v -> data_share_list_to_query (List.append path [ "DataShares" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_data_shares_for_consumer_message_to_query path
    (x : describe_data_shares_for_consumer_message) =
  List.concat
    [
      (match x.consumer_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ConsumerArn" ]) v);
      (match x.status with
      | None -> []
      | Some v -> data_share_status_for_consumer_to_query (List.append path [ "Status" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_data_shares_for_producer_result_to_query path
    (x : describe_data_shares_for_producer_result) =
  List.concat
    [
      (match x.data_shares with
      | None -> []
      | Some v -> data_share_list_to_query (List.append path [ "DataShares" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_data_shares_for_producer_message_to_query path
    (x : describe_data_shares_for_producer_message) =
  List.concat
    [
      (match x.producer_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ProducerArn" ]) v);
      (match x.status with
      | None -> []
      | Some v -> data_share_status_for_producer_to_query (List.append path [ "Status" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_default_cluster_parameters_result_to_query path
    (x : describe_default_cluster_parameters_result) =
  List.concat
    [
      (match x.default_cluster_parameters with
      | None -> []
      | Some v ->
          default_cluster_parameters_to_query (List.append path [ "DefaultClusterParameters" ]) v);
    ]

let describe_default_cluster_parameters_message_to_query path
    (x : describe_default_cluster_parameters_message) =
  List.concat
    [
      string__to_query (List.append path [ "ParameterGroupFamily" ]) x.parameter_group_family;
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let endpoint_accesses_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" endpoint_access_to_query path xs

let endpoint_access_list_to_query path (x : endpoint_access_list) =
  List.concat
    [
      (match x.endpoint_access_list with
      | None -> []
      | Some v -> endpoint_accesses_to_query (List.append path [ "EndpointAccessList" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_endpoint_access_message_to_query path (x : describe_endpoint_access_message) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.resource_owner with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceOwner" ]) v);
      (match x.endpoint_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointName" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let endpoint_authorizations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" endpoint_authorization_to_query path
    xs

let endpoint_authorization_list_to_query path (x : endpoint_authorization_list) =
  List.concat
    [
      (match x.endpoint_authorization_list with
      | None -> []
      | Some v ->
          endpoint_authorizations_to_query (List.append path [ "EndpointAuthorizationList" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_endpoint_authorization_message_to_query path
    (x : describe_endpoint_authorization_message) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.account with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Account" ]) v);
      (match x.grantee with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Grantee" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let event_info_map_to_query path (x : event_info_map) =
  List.concat
    [
      (match x.event_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EventId" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
      (match x.event_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EventDescription" ]) v);
      (match x.severity with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Severity" ]) v);
    ]

let event_info_map_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "EventInfoMap" event_info_map_to_query path
    xs

let event_categories_map_to_query path (x : event_categories_map) =
  List.concat
    [
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      (match x.events with
      | None -> []
      | Some v -> event_info_map_list_to_query (List.append path [ "Events" ]) v);
    ]

let event_categories_map_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "EventCategoriesMap"
    event_categories_map_to_query path xs

let event_categories_message_to_query path (x : event_categories_message) =
  List.concat
    [
      (match x.event_categories_map_list with
      | None -> []
      | Some v ->
          event_categories_map_list_to_query (List.append path [ "EventCategoriesMapList" ]) v);
    ]

let describe_event_categories_message_to_query path (x : describe_event_categories_message) =
  List.concat
    [
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
    ]

let event_subscriptions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "EventSubscription"
    event_subscription_to_query path xs

let event_subscriptions_message_to_query path (x : event_subscriptions_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.event_subscriptions_list with
      | None -> []
      | Some v ->
          event_subscriptions_list_to_query (List.append path [ "EventSubscriptionsList" ]) v);
    ]

let describe_event_subscriptions_message_to_query path (x : describe_event_subscriptions_message) =
  List.concat
    [
      (match x.subscription_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubscriptionName" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
    ]

let source_type_to_query path (x : source_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Cluster -> "cluster"
    | Cluster_parameter_group -> "cluster-parameter-group"
    | Cluster_security_group -> "cluster-security-group"
    | Cluster_snapshot -> "cluster-snapshot"
    | Scheduled_action -> "scheduled-action")

let event_to_query path (x : event) =
  List.concat
    [
      (match x.source_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceIdentifier" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> source_type_to_query (List.append path [ "SourceType" ]) v);
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Message" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
      (match x.severity with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Severity" ]) v);
      (match x.date with None -> [] | Some v -> t_stamp_to_query (List.append path [ "Date" ]) v);
      (match x.event_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EventId" ]) v);
    ]

let event_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Event" event_to_query path xs

let events_message_to_query path (x : events_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.events with
      | None -> []
      | Some v -> event_list_to_query (List.append path [ "Events" ]) v);
    ]

let describe_events_message_to_query path (x : describe_events_message) =
  List.concat
    [
      (match x.source_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceIdentifier" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> source_type_to_query (List.append path [ "SourceType" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Duration" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let hsm_client_certificate_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "HsmClientCertificate"
    hsm_client_certificate_to_query path xs

let hsm_client_certificate_message_to_query path (x : hsm_client_certificate_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.hsm_client_certificates with
      | None -> []
      | Some v ->
          hsm_client_certificate_list_to_query (List.append path [ "HsmClientCertificates" ]) v);
    ]

let describe_hsm_client_certificates_message_to_query path
    (x : describe_hsm_client_certificates_message) =
  List.concat
    [
      (match x.hsm_client_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmClientCertificateIdentifier" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
    ]

let hsm_configuration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "HsmConfiguration" hsm_configuration_to_query
    path xs

let hsm_configuration_message_to_query path (x : hsm_configuration_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.hsm_configurations with
      | None -> []
      | Some v -> hsm_configuration_list_to_query (List.append path [ "HsmConfigurations" ]) v);
    ]

let describe_hsm_configurations_message_to_query path (x : describe_hsm_configurations_message) =
  List.concat
    [
      (match x.hsm_configuration_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmConfigurationIdentifier" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
    ]

let inbound_integration_arn_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let inbound_integration_to_query path (x : inbound_integration) =
  List.concat
    [
      (match x.integration_arn with
      | None -> []
      | Some v -> inbound_integration_arn_to_query (List.append path [ "IntegrationArn" ]) v);
      (match x.source_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceArn" ]) v);
      (match x.target_arn with
      | None -> []
      | Some v -> target_arn_to_query (List.append path [ "TargetArn" ]) v);
      (match x.status with
      | None -> []
      | Some v -> zero_etl_integration_status_to_query (List.append path [ "Status" ]) v);
      (match x.errors with
      | None -> []
      | Some v -> integration_error_list_to_query (List.append path [ "Errors" ]) v);
      (match x.create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreateTime" ]) v);
    ]

let inbound_integration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "InboundIntegration"
    inbound_integration_to_query path xs

let inbound_integrations_message_to_query path (x : inbound_integrations_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.inbound_integrations with
      | None -> []
      | Some v -> inbound_integration_list_to_query (List.append path [ "InboundIntegrations" ]) v);
    ]

let describe_inbound_integrations_message_to_query path (x : describe_inbound_integrations_message)
    =
  List.concat
    [
      (match x.integration_arn with
      | None -> []
      | Some v -> inbound_integration_arn_to_query (List.append path [ "IntegrationArn" ]) v);
      (match x.target_arn with
      | None -> []
      | Some v -> target_arn_to_query (List.append path [ "TargetArn" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let integration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Integration" integration_to_query path xs

let integrations_message_to_query path (x : integrations_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.integrations with
      | None -> []
      | Some v -> integration_list_to_query (List.append path [ "Integrations" ]) v);
    ]

let describe_integrations_filter_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Value" string__to_query path xs

let describe_integrations_filter_name_to_query path (x : describe_integrations_filter_name) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | INTEGRATION_ARN -> "integration-arn"
    | SOURCE_ARN -> "source-arn"
    | SOURCE_TYPES -> "source-types"
    | STATUS -> "status")

let describe_integrations_filter_to_query path (x : describe_integrations_filter) =
  List.concat
    [
      describe_integrations_filter_name_to_query (List.append path [ "Name" ]) x.name;
      describe_integrations_filter_value_list_to_query (List.append path [ "Values" ]) x.values;
    ]

let describe_integrations_filter_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DescribeIntegrationsFilter"
    describe_integrations_filter_to_query path xs

let describe_integrations_message_to_query path (x : describe_integrations_message) =
  List.concat
    [
      (match x.integration_arn with
      | None -> []
      | Some v -> integration_arn_to_query (List.append path [ "IntegrationArn" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> describe_integrations_filter_list_to_query (List.append path [ "Filters" ]) v);
    ]

let log_type_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let log_destination_type_to_query path (x : log_destination_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with S3 -> "s3" | CLOUDWATCH -> "cloudwatch")

let s3_key_prefix_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let logging_status_to_query path (x : logging_status) =
  List.concat
    [
      (match x.logging_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "LoggingEnabled" ]) v);
      (match x.bucket_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BucketName" ]) v);
      (match x.s3_key_prefix with
      | None -> []
      | Some v -> s3_key_prefix_value_to_query (List.append path [ "S3KeyPrefix" ]) v);
      (match x.last_successful_delivery_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "LastSuccessfulDeliveryTime" ]) v);
      (match x.last_failure_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "LastFailureTime" ]) v);
      (match x.last_failure_message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LastFailureMessage" ]) v);
      (match x.log_destination_type with
      | None -> []
      | Some v -> log_destination_type_to_query (List.append path [ "LogDestinationType" ]) v);
      (match x.log_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "LogExports" ]) v);
    ]

let describe_logging_status_message_to_query path (x : describe_logging_status_message) =
  List.concat [ string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier ]

let mode_to_query path (x : mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with STANDARD -> "standard" | HIGH_PERFORMANCE -> "high-performance")

let node_configuration_option_to_query path (x : node_configuration_option) =
  List.concat
    [
      (match x.node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeType" ]) v);
      (match x.number_of_nodes with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "NumberOfNodes" ]) v);
      (match x.estimated_disk_utilization_percent with
      | None -> []
      | Some v ->
          double_optional_to_query (List.append path [ "EstimatedDiskUtilizationPercent" ]) v);
      (match x.mode with None -> [] | Some v -> mode_to_query (List.append path [ "Mode" ]) v);
    ]

let node_configuration_option_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NodeConfigurationOption"
    node_configuration_option_to_query path xs

let node_configuration_options_message_to_query path (x : node_configuration_options_message) =
  List.concat
    [
      (match x.node_configuration_option_list with
      | None -> []
      | Some v ->
          node_configuration_option_list_to_query
            (List.append path [ "NodeConfigurationOptionList" ])
            v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let operator_type_to_query path (x : operator_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | EQ -> "eq"
    | LT -> "lt"
    | GT -> "gt"
    | LE -> "le"
    | GE -> "ge"
    | IN -> "in"
    | BETWEEN -> "between")

let node_configuration_options_filter_name_to_query path
    (x : node_configuration_options_filter_name) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NODE_TYPE -> "NodeType"
    | NUM_NODES -> "NumberOfNodes"
    | ESTIMATED_DISK_UTILIZATION_PERCENT -> "EstimatedDiskUtilizationPercent"
    | MODE -> "Mode")

let node_configuration_options_filter_to_query path (x : node_configuration_options_filter) =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v -> node_configuration_options_filter_name_to_query (List.append path [ "Name" ]) v);
      (match x.operator with
      | None -> []
      | Some v -> operator_type_to_query (List.append path [ "Operator" ]) v);
      (match x.values with
      | None -> []
      | Some v -> value_string_list_to_query (List.append path [ "Value" ]) v);
    ]

let node_configuration_options_filter_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NodeConfigurationOptionsFilter"
    node_configuration_options_filter_to_query path xs

let describe_node_configuration_options_message_to_query path
    (x : describe_node_configuration_options_message) =
  List.concat
    [
      action_type_to_query (List.append path [ "ActionType" ]) x.action_type;
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotIdentifier" ]) v);
      (match x.snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotArn" ]) v);
      (match x.owner_account with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OwnerAccount" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> node_configuration_options_filter_list_to_query (List.append path [ "Filter" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let orderable_cluster_option_to_query path (x : orderable_cluster_option) =
  List.concat
    [
      (match x.cluster_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterVersion" ]) v);
      (match x.cluster_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterType" ]) v);
      (match x.node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeType" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zone_list_to_query (List.append path [ "AvailabilityZones" ]) v);
    ]

let orderable_cluster_options_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OrderableClusterOption"
    orderable_cluster_option_to_query path xs

let orderable_cluster_options_message_to_query path (x : orderable_cluster_options_message) =
  List.concat
    [
      (match x.orderable_cluster_options with
      | None -> []
      | Some v ->
          orderable_cluster_options_list_to_query (List.append path [ "OrderableClusterOptions" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_orderable_cluster_options_message_to_query path
    (x : describe_orderable_cluster_options_message) =
  List.concat
    [
      (match x.cluster_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterVersion" ]) v);
      (match x.node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeType" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let partner_integration_status_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let partner_integration_status_to_query path (x : partner_integration_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Active -> "Active"
    | Inactive -> "Inactive"
    | RuntimeFailure -> "RuntimeFailure"
    | ConnectionFailure -> "ConnectionFailure")

let partner_integration_info_to_query path (x : partner_integration_info) =
  List.concat
    [
      (match x.database_name with
      | None -> []
      | Some v -> partner_integration_database_name_to_query (List.append path [ "DatabaseName" ]) v);
      (match x.partner_name with
      | None -> []
      | Some v -> partner_integration_partner_name_to_query (List.append path [ "PartnerName" ]) v);
      (match x.status with
      | None -> []
      | Some v -> partner_integration_status_to_query (List.append path [ "Status" ]) v);
      (match x.status_message with
      | None -> []
      | Some v ->
          partner_integration_status_message_to_query (List.append path [ "StatusMessage" ]) v);
      (match x.created_at with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreatedAt" ]) v);
      (match x.updated_at with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "UpdatedAt" ]) v);
    ]

let partner_integration_info_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "PartnerIntegrationInfo"
    partner_integration_info_to_query path xs

let describe_partners_output_message_to_query path (x : describe_partners_output_message) =
  List.concat
    [
      (match x.partner_integration_info_list with
      | None -> []
      | Some v ->
          partner_integration_info_list_to_query
            (List.append path [ "PartnerIntegrationInfoList" ])
            v);
    ]

let describe_partners_input_message_to_query path (x : describe_partners_input_message) =
  List.concat
    [
      partner_integration_account_id_to_query (List.append path [ "AccountId" ]) x.account_id;
      partner_integration_cluster_identifier_to_query
        (List.append path [ "ClusterIdentifier" ])
        x.cluster_identifier;
      (match x.database_name with
      | None -> []
      | Some v -> partner_integration_database_name_to_query (List.append path [ "DatabaseName" ]) v);
      (match x.partner_name with
      | None -> []
      | Some v -> partner_integration_partner_name_to_query (List.append path [ "PartnerName" ]) v);
    ]

let redshift_idc_application_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" redshift_idc_application_to_query
    path xs

let describe_redshift_idc_applications_result_to_query path
    (x : describe_redshift_idc_applications_result) =
  List.concat
    [
      (match x.redshift_idc_applications with
      | None -> []
      | Some v ->
          redshift_idc_application_list_to_query (List.append path [ "RedshiftIdcApplications" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_redshift_idc_applications_message_to_query path
    (x : describe_redshift_idc_applications_message) =
  List.concat
    [
      (match x.redshift_idc_application_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RedshiftIdcApplicationArn" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let reserved_node_exchange_not_found_fault_to_query path
    (x : reserved_node_exchange_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let reserved_node_exchange_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReservedNodeExchangeStatus"
    reserved_node_exchange_status_to_query path xs

let describe_reserved_node_exchange_status_output_message_to_query path
    (x : describe_reserved_node_exchange_status_output_message) =
  List.concat
    [
      (match x.reserved_node_exchange_status_details with
      | None -> []
      | Some v ->
          reserved_node_exchange_status_list_to_query
            (List.append path [ "ReservedNodeExchangeStatusDetails" ])
            v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_reserved_node_exchange_status_input_message_to_query path
    (x : describe_reserved_node_exchange_status_input_message) =
  List.concat
    [
      (match x.reserved_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedNodeId" ]) v);
      (match x.reserved_node_exchange_request_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedNodeExchangeRequestId" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let reserved_node_offering_to_query path (x : reserved_node_offering) =
  List.concat
    [
      (match x.reserved_node_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedNodeOfferingId" ]) v);
      (match x.node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeType" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "Duration" ]) v);
      (match x.fixed_price with
      | None -> []
      | Some v -> double_to_query (List.append path [ "FixedPrice" ]) v);
      (match x.usage_price with
      | None -> []
      | Some v -> double_to_query (List.append path [ "UsagePrice" ]) v);
      (match x.currency_code with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CurrencyCode" ]) v);
      (match x.offering_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OfferingType" ]) v);
      (match x.recurring_charges with
      | None -> []
      | Some v -> recurring_charge_list_to_query (List.append path [ "RecurringCharges" ]) v);
      (match x.reserved_node_offering_type with
      | None -> []
      | Some v ->
          reserved_node_offering_type_to_query (List.append path [ "ReservedNodeOfferingType" ]) v);
    ]

let reserved_node_offering_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReservedNodeOffering"
    reserved_node_offering_to_query path xs

let reserved_node_offerings_message_to_query path (x : reserved_node_offerings_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.reserved_node_offerings with
      | None -> []
      | Some v ->
          reserved_node_offering_list_to_query (List.append path [ "ReservedNodeOfferings" ]) v);
    ]

let describe_reserved_node_offerings_message_to_query path
    (x : describe_reserved_node_offerings_message) =
  List.concat
    [
      (match x.reserved_node_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedNodeOfferingId" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let reserved_node_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReservedNode" reserved_node_to_query path xs

let reserved_nodes_message_to_query path (x : reserved_nodes_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.reserved_nodes with
      | None -> []
      | Some v -> reserved_node_list_to_query (List.append path [ "ReservedNodes" ]) v);
    ]

let describe_reserved_nodes_message_to_query path (x : describe_reserved_nodes_message) =
  List.concat
    [
      (match x.reserved_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedNodeId" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_resize_message_to_query path (x : describe_resize_message) =
  List.concat [ string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier ]

let scheduled_action_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ScheduledAction" scheduled_action_to_query
    path xs

let scheduled_actions_message_to_query path (x : scheduled_actions_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.scheduled_actions with
      | None -> []
      | Some v -> scheduled_action_list_to_query (List.append path [ "ScheduledActions" ]) v);
    ]

let scheduled_action_filter_name_to_query path (x : scheduled_action_filter_name) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with CLUSTER_IDENTIFIER -> "cluster-identifier" | IAM_ROLE -> "iam-role")

let scheduled_action_filter_to_query path (x : scheduled_action_filter) =
  List.concat
    [
      scheduled_action_filter_name_to_query (List.append path [ "Name" ]) x.name;
      value_string_list_to_query (List.append path [ "Values" ]) x.values;
    ]

let scheduled_action_filter_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ScheduledActionFilter"
    scheduled_action_filter_to_query path xs

let scheduled_action_type_values_to_query path (x : scheduled_action_type_values) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | RESIZE_CLUSTER -> "ResizeCluster"
    | PAUSE_CLUSTER -> "PauseCluster"
    | RESUME_CLUSTER -> "ResumeCluster")

let describe_scheduled_actions_message_to_query path (x : describe_scheduled_actions_message) =
  List.concat
    [
      (match x.scheduled_action_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ScheduledActionName" ]) v);
      (match x.target_action_type with
      | None -> []
      | Some v -> scheduled_action_type_values_to_query (List.append path [ "TargetActionType" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.active with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Active" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> scheduled_action_filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let snapshot_copy_grant_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SnapshotCopyGrant"
    snapshot_copy_grant_to_query path xs

let snapshot_copy_grant_message_to_query path (x : snapshot_copy_grant_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.snapshot_copy_grants with
      | None -> []
      | Some v -> snapshot_copy_grant_list_to_query (List.append path [ "SnapshotCopyGrants" ]) v);
    ]

let describe_snapshot_copy_grants_message_to_query path (x : describe_snapshot_copy_grants_message)
    =
  List.concat
    [
      (match x.snapshot_copy_grant_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotCopyGrantName" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
    ]

let snapshot_schedule_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SnapshotSchedule" snapshot_schedule_to_query
    path xs

let describe_snapshot_schedules_output_message_to_query path
    (x : describe_snapshot_schedules_output_message) =
  List.concat
    [
      (match x.snapshot_schedules with
      | None -> []
      | Some v -> snapshot_schedule_list_to_query (List.append path [ "SnapshotSchedules" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_snapshot_schedules_message_to_query path (x : describe_snapshot_schedules_message) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.schedule_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ScheduleIdentifier" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let table_restore_not_found_fault_to_query path (x : table_restore_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let table_restore_status_type_to_query path (x : table_restore_status_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | PENDING -> "PENDING"
    | IN_PROGRESS -> "IN_PROGRESS"
    | SUCCEEDED -> "SUCCEEDED"
    | FAILED -> "FAILED"
    | CANCELED -> "CANCELED")

let table_restore_status_to_query path (x : table_restore_status) =
  List.concat
    [
      (match x.table_restore_request_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TableRestoreRequestId" ]) v);
      (match x.status with
      | None -> []
      | Some v -> table_restore_status_type_to_query (List.append path [ "Status" ]) v);
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Message" ]) v);
      (match x.request_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "RequestTime" ]) v);
      (match x.progress_in_mega_bytes with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "ProgressInMegaBytes" ]) v);
      (match x.total_data_in_mega_bytes with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "TotalDataInMegaBytes" ]) v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotIdentifier" ]) v);
      (match x.source_database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDatabaseName" ]) v);
      (match x.source_schema_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceSchemaName" ]) v);
      (match x.source_table_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceTableName" ]) v);
      (match x.target_database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetDatabaseName" ]) v);
      (match x.target_schema_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetSchemaName" ]) v);
      (match x.new_table_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NewTableName" ]) v);
    ]

let table_restore_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "TableRestoreStatus"
    table_restore_status_to_query path xs

let table_restore_status_message_to_query path (x : table_restore_status_message) =
  List.concat
    [
      (match x.table_restore_status_details with
      | None -> []
      | Some v ->
          table_restore_status_list_to_query (List.append path [ "TableRestoreStatusDetails" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_table_restore_status_message_to_query path (x : describe_table_restore_status_message)
    =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.table_restore_request_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TableRestoreRequestId" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let tagged_resource_to_query path (x : tagged_resource) =
  List.concat
    [
      (match x.tag with None -> [] | Some v -> tag_to_query (List.append path [ "Tag" ]) v);
      (match x.resource_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceName" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceType" ]) v);
    ]

let tagged_resource_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "TaggedResource" tagged_resource_to_query
    path xs

let tagged_resource_list_message_to_query path (x : tagged_resource_list_message) =
  List.concat
    [
      (match x.tagged_resources with
      | None -> []
      | Some v -> tagged_resource_list_to_query (List.append path [ "TaggedResources" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_tags_message_to_query path (x : describe_tags_message) =
  List.concat
    [
      (match x.resource_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceName" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceType" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
    ]

let usage_limits_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" usage_limit_to_query path xs

let usage_limit_list_to_query path (x : usage_limit_list) =
  List.concat
    [
      (match x.usage_limits with
      | None -> []
      | Some v -> usage_limits_to_query (List.append path [ "UsageLimits" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_usage_limits_message_to_query path (x : describe_usage_limits_message) =
  List.concat
    [
      (match x.usage_limit_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "UsageLimitId" ]) v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.feature_type with
      | None -> []
      | Some v -> usage_limit_feature_type_to_query (List.append path [ "FeatureType" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.tag_keys with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagKeys" ]) v);
      (match x.tag_values with
      | None -> []
      | Some v -> tag_value_list_to_query (List.append path [ "TagValues" ]) v);
    ]

let disable_logging_message_to_query path (x : disable_logging_message) =
  List.concat [ string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier ]

let snapshot_copy_already_disabled_fault_to_query path (x : snapshot_copy_already_disabled_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let disable_snapshot_copy_result_to_query path (x : disable_snapshot_copy_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let disable_snapshot_copy_message_to_query path (x : disable_snapshot_copy_message) =
  List.concat [ string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier ]

let disassociate_data_share_consumer_message_to_query path
    (x : disassociate_data_share_consumer_message) =
  List.concat
    [
      string__to_query (List.append path [ "DataShareArn" ]) x.data_share_arn;
      (match x.disassociate_entire_account with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DisassociateEntireAccount" ]) v);
      (match x.consumer_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ConsumerArn" ]) v);
      (match x.consumer_region with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ConsumerRegion" ]) v);
    ]

let invalid_s3_key_prefix_fault_to_query path (x : invalid_s3_key_prefix_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_s3_bucket_name_fault_to_query path (x : invalid_s3_bucket_name_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let insufficient_s3_bucket_policy_fault_to_query path (x : insufficient_s3_bucket_policy_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let enable_logging_message_to_query path (x : enable_logging_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.bucket_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BucketName" ]) v);
      (match x.s3_key_prefix with
      | None -> []
      | Some v -> s3_key_prefix_value_to_query (List.append path [ "S3KeyPrefix" ]) v);
      (match x.log_destination_type with
      | None -> []
      | Some v -> log_destination_type_to_query (List.append path [ "LogDestinationType" ]) v);
      (match x.log_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "LogExports" ]) v);
    ]

let unknown_snapshot_copy_region_fault_to_query path (x : unknown_snapshot_copy_region_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let snapshot_copy_already_enabled_fault_to_query path (x : snapshot_copy_already_enabled_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let incompatible_orderable_options_to_query path (x : incompatible_orderable_options) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let enable_snapshot_copy_result_to_query path (x : enable_snapshot_copy_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let enable_snapshot_copy_message_to_query path (x : enable_snapshot_copy_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      string__to_query (List.append path [ "DestinationRegion" ]) x.destination_region;
      (match x.retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "RetentionPeriod" ]) v);
      (match x.snapshot_copy_grant_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotCopyGrantName" ]) v);
      (match x.manual_snapshot_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ManualSnapshotRetentionPeriod" ]) v);
    ]

let endpoint_authorization_not_found_fault_to_query path
    (x : endpoint_authorization_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let failover_primary_compute_result_to_query path (x : failover_primary_compute_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let failover_primary_compute_input_message_to_query path
    (x : failover_primary_compute_input_message) =
  List.concat [ string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier ]

let get_cluster_credentials_message_to_query path (x : get_cluster_credentials_message) =
  List.concat
    [
      string__to_query (List.append path [ "DbUser" ]) x.db_user;
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbName" ]) v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.duration_seconds with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "DurationSeconds" ]) v);
      (match x.auto_create with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoCreate" ]) v);
      (match x.db_groups with
      | None -> []
      | Some v -> db_group_list_to_query (List.append path [ "DbGroups" ]) v);
      (match x.custom_domain_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomDomainName" ]) v);
    ]

let get_cluster_credentials_with_iam_message_to_query path
    (x : get_cluster_credentials_with_iam_message) =
  List.concat
    [
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbName" ]) v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.duration_seconds with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "DurationSeconds" ]) v);
      (match x.custom_domain_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomDomainName" ]) v);
    ]

let redshift_invalid_parameter_fault_to_query path (x : redshift_invalid_parameter_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let get_identity_center_auth_token_response_to_query path
    (x : get_identity_center_auth_token_response) =
  List.concat
    [
      (match x.token with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "Token" ]) v);
      (match x.expiration_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ExpirationTime" ]) v);
    ]

let get_identity_center_auth_token_request_to_query path
    (x : get_identity_center_auth_token_request) =
  List.concat [ cluster_identifier_list_to_query (List.append path [ "ClusterIds" ]) x.cluster_ids ]

let reserved_node_configuration_option_to_query path (x : reserved_node_configuration_option) =
  List.concat
    [
      (match x.source_reserved_node with
      | None -> []
      | Some v -> reserved_node_to_query (List.append path [ "SourceReservedNode" ]) v);
      (match x.target_reserved_node_count with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "TargetReservedNodeCount" ]) v);
      (match x.target_reserved_node_offering with
      | None -> []
      | Some v ->
          reserved_node_offering_to_query (List.append path [ "TargetReservedNodeOffering" ]) v);
    ]

let reserved_node_configuration_option_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReservedNodeConfigurationOption"
    reserved_node_configuration_option_to_query path xs

let get_reserved_node_exchange_configuration_options_output_message_to_query path
    (x : get_reserved_node_exchange_configuration_options_output_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.reserved_node_configuration_option_list with
      | None -> []
      | Some v ->
          reserved_node_configuration_option_list_to_query
            (List.append path [ "ReservedNodeConfigurationOptionList" ])
            v);
    ]

let reserved_node_exchange_action_type_to_query path (x : reserved_node_exchange_action_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with RESTORE_CLUSTER -> "restore-cluster" | RESIZE_CLUSTER -> "resize-cluster")

let get_reserved_node_exchange_configuration_options_input_message_to_query path
    (x : get_reserved_node_exchange_configuration_options_input_message) =
  List.concat
    [
      reserved_node_exchange_action_type_to_query (List.append path [ "ActionType" ]) x.action_type;
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotIdentifier" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let get_reserved_node_exchange_offerings_output_message_to_query path
    (x : get_reserved_node_exchange_offerings_output_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.reserved_node_offerings with
      | None -> []
      | Some v ->
          reserved_node_offering_list_to_query (List.append path [ "ReservedNodeOfferings" ]) v);
    ]

let get_reserved_node_exchange_offerings_input_message_to_query path
    (x : get_reserved_node_exchange_offerings_input_message) =
  List.concat
    [
      string__to_query (List.append path [ "ReservedNodeId" ]) x.reserved_node_id;
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let invalid_policy_fault_to_query path (x : invalid_policy_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let resource_policy_to_query path (x : resource_policy) =
  List.concat
    [
      (match x.resource_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceArn" ]) v);
      (match x.policy with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Policy" ]) v);
    ]

let get_resource_policy_result_to_query path (x : get_resource_policy_result) =
  List.concat
    [
      (match x.resource_policy with
      | None -> []
      | Some v -> resource_policy_to_query (List.append path [ "ResourcePolicy" ]) v);
    ]

let get_resource_policy_message_to_query path (x : get_resource_policy_message) =
  List.concat [ string__to_query (List.append path [ "ResourceArn" ]) x.resource_arn ]

let impact_ranking_type_to_query path (x : impact_ranking_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with HIGH -> "HIGH" | MEDIUM -> "MEDIUM" | LOW -> "LOW")

let in_progress_table_restore_quota_exceeded_fault_to_query path
    (x : in_progress_table_restore_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_restore_fault_to_query path (x : invalid_restore_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_table_restore_argument_fault_to_query path (x : invalid_table_restore_argument_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let lakehouse_configuration_to_query path (x : lakehouse_configuration) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.lakehouse_idc_application_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LakehouseIdcApplicationArn" ]) v);
      (match x.lakehouse_registration_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LakehouseRegistrationStatus" ]) v);
      (match x.catalog_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CatalogArn" ]) v);
    ]

let lakehouse_idc_registration_to_query path (x : lakehouse_idc_registration) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ASSOCIATE -> "Associate" | DISASSOCIATE -> "Disassociate")

let lakehouse_registration_to_query path (x : lakehouse_registration) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with REGISTER -> "Register" | DEREGISTER -> "Deregister")

let reference_link_to_query path (x : reference_link) =
  List.concat
    [
      (match x.text with None -> [] | Some v -> string__to_query (List.append path [ "Text" ]) v);
      (match x.link with None -> [] | Some v -> string__to_query (List.append path [ "Link" ]) v);
    ]

let reference_link_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReferenceLink" reference_link_to_query path
    xs

let recommended_action_type_to_query path (x : recommended_action_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SQL -> "SQL" | CLI -> "CLI")

let recommended_action_to_query path (x : recommended_action) =
  List.concat
    [
      (match x.text with None -> [] | Some v -> string__to_query (List.append path [ "Text" ]) v);
      (match x.database with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Database" ]) v);
      (match x.command with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Command" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> recommended_action_type_to_query (List.append path [ "Type" ]) v);
    ]

let recommended_action_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "RecommendedAction"
    recommended_action_to_query path xs

let recommendation_to_query path (x : recommendation) =
  List.concat
    [
      (match x.id with None -> [] | Some v -> string__to_query (List.append path [ "Id" ]) v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.namespace_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NamespaceArn" ]) v);
      (match x.created_at with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreatedAt" ]) v);
      (match x.recommendation_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RecommendationType" ]) v);
      (match x.title with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Title" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.observation with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Observation" ]) v);
      (match x.impact_ranking with
      | None -> []
      | Some v -> impact_ranking_type_to_query (List.append path [ "ImpactRanking" ]) v);
      (match x.recommendation_text with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RecommendationText" ]) v);
      (match x.recommended_actions with
      | None -> []
      | Some v -> recommended_action_list_to_query (List.append path [ "RecommendedActions" ]) v);
      (match x.reference_links with
      | None -> []
      | Some v -> reference_link_list_to_query (List.append path [ "ReferenceLinks" ]) v);
    ]

let recommendation_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Recommendation" recommendation_to_query path
    xs

let list_recommendations_result_to_query path (x : list_recommendations_result) =
  List.concat
    [
      (match x.recommendations with
      | None -> []
      | Some v -> recommendation_list_to_query (List.append path [ "Recommendations" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let list_recommendations_message_to_query path (x : list_recommendations_message) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.namespace_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NamespaceArn" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let modify_aqua_output_message_to_query path (x : modify_aqua_output_message) =
  List.concat
    [
      (match x.aqua_configuration with
      | None -> []
      | Some v -> aqua_configuration_to_query (List.append path [ "AquaConfiguration" ]) v);
    ]

let modify_aqua_input_message_to_query path (x : modify_aqua_input_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.aqua_configuration_status with
      | None -> []
      | Some v ->
          aqua_configuration_status_to_query (List.append path [ "AquaConfigurationStatus" ]) v);
    ]

let modify_authentication_profile_result_to_query path (x : modify_authentication_profile_result) =
  List.concat
    [
      (match x.authentication_profile_name with
      | None -> []
      | Some v ->
          authentication_profile_name_string_to_query
            (List.append path [ "AuthenticationProfileName" ])
            v);
      (match x.authentication_profile_content with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AuthenticationProfileContent" ]) v);
    ]

let modify_authentication_profile_message_to_query path (x : modify_authentication_profile_message)
    =
  List.concat
    [
      authentication_profile_name_string_to_query
        (List.append path [ "AuthenticationProfileName" ])
        x.authentication_profile_name;
      string__to_query
        (List.append path [ "AuthenticationProfileContent" ])
        x.authentication_profile_content;
    ]

let unsupported_option_fault_to_query path (x : unsupported_option_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let table_limit_exceeded_fault_to_query path (x : table_limit_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_cluster_result_to_query path (x : modify_cluster_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let modify_cluster_message_to_query path (x : modify_cluster_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.cluster_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterType" ]) v);
      (match x.node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeType" ]) v);
      (match x.number_of_nodes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumberOfNodes" ]) v);
      (match x.cluster_security_groups with
      | None -> []
      | Some v ->
          cluster_security_group_name_list_to_query (List.append path [ "ClusterSecurityGroups" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterParameterGroupName" ]) v);
      (match x.automated_snapshot_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "AutomatedSnapshotRetentionPeriod" ]) v);
      (match x.manual_snapshot_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ManualSnapshotRetentionPeriod" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.cluster_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterVersion" ]) v);
      (match x.allow_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AllowVersionUpgrade" ]) v);
      (match x.hsm_client_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmClientCertificateIdentifier" ]) v);
      (match x.hsm_configuration_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmConfigurationIdentifier" ]) v);
      (match x.new_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NewClusterIdentifier" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.elastic_ip with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ElasticIp" ]) v);
      (match x.enhanced_vpc_routing with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnhancedVpcRouting" ]) v);
      (match x.maintenance_track_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MaintenanceTrackName" ]) v);
      (match x.encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Encrypted" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.availability_zone_relocation with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AvailabilityZoneRelocation" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.manage_master_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterPassword" ]) v);
      (match x.master_password_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterPasswordSecretKmsKeyId" ]) v);
      (match x.ip_address_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IpAddressType" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.extra_compute_for_automatic_optimization with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "ExtraComputeForAutomaticOptimization" ]) v);
    ]

let modify_cluster_db_revision_result_to_query path (x : modify_cluster_db_revision_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let modify_cluster_db_revision_message_to_query path (x : modify_cluster_db_revision_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      string__to_query (List.append path [ "RevisionTarget" ]) x.revision_target;
    ]

let modify_cluster_iam_roles_result_to_query path (x : modify_cluster_iam_roles_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let modify_cluster_iam_roles_message_to_query path (x : modify_cluster_iam_roles_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.add_iam_roles with
      | None -> []
      | Some v -> iam_role_arn_list_to_query (List.append path [ "AddIamRoles" ]) v);
      (match x.remove_iam_roles with
      | None -> []
      | Some v -> iam_role_arn_list_to_query (List.append path [ "RemoveIamRoles" ]) v);
      (match x.default_iam_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DefaultIamRoleArn" ]) v);
    ]

let modify_cluster_maintenance_result_to_query path (x : modify_cluster_maintenance_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let modify_cluster_maintenance_message_to_query path (x : modify_cluster_maintenance_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.defer_maintenance with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeferMaintenance" ]) v);
      (match x.defer_maintenance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DeferMaintenanceIdentifier" ]) v);
      (match x.defer_maintenance_start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "DeferMaintenanceStartTime" ]) v);
      (match x.defer_maintenance_end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "DeferMaintenanceEndTime" ]) v);
      (match x.defer_maintenance_duration with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "DeferMaintenanceDuration" ]) v);
    ]

let modify_cluster_parameter_group_message_to_query path
    (x : modify_cluster_parameter_group_message) =
  List.concat
    [
      string__to_query (List.append path [ "ParameterGroupName" ]) x.parameter_group_name;
      parameters_list_to_query (List.append path [ "Parameters" ]) x.parameters;
    ]

let modify_cluster_snapshot_result_to_query path (x : modify_cluster_snapshot_result) =
  List.concat
    [
      (match x.snapshot with
      | None -> []
      | Some v -> snapshot_to_query (List.append path [ "Snapshot" ]) v);
    ]

let modify_cluster_snapshot_message_to_query path (x : modify_cluster_snapshot_message) =
  List.concat
    [
      string__to_query (List.append path [ "SnapshotIdentifier" ]) x.snapshot_identifier;
      (match x.manual_snapshot_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ManualSnapshotRetentionPeriod" ]) v);
      (match x.force with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Force" ]) v);
    ]

let modify_cluster_snapshot_schedule_message_to_query path
    (x : modify_cluster_snapshot_schedule_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.schedule_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ScheduleIdentifier" ]) v);
      (match x.disassociate_schedule with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DisassociateSchedule" ]) v);
    ]

let subnet_already_in_use_to_query path (x : subnet_already_in_use) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_cluster_subnet_group_result_to_query path (x : modify_cluster_subnet_group_result) =
  List.concat
    [
      (match x.cluster_subnet_group with
      | None -> []
      | Some v -> cluster_subnet_group_to_query (List.append path [ "ClusterSubnetGroup" ]) v);
    ]

let modify_cluster_subnet_group_message_to_query path (x : modify_cluster_subnet_group_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterSubnetGroupName" ]) x.cluster_subnet_group_name;
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      subnet_identifier_list_to_query (List.append path [ "SubnetIds" ]) x.subnet_ids;
    ]

let modify_custom_domain_association_result_to_query path
    (x : modify_custom_domain_association_result) =
  List.concat
    [
      (match x.custom_domain_name with
      | None -> []
      | Some v -> custom_domain_name_string_to_query (List.append path [ "CustomDomainName" ]) v);
      (match x.custom_domain_certificate_arn with
      | None -> []
      | Some v ->
          custom_domain_certificate_arn_string_to_query
            (List.append path [ "CustomDomainCertificateArn" ])
            v);
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.custom_domain_cert_expiry_time with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomDomainCertExpiryTime" ]) v);
    ]

let modify_custom_domain_association_message_to_query path
    (x : modify_custom_domain_association_message) =
  List.concat
    [
      custom_domain_name_string_to_query
        (List.append path [ "CustomDomainName" ])
        x.custom_domain_name;
      custom_domain_certificate_arn_string_to_query
        (List.append path [ "CustomDomainCertificateArn" ])
        x.custom_domain_certificate_arn;
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
    ]

let modify_endpoint_access_message_to_query path (x : modify_endpoint_access_message) =
  List.concat
    [
      string__to_query (List.append path [ "EndpointName" ]) x.endpoint_name;
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
    ]

let modify_event_subscription_result_to_query path (x : modify_event_subscription_result) =
  List.concat
    [
      (match x.event_subscription with
      | None -> []
      | Some v -> event_subscription_to_query (List.append path [ "EventSubscription" ]) v);
    ]

let modify_event_subscription_message_to_query path (x : modify_event_subscription_message) =
  List.concat
    [
      string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name;
      (match x.sns_topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnsTopicArn" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      (match x.source_ids with
      | None -> []
      | Some v -> source_ids_list_to_query (List.append path [ "SourceIds" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
      (match x.severity with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Severity" ]) v);
      (match x.enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Enabled" ]) v);
    ]

let modify_integration_message_to_query path (x : modify_integration_message) =
  List.concat
    [
      integration_arn_to_query (List.append path [ "IntegrationArn" ]) x.integration_arn;
      (match x.description with
      | None -> []
      | Some v -> integration_description_to_query (List.append path [ "Description" ]) v);
      (match x.integration_name with
      | None -> []
      | Some v -> integration_name_to_query (List.append path [ "IntegrationName" ]) v);
    ]

let modify_lakehouse_configuration_message_to_query path
    (x : modify_lakehouse_configuration_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.lakehouse_registration with
      | None -> []
      | Some v -> lakehouse_registration_to_query (List.append path [ "LakehouseRegistration" ]) v);
      (match x.catalog_name with
      | None -> []
      | Some v -> catalog_name_string_to_query (List.append path [ "CatalogName" ]) v);
      (match x.lakehouse_idc_registration with
      | None -> []
      | Some v ->
          lakehouse_idc_registration_to_query (List.append path [ "LakehouseIdcRegistration" ]) v);
      (match x.lakehouse_idc_application_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LakehouseIdcApplicationArn" ]) v);
      (match x.dry_run with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DryRun" ]) v);
    ]

let modify_redshift_idc_application_result_to_query path
    (x : modify_redshift_idc_application_result) =
  List.concat
    [
      (match x.redshift_idc_application with
      | None -> []
      | Some v ->
          redshift_idc_application_to_query (List.append path [ "RedshiftIdcApplication" ]) v);
    ]

let modify_redshift_idc_application_message_to_query path
    (x : modify_redshift_idc_application_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "RedshiftIdcApplicationArn" ])
        x.redshift_idc_application_arn;
      (match x.identity_namespace with
      | None -> []
      | Some v -> identity_namespace_string_to_query (List.append path [ "IdentityNamespace" ]) v);
      (match x.iam_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IamRoleArn" ]) v);
      (match x.idc_display_name with
      | None -> []
      | Some v -> idc_display_name_string_to_query (List.append path [ "IdcDisplayName" ]) v);
      (match x.authorized_token_issuer_list with
      | None -> []
      | Some v ->
          authorized_token_issuer_list_to_query (List.append path [ "AuthorizedTokenIssuerList" ]) v);
      (match x.service_integrations with
      | None -> []
      | Some v -> service_integration_list_to_query (List.append path [ "ServiceIntegrations" ]) v);
    ]

let modify_scheduled_action_message_to_query path (x : modify_scheduled_action_message) =
  List.concat
    [
      string__to_query (List.append path [ "ScheduledActionName" ]) x.scheduled_action_name;
      (match x.target_action with
      | None -> []
      | Some v -> scheduled_action_type_to_query (List.append path [ "TargetAction" ]) v);
      (match x.schedule with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Schedule" ]) v);
      (match x.iam_role with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IamRole" ]) v);
      (match x.scheduled_action_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ScheduledActionDescription" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.enable with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Enable" ]) v);
    ]

let snapshot_copy_disabled_fault_to_query path (x : snapshot_copy_disabled_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_snapshot_copy_retention_period_result_to_query path
    (x : modify_snapshot_copy_retention_period_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let modify_snapshot_copy_retention_period_message_to_query path
    (x : modify_snapshot_copy_retention_period_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      integer_to_query (List.append path [ "RetentionPeriod" ]) x.retention_period;
      (match x.manual with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Manual" ]) v);
    ]

let snapshot_schedule_update_in_progress_fault_to_query path
    (x : snapshot_schedule_update_in_progress_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_snapshot_schedule_message_to_query path (x : modify_snapshot_schedule_message) =
  List.concat
    [
      string__to_query (List.append path [ "ScheduleIdentifier" ]) x.schedule_identifier;
      schedule_definition_list_to_query
        (List.append path [ "ScheduleDefinitions" ])
        x.schedule_definitions;
    ]

let modify_usage_limit_message_to_query path (x : modify_usage_limit_message) =
  List.concat
    [
      string__to_query (List.append path [ "UsageLimitId" ]) x.usage_limit_id;
      (match x.amount with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "Amount" ]) v);
      (match x.breach_action with
      | None -> []
      | Some v -> usage_limit_breach_action_to_query (List.append path [ "BreachAction" ]) v);
    ]

let pause_cluster_result_to_query path (x : pause_cluster_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let reserved_node_quota_exceeded_fault_to_query path (x : reserved_node_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let purchase_reserved_node_offering_result_to_query path
    (x : purchase_reserved_node_offering_result) =
  List.concat
    [
      (match x.reserved_node with
      | None -> []
      | Some v -> reserved_node_to_query (List.append path [ "ReservedNode" ]) v);
    ]

let purchase_reserved_node_offering_message_to_query path
    (x : purchase_reserved_node_offering_message) =
  List.concat
    [
      string__to_query (List.append path [ "ReservedNodeOfferingId" ]) x.reserved_node_offering_id;
      (match x.node_count with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NodeCount" ]) v);
    ]

let put_resource_policy_result_to_query path (x : put_resource_policy_result) =
  List.concat
    [
      (match x.resource_policy with
      | None -> []
      | Some v -> resource_policy_to_query (List.append path [ "ResourcePolicy" ]) v);
    ]

let put_resource_policy_message_to_query path (x : put_resource_policy_message) =
  List.concat
    [
      string__to_query (List.append path [ "ResourceArn" ]) x.resource_arn;
      string__to_query (List.append path [ "Policy" ]) x.policy;
    ]

let reboot_cluster_result_to_query path (x : reboot_cluster_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let reboot_cluster_message_to_query path (x : reboot_cluster_message) =
  List.concat [ string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier ]

let update_partner_status_input_message_to_query path (x : update_partner_status_input_message) =
  List.concat
    [
      partner_integration_account_id_to_query (List.append path [ "AccountId" ]) x.account_id;
      partner_integration_cluster_identifier_to_query
        (List.append path [ "ClusterIdentifier" ])
        x.cluster_identifier;
      partner_integration_database_name_to_query
        (List.append path [ "DatabaseName" ])
        x.database_name;
      partner_integration_partner_name_to_query (List.append path [ "PartnerName" ]) x.partner_name;
      partner_integration_status_to_query (List.append path [ "Status" ]) x.status;
      (match x.status_message with
      | None -> []
      | Some v ->
          partner_integration_status_message_to_query (List.append path [ "StatusMessage" ]) v);
    ]

let rotate_encryption_key_result_to_query path (x : rotate_encryption_key_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let rotate_encryption_key_message_to_query path (x : rotate_encryption_key_message) =
  List.concat [ string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier ]

let revoke_snapshot_access_result_to_query path (x : revoke_snapshot_access_result) =
  List.concat
    [
      (match x.snapshot with
      | None -> []
      | Some v -> snapshot_to_query (List.append path [ "Snapshot" ]) v);
    ]

let revoke_snapshot_access_message_to_query path (x : revoke_snapshot_access_message) =
  List.concat
    [
      (match x.snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotIdentifier" ]) v);
      (match x.snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotArn" ]) v);
      (match x.snapshot_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotClusterIdentifier" ]) v);
      string__to_query
        (List.append path [ "AccountWithRestoreAccess" ])
        x.account_with_restore_access;
    ]

let revoke_endpoint_access_message_to_query path (x : revoke_endpoint_access_message) =
  List.concat
    [
      (match x.cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterIdentifier" ]) v);
      (match x.account with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Account" ]) v);
      (match x.vpc_ids with
      | None -> []
      | Some v -> vpc_identifier_list_to_query (List.append path [ "VpcIds" ]) v);
      (match x.force with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Force" ]) v);
    ]

let revoke_cluster_security_group_ingress_result_to_query path
    (x : revoke_cluster_security_group_ingress_result) =
  List.concat
    [
      (match x.cluster_security_group with
      | None -> []
      | Some v -> cluster_security_group_to_query (List.append path [ "ClusterSecurityGroup" ]) v);
    ]

let revoke_cluster_security_group_ingress_message_to_query path
    (x : revoke_cluster_security_group_ingress_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "ClusterSecurityGroupName" ])
        x.cluster_security_group_name;
      (match x.cidri_p with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CIDRIP" ]) v);
      (match x.ec2_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupName" ]) v);
      (match x.ec2_security_group_owner_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupOwnerId" ]) v);
    ]

let resume_cluster_result_to_query path (x : resume_cluster_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let restore_table_from_cluster_snapshot_result_to_query path
    (x : restore_table_from_cluster_snapshot_result) =
  List.concat
    [
      (match x.table_restore_status with
      | None -> []
      | Some v -> table_restore_status_to_query (List.append path [ "TableRestoreStatus" ]) v);
    ]

let restore_table_from_cluster_snapshot_message_to_query path
    (x : restore_table_from_cluster_snapshot_message) =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      string__to_query (List.append path [ "SnapshotIdentifier" ]) x.snapshot_identifier;
      string__to_query (List.append path [ "SourceDatabaseName" ]) x.source_database_name;
      (match x.source_schema_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceSchemaName" ]) v);
      string__to_query (List.append path [ "SourceTableName" ]) x.source_table_name;
      (match x.target_database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetDatabaseName" ]) v);
      (match x.target_schema_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetSchemaName" ]) v);
      string__to_query (List.append path [ "NewTableName" ]) x.new_table_name;
      (match x.enable_case_sensitive_identifier with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableCaseSensitiveIdentifier" ]) v);
    ]

let restore_from_cluster_snapshot_result_to_query path (x : restore_from_cluster_snapshot_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let restore_from_cluster_snapshot_message_to_query path (x : restore_from_cluster_snapshot_message)
    =
  List.concat
    [
      string__to_query (List.append path [ "ClusterIdentifier" ]) x.cluster_identifier;
      (match x.snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotIdentifier" ]) v);
      (match x.snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotArn" ]) v);
      (match x.snapshot_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotClusterIdentifier" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.allow_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AllowVersionUpgrade" ]) v);
      (match x.cluster_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterSubnetGroupName" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.owner_account with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OwnerAccount" ]) v);
      (match x.hsm_client_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmClientCertificateIdentifier" ]) v);
      (match x.hsm_configuration_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HsmConfigurationIdentifier" ]) v);
      (match x.elastic_ip with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ElasticIp" ]) v);
      (match x.cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClusterParameterGroupName" ]) v);
      (match x.cluster_security_groups with
      | None -> []
      | Some v ->
          cluster_security_group_name_list_to_query (List.append path [ "ClusterSecurityGroups" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.automated_snapshot_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "AutomatedSnapshotRetentionPeriod" ]) v);
      (match x.manual_snapshot_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ManualSnapshotRetentionPeriod" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeType" ]) v);
      (match x.enhanced_vpc_routing with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnhancedVpcRouting" ]) v);
      (match x.additional_info with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AdditionalInfo" ]) v);
      (match x.iam_roles with
      | None -> []
      | Some v -> iam_role_arn_list_to_query (List.append path [ "IamRoles" ]) v);
      (match x.maintenance_track_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MaintenanceTrackName" ]) v);
      (match x.snapshot_schedule_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotScheduleIdentifier" ]) v);
      (match x.number_of_nodes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumberOfNodes" ]) v);
      (match x.availability_zone_relocation with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AvailabilityZoneRelocation" ]) v);
      (match x.aqua_configuration_status with
      | None -> []
      | Some v ->
          aqua_configuration_status_to_query (List.append path [ "AquaConfigurationStatus" ]) v);
      (match x.default_iam_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DefaultIamRoleArn" ]) v);
      (match x.reserved_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedNodeId" ]) v);
      (match x.target_reserved_node_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetReservedNodeOfferingId" ]) v);
      (match x.encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Encrypted" ]) v);
      (match x.manage_master_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterPassword" ]) v);
      (match x.master_password_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterPasswordSecretKmsKeyId" ]) v);
      (match x.ip_address_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IpAddressType" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.catalog_name with
      | None -> []
      | Some v -> catalog_name_string_to_query (List.append path [ "CatalogName" ]) v);
      (match x.redshift_idc_application_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RedshiftIdcApplicationArn" ]) v);
    ]

let resize_cluster_result_to_query path (x : resize_cluster_result) =
  List.concat
    [
      (match x.cluster with
      | None -> []
      | Some v -> cluster_to_query (List.append path [ "Cluster" ]) v);
    ]

let reset_cluster_parameter_group_message_to_query path (x : reset_cluster_parameter_group_message)
    =
  List.concat
    [
      string__to_query (List.append path [ "ParameterGroupName" ]) x.parameter_group_name;
      (match x.reset_all_parameters with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ResetAllParameters" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
    ]

let reject_data_share_message_to_query path (x : reject_data_share_message) =
  List.concat [ string__to_query (List.append path [ "DataShareArn" ]) x.data_share_arn ]

let register_namespace_output_message_to_query path (x : register_namespace_output_message) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> namespace_registration_status_to_query (List.append path [ "Status" ]) v);
    ]

let register_namespace_input_message_to_query path (x : register_namespace_input_message) =
  List.concat
    [
      namespace_identifier_union_to_query
        (List.append path [ "NamespaceIdentifier" ])
        x.namespace_identifier;
      consumer_identifier_list_to_query
        (List.append path [ "ConsumerIdentifiers" ])
        x.consumer_identifiers;
    ]
