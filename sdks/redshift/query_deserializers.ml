open Types

let unit_of_xml _ = ()
let exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let reserved_node_offering_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Regular" -> Regular
   | "Upgradable" -> Upgradable
   | _ -> failwith "unknown enum value"
    : reserved_node_offering_type)

let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

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

let integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let t_stamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let reserved_node_of_xml i =
  let r_reserved_node_id = ref None in
  let r_reserved_node_offering_id = ref None in
  let r_node_type = ref None in
  let r_start_time = ref None in
  let r_duration = ref None in
  let r_fixed_price = ref None in
  let r_usage_price = ref None in
  let r_currency_code = ref None in
  let r_node_count = ref None in
  let r_state = ref None in
  let r_offering_type = ref None in
  let r_recurring_charges = ref None in
  let r_reserved_node_offering_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReservedNodeId";
      "ReservedNodeOfferingId";
      "NodeType";
      "StartTime";
      "Duration";
      "FixedPrice";
      "UsagePrice";
      "CurrencyCode";
      "NodeCount";
      "State";
      "OfferingType";
      "RecurringCharges";
      "ReservedNodeOfferingType";
    ] (fun tag _ ->
      match tag with
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedNodeOfferingId" ->
          r_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
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
      | "CurrencyCode" ->
          r_currency_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrencyCode" (fun i _ -> string__of_xml i) ())
      | "NodeCount" ->
          r_node_count :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeCount" (fun i _ -> integer_of_xml i) ())
      | "State" ->
          r_state :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "State" (fun i _ -> string__of_xml i) ())
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
      | "ReservedNodeOfferingType" ->
          r_reserved_node_offering_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingType"
                 (fun i _ -> reserved_node_offering_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_node_id = ( ! ) r_reserved_node_id;
     reserved_node_offering_id = ( ! ) r_reserved_node_offering_id;
     node_type = ( ! ) r_node_type;
     start_time = ( ! ) r_start_time;
     duration = ( ! ) r_duration;
     fixed_price = ( ! ) r_fixed_price;
     usage_price = ( ! ) r_usage_price;
     currency_code = ( ! ) r_currency_code;
     node_count = ( ! ) r_node_count;
     state = ( ! ) r_state;
     offering_type = ( ! ) r_offering_type;
     recurring_charges = ( ! ) r_recurring_charges;
     reserved_node_offering_type = ( ! ) r_reserved_node_offering_type;
   }
    : reserved_node)

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
  let r_reserved_node_id = ref None in
  let r_target_reserved_node_offering_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedNodeId"; "TargetReservedNodeOfferingId" ]
    (fun tag _ ->
      match tag with
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetReservedNodeOfferingId" ->
          r_target_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_node_id = Smaws_Lib.Xml.Parse.required "ReservedNodeId" (( ! ) r_reserved_node_id) i;
     target_reserved_node_offering_id =
       Smaws_Lib.Xml.Parse.required "TargetReservedNodeOfferingId"
         (( ! ) r_target_reserved_node_offering_id)
         i;
   }
    : accept_reserved_node_exchange_input_message)

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
                   Smaws_Lib.Xml.Parse.Read.sequences i "AttributeValueTarget"
                     (fun i _ -> attribute_value_target_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attribute_name = ( ! ) r_attribute_name; attribute_values = ( ! ) r_attribute_values }
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

let account_with_restore_access_of_xml i =
  let r_account_id = ref None in
  let r_account_alias = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccountId"; "AccountAlias" ] (fun tag _ ->
      match tag with
      | "AccountId" ->
          r_account_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId" (fun i _ -> string__of_xml i) ())
      | "AccountAlias" ->
          r_account_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountAlias" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ account_id = ( ! ) r_account_id; account_alias = ( ! ) r_account_alias }
    : account_with_restore_access)

let accounts_with_restore_access_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AccountWithRestoreAccess"
    (fun i _ -> account_with_restore_access_of_xml i)
    ()

let action_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "restore-cluster" -> RESTORE_CLUSTER
   | "recommend-node-config" -> RECOMMEND_NODE_CONFIG
   | "resize-cluster" -> RESIZE_CLUSTER
   | _ -> failwith "unknown enum value"
    : action_type)

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

let partner_integration_partner_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let partner_integration_database_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let partner_integration_output_message_of_xml i =
  let r_database_name = ref None in
  let r_partner_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DatabaseName"; "PartnerName" ] (fun tag _ ->
      match tag with
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName"
                 (fun i _ -> partner_integration_database_name_of_xml i)
                 ())
      | "PartnerName" ->
          r_partner_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PartnerName"
                 (fun i _ -> partner_integration_partner_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ database_name = ( ! ) r_database_name; partner_name = ( ! ) r_partner_name }
    : partner_integration_output_message)

let partner_integration_cluster_identifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let partner_integration_account_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let partner_integration_input_message_of_xml i =
  let r_account_id = ref None in
  let r_cluster_identifier = ref None in
  let r_database_name = ref None in
  let r_partner_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AccountId"; "ClusterIdentifier"; "DatabaseName"; "PartnerName" ] (fun tag _ ->
      match tag with
      | "AccountId" ->
          r_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId"
                 (fun i _ -> partner_integration_account_id_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> partner_integration_cluster_identifier_of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName"
                 (fun i _ -> partner_integration_database_name_of_xml i)
                 ())
      | "PartnerName" ->
          r_partner_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PartnerName"
                 (fun i _ -> partner_integration_partner_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     account_id = Smaws_Lib.Xml.Parse.required "AccountId" (( ! ) r_account_id) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     database_name = Smaws_Lib.Xml.Parse.required "DatabaseName" (( ! ) r_database_name) i;
     partner_name = Smaws_Lib.Xml.Parse.required "PartnerName" (( ! ) r_partner_name) i;
   }
    : partner_integration_input_message)

let application_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "None" -> NONE | "Lakehouse" -> LAKEHOUSE | _ -> failwith "unknown enum value"
    : application_type)

let aqua_configuration_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "enabled" -> ENABLED
   | "disabled" -> DISABLED
   | "auto" -> AUTO
   | _ -> failwith "unknown enum value"
    : aqua_configuration_status)

let aqua_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "enabled" -> ENABLED
   | "disabled" -> DISABLED
   | "applying" -> APPLYING
   | _ -> failwith "unknown enum value"
    : aqua_status)

let aqua_configuration_of_xml i =
  let r_aqua_status = ref None in
  let r_aqua_configuration_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AquaStatus"; "AquaConfigurationStatus" ]
    (fun tag _ ->
      match tag with
      | "AquaStatus" ->
          r_aqua_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaStatus"
                 (fun i _ -> aqua_status_of_xml i)
                 ())
      | "AquaConfigurationStatus" ->
          r_aqua_configuration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaConfigurationStatus"
                 (fun i _ -> aqua_configuration_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     aqua_status = ( ! ) r_aqua_status;
     aqua_configuration_status = ( ! ) r_aqua_configuration_status;
   }
    : aqua_configuration)

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

let data_share_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "INTERNAL" -> INTERNAL | _ -> failwith "unknown enum value" : data_share_type)

let boolean_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let data_share_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ACTIVE" -> ACTIVE
   | "PENDING_AUTHORIZATION" -> PENDING_AUTHORIZATION
   | "AUTHORIZED" -> AUTHORIZED
   | "DEAUTHORIZED" -> DEAUTHORIZED
   | "REJECTED" -> REJECTED
   | "AVAILABLE" -> AVAILABLE
   | _ -> failwith "unknown enum value"
    : data_share_status)

let data_share_association_of_xml i =
  let r_consumer_identifier = ref None in
  let r_status = ref None in
  let r_consumer_region = ref None in
  let r_created_date = ref None in
  let r_status_change_date = ref None in
  let r_producer_allowed_writes = ref None in
  let r_consumer_accepted_writes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ConsumerIdentifier";
      "Status";
      "ConsumerRegion";
      "CreatedDate";
      "StatusChangeDate";
      "ProducerAllowedWrites";
      "ConsumerAcceptedWrites";
    ] (fun tag _ ->
      match tag with
      | "ConsumerIdentifier" ->
          r_consumer_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> data_share_status_of_xml i)
                 ())
      | "ConsumerRegion" ->
          r_consumer_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CreatedDate" ->
          r_created_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedDate" (fun i _ -> t_stamp_of_xml i) ())
      | "StatusChangeDate" ->
          r_status_change_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusChangeDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ProducerAllowedWrites" ->
          r_producer_allowed_writes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProducerAllowedWrites"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ConsumerAcceptedWrites" ->
          r_consumer_accepted_writes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerAcceptedWrites"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     consumer_identifier = ( ! ) r_consumer_identifier;
     status = ( ! ) r_status;
     consumer_region = ( ! ) r_consumer_region;
     created_date = ( ! ) r_created_date;
     status_change_date = ( ! ) r_status_change_date;
     producer_allowed_writes = ( ! ) r_producer_allowed_writes;
     consumer_accepted_writes = ( ! ) r_consumer_accepted_writes;
   }
    : data_share_association)

let data_share_association_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> data_share_association_of_xml i) ()

let boolean__of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let data_share_of_xml i =
  let r_data_share_arn = ref None in
  let r_producer_arn = ref None in
  let r_allow_publicly_accessible_consumers = ref None in
  let r_data_share_associations = ref None in
  let r_managed_by = ref None in
  let r_data_share_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DataShareArn";
      "ProducerArn";
      "AllowPubliclyAccessibleConsumers";
      "DataShareAssociations";
      "ManagedBy";
      "DataShareType";
    ] (fun tag _ ->
      match tag with
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | "ProducerArn" ->
          r_producer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProducerArn" (fun i _ -> string__of_xml i) ())
      | "AllowPubliclyAccessibleConsumers" ->
          r_allow_publicly_accessible_consumers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowPubliclyAccessibleConsumers"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "DataShareAssociations" ->
          r_data_share_associations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareAssociations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> data_share_association_of_xml i)
                     ())
                 ())
      | "ManagedBy" ->
          r_managed_by :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedBy" (fun i _ -> string__of_xml i) ())
      | "DataShareType" ->
          r_data_share_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareType"
                 (fun i _ -> data_share_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     data_share_arn = ( ! ) r_data_share_arn;
     producer_arn = ( ! ) r_producer_arn;
     allow_publicly_accessible_consumers = ( ! ) r_allow_publicly_accessible_consumers;
     data_share_associations = ( ! ) r_data_share_associations;
     managed_by = ( ! ) r_managed_by;
     data_share_type = ( ! ) r_data_share_type;
   }
    : data_share)

let associate_data_share_consumer_message_of_xml i =
  let r_data_share_arn = ref None in
  let r_associate_entire_account = ref None in
  let r_consumer_arn = ref None in
  let r_consumer_region = ref None in
  let r_allow_writes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DataShareArn"; "AssociateEntireAccount"; "ConsumerArn"; "ConsumerRegion"; "AllowWrites" ]
    (fun tag _ ->
      match tag with
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | "AssociateEntireAccount" ->
          r_associate_entire_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociateEntireAccount"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ConsumerArn" ->
          r_consumer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerArn" (fun i _ -> string__of_xml i) ())
      | "ConsumerRegion" ->
          r_consumer_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AllowWrites" ->
          r_allow_writes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowWrites"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     data_share_arn = Smaws_Lib.Xml.Parse.required "DataShareArn" (( ! ) r_data_share_arn) i;
     associate_entire_account = ( ! ) r_associate_entire_account;
     consumer_arn = ( ! ) r_consumer_arn;
     consumer_region = ( ! ) r_consumer_region;
     allow_writes = ( ! ) r_allow_writes;
   }
    : associate_data_share_consumer_message)

let schedule_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "MODIFYING" -> MODIFYING
   | "ACTIVE" -> ACTIVE
   | "FAILED" -> FAILED
   | _ -> failwith "unknown enum value"
    : schedule_state)

let cluster_associated_to_schedule_of_xml i =
  let r_cluster_identifier = ref None in
  let r_schedule_association_state = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier"; "ScheduleAssociationState" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ScheduleAssociationState" ->
          r_schedule_association_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleAssociationState"
                 (fun i _ -> schedule_state_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier = ( ! ) r_cluster_identifier;
     schedule_association_state = ( ! ) r_schedule_association_state;
   }
    : cluster_associated_to_schedule)

let associated_cluster_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterAssociatedToSchedule"
    (fun i _ -> cluster_associated_to_schedule_of_xml i)
    ()

let certificate_association_of_xml i =
  let r_custom_domain_name = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CustomDomainName"; "ClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
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
     custom_domain_name = ( ! ) r_custom_domain_name;
     cluster_identifier = ( ! ) r_cluster_identifier;
   }
    : certificate_association)

let certificate_association_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "CertificateAssociation"
    (fun i _ -> certificate_association_of_xml i)
    ()

let association_of_xml i =
  let r_custom_domain_certificate_arn = ref None in
  let r_custom_domain_certificate_expiry_date = ref None in
  let r_certificate_associations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CustomDomainCertificateArn"; "CustomDomainCertificateExpiryDate"; "CertificateAssociations" ]
    (fun tag _ ->
      match tag with
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainCertificateExpiryDate" ->
          r_custom_domain_certificate_expiry_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateExpiryDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "CertificateAssociations" ->
          r_certificate_associations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CertificateAssociations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "CertificateAssociation"
                     (fun i _ -> certificate_association_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_domain_certificate_arn = ( ! ) r_custom_domain_certificate_arn;
     custom_domain_certificate_expiry_date = ( ! ) r_custom_domain_certificate_expiry_date;
     certificate_associations = ( ! ) r_certificate_associations;
   }
    : association)

let association_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Association" (fun i _ -> association_of_xml i) ()

let attribute_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AttributeName" (fun i _ -> string__of_xml i) ()

let authentication_profile_name_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let authentication_profile_of_xml i =
  let r_authentication_profile_name = ref None in
  let r_authentication_profile_content = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AuthenticationProfileName"; "AuthenticationProfileContent" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | "AuthenticationProfileContent" ->
          r_authentication_profile_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileContent"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authentication_profile_name = ( ! ) r_authentication_profile_name;
     authentication_profile_content = ( ! ) r_authentication_profile_content;
   }
    : authentication_profile)

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

let authentication_profile_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> authentication_profile_of_xml i) ()

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

let authorization_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Authorized" -> AUTHORIZED
   | "Revoking" -> REVOKING
   | _ -> failwith "unknown enum value"
    : authorization_status)

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

let ip_range_of_xml i =
  let r_status = ref None in
  let r_cidri_p = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "CIDRIP"; "Tags" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "CIDRIP" ->
          r_cidri_p :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CIDRIP" (fun i _ -> string__of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status; cidri_p = ( ! ) r_cidri_p; tags = ( ! ) r_tags } : ip_range)

let ip_range_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "IPRange" (fun i _ -> ip_range_of_xml i) ()

let ec2_security_group_of_xml i =
  let r_status = ref None in
  let r_ec2_security_group_name = ref None in
  let r_ec2_security_group_owner_id = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Status"; "EC2SecurityGroupName"; "EC2SecurityGroupOwnerId"; "Tags" ] (fun tag _ ->
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
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = ( ! ) r_status;
     ec2_security_group_name = ( ! ) r_ec2_security_group_name;
     ec2_security_group_owner_id = ( ! ) r_ec2_security_group_owner_id;
     tags = ( ! ) r_tags;
   }
    : ec2_security_group)

let ec2_security_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "EC2SecurityGroup"
    (fun i _ -> ec2_security_group_of_xml i)
    ()

let cluster_security_group_of_xml i =
  let r_cluster_security_group_name = ref None in
  let r_description = ref None in
  let r_ec2_security_groups = ref None in
  let r_ip_ranges = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterSecurityGroupName"; "Description"; "EC2SecurityGroups"; "IPRanges"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
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
      | "IPRanges" ->
          r_ip_ranges :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IPRanges"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "IPRange" (fun i _ -> ip_range_of_xml i) ())
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
     cluster_security_group_name = ( ! ) r_cluster_security_group_name;
     description = ( ! ) r_description;
     ec2_security_groups = ( ! ) r_ec2_security_groups;
     ip_ranges = ( ! ) r_ip_ranges;
     tags = ( ! ) r_tags;
   }
    : cluster_security_group)

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
  let r_cluster_security_group_name = ref None in
  let r_cidri_p = ref None in
  let r_ec2_security_group_name = ref None in
  let r_ec2_security_group_owner_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterSecurityGroupName"; "CIDRIP"; "EC2SecurityGroupName"; "EC2SecurityGroupOwnerId" ]
    (fun tag _ ->
      match tag with
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CIDRIP" ->
          r_cidri_p :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CIDRIP" (fun i _ -> string__of_xml i) ())
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
     cluster_security_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSecurityGroupName"
         (( ! ) r_cluster_security_group_name)
         i;
     cidri_p = ( ! ) r_cidri_p;
     ec2_security_group_name = ( ! ) r_ec2_security_group_name;
     ec2_security_group_owner_id = ( ! ) r_ec2_security_group_owner_id;
   }
    : authorize_cluster_security_group_ingress_message)

let authorize_data_share_message_of_xml i =
  let r_data_share_arn = ref None in
  let r_consumer_identifier = ref None in
  let r_allow_writes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DataShareArn"; "ConsumerIdentifier"; "AllowWrites" ] (fun tag _ ->
      match tag with
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | "ConsumerIdentifier" ->
          r_consumer_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AllowWrites" ->
          r_allow_writes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowWrites"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     data_share_arn = Smaws_Lib.Xml.Parse.required "DataShareArn" (( ! ) r_data_share_arn) i;
     consumer_identifier =
       Smaws_Lib.Xml.Parse.required "ConsumerIdentifier" (( ! ) r_consumer_identifier) i;
     allow_writes = ( ! ) r_allow_writes;
   }
    : authorize_data_share_message)

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

let vpc_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcIdentifier" (fun i _ -> string__of_xml i) ()

let endpoint_authorization_of_xml i =
  let r_grantor = ref None in
  let r_grantee = ref None in
  let r_cluster_identifier = ref None in
  let r_authorize_time = ref None in
  let r_cluster_status = ref None in
  let r_status = ref None in
  let r_allowed_all_vp_cs = ref None in
  let r_allowed_vp_cs = ref None in
  let r_endpoint_count = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Grantor";
      "Grantee";
      "ClusterIdentifier";
      "AuthorizeTime";
      "ClusterStatus";
      "Status";
      "AllowedAllVPCs";
      "AllowedVPCs";
      "EndpointCount";
    ] (fun tag _ ->
      match tag with
      | "Grantor" ->
          r_grantor :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Grantor" (fun i _ -> string__of_xml i) ())
      | "Grantee" ->
          r_grantee :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Grantee" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AuthorizeTime" ->
          r_authorize_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthorizeTime" (fun i _ -> t_stamp_of_xml i) ())
      | "ClusterStatus" ->
          r_cluster_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterStatus" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> authorization_status_of_xml i)
                 ())
      | "AllowedAllVPCs" ->
          r_allowed_all_vp_cs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedAllVPCs"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "AllowedVPCs" ->
          r_allowed_vp_cs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedVPCs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "EndpointCount" ->
          r_endpoint_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointCount" (fun i _ -> integer_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     grantor = ( ! ) r_grantor;
     grantee = ( ! ) r_grantee;
     cluster_identifier = ( ! ) r_cluster_identifier;
     authorize_time = ( ! ) r_authorize_time;
     cluster_status = ( ! ) r_cluster_status;
     status = ( ! ) r_status;
     allowed_all_vp_cs = ( ! ) r_allowed_all_vp_cs;
     allowed_vp_cs = ( ! ) r_allowed_vp_cs;
     endpoint_count = ( ! ) r_endpoint_count;
   }
    : endpoint_authorization)

let authorize_endpoint_access_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_account = ref None in
  let r_vpc_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier"; "Account"; "VpcIds" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> string__of_xml i) ())
      | "VpcIds" ->
          r_vpc_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier = ( ! ) r_cluster_identifier;
     account = Smaws_Lib.Xml.Parse.required "Account" (( ! ) r_account) i;
     vpc_ids = ( ! ) r_vpc_ids;
   }
    : authorize_endpoint_access_message)

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

let integer_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let restorable_node_type_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeType" (fun i _ -> string__of_xml i) ()

let long_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let snapshot_of_xml i =
  let r_snapshot_identifier = ref None in
  let r_cluster_identifier = ref None in
  let r_snapshot_create_time = ref None in
  let r_status = ref None in
  let r_port = ref None in
  let r_availability_zone = ref None in
  let r_cluster_create_time = ref None in
  let r_master_username = ref None in
  let r_cluster_version = ref None in
  let r_engine_full_version = ref None in
  let r_snapshot_type = ref None in
  let r_node_type = ref None in
  let r_number_of_nodes = ref None in
  let r_db_name = ref None in
  let r_vpc_id = ref None in
  let r_encrypted = ref None in
  let r_kms_key_id = ref None in
  let r_encrypted_with_hs_m = ref None in
  let r_accounts_with_restore_access = ref None in
  let r_owner_account = ref None in
  let r_total_backup_size_in_mega_bytes = ref None in
  let r_actual_incremental_backup_size_in_mega_bytes = ref None in
  let r_backup_progress_in_mega_bytes = ref None in
  let r_current_backup_rate_in_mega_bytes_per_second = ref None in
  let r_estimated_seconds_to_completion = ref None in
  let r_elapsed_time_in_seconds = ref None in
  let r_source_region = ref None in
  let r_tags = ref None in
  let r_restorable_node_types = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_maintenance_track_name = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_manual_snapshot_remaining_days = ref None in
  let r_snapshot_retention_start_time = ref None in
  let r_master_password_secret_arn = ref None in
  let r_master_password_secret_kms_key_id = ref None in
  let r_snapshot_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SnapshotIdentifier";
      "ClusterIdentifier";
      "SnapshotCreateTime";
      "Status";
      "Port";
      "AvailabilityZone";
      "ClusterCreateTime";
      "MasterUsername";
      "ClusterVersion";
      "EngineFullVersion";
      "SnapshotType";
      "NodeType";
      "NumberOfNodes";
      "DBName";
      "VpcId";
      "Encrypted";
      "KmsKeyId";
      "EncryptedWithHSM";
      "AccountsWithRestoreAccess";
      "OwnerAccount";
      "TotalBackupSizeInMegaBytes";
      "ActualIncrementalBackupSizeInMegaBytes";
      "BackupProgressInMegaBytes";
      "CurrentBackupRateInMegaBytesPerSecond";
      "EstimatedSecondsToCompletion";
      "ElapsedTimeInSeconds";
      "SourceRegion";
      "Tags";
      "RestorableNodeTypes";
      "EnhancedVpcRouting";
      "MaintenanceTrackName";
      "ManualSnapshotRetentionPeriod";
      "ManualSnapshotRemainingDays";
      "SnapshotRetentionStartTime";
      "MasterPasswordSecretArn";
      "MasterPasswordSecretKmsKeyId";
      "SnapshotArn";
    ] (fun tag _ ->
      match tag with
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
      | "SnapshotCreateTime" ->
          r_snapshot_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
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
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EngineFullVersion" ->
          r_engine_full_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EngineFullVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotType" ->
          r_snapshot_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotType" (fun i _ -> string__of_xml i) ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes" (fun i _ -> integer_of_xml i) ())
      | "DBName" ->
          r_db_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DBName" (fun i _ -> string__of_xml i) ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "Encrypted" ->
          r_encrypted :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted" (fun i _ -> boolean__of_xml i) ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "EncryptedWithHSM" ->
          r_encrypted_with_hs_m :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EncryptedWithHSM"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "AccountsWithRestoreAccess" ->
          r_accounts_with_restore_access :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountsWithRestoreAccess"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AccountWithRestoreAccess"
                     (fun i _ -> account_with_restore_access_of_xml i)
                     ())
                 ())
      | "OwnerAccount" ->
          r_owner_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerAccount" (fun i _ -> string__of_xml i) ())
      | "TotalBackupSizeInMegaBytes" ->
          r_total_backup_size_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalBackupSizeInMegaBytes"
                 (fun i _ -> double_of_xml i)
                 ())
      | "ActualIncrementalBackupSizeInMegaBytes" ->
          r_actual_incremental_backup_size_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActualIncrementalBackupSizeInMegaBytes"
                 (fun i _ -> double_of_xml i)
                 ())
      | "BackupProgressInMegaBytes" ->
          r_backup_progress_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackupProgressInMegaBytes"
                 (fun i _ -> double_of_xml i)
                 ())
      | "CurrentBackupRateInMegaBytesPerSecond" ->
          r_current_backup_rate_in_mega_bytes_per_second :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentBackupRateInMegaBytesPerSecond"
                 (fun i _ -> double_of_xml i)
                 ())
      | "EstimatedSecondsToCompletion" ->
          r_estimated_seconds_to_completion :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedSecondsToCompletion"
                 (fun i _ -> long_of_xml i)
                 ())
      | "ElapsedTimeInSeconds" ->
          r_elapsed_time_in_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ElapsedTimeInSeconds"
                 (fun i _ -> long_of_xml i)
                 ())
      | "SourceRegion" ->
          r_source_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceRegion" (fun i _ -> string__of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "RestorableNodeTypes" ->
          r_restorable_node_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RestorableNodeTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeType" (fun i _ -> string__of_xml i) ())
                 ())
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ManualSnapshotRemainingDays" ->
          r_manual_snapshot_remaining_days :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRemainingDays"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "SnapshotRetentionStartTime" ->
          r_snapshot_retention_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotRetentionStartTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "MasterPasswordSecretArn" ->
          r_master_password_secret_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MasterPasswordSecretKmsKeyId" ->
          r_master_password_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     cluster_identifier = ( ! ) r_cluster_identifier;
     snapshot_create_time = ( ! ) r_snapshot_create_time;
     status = ( ! ) r_status;
     port = ( ! ) r_port;
     availability_zone = ( ! ) r_availability_zone;
     cluster_create_time = ( ! ) r_cluster_create_time;
     master_username = ( ! ) r_master_username;
     cluster_version = ( ! ) r_cluster_version;
     engine_full_version = ( ! ) r_engine_full_version;
     snapshot_type = ( ! ) r_snapshot_type;
     node_type = ( ! ) r_node_type;
     number_of_nodes = ( ! ) r_number_of_nodes;
     db_name = ( ! ) r_db_name;
     vpc_id = ( ! ) r_vpc_id;
     encrypted = ( ! ) r_encrypted;
     kms_key_id = ( ! ) r_kms_key_id;
     encrypted_with_hs_m = ( ! ) r_encrypted_with_hs_m;
     accounts_with_restore_access = ( ! ) r_accounts_with_restore_access;
     owner_account = ( ! ) r_owner_account;
     total_backup_size_in_mega_bytes = ( ! ) r_total_backup_size_in_mega_bytes;
     actual_incremental_backup_size_in_mega_bytes =
       ( ! ) r_actual_incremental_backup_size_in_mega_bytes;
     backup_progress_in_mega_bytes = ( ! ) r_backup_progress_in_mega_bytes;
     current_backup_rate_in_mega_bytes_per_second =
       ( ! ) r_current_backup_rate_in_mega_bytes_per_second;
     estimated_seconds_to_completion = ( ! ) r_estimated_seconds_to_completion;
     elapsed_time_in_seconds = ( ! ) r_elapsed_time_in_seconds;
     source_region = ( ! ) r_source_region;
     tags = ( ! ) r_tags;
     restorable_node_types = ( ! ) r_restorable_node_types;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     manual_snapshot_remaining_days = ( ! ) r_manual_snapshot_remaining_days;
     snapshot_retention_start_time = ( ! ) r_snapshot_retention_start_time;
     master_password_secret_arn = ( ! ) r_master_password_secret_arn;
     master_password_secret_kms_key_id = ( ! ) r_master_password_secret_kms_key_id;
     snapshot_arn = ( ! ) r_snapshot_arn;
   }
    : snapshot)

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
  let r_snapshot_identifier = ref None in
  let r_snapshot_arn = ref None in
  let r_snapshot_cluster_identifier = ref None in
  let r_account_with_restore_access = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SnapshotIdentifier"; "SnapshotArn"; "SnapshotClusterIdentifier"; "AccountWithRestoreAccess" ]
    (fun tag _ ->
      match tag with
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | "SnapshotClusterIdentifier" ->
          r_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AccountWithRestoreAccess" ->
          r_account_with_restore_access :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountWithRestoreAccess"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     snapshot_arn = ( ! ) r_snapshot_arn;
     snapshot_cluster_identifier = ( ! ) r_snapshot_cluster_identifier;
     account_with_restore_access =
       Smaws_Lib.Xml.Parse.required "AccountWithRestoreAccess"
         (( ! ) r_account_with_restore_access)
         i;
   }
    : authorize_snapshot_access_message)

let authorized_audience_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let authorized_token_issuer_of_xml i =
  let r_trusted_token_issuer_arn = ref None in
  let r_authorized_audiences_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TrustedTokenIssuerArn"; "AuthorizedAudiencesList" ] (fun tag _ ->
      match tag with
      | "TrustedTokenIssuerArn" ->
          r_trusted_token_issuer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TrustedTokenIssuerArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AuthorizedAudiencesList" ->
          r_authorized_audiences_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthorizedAudiencesList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     trusted_token_issuer_arn = ( ! ) r_trusted_token_issuer_arn;
     authorized_audiences_list = ( ! ) r_authorized_audiences_list;
   }
    : authorized_token_issuer)

let authorized_token_issuer_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> authorized_token_issuer_of_xml i) ()

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

let availability_zone_of_xml i =
  let r_name = ref None in
  let r_supported_platforms = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "SupportedPlatforms" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | "SupportedPlatforms" ->
          r_supported_platforms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedPlatforms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SupportedPlatform"
                     (fun i _ -> supported_platform_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; supported_platforms = ( ! ) r_supported_platforms } : availability_zone)

let availability_zone_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone" (fun i _ -> availability_zone_of_xml i) ()

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

let snapshot_error_message_of_xml i =
  let r_snapshot_identifier = ref None in
  let r_snapshot_cluster_identifier = ref None in
  let r_failure_code = ref None in
  let r_failure_reason = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SnapshotIdentifier"; "SnapshotClusterIdentifier"; "FailureCode"; "FailureReason" ]
    (fun tag _ ->
      match tag with
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotClusterIdentifier" ->
          r_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "FailureCode" ->
          r_failure_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureCode" (fun i _ -> string__of_xml i) ())
      | "FailureReason" ->
          r_failure_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureReason" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     snapshot_cluster_identifier = ( ! ) r_snapshot_cluster_identifier;
     failure_code = ( ! ) r_failure_code;
     failure_reason = ( ! ) r_failure_reason;
   }
    : snapshot_error_message)

let batch_snapshot_operation_error_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotErrorMessage"
    (fun i _ -> snapshot_error_message_of_xml i)
    ()

let snapshot_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "String" (fun i _ -> string__of_xml i) ()

let batch_delete_cluster_snapshots_result_of_xml i =
  let r_resources = ref None in
  let r_errors = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Resources"; "Errors" ] (fun tag _ ->
      match tag with
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "String" (fun i _ -> string__of_xml i) ())
                 ())
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotErrorMessage"
                     (fun i _ -> snapshot_error_message_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resources = ( ! ) r_resources; errors = ( ! ) r_errors }
    : batch_delete_cluster_snapshots_result)

let delete_cluster_snapshot_message_of_xml i =
  let r_snapshot_identifier = ref None in
  let r_snapshot_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SnapshotIdentifier"; "SnapshotClusterIdentifier" ]
    (fun tag _ ->
      match tag with
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotClusterIdentifier" ->
          r_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifier" (( ! ) r_snapshot_identifier) i;
     snapshot_cluster_identifier = ( ! ) r_snapshot_cluster_identifier;
   }
    : delete_cluster_snapshot_message)

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
  let r_resources = ref None in
  let r_errors = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Resources"; "Errors" ] (fun tag _ ->
      match tag with
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "String" (fun i _ -> string__of_xml i) ())
                 ())
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotErrorMessage"
                     (fun i _ -> snapshot_error_message_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resources = ( ! ) r_resources; errors = ( ! ) r_errors }
    : batch_modify_cluster_snapshots_output_message)

let batch_modify_cluster_snapshots_message_of_xml i =
  let r_snapshot_identifier_list = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_force = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SnapshotIdentifierList"; "ManualSnapshotRetentionPeriod"; "Force" ] (fun tag _ ->
      match tag with
      | "SnapshotIdentifierList" ->
          r_snapshot_identifier_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifierList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "String" (fun i _ -> string__of_xml i) ())
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Force" ->
          r_force :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Force" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_identifier_list =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifierList" (( ! ) r_snapshot_identifier_list) i;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     force = ( ! ) r_force;
   }
    : batch_modify_cluster_snapshots_message)

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

let double_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let long_optional_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let import_tables_not_started_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let import_tables_in_progress_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let import_tables_completed_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let resize_progress_message_of_xml i =
  let r_target_node_type = ref None in
  let r_target_number_of_nodes = ref None in
  let r_target_cluster_type = ref None in
  let r_status = ref None in
  let r_import_tables_completed = ref None in
  let r_import_tables_in_progress = ref None in
  let r_import_tables_not_started = ref None in
  let r_avg_resize_rate_in_mega_bytes_per_second = ref None in
  let r_total_resize_data_in_mega_bytes = ref None in
  let r_progress_in_mega_bytes = ref None in
  let r_elapsed_time_in_seconds = ref None in
  let r_estimated_time_to_completion_in_seconds = ref None in
  let r_resize_type = ref None in
  let r_message = ref None in
  let r_target_encryption_type = ref None in
  let r_data_transfer_progress_percent = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TargetNodeType";
      "TargetNumberOfNodes";
      "TargetClusterType";
      "Status";
      "ImportTablesCompleted";
      "ImportTablesInProgress";
      "ImportTablesNotStarted";
      "AvgResizeRateInMegaBytesPerSecond";
      "TotalResizeDataInMegaBytes";
      "ProgressInMegaBytes";
      "ElapsedTimeInSeconds";
      "EstimatedTimeToCompletionInSeconds";
      "ResizeType";
      "Message";
      "TargetEncryptionType";
      "DataTransferProgressPercent";
    ] (fun tag _ ->
      match tag with
      | "TargetNodeType" ->
          r_target_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetNodeType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetNumberOfNodes" ->
          r_target_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetNumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "TargetClusterType" ->
          r_target_cluster_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetClusterType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "ImportTablesCompleted" ->
          r_import_tables_completed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImportTablesCompleted"
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
      | "ImportTablesNotStarted" ->
          r_import_tables_not_started :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImportTablesNotStarted"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "AvgResizeRateInMegaBytesPerSecond" ->
          r_avg_resize_rate_in_mega_bytes_per_second :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvgResizeRateInMegaBytesPerSecond"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "TotalResizeDataInMegaBytes" ->
          r_total_resize_data_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalResizeDataInMegaBytes"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "ProgressInMegaBytes" ->
          r_progress_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressInMegaBytes"
                 (fun i _ -> long_optional_of_xml i)
                 ())
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
      | "ResizeType" ->
          r_resize_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ResizeType" (fun i _ -> string__of_xml i) ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | "TargetEncryptionType" ->
          r_target_encryption_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetEncryptionType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DataTransferProgressPercent" ->
          r_data_transfer_progress_percent :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataTransferProgressPercent"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_node_type = ( ! ) r_target_node_type;
     target_number_of_nodes = ( ! ) r_target_number_of_nodes;
     target_cluster_type = ( ! ) r_target_cluster_type;
     status = ( ! ) r_status;
     import_tables_completed = ( ! ) r_import_tables_completed;
     import_tables_in_progress = ( ! ) r_import_tables_in_progress;
     import_tables_not_started = ( ! ) r_import_tables_not_started;
     avg_resize_rate_in_mega_bytes_per_second = ( ! ) r_avg_resize_rate_in_mega_bytes_per_second;
     total_resize_data_in_mega_bytes = ( ! ) r_total_resize_data_in_mega_bytes;
     progress_in_mega_bytes = ( ! ) r_progress_in_mega_bytes;
     elapsed_time_in_seconds = ( ! ) r_elapsed_time_in_seconds;
     estimated_time_to_completion_in_seconds = ( ! ) r_estimated_time_to_completion_in_seconds;
     resize_type = ( ! ) r_resize_type;
     message = ( ! ) r_message;
     target_encryption_type = ( ! ) r_target_encryption_type;
     data_transfer_progress_percent = ( ! ) r_data_transfer_progress_percent;
   }
    : resize_progress_message)

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

let catalog_name_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let cluster_node_of_xml i =
  let r_node_role = ref None in
  let r_private_ip_address = ref None in
  let r_public_ip_address = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NodeRole"; "PrivateIPAddress"; "PublicIPAddress" ]
    (fun tag _ ->
      match tag with
      | "NodeRole" ->
          r_node_role :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeRole" (fun i _ -> string__of_xml i) ())
      | "PrivateIPAddress" ->
          r_private_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrivateIPAddress"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PublicIPAddress" ->
          r_public_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicIPAddress"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     node_role = ( ! ) r_node_role;
     private_ip_address = ( ! ) r_private_ip_address;
     public_ip_address = ( ! ) r_public_ip_address;
   }
    : cluster_node)

let cluster_nodes_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cluster_node_of_xml i) ()

let secondary_cluster_info_of_xml i =
  let r_availability_zone = ref None in
  let r_cluster_nodes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AvailabilityZone"; "ClusterNodes" ] (fun tag _ ->
      match tag with
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ availability_zone = ( ! ) r_availability_zone; cluster_nodes = ( ! ) r_cluster_nodes }
    : secondary_cluster_info)

let reserved_node_exchange_status_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "REQUESTED" -> REQUESTED
   | "PENDING" -> PENDING
   | "IN_PROGRESS" -> IN_PROGRESS
   | "RETRYING" -> RETRYING
   | "SUCCEEDED" -> SUCCEEDED
   | "FAILED" -> FAILED
   | _ -> failwith "unknown enum value"
    : reserved_node_exchange_status_type)

let reserved_node_exchange_status_of_xml i =
  let r_reserved_node_exchange_request_id = ref None in
  let r_status = ref None in
  let r_request_time = ref None in
  let r_source_reserved_node_id = ref None in
  let r_source_reserved_node_type = ref None in
  let r_source_reserved_node_count = ref None in
  let r_target_reserved_node_offering_id = ref None in
  let r_target_reserved_node_type = ref None in
  let r_target_reserved_node_count = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReservedNodeExchangeRequestId";
      "Status";
      "RequestTime";
      "SourceReservedNodeId";
      "SourceReservedNodeType";
      "SourceReservedNodeCount";
      "TargetReservedNodeOfferingId";
      "TargetReservedNodeType";
      "TargetReservedNodeCount";
    ] (fun tag _ ->
      match tag with
      | "ReservedNodeExchangeRequestId" ->
          r_reserved_node_exchange_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeExchangeRequestId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> reserved_node_exchange_status_type_of_xml i)
                 ())
      | "RequestTime" ->
          r_request_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestTime" (fun i _ -> t_stamp_of_xml i) ())
      | "SourceReservedNodeId" ->
          r_source_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceReservedNodeType" ->
          r_source_reserved_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceReservedNodeType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceReservedNodeCount" ->
          r_source_reserved_node_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceReservedNodeCount"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "TargetReservedNodeOfferingId" ->
          r_target_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetReservedNodeType" ->
          r_target_reserved_node_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetReservedNodeCount" ->
          r_target_reserved_node_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeCount"
                 (fun i _ -> integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_node_exchange_request_id = ( ! ) r_reserved_node_exchange_request_id;
     status = ( ! ) r_status;
     request_time = ( ! ) r_request_time;
     source_reserved_node_id = ( ! ) r_source_reserved_node_id;
     source_reserved_node_type = ( ! ) r_source_reserved_node_type;
     source_reserved_node_count = ( ! ) r_source_reserved_node_count;
     target_reserved_node_offering_id = ( ! ) r_target_reserved_node_offering_id;
     target_reserved_node_type = ( ! ) r_target_reserved_node_type;
     target_reserved_node_count = ( ! ) r_target_reserved_node_count;
   }
    : reserved_node_exchange_status)

let resize_info_of_xml i =
  let r_resize_type = ref None in
  let r_allow_cancel_resize = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResizeType"; "AllowCancelResize" ] (fun tag _ ->
      match tag with
      | "ResizeType" ->
          r_resize_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ResizeType" (fun i _ -> string__of_xml i) ())
      | "AllowCancelResize" ->
          r_allow_cancel_resize :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowCancelResize"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resize_type = ( ! ) r_resize_type; allow_cancel_resize = ( ! ) r_allow_cancel_resize }
    : resize_info)

let deferred_maintenance_window_of_xml i =
  let r_defer_maintenance_identifier = ref None in
  let r_defer_maintenance_start_time = ref None in
  let r_defer_maintenance_end_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DeferMaintenanceIdentifier"; "DeferMaintenanceStartTime"; "DeferMaintenanceEndTime" ]
    (fun tag _ ->
      match tag with
      | "DeferMaintenanceIdentifier" ->
          r_defer_maintenance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DeferMaintenanceStartTime" ->
          r_defer_maintenance_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceStartTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "DeferMaintenanceEndTime" ->
          r_defer_maintenance_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceEndTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     defer_maintenance_identifier = ( ! ) r_defer_maintenance_identifier;
     defer_maintenance_start_time = ( ! ) r_defer_maintenance_start_time;
     defer_maintenance_end_time = ( ! ) r_defer_maintenance_end_time;
   }
    : deferred_maintenance_window)

let deferred_maintenance_windows_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DeferredMaintenanceWindow"
    (fun i _ -> deferred_maintenance_window_of_xml i)
    ()

let pending_actions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let cluster_iam_role_of_xml i =
  let r_iam_role_arn = ref None in
  let r_apply_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IamRoleArn"; "ApplyStatus" ] (fun tag _ ->
      match tag with
      | "IamRoleArn" ->
          r_iam_role_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IamRoleArn" (fun i _ -> string__of_xml i) ())
      | "ApplyStatus" ->
          r_apply_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyStatus" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ iam_role_arn = ( ! ) r_iam_role_arn; apply_status = ( ! ) r_apply_status } : cluster_iam_role)

let cluster_iam_role_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterIamRole" (fun i _ -> cluster_iam_role_of_xml i) ()

let elastic_ip_status_of_xml i =
  let r_elastic_ip = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ElasticIp"; "Status" ] (fun tag _ ->
      match tag with
      | "ElasticIp" ->
          r_elastic_ip :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticIp" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ elastic_ip = ( ! ) r_elastic_ip; status = ( ! ) r_status } : elastic_ip_status)

let cluster_snapshot_copy_status_of_xml i =
  let r_destination_region = ref None in
  let r_retention_period = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_snapshot_copy_grant_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DestinationRegion";
      "RetentionPeriod";
      "ManualSnapshotRetentionPeriod";
      "SnapshotCopyGrantName";
    ] (fun tag _ ->
      match tag with
      | "DestinationRegion" ->
          r_destination_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RetentionPeriod" ->
          r_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetentionPeriod" (fun i _ -> long_of_xml i) ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "SnapshotCopyGrantName" ->
          r_snapshot_copy_grant_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrantName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     destination_region = ( ! ) r_destination_region;
     retention_period = ( ! ) r_retention_period;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     snapshot_copy_grant_name = ( ! ) r_snapshot_copy_grant_name;
   }
    : cluster_snapshot_copy_status)

let hsm_status_of_xml i =
  let r_hsm_client_certificate_identifier = ref None in
  let r_hsm_configuration_identifier = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "HsmClientCertificateIdentifier"; "HsmConfigurationIdentifier"; "Status" ] (fun tag _ ->
      match tag with
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
     status = ( ! ) r_status;
   }
    : hsm_status)

let data_transfer_progress_of_xml i =
  let r_status = ref None in
  let r_current_rate_in_mega_bytes_per_second = ref None in
  let r_total_data_in_mega_bytes = ref None in
  let r_data_transferred_in_mega_bytes = ref None in
  let r_estimated_time_to_completion_in_seconds = ref None in
  let r_elapsed_time_in_seconds = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Status";
      "CurrentRateInMegaBytesPerSecond";
      "TotalDataInMegaBytes";
      "DataTransferredInMegaBytes";
      "EstimatedTimeToCompletionInSeconds";
      "ElapsedTimeInSeconds";
    ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "CurrentRateInMegaBytesPerSecond" ->
          r_current_rate_in_mega_bytes_per_second :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentRateInMegaBytesPerSecond"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "TotalDataInMegaBytes" ->
          r_total_data_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalDataInMegaBytes"
                 (fun i _ -> long_of_xml i)
                 ())
      | "DataTransferredInMegaBytes" ->
          r_data_transferred_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataTransferredInMegaBytes"
                 (fun i _ -> long_of_xml i)
                 ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = ( ! ) r_status;
     current_rate_in_mega_bytes_per_second = ( ! ) r_current_rate_in_mega_bytes_per_second;
     total_data_in_mega_bytes = ( ! ) r_total_data_in_mega_bytes;
     data_transferred_in_mega_bytes = ( ! ) r_data_transferred_in_mega_bytes;
     estimated_time_to_completion_in_seconds = ( ! ) r_estimated_time_to_completion_in_seconds;
     elapsed_time_in_seconds = ( ! ) r_elapsed_time_in_seconds;
   }
    : data_transfer_progress)

let restore_status_of_xml i =
  let r_status = ref None in
  let r_current_restore_rate_in_mega_bytes_per_second = ref None in
  let r_snapshot_size_in_mega_bytes = ref None in
  let r_progress_in_mega_bytes = ref None in
  let r_elapsed_time_in_seconds = ref None in
  let r_estimated_time_to_completion_in_seconds = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Status";
      "CurrentRestoreRateInMegaBytesPerSecond";
      "SnapshotSizeInMegaBytes";
      "ProgressInMegaBytes";
      "ElapsedTimeInSeconds";
      "EstimatedTimeToCompletionInSeconds";
    ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "CurrentRestoreRateInMegaBytesPerSecond" ->
          r_current_restore_rate_in_mega_bytes_per_second :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentRestoreRateInMegaBytesPerSecond"
                 (fun i _ -> double_of_xml i)
                 ())
      | "SnapshotSizeInMegaBytes" ->
          r_snapshot_size_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotSizeInMegaBytes"
                 (fun i _ -> long_of_xml i)
                 ())
      | "ProgressInMegaBytes" ->
          r_progress_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressInMegaBytes"
                 (fun i _ -> long_of_xml i)
                 ())
      | "ElapsedTimeInSeconds" ->
          r_elapsed_time_in_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ElapsedTimeInSeconds"
                 (fun i _ -> long_of_xml i)
                 ())
      | "EstimatedTimeToCompletionInSeconds" ->
          r_estimated_time_to_completion_in_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedTimeToCompletionInSeconds"
                 (fun i _ -> long_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = ( ! ) r_status;
     current_restore_rate_in_mega_bytes_per_second =
       ( ! ) r_current_restore_rate_in_mega_bytes_per_second;
     snapshot_size_in_mega_bytes = ( ! ) r_snapshot_size_in_mega_bytes;
     progress_in_mega_bytes = ( ! ) r_progress_in_mega_bytes;
     elapsed_time_in_seconds = ( ! ) r_elapsed_time_in_seconds;
     estimated_time_to_completion_in_seconds = ( ! ) r_estimated_time_to_completion_in_seconds;
   }
    : restore_status)

let sensitive_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let pending_modified_values_of_xml i =
  let r_master_user_password = ref None in
  let r_node_type = ref None in
  let r_number_of_nodes = ref None in
  let r_cluster_type = ref None in
  let r_cluster_version = ref None in
  let r_automated_snapshot_retention_period = ref None in
  let r_cluster_identifier = ref None in
  let r_publicly_accessible = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_maintenance_track_name = ref None in
  let r_encryption_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MasterUserPassword";
      "NodeType";
      "NumberOfNodes";
      "ClusterType";
      "ClusterVersion";
      "AutomatedSnapshotRetentionPeriod";
      "ClusterIdentifier";
      "PubliclyAccessible";
      "EnhancedVpcRouting";
      "MaintenanceTrackName";
      "EncryptionType";
    ] (fun tag _ ->
      match tag with
      | "MasterUserPassword" ->
          r_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserPassword"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
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
      | "AutomatedSnapshotRetentionPeriod" ->
          r_automated_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomatedSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EncryptionType" ->
          r_encryption_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EncryptionType"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     master_user_password = ( ! ) r_master_user_password;
     node_type = ( ! ) r_node_type;
     number_of_nodes = ( ! ) r_number_of_nodes;
     cluster_type = ( ! ) r_cluster_type;
     cluster_version = ( ! ) r_cluster_version;
     automated_snapshot_retention_period = ( ! ) r_automated_snapshot_retention_period;
     cluster_identifier = ( ! ) r_cluster_identifier;
     publicly_accessible = ( ! ) r_publicly_accessible;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     encryption_type = ( ! ) r_encryption_type;
   }
    : pending_modified_values)

let cluster_parameter_status_of_xml i =
  let r_parameter_name = ref None in
  let r_parameter_apply_status = ref None in
  let r_parameter_apply_error_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ParameterName"; "ParameterApplyStatus"; "ParameterApplyErrorDescription" ] (fun tag _ ->
      match tag with
      | "ParameterName" ->
          r_parameter_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterName" (fun i _ -> string__of_xml i) ())
      | "ParameterApplyStatus" ->
          r_parameter_apply_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterApplyStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterApplyErrorDescription" ->
          r_parameter_apply_error_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterApplyErrorDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_name = ( ! ) r_parameter_name;
     parameter_apply_status = ( ! ) r_parameter_apply_status;
     parameter_apply_error_description = ( ! ) r_parameter_apply_error_description;
   }
    : cluster_parameter_status)

let cluster_parameter_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cluster_parameter_status_of_xml i) ()

let cluster_parameter_group_status_of_xml i =
  let r_parameter_group_name = ref None in
  let r_parameter_apply_status = ref None in
  let r_cluster_parameter_status_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ParameterGroupName"; "ParameterApplyStatus"; "ClusterParameterStatusList" ] (fun tag _ ->
      match tag with
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterApplyStatus" ->
          r_parameter_apply_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterApplyStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterParameterStatusList" ->
          r_cluster_parameter_status_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterStatusList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> cluster_parameter_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_group_name = ( ! ) r_parameter_group_name;
     parameter_apply_status = ( ! ) r_parameter_apply_status;
     cluster_parameter_status_list = ( ! ) r_cluster_parameter_status_list;
   }
    : cluster_parameter_group_status)

let cluster_parameter_group_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterParameterGroup"
    (fun i _ -> cluster_parameter_group_status_of_xml i)
    ()

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
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroup"
    (fun i _ -> vpc_security_group_membership_of_xml i)
    ()

let cluster_security_group_membership_of_xml i =
  let r_cluster_security_group_name = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterSecurityGroupName"; "Status" ]
    (fun tag _ ->
      match tag with
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster_security_group_name = ( ! ) r_cluster_security_group_name; status = ( ! ) r_status }
    : cluster_security_group_membership)

let cluster_security_group_membership_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroup"
    (fun i _ -> cluster_security_group_membership_of_xml i)
    ()

let network_interface_of_xml i =
  let r_network_interface_id = ref None in
  let r_subnet_id = ref None in
  let r_private_ip_address = ref None in
  let r_availability_zone = ref None in
  let r_ipv6_address = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NetworkInterfaceId"; "SubnetId"; "PrivateIpAddress"; "AvailabilityZone"; "Ipv6Address" ]
    (fun tag _ ->
      match tag with
      | "NetworkInterfaceId" ->
          r_network_interface_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkInterfaceId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SubnetId" ->
          r_subnet_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetId" (fun i _ -> string__of_xml i) ())
      | "PrivateIpAddress" ->
          r_private_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PrivateIpAddress"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Ipv6Address" ->
          r_ipv6_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Ipv6Address" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     network_interface_id = ( ! ) r_network_interface_id;
     subnet_id = ( ! ) r_subnet_id;
     private_ip_address = ( ! ) r_private_ip_address;
     availability_zone = ( ! ) r_availability_zone;
     ipv6_address = ( ! ) r_ipv6_address;
   }
    : network_interface)

let network_interface_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NetworkInterface" (fun i _ -> network_interface_of_xml i) ()

let vpc_endpoint_of_xml i =
  let r_vpc_endpoint_id = ref None in
  let r_vpc_id = ref None in
  let r_network_interfaces = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VpcEndpointId"; "VpcId"; "NetworkInterfaces" ]
    (fun tag _ ->
      match tag with
      | "VpcEndpointId" ->
          r_vpc_endpoint_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcEndpointId" (fun i _ -> string__of_xml i) ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
      | "NetworkInterfaces" ->
          r_network_interfaces :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NetworkInterfaces"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NetworkInterface"
                     (fun i _ -> network_interface_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     vpc_endpoint_id = ( ! ) r_vpc_endpoint_id;
     vpc_id = ( ! ) r_vpc_id;
     network_interfaces = ( ! ) r_network_interfaces;
   }
    : vpc_endpoint)

let vpc_endpoints_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcEndpoint" (fun i _ -> vpc_endpoint_of_xml i) ()

let endpoint_of_xml i =
  let r_address = ref None in
  let r_port = ref None in
  let r_vpc_endpoints = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Address"; "Port"; "VpcEndpoints" ] (fun tag _ ->
      match tag with
      | "Address" ->
          r_address :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Address" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | "VpcEndpoints" ->
          r_vpc_endpoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcEndpoints"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcEndpoint"
                     (fun i _ -> vpc_endpoint_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ address = ( ! ) r_address; port = ( ! ) r_port; vpc_endpoints = ( ! ) r_vpc_endpoints }
    : endpoint)

let cluster_of_xml i =
  let r_cluster_identifier = ref None in
  let r_node_type = ref None in
  let r_cluster_status = ref None in
  let r_cluster_availability_status = ref None in
  let r_modify_status = ref None in
  let r_master_username = ref None in
  let r_db_name = ref None in
  let r_endpoint = ref None in
  let r_cluster_create_time = ref None in
  let r_automated_snapshot_retention_period = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_cluster_security_groups = ref None in
  let r_vpc_security_groups = ref None in
  let r_cluster_parameter_groups = ref None in
  let r_cluster_subnet_group_name = ref None in
  let r_vpc_id = ref None in
  let r_availability_zone = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_pending_modified_values = ref None in
  let r_cluster_version = ref None in
  let r_allow_version_upgrade = ref None in
  let r_number_of_nodes = ref None in
  let r_publicly_accessible = ref None in
  let r_encrypted = ref None in
  let r_restore_status = ref None in
  let r_data_transfer_progress = ref None in
  let r_hsm_status = ref None in
  let r_cluster_snapshot_copy_status = ref None in
  let r_cluster_public_key = ref None in
  let r_cluster_nodes = ref None in
  let r_elastic_ip_status = ref None in
  let r_cluster_revision_number = ref None in
  let r_tags = ref None in
  let r_kms_key_id = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_iam_roles = ref None in
  let r_pending_actions = ref None in
  let r_maintenance_track_name = ref None in
  let r_elastic_resize_number_of_node_options = ref None in
  let r_deferred_maintenance_windows = ref None in
  let r_snapshot_schedule_identifier = ref None in
  let r_snapshot_schedule_state = ref None in
  let r_expected_next_snapshot_schedule_time = ref None in
  let r_expected_next_snapshot_schedule_time_status = ref None in
  let r_next_maintenance_window_start_time = ref None in
  let r_resize_info = ref None in
  let r_availability_zone_relocation_status = ref None in
  let r_cluster_namespace_arn = ref None in
  let r_total_storage_capacity_in_mega_bytes = ref None in
  let r_aqua_configuration = ref None in
  let r_default_iam_role_arn = ref None in
  let r_reserved_node_exchange_status = ref None in
  let r_custom_domain_name = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_custom_domain_certificate_expiry_date = ref None in
  let r_master_password_secret_arn = ref None in
  let r_master_password_secret_kms_key_id = ref None in
  let r_ip_address_type = ref None in
  let r_multi_a_z = ref None in
  let r_multi_az_secondary = ref None in
  let r_lakehouse_registration_status = ref None in
  let r_catalog_arn = ref None in
  let r_extra_compute_for_automatic_optimization = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "NodeType";
      "ClusterStatus";
      "ClusterAvailabilityStatus";
      "ModifyStatus";
      "MasterUsername";
      "DBName";
      "Endpoint";
      "ClusterCreateTime";
      "AutomatedSnapshotRetentionPeriod";
      "ManualSnapshotRetentionPeriod";
      "ClusterSecurityGroups";
      "VpcSecurityGroups";
      "ClusterParameterGroups";
      "ClusterSubnetGroupName";
      "VpcId";
      "AvailabilityZone";
      "PreferredMaintenanceWindow";
      "PendingModifiedValues";
      "ClusterVersion";
      "AllowVersionUpgrade";
      "NumberOfNodes";
      "PubliclyAccessible";
      "Encrypted";
      "RestoreStatus";
      "DataTransferProgress";
      "HsmStatus";
      "ClusterSnapshotCopyStatus";
      "ClusterPublicKey";
      "ClusterNodes";
      "ElasticIpStatus";
      "ClusterRevisionNumber";
      "Tags";
      "KmsKeyId";
      "EnhancedVpcRouting";
      "IamRoles";
      "PendingActions";
      "MaintenanceTrackName";
      "ElasticResizeNumberOfNodeOptions";
      "DeferredMaintenanceWindows";
      "SnapshotScheduleIdentifier";
      "SnapshotScheduleState";
      "ExpectedNextSnapshotScheduleTime";
      "ExpectedNextSnapshotScheduleTimeStatus";
      "NextMaintenanceWindowStartTime";
      "ResizeInfo";
      "AvailabilityZoneRelocationStatus";
      "ClusterNamespaceArn";
      "TotalStorageCapacityInMegaBytes";
      "AquaConfiguration";
      "DefaultIamRoleArn";
      "ReservedNodeExchangeStatus";
      "CustomDomainName";
      "CustomDomainCertificateArn";
      "CustomDomainCertificateExpiryDate";
      "MasterPasswordSecretArn";
      "MasterPasswordSecretKmsKeyId";
      "IpAddressType";
      "MultiAZ";
      "MultiAZSecondary";
      "LakehouseRegistrationStatus";
      "CatalogArn";
      "ExtraComputeForAutomaticOptimization";
    ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "ClusterStatus" ->
          r_cluster_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterStatus" (fun i _ -> string__of_xml i) ())
      | "ClusterAvailabilityStatus" ->
          r_cluster_availability_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterAvailabilityStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ModifyStatus" ->
          r_modify_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModifyStatus" (fun i _ -> string__of_xml i) ())
      | "MasterUsername" ->
          r_master_username :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUsername"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DBName" ->
          r_db_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DBName" (fun i _ -> string__of_xml i) ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> endpoint_of_xml i) ())
      | "ClusterCreateTime" ->
          r_cluster_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "AutomatedSnapshotRetentionPeriod" ->
          r_automated_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomatedSnapshotRetentionPeriod"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_of_xml i)
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
      | "VpcSecurityGroups" ->
          r_vpc_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroup"
                     (fun i _ -> vpc_security_group_membership_of_xml i)
                     ())
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
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
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
      | "PendingModifiedValues" ->
          r_pending_modified_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingModifiedValues"
                 (fun i _ -> pending_modified_values_of_xml i)
                 ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AllowVersionUpgrade" ->
          r_allow_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowVersionUpgrade"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes" (fun i _ -> integer_of_xml i) ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "Encrypted" ->
          r_encrypted :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted" (fun i _ -> boolean__of_xml i) ())
      | "RestoreStatus" ->
          r_restore_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RestoreStatus"
                 (fun i _ -> restore_status_of_xml i)
                 ())
      | "DataTransferProgress" ->
          r_data_transfer_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataTransferProgress"
                 (fun i _ -> data_transfer_progress_of_xml i)
                 ())
      | "HsmStatus" ->
          r_hsm_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmStatus" (fun i _ -> hsm_status_of_xml i) ())
      | "ClusterSnapshotCopyStatus" ->
          r_cluster_snapshot_copy_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSnapshotCopyStatus"
                 (fun i _ -> cluster_snapshot_copy_status_of_xml i)
                 ())
      | "ClusterPublicKey" ->
          r_cluster_public_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterPublicKey"
                 (fun i _ -> string__of_xml i)
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
      | "ElasticIpStatus" ->
          r_elastic_ip_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticIpStatus"
                 (fun i _ -> elastic_ip_status_of_xml i)
                 ())
      | "ClusterRevisionNumber" ->
          r_cluster_revision_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterRevisionNumber"
                 (fun i _ -> string__of_xml i)
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
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean__of_xml i)
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
      | "PendingActions" ->
          r_pending_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PendingActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ElasticResizeNumberOfNodeOptions" ->
          r_elastic_resize_number_of_node_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticResizeNumberOfNodeOptions"
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
      | "SnapshotScheduleIdentifier" ->
          r_snapshot_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotScheduleState" ->
          r_snapshot_schedule_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotScheduleState"
                 (fun i _ -> schedule_state_of_xml i)
                 ())
      | "ExpectedNextSnapshotScheduleTime" ->
          r_expected_next_snapshot_schedule_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpectedNextSnapshotScheduleTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ExpectedNextSnapshotScheduleTimeStatus" ->
          r_expected_next_snapshot_schedule_time_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpectedNextSnapshotScheduleTimeStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NextMaintenanceWindowStartTime" ->
          r_next_maintenance_window_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextMaintenanceWindowStartTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "ResizeInfo" ->
          r_resize_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResizeInfo"
                 (fun i _ -> resize_info_of_xml i)
                 ())
      | "AvailabilityZoneRelocationStatus" ->
          r_availability_zone_relocation_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneRelocationStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterNamespaceArn" ->
          r_cluster_namespace_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterNamespaceArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TotalStorageCapacityInMegaBytes" ->
          r_total_storage_capacity_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalStorageCapacityInMegaBytes"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "AquaConfiguration" ->
          r_aqua_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaConfiguration"
                 (fun i _ -> aqua_configuration_of_xml i)
                 ())
      | "DefaultIamRoleArn" ->
          r_default_iam_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultIamRoleArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedNodeExchangeStatus" ->
          r_reserved_node_exchange_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeExchangeStatus"
                 (fun i _ -> reserved_node_exchange_status_of_xml i)
                 ())
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainCertificateExpiryDate" ->
          r_custom_domain_certificate_expiry_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateExpiryDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "MasterPasswordSecretArn" ->
          r_master_password_secret_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MasterPasswordSecretKmsKeyId" ->
          r_master_password_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType" (fun i _ -> string__of_xml i) ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ" (fun i _ -> string__of_xml i) ())
      | "MultiAZSecondary" ->
          r_multi_az_secondary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZSecondary"
                 (fun i _ -> secondary_cluster_info_of_xml i)
                 ())
      | "LakehouseRegistrationStatus" ->
          r_lakehouse_registration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseRegistrationStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CatalogArn" ->
          r_catalog_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CatalogArn" (fun i _ -> string__of_xml i) ())
      | "ExtraComputeForAutomaticOptimization" ->
          r_extra_compute_for_automatic_optimization :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtraComputeForAutomaticOptimization"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier = ( ! ) r_cluster_identifier;
     node_type = ( ! ) r_node_type;
     cluster_status = ( ! ) r_cluster_status;
     cluster_availability_status = ( ! ) r_cluster_availability_status;
     modify_status = ( ! ) r_modify_status;
     master_username = ( ! ) r_master_username;
     db_name = ( ! ) r_db_name;
     endpoint = ( ! ) r_endpoint;
     cluster_create_time = ( ! ) r_cluster_create_time;
     automated_snapshot_retention_period = ( ! ) r_automated_snapshot_retention_period;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     cluster_security_groups = ( ! ) r_cluster_security_groups;
     vpc_security_groups = ( ! ) r_vpc_security_groups;
     cluster_parameter_groups = ( ! ) r_cluster_parameter_groups;
     cluster_subnet_group_name = ( ! ) r_cluster_subnet_group_name;
     vpc_id = ( ! ) r_vpc_id;
     availability_zone = ( ! ) r_availability_zone;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     pending_modified_values = ( ! ) r_pending_modified_values;
     cluster_version = ( ! ) r_cluster_version;
     allow_version_upgrade = ( ! ) r_allow_version_upgrade;
     number_of_nodes = ( ! ) r_number_of_nodes;
     publicly_accessible = ( ! ) r_publicly_accessible;
     encrypted = ( ! ) r_encrypted;
     restore_status = ( ! ) r_restore_status;
     data_transfer_progress = ( ! ) r_data_transfer_progress;
     hsm_status = ( ! ) r_hsm_status;
     cluster_snapshot_copy_status = ( ! ) r_cluster_snapshot_copy_status;
     cluster_public_key = ( ! ) r_cluster_public_key;
     cluster_nodes = ( ! ) r_cluster_nodes;
     elastic_ip_status = ( ! ) r_elastic_ip_status;
     cluster_revision_number = ( ! ) r_cluster_revision_number;
     tags = ( ! ) r_tags;
     kms_key_id = ( ! ) r_kms_key_id;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     iam_roles = ( ! ) r_iam_roles;
     pending_actions = ( ! ) r_pending_actions;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     elastic_resize_number_of_node_options = ( ! ) r_elastic_resize_number_of_node_options;
     deferred_maintenance_windows = ( ! ) r_deferred_maintenance_windows;
     snapshot_schedule_identifier = ( ! ) r_snapshot_schedule_identifier;
     snapshot_schedule_state = ( ! ) r_snapshot_schedule_state;
     expected_next_snapshot_schedule_time = ( ! ) r_expected_next_snapshot_schedule_time;
     expected_next_snapshot_schedule_time_status =
       ( ! ) r_expected_next_snapshot_schedule_time_status;
     next_maintenance_window_start_time = ( ! ) r_next_maintenance_window_start_time;
     resize_info = ( ! ) r_resize_info;
     availability_zone_relocation_status = ( ! ) r_availability_zone_relocation_status;
     cluster_namespace_arn = ( ! ) r_cluster_namespace_arn;
     total_storage_capacity_in_mega_bytes = ( ! ) r_total_storage_capacity_in_mega_bytes;
     aqua_configuration = ( ! ) r_aqua_configuration;
     default_iam_role_arn = ( ! ) r_default_iam_role_arn;
     reserved_node_exchange_status = ( ! ) r_reserved_node_exchange_status;
     custom_domain_name = ( ! ) r_custom_domain_name;
     custom_domain_certificate_arn = ( ! ) r_custom_domain_certificate_arn;
     custom_domain_certificate_expiry_date = ( ! ) r_custom_domain_certificate_expiry_date;
     master_password_secret_arn = ( ! ) r_master_password_secret_arn;
     master_password_secret_kms_key_id = ( ! ) r_master_password_secret_kms_key_id;
     ip_address_type = ( ! ) r_ip_address_type;
     multi_a_z = ( ! ) r_multi_a_z;
     multi_az_secondary = ( ! ) r_multi_az_secondary;
     lakehouse_registration_status = ( ! ) r_lakehouse_registration_status;
     catalog_arn = ( ! ) r_catalog_arn;
     extra_compute_for_automatic_optimization = ( ! ) r_extra_compute_for_automatic_optimization;
   }
    : cluster)

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

let cluster_credentials_of_xml i =
  let r_db_user = ref None in
  let r_db_password = ref None in
  let r_expiration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DbUser"; "DbPassword"; "Expiration" ]
    (fun tag _ ->
      match tag with
      | "DbUser" ->
          r_db_user :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DbUser" (fun i _ -> string__of_xml i) ())
      | "DbPassword" ->
          r_db_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbPassword"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | "Expiration" ->
          r_expiration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Expiration" (fun i _ -> t_stamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ db_user = ( ! ) r_db_user; db_password = ( ! ) r_db_password; expiration = ( ! ) r_expiration }
    : cluster_credentials)

let revision_target_of_xml i =
  let r_database_revision = ref None in
  let r_description = ref None in
  let r_database_revision_release_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DatabaseRevision"; "Description"; "DatabaseRevisionReleaseDate" ] (fun tag _ ->
      match tag with
      | "DatabaseRevision" ->
          r_database_revision :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseRevision"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "DatabaseRevisionReleaseDate" ->
          r_database_revision_release_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseRevisionReleaseDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     database_revision = ( ! ) r_database_revision;
     description = ( ! ) r_description;
     database_revision_release_date = ( ! ) r_database_revision_release_date;
   }
    : revision_target)

let revision_targets_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "RevisionTarget" (fun i _ -> revision_target_of_xml i) ()

let cluster_db_revision_of_xml i =
  let r_cluster_identifier = ref None in
  let r_current_database_revision = ref None in
  let r_database_revision_release_date = ref None in
  let r_revision_targets = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "CurrentDatabaseRevision";
      "DatabaseRevisionReleaseDate";
      "RevisionTargets";
    ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CurrentDatabaseRevision" ->
          r_current_database_revision :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentDatabaseRevision"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DatabaseRevisionReleaseDate" ->
          r_database_revision_release_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseRevisionReleaseDate"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "RevisionTargets" ->
          r_revision_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevisionTargets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "RevisionTarget"
                     (fun i _ -> revision_target_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier = ( ! ) r_cluster_identifier;
     current_database_revision = ( ! ) r_current_database_revision;
     database_revision_release_date = ( ! ) r_database_revision_release_date;
     revision_targets = ( ! ) r_revision_targets;
   }
    : cluster_db_revision)

let cluster_db_revisions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterDbRevision"
    (fun i _ -> cluster_db_revision_of_xml i)
    ()

let cluster_db_revisions_message_of_xml i =
  let r_marker = ref None in
  let r_cluster_db_revisions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ClusterDbRevisions" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ClusterDbRevisions" ->
          r_cluster_db_revisions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterDbRevisions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterDbRevision"
                     (fun i _ -> cluster_db_revision_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; cluster_db_revisions = ( ! ) r_cluster_db_revisions }
    : cluster_db_revisions_message)

let cluster_extended_credentials_of_xml i =
  let r_db_user = ref None in
  let r_db_password = ref None in
  let r_expiration = ref None in
  let r_next_refresh_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DbUser"; "DbPassword"; "Expiration"; "NextRefreshTime" ] (fun tag _ ->
      match tag with
      | "DbUser" ->
          r_db_user :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DbUser" (fun i _ -> string__of_xml i) ())
      | "DbPassword" ->
          r_db_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbPassword"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | "Expiration" ->
          r_expiration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Expiration" (fun i _ -> t_stamp_of_xml i) ())
      | "NextRefreshTime" ->
          r_next_refresh_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextRefreshTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_user = ( ! ) r_db_user;
     db_password = ( ! ) r_db_password;
     expiration = ( ! ) r_expiration;
     next_refresh_time = ( ! ) r_next_refresh_time;
   }
    : cluster_extended_credentials)

let cluster_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterIdentifier" (fun i _ -> string__of_xml i) ()

let cluster_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Cluster" (fun i _ -> cluster_of_xml i) ()

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

let cluster_parameter_group_of_xml i =
  let r_parameter_group_name = ref None in
  let r_parameter_group_family = ref None in
  let r_description = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ParameterGroupName"; "ParameterGroupFamily"; "Description"; "Tags" ] (fun tag _ ->
      match tag with
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterGroupFamily" ->
          r_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupFamily"
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
     parameter_group_name = ( ! ) r_parameter_group_name;
     parameter_group_family = ( ! ) r_parameter_group_family;
     description = ( ! ) r_description;
     tags = ( ! ) r_tags;
   }
    : cluster_parameter_group)

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

let parameter_apply_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "static" -> Static | "dynamic" -> Dynamic | _ -> failwith "unknown enum value"
    : parameter_apply_type)

let parameter_of_xml i =
  let r_parameter_name = ref None in
  let r_parameter_value = ref None in
  let r_description = ref None in
  let r_source = ref None in
  let r_data_type = ref None in
  let r_allowed_values = ref None in
  let r_apply_type = ref None in
  let r_is_modifiable = ref None in
  let r_minimum_engine_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ParameterName";
      "ParameterValue";
      "Description";
      "Source";
      "DataType";
      "AllowedValues";
      "ApplyType";
      "IsModifiable";
      "MinimumEngineVersion";
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
      | "ApplyType" ->
          r_apply_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplyType"
                 (fun i _ -> parameter_apply_type_of_xml i)
                 ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_name = ( ! ) r_parameter_name;
     parameter_value = ( ! ) r_parameter_value;
     description = ( ! ) r_description;
     source = ( ! ) r_source;
     data_type = ( ! ) r_data_type;
     allowed_values = ( ! ) r_allowed_values;
     apply_type = ( ! ) r_apply_type;
     is_modifiable = ( ! ) r_is_modifiable;
     minimum_engine_version = ( ! ) r_minimum_engine_version;
   }
    : parameter)

let parameters_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Parameter" (fun i _ -> parameter_of_xml i) ()

let cluster_parameter_group_details_of_xml i =
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
  ({ parameters = ( ! ) r_parameters; marker = ( ! ) r_marker } : cluster_parameter_group_details)

let cluster_parameter_group_name_message_of_xml i =
  let r_parameter_group_name = ref None in
  let r_parameter_group_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ParameterGroupName"; "ParameterGroupStatus" ]
    (fun tag _ ->
      match tag with
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterGroupStatus" ->
          r_parameter_group_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_group_name = ( ! ) r_parameter_group_name;
     parameter_group_status = ( ! ) r_parameter_group_status;
   }
    : cluster_parameter_group_name_message)

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

let parameter_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterParameterGroup"
    (fun i _ -> cluster_parameter_group_of_xml i)
    ()

let cluster_parameter_groups_message_of_xml i =
  let r_marker = ref None in
  let r_parameter_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ParameterGroups" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ParameterGroups" ->
          r_parameter_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterParameterGroup"
                     (fun i _ -> cluster_parameter_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; parameter_groups = ( ! ) r_parameter_groups }
    : cluster_parameter_groups_message)

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

let cluster_security_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroup"
    (fun i _ -> cluster_security_group_of_xml i)
    ()

let cluster_security_group_message_of_xml i =
  let r_marker = ref None in
  let r_cluster_security_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ClusterSecurityGroups" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ClusterSecurityGroups" ->
          r_cluster_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroup"
                     (fun i _ -> cluster_security_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; cluster_security_groups = ( ! ) r_cluster_security_groups }
    : cluster_security_group_message)

let cluster_security_group_name_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSecurityGroupName" (fun i _ -> string__of_xml i) ()

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

let value_string_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "item" (fun i _ -> string__of_xml i) ()

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

let cluster_subnet_group_of_xml i =
  let r_cluster_subnet_group_name = ref None in
  let r_description = ref None in
  let r_vpc_id = ref None in
  let r_subnet_group_status = ref None in
  let r_subnets = ref None in
  let r_tags = ref None in
  let r_supported_cluster_ip_address_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterSubnetGroupName";
      "Description";
      "VpcId";
      "SubnetGroupStatus";
      "Subnets";
      "Tags";
      "SupportedClusterIpAddressTypes";
    ] (fun tag _ ->
      match tag with
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
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
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "SupportedClusterIpAddressTypes" ->
          r_supported_cluster_ip_address_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedClusterIpAddressTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "item" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_subnet_group_name = ( ! ) r_cluster_subnet_group_name;
     description = ( ! ) r_description;
     vpc_id = ( ! ) r_vpc_id;
     subnet_group_status = ( ! ) r_subnet_group_status;
     subnets = ( ! ) r_subnets;
     tags = ( ! ) r_tags;
     supported_cluster_ip_address_types = ( ! ) r_supported_cluster_ip_address_types;
   }
    : cluster_subnet_group)

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

let cluster_subnet_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSubnetGroup"
    (fun i _ -> cluster_subnet_group_of_xml i)
    ()

let cluster_subnet_group_message_of_xml i =
  let r_marker = ref None in
  let r_cluster_subnet_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ClusterSubnetGroups" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ClusterSubnetGroups" ->
          r_cluster_subnet_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterSubnetGroup"
                     (fun i _ -> cluster_subnet_group_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; cluster_subnet_groups = ( ! ) r_cluster_subnet_groups }
    : cluster_subnet_group_message)

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

let cluster_version_of_xml i =
  let r_cluster_version = ref None in
  let r_cluster_parameter_group_family = ref None in
  let r_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterVersion"; "ClusterParameterGroupFamily"; "Description" ] (fun tag _ ->
      match tag with
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterParameterGroupFamily" ->
          r_cluster_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroupFamily"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_version = ( ! ) r_cluster_version;
     cluster_parameter_group_family = ( ! ) r_cluster_parameter_group_family;
     description = ( ! ) r_description;
   }
    : cluster_version)

let cluster_version_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ClusterVersion" (fun i _ -> cluster_version_of_xml i) ()

let cluster_versions_message_of_xml i =
  let r_marker = ref None in
  let r_cluster_versions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ClusterVersions" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ClusterVersions" ->
          r_cluster_versions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterVersion"
                     (fun i _ -> cluster_version_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; cluster_versions = ( ! ) r_cluster_versions }
    : cluster_versions_message)

let clusters_message_of_xml i =
  let r_marker = ref None in
  let r_clusters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "Clusters" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "Clusters" ->
          r_clusters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Clusters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Cluster" (fun i _ -> cluster_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; clusters = ( ! ) r_clusters } : clusters_message)

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

let service_authorization_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Enabled" -> ENABLED | "Disabled" -> DISABLED | _ -> failwith "unknown enum value"
    : service_authorization)

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

let consumer_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

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
  let r_source_snapshot_identifier = ref None in
  let r_source_snapshot_cluster_identifier = ref None in
  let r_target_snapshot_identifier = ref None in
  let r_manual_snapshot_retention_period = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SourceSnapshotIdentifier";
      "SourceSnapshotClusterIdentifier";
      "TargetSnapshotIdentifier";
      "ManualSnapshotRetentionPeriod";
    ] (fun tag _ ->
      match tag with
      | "SourceSnapshotIdentifier" ->
          r_source_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceSnapshotClusterIdentifier" ->
          r_source_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceSnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetSnapshotIdentifier" ->
          r_target_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SourceSnapshotIdentifier"
         (( ! ) r_source_snapshot_identifier)
         i;
     source_snapshot_cluster_identifier = ( ! ) r_source_snapshot_cluster_identifier;
     target_snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "TargetSnapshotIdentifier"
         (( ! ) r_target_snapshot_identifier)
         i;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
   }
    : copy_cluster_snapshot_message)

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

let create_authentication_profile_result_of_xml i =
  let r_authentication_profile_name = ref None in
  let r_authentication_profile_content = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AuthenticationProfileName"; "AuthenticationProfileContent" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | "AuthenticationProfileContent" ->
          r_authentication_profile_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileContent"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authentication_profile_name = ( ! ) r_authentication_profile_name;
     authentication_profile_content = ( ! ) r_authentication_profile_content;
   }
    : create_authentication_profile_result)

let create_authentication_profile_message_of_xml i =
  let r_authentication_profile_name = ref None in
  let r_authentication_profile_content = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AuthenticationProfileName"; "AuthenticationProfileContent" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | "AuthenticationProfileContent" ->
          r_authentication_profile_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileContent"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authentication_profile_name =
       Smaws_Lib.Xml.Parse.required "AuthenticationProfileName"
         (( ! ) r_authentication_profile_name)
         i;
     authentication_profile_content =
       Smaws_Lib.Xml.Parse.required "AuthenticationProfileContent"
         (( ! ) r_authentication_profile_content)
         i;
   }
    : create_authentication_profile_message)

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

let create_cluster_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : create_cluster_result)

let iam_role_arn_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "IamRoleArn" (fun i _ -> string__of_xml i) ()

let vpc_security_group_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId" (fun i _ -> string__of_xml i) ()

let create_cluster_message_of_xml i =
  let r_db_name = ref None in
  let r_cluster_identifier = ref None in
  let r_cluster_type = ref None in
  let r_node_type = ref None in
  let r_master_username = ref None in
  let r_master_user_password = ref None in
  let r_cluster_security_groups = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_cluster_subnet_group_name = ref None in
  let r_availability_zone = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_cluster_parameter_group_name = ref None in
  let r_automated_snapshot_retention_period = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_port = ref None in
  let r_cluster_version = ref None in
  let r_allow_version_upgrade = ref None in
  let r_number_of_nodes = ref None in
  let r_publicly_accessible = ref None in
  let r_encrypted = ref None in
  let r_hsm_client_certificate_identifier = ref None in
  let r_hsm_configuration_identifier = ref None in
  let r_elastic_ip = ref None in
  let r_tags = ref None in
  let r_kms_key_id = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_additional_info = ref None in
  let r_iam_roles = ref None in
  let r_maintenance_track_name = ref None in
  let r_snapshot_schedule_identifier = ref None in
  let r_availability_zone_relocation = ref None in
  let r_aqua_configuration_status = ref None in
  let r_default_iam_role_arn = ref None in
  let r_load_sample_data = ref None in
  let r_manage_master_password = ref None in
  let r_master_password_secret_kms_key_id = ref None in
  let r_ip_address_type = ref None in
  let r_multi_a_z = ref None in
  let r_redshift_idc_application_arn = ref None in
  let r_catalog_name = ref None in
  let r_extra_compute_for_automatic_optimization = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DBName";
      "ClusterIdentifier";
      "ClusterType";
      "NodeType";
      "MasterUsername";
      "MasterUserPassword";
      "ClusterSecurityGroups";
      "VpcSecurityGroupIds";
      "ClusterSubnetGroupName";
      "AvailabilityZone";
      "PreferredMaintenanceWindow";
      "ClusterParameterGroupName";
      "AutomatedSnapshotRetentionPeriod";
      "ManualSnapshotRetentionPeriod";
      "Port";
      "ClusterVersion";
      "AllowVersionUpgrade";
      "NumberOfNodes";
      "PubliclyAccessible";
      "Encrypted";
      "HsmClientCertificateIdentifier";
      "HsmConfigurationIdentifier";
      "ElasticIp";
      "Tags";
      "KmsKeyId";
      "EnhancedVpcRouting";
      "AdditionalInfo";
      "IamRoles";
      "MaintenanceTrackName";
      "SnapshotScheduleIdentifier";
      "AvailabilityZoneRelocation";
      "AquaConfigurationStatus";
      "DefaultIamRoleArn";
      "LoadSampleData";
      "ManageMasterPassword";
      "MasterPasswordSecretKmsKeyId";
      "IpAddressType";
      "MultiAZ";
      "RedshiftIdcApplicationArn";
      "CatalogName";
      "ExtraComputeForAutomaticOptimization";
    ] (fun tag _ ->
      match tag with
      | "DBName" ->
          r_db_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DBName" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterType" ->
          r_cluster_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterType" (fun i _ -> string__of_xml i) ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
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
                 (fun i _ -> sensitive_string_of_xml i)
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
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
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
      | "ClusterParameterGroupName" ->
          r_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutomatedSnapshotRetentionPeriod" ->
          r_automated_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomatedSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_optional_of_xml i) ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AllowVersionUpgrade" ->
          r_allow_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Encrypted" ->
          r_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ElasticIp" ->
          r_elastic_ip :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticIp" (fun i _ -> string__of_xml i) ())
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
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AdditionalInfo" ->
          r_additional_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdditionalInfo"
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
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotScheduleIdentifier" ->
          r_snapshot_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AvailabilityZoneRelocation" ->
          r_availability_zone_relocation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneRelocation"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AquaConfigurationStatus" ->
          r_aqua_configuration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaConfigurationStatus"
                 (fun i _ -> aqua_configuration_status_of_xml i)
                 ())
      | "DefaultIamRoleArn" ->
          r_default_iam_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultIamRoleArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "LoadSampleData" ->
          r_load_sample_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadSampleData"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ManageMasterPassword" ->
          r_manage_master_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManageMasterPassword"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MasterPasswordSecretKmsKeyId" ->
          r_master_password_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType" (fun i _ -> string__of_xml i) ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
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
      | "ExtraComputeForAutomaticOptimization" ->
          r_extra_compute_for_automatic_optimization :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtraComputeForAutomaticOptimization"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_name = ( ! ) r_db_name;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     cluster_type = ( ! ) r_cluster_type;
     node_type = Smaws_Lib.Xml.Parse.required "NodeType" (( ! ) r_node_type) i;
     master_username = Smaws_Lib.Xml.Parse.required "MasterUsername" (( ! ) r_master_username) i;
     master_user_password = ( ! ) r_master_user_password;
     cluster_security_groups = ( ! ) r_cluster_security_groups;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     cluster_subnet_group_name = ( ! ) r_cluster_subnet_group_name;
     availability_zone = ( ! ) r_availability_zone;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     cluster_parameter_group_name = ( ! ) r_cluster_parameter_group_name;
     automated_snapshot_retention_period = ( ! ) r_automated_snapshot_retention_period;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     port = ( ! ) r_port;
     cluster_version = ( ! ) r_cluster_version;
     allow_version_upgrade = ( ! ) r_allow_version_upgrade;
     number_of_nodes = ( ! ) r_number_of_nodes;
     publicly_accessible = ( ! ) r_publicly_accessible;
     encrypted = ( ! ) r_encrypted;
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
     elastic_ip = ( ! ) r_elastic_ip;
     tags = ( ! ) r_tags;
     kms_key_id = ( ! ) r_kms_key_id;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     additional_info = ( ! ) r_additional_info;
     iam_roles = ( ! ) r_iam_roles;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     snapshot_schedule_identifier = ( ! ) r_snapshot_schedule_identifier;
     availability_zone_relocation = ( ! ) r_availability_zone_relocation;
     aqua_configuration_status = ( ! ) r_aqua_configuration_status;
     default_iam_role_arn = ( ! ) r_default_iam_role_arn;
     load_sample_data = ( ! ) r_load_sample_data;
     manage_master_password = ( ! ) r_manage_master_password;
     master_password_secret_kms_key_id = ( ! ) r_master_password_secret_kms_key_id;
     ip_address_type = ( ! ) r_ip_address_type;
     multi_a_z = ( ! ) r_multi_a_z;
     redshift_idc_application_arn = ( ! ) r_redshift_idc_application_arn;
     catalog_name = ( ! ) r_catalog_name;
     extra_compute_for_automatic_optimization = ( ! ) r_extra_compute_for_automatic_optimization;
   }
    : create_cluster_message)

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
  let r_parameter_group_name = ref None in
  let r_parameter_group_family = ref None in
  let r_description = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ParameterGroupName"; "ParameterGroupFamily"; "Description"; "Tags" ] (fun tag _ ->
      match tag with
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ParameterGroupFamily" ->
          r_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupFamily"
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
     parameter_group_name =
       Smaws_Lib.Xml.Parse.required "ParameterGroupName" (( ! ) r_parameter_group_name) i;
     parameter_group_family =
       Smaws_Lib.Xml.Parse.required "ParameterGroupFamily" (( ! ) r_parameter_group_family) i;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     tags = ( ! ) r_tags;
   }
    : create_cluster_parameter_group_message)

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
  let r_cluster_security_group_name = ref None in
  let r_description = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterSecurityGroupName"; "Description"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
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
     cluster_security_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSecurityGroupName"
         (( ! ) r_cluster_security_group_name)
         i;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     tags = ( ! ) r_tags;
   }
    : create_cluster_security_group_message)

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
  let r_snapshot_identifier = ref None in
  let r_cluster_identifier = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SnapshotIdentifier"; "ClusterIdentifier"; "ManualSnapshotRetentionPeriod"; "Tags" ]
    (fun tag _ ->
      match tag with
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
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
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
     snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifier" (( ! ) r_snapshot_identifier) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     tags = ( ! ) r_tags;
   }
    : create_cluster_snapshot_message)

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

let subnet_identifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SubnetIdentifier" (fun i _ -> string__of_xml i) ()

let create_cluster_subnet_group_message_of_xml i =
  let r_cluster_subnet_group_name = ref None in
  let r_description = ref None in
  let r_subnet_ids = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterSubnetGroupName"; "Description"; "SubnetIds"; "Tags" ] (fun tag _ ->
      match tag with
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
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
     cluster_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSubnetGroupName" (( ! ) r_cluster_subnet_group_name) i;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     subnet_ids = Smaws_Lib.Xml.Parse.required "SubnetIds" (( ! ) r_subnet_ids) i;
     tags = ( ! ) r_tags;
   }
    : create_cluster_subnet_group_message)

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

let custom_domain_certificate_arn_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let custom_domain_name_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let create_custom_domain_association_result_of_xml i =
  let r_custom_domain_name = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_cluster_identifier = ref None in
  let r_custom_domain_cert_expiry_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CustomDomainName";
      "CustomDomainCertificateArn";
      "ClusterIdentifier";
      "CustomDomainCertExpiryTime";
    ] (fun tag _ ->
      match tag with
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> custom_domain_certificate_arn_string_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainCertExpiryTime" ->
          r_custom_domain_cert_expiry_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertExpiryTime"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_domain_name = ( ! ) r_custom_domain_name;
     custom_domain_certificate_arn = ( ! ) r_custom_domain_certificate_arn;
     cluster_identifier = ( ! ) r_cluster_identifier;
     custom_domain_cert_expiry_time = ( ! ) r_custom_domain_cert_expiry_time;
   }
    : create_custom_domain_association_result)

let create_custom_domain_association_message_of_xml i =
  let r_custom_domain_name = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CustomDomainName"; "CustomDomainCertificateArn"; "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> custom_domain_certificate_arn_string_of_xml i)
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
     custom_domain_certificate_arn =
       Smaws_Lib.Xml.Parse.required "CustomDomainCertificateArn"
         (( ! ) r_custom_domain_certificate_arn)
         i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : create_custom_domain_association_message)

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

let endpoint_access_of_xml i =
  let r_cluster_identifier = ref None in
  let r_resource_owner = ref None in
  let r_subnet_group_name = ref None in
  let r_endpoint_status = ref None in
  let r_endpoint_name = ref None in
  let r_endpoint_create_time = ref None in
  let r_port = ref None in
  let r_address = ref None in
  let r_vpc_security_groups = ref None in
  let r_vpc_endpoint = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "ResourceOwner";
      "SubnetGroupName";
      "EndpointStatus";
      "EndpointName";
      "EndpointCreateTime";
      "Port";
      "Address";
      "VpcSecurityGroups";
      "VpcEndpoint";
    ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ResourceOwner" ->
          r_resource_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceOwner" (fun i _ -> string__of_xml i) ())
      | "SubnetGroupName" ->
          r_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EndpointStatus" ->
          r_endpoint_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EndpointName" ->
          r_endpoint_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointName" (fun i _ -> string__of_xml i) ())
      | "EndpointCreateTime" ->
          r_endpoint_create_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointCreateTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | "Address" ->
          r_address :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Address" (fun i _ -> string__of_xml i) ())
      | "VpcSecurityGroups" ->
          r_vpc_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroup"
                     (fun i _ -> vpc_security_group_membership_of_xml i)
                     ())
                 ())
      | "VpcEndpoint" ->
          r_vpc_endpoint :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcEndpoint"
                 (fun i _ -> vpc_endpoint_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier = ( ! ) r_cluster_identifier;
     resource_owner = ( ! ) r_resource_owner;
     subnet_group_name = ( ! ) r_subnet_group_name;
     endpoint_status = ( ! ) r_endpoint_status;
     endpoint_name = ( ! ) r_endpoint_name;
     endpoint_create_time = ( ! ) r_endpoint_create_time;
     port = ( ! ) r_port;
     address = ( ! ) r_address;
     vpc_security_groups = ( ! ) r_vpc_security_groups;
     vpc_endpoint = ( ! ) r_vpc_endpoint;
   }
    : endpoint_access)

let create_endpoint_access_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_resource_owner = ref None in
  let r_endpoint_name = ref None in
  let r_subnet_group_name = ref None in
  let r_vpc_security_group_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier"; "ResourceOwner"; "EndpointName"; "SubnetGroupName"; "VpcSecurityGroupIds";
    ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ResourceOwner" ->
          r_resource_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceOwner" (fun i _ -> string__of_xml i) ())
      | "EndpointName" ->
          r_endpoint_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointName" (fun i _ -> string__of_xml i) ())
      | "SubnetGroupName" ->
          r_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubnetGroupName"
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier = ( ! ) r_cluster_identifier;
     resource_owner = ( ! ) r_resource_owner;
     endpoint_name = Smaws_Lib.Xml.Parse.required "EndpointName" (( ! ) r_endpoint_name) i;
     subnet_group_name =
       Smaws_Lib.Xml.Parse.required "SubnetGroupName" (( ! ) r_subnet_group_name) i;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
   }
    : create_endpoint_access_message)

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
  let r_severity = ref None in
  let r_enabled = ref None in
  let r_tags = ref None in
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
      "Severity";
      "Enabled";
      "Tags";
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
                 (fun i _ -> t_stamp_of_xml i)
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
      | "Severity" ->
          r_severity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Severity" (fun i _ -> string__of_xml i) ())
      | "Enabled" ->
          r_enabled :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> boolean__of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
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
     severity = ( ! ) r_severity;
     enabled = ( ! ) r_enabled;
     tags = ( ! ) r_tags;
   }
    : event_subscription)

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
  let r_source_ids = ref None in
  let r_event_categories = ref None in
  let r_severity = ref None in
  let r_enabled = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SubscriptionName";
      "SnsTopicArn";
      "SourceType";
      "SourceIds";
      "EventCategories";
      "Severity";
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
      | "Severity" ->
          r_severity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Severity" (fun i _ -> string__of_xml i) ())
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
     source_ids = ( ! ) r_source_ids;
     event_categories = ( ! ) r_event_categories;
     severity = ( ! ) r_severity;
     enabled = ( ! ) r_enabled;
     tags = ( ! ) r_tags;
   }
    : create_event_subscription_message)

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

let hsm_client_certificate_of_xml i =
  let r_hsm_client_certificate_identifier = ref None in
  let r_hsm_client_certificate_public_key = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "HsmClientCertificateIdentifier"; "HsmClientCertificatePublicKey"; "Tags" ] (fun tag _ ->
      match tag with
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmClientCertificatePublicKey" ->
          r_hsm_client_certificate_public_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificatePublicKey"
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
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
     hsm_client_certificate_public_key = ( ! ) r_hsm_client_certificate_public_key;
     tags = ( ! ) r_tags;
   }
    : hsm_client_certificate)

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
  let r_hsm_client_certificate_identifier = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HsmClientCertificateIdentifier"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
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
     hsm_client_certificate_identifier =
       Smaws_Lib.Xml.Parse.required "HsmClientCertificateIdentifier"
         (( ! ) r_hsm_client_certificate_identifier)
         i;
     tags = ( ! ) r_tags;
   }
    : create_hsm_client_certificate_message)

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

let hsm_configuration_of_xml i =
  let r_hsm_configuration_identifier = ref None in
  let r_description = ref None in
  let r_hsm_ip_address = ref None in
  let r_hsm_partition_name = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "HsmConfigurationIdentifier"; "Description"; "HsmIpAddress"; "HsmPartitionName"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "HsmIpAddress" ->
          r_hsm_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmIpAddress" (fun i _ -> string__of_xml i) ())
      | "HsmPartitionName" ->
          r_hsm_partition_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmPartitionName"
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
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
     description = ( ! ) r_description;
     hsm_ip_address = ( ! ) r_hsm_ip_address;
     hsm_partition_name = ( ! ) r_hsm_partition_name;
     tags = ( ! ) r_tags;
   }
    : hsm_configuration)

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
  let r_hsm_configuration_identifier = ref None in
  let r_description = ref None in
  let r_hsm_ip_address = ref None in
  let r_hsm_partition_name = ref None in
  let r_hsm_partition_password = ref None in
  let r_hsm_server_public_certificate = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "HsmConfigurationIdentifier";
      "Description";
      "HsmIpAddress";
      "HsmPartitionName";
      "HsmPartitionPassword";
      "HsmServerPublicCertificate";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "HsmIpAddress" ->
          r_hsm_ip_address :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmIpAddress" (fun i _ -> string__of_xml i) ())
      | "HsmPartitionName" ->
          r_hsm_partition_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmPartitionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmPartitionPassword" ->
          r_hsm_partition_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmPartitionPassword"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmServerPublicCertificate" ->
          r_hsm_server_public_certificate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmServerPublicCertificate"
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
     hsm_configuration_identifier =
       Smaws_Lib.Xml.Parse.required "HsmConfigurationIdentifier"
         (( ! ) r_hsm_configuration_identifier)
         i;
     description = Smaws_Lib.Xml.Parse.required "Description" (( ! ) r_description) i;
     hsm_ip_address = Smaws_Lib.Xml.Parse.required "HsmIpAddress" (( ! ) r_hsm_ip_address) i;
     hsm_partition_name =
       Smaws_Lib.Xml.Parse.required "HsmPartitionName" (( ! ) r_hsm_partition_name) i;
     hsm_partition_password =
       Smaws_Lib.Xml.Parse.required "HsmPartitionPassword" (( ! ) r_hsm_partition_password) i;
     hsm_server_public_certificate =
       Smaws_Lib.Xml.Parse.required "HsmServerPublicCertificate"
         (( ! ) r_hsm_server_public_certificate)
         i;
     tags = ( ! ) r_tags;
   }
    : create_hsm_configuration_message)

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

let encryption_context_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) () in
      let v = Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> string__of_xml i) () in
      (k, v))
    ()

let description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let integration_error_of_xml i =
  let r_error_code = ref None in
  let r_error_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ErrorCode"; "ErrorMessage" ] (fun tag _ ->
      match tag with
      | "ErrorCode" ->
          r_error_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorCode" (fun i _ -> string__of_xml i) ())
      | "ErrorMessage" ->
          r_error_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorMessage" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     error_code = Smaws_Lib.Xml.Parse.required "ErrorCode" (( ! ) r_error_code) i;
     error_message = ( ! ) r_error_message;
   }
    : integration_error)

let integration_error_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "IntegrationError" (fun i _ -> integration_error_of_xml i) ()

let zero_etl_integration_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "creating" -> CREATING
   | "active" -> ACTIVE
   | "modifying" -> MODIFYING
   | "failed" -> FAILED
   | "deleting" -> DELETING
   | "syncing" -> SYNCING
   | "needs_attention" -> NEEDS_ATTENTION
   | _ -> failwith "unknown enum value"
    : zero_etl_integration_status)

let target_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let source_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let integration_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let integration_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let integration_of_xml i =
  let r_integration_arn = ref None in
  let r_integration_name = ref None in
  let r_source_arn = ref None in
  let r_target_arn = ref None in
  let r_status = ref None in
  let r_errors = ref None in
  let r_create_time = ref None in
  let r_description = ref None in
  let r_kms_key_id = ref None in
  let r_additional_encryption_context = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "IntegrationArn";
      "IntegrationName";
      "SourceArn";
      "TargetArn";
      "Status";
      "Errors";
      "CreateTime";
      "Description";
      "KMSKeyId";
      "AdditionalEncryptionContext";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "IntegrationArn" ->
          r_integration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationArn"
                 (fun i _ -> integration_arn_of_xml i)
                 ())
      | "IntegrationName" ->
          r_integration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationName"
                 (fun i _ -> integration_name_of_xml i)
                 ())
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn" (fun i _ -> source_arn_of_xml i) ())
      | "TargetArn" ->
          r_target_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetArn" (fun i _ -> target_arn_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> zero_etl_integration_status_of_xml i)
                 ())
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "IntegrationError"
                     (fun i _ -> integration_error_of_xml i)
                     ())
                 ())
      | "CreateTime" ->
          r_create_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CreateTime" (fun i _ -> t_stamp_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "KMSKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KMSKeyId" (fun i _ -> string__of_xml i) ())
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
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     integration_arn = ( ! ) r_integration_arn;
     integration_name = ( ! ) r_integration_name;
     source_arn = ( ! ) r_source_arn;
     target_arn = ( ! ) r_target_arn;
     status = ( ! ) r_status;
     errors = ( ! ) r_errors;
     create_time = ( ! ) r_create_time;
     description = ( ! ) r_description;
     kms_key_id = ( ! ) r_kms_key_id;
     additional_encryption_context = ( ! ) r_additional_encryption_context;
     tags = ( ! ) r_tags;
   }
    : integration)

let integration_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let create_integration_message_of_xml i =
  let r_source_arn = ref None in
  let r_target_arn = ref None in
  let r_integration_name = ref None in
  let r_kms_key_id = ref None in
  let r_tag_list = ref None in
  let r_additional_encryption_context = ref None in
  let r_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SourceArn";
      "TargetArn";
      "IntegrationName";
      "KMSKeyId";
      "TagList";
      "AdditionalEncryptionContext";
      "Description";
    ] (fun tag _ ->
      match tag with
      | "SourceArn" ->
          r_source_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn" (fun i _ -> source_arn_of_xml i) ())
      | "TargetArn" ->
          r_target_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetArn" (fun i _ -> target_arn_of_xml i) ())
      | "IntegrationName" ->
          r_integration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationName"
                 (fun i _ -> integration_name_of_xml i)
                 ())
      | "KMSKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KMSKeyId" (fun i _ -> string__of_xml i) ())
      | "TagList" ->
          r_tag_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagList"
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
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> integration_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_arn = Smaws_Lib.Xml.Parse.required "SourceArn" (( ! ) r_source_arn) i;
     target_arn = Smaws_Lib.Xml.Parse.required "TargetArn" (( ! ) r_target_arn) i;
     integration_name = Smaws_Lib.Xml.Parse.required "IntegrationName" (( ! ) r_integration_name) i;
     kms_key_id = ( ! ) r_kms_key_id;
     tag_list = ( ! ) r_tag_list;
     additional_encryption_context = ( ! ) r_additional_encryption_context;
     description = ( ! ) r_description;
   }
    : create_integration_message)

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

let tag_key_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ()

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

let service_integrations_union_of_xml i =
  let r_lake_formation = ref None in
  let r_s3_access_grants = ref None in
  let r_redshift = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LakeFormation"; "S3AccessGrants"; "Redshift" ]
    (fun tag _ ->
      match tag with
      | "LakeFormation" ->
          r_lake_formation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakeFormation"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> lake_formation_scope_union_of_xml i)
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
      | "Redshift" ->
          r_redshift :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Redshift"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> redshift_scope_union_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_lake_formation with
   | Some v -> LakeFormation v
   | None -> (
       match ( ! ) r_s3_access_grants with
       | Some v -> S3AccessGrants v
       | None -> (
           match ( ! ) r_redshift with
           | Some v -> Redshift v
           | None -> failwith "no union member present in xml response"))
    : service_integrations_union)

let service_integration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> service_integrations_union_of_xml i) ()

let idc_display_name_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let identity_namespace_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let redshift_idc_application_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let redshift_idc_application_of_xml i =
  let r_idc_instance_arn = ref None in
  let r_redshift_idc_application_name = ref None in
  let r_redshift_idc_application_arn = ref None in
  let r_identity_namespace = ref None in
  let r_idc_display_name = ref None in
  let r_iam_role_arn = ref None in
  let r_idc_managed_application_arn = ref None in
  let r_idc_onboard_status = ref None in
  let r_authorized_token_issuer_list = ref None in
  let r_service_integrations = ref None in
  let r_application_type = ref None in
  let r_tags = ref None in
  let r_sso_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "IdcInstanceArn";
      "RedshiftIdcApplicationName";
      "RedshiftIdcApplicationArn";
      "IdentityNamespace";
      "IdcDisplayName";
      "IamRoleArn";
      "IdcManagedApplicationArn";
      "IdcOnboardStatus";
      "AuthorizedTokenIssuerList";
      "ServiceIntegrations";
      "ApplicationType";
      "Tags";
      "SsoTagKeys";
    ] (fun tag _ ->
      match tag with
      | "IdcInstanceArn" ->
          r_idc_instance_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdcInstanceArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RedshiftIdcApplicationName" ->
          r_redshift_idc_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationName"
                 (fun i _ -> redshift_idc_application_name_of_xml i)
                 ())
      | "RedshiftIdcApplicationArn" ->
          r_redshift_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IdentityNamespace" ->
          r_identity_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdentityNamespace"
                 (fun i _ -> identity_namespace_string_of_xml i)
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
      | "IdcManagedApplicationArn" ->
          r_idc_managed_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdcManagedApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IdcOnboardStatus" ->
          r_idc_onboard_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdcOnboardStatus"
                 (fun i _ -> string__of_xml i)
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
      | "ServiceIntegrations" ->
          r_service_integrations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceIntegrations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> service_integrations_union_of_xml i)
                     ())
                 ())
      | "ApplicationType" ->
          r_application_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationType"
                 (fun i _ -> application_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "SsoTagKeys" ->
          r_sso_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SsoTagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     idc_instance_arn = ( ! ) r_idc_instance_arn;
     redshift_idc_application_name = ( ! ) r_redshift_idc_application_name;
     redshift_idc_application_arn = ( ! ) r_redshift_idc_application_arn;
     identity_namespace = ( ! ) r_identity_namespace;
     idc_display_name = ( ! ) r_idc_display_name;
     iam_role_arn = ( ! ) r_iam_role_arn;
     idc_managed_application_arn = ( ! ) r_idc_managed_application_arn;
     idc_onboard_status = ( ! ) r_idc_onboard_status;
     authorized_token_issuer_list = ( ! ) r_authorized_token_issuer_list;
     service_integrations = ( ! ) r_service_integrations;
     application_type = ( ! ) r_application_type;
     tags = ( ! ) r_tags;
     sso_tag_keys = ( ! ) r_sso_tag_keys;
   }
    : redshift_idc_application)

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
  let r_idc_instance_arn = ref None in
  let r_redshift_idc_application_name = ref None in
  let r_identity_namespace = ref None in
  let r_idc_display_name = ref None in
  let r_iam_role_arn = ref None in
  let r_authorized_token_issuer_list = ref None in
  let r_service_integrations = ref None in
  let r_application_type = ref None in
  let r_tags = ref None in
  let r_sso_tag_keys = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "IdcInstanceArn";
      "RedshiftIdcApplicationName";
      "IdentityNamespace";
      "IdcDisplayName";
      "IamRoleArn";
      "AuthorizedTokenIssuerList";
      "ServiceIntegrations";
      "ApplicationType";
      "Tags";
      "SsoTagKeys";
    ] (fun tag _ ->
      match tag with
      | "IdcInstanceArn" ->
          r_idc_instance_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdcInstanceArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RedshiftIdcApplicationName" ->
          r_redshift_idc_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationName"
                 (fun i _ -> redshift_idc_application_name_of_xml i)
                 ())
      | "IdentityNamespace" ->
          r_identity_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdentityNamespace"
                 (fun i _ -> identity_namespace_string_of_xml i)
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
      | "AuthorizedTokenIssuerList" ->
          r_authorized_token_issuer_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthorizedTokenIssuerList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> authorized_token_issuer_of_xml i)
                     ())
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
      | "ApplicationType" ->
          r_application_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationType"
                 (fun i _ -> application_type_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "SsoTagKeys" ->
          r_sso_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SsoTagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     idc_instance_arn = Smaws_Lib.Xml.Parse.required "IdcInstanceArn" (( ! ) r_idc_instance_arn) i;
     redshift_idc_application_name =
       Smaws_Lib.Xml.Parse.required "RedshiftIdcApplicationName"
         (( ! ) r_redshift_idc_application_name)
         i;
     identity_namespace = ( ! ) r_identity_namespace;
     idc_display_name = Smaws_Lib.Xml.Parse.required "IdcDisplayName" (( ! ) r_idc_display_name) i;
     iam_role_arn = Smaws_Lib.Xml.Parse.required "IamRoleArn" (( ! ) r_iam_role_arn) i;
     authorized_token_issuer_list = ( ! ) r_authorized_token_issuer_list;
     service_integrations = ( ! ) r_service_integrations;
     application_type = ( ! ) r_application_type;
     tags = ( ! ) r_tags;
     sso_tag_keys = ( ! ) r_sso_tag_keys;
   }
    : create_redshift_idc_application_message)

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

let scheduled_action_time_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledActionTime" (fun i _ -> t_stamp_of_xml i) ()

let scheduled_action_state_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "ACTIVE" -> ACTIVE | "DISABLED" -> DISABLED | _ -> failwith "unknown enum value"
    : scheduled_action_state)

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

let resize_cluster_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_cluster_type = ref None in
  let r_node_type = ref None in
  let r_number_of_nodes = ref None in
  let r_classic = ref None in
  let r_reserved_node_id = ref None in
  let r_target_reserved_node_offering_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "ClusterType";
      "NodeType";
      "NumberOfNodes";
      "Classic";
      "ReservedNodeId";
      "TargetReservedNodeOfferingId";
    ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterType" ->
          r_cluster_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterType" (fun i _ -> string__of_xml i) ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Classic" ->
          r_classic :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Classic"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetReservedNodeOfferingId" ->
          r_target_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     cluster_type = ( ! ) r_cluster_type;
     node_type = ( ! ) r_node_type;
     number_of_nodes = ( ! ) r_number_of_nodes;
     classic = ( ! ) r_classic;
     reserved_node_id = ( ! ) r_reserved_node_id;
     target_reserved_node_offering_id = ( ! ) r_target_reserved_node_offering_id;
   }
    : resize_cluster_message)

let scheduled_action_type_of_xml i =
  let r_resize_cluster = ref None in
  let r_pause_cluster = ref None in
  let r_resume_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResizeCluster"; "PauseCluster"; "ResumeCluster" ]
    (fun tag _ ->
      match tag with
      | "ResizeCluster" ->
          r_resize_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResizeCluster"
                 (fun i _ -> resize_cluster_message_of_xml i)
                 ())
      | "PauseCluster" ->
          r_pause_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PauseCluster"
                 (fun i _ -> pause_cluster_message_of_xml i)
                 ())
      | "ResumeCluster" ->
          r_resume_cluster :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResumeCluster"
                 (fun i _ -> resume_cluster_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resize_cluster = ( ! ) r_resize_cluster;
     pause_cluster = ( ! ) r_pause_cluster;
     resume_cluster = ( ! ) r_resume_cluster;
   }
    : scheduled_action_type)

let scheduled_action_of_xml i =
  let r_scheduled_action_name = ref None in
  let r_target_action = ref None in
  let r_schedule = ref None in
  let r_iam_role = ref None in
  let r_scheduled_action_description = ref None in
  let r_state = ref None in
  let r_next_invocations = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ScheduledActionName";
      "TargetAction";
      "Schedule";
      "IamRole";
      "ScheduledActionDescription";
      "State";
      "NextInvocations";
      "StartTime";
      "EndTime";
    ] (fun tag _ ->
      match tag with
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetAction" ->
          r_target_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetAction"
                 (fun i _ -> scheduled_action_type_of_xml i)
                 ())
      | "Schedule" ->
          r_schedule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Schedule" (fun i _ -> string__of_xml i) ())
      | "IamRole" ->
          r_iam_role :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IamRole" (fun i _ -> string__of_xml i) ())
      | "ScheduledActionDescription" ->
          r_scheduled_action_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "State"
                 (fun i _ -> scheduled_action_state_of_xml i)
                 ())
      | "NextInvocations" ->
          r_next_invocations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextInvocations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledActionTime"
                     (fun i _ -> t_stamp_of_xml i)
                     ())
                 ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheduled_action_name = ( ! ) r_scheduled_action_name;
     target_action = ( ! ) r_target_action;
     schedule = ( ! ) r_schedule;
     iam_role = ( ! ) r_iam_role;
     scheduled_action_description = ( ! ) r_scheduled_action_description;
     state = ( ! ) r_state;
     next_invocations = ( ! ) r_next_invocations;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
   }
    : scheduled_action)

let create_scheduled_action_message_of_xml i =
  let r_scheduled_action_name = ref None in
  let r_target_action = ref None in
  let r_schedule = ref None in
  let r_iam_role = ref None in
  let r_scheduled_action_description = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_enable = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ScheduledActionName";
      "TargetAction";
      "Schedule";
      "IamRole";
      "ScheduledActionDescription";
      "StartTime";
      "EndTime";
      "Enable";
    ] (fun tag _ ->
      match tag with
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetAction" ->
          r_target_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetAction"
                 (fun i _ -> scheduled_action_type_of_xml i)
                 ())
      | "Schedule" ->
          r_schedule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Schedule" (fun i _ -> string__of_xml i) ())
      | "IamRole" ->
          r_iam_role :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IamRole" (fun i _ -> string__of_xml i) ())
      | "ScheduledActionDescription" ->
          r_scheduled_action_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | "Enable" ->
          r_enable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enable"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
     target_action = Smaws_Lib.Xml.Parse.required "TargetAction" (( ! ) r_target_action) i;
     schedule = Smaws_Lib.Xml.Parse.required "Schedule" (( ! ) r_schedule) i;
     iam_role = Smaws_Lib.Xml.Parse.required "IamRole" (( ! ) r_iam_role) i;
     scheduled_action_description = ( ! ) r_scheduled_action_description;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     enable = ( ! ) r_enable;
   }
    : create_scheduled_action_message)

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

let snapshot_copy_grant_of_xml i =
  let r_snapshot_copy_grant_name = ref None in
  let r_kms_key_id = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SnapshotCopyGrantName"; "KmsKeyId"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "SnapshotCopyGrantName" ->
          r_snapshot_copy_grant_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrantName"
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
     snapshot_copy_grant_name = ( ! ) r_snapshot_copy_grant_name;
     kms_key_id = ( ! ) r_kms_key_id;
     tags = ( ! ) r_tags;
   }
    : snapshot_copy_grant)

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
  let r_snapshot_copy_grant_name = ref None in
  let r_kms_key_id = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SnapshotCopyGrantName"; "KmsKeyId"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "SnapshotCopyGrantName" ->
          r_snapshot_copy_grant_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrantName"
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
     snapshot_copy_grant_name =
       Smaws_Lib.Xml.Parse.required "SnapshotCopyGrantName" (( ! ) r_snapshot_copy_grant_name) i;
     kms_key_id = ( ! ) r_kms_key_id;
     tags = ( ! ) r_tags;
   }
    : create_snapshot_copy_grant_message)

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

let scheduled_snapshot_time_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotTime" (fun i _ -> t_stamp_of_xml i) ()

let schedule_definition_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ScheduleDefinition" (fun i _ -> string__of_xml i) ()

let snapshot_schedule_of_xml i =
  let r_schedule_definitions = ref None in
  let r_schedule_identifier = ref None in
  let r_schedule_description = ref None in
  let r_tags = ref None in
  let r_next_invocations = ref None in
  let r_associated_cluster_count = ref None in
  let r_associated_clusters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ScheduleDefinitions";
      "ScheduleIdentifier";
      "ScheduleDescription";
      "Tags";
      "NextInvocations";
      "AssociatedClusterCount";
      "AssociatedClusters";
    ] (fun tag _ ->
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
      | "ScheduleDescription" ->
          r_schedule_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
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
      | "AssociatedClusterCount" ->
          r_associated_cluster_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociatedClusterCount"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "AssociatedClusters" ->
          r_associated_clusters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AssociatedClusters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ClusterAssociatedToSchedule"
                     (fun i _ -> cluster_associated_to_schedule_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     schedule_definitions = ( ! ) r_schedule_definitions;
     schedule_identifier = ( ! ) r_schedule_identifier;
     schedule_description = ( ! ) r_schedule_description;
     tags = ( ! ) r_tags;
     next_invocations = ( ! ) r_next_invocations;
     associated_cluster_count = ( ! ) r_associated_cluster_count;
     associated_clusters = ( ! ) r_associated_clusters;
   }
    : snapshot_schedule)

let create_snapshot_schedule_message_of_xml i =
  let r_schedule_definitions = ref None in
  let r_schedule_identifier = ref None in
  let r_schedule_description = ref None in
  let r_tags = ref None in
  let r_dry_run = ref None in
  let r_next_invocations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ScheduleDefinitions";
      "ScheduleIdentifier";
      "ScheduleDescription";
      "Tags";
      "DryRun";
      "NextInvocations";
    ] (fun tag _ ->
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
      | "ScheduleDescription" ->
          r_schedule_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Tag" (fun i _ -> tag_of_xml i) ())
                 ())
      | "DryRun" ->
          r_dry_run :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DryRun"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "NextInvocations" ->
          r_next_invocations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextInvocations"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     schedule_definitions = ( ! ) r_schedule_definitions;
     schedule_identifier = ( ! ) r_schedule_identifier;
     schedule_description = ( ! ) r_schedule_description;
     tags = ( ! ) r_tags;
     dry_run = ( ! ) r_dry_run;
     next_invocations = ( ! ) r_next_invocations;
   }
    : create_snapshot_schedule_message)

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

let create_tags_message_of_xml i =
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
    : create_tags_message)

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

let usage_limit_breach_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "log" -> LOG
   | "emit-metric" -> EMIT_METRIC
   | "disable" -> DISABLE
   | _ -> failwith "unknown enum value"
    : usage_limit_breach_action)

let usage_limit_period_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "daily" -> DAILY
   | "weekly" -> WEEKLY
   | "monthly" -> MONTHLY
   | _ -> failwith "unknown enum value"
    : usage_limit_period)

let usage_limit_limit_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "time" -> TIME
   | "data-scanned" -> DATA_SCANNED
   | _ -> failwith "unknown enum value"
    : usage_limit_limit_type)

let usage_limit_feature_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "spectrum" -> SPECTRUM
   | "concurrency-scaling" -> CONCURRENCY_SCALING
   | "cross-region-datasharing" -> CROSS_REGION_DATASHARING
   | "extra-compute-for-automatic-optimization" -> EXTRA_COMPUTE_FOR_AUTOMATIC_OPTIMIZATION
   | _ -> failwith "unknown enum value"
    : usage_limit_feature_type)

let usage_limit_of_xml i =
  let r_usage_limit_id = ref None in
  let r_cluster_identifier = ref None in
  let r_feature_type = ref None in
  let r_limit_type = ref None in
  let r_amount = ref None in
  let r_period = ref None in
  let r_breach_action = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "UsageLimitId";
      "ClusterIdentifier";
      "FeatureType";
      "LimitType";
      "Amount";
      "Period";
      "BreachAction";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "UsageLimitId" ->
          r_usage_limit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsageLimitId" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "FeatureType" ->
          r_feature_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FeatureType"
                 (fun i _ -> usage_limit_feature_type_of_xml i)
                 ())
      | "LimitType" ->
          r_limit_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LimitType"
                 (fun i _ -> usage_limit_limit_type_of_xml i)
                 ())
      | "Amount" ->
          r_amount :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Amount" (fun i _ -> long_of_xml i) ())
      | "Period" ->
          r_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Period"
                 (fun i _ -> usage_limit_period_of_xml i)
                 ())
      | "BreachAction" ->
          r_breach_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BreachAction"
                 (fun i _ -> usage_limit_breach_action_of_xml i)
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
     usage_limit_id = ( ! ) r_usage_limit_id;
     cluster_identifier = ( ! ) r_cluster_identifier;
     feature_type = ( ! ) r_feature_type;
     limit_type = ( ! ) r_limit_type;
     amount = ( ! ) r_amount;
     period = ( ! ) r_period;
     breach_action = ( ! ) r_breach_action;
     tags = ( ! ) r_tags;
   }
    : usage_limit)

let create_usage_limit_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_feature_type = ref None in
  let r_limit_type = ref None in
  let r_amount = ref None in
  let r_period = ref None in
  let r_breach_action = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "FeatureType"; "LimitType"; "Amount"; "Period"; "BreachAction"; "Tags" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "FeatureType" ->
          r_feature_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FeatureType"
                 (fun i _ -> usage_limit_feature_type_of_xml i)
                 ())
      | "LimitType" ->
          r_limit_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LimitType"
                 (fun i _ -> usage_limit_limit_type_of_xml i)
                 ())
      | "Amount" ->
          r_amount :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Amount" (fun i _ -> long_of_xml i) ())
      | "Period" ->
          r_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Period"
                 (fun i _ -> usage_limit_period_of_xml i)
                 ())
      | "BreachAction" ->
          r_breach_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BreachAction"
                 (fun i _ -> usage_limit_breach_action_of_xml i)
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
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     feature_type = Smaws_Lib.Xml.Parse.required "FeatureType" (( ! ) r_feature_type) i;
     limit_type = Smaws_Lib.Xml.Parse.required "LimitType" (( ! ) r_limit_type) i;
     amount = Smaws_Lib.Xml.Parse.required "Amount" (( ! ) r_amount) i;
     period = ( ! ) r_period;
     breach_action = ( ! ) r_breach_action;
     tags = ( ! ) r_tags;
   }
    : create_usage_limit_message)

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

let custom_domain_associations_message_of_xml i =
  let r_marker = ref None in
  let r_associations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "Associations" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "Associations" ->
          r_associations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Associations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Association"
                     (fun i _ -> association_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; associations = ( ! ) r_associations }
    : custom_domain_associations_message)

let customer_storage_message_of_xml i =
  let r_total_backup_size_in_mega_bytes = ref None in
  let r_total_provisioned_storage_in_mega_bytes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TotalBackupSizeInMegaBytes"; "TotalProvisionedStorageInMegaBytes" ] (fun tag _ ->
      match tag with
      | "TotalBackupSizeInMegaBytes" ->
          r_total_backup_size_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalBackupSizeInMegaBytes"
                 (fun i _ -> double_of_xml i)
                 ())
      | "TotalProvisionedStorageInMegaBytes" ->
          r_total_provisioned_storage_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalProvisionedStorageInMegaBytes"
                 (fun i _ -> double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     total_backup_size_in_mega_bytes = ( ! ) r_total_backup_size_in_mega_bytes;
     total_provisioned_storage_in_mega_bytes = ( ! ) r_total_provisioned_storage_in_mega_bytes;
   }
    : customer_storage_message)

let data_share_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> data_share_of_xml i) ()

let data_share_status_for_consumer_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "ACTIVE" -> ACTIVE | "AVAILABLE" -> AVAILABLE | _ -> failwith "unknown enum value"
    : data_share_status_for_consumer)

let data_share_status_for_producer_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ACTIVE" -> ACTIVE
   | "AUTHORIZED" -> AUTHORIZED
   | "PENDING_AUTHORIZATION" -> PENDING_AUTHORIZATION
   | "DEAUTHORIZED" -> DEAUTHORIZED
   | "REJECTED" -> REJECTED
   | _ -> failwith "unknown enum value"
    : data_share_status_for_producer)

let db_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DbGroup" (fun i _ -> string__of_xml i) ()

let deauthorize_data_share_message_of_xml i =
  let r_data_share_arn = ref None in
  let r_consumer_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DataShareArn"; "ConsumerIdentifier" ]
    (fun tag _ ->
      match tag with
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | "ConsumerIdentifier" ->
          r_consumer_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     data_share_arn = Smaws_Lib.Xml.Parse.required "DataShareArn" (( ! ) r_data_share_arn) i;
     consumer_identifier =
       Smaws_Lib.Xml.Parse.required "ConsumerIdentifier" (( ! ) r_consumer_identifier) i;
   }
    : deauthorize_data_share_message)

let default_cluster_parameters_of_xml i =
  let r_parameter_group_family = ref None in
  let r_marker = ref None in
  let r_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ParameterGroupFamily"; "Marker"; "Parameters" ]
    (fun tag _ ->
      match tag with
      | "ParameterGroupFamily" ->
          r_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupFamily"
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
     parameter_group_family = ( ! ) r_parameter_group_family;
     marker = ( ! ) r_marker;
     parameters = ( ! ) r_parameters;
   }
    : default_cluster_parameters)

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
  let r_cluster_identifier = ref None in
  let r_skip_final_cluster_snapshot = ref None in
  let r_final_cluster_snapshot_identifier = ref None in
  let r_final_cluster_snapshot_retention_period = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "SkipFinalClusterSnapshot";
      "FinalClusterSnapshotIdentifier";
      "FinalClusterSnapshotRetentionPeriod";
    ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SkipFinalClusterSnapshot" ->
          r_skip_final_cluster_snapshot :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SkipFinalClusterSnapshot"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "FinalClusterSnapshotIdentifier" ->
          r_final_cluster_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalClusterSnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "FinalClusterSnapshotRetentionPeriod" ->
          r_final_cluster_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinalClusterSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     skip_final_cluster_snapshot = ( ! ) r_skip_final_cluster_snapshot;
     final_cluster_snapshot_identifier = ( ! ) r_final_cluster_snapshot_identifier;
     final_cluster_snapshot_retention_period = ( ! ) r_final_cluster_snapshot_retention_period;
   }
    : delete_cluster_message)

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

let delete_cluster_snapshot_result_of_xml i =
  let r_snapshot = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Snapshot" ] (fun tag _ ->
      match tag with
      | "Snapshot" ->
          r_snapshot :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Snapshot" (fun i _ -> snapshot_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot = ( ! ) r_snapshot } : delete_cluster_snapshot_result)

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

let delete_custom_domain_association_message_of_xml i =
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
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     custom_domain_name =
       Smaws_Lib.Xml.Parse.required "CustomDomainName" (( ! ) r_custom_domain_name) i;
   }
    : delete_custom_domain_association_message)

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

let delete_tags_message_of_xml i =
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
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_name = Smaws_Lib.Xml.Parse.required "ResourceName" (( ! ) r_resource_name) i;
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
   }
    : delete_tags_message)

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

let namespace_registration_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Registering" -> REGISTERING
   | "Deregistering" -> DEREGISTERING
   | _ -> failwith "unknown enum value"
    : namespace_registration_status)

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

let serverless_identifier_of_xml i =
  let r_namespace_identifier = ref None in
  let r_workgroup_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NamespaceIdentifier"; "WorkgroupIdentifier" ]
    (fun tag _ ->
      match tag with
      | "NamespaceIdentifier" ->
          r_namespace_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NamespaceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "WorkgroupIdentifier" ->
          r_workgroup_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WorkgroupIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace_identifier =
       Smaws_Lib.Xml.Parse.required "NamespaceIdentifier" (( ! ) r_namespace_identifier) i;
     workgroup_identifier =
       Smaws_Lib.Xml.Parse.required "WorkgroupIdentifier" (( ! ) r_workgroup_identifier) i;
   }
    : serverless_identifier)

let namespace_identifier_union_of_xml i =
  let r_serverless_identifier = ref None in
  let r_provisioned_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServerlessIdentifier"; "ProvisionedIdentifier" ]
    (fun tag _ ->
      match tag with
      | "ServerlessIdentifier" ->
          r_serverless_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServerlessIdentifier"
                 (fun i _ -> serverless_identifier_of_xml i)
                 ())
      | "ProvisionedIdentifier" ->
          r_provisioned_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProvisionedIdentifier"
                 (fun i _ -> provisioned_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_serverless_identifier with
   | Some v -> ServerlessIdentifier v
   | None -> (
       match ( ! ) r_provisioned_identifier with
       | Some v -> ProvisionedIdentifier v
       | None -> failwith "no union member present in xml response")
    : namespace_identifier_union)

let deregister_namespace_input_message_of_xml i =
  let r_namespace_identifier = ref None in
  let r_consumer_identifiers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NamespaceIdentifier"; "ConsumerIdentifiers" ]
    (fun tag _ ->
      match tag with
      | "NamespaceIdentifier" ->
          r_namespace_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NamespaceIdentifier"
                 (fun i _ -> namespace_identifier_union_of_xml i)
                 ())
      | "ConsumerIdentifiers" ->
          r_consumer_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace_identifier =
       Smaws_Lib.Xml.Parse.required "NamespaceIdentifier" (( ! ) r_namespace_identifier) i;
     consumer_identifiers =
       Smaws_Lib.Xml.Parse.required "ConsumerIdentifiers" (( ! ) r_consumer_identifiers) i;
   }
    : deregister_namespace_input_message)

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

let describe_cluster_db_revisions_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
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
     cluster_identifier = ( ! ) r_cluster_identifier;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_cluster_db_revisions_message)

let tag_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ()

let describe_cluster_parameter_groups_message_of_xml i =
  let r_parameter_group_name = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ParameterGroupName"; "MaxRecords"; "Marker"; "TagKeys"; "TagValues" ] (fun tag _ ->
      match tag with
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
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
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_group_name = ( ! ) r_parameter_group_name;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
   }
    : describe_cluster_parameter_groups_message)

let describe_cluster_parameters_message_of_xml i =
  let r_parameter_group_name = ref None in
  let r_source = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ParameterGroupName"; "Source"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
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
     parameter_group_name =
       Smaws_Lib.Xml.Parse.required "ParameterGroupName" (( ! ) r_parameter_group_name) i;
     source = ( ! ) r_source;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_cluster_parameters_message)

let describe_cluster_security_groups_message_of_xml i =
  let r_cluster_security_group_name = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterSecurityGroupName"; "MaxRecords"; "Marker"; "TagKeys"; "TagValues" ] (fun tag _ ->
      match tag with
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
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
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_security_group_name = ( ! ) r_cluster_security_group_name;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
   }
    : describe_cluster_security_groups_message)

let snapshot_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Snapshot" (fun i _ -> snapshot_of_xml i) ()

let snapshot_message_of_xml i =
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
  ({ marker = ( ! ) r_marker; snapshots = ( ! ) r_snapshots } : snapshot_message)

let sort_by_order_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "ASC" -> ASCENDING | "DESC" -> DESCENDING | _ -> failwith "unknown enum value"
    : sort_by_order)

let snapshot_attribute_to_sort_by_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SOURCE_TYPE" -> SOURCE_TYPE
   | "TOTAL_SIZE" -> TOTAL_SIZE
   | "CREATE_TIME" -> CREATE_TIME
   | _ -> failwith "unknown enum value"
    : snapshot_attribute_to_sort_by)

let snapshot_sorting_entity_of_xml i =
  let r_attribute = ref None in
  let r_sort_order = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attribute"; "SortOrder" ] (fun tag _ ->
      match tag with
      | "Attribute" ->
          r_attribute :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attribute"
                 (fun i _ -> snapshot_attribute_to_sort_by_of_xml i)
                 ())
      | "SortOrder" ->
          r_sort_order :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortOrder"
                 (fun i _ -> sort_by_order_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attribute = Smaws_Lib.Xml.Parse.required "Attribute" (( ! ) r_attribute) i;
     sort_order = ( ! ) r_sort_order;
   }
    : snapshot_sorting_entity)

let snapshot_sorting_entity_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotSortingEntity"
    (fun i _ -> snapshot_sorting_entity_of_xml i)
    ()

let describe_cluster_snapshots_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_snapshot_identifier = ref None in
  let r_snapshot_arn = ref None in
  let r_snapshot_type = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_owner_account = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  let r_cluster_exists = ref None in
  let r_sorting_entities = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "SnapshotIdentifier";
      "SnapshotArn";
      "SnapshotType";
      "StartTime";
      "EndTime";
      "MaxRecords";
      "Marker";
      "OwnerAccount";
      "TagKeys";
      "TagValues";
      "ClusterExists";
      "SortingEntities";
    ] (fun tag _ ->
      match tag with
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
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | "SnapshotType" ->
          r_snapshot_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotType" (fun i _ -> string__of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "OwnerAccount" ->
          r_owner_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerAccount" (fun i _ -> string__of_xml i) ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | "ClusterExists" ->
          r_cluster_exists :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterExists"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "SortingEntities" ->
          r_sorting_entities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SortingEntities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotSortingEntity"
                     (fun i _ -> snapshot_sorting_entity_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier = ( ! ) r_cluster_identifier;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     snapshot_arn = ( ! ) r_snapshot_arn;
     snapshot_type = ( ! ) r_snapshot_type;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     owner_account = ( ! ) r_owner_account;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
     cluster_exists = ( ! ) r_cluster_exists;
     sorting_entities = ( ! ) r_sorting_entities;
   }
    : describe_cluster_snapshots_message)

let describe_cluster_subnet_groups_message_of_xml i =
  let r_cluster_subnet_group_name = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterSubnetGroupName"; "MaxRecords"; "Marker"; "TagKeys"; "TagValues" ] (fun tag _ ->
      match tag with
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
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
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_subnet_group_name = ( ! ) r_cluster_subnet_group_name;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
   }
    : describe_cluster_subnet_groups_message)

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
  let r_maintenance_track_name = ref None in
  let r_database_version = ref None in
  let r_supported_operations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaintenanceTrackName"; "DatabaseVersion"; "SupportedOperations" ] (fun tag _ ->
      match tag with
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DatabaseVersion" ->
          r_database_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SupportedOperations" ->
          r_supported_operations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedOperations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SupportedOperation"
                     (fun i _ -> supported_operation_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     database_version = ( ! ) r_database_version;
     supported_operations = ( ! ) r_supported_operations;
   }
    : update_target)

let eligible_tracks_to_update_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "UpdateTarget" (fun i _ -> update_target_of_xml i) ()

let maintenance_track_of_xml i =
  let r_maintenance_track_name = ref None in
  let r_database_version = ref None in
  let r_update_targets = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaintenanceTrackName"; "DatabaseVersion"; "UpdateTargets" ] (fun tag _ ->
      match tag with
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DatabaseVersion" ->
          r_database_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "UpdateTargets" ->
          r_update_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateTargets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "UpdateTarget"
                     (fun i _ -> update_target_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     database_version = ( ! ) r_database_version;
     update_targets = ( ! ) r_update_targets;
   }
    : maintenance_track)

let track_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "MaintenanceTrack" (fun i _ -> maintenance_track_of_xml i) ()

let track_list_message_of_xml i =
  let r_maintenance_tracks = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaintenanceTracks"; "Marker" ] (fun tag _ ->
      match tag with
      | "MaintenanceTracks" ->
          r_maintenance_tracks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTracks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "MaintenanceTrack"
                     (fun i _ -> maintenance_track_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ maintenance_tracks = ( ! ) r_maintenance_tracks; marker = ( ! ) r_marker }
    : track_list_message)

let describe_cluster_tracks_message_of_xml i =
  let r_maintenance_track_name = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaintenanceTrackName"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
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
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_cluster_tracks_message)

let describe_cluster_versions_message_of_xml i =
  let r_cluster_version = ref None in
  let r_cluster_parameter_group_family = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterVersion"; "ClusterParameterGroupFamily"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterParameterGroupFamily" ->
          r_cluster_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroupFamily"
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
     cluster_version = ( ! ) r_cluster_version;
     cluster_parameter_group_family = ( ! ) r_cluster_parameter_group_family;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_cluster_versions_message)

let describe_clusters_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "MaxRecords"; "Marker"; "TagKeys"; "TagValues" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
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
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier = ( ! ) r_cluster_identifier;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
   }
    : describe_clusters_message)

let describe_custom_domain_associations_message_of_xml i =
  let r_custom_domain_name = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CustomDomainName"; "CustomDomainCertificateArn"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> custom_domain_certificate_arn_string_of_xml i)
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
     custom_domain_name = ( ! ) r_custom_domain_name;
     custom_domain_certificate_arn = ( ! ) r_custom_domain_certificate_arn;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_custom_domain_associations_message)

let describe_data_shares_result_of_xml i =
  let r_data_shares = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DataShares"; "Marker" ] (fun tag _ ->
      match tag with
      | "DataShares" ->
          r_data_shares :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShares"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> data_share_of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data_shares = ( ! ) r_data_shares; marker = ( ! ) r_marker } : describe_data_shares_result)

let describe_data_shares_message_of_xml i =
  let r_data_share_arn = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DataShareArn"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
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
     data_share_arn = ( ! ) r_data_share_arn;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_data_shares_message)

let describe_data_shares_for_consumer_result_of_xml i =
  let r_data_shares = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DataShares"; "Marker" ] (fun tag _ ->
      match tag with
      | "DataShares" ->
          r_data_shares :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShares"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> data_share_of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data_shares = ( ! ) r_data_shares; marker = ( ! ) r_marker }
    : describe_data_shares_for_consumer_result)

let describe_data_shares_for_consumer_message_of_xml i =
  let r_consumer_arn = ref None in
  let r_status = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConsumerArn"; "Status"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ConsumerArn" ->
          r_consumer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerArn" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> data_share_status_for_consumer_of_xml i)
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
     consumer_arn = ( ! ) r_consumer_arn;
     status = ( ! ) r_status;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_data_shares_for_consumer_message)

let describe_data_shares_for_producer_result_of_xml i =
  let r_data_shares = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DataShares"; "Marker" ] (fun tag _ ->
      match tag with
      | "DataShares" ->
          r_data_shares :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShares"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> data_share_of_xml i) ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data_shares = ( ! ) r_data_shares; marker = ( ! ) r_marker }
    : describe_data_shares_for_producer_result)

let describe_data_shares_for_producer_message_of_xml i =
  let r_producer_arn = ref None in
  let r_status = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ProducerArn"; "Status"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ProducerArn" ->
          r_producer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProducerArn" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> data_share_status_for_producer_of_xml i)
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
     producer_arn = ( ! ) r_producer_arn;
     status = ( ! ) r_status;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_data_shares_for_producer_message)

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
  let r_parameter_group_family = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ParameterGroupFamily"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ParameterGroupFamily" ->
          r_parameter_group_family :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupFamily"
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
     parameter_group_family =
       Smaws_Lib.Xml.Parse.required "ParameterGroupFamily" (( ! ) r_parameter_group_family) i;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_default_cluster_parameters_message)

let endpoint_accesses_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> endpoint_access_of_xml i) ()

let endpoint_access_list_of_xml i =
  let r_endpoint_access_list = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EndpointAccessList"; "Marker" ] (fun tag _ ->
      match tag with
      | "EndpointAccessList" ->
          r_endpoint_access_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointAccessList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> endpoint_access_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ endpoint_access_list = ( ! ) r_endpoint_access_list; marker = ( ! ) r_marker }
    : endpoint_access_list)

let describe_endpoint_access_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_resource_owner = ref None in
  let r_endpoint_name = ref None in
  let r_vpc_id = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "ResourceOwner"; "EndpointName"; "VpcId"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ResourceOwner" ->
          r_resource_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceOwner" (fun i _ -> string__of_xml i) ())
      | "EndpointName" ->
          r_endpoint_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointName" (fun i _ -> string__of_xml i) ())
      | "VpcId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VpcId" (fun i _ -> string__of_xml i) ())
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
     cluster_identifier = ( ! ) r_cluster_identifier;
     resource_owner = ( ! ) r_resource_owner;
     endpoint_name = ( ! ) r_endpoint_name;
     vpc_id = ( ! ) r_vpc_id;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_endpoint_access_message)

let endpoint_authorizations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> endpoint_authorization_of_xml i) ()

let endpoint_authorization_list_of_xml i =
  let r_endpoint_authorization_list = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EndpointAuthorizationList"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "EndpointAuthorizationList" ->
          r_endpoint_authorization_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointAuthorizationList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> endpoint_authorization_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ endpoint_authorization_list = ( ! ) r_endpoint_authorization_list; marker = ( ! ) r_marker }
    : endpoint_authorization_list)

let describe_endpoint_authorization_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_account = ref None in
  let r_grantee = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "Account"; "Grantee"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> string__of_xml i) ())
      | "Grantee" ->
          r_grantee :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Grantee"
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
     cluster_identifier = ( ! ) r_cluster_identifier;
     account = ( ! ) r_account;
     grantee = ( ! ) r_grantee;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_endpoint_authorization_message)

let event_info_map_of_xml i =
  let r_event_id = ref None in
  let r_event_categories = ref None in
  let r_event_description = ref None in
  let r_severity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EventId"; "EventCategories"; "EventDescription"; "Severity" ] (fun tag _ ->
      match tag with
      | "EventId" ->
          r_event_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EventId" (fun i _ -> string__of_xml i) ())
      | "EventCategories" ->
          r_event_categories :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventCategories"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventCategory"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "EventDescription" ->
          r_event_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Severity" ->
          r_severity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Severity" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     event_id = ( ! ) r_event_id;
     event_categories = ( ! ) r_event_categories;
     event_description = ( ! ) r_event_description;
     severity = ( ! ) r_severity;
   }
    : event_info_map)

let event_info_map_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "EventInfoMap" (fun i _ -> event_info_map_of_xml i) ()

let event_categories_map_of_xml i =
  let r_source_type = ref None in
  let r_events = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SourceType"; "Events" ] (fun tag _ ->
      match tag with
      | "SourceType" ->
          r_source_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType" (fun i _ -> string__of_xml i) ())
      | "Events" ->
          r_events :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Events"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "EventInfoMap"
                     (fun i _ -> event_info_map_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ source_type = ( ! ) r_source_type; events = ( ! ) r_events } : event_categories_map)

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
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SubscriptionName"; "MaxRecords"; "Marker"; "TagKeys"; "TagValues" ] (fun tag _ ->
      match tag with
      | "SubscriptionName" ->
          r_subscription_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionName"
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
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subscription_name = ( ! ) r_subscription_name;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
   }
    : describe_event_subscriptions_message)

let source_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "cluster" -> Cluster
   | "cluster-parameter-group" -> Cluster_parameter_group
   | "cluster-security-group" -> Cluster_security_group
   | "cluster-snapshot" -> Cluster_snapshot
   | "scheduled-action" -> Scheduled_action
   | _ -> failwith "unknown enum value"
    : source_type)

let event_of_xml i =
  let r_source_identifier = ref None in
  let r_source_type = ref None in
  let r_message = ref None in
  let r_event_categories = ref None in
  let r_severity = ref None in
  let r_date = ref None in
  let r_event_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SourceIdentifier"; "SourceType"; "Message"; "EventCategories"; "Severity"; "Date"; "EventId";
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
      | "Severity" ->
          r_severity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Severity" (fun i _ -> string__of_xml i) ())
      | "Date" ->
          r_date :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Date" (fun i _ -> t_stamp_of_xml i) ())
      | "EventId" ->
          r_event_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EventId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_identifier = ( ! ) r_source_identifier;
     source_type = ( ! ) r_source_type;
     message = ( ! ) r_message;
     event_categories = ( ! ) r_event_categories;
     severity = ( ! ) r_severity;
     date = ( ! ) r_date;
     event_id = ( ! ) r_event_id;
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

let hsm_client_certificate_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "HsmClientCertificate"
    (fun i _ -> hsm_client_certificate_of_xml i)
    ()

let hsm_client_certificate_message_of_xml i =
  let r_marker = ref None in
  let r_hsm_client_certificates = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "HsmClientCertificates" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "HsmClientCertificates" ->
          r_hsm_client_certificates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "HsmClientCertificate"
                     (fun i _ -> hsm_client_certificate_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; hsm_client_certificates = ( ! ) r_hsm_client_certificates }
    : hsm_client_certificate_message)

let describe_hsm_client_certificates_message_of_xml i =
  let r_hsm_client_certificate_identifier = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "HsmClientCertificateIdentifier"; "MaxRecords"; "Marker"; "TagKeys"; "TagValues" ]
    (fun tag _ ->
      match tag with
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
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
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
   }
    : describe_hsm_client_certificates_message)

let hsm_configuration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "HsmConfiguration" (fun i _ -> hsm_configuration_of_xml i) ()

let hsm_configuration_message_of_xml i =
  let r_marker = ref None in
  let r_hsm_configurations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "HsmConfigurations" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "HsmConfigurations" ->
          r_hsm_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "HsmConfiguration"
                     (fun i _ -> hsm_configuration_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; hsm_configurations = ( ! ) r_hsm_configurations }
    : hsm_configuration_message)

let describe_hsm_configurations_message_of_xml i =
  let r_hsm_configuration_identifier = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "HsmConfigurationIdentifier"; "MaxRecords"; "Marker"; "TagKeys"; "TagValues" ] (fun tag _ ->
      match tag with
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
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
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
   }
    : describe_hsm_configurations_message)

let inbound_integration_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let inbound_integration_of_xml i =
  let r_integration_arn = ref None in
  let r_source_arn = ref None in
  let r_target_arn = ref None in
  let r_status = ref None in
  let r_errors = ref None in
  let r_create_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "IntegrationArn"; "SourceArn"; "TargetArn"; "Status"; "Errors"; "CreateTime" ] (fun tag _ ->
      match tag with
      | "IntegrationArn" ->
          r_integration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationArn"
                 (fun i _ -> inbound_integration_arn_of_xml i)
                 ())
      | "SourceArn" ->
          r_source_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "SourceArn" (fun i _ -> string__of_xml i) ())
      | "TargetArn" ->
          r_target_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetArn" (fun i _ -> target_arn_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> zero_etl_integration_status_of_xml i)
                 ())
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "IntegrationError"
                     (fun i _ -> integration_error_of_xml i)
                     ())
                 ())
      | "CreateTime" ->
          r_create_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CreateTime" (fun i _ -> t_stamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     integration_arn = ( ! ) r_integration_arn;
     source_arn = ( ! ) r_source_arn;
     target_arn = ( ! ) r_target_arn;
     status = ( ! ) r_status;
     errors = ( ! ) r_errors;
     create_time = ( ! ) r_create_time;
   }
    : inbound_integration)

let inbound_integration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "InboundIntegration"
    (fun i _ -> inbound_integration_of_xml i)
    ()

let inbound_integrations_message_of_xml i =
  let r_marker = ref None in
  let r_inbound_integrations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "InboundIntegrations" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "InboundIntegrations" ->
          r_inbound_integrations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InboundIntegrations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "InboundIntegration"
                     (fun i _ -> inbound_integration_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; inbound_integrations = ( ! ) r_inbound_integrations }
    : inbound_integrations_message)

let describe_inbound_integrations_message_of_xml i =
  let r_integration_arn = ref None in
  let r_target_arn = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "IntegrationArn"; "TargetArn"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "IntegrationArn" ->
          r_integration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationArn"
                 (fun i _ -> inbound_integration_arn_of_xml i)
                 ())
      | "TargetArn" ->
          r_target_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetArn" (fun i _ -> target_arn_of_xml i) ())
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
     integration_arn = ( ! ) r_integration_arn;
     target_arn = ( ! ) r_target_arn;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_inbound_integrations_message)

let integration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Integration" (fun i _ -> integration_of_xml i) ()

let integrations_message_of_xml i =
  let r_marker = ref None in
  let r_integrations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "Integrations" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "Integrations" ->
          r_integrations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Integrations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Integration"
                     (fun i _ -> integration_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; integrations = ( ! ) r_integrations } : integrations_message)

let describe_integrations_filter_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Value" (fun i _ -> string__of_xml i) ()

let describe_integrations_filter_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "integration-arn" -> INTEGRATION_ARN
   | "source-arn" -> SOURCE_ARN
   | "source-types" -> SOURCE_TYPES
   | "status" -> STATUS
   | _ -> failwith "unknown enum value"
    : describe_integrations_filter_name)

let describe_integrations_filter_of_xml i =
  let r_name = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Values" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> describe_integrations_filter_name_of_xml i)
                 ())
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
    : describe_integrations_filter)

let describe_integrations_filter_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "DescribeIntegrationsFilter"
    (fun i _ -> describe_integrations_filter_of_xml i)
    ()

let describe_integrations_message_of_xml i =
  let r_integration_arn = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "IntegrationArn"; "MaxRecords"; "Marker"; "Filters" ] (fun tag _ ->
      match tag with
      | "IntegrationArn" ->
          r_integration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationArn"
                 (fun i _ -> integration_arn_of_xml i)
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DescribeIntegrationsFilter"
                     (fun i _ -> describe_integrations_filter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     integration_arn = ( ! ) r_integration_arn;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     filters = ( ! ) r_filters;
   }
    : describe_integrations_message)

let log_type_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let log_destination_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "s3" -> S3 | "cloudwatch" -> CLOUDWATCH | _ -> failwith "unknown enum value"
    : log_destination_type)

let s3_key_prefix_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let logging_status_of_xml i =
  let r_logging_enabled = ref None in
  let r_bucket_name = ref None in
  let r_s3_key_prefix = ref None in
  let r_last_successful_delivery_time = ref None in
  let r_last_failure_time = ref None in
  let r_last_failure_message = ref None in
  let r_log_destination_type = ref None in
  let r_log_exports = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LoggingEnabled";
      "BucketName";
      "S3KeyPrefix";
      "LastSuccessfulDeliveryTime";
      "LastFailureTime";
      "LastFailureMessage";
      "LogDestinationType";
      "LogExports";
    ] (fun tag _ ->
      match tag with
      | "LoggingEnabled" ->
          r_logging_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoggingEnabled"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "BucketName" ->
          r_bucket_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "BucketName" (fun i _ -> string__of_xml i) ())
      | "S3KeyPrefix" ->
          r_s3_key_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "S3KeyPrefix"
                 (fun i _ -> s3_key_prefix_value_of_xml i)
                 ())
      | "LastSuccessfulDeliveryTime" ->
          r_last_successful_delivery_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastSuccessfulDeliveryTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "LastFailureTime" ->
          r_last_failure_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastFailureTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "LastFailureMessage" ->
          r_last_failure_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastFailureMessage"
                 (fun i _ -> string__of_xml i)
                 ())
      | "LogDestinationType" ->
          r_log_destination_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDestinationType"
                 (fun i _ -> log_destination_type_of_xml i)
                 ())
      | "LogExports" ->
          r_log_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     logging_enabled = ( ! ) r_logging_enabled;
     bucket_name = ( ! ) r_bucket_name;
     s3_key_prefix = ( ! ) r_s3_key_prefix;
     last_successful_delivery_time = ( ! ) r_last_successful_delivery_time;
     last_failure_time = ( ! ) r_last_failure_time;
     last_failure_message = ( ! ) r_last_failure_message;
     log_destination_type = ( ! ) r_log_destination_type;
     log_exports = ( ! ) r_log_exports;
   }
    : logging_status)

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

let mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "standard" -> STANDARD
   | "high-performance" -> HIGH_PERFORMANCE
   | _ -> failwith "unknown enum value"
    : mode)

let node_configuration_option_of_xml i =
  let r_node_type = ref None in
  let r_number_of_nodes = ref None in
  let r_estimated_disk_utilization_percent = ref None in
  let r_mode = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NodeType"; "NumberOfNodes"; "EstimatedDiskUtilizationPercent"; "Mode" ] (fun tag _ ->
      match tag with
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes" (fun i _ -> integer_of_xml i) ())
      | "EstimatedDiskUtilizationPercent" ->
          r_estimated_disk_utilization_percent :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EstimatedDiskUtilizationPercent"
                 (fun i _ -> double_optional_of_xml i)
                 ())
      | "Mode" ->
          r_mode := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Mode" (fun i _ -> mode_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     node_type = ( ! ) r_node_type;
     number_of_nodes = ( ! ) r_number_of_nodes;
     estimated_disk_utilization_percent = ( ! ) r_estimated_disk_utilization_percent;
     mode = ( ! ) r_mode;
   }
    : node_configuration_option)

let node_configuration_option_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeConfigurationOption"
    (fun i _ -> node_configuration_option_of_xml i)
    ()

let node_configuration_options_message_of_xml i =
  let r_node_configuration_option_list = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NodeConfigurationOptionList"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "NodeConfigurationOptionList" ->
          r_node_configuration_option_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeConfigurationOptionList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeConfigurationOption"
                     (fun i _ -> node_configuration_option_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     node_configuration_option_list = ( ! ) r_node_configuration_option_list;
     marker = ( ! ) r_marker;
   }
    : node_configuration_options_message)

let operator_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "eq" -> EQ
   | "lt" -> LT
   | "gt" -> GT
   | "le" -> LE
   | "ge" -> GE
   | "in" -> IN
   | "between" -> BETWEEN
   | _ -> failwith "unknown enum value"
    : operator_type)

let node_configuration_options_filter_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "NodeType" -> NODE_TYPE
   | "NumberOfNodes" -> NUM_NODES
   | "EstimatedDiskUtilizationPercent" -> ESTIMATED_DISK_UTILIZATION_PERCENT
   | "Mode" -> MODE
   | _ -> failwith "unknown enum value"
    : node_configuration_options_filter_name)

let node_configuration_options_filter_of_xml i =
  let r_name = ref None in
  let r_operator = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Operator"; "Value" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> node_configuration_options_filter_name_of_xml i)
                 ())
      | "Operator" ->
          r_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Operator"
                 (fun i _ -> operator_type_of_xml i)
                 ())
      | "Value" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "item" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; operator = ( ! ) r_operator; values = ( ! ) r_values }
    : node_configuration_options_filter)

let node_configuration_options_filter_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "NodeConfigurationOptionsFilter"
    (fun i _ -> node_configuration_options_filter_of_xml i)
    ()

let describe_node_configuration_options_message_of_xml i =
  let r_action_type = ref None in
  let r_cluster_identifier = ref None in
  let r_snapshot_identifier = ref None in
  let r_snapshot_arn = ref None in
  let r_owner_account = ref None in
  let r_filters = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ActionType";
      "ClusterIdentifier";
      "SnapshotIdentifier";
      "SnapshotArn";
      "OwnerAccount";
      "Filter";
      "Marker";
      "MaxRecords";
    ] (fun tag _ ->
      match tag with
      | "ActionType" ->
          r_action_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionType"
                 (fun i _ -> action_type_of_xml i)
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
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | "OwnerAccount" ->
          r_owner_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerAccount" (fun i _ -> string__of_xml i) ())
      | "Filter" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filter"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "NodeConfigurationOptionsFilter"
                     (fun i _ -> node_configuration_options_filter_of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     action_type = Smaws_Lib.Xml.Parse.required "ActionType" (( ! ) r_action_type) i;
     cluster_identifier = ( ! ) r_cluster_identifier;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     snapshot_arn = ( ! ) r_snapshot_arn;
     owner_account = ( ! ) r_owner_account;
     filters = ( ! ) r_filters;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
   }
    : describe_node_configuration_options_message)

let orderable_cluster_option_of_xml i =
  let r_cluster_version = ref None in
  let r_cluster_type = ref None in
  let r_node_type = ref None in
  let r_availability_zones = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterVersion"; "ClusterType"; "NodeType"; "AvailabilityZones" ] (fun tag _ ->
      match tag with
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
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "AvailabilityZone"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_version = ( ! ) r_cluster_version;
     cluster_type = ( ! ) r_cluster_type;
     node_type = ( ! ) r_node_type;
     availability_zones = ( ! ) r_availability_zones;
   }
    : orderable_cluster_option)

let orderable_cluster_options_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "OrderableClusterOption"
    (fun i _ -> orderable_cluster_option_of_xml i)
    ()

let orderable_cluster_options_message_of_xml i =
  let r_orderable_cluster_options = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OrderableClusterOptions"; "Marker" ] (fun tag _ ->
      match tag with
      | "OrderableClusterOptions" ->
          r_orderable_cluster_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrderableClusterOptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "OrderableClusterOption"
                     (fun i _ -> orderable_cluster_option_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ orderable_cluster_options = ( ! ) r_orderable_cluster_options; marker = ( ! ) r_marker }
    : orderable_cluster_options_message)

let describe_orderable_cluster_options_message_of_xml i =
  let r_cluster_version = ref None in
  let r_node_type = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterVersion"; "NodeType"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
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
     cluster_version = ( ! ) r_cluster_version;
     node_type = ( ! ) r_node_type;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_orderable_cluster_options_message)

let partner_integration_status_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let partner_integration_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Active" -> Active
   | "Inactive" -> Inactive
   | "RuntimeFailure" -> RuntimeFailure
   | "ConnectionFailure" -> ConnectionFailure
   | _ -> failwith "unknown enum value"
    : partner_integration_status)

let partner_integration_info_of_xml i =
  let r_database_name = ref None in
  let r_partner_name = ref None in
  let r_status = ref None in
  let r_status_message = ref None in
  let r_created_at = ref None in
  let r_updated_at = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DatabaseName"; "PartnerName"; "Status"; "StatusMessage"; "CreatedAt"; "UpdatedAt" ]
    (fun tag _ ->
      match tag with
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName"
                 (fun i _ -> partner_integration_database_name_of_xml i)
                 ())
      | "PartnerName" ->
          r_partner_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PartnerName"
                 (fun i _ -> partner_integration_partner_name_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> partner_integration_status_of_xml i)
                 ())
      | "StatusMessage" ->
          r_status_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusMessage"
                 (fun i _ -> partner_integration_status_message_of_xml i)
                 ())
      | "CreatedAt" ->
          r_created_at :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedAt" (fun i _ -> t_stamp_of_xml i) ())
      | "UpdatedAt" ->
          r_updated_at :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UpdatedAt" (fun i _ -> t_stamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     database_name = ( ! ) r_database_name;
     partner_name = ( ! ) r_partner_name;
     status = ( ! ) r_status;
     status_message = ( ! ) r_status_message;
     created_at = ( ! ) r_created_at;
     updated_at = ( ! ) r_updated_at;
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
  let r_account_id = ref None in
  let r_cluster_identifier = ref None in
  let r_database_name = ref None in
  let r_partner_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AccountId"; "ClusterIdentifier"; "DatabaseName"; "PartnerName" ] (fun tag _ ->
      match tag with
      | "AccountId" ->
          r_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId"
                 (fun i _ -> partner_integration_account_id_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> partner_integration_cluster_identifier_of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName"
                 (fun i _ -> partner_integration_database_name_of_xml i)
                 ())
      | "PartnerName" ->
          r_partner_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PartnerName"
                 (fun i _ -> partner_integration_partner_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     account_id = Smaws_Lib.Xml.Parse.required "AccountId" (( ! ) r_account_id) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     database_name = ( ! ) r_database_name;
     partner_name = ( ! ) r_partner_name;
   }
    : describe_partners_input_message)

let redshift_idc_application_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> redshift_idc_application_of_xml i) ()

let describe_redshift_idc_applications_result_of_xml i =
  let r_redshift_idc_applications = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RedshiftIdcApplications"; "Marker" ] (fun tag _ ->
      match tag with
      | "RedshiftIdcApplications" ->
          r_redshift_idc_applications :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplications"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> redshift_idc_application_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ redshift_idc_applications = ( ! ) r_redshift_idc_applications; marker = ( ! ) r_marker }
    : describe_redshift_idc_applications_result)

let describe_redshift_idc_applications_message_of_xml i =
  let r_redshift_idc_application_arn = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "RedshiftIdcApplicationArn"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "RedshiftIdcApplicationArn" ->
          r_redshift_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationArn"
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
     redshift_idc_application_arn = ( ! ) r_redshift_idc_application_arn;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_redshift_idc_applications_message)

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

let reserved_node_exchange_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeExchangeStatus"
    (fun i _ -> reserved_node_exchange_status_of_xml i)
    ()

let describe_reserved_node_exchange_status_output_message_of_xml i =
  let r_reserved_node_exchange_status_details = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedNodeExchangeStatusDetails"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ReservedNodeExchangeStatusDetails" ->
          r_reserved_node_exchange_status_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeExchangeStatusDetails"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeExchangeStatus"
                     (fun i _ -> reserved_node_exchange_status_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_node_exchange_status_details = ( ! ) r_reserved_node_exchange_status_details;
     marker = ( ! ) r_marker;
   }
    : describe_reserved_node_exchange_status_output_message)

let describe_reserved_node_exchange_status_input_message_of_xml i =
  let r_reserved_node_id = ref None in
  let r_reserved_node_exchange_request_id = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReservedNodeId"; "ReservedNodeExchangeRequestId"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedNodeExchangeRequestId" ->
          r_reserved_node_exchange_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeExchangeRequestId"
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
     reserved_node_id = ( ! ) r_reserved_node_id;
     reserved_node_exchange_request_id = ( ! ) r_reserved_node_exchange_request_id;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_reserved_node_exchange_status_input_message)

let reserved_node_offering_of_xml i =
  let r_reserved_node_offering_id = ref None in
  let r_node_type = ref None in
  let r_duration = ref None in
  let r_fixed_price = ref None in
  let r_usage_price = ref None in
  let r_currency_code = ref None in
  let r_offering_type = ref None in
  let r_recurring_charges = ref None in
  let r_reserved_node_offering_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ReservedNodeOfferingId";
      "NodeType";
      "Duration";
      "FixedPrice";
      "UsagePrice";
      "CurrencyCode";
      "OfferingType";
      "RecurringCharges";
      "ReservedNodeOfferingType";
    ] (fun tag _ ->
      match tag with
      | "ReservedNodeOfferingId" ->
          r_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "Duration" ->
          r_duration :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Duration" (fun i _ -> integer_of_xml i) ())
      | "FixedPrice" ->
          r_fixed_price :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "FixedPrice" (fun i _ -> double_of_xml i) ())
      | "UsagePrice" ->
          r_usage_price :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "UsagePrice" (fun i _ -> double_of_xml i) ())
      | "CurrencyCode" ->
          r_currency_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrencyCode" (fun i _ -> string__of_xml i) ())
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
      | "ReservedNodeOfferingType" ->
          r_reserved_node_offering_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingType"
                 (fun i _ -> reserved_node_offering_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_node_offering_id = ( ! ) r_reserved_node_offering_id;
     node_type = ( ! ) r_node_type;
     duration = ( ! ) r_duration;
     fixed_price = ( ! ) r_fixed_price;
     usage_price = ( ! ) r_usage_price;
     currency_code = ( ! ) r_currency_code;
     offering_type = ( ! ) r_offering_type;
     recurring_charges = ( ! ) r_recurring_charges;
     reserved_node_offering_type = ( ! ) r_reserved_node_offering_type;
   }
    : reserved_node_offering)

let reserved_node_offering_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeOffering"
    (fun i _ -> reserved_node_offering_of_xml i)
    ()

let reserved_node_offerings_message_of_xml i =
  let r_marker = ref None in
  let r_reserved_node_offerings = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ReservedNodeOfferings" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ReservedNodeOfferings" ->
          r_reserved_node_offerings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeOffering"
                     (fun i _ -> reserved_node_offering_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; reserved_node_offerings = ( ! ) r_reserved_node_offerings }
    : reserved_node_offerings_message)

let describe_reserved_node_offerings_message_of_xml i =
  let r_reserved_node_offering_id = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedNodeOfferingId"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ReservedNodeOfferingId" ->
          r_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingId"
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
     reserved_node_offering_id = ( ! ) r_reserved_node_offering_id;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_reserved_node_offerings_message)

let reserved_node_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNode" (fun i _ -> reserved_node_of_xml i) ()

let reserved_nodes_message_of_xml i =
  let r_marker = ref None in
  let r_reserved_nodes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ReservedNodes" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ReservedNodes" ->
          r_reserved_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNode"
                     (fun i _ -> reserved_node_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; reserved_nodes = ( ! ) r_reserved_nodes } : reserved_nodes_message)

let describe_reserved_nodes_message_of_xml i =
  let r_reserved_node_id = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedNodeId"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
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
     reserved_node_id = ( ! ) r_reserved_node_id;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_reserved_nodes_message)

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

let scheduled_action_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledAction" (fun i _ -> scheduled_action_of_xml i) ()

let scheduled_actions_message_of_xml i =
  let r_marker = ref None in
  let r_scheduled_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ScheduledActions" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ScheduledActions" ->
          r_scheduled_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledAction"
                     (fun i _ -> scheduled_action_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; scheduled_actions = ( ! ) r_scheduled_actions }
    : scheduled_actions_message)

let scheduled_action_filter_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "cluster-identifier" -> CLUSTER_IDENTIFIER
   | "iam-role" -> IAM_ROLE
   | _ -> failwith "unknown enum value"
    : scheduled_action_filter_name)

let scheduled_action_filter_of_xml i =
  let r_name = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Values" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> scheduled_action_filter_name_of_xml i)
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "item" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
     values = Smaws_Lib.Xml.Parse.required "Values" (( ! ) r_values) i;
   }
    : scheduled_action_filter)

let scheduled_action_filter_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledActionFilter"
    (fun i _ -> scheduled_action_filter_of_xml i)
    ()

let scheduled_action_type_values_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ResizeCluster" -> RESIZE_CLUSTER
   | "PauseCluster" -> PAUSE_CLUSTER
   | "ResumeCluster" -> RESUME_CLUSTER
   | _ -> failwith "unknown enum value"
    : scheduled_action_type_values)

let describe_scheduled_actions_message_of_xml i =
  let r_scheduled_action_name = ref None in
  let r_target_action_type = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_active = ref None in
  let r_filters = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ScheduledActionName";
      "TargetActionType";
      "StartTime";
      "EndTime";
      "Active";
      "Filters";
      "Marker";
      "MaxRecords";
    ] (fun tag _ ->
      match tag with
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetActionType" ->
          r_target_action_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetActionType"
                 (fun i _ -> scheduled_action_type_values_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | "Active" ->
          r_active :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Active"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ScheduledActionFilter"
                     (fun i _ -> scheduled_action_filter_of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheduled_action_name = ( ! ) r_scheduled_action_name;
     target_action_type = ( ! ) r_target_action_type;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     active = ( ! ) r_active;
     filters = ( ! ) r_filters;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
   }
    : describe_scheduled_actions_message)

let snapshot_copy_grant_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotCopyGrant"
    (fun i _ -> snapshot_copy_grant_of_xml i)
    ()

let snapshot_copy_grant_message_of_xml i =
  let r_marker = ref None in
  let r_snapshot_copy_grants = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "SnapshotCopyGrants" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "SnapshotCopyGrants" ->
          r_snapshot_copy_grants :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrants"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotCopyGrant"
                     (fun i _ -> snapshot_copy_grant_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; snapshot_copy_grants = ( ! ) r_snapshot_copy_grants }
    : snapshot_copy_grant_message)

let describe_snapshot_copy_grants_message_of_xml i =
  let r_snapshot_copy_grant_name = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SnapshotCopyGrantName"; "MaxRecords"; "Marker"; "TagKeys"; "TagValues" ] (fun tag _ ->
      match tag with
      | "SnapshotCopyGrantName" ->
          r_snapshot_copy_grant_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotCopyGrantName"
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
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_copy_grant_name = ( ! ) r_snapshot_copy_grant_name;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
   }
    : describe_snapshot_copy_grants_message)

let snapshot_schedule_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotSchedule" (fun i _ -> snapshot_schedule_of_xml i) ()

let describe_snapshot_schedules_output_message_of_xml i =
  let r_snapshot_schedules = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SnapshotSchedules"; "Marker" ] (fun tag _ ->
      match tag with
      | "SnapshotSchedules" ->
          r_snapshot_schedules :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotSchedules"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "SnapshotSchedule"
                     (fun i _ -> snapshot_schedule_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ snapshot_schedules = ( ! ) r_snapshot_schedules; marker = ( ! ) r_marker }
    : describe_snapshot_schedules_output_message)

let describe_snapshot_schedules_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_schedule_identifier = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  let r_marker = ref None in
  let r_max_records = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "ScheduleIdentifier"; "TagKeys"; "TagValues"; "Marker"; "MaxRecords" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ScheduleIdentifier" ->
          r_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
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
     cluster_identifier = ( ! ) r_cluster_identifier;
     schedule_identifier = ( ! ) r_schedule_identifier;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
     marker = ( ! ) r_marker;
     max_records = ( ! ) r_max_records;
   }
    : describe_snapshot_schedules_message)

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

let table_restore_status_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PENDING" -> PENDING
   | "IN_PROGRESS" -> IN_PROGRESS
   | "SUCCEEDED" -> SUCCEEDED
   | "FAILED" -> FAILED
   | "CANCELED" -> CANCELED
   | _ -> failwith "unknown enum value"
    : table_restore_status_type)

let table_restore_status_of_xml i =
  let r_table_restore_request_id = ref None in
  let r_status = ref None in
  let r_message = ref None in
  let r_request_time = ref None in
  let r_progress_in_mega_bytes = ref None in
  let r_total_data_in_mega_bytes = ref None in
  let r_cluster_identifier = ref None in
  let r_snapshot_identifier = ref None in
  let r_source_database_name = ref None in
  let r_source_schema_name = ref None in
  let r_source_table_name = ref None in
  let r_target_database_name = ref None in
  let r_target_schema_name = ref None in
  let r_new_table_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TableRestoreRequestId";
      "Status";
      "Message";
      "RequestTime";
      "ProgressInMegaBytes";
      "TotalDataInMegaBytes";
      "ClusterIdentifier";
      "SnapshotIdentifier";
      "SourceDatabaseName";
      "SourceSchemaName";
      "SourceTableName";
      "TargetDatabaseName";
      "TargetSchemaName";
      "NewTableName";
    ] (fun tag _ ->
      match tag with
      | "TableRestoreRequestId" ->
          r_table_restore_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TableRestoreRequestId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> table_restore_status_type_of_xml i)
                 ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | "RequestTime" ->
          r_request_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestTime" (fun i _ -> t_stamp_of_xml i) ())
      | "ProgressInMegaBytes" ->
          r_progress_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressInMegaBytes"
                 (fun i _ -> long_optional_of_xml i)
                 ())
      | "TotalDataInMegaBytes" ->
          r_total_data_in_mega_bytes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalDataInMegaBytes"
                 (fun i _ -> long_optional_of_xml i)
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
      | "SourceDatabaseName" ->
          r_source_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDatabaseName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceSchemaName" ->
          r_source_schema_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceSchemaName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceTableName" ->
          r_source_table_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceTableName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetDatabaseName" ->
          r_target_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDatabaseName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetSchemaName" ->
          r_target_schema_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetSchemaName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NewTableName" ->
          r_new_table_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewTableName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     table_restore_request_id = ( ! ) r_table_restore_request_id;
     status = ( ! ) r_status;
     message = ( ! ) r_message;
     request_time = ( ! ) r_request_time;
     progress_in_mega_bytes = ( ! ) r_progress_in_mega_bytes;
     total_data_in_mega_bytes = ( ! ) r_total_data_in_mega_bytes;
     cluster_identifier = ( ! ) r_cluster_identifier;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     source_database_name = ( ! ) r_source_database_name;
     source_schema_name = ( ! ) r_source_schema_name;
     source_table_name = ( ! ) r_source_table_name;
     target_database_name = ( ! ) r_target_database_name;
     target_schema_name = ( ! ) r_target_schema_name;
     new_table_name = ( ! ) r_new_table_name;
   }
    : table_restore_status)

let table_restore_status_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "TableRestoreStatus"
    (fun i _ -> table_restore_status_of_xml i)
    ()

let table_restore_status_message_of_xml i =
  let r_table_restore_status_details = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TableRestoreStatusDetails"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "TableRestoreStatusDetails" ->
          r_table_restore_status_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TableRestoreStatusDetails"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TableRestoreStatus"
                     (fun i _ -> table_restore_status_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ table_restore_status_details = ( ! ) r_table_restore_status_details; marker = ( ! ) r_marker }
    : table_restore_status_message)

let describe_table_restore_status_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_table_restore_request_id = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "TableRestoreRequestId"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TableRestoreRequestId" ->
          r_table_restore_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TableRestoreRequestId"
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
     cluster_identifier = ( ! ) r_cluster_identifier;
     table_restore_request_id = ( ! ) r_table_restore_request_id;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : describe_table_restore_status_message)

let tagged_resource_of_xml i =
  let r_tag = ref None in
  let r_resource_name = ref None in
  let r_resource_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tag"; "ResourceName"; "ResourceType" ]
    (fun tag _ ->
      match tag with
      | "Tag" ->
          r_tag := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Tag" (fun i _ -> tag_of_xml i) ())
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName" (fun i _ -> string__of_xml i) ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag = ( ! ) r_tag;
     resource_name = ( ! ) r_resource_name;
     resource_type = ( ! ) r_resource_type;
   }
    : tagged_resource)

let tagged_resource_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "TaggedResource" (fun i _ -> tagged_resource_of_xml i) ()

let tagged_resource_list_message_of_xml i =
  let r_tagged_resources = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TaggedResources"; "Marker" ] (fun tag _ ->
      match tag with
      | "TaggedResources" ->
          r_tagged_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TaggedResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TaggedResource"
                     (fun i _ -> tagged_resource_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tagged_resources = ( ! ) r_tagged_resources; marker = ( ! ) r_marker }
    : tagged_resource_list_message)

let describe_tags_message_of_xml i =
  let r_resource_name = ref None in
  let r_resource_type = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceName"; "ResourceType"; "MaxRecords"; "Marker"; "TagKeys"; "TagValues" ] (fun tag _ ->
      match tag with
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName" (fun i _ -> string__of_xml i) ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType" (fun i _ -> string__of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_name = ( ! ) r_resource_name;
     resource_type = ( ! ) r_resource_type;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
   }
    : describe_tags_message)

let usage_limits_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> usage_limit_of_xml i) ()

let usage_limit_list_of_xml i =
  let r_usage_limits = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UsageLimits"; "Marker" ] (fun tag _ ->
      match tag with
      | "UsageLimits" ->
          r_usage_limits :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsageLimits"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> usage_limit_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ usage_limits = ( ! ) r_usage_limits; marker = ( ! ) r_marker } : usage_limit_list)

let describe_usage_limits_message_of_xml i =
  let r_usage_limit_id = ref None in
  let r_cluster_identifier = ref None in
  let r_feature_type = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  let r_tag_keys = ref None in
  let r_tag_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "UsageLimitId";
      "ClusterIdentifier";
      "FeatureType";
      "MaxRecords";
      "Marker";
      "TagKeys";
      "TagValues";
    ] (fun tag _ ->
      match tag with
      | "UsageLimitId" ->
          r_usage_limit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsageLimitId" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "FeatureType" ->
          r_feature_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FeatureType"
                 (fun i _ -> usage_limit_feature_type_of_xml i)
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
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagKey" (fun i _ -> string__of_xml i) ())
                 ())
      | "TagValues" ->
          r_tag_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "TagValue" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     usage_limit_id = ( ! ) r_usage_limit_id;
     cluster_identifier = ( ! ) r_cluster_identifier;
     feature_type = ( ! ) r_feature_type;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
     tag_keys = ( ! ) r_tag_keys;
     tag_values = ( ! ) r_tag_values;
   }
    : describe_usage_limits_message)

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

let disassociate_data_share_consumer_message_of_xml i =
  let r_data_share_arn = ref None in
  let r_disassociate_entire_account = ref None in
  let r_consumer_arn = ref None in
  let r_consumer_region = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DataShareArn"; "DisassociateEntireAccount"; "ConsumerArn"; "ConsumerRegion" ] (fun tag _ ->
      match tag with
      | "DataShareArn" ->
          r_data_share_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataShareArn" (fun i _ -> string__of_xml i) ())
      | "DisassociateEntireAccount" ->
          r_disassociate_entire_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisassociateEntireAccount"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ConsumerArn" ->
          r_consumer_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerArn" (fun i _ -> string__of_xml i) ())
      | "ConsumerRegion" ->
          r_consumer_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     data_share_arn = Smaws_Lib.Xml.Parse.required "DataShareArn" (( ! ) r_data_share_arn) i;
     disassociate_entire_account = ( ! ) r_disassociate_entire_account;
     consumer_arn = ( ! ) r_consumer_arn;
     consumer_region = ( ! ) r_consumer_region;
   }
    : disassociate_data_share_consumer_message)

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

let enable_logging_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_bucket_name = ref None in
  let r_s3_key_prefix = ref None in
  let r_log_destination_type = ref None in
  let r_log_exports = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "BucketName"; "S3KeyPrefix"; "LogDestinationType"; "LogExports" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "BucketName" ->
          r_bucket_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "BucketName" (fun i _ -> string__of_xml i) ())
      | "S3KeyPrefix" ->
          r_s3_key_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "S3KeyPrefix"
                 (fun i _ -> s3_key_prefix_value_of_xml i)
                 ())
      | "LogDestinationType" ->
          r_log_destination_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDestinationType"
                 (fun i _ -> log_destination_type_of_xml i)
                 ())
      | "LogExports" ->
          r_log_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogExports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     bucket_name = ( ! ) r_bucket_name;
     s3_key_prefix = ( ! ) r_s3_key_prefix;
     log_destination_type = ( ! ) r_log_destination_type;
     log_exports = ( ! ) r_log_exports;
   }
    : enable_logging_message)

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
  let r_cluster_identifier = ref None in
  let r_destination_region = ref None in
  let r_retention_period = ref None in
  let r_snapshot_copy_grant_name = ref None in
  let r_manual_snapshot_retention_period = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "DestinationRegion";
      "RetentionPeriod";
      "SnapshotCopyGrantName";
      "ManualSnapshotRetentionPeriod";
    ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DestinationRegion" ->
          r_destination_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationRegion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RetentionPeriod" ->
          r_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
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
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     destination_region =
       Smaws_Lib.Xml.Parse.required "DestinationRegion" (( ! ) r_destination_region) i;
     retention_period = ( ! ) r_retention_period;
     snapshot_copy_grant_name = ( ! ) r_snapshot_copy_grant_name;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
   }
    : enable_snapshot_copy_message)

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

let get_cluster_credentials_message_of_xml i =
  let r_db_user = ref None in
  let r_db_name = ref None in
  let r_cluster_identifier = ref None in
  let r_duration_seconds = ref None in
  let r_auto_create = ref None in
  let r_db_groups = ref None in
  let r_custom_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DbUser";
      "DbName";
      "ClusterIdentifier";
      "DurationSeconds";
      "AutoCreate";
      "DbGroups";
      "CustomDomainName";
    ] (fun tag _ ->
      match tag with
      | "DbUser" ->
          r_db_user :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DbUser" (fun i _ -> string__of_xml i) ())
      | "DbName" ->
          r_db_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DbName" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "AutoCreate" ->
          r_auto_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoCreate"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DbGroups" ->
          r_db_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DbGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "DbGroup" (fun i _ -> string__of_xml i) ())
                 ())
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_user = Smaws_Lib.Xml.Parse.required "DbUser" (( ! ) r_db_user) i;
     db_name = ( ! ) r_db_name;
     cluster_identifier = ( ! ) r_cluster_identifier;
     duration_seconds = ( ! ) r_duration_seconds;
     auto_create = ( ! ) r_auto_create;
     db_groups = ( ! ) r_db_groups;
     custom_domain_name = ( ! ) r_custom_domain_name;
   }
    : get_cluster_credentials_message)

let get_cluster_credentials_with_iam_message_of_xml i =
  let r_db_name = ref None in
  let r_cluster_identifier = ref None in
  let r_duration_seconds = ref None in
  let r_custom_domain_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DbName"; "ClusterIdentifier"; "DurationSeconds"; "CustomDomainName" ] (fun tag _ ->
      match tag with
      | "DbName" ->
          r_db_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DbName" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DurationSeconds" ->
          r_duration_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DurationSeconds"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     db_name = ( ! ) r_db_name;
     cluster_identifier = ( ! ) r_cluster_identifier;
     duration_seconds = ( ! ) r_duration_seconds;
     custom_domain_name = ( ! ) r_custom_domain_name;
   }
    : get_cluster_credentials_with_iam_message)

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
  let r_token = ref None in
  let r_expiration_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Token"; "ExpirationTime" ] (fun tag _ ->
      match tag with
      | "Token" ->
          r_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Token"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | "ExpirationTime" ->
          r_expiration_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpirationTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ token = ( ! ) r_token; expiration_time = ( ! ) r_expiration_time }
    : get_identity_center_auth_token_response)

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

let reserved_node_configuration_option_of_xml i =
  let r_source_reserved_node = ref None in
  let r_target_reserved_node_count = ref None in
  let r_target_reserved_node_offering = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourceReservedNode"; "TargetReservedNodeCount"; "TargetReservedNodeOffering" ] (fun tag _ ->
      match tag with
      | "SourceReservedNode" ->
          r_source_reserved_node :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceReservedNode"
                 (fun i _ -> reserved_node_of_xml i)
                 ())
      | "TargetReservedNodeCount" ->
          r_target_reserved_node_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeCount"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "TargetReservedNodeOffering" ->
          r_target_reserved_node_offering :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeOffering"
                 (fun i _ -> reserved_node_offering_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_reserved_node = ( ! ) r_source_reserved_node;
     target_reserved_node_count = ( ! ) r_target_reserved_node_count;
     target_reserved_node_offering = ( ! ) r_target_reserved_node_offering;
   }
    : reserved_node_configuration_option)

let reserved_node_configuration_option_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeConfigurationOption"
    (fun i _ -> reserved_node_configuration_option_of_xml i)
    ()

let get_reserved_node_exchange_configuration_options_output_message_of_xml i =
  let r_marker = ref None in
  let r_reserved_node_configuration_option_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ReservedNodeConfigurationOptionList" ]
    (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ReservedNodeConfigurationOptionList" ->
          r_reserved_node_configuration_option_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeConfigurationOptionList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeConfigurationOption"
                     (fun i _ -> reserved_node_configuration_option_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     marker = ( ! ) r_marker;
     reserved_node_configuration_option_list = ( ! ) r_reserved_node_configuration_option_list;
   }
    : get_reserved_node_exchange_configuration_options_output_message)

let reserved_node_exchange_action_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "restore-cluster" -> RESTORE_CLUSTER
   | "resize-cluster" -> RESIZE_CLUSTER
   | _ -> failwith "unknown enum value"
    : reserved_node_exchange_action_type)

let get_reserved_node_exchange_configuration_options_input_message_of_xml i =
  let r_action_type = ref None in
  let r_cluster_identifier = ref None in
  let r_snapshot_identifier = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ActionType"; "ClusterIdentifier"; "SnapshotIdentifier"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ActionType" ->
          r_action_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionType"
                 (fun i _ -> reserved_node_exchange_action_type_of_xml i)
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
     action_type = Smaws_Lib.Xml.Parse.required "ActionType" (( ! ) r_action_type) i;
     cluster_identifier = ( ! ) r_cluster_identifier;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : get_reserved_node_exchange_configuration_options_input_message)

let get_reserved_node_exchange_offerings_output_message_of_xml i =
  let r_marker = ref None in
  let r_reserved_node_offerings = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Marker"; "ReservedNodeOfferings" ] (fun tag _ ->
      match tag with
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | "ReservedNodeOfferings" ->
          r_reserved_node_offerings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReservedNodeOffering"
                     (fun i _ -> reserved_node_offering_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ marker = ( ! ) r_marker; reserved_node_offerings = ( ! ) r_reserved_node_offerings }
    : get_reserved_node_exchange_offerings_output_message)

let get_reserved_node_exchange_offerings_input_message_of_xml i =
  let r_reserved_node_id = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedNodeId"; "MaxRecords"; "Marker" ]
    (fun tag _ ->
      match tag with
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
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
     reserved_node_id = Smaws_Lib.Xml.Parse.required "ReservedNodeId" (( ! ) r_reserved_node_id) i;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : get_reserved_node_exchange_offerings_input_message)

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

let resource_policy_of_xml i =
  let r_resource_arn = ref None in
  let r_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArn"; "Policy" ] (fun tag _ ->
      match tag with
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn" (fun i _ -> string__of_xml i) ())
      | "Policy" ->
          r_policy :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Policy" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_arn = ( ! ) r_resource_arn; policy = ( ! ) r_policy } : resource_policy)

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

let impact_ranking_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "HIGH" -> HIGH
   | "MEDIUM" -> MEDIUM
   | "LOW" -> LOW
   | _ -> failwith "unknown enum value"
    : impact_ranking_type)

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

let lakehouse_configuration_of_xml i =
  let r_cluster_identifier = ref None in
  let r_lakehouse_idc_application_arn = ref None in
  let r_lakehouse_registration_status = ref None in
  let r_catalog_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier"; "LakehouseIdcApplicationArn"; "LakehouseRegistrationStatus"; "CatalogArn";
    ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "LakehouseIdcApplicationArn" ->
          r_lakehouse_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "LakehouseRegistrationStatus" ->
          r_lakehouse_registration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseRegistrationStatus"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CatalogArn" ->
          r_catalog_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CatalogArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier = ( ! ) r_cluster_identifier;
     lakehouse_idc_application_arn = ( ! ) r_lakehouse_idc_application_arn;
     lakehouse_registration_status = ( ! ) r_lakehouse_registration_status;
     catalog_arn = ( ! ) r_catalog_arn;
   }
    : lakehouse_configuration)

let lakehouse_idc_registration_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Associate" -> ASSOCIATE
   | "Disassociate" -> DISASSOCIATE
   | _ -> failwith "unknown enum value"
    : lakehouse_idc_registration)

let lakehouse_registration_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Register" -> REGISTER
   | "Deregister" -> DEREGISTER
   | _ -> failwith "unknown enum value"
    : lakehouse_registration)

let reference_link_of_xml i =
  let r_text = ref None in
  let r_link = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Text"; "Link" ] (fun tag _ ->
      match tag with
      | "Text" ->
          r_text :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Text" (fun i _ -> string__of_xml i) ())
      | "Link" ->
          r_link :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Link" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ text = ( ! ) r_text; link = ( ! ) r_link } : reference_link)

let reference_link_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "ReferenceLink" (fun i _ -> reference_link_of_xml i) ()

let recommended_action_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "SQL" -> SQL | "CLI" -> CLI | _ -> failwith "unknown enum value"
    : recommended_action_type)

let recommended_action_of_xml i =
  let r_text = ref None in
  let r_database = ref None in
  let r_command = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Text"; "Database"; "Command"; "Type" ]
    (fun tag _ ->
      match tag with
      | "Text" ->
          r_text :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Text" (fun i _ -> string__of_xml i) ())
      | "Database" ->
          r_database :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Database" (fun i _ -> string__of_xml i) ())
      | "Command" ->
          r_command :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Command" (fun i _ -> string__of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> recommended_action_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     text = ( ! ) r_text;
     database = ( ! ) r_database;
     command = ( ! ) r_command;
     type_ = ( ! ) r_type_;
   }
    : recommended_action)

let recommended_action_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "RecommendedAction"
    (fun i _ -> recommended_action_of_xml i)
    ()

let recommendation_of_xml i =
  let r_id = ref None in
  let r_cluster_identifier = ref None in
  let r_namespace_arn = ref None in
  let r_created_at = ref None in
  let r_recommendation_type = ref None in
  let r_title = ref None in
  let r_description = ref None in
  let r_observation = ref None in
  let r_impact_ranking = ref None in
  let r_recommendation_text = ref None in
  let r_recommended_actions = ref None in
  let r_reference_links = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Id";
      "ClusterIdentifier";
      "NamespaceArn";
      "CreatedAt";
      "RecommendationType";
      "Title";
      "Description";
      "Observation";
      "ImpactRanking";
      "RecommendationText";
      "RecommendedActions";
      "ReferenceLinks";
    ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> string__of_xml i) ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NamespaceArn" ->
          r_namespace_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NamespaceArn" (fun i _ -> string__of_xml i) ())
      | "CreatedAt" ->
          r_created_at :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedAt" (fun i _ -> t_stamp_of_xml i) ())
      | "RecommendationType" ->
          r_recommendation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecommendationType"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Title" ->
          r_title :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Title" (fun i _ -> string__of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
      | "Observation" ->
          r_observation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Observation" (fun i _ -> string__of_xml i) ())
      | "ImpactRanking" ->
          r_impact_ranking :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImpactRanking"
                 (fun i _ -> impact_ranking_type_of_xml i)
                 ())
      | "RecommendationText" ->
          r_recommendation_text :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RecommendationText"
                 (fun i _ -> string__of_xml i)
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
      | "ReferenceLinks" ->
          r_reference_links :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReferenceLinks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "ReferenceLink"
                     (fun i _ -> reference_link_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     id = ( ! ) r_id;
     cluster_identifier = ( ! ) r_cluster_identifier;
     namespace_arn = ( ! ) r_namespace_arn;
     created_at = ( ! ) r_created_at;
     recommendation_type = ( ! ) r_recommendation_type;
     title = ( ! ) r_title;
     description = ( ! ) r_description;
     observation = ( ! ) r_observation;
     impact_ranking = ( ! ) r_impact_ranking;
     recommendation_text = ( ! ) r_recommendation_text;
     recommended_actions = ( ! ) r_recommended_actions;
     reference_links = ( ! ) r_reference_links;
   }
    : recommendation)

let recommendation_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "Recommendation" (fun i _ -> recommendation_of_xml i) ()

let list_recommendations_result_of_xml i =
  let r_recommendations = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Recommendations"; "Marker" ] (fun tag _ ->
      match tag with
      | "Recommendations" ->
          r_recommendations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Recommendations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "Recommendation"
                     (fun i _ -> recommendation_of_xml i)
                     ())
                 ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ recommendations = ( ! ) r_recommendations; marker = ( ! ) r_marker }
    : list_recommendations_result)

let list_recommendations_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_namespace_arn = ref None in
  let r_max_records = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "NamespaceArn"; "MaxRecords"; "Marker" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NamespaceArn" ->
          r_namespace_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NamespaceArn" (fun i _ -> string__of_xml i) ())
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
     cluster_identifier = ( ! ) r_cluster_identifier;
     namespace_arn = ( ! ) r_namespace_arn;
     max_records = ( ! ) r_max_records;
     marker = ( ! ) r_marker;
   }
    : list_recommendations_message)

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
  let r_cluster_identifier = ref None in
  let r_aqua_configuration_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier"; "AquaConfigurationStatus" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AquaConfigurationStatus" ->
          r_aqua_configuration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaConfigurationStatus"
                 (fun i _ -> aqua_configuration_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     aqua_configuration_status = ( ! ) r_aqua_configuration_status;
   }
    : modify_aqua_input_message)

let modify_authentication_profile_result_of_xml i =
  let r_authentication_profile_name = ref None in
  let r_authentication_profile_content = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AuthenticationProfileName"; "AuthenticationProfileContent" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | "AuthenticationProfileContent" ->
          r_authentication_profile_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileContent"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authentication_profile_name = ( ! ) r_authentication_profile_name;
     authentication_profile_content = ( ! ) r_authentication_profile_content;
   }
    : modify_authentication_profile_result)

let modify_authentication_profile_message_of_xml i =
  let r_authentication_profile_name = ref None in
  let r_authentication_profile_content = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AuthenticationProfileName"; "AuthenticationProfileContent" ] (fun tag _ ->
      match tag with
      | "AuthenticationProfileName" ->
          r_authentication_profile_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileName"
                 (fun i _ -> authentication_profile_name_string_of_xml i)
                 ())
      | "AuthenticationProfileContent" ->
          r_authentication_profile_content :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticationProfileContent"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authentication_profile_name =
       Smaws_Lib.Xml.Parse.required "AuthenticationProfileName"
         (( ! ) r_authentication_profile_name)
         i;
     authentication_profile_content =
       Smaws_Lib.Xml.Parse.required "AuthenticationProfileContent"
         (( ! ) r_authentication_profile_content)
         i;
   }
    : modify_authentication_profile_message)

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
  let r_cluster_identifier = ref None in
  let r_cluster_type = ref None in
  let r_node_type = ref None in
  let r_number_of_nodes = ref None in
  let r_cluster_security_groups = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_master_user_password = ref None in
  let r_cluster_parameter_group_name = ref None in
  let r_automated_snapshot_retention_period = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_cluster_version = ref None in
  let r_allow_version_upgrade = ref None in
  let r_hsm_client_certificate_identifier = ref None in
  let r_hsm_configuration_identifier = ref None in
  let r_new_cluster_identifier = ref None in
  let r_publicly_accessible = ref None in
  let r_elastic_ip = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_maintenance_track_name = ref None in
  let r_encrypted = ref None in
  let r_kms_key_id = ref None in
  let r_availability_zone_relocation = ref None in
  let r_availability_zone = ref None in
  let r_port = ref None in
  let r_manage_master_password = ref None in
  let r_master_password_secret_kms_key_id = ref None in
  let r_ip_address_type = ref None in
  let r_multi_a_z = ref None in
  let r_extra_compute_for_automatic_optimization = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "ClusterType";
      "NodeType";
      "NumberOfNodes";
      "ClusterSecurityGroups";
      "VpcSecurityGroupIds";
      "MasterUserPassword";
      "ClusterParameterGroupName";
      "AutomatedSnapshotRetentionPeriod";
      "ManualSnapshotRetentionPeriod";
      "PreferredMaintenanceWindow";
      "ClusterVersion";
      "AllowVersionUpgrade";
      "HsmClientCertificateIdentifier";
      "HsmConfigurationIdentifier";
      "NewClusterIdentifier";
      "PubliclyAccessible";
      "ElasticIp";
      "EnhancedVpcRouting";
      "MaintenanceTrackName";
      "Encrypted";
      "KmsKeyId";
      "AvailabilityZoneRelocation";
      "AvailabilityZone";
      "Port";
      "ManageMasterPassword";
      "MasterPasswordSecretKmsKeyId";
      "IpAddressType";
      "MultiAZ";
      "ExtraComputeForAutomaticOptimization";
    ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterType" ->
          r_cluster_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterType" (fun i _ -> string__of_xml i) ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
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
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "MasterUserPassword" ->
          r_master_user_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterUserPassword"
                 (fun i _ -> sensitive_string_of_xml i)
                 ())
      | "ClusterParameterGroupName" ->
          r_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutomatedSnapshotRetentionPeriod" ->
          r_automated_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomatedSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ClusterVersion" ->
          r_cluster_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterVersion"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AllowVersionUpgrade" ->
          r_allow_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NewClusterIdentifier" ->
          r_new_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ElasticIp" ->
          r_elastic_ip :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticIp" (fun i _ -> string__of_xml i) ())
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Encrypted" ->
          r_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "AvailabilityZoneRelocation" ->
          r_availability_zone_relocation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneRelocation"
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
      | "ManageMasterPassword" ->
          r_manage_master_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManageMasterPassword"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MasterPasswordSecretKmsKeyId" ->
          r_master_password_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType" (fun i _ -> string__of_xml i) ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ExtraComputeForAutomaticOptimization" ->
          r_extra_compute_for_automatic_optimization :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExtraComputeForAutomaticOptimization"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     cluster_type = ( ! ) r_cluster_type;
     node_type = ( ! ) r_node_type;
     number_of_nodes = ( ! ) r_number_of_nodes;
     cluster_security_groups = ( ! ) r_cluster_security_groups;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     master_user_password = ( ! ) r_master_user_password;
     cluster_parameter_group_name = ( ! ) r_cluster_parameter_group_name;
     automated_snapshot_retention_period = ( ! ) r_automated_snapshot_retention_period;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     cluster_version = ( ! ) r_cluster_version;
     allow_version_upgrade = ( ! ) r_allow_version_upgrade;
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
     new_cluster_identifier = ( ! ) r_new_cluster_identifier;
     publicly_accessible = ( ! ) r_publicly_accessible;
     elastic_ip = ( ! ) r_elastic_ip;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     encrypted = ( ! ) r_encrypted;
     kms_key_id = ( ! ) r_kms_key_id;
     availability_zone_relocation = ( ! ) r_availability_zone_relocation;
     availability_zone = ( ! ) r_availability_zone;
     port = ( ! ) r_port;
     manage_master_password = ( ! ) r_manage_master_password;
     master_password_secret_kms_key_id = ( ! ) r_master_password_secret_kms_key_id;
     ip_address_type = ( ! ) r_ip_address_type;
     multi_a_z = ( ! ) r_multi_a_z;
     extra_compute_for_automatic_optimization = ( ! ) r_extra_compute_for_automatic_optimization;
   }
    : modify_cluster_message)

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
  let r_cluster_identifier = ref None in
  let r_revision_target = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier"; "RevisionTarget" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RevisionTarget" ->
          r_revision_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RevisionTarget"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     revision_target = Smaws_Lib.Xml.Parse.required "RevisionTarget" (( ! ) r_revision_target) i;
   }
    : modify_cluster_db_revision_message)

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
  let r_cluster_identifier = ref None in
  let r_add_iam_roles = ref None in
  let r_remove_iam_roles = ref None in
  let r_default_iam_role_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "AddIamRoles"; "RemoveIamRoles"; "DefaultIamRoleArn" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
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
      | "RemoveIamRoles" ->
          r_remove_iam_roles :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemoveIamRoles"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "IamRoleArn"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "DefaultIamRoleArn" ->
          r_default_iam_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultIamRoleArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     add_iam_roles = ( ! ) r_add_iam_roles;
     remove_iam_roles = ( ! ) r_remove_iam_roles;
     default_iam_role_arn = ( ! ) r_default_iam_role_arn;
   }
    : modify_cluster_iam_roles_message)

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
  let r_cluster_identifier = ref None in
  let r_defer_maintenance = ref None in
  let r_defer_maintenance_identifier = ref None in
  let r_defer_maintenance_start_time = ref None in
  let r_defer_maintenance_end_time = ref None in
  let r_defer_maintenance_duration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "DeferMaintenance";
      "DeferMaintenanceIdentifier";
      "DeferMaintenanceStartTime";
      "DeferMaintenanceEndTime";
      "DeferMaintenanceDuration";
    ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DeferMaintenance" ->
          r_defer_maintenance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenance"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "DeferMaintenanceIdentifier" ->
          r_defer_maintenance_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DeferMaintenanceStartTime" ->
          r_defer_maintenance_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceStartTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "DeferMaintenanceEndTime" ->
          r_defer_maintenance_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceEndTime"
                 (fun i _ -> t_stamp_of_xml i)
                 ())
      | "DeferMaintenanceDuration" ->
          r_defer_maintenance_duration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeferMaintenanceDuration"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     defer_maintenance = ( ! ) r_defer_maintenance;
     defer_maintenance_identifier = ( ! ) r_defer_maintenance_identifier;
     defer_maintenance_start_time = ( ! ) r_defer_maintenance_start_time;
     defer_maintenance_end_time = ( ! ) r_defer_maintenance_end_time;
     defer_maintenance_duration = ( ! ) r_defer_maintenance_duration;
   }
    : modify_cluster_maintenance_message)

let modify_cluster_parameter_group_message_of_xml i =
  let r_parameter_group_name = ref None in
  let r_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ParameterGroupName"; "Parameters" ] (fun tag _ ->
      match tag with
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
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
     parameter_group_name =
       Smaws_Lib.Xml.Parse.required "ParameterGroupName" (( ! ) r_parameter_group_name) i;
     parameters = Smaws_Lib.Xml.Parse.required "Parameters" (( ! ) r_parameters) i;
   }
    : modify_cluster_parameter_group_message)

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
  let r_snapshot_identifier = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_force = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SnapshotIdentifier"; "ManualSnapshotRetentionPeriod"; "Force" ] (fun tag _ ->
      match tag with
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "Force" ->
          r_force :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Force" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifier" (( ! ) r_snapshot_identifier) i;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     force = ( ! ) r_force;
   }
    : modify_cluster_snapshot_message)

let modify_cluster_snapshot_schedule_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_schedule_identifier = ref None in
  let r_disassociate_schedule = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterIdentifier"; "ScheduleIdentifier"; "DisassociateSchedule" ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ScheduleIdentifier" ->
          r_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DisassociateSchedule" ->
          r_disassociate_schedule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisassociateSchedule"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     schedule_identifier = ( ! ) r_schedule_identifier;
     disassociate_schedule = ( ! ) r_disassociate_schedule;
   }
    : modify_cluster_snapshot_schedule_message)

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
  let r_cluster_subnet_group_name = ref None in
  let r_description = ref None in
  let r_subnet_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterSubnetGroupName"; "Description"; "SubnetIds" ] (fun tag _ ->
      match tag with
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description" (fun i _ -> string__of_xml i) ())
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
     cluster_subnet_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSubnetGroupName" (( ! ) r_cluster_subnet_group_name) i;
     description = ( ! ) r_description;
     subnet_ids = Smaws_Lib.Xml.Parse.required "SubnetIds" (( ! ) r_subnet_ids) i;
   }
    : modify_cluster_subnet_group_message)

let modify_custom_domain_association_result_of_xml i =
  let r_custom_domain_name = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_cluster_identifier = ref None in
  let r_custom_domain_cert_expiry_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CustomDomainName";
      "CustomDomainCertificateArn";
      "ClusterIdentifier";
      "CustomDomainCertExpiryTime";
    ] (fun tag _ ->
      match tag with
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> custom_domain_certificate_arn_string_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CustomDomainCertExpiryTime" ->
          r_custom_domain_cert_expiry_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertExpiryTime"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_domain_name = ( ! ) r_custom_domain_name;
     custom_domain_certificate_arn = ( ! ) r_custom_domain_certificate_arn;
     cluster_identifier = ( ! ) r_cluster_identifier;
     custom_domain_cert_expiry_time = ( ! ) r_custom_domain_cert_expiry_time;
   }
    : modify_custom_domain_association_result)

let modify_custom_domain_association_message_of_xml i =
  let r_custom_domain_name = ref None in
  let r_custom_domain_certificate_arn = ref None in
  let r_cluster_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CustomDomainName"; "CustomDomainCertificateArn"; "ClusterIdentifier" ] (fun tag _ ->
      match tag with
      | "CustomDomainName" ->
          r_custom_domain_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainName"
                 (fun i _ -> custom_domain_name_string_of_xml i)
                 ())
      | "CustomDomainCertificateArn" ->
          r_custom_domain_certificate_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomDomainCertificateArn"
                 (fun i _ -> custom_domain_certificate_arn_string_of_xml i)
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
     custom_domain_certificate_arn =
       Smaws_Lib.Xml.Parse.required "CustomDomainCertificateArn"
         (( ! ) r_custom_domain_certificate_arn)
         i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
   }
    : modify_custom_domain_association_message)

let modify_endpoint_access_message_of_xml i =
  let r_endpoint_name = ref None in
  let r_vpc_security_group_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EndpointName"; "VpcSecurityGroupIds" ]
    (fun tag _ ->
      match tag with
      | "EndpointName" ->
          r_endpoint_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointName" (fun i _ -> string__of_xml i) ())
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     endpoint_name = Smaws_Lib.Xml.Parse.required "EndpointName" (( ! ) r_endpoint_name) i;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
   }
    : modify_endpoint_access_message)

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
  let r_source_ids = ref None in
  let r_event_categories = ref None in
  let r_severity = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SubscriptionName";
      "SnsTopicArn";
      "SourceType";
      "SourceIds";
      "EventCategories";
      "Severity";
      "Enabled";
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
      | "Severity" ->
          r_severity :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Severity" (fun i _ -> string__of_xml i) ())
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
     source_ids = ( ! ) r_source_ids;
     event_categories = ( ! ) r_event_categories;
     severity = ( ! ) r_severity;
     enabled = ( ! ) r_enabled;
   }
    : modify_event_subscription_message)

let modify_integration_message_of_xml i =
  let r_integration_arn = ref None in
  let r_description = ref None in
  let r_integration_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "IntegrationArn"; "Description"; "IntegrationName" ] (fun tag _ ->
      match tag with
      | "IntegrationArn" ->
          r_integration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationArn"
                 (fun i _ -> integration_arn_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> integration_description_of_xml i)
                 ())
      | "IntegrationName" ->
          r_integration_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IntegrationName"
                 (fun i _ -> integration_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     integration_arn = Smaws_Lib.Xml.Parse.required "IntegrationArn" (( ! ) r_integration_arn) i;
     description = ( ! ) r_description;
     integration_name = ( ! ) r_integration_name;
   }
    : modify_integration_message)

let modify_lakehouse_configuration_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_lakehouse_registration = ref None in
  let r_catalog_name = ref None in
  let r_lakehouse_idc_registration = ref None in
  let r_lakehouse_idc_application_arn = ref None in
  let r_dry_run = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "LakehouseRegistration";
      "CatalogName";
      "LakehouseIdcRegistration";
      "LakehouseIdcApplicationArn";
      "DryRun";
    ] (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "LakehouseRegistration" ->
          r_lakehouse_registration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseRegistration"
                 (fun i _ -> lakehouse_registration_of_xml i)
                 ())
      | "CatalogName" ->
          r_catalog_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CatalogName"
                 (fun i _ -> catalog_name_string_of_xml i)
                 ())
      | "LakehouseIdcRegistration" ->
          r_lakehouse_idc_registration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseIdcRegistration"
                 (fun i _ -> lakehouse_idc_registration_of_xml i)
                 ())
      | "LakehouseIdcApplicationArn" ->
          r_lakehouse_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LakehouseIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "DryRun" ->
          r_dry_run :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DryRun"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     lakehouse_registration = ( ! ) r_lakehouse_registration;
     catalog_name = ( ! ) r_catalog_name;
     lakehouse_idc_registration = ( ! ) r_lakehouse_idc_registration;
     lakehouse_idc_application_arn = ( ! ) r_lakehouse_idc_application_arn;
     dry_run = ( ! ) r_dry_run;
   }
    : modify_lakehouse_configuration_message)

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
  let r_redshift_idc_application_arn = ref None in
  let r_identity_namespace = ref None in
  let r_iam_role_arn = ref None in
  let r_idc_display_name = ref None in
  let r_authorized_token_issuer_list = ref None in
  let r_service_integrations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RedshiftIdcApplicationArn";
      "IdentityNamespace";
      "IamRoleArn";
      "IdcDisplayName";
      "AuthorizedTokenIssuerList";
      "ServiceIntegrations";
    ] (fun tag _ ->
      match tag with
      | "RedshiftIdcApplicationArn" ->
          r_redshift_idc_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RedshiftIdcApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IdentityNamespace" ->
          r_identity_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdentityNamespace"
                 (fun i _ -> identity_namespace_string_of_xml i)
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
      | "AuthorizedTokenIssuerList" ->
          r_authorized_token_issuer_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthorizedTokenIssuerList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> authorized_token_issuer_of_xml i)
                     ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     redshift_idc_application_arn =
       Smaws_Lib.Xml.Parse.required "RedshiftIdcApplicationArn"
         (( ! ) r_redshift_idc_application_arn)
         i;
     identity_namespace = ( ! ) r_identity_namespace;
     iam_role_arn = ( ! ) r_iam_role_arn;
     idc_display_name = ( ! ) r_idc_display_name;
     authorized_token_issuer_list = ( ! ) r_authorized_token_issuer_list;
     service_integrations = ( ! ) r_service_integrations;
   }
    : modify_redshift_idc_application_message)

let modify_scheduled_action_message_of_xml i =
  let r_scheduled_action_name = ref None in
  let r_target_action = ref None in
  let r_schedule = ref None in
  let r_iam_role = ref None in
  let r_scheduled_action_description = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_enable = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ScheduledActionName";
      "TargetAction";
      "Schedule";
      "IamRole";
      "ScheduledActionDescription";
      "StartTime";
      "EndTime";
      "Enable";
    ] (fun tag _ ->
      match tag with
      | "ScheduledActionName" ->
          r_scheduled_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetAction" ->
          r_target_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetAction"
                 (fun i _ -> scheduled_action_type_of_xml i)
                 ())
      | "Schedule" ->
          r_schedule :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Schedule" (fun i _ -> string__of_xml i) ())
      | "IamRole" ->
          r_iam_role :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "IamRole" (fun i _ -> string__of_xml i) ())
      | "ScheduledActionDescription" ->
          r_scheduled_action_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScheduledActionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> t_stamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> t_stamp_of_xml i) ())
      | "Enable" ->
          r_enable :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enable"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheduled_action_name =
       Smaws_Lib.Xml.Parse.required "ScheduledActionName" (( ! ) r_scheduled_action_name) i;
     target_action = ( ! ) r_target_action;
     schedule = ( ! ) r_schedule;
     iam_role = ( ! ) r_iam_role;
     scheduled_action_description = ( ! ) r_scheduled_action_description;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     enable = ( ! ) r_enable;
   }
    : modify_scheduled_action_message)

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
  let r_cluster_identifier = ref None in
  let r_retention_period = ref None in
  let r_manual = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier"; "RetentionPeriod"; "Manual" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "RetentionPeriod" ->
          r_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetentionPeriod"
                 (fun i _ -> integer_of_xml i)
                 ())
      | "Manual" ->
          r_manual :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Manual" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     retention_period = Smaws_Lib.Xml.Parse.required "RetentionPeriod" (( ! ) r_retention_period) i;
     manual = ( ! ) r_manual;
   }
    : modify_snapshot_copy_retention_period_message)

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

let modify_snapshot_schedule_message_of_xml i =
  let r_schedule_identifier = ref None in
  let r_schedule_definitions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScheduleIdentifier"; "ScheduleDefinitions" ]
    (fun tag _ ->
      match tag with
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
     schedule_identifier =
       Smaws_Lib.Xml.Parse.required "ScheduleIdentifier" (( ! ) r_schedule_identifier) i;
     schedule_definitions =
       Smaws_Lib.Xml.Parse.required "ScheduleDefinitions" (( ! ) r_schedule_definitions) i;
   }
    : modify_snapshot_schedule_message)

let modify_usage_limit_message_of_xml i =
  let r_usage_limit_id = ref None in
  let r_amount = ref None in
  let r_breach_action = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UsageLimitId"; "Amount"; "BreachAction" ]
    (fun tag _ ->
      match tag with
      | "UsageLimitId" ->
          r_usage_limit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsageLimitId" (fun i _ -> string__of_xml i) ())
      | "Amount" ->
          r_amount :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Amount" (fun i _ -> long_optional_of_xml i) ())
      | "BreachAction" ->
          r_breach_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BreachAction"
                 (fun i _ -> usage_limit_breach_action_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     usage_limit_id = Smaws_Lib.Xml.Parse.required "UsageLimitId" (( ! ) r_usage_limit_id) i;
     amount = ( ! ) r_amount;
     breach_action = ( ! ) r_breach_action;
   }
    : modify_usage_limit_message)

let pause_cluster_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : pause_cluster_result)

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
  let r_reserved_node_offering_id = ref None in
  let r_node_count = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ReservedNodeOfferingId"; "NodeCount" ]
    (fun tag _ ->
      match tag with
      | "ReservedNodeOfferingId" ->
          r_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NodeCount" ->
          r_node_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NodeCount"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     reserved_node_offering_id =
       Smaws_Lib.Xml.Parse.required "ReservedNodeOfferingId" (( ! ) r_reserved_node_offering_id) i;
     node_count = ( ! ) r_node_count;
   }
    : purchase_reserved_node_offering_message)

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
  let r_resource_arn = ref None in
  let r_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArn"; "Policy" ] (fun tag _ ->
      match tag with
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn" (fun i _ -> string__of_xml i) ())
      | "Policy" ->
          r_policy :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Policy" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i;
     policy = Smaws_Lib.Xml.Parse.required "Policy" (( ! ) r_policy) i;
   }
    : put_resource_policy_message)

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

let update_partner_status_input_message_of_xml i =
  let r_account_id = ref None in
  let r_cluster_identifier = ref None in
  let r_database_name = ref None in
  let r_partner_name = ref None in
  let r_status = ref None in
  let r_status_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AccountId"; "ClusterIdentifier"; "DatabaseName"; "PartnerName"; "Status"; "StatusMessage" ]
    (fun tag _ ->
      match tag with
      | "AccountId" ->
          r_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountId"
                 (fun i _ -> partner_integration_account_id_of_xml i)
                 ())
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> partner_integration_cluster_identifier_of_xml i)
                 ())
      | "DatabaseName" ->
          r_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DatabaseName"
                 (fun i _ -> partner_integration_database_name_of_xml i)
                 ())
      | "PartnerName" ->
          r_partner_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PartnerName"
                 (fun i _ -> partner_integration_partner_name_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> partner_integration_status_of_xml i)
                 ())
      | "StatusMessage" ->
          r_status_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusMessage"
                 (fun i _ -> partner_integration_status_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     account_id = Smaws_Lib.Xml.Parse.required "AccountId" (( ! ) r_account_id) i;
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     database_name = Smaws_Lib.Xml.Parse.required "DatabaseName" (( ! ) r_database_name) i;
     partner_name = Smaws_Lib.Xml.Parse.required "PartnerName" (( ! ) r_partner_name) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     status_message = ( ! ) r_status_message;
   }
    : update_partner_status_input_message)

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
  let r_snapshot_identifier = ref None in
  let r_snapshot_arn = ref None in
  let r_snapshot_cluster_identifier = ref None in
  let r_account_with_restore_access = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SnapshotIdentifier"; "SnapshotArn"; "SnapshotClusterIdentifier"; "AccountWithRestoreAccess" ]
    (fun tag _ ->
      match tag with
      | "SnapshotIdentifier" ->
          r_snapshot_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | "SnapshotClusterIdentifier" ->
          r_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AccountWithRestoreAccess" ->
          r_account_with_restore_access :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountWithRestoreAccess"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     snapshot_arn = ( ! ) r_snapshot_arn;
     snapshot_cluster_identifier = ( ! ) r_snapshot_cluster_identifier;
     account_with_restore_access =
       Smaws_Lib.Xml.Parse.required "AccountWithRestoreAccess"
         (( ! ) r_account_with_restore_access)
         i;
   }
    : revoke_snapshot_access_message)

let revoke_endpoint_access_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_account = ref None in
  let r_vpc_ids = ref None in
  let r_force = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClusterIdentifier"; "Account"; "VpcIds"; "Force" ]
    (fun tag _ ->
      match tag with
      | "ClusterIdentifier" ->
          r_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> string__of_xml i) ())
      | "VpcIds" ->
          r_vpc_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcIdentifier"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "Force" ->
          r_force :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Force" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier = ( ! ) r_cluster_identifier;
     account = ( ! ) r_account;
     vpc_ids = ( ! ) r_vpc_ids;
     force = ( ! ) r_force;
   }
    : revoke_endpoint_access_message)

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
  let r_cluster_security_group_name = ref None in
  let r_cidri_p = ref None in
  let r_ec2_security_group_name = ref None in
  let r_ec2_security_group_owner_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClusterSecurityGroupName"; "CIDRIP"; "EC2SecurityGroupName"; "EC2SecurityGroupOwnerId" ]
    (fun tag _ ->
      match tag with
      | "ClusterSecurityGroupName" ->
          r_cluster_security_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSecurityGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "CIDRIP" ->
          r_cidri_p :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CIDRIP" (fun i _ -> string__of_xml i) ())
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
     cluster_security_group_name =
       Smaws_Lib.Xml.Parse.required "ClusterSecurityGroupName"
         (( ! ) r_cluster_security_group_name)
         i;
     cidri_p = ( ! ) r_cidri_p;
     ec2_security_group_name = ( ! ) r_ec2_security_group_name;
     ec2_security_group_owner_id = ( ! ) r_ec2_security_group_owner_id;
   }
    : revoke_cluster_security_group_ingress_message)

let resume_cluster_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : resume_cluster_result)

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
  let r_cluster_identifier = ref None in
  let r_snapshot_identifier = ref None in
  let r_source_database_name = ref None in
  let r_source_schema_name = ref None in
  let r_source_table_name = ref None in
  let r_target_database_name = ref None in
  let r_target_schema_name = ref None in
  let r_new_table_name = ref None in
  let r_enable_case_sensitive_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "SnapshotIdentifier";
      "SourceDatabaseName";
      "SourceSchemaName";
      "SourceTableName";
      "TargetDatabaseName";
      "TargetSchemaName";
      "NewTableName";
      "EnableCaseSensitiveIdentifier";
    ] (fun tag _ ->
      match tag with
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
      | "SourceDatabaseName" ->
          r_source_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceDatabaseName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceSchemaName" ->
          r_source_schema_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceSchemaName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SourceTableName" ->
          r_source_table_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceTableName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetDatabaseName" ->
          r_target_database_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDatabaseName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetSchemaName" ->
          r_target_schema_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetSchemaName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NewTableName" ->
          r_new_table_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewTableName" (fun i _ -> string__of_xml i) ())
      | "EnableCaseSensitiveIdentifier" ->
          r_enable_case_sensitive_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableCaseSensitiveIdentifier"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     snapshot_identifier =
       Smaws_Lib.Xml.Parse.required "SnapshotIdentifier" (( ! ) r_snapshot_identifier) i;
     source_database_name =
       Smaws_Lib.Xml.Parse.required "SourceDatabaseName" (( ! ) r_source_database_name) i;
     source_schema_name = ( ! ) r_source_schema_name;
     source_table_name =
       Smaws_Lib.Xml.Parse.required "SourceTableName" (( ! ) r_source_table_name) i;
     target_database_name = ( ! ) r_target_database_name;
     target_schema_name = ( ! ) r_target_schema_name;
     new_table_name = Smaws_Lib.Xml.Parse.required "NewTableName" (( ! ) r_new_table_name) i;
     enable_case_sensitive_identifier = ( ! ) r_enable_case_sensitive_identifier;
   }
    : restore_table_from_cluster_snapshot_message)

let restore_from_cluster_snapshot_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : restore_from_cluster_snapshot_result)

let restore_from_cluster_snapshot_message_of_xml i =
  let r_cluster_identifier = ref None in
  let r_snapshot_identifier = ref None in
  let r_snapshot_arn = ref None in
  let r_snapshot_cluster_identifier = ref None in
  let r_port = ref None in
  let r_availability_zone = ref None in
  let r_allow_version_upgrade = ref None in
  let r_cluster_subnet_group_name = ref None in
  let r_publicly_accessible = ref None in
  let r_owner_account = ref None in
  let r_hsm_client_certificate_identifier = ref None in
  let r_hsm_configuration_identifier = ref None in
  let r_elastic_ip = ref None in
  let r_cluster_parameter_group_name = ref None in
  let r_cluster_security_groups = ref None in
  let r_vpc_security_group_ids = ref None in
  let r_preferred_maintenance_window = ref None in
  let r_automated_snapshot_retention_period = ref None in
  let r_manual_snapshot_retention_period = ref None in
  let r_kms_key_id = ref None in
  let r_node_type = ref None in
  let r_enhanced_vpc_routing = ref None in
  let r_additional_info = ref None in
  let r_iam_roles = ref None in
  let r_maintenance_track_name = ref None in
  let r_snapshot_schedule_identifier = ref None in
  let r_number_of_nodes = ref None in
  let r_availability_zone_relocation = ref None in
  let r_aqua_configuration_status = ref None in
  let r_default_iam_role_arn = ref None in
  let r_reserved_node_id = ref None in
  let r_target_reserved_node_offering_id = ref None in
  let r_encrypted = ref None in
  let r_manage_master_password = ref None in
  let r_master_password_secret_kms_key_id = ref None in
  let r_ip_address_type = ref None in
  let r_multi_a_z = ref None in
  let r_catalog_name = ref None in
  let r_redshift_idc_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClusterIdentifier";
      "SnapshotIdentifier";
      "SnapshotArn";
      "SnapshotClusterIdentifier";
      "Port";
      "AvailabilityZone";
      "AllowVersionUpgrade";
      "ClusterSubnetGroupName";
      "PubliclyAccessible";
      "OwnerAccount";
      "HsmClientCertificateIdentifier";
      "HsmConfigurationIdentifier";
      "ElasticIp";
      "ClusterParameterGroupName";
      "ClusterSecurityGroups";
      "VpcSecurityGroupIds";
      "PreferredMaintenanceWindow";
      "AutomatedSnapshotRetentionPeriod";
      "ManualSnapshotRetentionPeriod";
      "KmsKeyId";
      "NodeType";
      "EnhancedVpcRouting";
      "AdditionalInfo";
      "IamRoles";
      "MaintenanceTrackName";
      "SnapshotScheduleIdentifier";
      "NumberOfNodes";
      "AvailabilityZoneRelocation";
      "AquaConfigurationStatus";
      "DefaultIamRoleArn";
      "ReservedNodeId";
      "TargetReservedNodeOfferingId";
      "Encrypted";
      "ManageMasterPassword";
      "MasterPasswordSecretKmsKeyId";
      "IpAddressType";
      "MultiAZ";
      "CatalogName";
      "RedshiftIdcApplicationArn";
    ] (fun tag _ ->
      match tag with
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
      | "SnapshotArn" ->
          r_snapshot_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotArn" (fun i _ -> string__of_xml i) ())
      | "SnapshotClusterIdentifier" ->
          r_snapshot_cluster_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotClusterIdentifier"
                 (fun i _ -> string__of_xml i)
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
      | "AllowVersionUpgrade" ->
          r_allow_version_upgrade :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowVersionUpgrade"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ClusterSubnetGroupName" ->
          r_cluster_subnet_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterSubnetGroupName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "PubliclyAccessible" ->
          r_publicly_accessible :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PubliclyAccessible"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "OwnerAccount" ->
          r_owner_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerAccount" (fun i _ -> string__of_xml i) ())
      | "HsmClientCertificateIdentifier" ->
          r_hsm_client_certificate_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmClientCertificateIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "HsmConfigurationIdentifier" ->
          r_hsm_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HsmConfigurationIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ElasticIp" ->
          r_elastic_ip :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ElasticIp" (fun i _ -> string__of_xml i) ())
      | "ClusterParameterGroupName" ->
          r_cluster_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClusterParameterGroupName"
                 (fun i _ -> string__of_xml i)
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
      | "VpcSecurityGroupIds" ->
          r_vpc_security_group_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VpcSecurityGroupIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "VpcSecurityGroupId"
                     (fun i _ -> string__of_xml i)
                     ())
                 ())
      | "PreferredMaintenanceWindow" ->
          r_preferred_maintenance_window :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreferredMaintenanceWindow"
                 (fun i _ -> string__of_xml i)
                 ())
      | "AutomatedSnapshotRetentionPeriod" ->
          r_automated_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutomatedSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "ManualSnapshotRetentionPeriod" ->
          r_manual_snapshot_retention_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManualSnapshotRetentionPeriod"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "KmsKeyId" ->
          r_kms_key_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "KmsKeyId" (fun i _ -> string__of_xml i) ())
      | "NodeType" ->
          r_node_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NodeType" (fun i _ -> string__of_xml i) ())
      | "EnhancedVpcRouting" ->
          r_enhanced_vpc_routing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnhancedVpcRouting"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AdditionalInfo" ->
          r_additional_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdditionalInfo"
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
      | "MaintenanceTrackName" ->
          r_maintenance_track_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaintenanceTrackName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "SnapshotScheduleIdentifier" ->
          r_snapshot_schedule_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SnapshotScheduleIdentifier"
                 (fun i _ -> string__of_xml i)
                 ())
      | "NumberOfNodes" ->
          r_number_of_nodes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfNodes"
                 (fun i _ -> integer_optional_of_xml i)
                 ())
      | "AvailabilityZoneRelocation" ->
          r_availability_zone_relocation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZoneRelocation"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "AquaConfigurationStatus" ->
          r_aqua_configuration_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AquaConfigurationStatus"
                 (fun i _ -> aqua_configuration_status_of_xml i)
                 ())
      | "DefaultIamRoleArn" ->
          r_default_iam_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultIamRoleArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ReservedNodeId" ->
          r_reserved_node_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReservedNodeId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "TargetReservedNodeOfferingId" ->
          r_target_reserved_node_offering_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetReservedNodeOfferingId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Encrypted" ->
          r_encrypted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Encrypted"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "ManageMasterPassword" ->
          r_manage_master_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManageMasterPassword"
                 (fun i _ -> boolean_optional_of_xml i)
                 ())
      | "MasterPasswordSecretKmsKeyId" ->
          r_master_password_secret_kms_key_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MasterPasswordSecretKmsKeyId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "IpAddressType" ->
          r_ip_address_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IpAddressType" (fun i _ -> string__of_xml i) ())
      | "MultiAZ" ->
          r_multi_a_z :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MultiAZ"
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cluster_identifier =
       Smaws_Lib.Xml.Parse.required "ClusterIdentifier" (( ! ) r_cluster_identifier) i;
     snapshot_identifier = ( ! ) r_snapshot_identifier;
     snapshot_arn = ( ! ) r_snapshot_arn;
     snapshot_cluster_identifier = ( ! ) r_snapshot_cluster_identifier;
     port = ( ! ) r_port;
     availability_zone = ( ! ) r_availability_zone;
     allow_version_upgrade = ( ! ) r_allow_version_upgrade;
     cluster_subnet_group_name = ( ! ) r_cluster_subnet_group_name;
     publicly_accessible = ( ! ) r_publicly_accessible;
     owner_account = ( ! ) r_owner_account;
     hsm_client_certificate_identifier = ( ! ) r_hsm_client_certificate_identifier;
     hsm_configuration_identifier = ( ! ) r_hsm_configuration_identifier;
     elastic_ip = ( ! ) r_elastic_ip;
     cluster_parameter_group_name = ( ! ) r_cluster_parameter_group_name;
     cluster_security_groups = ( ! ) r_cluster_security_groups;
     vpc_security_group_ids = ( ! ) r_vpc_security_group_ids;
     preferred_maintenance_window = ( ! ) r_preferred_maintenance_window;
     automated_snapshot_retention_period = ( ! ) r_automated_snapshot_retention_period;
     manual_snapshot_retention_period = ( ! ) r_manual_snapshot_retention_period;
     kms_key_id = ( ! ) r_kms_key_id;
     node_type = ( ! ) r_node_type;
     enhanced_vpc_routing = ( ! ) r_enhanced_vpc_routing;
     additional_info = ( ! ) r_additional_info;
     iam_roles = ( ! ) r_iam_roles;
     maintenance_track_name = ( ! ) r_maintenance_track_name;
     snapshot_schedule_identifier = ( ! ) r_snapshot_schedule_identifier;
     number_of_nodes = ( ! ) r_number_of_nodes;
     availability_zone_relocation = ( ! ) r_availability_zone_relocation;
     aqua_configuration_status = ( ! ) r_aqua_configuration_status;
     default_iam_role_arn = ( ! ) r_default_iam_role_arn;
     reserved_node_id = ( ! ) r_reserved_node_id;
     target_reserved_node_offering_id = ( ! ) r_target_reserved_node_offering_id;
     encrypted = ( ! ) r_encrypted;
     manage_master_password = ( ! ) r_manage_master_password;
     master_password_secret_kms_key_id = ( ! ) r_master_password_secret_kms_key_id;
     ip_address_type = ( ! ) r_ip_address_type;
     multi_a_z = ( ! ) r_multi_a_z;
     catalog_name = ( ! ) r_catalog_name;
     redshift_idc_application_arn = ( ! ) r_redshift_idc_application_arn;
   }
    : restore_from_cluster_snapshot_message)

let resize_cluster_result_of_xml i =
  let r_cluster = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Cluster" ] (fun tag _ ->
      match tag with
      | "Cluster" ->
          r_cluster :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Cluster" (fun i _ -> cluster_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cluster = ( ! ) r_cluster } : resize_cluster_result)

let reset_cluster_parameter_group_message_of_xml i =
  let r_parameter_group_name = ref None in
  let r_reset_all_parameters = ref None in
  let r_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ParameterGroupName"; "ResetAllParameters"; "Parameters" ] (fun tag _ ->
      match tag with
      | "ParameterGroupName" ->
          r_parameter_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterGroupName"
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
     parameter_group_name =
       Smaws_Lib.Xml.Parse.required "ParameterGroupName" (( ! ) r_parameter_group_name) i;
     reset_all_parameters = ( ! ) r_reset_all_parameters;
     parameters = ( ! ) r_parameters;
   }
    : reset_cluster_parameter_group_message)

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

let register_namespace_input_message_of_xml i =
  let r_namespace_identifier = ref None in
  let r_consumer_identifiers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NamespaceIdentifier"; "ConsumerIdentifiers" ]
    (fun tag _ ->
      match tag with
      | "NamespaceIdentifier" ->
          r_namespace_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NamespaceIdentifier"
                 (fun i _ -> namespace_identifier_union_of_xml i)
                 ())
      | "ConsumerIdentifiers" ->
          r_consumer_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConsumerIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace_identifier =
       Smaws_Lib.Xml.Parse.required "NamespaceIdentifier" (( ! ) r_namespace_identifier) i;
     consumer_identifiers =
       Smaws_Lib.Xml.Parse.required "ConsumerIdentifiers" (( ! ) r_consumer_identifiers) i;
   }
    : register_namespace_input_message)
