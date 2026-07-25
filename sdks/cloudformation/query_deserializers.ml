open Types

let unit_of_xml _ = ()

let accept_terms_and_conditions_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let account_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let account_filter_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "NONE" -> NONE
   | "INTERSECTION" -> INTERSECTION
   | "DIFFERENCE" -> DIFFERENCE
   | "UNION" -> UNION
   | _ -> failwith "unknown enum value"
    : account_filter_type)

let account_gate_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let account_gate_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SUCCEEDED" -> SUCCEEDED
   | "FAILED" -> FAILED
   | "SKIPPED" -> SKIPPED
   | _ -> failwith "unknown enum value"
    : account_gate_status)

let account_gate_result_of_xml i =
  let r_status = ref None in
  let r_status_reason = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "StatusReason" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> account_gate_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> account_gate_status_reason_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status; status_reason = ( ! ) r_status_reason } : account_gate_result)

let limit_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let limit_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let account_limit_of_xml i =
  let r_name = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Value" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> limit_name_of_xml i) ())
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> limit_value_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; value = ( ! ) r_value } : account_limit)

let account_limit_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_limit_of_xml i) ()

let account_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ()

let accounts_url_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let operation_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : operation_not_found_exception)

let invalid_operation_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_operation_exception)

let activate_organizations_access_output_of_xml i = ()
let activate_organizations_access_input_of_xml i = ()

let type_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : type_not_found_exception)

let cfn_registry_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : cfn_registry_exception)

let private_type_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let activate_type_output_of_xml i =
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Arn" ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> private_type_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ arn = ( ! ) r_arn } : activate_type_output)

let major_version_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let version_bump_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "MAJOR" -> MAJOR | "MINOR" -> MINOR | _ -> failwith "unknown enum value"
    : version_bump)

let role_ar_n2_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let log_group_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let logging_config_of_xml i =
  let r_log_role_arn = ref None in
  let r_log_group_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LogRoleArn"; "LogGroupName" ] (fun tag _ ->
      match tag with
      | "LogRoleArn" ->
          r_log_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogRoleArn" (fun i _ -> role_ar_n2_of_xml i) ())
      | "LogGroupName" ->
          r_log_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogGroupName"
                 (fun i _ -> log_group_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     log_role_arn = Smaws_Lib.Xml.Parse.required "LogRoleArn" (( ! ) r_log_role_arn) i;
     log_group_name = Smaws_Lib.Xml.Parse.required "LogGroupName" (( ! ) r_log_group_name) i;
   }
    : logging_config)

let auto_update_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let type_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let publisher_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let third_party_type_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let third_party_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "RESOURCE" -> RESOURCE
   | "MODULE" -> MODULE
   | "HOOK" -> HOOK
   | _ -> failwith "unknown enum value"
    : third_party_type)

let activate_type_input_of_xml i =
  let r_type_ = ref None in
  let r_public_type_arn = ref None in
  let r_publisher_id = ref None in
  let r_type_name = ref None in
  let r_type_name_alias = ref None in
  let r_auto_update = ref None in
  let r_logging_config = ref None in
  let r_execution_role_arn = ref None in
  let r_version_bump = ref None in
  let r_major_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Type";
      "PublicTypeArn";
      "PublisherId";
      "TypeName";
      "TypeNameAlias";
      "AutoUpdate";
      "LoggingConfig";
      "ExecutionRoleArn";
      "VersionBump";
      "MajorVersion";
    ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | "PublicTypeArn" ->
          r_public_type_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicTypeArn"
                 (fun i _ -> third_party_type_arn_of_xml i)
                 ())
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "TypeNameAlias" ->
          r_type_name_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeNameAlias"
                 (fun i _ -> type_name_of_xml i)
                 ())
      | "AutoUpdate" ->
          r_auto_update :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoUpdate"
                 (fun i _ -> auto_update_of_xml i)
                 ())
      | "LoggingConfig" ->
          r_logging_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoggingConfig"
                 (fun i _ -> logging_config_of_xml i)
                 ())
      | "ExecutionRoleArn" ->
          r_execution_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleArn"
                 (fun i _ -> role_ar_n2_of_xml i)
                 ())
      | "VersionBump" ->
          r_version_bump :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionBump"
                 (fun i _ -> version_bump_of_xml i)
                 ())
      | "MajorVersion" ->
          r_major_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MajorVersion"
                 (fun i _ -> major_version_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     public_type_arn = ( ! ) r_public_type_arn;
     publisher_id = ( ! ) r_publisher_id;
     type_name = ( ! ) r_type_name;
     type_name_alias = ( ! ) r_type_name_alias;
     auto_update = ( ! ) r_auto_update;
     logging_config = ( ! ) r_logging_config;
     execution_role_arn = ( ! ) r_execution_role_arn;
     version_bump = ( ! ) r_version_bump;
     major_version = ( ! ) r_major_version;
   }
    : activate_type_input)

let after_context_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let after_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let after_value_from_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "TEMPLATE" -> TEMPLATE | _ -> failwith "unknown enum value" : after_value_from)

let allowed_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let allowed_values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> allowed_value_of_xml i) ()

let already_exists_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : already_exists_exception)

let annotation_severity_level_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "INFORMATIONAL" -> INFORMATIONAL
   | "LOW" -> LOW
   | "MEDIUM" -> MEDIUM
   | "HIGH" -> HIGH
   | "CRITICAL" -> CRITICAL
   | _ -> failwith "unknown enum value"
    : annotation_severity_level)

let annotation_remediation_link_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let remediation_message_remediation_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let remediation_message_status_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let annotation_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PASSED" -> PASSED
   | "FAILED" -> FAILED
   | "SKIPPED" -> SKIPPED
   | _ -> failwith "unknown enum value"
    : annotation_status)

let annotation_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let annotation_of_xml i =
  let r_annotation_name = ref None in
  let r_status = ref None in
  let r_status_message = ref None in
  let r_remediation_message = ref None in
  let r_remediation_link = ref None in
  let r_severity_level = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AnnotationName";
      "Status";
      "StatusMessage";
      "RemediationMessage";
      "RemediationLink";
      "SeverityLevel";
    ] (fun tag _ ->
      match tag with
      | "AnnotationName" ->
          r_annotation_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnnotationName"
                 (fun i _ -> annotation_name_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> annotation_status_of_xml i)
                 ())
      | "StatusMessage" ->
          r_status_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusMessage"
                 (fun i _ -> remediation_message_status_message_of_xml i)
                 ())
      | "RemediationMessage" ->
          r_remediation_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemediationMessage"
                 (fun i _ -> remediation_message_remediation_message_of_xml i)
                 ())
      | "RemediationLink" ->
          r_remediation_link :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemediationLink"
                 (fun i _ -> annotation_remediation_link_of_xml i)
                 ())
      | "SeverityLevel" ->
          r_severity_level :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SeverityLevel"
                 (fun i _ -> annotation_severity_level_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     annotation_name = ( ! ) r_annotation_name;
     status = ( ! ) r_status;
     status_message = ( ! ) r_status_message;
     remediation_message = ( ! ) r_remediation_message;
     remediation_link = ( ! ) r_remediation_link;
     severity_level = ( ! ) r_severity_level;
   }
    : annotation)

let annotation_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> annotation_of_xml i) ()

let arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let attribute_change_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Add" -> Add
   | "Remove" -> Remove
   | "Modify" -> Modify
   | "SyncWithActual" -> SyncWithActual
   | _ -> failwith "unknown enum value"
    : attribute_change_type)

let stack_set_ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_set_arn_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_set_ar_n_of_xml i) ()

let retain_stacks_on_account_removal_nullable_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_deployment_nullable_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_deployment_of_xml i =
  let r_enabled = ref None in
  let r_retain_stacks_on_account_removal = ref None in
  let r_depends_on = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Enabled"; "RetainStacksOnAccountRemoval"; "DependsOn" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> auto_deployment_nullable_of_xml i)
                 ())
      | "RetainStacksOnAccountRemoval" ->
          r_retain_stacks_on_account_removal :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainStacksOnAccountRemoval"
                 (fun i _ -> retain_stacks_on_account_removal_nullable_of_xml i)
                 ())
      | "DependsOn" ->
          r_depends_on :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DependsOn"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_set_ar_n_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enabled = ( ! ) r_enabled;
     retain_stacks_on_account_removal = ( ! ) r_retain_stacks_on_account_removal;
     depends_on = ( ! ) r_depends_on;
   }
    : auto_deployment)

let type_configuration_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : type_configuration_not_found_exception)

let is_default_configuration_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let type_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let type_configuration_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let type_configuration_alias_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let type_configuration_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let type_configuration_details_of_xml i =
  let r_arn = ref None in
  let r_alias = ref None in
  let r_configuration = ref None in
  let r_last_updated = ref None in
  let r_type_arn = ref None in
  let r_type_name = ref None in
  let r_is_default_configuration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Arn";
      "Alias";
      "Configuration";
      "LastUpdated";
      "TypeArn";
      "TypeName";
      "IsDefaultConfiguration";
    ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn"
                 (fun i _ -> type_configuration_arn_of_xml i)
                 ())
      | "Alias" ->
          r_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Alias"
                 (fun i _ -> type_configuration_alias_of_xml i)
                 ())
      | "Configuration" ->
          r_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Configuration"
                 (fun i _ -> type_configuration_of_xml i)
                 ())
      | "LastUpdated" ->
          r_last_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdated" (fun i _ -> timestamp_of_xml i) ())
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "IsDefaultConfiguration" ->
          r_is_default_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsDefaultConfiguration"
                 (fun i _ -> is_default_configuration_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = ( ! ) r_arn;
     alias = ( ! ) r_alias;
     configuration = ( ! ) r_configuration;
     last_updated = ( ! ) r_last_updated;
     type_arn = ( ! ) r_type_arn;
     type_name = ( ! ) r_type_name;
     is_default_configuration = ( ! ) r_is_default_configuration;
   }
    : type_configuration_details)

let type_configuration_details_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> type_configuration_details_of_xml i) ()

let type_configuration_identifier_of_xml i =
  let r_type_arn = ref None in
  let r_type_configuration_alias = ref None in
  let r_type_configuration_arn = ref None in
  let r_type_ = ref None in
  let r_type_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TypeArn"; "TypeConfigurationAlias"; "TypeConfigurationArn"; "Type"; "TypeName" ]
    (fun tag _ ->
      match tag with
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | "TypeConfigurationAlias" ->
          r_type_configuration_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationAlias"
                 (fun i _ -> type_configuration_alias_of_xml i)
                 ())
      | "TypeConfigurationArn" ->
          r_type_configuration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationArn"
                 (fun i _ -> type_configuration_arn_of_xml i)
                 ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_arn = ( ! ) r_type_arn;
     type_configuration_alias = ( ! ) r_type_configuration_alias;
     type_configuration_arn = ( ! ) r_type_configuration_arn;
     type_ = ( ! ) r_type_;
     type_name = ( ! ) r_type_name;
   }
    : type_configuration_identifier)

let unprocessed_type_configurations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> type_configuration_identifier_of_xml i)
    ()

let error_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let batch_describe_type_configurations_error_of_xml i =
  let r_error_code = ref None in
  let r_error_message = ref None in
  let r_type_configuration_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ErrorCode"; "ErrorMessage"; "TypeConfigurationIdentifier" ] (fun tag _ ->
      match tag with
      | "ErrorCode" ->
          r_error_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorCode" (fun i _ -> error_code_of_xml i) ())
      | "ErrorMessage" ->
          r_error_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorMessage"
                 (fun i _ -> error_message_of_xml i)
                 ())
      | "TypeConfigurationIdentifier" ->
          r_type_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationIdentifier"
                 (fun i _ -> type_configuration_identifier_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     error_code = ( ! ) r_error_code;
     error_message = ( ! ) r_error_message;
     type_configuration_identifier = ( ! ) r_type_configuration_identifier;
   }
    : batch_describe_type_configurations_error)

let batch_describe_type_configurations_errors_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> batch_describe_type_configurations_error_of_xml i)
    ()

let batch_describe_type_configurations_output_of_xml i =
  let r_errors = ref None in
  let r_unprocessed_type_configurations = ref None in
  let r_type_configurations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Errors"; "UnprocessedTypeConfigurations"; "TypeConfigurations" ] (fun tag _ ->
      match tag with
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> batch_describe_type_configurations_error_of_xml i)
                     ())
                 ())
      | "UnprocessedTypeConfigurations" ->
          r_unprocessed_type_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UnprocessedTypeConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> type_configuration_identifier_of_xml i)
                     ())
                 ())
      | "TypeConfigurations" ->
          r_type_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> type_configuration_details_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     errors = ( ! ) r_errors;
     unprocessed_type_configurations = ( ! ) r_unprocessed_type_configurations;
     type_configurations = ( ! ) r_type_configurations;
   }
    : batch_describe_type_configurations_output)

let type_configuration_identifiers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> type_configuration_identifier_of_xml i)
    ()

let batch_describe_type_configurations_input_of_xml i =
  let r_type_configuration_identifiers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TypeConfigurationIdentifiers" ] (fun tag _ ->
      match tag with
      | "TypeConfigurationIdentifiers" ->
          r_type_configuration_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> type_configuration_identifier_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_configuration_identifiers =
       Smaws_Lib.Xml.Parse.required "TypeConfigurationIdentifiers"
         (( ! ) r_type_configuration_identifiers)
         i;
   }
    : batch_describe_type_configurations_input)

let beacon_stack_operation_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "IN_PROGRESS" -> IN_PROGRESS
   | "SUCCEEDED" -> SUCCEEDED
   | "FAILED" -> FAILED
   | _ -> failwith "unknown enum value"
    : beacon_stack_operation_status)

let before_context_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let before_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let before_value_from_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PREVIOUS_DEPLOYMENT_STATE" -> PREVIOUS_DEPLOYMENT_STATE
   | "ACTUAL_STATE" -> ACTUAL_STATE
   | _ -> failwith "unknown enum value"
    : before_value_from)

let boxed_integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let boxed_max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let call_as_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SELF" -> SELF
   | "DELEGATED_ADMIN" -> DELEGATED_ADMIN
   | _ -> failwith "unknown enum value"
    : call_as)

let token_already_exists_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : token_already_exists_exception)

let client_request_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let stack_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let cancel_update_stack_input_of_xml i =
  let r_stack_name = ref None in
  let r_client_request_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "ClientRequestToken" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     client_request_token = ( ! ) r_client_request_token;
   }
    : cancel_update_stack_input)

let capability_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CAPABILITY_IAM" -> CAPABILITY_IAM
   | "CAPABILITY_NAMED_IAM" -> CAPABILITY_NAMED_IAM
   | "CAPABILITY_AUTO_EXPAND" -> CAPABILITY_AUTO_EXPAND
   | _ -> failwith "unknown enum value"
    : capability)

let capabilities_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ()

let capabilities_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let category_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "REGISTERED" -> REGISTERED
   | "ACTIVATED" -> ACTIVATED
   | "THIRD_PARTY" -> THIRD_PARTY
   | "AWS_TYPES" -> AWS_TYPES
   | _ -> failwith "unknown enum value"
    : category)

let causing_entity_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let previous_deployment_context_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let logical_id_hierarchy_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let type_hierarchy_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let module_info_of_xml i =
  let r_type_hierarchy = ref None in
  let r_logical_id_hierarchy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TypeHierarchy"; "LogicalIdHierarchy" ]
    (fun tag _ ->
      match tag with
      | "TypeHierarchy" ->
          r_type_hierarchy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeHierarchy"
                 (fun i _ -> type_hierarchy_of_xml i)
                 ())
      | "LogicalIdHierarchy" ->
          r_logical_id_hierarchy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalIdHierarchy"
                 (fun i _ -> logical_id_hierarchy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ type_hierarchy = ( ! ) r_type_hierarchy; logical_id_hierarchy = ( ! ) r_logical_id_hierarchy }
    : module_info)

let change_set_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let change_source_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ResourceReference" -> ResourceReference
   | "ParameterReference" -> ParameterReference
   | "ResourceAttribute" -> ResourceAttribute
   | "DirectModification" -> DirectModification
   | "Automatic" -> Automatic
   | "NoModification" -> NoModification
   | _ -> failwith "unknown enum value"
    : change_source)

let evaluation_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Static" -> Static | "Dynamic" -> Dynamic | _ -> failwith "unknown enum value"
    : evaluation_type)

let resource_drift_actual_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_drift_previous_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let live_resource_drift_of_xml i =
  let r_previous_value = ref None in
  let r_actual_value = ref None in
  let r_drift_detection_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PreviousValue"; "ActualValue"; "DriftDetectionTimestamp" ] (fun tag _ ->
      match tag with
      | "PreviousValue" ->
          r_previous_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreviousValue"
                 (fun i _ -> resource_drift_previous_value_of_xml i)
                 ())
      | "ActualValue" ->
          r_actual_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActualValue"
                 (fun i _ -> resource_drift_actual_value_of_xml i)
                 ())
      | "DriftDetectionTimestamp" ->
          r_drift_detection_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftDetectionTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     previous_value = ( ! ) r_previous_value;
     actual_value = ( ! ) r_actual_value;
     drift_detection_timestamp = ( ! ) r_drift_detection_timestamp;
   }
    : live_resource_drift)

let resource_property_path_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let requires_recreation_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Never" -> Never
   | "Conditionally" -> Conditionally
   | "Always" -> Always
   | _ -> failwith "unknown enum value"
    : requires_recreation)

let property_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_attribute_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Properties" -> Properties
   | "Metadata" -> Metadata
   | "CreationPolicy" -> CreationPolicy
   | "UpdatePolicy" -> UpdatePolicy
   | "DeletionPolicy" -> DeletionPolicy
   | "UpdateReplacePolicy" -> UpdateReplacePolicy
   | "Tags" -> Tags
   | _ -> failwith "unknown enum value"
    : resource_attribute)

let resource_target_definition_of_xml i =
  let r_attribute = ref None in
  let r_name = ref None in
  let r_requires_recreation = ref None in
  let r_path = ref None in
  let r_before_value = ref None in
  let r_after_value = ref None in
  let r_before_value_from = ref None in
  let r_after_value_from = ref None in
  let r_drift = ref None in
  let r_attribute_change_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Attribute";
      "Name";
      "RequiresRecreation";
      "Path";
      "BeforeValue";
      "AfterValue";
      "BeforeValueFrom";
      "AfterValueFrom";
      "Drift";
      "AttributeChangeType";
    ] (fun tag _ ->
      match tag with
      | "Attribute" ->
          r_attribute :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attribute"
                 (fun i _ -> resource_attribute_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> property_name_of_xml i) ())
      | "RequiresRecreation" ->
          r_requires_recreation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequiresRecreation"
                 (fun i _ -> requires_recreation_of_xml i)
                 ())
      | "Path" ->
          r_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Path"
                 (fun i _ -> resource_property_path_of_xml i)
                 ())
      | "BeforeValue" ->
          r_before_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BeforeValue"
                 (fun i _ -> before_value_of_xml i)
                 ())
      | "AfterValue" ->
          r_after_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AfterValue"
                 (fun i _ -> after_value_of_xml i)
                 ())
      | "BeforeValueFrom" ->
          r_before_value_from :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BeforeValueFrom"
                 (fun i _ -> before_value_from_of_xml i)
                 ())
      | "AfterValueFrom" ->
          r_after_value_from :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AfterValueFrom"
                 (fun i _ -> after_value_from_of_xml i)
                 ())
      | "Drift" ->
          r_drift :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Drift"
                 (fun i _ -> live_resource_drift_of_xml i)
                 ())
      | "AttributeChangeType" ->
          r_attribute_change_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeChangeType"
                 (fun i _ -> attribute_change_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attribute = ( ! ) r_attribute;
     name = ( ! ) r_name;
     requires_recreation = ( ! ) r_requires_recreation;
     path = ( ! ) r_path;
     before_value = ( ! ) r_before_value;
     after_value = ( ! ) r_after_value;
     before_value_from = ( ! ) r_before_value_from;
     after_value_from = ( ! ) r_after_value_from;
     drift = ( ! ) r_drift;
     attribute_change_type = ( ! ) r_attribute_change_type;
   }
    : resource_target_definition)

let resource_change_detail_of_xml i =
  let r_target = ref None in
  let r_evaluation = ref None in
  let r_change_source = ref None in
  let r_causing_entity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Target"; "Evaluation"; "ChangeSource"; "CausingEntity" ] (fun tag _ ->
      match tag with
      | "Target" ->
          r_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Target"
                 (fun i _ -> resource_target_definition_of_xml i)
                 ())
      | "Evaluation" ->
          r_evaluation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Evaluation"
                 (fun i _ -> evaluation_type_of_xml i)
                 ())
      | "ChangeSource" ->
          r_change_source :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSource"
                 (fun i _ -> change_source_of_xml i)
                 ())
      | "CausingEntity" ->
          r_causing_entity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CausingEntity"
                 (fun i _ -> causing_entity_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target = ( ! ) r_target;
     evaluation = ( ! ) r_evaluation;
     change_source = ( ! ) r_change_source;
     causing_entity = ( ! ) r_causing_entity;
   }
    : resource_change_detail)

let resource_change_details_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_change_detail_of_xml i) ()

let drift_ignored_reason_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "MANAGED_BY_AWS" -> MANAGED_BY_AWS
   | "WRITE_ONLY_PROPERTY" -> WRITE_ONLY_PROPERTY
   | _ -> failwith "unknown enum value"
    : drift_ignored_reason)

let resource_drift_ignored_attribute_of_xml i =
  let r_path = ref None in
  let r_reason = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Path"; "Reason" ] (fun tag _ ->
      match tag with
      | "Path" ->
          r_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Path"
                 (fun i _ -> resource_property_path_of_xml i)
                 ())
      | "Reason" ->
          r_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Reason"
                 (fun i _ -> drift_ignored_reason_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ path = ( ! ) r_path; reason = ( ! ) r_reason } : resource_drift_ignored_attribute)

let resource_drift_ignored_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> resource_drift_ignored_attribute_of_xml i)
    ()

let stack_resource_drift_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "IN_SYNC" -> IN_SYNC
   | "MODIFIED" -> MODIFIED
   | "DELETED" -> DELETED
   | "NOT_CHECKED" -> NOT_CHECKED
   | "UNKNOWN" -> UNKNOWN
   | "UNSUPPORTED" -> UNSUPPORTED
   | _ -> failwith "unknown enum value"
    : stack_resource_drift_status)

let scope_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_attribute_of_xml i) ()

let replacement_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "True" -> True
   | "False" -> False
   | "Conditional" -> Conditional
   | _ -> failwith "unknown enum value"
    : replacement)

let resource_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let physical_resource_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let logical_resource_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let change_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Add" -> Add
   | "Modify" -> Modify
   | "Remove" -> Remove
   | "Import" -> Import
   | "Dynamic" -> Dynamic
   | "SyncWithActual" -> SyncWithActual
   | _ -> failwith "unknown enum value"
    : change_action)

let policy_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Delete" -> Delete
   | "Retain" -> Retain
   | "Snapshot" -> Snapshot
   | "ReplaceAndDelete" -> ReplaceAndDelete
   | "ReplaceAndRetain" -> ReplaceAndRetain
   | "ReplaceAndSnapshot" -> ReplaceAndSnapshot
   | _ -> failwith "unknown enum value"
    : policy_action)

let resource_change_of_xml i =
  let r_policy_action = ref None in
  let r_action = ref None in
  let r_logical_resource_id = ref None in
  let r_physical_resource_id = ref None in
  let r_resource_type = ref None in
  let r_replacement = ref None in
  let r_scope = ref None in
  let r_resource_drift_status = ref None in
  let r_resource_drift_ignored_attributes = ref None in
  let r_details = ref None in
  let r_change_set_id = ref None in
  let r_module_info = ref None in
  let r_before_context = ref None in
  let r_after_context = ref None in
  let r_previous_deployment_context = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PolicyAction";
      "Action";
      "LogicalResourceId";
      "PhysicalResourceId";
      "ResourceType";
      "Replacement";
      "Scope";
      "ResourceDriftStatus";
      "ResourceDriftIgnoredAttributes";
      "Details";
      "ChangeSetId";
      "ModuleInfo";
      "BeforeContext";
      "AfterContext";
      "PreviousDeploymentContext";
    ] (fun tag _ ->
      match tag with
      | "PolicyAction" ->
          r_policy_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyAction"
                 (fun i _ -> policy_action_of_xml i)
                 ())
      | "Action" ->
          r_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Action" (fun i _ -> change_action_of_xml i) ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "Replacement" ->
          r_replacement :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Replacement"
                 (fun i _ -> replacement_of_xml i)
                 ())
      | "Scope" ->
          r_scope :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Scope"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_attribute_of_xml i)
                     ())
                 ())
      | "ResourceDriftStatus" ->
          r_resource_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceDriftStatus"
                 (fun i _ -> stack_resource_drift_status_of_xml i)
                 ())
      | "ResourceDriftIgnoredAttributes" ->
          r_resource_drift_ignored_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceDriftIgnoredAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_drift_ignored_attribute_of_xml i)
                     ())
                 ())
      | "Details" ->
          r_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Details"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_change_detail_of_xml i)
                     ())
                 ())
      | "ChangeSetId" ->
          r_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "ModuleInfo" ->
          r_module_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModuleInfo"
                 (fun i _ -> module_info_of_xml i)
                 ())
      | "BeforeContext" ->
          r_before_context :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BeforeContext"
                 (fun i _ -> before_context_of_xml i)
                 ())
      | "AfterContext" ->
          r_after_context :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AfterContext"
                 (fun i _ -> after_context_of_xml i)
                 ())
      | "PreviousDeploymentContext" ->
          r_previous_deployment_context :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreviousDeploymentContext"
                 (fun i _ -> previous_deployment_context_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_action = ( ! ) r_policy_action;
     action = ( ! ) r_action;
     logical_resource_id = ( ! ) r_logical_resource_id;
     physical_resource_id = ( ! ) r_physical_resource_id;
     resource_type = ( ! ) r_resource_type;
     replacement = ( ! ) r_replacement;
     scope = ( ! ) r_scope;
     resource_drift_status = ( ! ) r_resource_drift_status;
     resource_drift_ignored_attributes = ( ! ) r_resource_drift_ignored_attributes;
     details = ( ! ) r_details;
     change_set_id = ( ! ) r_change_set_id;
     module_info = ( ! ) r_module_info;
     before_context = ( ! ) r_before_context;
     after_context = ( ! ) r_after_context;
     previous_deployment_context = ( ! ) r_previous_deployment_context;
   }
    : resource_change)

let hook_invocation_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let change_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Resource" -> Resource | _ -> failwith "unknown enum value" : change_type)

let change_of_xml i =
  let r_type_ = ref None in
  let r_hook_invocation_count = ref None in
  let r_resource_change = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Type"; "HookInvocationCount"; "ResourceChange" ]
    (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> change_type_of_xml i) ())
      | "HookInvocationCount" ->
          r_hook_invocation_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookInvocationCount"
                 (fun i _ -> hook_invocation_count_of_xml i)
                 ())
      | "ResourceChange" ->
          r_resource_change :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceChange"
                 (fun i _ -> resource_change_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     hook_invocation_count = ( ! ) r_hook_invocation_count;
     resource_change = ( ! ) r_resource_change;
   }
    : change)

let hook_target_type_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let change_set_hook_resource_target_details_of_xml i =
  let r_logical_resource_id = ref None in
  let r_resource_type = ref None in
  let r_resource_action = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LogicalResourceId"; "ResourceType"; "ResourceAction" ] (fun tag _ ->
      match tag with
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> hook_target_type_name_of_xml i)
                 ())
      | "ResourceAction" ->
          r_resource_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceAction"
                 (fun i _ -> change_action_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     logical_resource_id = ( ! ) r_logical_resource_id;
     resource_type = ( ! ) r_resource_type;
     resource_action = ( ! ) r_resource_action;
   }
    : change_set_hook_resource_target_details)

let hook_target_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "RESOURCE" -> RESOURCE | _ -> failwith "unknown enum value" : hook_target_type)

let change_set_hook_target_details_of_xml i =
  let r_target_type = ref None in
  let r_resource_target_details = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TargetType"; "ResourceTargetDetails" ]
    (fun tag _ ->
      match tag with
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> hook_target_type_of_xml i)
                 ())
      | "ResourceTargetDetails" ->
          r_resource_target_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTargetDetails"
                 (fun i _ -> change_set_hook_resource_target_details_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ target_type = ( ! ) r_target_type; resource_target_details = ( ! ) r_resource_target_details }
    : change_set_hook_target_details)

let hook_type_configuration_version_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let hook_type_version_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let hook_type_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let hook_failure_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "FAIL" -> FAIL | "WARN" -> WARN | _ -> failwith "unknown enum value"
    : hook_failure_mode)

let hook_invocation_point_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "PRE_PROVISION" -> PRE_PROVISION | _ -> failwith "unknown enum value"
    : hook_invocation_point)

let change_set_hook_of_xml i =
  let r_invocation_point = ref None in
  let r_failure_mode = ref None in
  let r_type_name = ref None in
  let r_type_version_id = ref None in
  let r_type_configuration_version_id = ref None in
  let r_target_details = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InvocationPoint";
      "FailureMode";
      "TypeName";
      "TypeVersionId";
      "TypeConfigurationVersionId";
      "TargetDetails";
    ] (fun tag _ ->
      match tag with
      | "InvocationPoint" ->
          r_invocation_point :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvocationPoint"
                 (fun i _ -> hook_invocation_point_of_xml i)
                 ())
      | "FailureMode" ->
          r_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName"
                 (fun i _ -> hook_type_name_of_xml i)
                 ())
      | "TypeVersionId" ->
          r_type_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeVersionId"
                 (fun i _ -> hook_type_version_id_of_xml i)
                 ())
      | "TypeConfigurationVersionId" ->
          r_type_configuration_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationVersionId"
                 (fun i _ -> hook_type_configuration_version_id_of_xml i)
                 ())
      | "TargetDetails" ->
          r_target_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDetails"
                 (fun i _ -> change_set_hook_target_details_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     invocation_point = ( ! ) r_invocation_point;
     failure_mode = ( ! ) r_failure_mode;
     type_name = ( ! ) r_type_name;
     type_version_id = ( ! ) r_type_version_id;
     type_configuration_version_id = ( ! ) r_type_configuration_version_id;
     target_details = ( ! ) r_target_details;
   }
    : change_set_hook)

let change_set_hooks_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> change_set_hook_of_xml i) ()

let change_set_hooks_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PLANNING" -> PLANNING
   | "PLANNED" -> PLANNED
   | "UNAVAILABLE" -> UNAVAILABLE
   | _ -> failwith "unknown enum value"
    : change_set_hooks_status)

let change_set_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let change_set_name_or_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let change_set_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : change_set_not_found_exception)

let change_set_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CREATE_PENDING" -> CREATE_PENDING
   | "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | "CREATE_COMPLETE" -> CREATE_COMPLETE
   | "DELETE_PENDING" -> DELETE_PENDING
   | "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | "DELETE_COMPLETE" -> DELETE_COMPLETE
   | "DELETE_FAILED" -> DELETE_FAILED
   | "FAILED" -> FAILED
   | _ -> failwith "unknown enum value"
    : change_set_status)

let change_set_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let import_existing_resources_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let include_nested_stacks_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let creation_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let execution_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "UNAVAILABLE" -> UNAVAILABLE
   | "AVAILABLE" -> AVAILABLE
   | "EXECUTE_IN_PROGRESS" -> EXECUTE_IN_PROGRESS
   | "EXECUTE_COMPLETE" -> EXECUTE_COMPLETE
   | "EXECUTE_FAILED" -> EXECUTE_FAILED
   | "OBSOLETE" -> OBSOLETE
   | _ -> failwith "unknown enum value"
    : execution_status)

let stack_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let change_set_summary_of_xml i =
  let r_stack_id = ref None in
  let r_stack_name = ref None in
  let r_change_set_id = ref None in
  let r_change_set_name = ref None in
  let r_execution_status = ref None in
  let r_status = ref None in
  let r_status_reason = ref None in
  let r_creation_time = ref None in
  let r_description = ref None in
  let r_include_nested_stacks = ref None in
  let r_parent_change_set_id = ref None in
  let r_root_change_set_id = ref None in
  let r_import_existing_resources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackId";
      "StackName";
      "ChangeSetId";
      "ChangeSetName";
      "ExecutionStatus";
      "Status";
      "StatusReason";
      "CreationTime";
      "Description";
      "IncludeNestedStacks";
      "ParentChangeSetId";
      "RootChangeSetId";
      "ImportExistingResources";
    ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "ChangeSetId" ->
          r_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_of_xml i)
                 ())
      | "ExecutionStatus" ->
          r_execution_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatus"
                 (fun i _ -> execution_status_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> change_set_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> change_set_status_reason_of_xml i)
                 ())
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "IncludeNestedStacks" ->
          r_include_nested_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeNestedStacks"
                 (fun i _ -> include_nested_stacks_of_xml i)
                 ())
      | "ParentChangeSetId" ->
          r_parent_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParentChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "RootChangeSetId" ->
          r_root_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RootChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "ImportExistingResources" ->
          r_import_existing_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImportExistingResources"
                 (fun i _ -> import_existing_resources_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_id = ( ! ) r_stack_id;
     stack_name = ( ! ) r_stack_name;
     change_set_id = ( ! ) r_change_set_id;
     change_set_name = ( ! ) r_change_set_name;
     execution_status = ( ! ) r_execution_status;
     status = ( ! ) r_status;
     status_reason = ( ! ) r_status_reason;
     creation_time = ( ! ) r_creation_time;
     description = ( ! ) r_description;
     include_nested_stacks = ( ! ) r_include_nested_stacks;
     parent_change_set_id = ( ! ) r_parent_change_set_id;
     root_change_set_id = ( ! ) r_root_change_set_id;
     import_existing_resources = ( ! ) r_import_existing_resources;
   }
    : change_set_summary)

let change_set_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> change_set_summary_of_xml i) ()

let change_set_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CREATE" -> CREATE
   | "UPDATE" -> UPDATE
   | "IMPORT" -> IMPORT
   | _ -> failwith "unknown enum value"
    : change_set_type)

let changes_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> change_of_xml i) ()
let client_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let transform_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let transforms_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> transform_name_of_xml i) ()

let no_echo_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let parameter_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let parameter_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let template_parameter_of_xml i =
  let r_parameter_key = ref None in
  let r_default_value = ref None in
  let r_no_echo = ref None in
  let r_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ParameterKey"; "DefaultValue"; "NoEcho"; "Description" ] (fun tag _ ->
      match tag with
      | "ParameterKey" ->
          r_parameter_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterKey"
                 (fun i _ -> parameter_key_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> parameter_value_of_xml i)
                 ())
      | "NoEcho" ->
          r_no_echo :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NoEcho" (fun i _ -> no_echo_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_key = ( ! ) r_parameter_key;
     default_value = ( ! ) r_default_value;
     no_echo = ( ! ) r_no_echo;
     description = ( ! ) r_description;
   }
    : template_parameter)

let template_parameters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> template_parameter_of_xml i) ()

let validate_template_output_of_xml i =
  let r_parameters = ref None in
  let r_description = ref None in
  let r_capabilities = ref None in
  let r_capabilities_reason = ref None in
  let r_declared_transforms = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Parameters"; "Description"; "Capabilities"; "CapabilitiesReason"; "DeclaredTransforms" ]
    (fun tag _ ->
      match tag with
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> template_parameter_of_xml i)
                     ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "CapabilitiesReason" ->
          r_capabilities_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapabilitiesReason"
                 (fun i _ -> capabilities_reason_of_xml i)
                 ())
      | "DeclaredTransforms" ->
          r_declared_transforms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeclaredTransforms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> transform_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameters = ( ! ) r_parameters;
     description = ( ! ) r_description;
     capabilities = ( ! ) r_capabilities;
     capabilities_reason = ( ! ) r_capabilities_reason;
     declared_transforms = ( ! ) r_declared_transforms;
   }
    : validate_template_output)

let template_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let template_body_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let validate_template_input_of_xml i =
  let r_template_body = ref None in
  let r_template_ur_l = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateBody"; "TemplateURL" ] (fun tag _ ->
      match tag with
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_body = ( ! ) r_template_body; template_ur_l = ( ! ) r_template_ur_l }
    : validate_template_input)

let update_termination_protection_output_of_xml i =
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackId" ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_id = ( ! ) r_stack_id } : update_termination_protection_output)

let stack_name_or_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let enable_termination_protection_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let update_termination_protection_input_of_xml i =
  let r_enable_termination_protection = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnableTerminationProtection"; "StackName" ]
    (fun tag _ ->
      match tag with
      | "EnableTerminationProtection" ->
          r_enable_termination_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableTerminationProtection"
                 (fun i _ -> enable_termination_protection_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enable_termination_protection =
       Smaws_Lib.Xml.Parse.required "EnableTerminationProtection"
         (( ! ) r_enable_termination_protection)
         i;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : update_termination_protection_input)

let stale_request_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : stale_request_exception)

let stack_set_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : stack_set_not_found_exception)

let stack_instance_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : stack_instance_not_found_exception)

let operation_in_progress_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : operation_in_progress_exception)

let operation_id_already_exists_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : operation_id_already_exists_exception)

let update_stack_set_output_of_xml i =
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationId" ] (fun tag _ ->
      match tag with
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_id = ( ! ) r_operation_id } : update_stack_set_output)

let managed_execution_nullable_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let managed_execution_of_xml i =
  let r_active = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Active" ] (fun tag _ ->
      match tag with
      | "Active" ->
          r_active :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Active"
                 (fun i _ -> managed_execution_nullable_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ active = ( ! ) r_active } : managed_execution)

let region_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let region_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ()

let permission_models_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SERVICE_MANAGED" -> SERVICE_MANAGED
   | "SELF_MANAGED" -> SELF_MANAGED
   | _ -> failwith "unknown enum value"
    : permission_models)

let organizational_unit_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let organizational_unit_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> organizational_unit_id_of_xml i) ()

let deployment_targets_of_xml i =
  let r_accounts = ref None in
  let r_accounts_url = ref None in
  let r_organizational_unit_ids = ref None in
  let r_account_filter_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Accounts"; "AccountsUrl"; "OrganizationalUnitIds"; "AccountFilterType" ] (fun tag _ ->
      match tag with
      | "Accounts" ->
          r_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Accounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ())
                 ())
      | "AccountsUrl" ->
          r_accounts_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountsUrl"
                 (fun i _ -> accounts_url_of_xml i)
                 ())
      | "OrganizationalUnitIds" ->
          r_organizational_unit_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationalUnitIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> organizational_unit_id_of_xml i)
                     ())
                 ())
      | "AccountFilterType" ->
          r_account_filter_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountFilterType"
                 (fun i _ -> account_filter_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     accounts = ( ! ) r_accounts;
     accounts_url = ( ! ) r_accounts_url;
     organizational_unit_ids = ( ! ) r_organizational_unit_ids;
     account_filter_type = ( ! ) r_account_filter_type;
   }
    : deployment_targets)

let execution_role_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let role_ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let concurrency_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "STRICT_FAILURE_TOLERANCE" -> STRICT_FAILURE_TOLERANCE
   | "SOFT_FAILURE_TOLERANCE" -> SOFT_FAILURE_TOLERANCE
   | _ -> failwith "unknown enum value"
    : concurrency_mode)

let max_concurrent_percentage_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_concurrent_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let failure_tolerance_percentage_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let failure_tolerance_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let region_concurrency_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SEQUENTIAL" -> SEQUENTIAL
   | "PARALLEL" -> PARALLEL
   | _ -> failwith "unknown enum value"
    : region_concurrency_type)

let stack_set_operation_preferences_of_xml i =
  let r_region_concurrency_type = ref None in
  let r_region_order = ref None in
  let r_failure_tolerance_count = ref None in
  let r_failure_tolerance_percentage = ref None in
  let r_max_concurrent_count = ref None in
  let r_max_concurrent_percentage = ref None in
  let r_concurrency_mode = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RegionConcurrencyType";
      "RegionOrder";
      "FailureToleranceCount";
      "FailureTolerancePercentage";
      "MaxConcurrentCount";
      "MaxConcurrentPercentage";
      "ConcurrencyMode";
    ] (fun tag _ ->
      match tag with
      | "RegionConcurrencyType" ->
          r_region_concurrency_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegionConcurrencyType"
                 (fun i _ -> region_concurrency_type_of_xml i)
                 ())
      | "RegionOrder" ->
          r_region_order :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegionOrder"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "FailureToleranceCount" ->
          r_failure_tolerance_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureToleranceCount"
                 (fun i _ -> failure_tolerance_count_of_xml i)
                 ())
      | "FailureTolerancePercentage" ->
          r_failure_tolerance_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureTolerancePercentage"
                 (fun i _ -> failure_tolerance_percentage_of_xml i)
                 ())
      | "MaxConcurrentCount" ->
          r_max_concurrent_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxConcurrentCount"
                 (fun i _ -> max_concurrent_count_of_xml i)
                 ())
      | "MaxConcurrentPercentage" ->
          r_max_concurrent_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxConcurrentPercentage"
                 (fun i _ -> max_concurrent_percentage_of_xml i)
                 ())
      | "ConcurrencyMode" ->
          r_concurrency_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConcurrencyMode"
                 (fun i _ -> concurrency_mode_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     region_concurrency_type = ( ! ) r_region_concurrency_type;
     region_order = ( ! ) r_region_order;
     failure_tolerance_count = ( ! ) r_failure_tolerance_count;
     failure_tolerance_percentage = ( ! ) r_failure_tolerance_percentage;
     max_concurrent_count = ( ! ) r_max_concurrent_count;
     max_concurrent_percentage = ( ! ) r_max_concurrent_percentage;
     concurrency_mode = ( ! ) r_concurrency_mode;
   }
    : stack_set_operation_preferences)

let tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_of_xml i =
  let r_key = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Key"; "Value" ] (fun tag _ ->
      match tag with
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_of_xml i) ())
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i;
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
   }
    : tag)

let tags_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let use_previous_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let parameter_of_xml i =
  let r_parameter_key = ref None in
  let r_parameter_value = ref None in
  let r_use_previous_value = ref None in
  let r_resolved_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ParameterKey"; "ParameterValue"; "UsePreviousValue"; "ResolvedValue" ] (fun tag _ ->
      match tag with
      | "ParameterKey" ->
          r_parameter_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterKey"
                 (fun i _ -> parameter_key_of_xml i)
                 ())
      | "ParameterValue" ->
          r_parameter_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterValue"
                 (fun i _ -> parameter_value_of_xml i)
                 ())
      | "UsePreviousValue" ->
          r_use_previous_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsePreviousValue"
                 (fun i _ -> use_previous_value_of_xml i)
                 ())
      | "ResolvedValue" ->
          r_resolved_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResolvedValue"
                 (fun i _ -> parameter_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_key = ( ! ) r_parameter_key;
     parameter_value = ( ! ) r_parameter_value;
     use_previous_value = ( ! ) r_use_previous_value;
     resolved_value = ( ! ) r_resolved_value;
   }
    : parameter)

let parameters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ()

let use_previous_template_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let stack_set_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_stack_set_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_description = ref None in
  let r_template_body = ref None in
  let r_template_ur_l = ref None in
  let r_use_previous_template = ref None in
  let r_parameters = ref None in
  let r_capabilities = ref None in
  let r_tags = ref None in
  let r_operation_preferences = ref None in
  let r_administration_role_ar_n = ref None in
  let r_execution_role_name = ref None in
  let r_deployment_targets = ref None in
  let r_permission_model = ref None in
  let r_auto_deployment = ref None in
  let r_operation_id = ref None in
  let r_accounts = ref None in
  let r_regions = ref None in
  let r_call_as = ref None in
  let r_managed_execution = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetName";
      "Description";
      "TemplateBody";
      "TemplateURL";
      "UsePreviousTemplate";
      "Parameters";
      "Capabilities";
      "Tags";
      "OperationPreferences";
      "AdministrationRoleARN";
      "ExecutionRoleName";
      "DeploymentTargets";
      "PermissionModel";
      "AutoDeployment";
      "OperationId";
      "Accounts";
      "Regions";
      "CallAs";
      "ManagedExecution";
    ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "UsePreviousTemplate" ->
          r_use_previous_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsePreviousTemplate"
                 (fun i _ -> use_previous_template_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "AdministrationRoleARN" ->
          r_administration_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdministrationRoleARN"
                 (fun i _ -> role_ar_n_of_xml i)
                 ())
      | "ExecutionRoleName" ->
          r_execution_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleName"
                 (fun i _ -> execution_role_name_of_xml i)
                 ())
      | "DeploymentTargets" ->
          r_deployment_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTargets"
                 (fun i _ -> deployment_targets_of_xml i)
                 ())
      | "PermissionModel" ->
          r_permission_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionModel"
                 (fun i _ -> permission_models_of_xml i)
                 ())
      | "AutoDeployment" ->
          r_auto_deployment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoDeployment"
                 (fun i _ -> auto_deployment_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "Accounts" ->
          r_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Accounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ())
                 ())
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "ManagedExecution" ->
          r_managed_execution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedExecution"
                 (fun i _ -> managed_execution_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     description = ( ! ) r_description;
     template_body = ( ! ) r_template_body;
     template_ur_l = ( ! ) r_template_ur_l;
     use_previous_template = ( ! ) r_use_previous_template;
     parameters = ( ! ) r_parameters;
     capabilities = ( ! ) r_capabilities;
     tags = ( ! ) r_tags;
     operation_preferences = ( ! ) r_operation_preferences;
     administration_role_ar_n = ( ! ) r_administration_role_ar_n;
     execution_role_name = ( ! ) r_execution_role_name;
     deployment_targets = ( ! ) r_deployment_targets;
     permission_model = ( ! ) r_permission_model;
     auto_deployment = ( ! ) r_auto_deployment;
     operation_id = ( ! ) r_operation_id;
     accounts = ( ! ) r_accounts;
     regions = ( ! ) r_regions;
     call_as = ( ! ) r_call_as;
     managed_execution = ( ! ) r_managed_execution;
   }
    : update_stack_set_input)

let update_stack_instances_output_of_xml i =
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationId" ] (fun tag _ ->
      match tag with
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_id = ( ! ) r_operation_id } : update_stack_instances_output)

let stack_set_name_or_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_stack_instances_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_accounts = ref None in
  let r_deployment_targets = ref None in
  let r_regions = ref None in
  let r_parameter_overrides = ref None in
  let r_operation_preferences = ref None in
  let r_operation_id = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetName";
      "Accounts";
      "DeploymentTargets";
      "Regions";
      "ParameterOverrides";
      "OperationPreferences";
      "OperationId";
      "CallAs";
    ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | "Accounts" ->
          r_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Accounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ())
                 ())
      | "DeploymentTargets" ->
          r_deployment_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTargets"
                 (fun i _ -> deployment_targets_of_xml i)
                 ())
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "ParameterOverrides" ->
          r_parameter_overrides :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterOverrides"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     accounts = ( ! ) r_accounts;
     deployment_targets = ( ! ) r_deployment_targets;
     regions = Smaws_Lib.Xml.Parse.required "Regions" (( ! ) r_regions) i;
     parameter_overrides = ( ! ) r_parameter_overrides;
     operation_preferences = ( ! ) r_operation_preferences;
     operation_id = ( ! ) r_operation_id;
     call_as = ( ! ) r_call_as;
   }
    : update_stack_instances_input)

let insufficient_capabilities_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : insufficient_capabilities_exception)

let operation_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_stack_output_of_xml i =
  let r_stack_id = ref None in
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackId"; "OperationId" ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_id = ( ! ) r_stack_id; operation_id = ( ! ) r_operation_id } : update_stack_output)

let disable_validation_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let disable_rollback_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let deployment_config_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "STANDARD" -> STANDARD | "EXPRESS" -> EXPRESS | _ -> failwith "unknown enum value"
    : deployment_config_mode)

let deployment_config_of_xml i =
  let r_mode = ref None in
  let r_disable_rollback = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Mode"; "DisableRollback" ] (fun tag _ ->
      match tag with
      | "Mode" ->
          r_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Mode"
                 (fun i _ -> deployment_config_mode_of_xml i)
                 ())
      | "DisableRollback" ->
          r_disable_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableRollback"
                 (fun i _ -> disable_rollback_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ mode = ( ! ) r_mode; disable_rollback = ( ! ) r_disable_rollback } : deployment_config)

let retain_except_on_create_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let notification_ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let notification_ar_ns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> notification_ar_n_of_xml i) ()

let stack_policy_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let stack_policy_body_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let monitoring_time_in_minutes_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let type__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let rollback_trigger_of_xml i =
  let r_arn = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Arn"; "Type" ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> type__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
     type_ = Smaws_Lib.Xml.Parse.required "Type" (( ! ) r_type_) i;
   }
    : rollback_trigger)

let rollback_triggers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rollback_trigger_of_xml i) ()

let rollback_configuration_of_xml i =
  let r_rollback_triggers = ref None in
  let r_monitoring_time_in_minutes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RollbackTriggers"; "MonitoringTimeInMinutes" ]
    (fun tag _ ->
      match tag with
      | "RollbackTriggers" ->
          r_rollback_triggers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackTriggers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> rollback_trigger_of_xml i)
                     ())
                 ())
      | "MonitoringTimeInMinutes" ->
          r_monitoring_time_in_minutes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MonitoringTimeInMinutes"
                 (fun i _ -> monitoring_time_in_minutes_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     rollback_triggers = ( ! ) r_rollback_triggers;
     monitoring_time_in_minutes = ( ! ) r_monitoring_time_in_minutes;
   }
    : rollback_configuration)

let resource_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_type_of_xml i) ()

let stack_policy_during_update_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let stack_policy_during_update_body_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_stack_input_of_xml i =
  let r_stack_name = ref None in
  let r_template_body = ref None in
  let r_template_ur_l = ref None in
  let r_use_previous_template = ref None in
  let r_stack_policy_during_update_body = ref None in
  let r_stack_policy_during_update_ur_l = ref None in
  let r_parameters = ref None in
  let r_capabilities = ref None in
  let r_resource_types = ref None in
  let r_role_ar_n = ref None in
  let r_rollback_configuration = ref None in
  let r_stack_policy_body = ref None in
  let r_stack_policy_ur_l = ref None in
  let r_notification_ar_ns = ref None in
  let r_tags = ref None in
  let r_disable_rollback = ref None in
  let r_client_request_token = ref None in
  let r_retain_except_on_create = ref None in
  let r_deployment_config = ref None in
  let r_disable_validation = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackName";
      "TemplateBody";
      "TemplateURL";
      "UsePreviousTemplate";
      "StackPolicyDuringUpdateBody";
      "StackPolicyDuringUpdateURL";
      "Parameters";
      "Capabilities";
      "ResourceTypes";
      "RoleARN";
      "RollbackConfiguration";
      "StackPolicyBody";
      "StackPolicyURL";
      "NotificationARNs";
      "Tags";
      "DisableRollback";
      "ClientRequestToken";
      "RetainExceptOnCreate";
      "DeploymentConfig";
      "DisableValidation";
    ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "UsePreviousTemplate" ->
          r_use_previous_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsePreviousTemplate"
                 (fun i _ -> use_previous_template_of_xml i)
                 ())
      | "StackPolicyDuringUpdateBody" ->
          r_stack_policy_during_update_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyDuringUpdateBody"
                 (fun i _ -> stack_policy_during_update_body_of_xml i)
                 ())
      | "StackPolicyDuringUpdateURL" ->
          r_stack_policy_during_update_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyDuringUpdateURL"
                 (fun i _ -> stack_policy_during_update_ur_l_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "ResourceTypes" ->
          r_resource_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_type_of_xml i)
                     ())
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "RollbackConfiguration" ->
          r_rollback_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackConfiguration"
                 (fun i _ -> rollback_configuration_of_xml i)
                 ())
      | "StackPolicyBody" ->
          r_stack_policy_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyBody"
                 (fun i _ -> stack_policy_body_of_xml i)
                 ())
      | "StackPolicyURL" ->
          r_stack_policy_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyURL"
                 (fun i _ -> stack_policy_ur_l_of_xml i)
                 ())
      | "NotificationARNs" ->
          r_notification_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> notification_ar_n_of_xml i)
                     ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "DisableRollback" ->
          r_disable_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableRollback"
                 (fun i _ -> disable_rollback_of_xml i)
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "RetainExceptOnCreate" ->
          r_retain_except_on_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainExceptOnCreate"
                 (fun i _ -> retain_except_on_create_of_xml i)
                 ())
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | "DisableValidation" ->
          r_disable_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableValidation"
                 (fun i _ -> disable_validation_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     template_body = ( ! ) r_template_body;
     template_ur_l = ( ! ) r_template_ur_l;
     use_previous_template = ( ! ) r_use_previous_template;
     stack_policy_during_update_body = ( ! ) r_stack_policy_during_update_body;
     stack_policy_during_update_ur_l = ( ! ) r_stack_policy_during_update_ur_l;
     parameters = ( ! ) r_parameters;
     capabilities = ( ! ) r_capabilities;
     resource_types = ( ! ) r_resource_types;
     role_ar_n = ( ! ) r_role_ar_n;
     rollback_configuration = ( ! ) r_rollback_configuration;
     stack_policy_body = ( ! ) r_stack_policy_body;
     stack_policy_ur_l = ( ! ) r_stack_policy_ur_l;
     notification_ar_ns = ( ! ) r_notification_ar_ns;
     tags = ( ! ) r_tags;
     disable_rollback = ( ! ) r_disable_rollback;
     client_request_token = ( ! ) r_client_request_token;
     retain_except_on_create = ( ! ) r_retain_except_on_create;
     deployment_config = ( ! ) r_deployment_config;
     disable_validation = ( ! ) r_disable_validation;
   }
    : update_stack_input)

let limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : limit_exceeded_exception)

let generated_template_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : generated_template_not_found_exception)

let generated_template_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_generated_template_output_of_xml i =
  let r_generated_template_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GeneratedTemplateId" ] (fun tag _ ->
      match tag with
      | "GeneratedTemplateId" ->
          r_generated_template_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateId"
                 (fun i _ -> generated_template_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ generated_template_id = ( ! ) r_generated_template_id } : update_generated_template_output)

let generated_template_update_replace_policy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "DELETE" -> DELETE | "RETAIN" -> RETAIN | _ -> failwith "unknown enum value"
    : generated_template_update_replace_policy)

let generated_template_deletion_policy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "DELETE" -> DELETE | "RETAIN" -> RETAIN | _ -> failwith "unknown enum value"
    : generated_template_deletion_policy)

let template_configuration_of_xml i =
  let r_deletion_policy = ref None in
  let r_update_replace_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DeletionPolicy"; "UpdateReplacePolicy" ]
    (fun tag _ ->
      match tag with
      | "DeletionPolicy" ->
          r_deletion_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionPolicy"
                 (fun i _ -> generated_template_deletion_policy_of_xml i)
                 ())
      | "UpdateReplacePolicy" ->
          r_update_replace_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateReplacePolicy"
                 (fun i _ -> generated_template_update_replace_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deletion_policy = ( ! ) r_deletion_policy;
     update_replace_policy = ( ! ) r_update_replace_policy;
   }
    : template_configuration)

let refresh_all_resources_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let jazz_logical_resource_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> logical_resource_id_of_xml i) ()

let resource_identifier_property_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_identifier_property_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_identifier_properties_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k =
        Smaws_Lib.Xml.Parse.Read.sequence i "key"
          (fun i _ -> resource_identifier_property_key_of_xml i)
          ()
      in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> resource_identifier_property_value_of_xml i)
          ()
      in
      (k, v))
    ()

let resource_definition_of_xml i =
  let r_resource_type = ref None in
  let r_logical_resource_id = ref None in
  let r_resource_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceType"; "LogicalResourceId"; "ResourceIdentifier" ] (fun tag _ ->
      match tag with
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> resource_identifier_property_key_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> resource_identifier_property_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     logical_resource_id = ( ! ) r_logical_resource_id;
     resource_identifier =
       Smaws_Lib.Xml.Parse.required "ResourceIdentifier" (( ! ) r_resource_identifier) i;
   }
    : resource_definition)

let resource_definitions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_definition_of_xml i) ()

let generated_template_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_generated_template_input_of_xml i =
  let r_generated_template_name = ref None in
  let r_new_generated_template_name = ref None in
  let r_add_resources = ref None in
  let r_remove_resources = ref None in
  let r_refresh_all_resources = ref None in
  let r_template_configuration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "GeneratedTemplateName";
      "NewGeneratedTemplateName";
      "AddResources";
      "RemoveResources";
      "RefreshAllResources";
      "TemplateConfiguration";
    ] (fun tag _ ->
      match tag with
      | "GeneratedTemplateName" ->
          r_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | "NewGeneratedTemplateName" ->
          r_new_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewGeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | "AddResources" ->
          r_add_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AddResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_definition_of_xml i)
                     ())
                 ())
      | "RemoveResources" ->
          r_remove_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemoveResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> logical_resource_id_of_xml i)
                     ())
                 ())
      | "RefreshAllResources" ->
          r_refresh_all_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RefreshAllResources"
                 (fun i _ -> refresh_all_resources_of_xml i)
                 ())
      | "TemplateConfiguration" ->
          r_template_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateConfiguration"
                 (fun i _ -> template_configuration_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     generated_template_name =
       Smaws_Lib.Xml.Parse.required "GeneratedTemplateName" (( ! ) r_generated_template_name) i;
     new_generated_template_name = ( ! ) r_new_generated_template_name;
     add_resources = ( ! ) r_add_resources;
     remove_resources = ( ! ) r_remove_resources;
     refresh_all_resources = ( ! ) r_refresh_all_resources;
     template_configuration = ( ! ) r_template_configuration;
   }
    : update_generated_template_input)

let test_type_output_of_xml i =
  let r_type_version_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TypeVersionArn" ] (fun tag _ ->
      match tag with
      | "TypeVersionArn" ->
          r_type_version_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeVersionArn"
                 (fun i _ -> type_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ type_version_arn = ( ! ) r_type_version_arn } : test_type_output)

let s3_bucket_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let type_version_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let test_type_input_of_xml i =
  let r_arn = ref None in
  let r_type_ = ref None in
  let r_type_name = ref None in
  let r_version_id = ref None in
  let r_log_delivery_bucket = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Arn"; "Type"; "TypeName"; "VersionId"; "LogDeliveryBucket" ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> type_arn_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "LogDeliveryBucket" ->
          r_log_delivery_bucket :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDeliveryBucket"
                 (fun i _ -> s3_bucket_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = ( ! ) r_arn;
     type_ = ( ! ) r_type_;
     type_name = ( ! ) r_type_name;
     version_id = ( ! ) r_version_id;
     log_delivery_bucket = ( ! ) r_log_delivery_bucket;
   }
    : test_type_input)

let stop_stack_set_operation_output_of_xml i = ()

let stop_stack_set_operation_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_operation_id = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackSetName"; "OperationId"; "CallAs" ]
    (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     operation_id = Smaws_Lib.Xml.Parse.required "OperationId" (( ! ) r_operation_id) i;
     call_as = ( ! ) r_call_as;
   }
    : stop_stack_set_operation_input)

let resource_scan_limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_scan_limit_exceeded_exception)

let resource_scan_in_progress_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_scan_in_progress_exception)

let resource_scan_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let start_resource_scan_output_of_xml i =
  let r_resource_scan_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceScanId" ] (fun tag _ ->
      match tag with
      | "ResourceScanId" ->
          r_resource_scan_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanId"
                 (fun i _ -> resource_scan_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_scan_id = ( ! ) r_resource_scan_id } : start_resource_scan_output)

let resource_type_filter_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_type_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_type_filter_of_xml i) ()

let scan_filter_of_xml i =
  let r_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Types" ] (fun tag _ ->
      match tag with
      | "Types" ->
          r_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Types"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_type_filter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ types = ( ! ) r_types } : scan_filter)

let scan_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> scan_filter_of_xml i) ()

let start_resource_scan_input_of_xml i =
  let r_client_request_token = ref None in
  let r_scan_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClientRequestToken"; "ScanFilters" ] (fun tag _ ->
      match tag with
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "ScanFilters" ->
          r_scan_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScanFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scan_filter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ client_request_token = ( ! ) r_client_request_token; scan_filters = ( ! ) r_scan_filters }
    : start_resource_scan_input)

let resource_signal_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "SUCCESS" -> SUCCESS | "FAILURE" -> FAILURE | _ -> failwith "unknown enum value"
    : resource_signal_status)

let resource_signal_unique_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let signal_resource_input_of_xml i =
  let r_stack_name = ref None in
  let r_logical_resource_id = ref None in
  let r_unique_id = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackName"; "LogicalResourceId"; "UniqueId"; "Status" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "UniqueId" ->
          r_unique_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UniqueId"
                 (fun i _ -> resource_signal_unique_id_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> resource_signal_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     unique_id = Smaws_Lib.Xml.Parse.required "UniqueId" (( ! ) r_unique_id) i;
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
   }
    : signal_resource_input)

let set_type_default_version_output_of_xml i = ()

let registry_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "RESOURCE" -> RESOURCE
   | "MODULE" -> MODULE
   | "HOOK" -> HOOK
   | _ -> failwith "unknown enum value"
    : registry_type)

let set_type_default_version_input_of_xml i =
  let r_arn = ref None in
  let r_type_ = ref None in
  let r_type_name = ref None in
  let r_version_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Arn"; "Type"; "TypeName"; "VersionId" ]
    (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> private_type_arn_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = ( ! ) r_arn;
     type_ = ( ! ) r_type_;
     type_name = ( ! ) r_type_name;
     version_id = ( ! ) r_version_id;
   }
    : set_type_default_version_input)

let set_type_configuration_output_of_xml i =
  let r_configuration_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationArn" ] (fun tag _ ->
      match tag with
      | "ConfigurationArn" ->
          r_configuration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationArn"
                 (fun i _ -> type_configuration_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ configuration_arn = ( ! ) r_configuration_arn } : set_type_configuration_output)

let set_type_configuration_input_of_xml i =
  let r_type_arn = ref None in
  let r_configuration = ref None in
  let r_configuration_alias = ref None in
  let r_type_name = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TypeArn"; "Configuration"; "ConfigurationAlias"; "TypeName"; "Type" ] (fun tag _ ->
      match tag with
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | "Configuration" ->
          r_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Configuration"
                 (fun i _ -> type_configuration_of_xml i)
                 ())
      | "ConfigurationAlias" ->
          r_configuration_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationAlias"
                 (fun i _ -> type_configuration_alias_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_arn = ( ! ) r_type_arn;
     configuration = Smaws_Lib.Xml.Parse.required "Configuration" (( ! ) r_configuration) i;
     configuration_alias = ( ! ) r_configuration_alias;
     type_name = ( ! ) r_type_name;
     type_ = ( ! ) r_type_;
   }
    : set_type_configuration_input)

let set_stack_policy_input_of_xml i =
  let r_stack_name = ref None in
  let r_stack_policy_body = ref None in
  let r_stack_policy_ur_l = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "StackPolicyBody"; "StackPolicyURL" ]
    (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "StackPolicyBody" ->
          r_stack_policy_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyBody"
                 (fun i _ -> stack_policy_body_of_xml i)
                 ())
      | "StackPolicyURL" ->
          r_stack_policy_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyURL"
                 (fun i _ -> stack_policy_ur_l_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     stack_policy_body = ( ! ) r_stack_policy_body;
     stack_policy_ur_l = ( ! ) r_stack_policy_ur_l;
   }
    : set_stack_policy_input)

let rollback_stack_output_of_xml i =
  let r_stack_id = ref None in
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackId"; "OperationId" ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_id = ( ! ) r_stack_id; operation_id = ( ! ) r_operation_id } : rollback_stack_output)

let rollback_stack_input_of_xml i =
  let r_stack_name = ref None in
  let r_role_ar_n = ref None in
  let r_client_request_token = ref None in
  let r_retain_except_on_create = ref None in
  let r_deployment_config = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackName"; "RoleARN"; "ClientRequestToken"; "RetainExceptOnCreate"; "DeploymentConfig" ]
    (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "RetainExceptOnCreate" ->
          r_retain_except_on_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainExceptOnCreate"
                 (fun i _ -> retain_except_on_create_of_xml i)
                 ())
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     role_ar_n = ( ! ) r_role_ar_n;
     client_request_token = ( ! ) r_client_request_token;
     retain_except_on_create = ( ! ) r_retain_except_on_create;
     deployment_config = ( ! ) r_deployment_config;
   }
    : rollback_stack_input)

let registration_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let register_type_output_of_xml i =
  let r_registration_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RegistrationToken" ] (fun tag _ ->
      match tag with
      | "RegistrationToken" ->
          r_registration_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegistrationToken"
                 (fun i _ -> registration_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ registration_token = ( ! ) r_registration_token } : register_type_output)

let request_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let s3_url_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let register_type_input_of_xml i =
  let r_type_ = ref None in
  let r_type_name = ref None in
  let r_schema_handler_package = ref None in
  let r_logging_config = ref None in
  let r_execution_role_arn = ref None in
  let r_client_request_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Type";
      "TypeName";
      "SchemaHandlerPackage";
      "LoggingConfig";
      "ExecutionRoleArn";
      "ClientRequestToken";
    ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "SchemaHandlerPackage" ->
          r_schema_handler_package :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SchemaHandlerPackage"
                 (fun i _ -> s3_url_of_xml i)
                 ())
      | "LoggingConfig" ->
          r_logging_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoggingConfig"
                 (fun i _ -> logging_config_of_xml i)
                 ())
      | "ExecutionRoleArn" ->
          r_execution_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleArn"
                 (fun i _ -> role_ar_n2_of_xml i)
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     type_name = Smaws_Lib.Xml.Parse.required "TypeName" (( ! ) r_type_name) i;
     schema_handler_package =
       Smaws_Lib.Xml.Parse.required "SchemaHandlerPackage" (( ! ) r_schema_handler_package) i;
     logging_config = ( ! ) r_logging_config;
     execution_role_arn = ( ! ) r_execution_role_arn;
     client_request_token = ( ! ) r_client_request_token;
   }
    : register_type_input)

let register_publisher_output_of_xml i =
  let r_publisher_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PublisherId" ] (fun tag _ ->
      match tag with
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ publisher_id = ( ! ) r_publisher_id } : register_publisher_output)

let connection_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let register_publisher_input_of_xml i =
  let r_accept_terms_and_conditions = ref None in
  let r_connection_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AcceptTermsAndConditions"; "ConnectionArn" ]
    (fun tag _ ->
      match tag with
      | "AcceptTermsAndConditions" ->
          r_accept_terms_and_conditions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceptTermsAndConditions"
                 (fun i _ -> accept_terms_and_conditions_of_xml i)
                 ())
      | "ConnectionArn" ->
          r_connection_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConnectionArn"
                 (fun i _ -> connection_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     accept_terms_and_conditions = ( ! ) r_accept_terms_and_conditions;
     connection_arn = ( ! ) r_connection_arn;
   }
    : register_publisher_input)

let operation_status_check_failed_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : operation_status_check_failed_exception)

let invalid_state_transition_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_state_transition_exception)

let record_handler_progress_output_of_xml i = ()
let resource_model_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let handler_error_code_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "NotUpdatable" -> NotUpdatable
   | "InvalidRequest" -> InvalidRequest
   | "AccessDenied" -> AccessDenied
   | "InvalidCredentials" -> InvalidCredentials
   | "AlreadyExists" -> AlreadyExists
   | "NotFound" -> NotFound
   | "ResourceConflict" -> ResourceConflict
   | "Throttling" -> Throttling
   | "ServiceLimitExceeded" -> ServiceLimitExceeded
   | "NotStabilized" -> ServiceTimeout
   | "GeneralServiceException" -> GeneralServiceException
   | "ServiceInternalError" -> ServiceInternalError
   | "NetworkFailure" -> NetworkFailure
   | "InternalFailure" -> InternalFailure
   | "InvalidTypeConfiguration" -> InvalidTypeConfiguration
   | "HandlerInternalFailure" -> HandlerInternalFailure
   | "NonCompliant" -> NonCompliant
   | "Unknown" -> Unknown
   | "UnsupportedTarget" -> UnsupportedTarget
   | _ -> failwith "unknown enum value"
    : handler_error_code)

let status_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let operation_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PENDING" -> PENDING
   | "IN_PROGRESS" -> IN_PROGRESS
   | "SUCCESS" -> SUCCESS
   | "FAILED" -> FAILED
   | _ -> failwith "unknown enum value"
    : operation_status)

let record_handler_progress_input_of_xml i =
  let r_bearer_token = ref None in
  let r_operation_status = ref None in
  let r_current_operation_status = ref None in
  let r_status_message = ref None in
  let r_error_code = ref None in
  let r_resource_model = ref None in
  let r_client_request_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "BearerToken";
      "OperationStatus";
      "CurrentOperationStatus";
      "StatusMessage";
      "ErrorCode";
      "ResourceModel";
      "ClientRequestToken";
    ] (fun tag _ ->
      match tag with
      | "BearerToken" ->
          r_bearer_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BearerToken"
                 (fun i _ -> client_token_of_xml i)
                 ())
      | "OperationStatus" ->
          r_operation_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationStatus"
                 (fun i _ -> operation_status_of_xml i)
                 ())
      | "CurrentOperationStatus" ->
          r_current_operation_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentOperationStatus"
                 (fun i _ -> operation_status_of_xml i)
                 ())
      | "StatusMessage" ->
          r_status_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusMessage"
                 (fun i _ -> status_message_of_xml i)
                 ())
      | "ErrorCode" ->
          r_error_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorCode"
                 (fun i _ -> handler_error_code_of_xml i)
                 ())
      | "ResourceModel" ->
          r_resource_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceModel"
                 (fun i _ -> resource_model_of_xml i)
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     bearer_token = Smaws_Lib.Xml.Parse.required "BearerToken" (( ! ) r_bearer_token) i;
     operation_status = Smaws_Lib.Xml.Parse.required "OperationStatus" (( ! ) r_operation_status) i;
     current_operation_status = ( ! ) r_current_operation_status;
     status_message = ( ! ) r_status_message;
     error_code = ( ! ) r_error_code;
     resource_model = ( ! ) r_resource_model;
     client_request_token = ( ! ) r_client_request_token;
   }
    : record_handler_progress_input)

let publish_type_output_of_xml i =
  let r_public_type_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PublicTypeArn" ] (fun tag _ ->
      match tag with
      | "PublicTypeArn" ->
          r_public_type_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicTypeArn"
                 (fun i _ -> type_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ public_type_arn = ( ! ) r_public_type_arn } : publish_type_output)

let public_version_number_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let publish_type_input_of_xml i =
  let r_type_ = ref None in
  let r_arn = ref None in
  let r_type_name = ref None in
  let r_public_version_number = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Type"; "Arn"; "TypeName"; "PublicVersionNumber" ]
    (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> private_type_arn_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "PublicVersionNumber" ->
          r_public_version_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicVersionNumber"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     arn = ( ! ) r_arn;
     type_name = ( ! ) r_type_name;
     public_version_number = ( ! ) r_public_version_number;
   }
    : publish_type_input)

let next_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let is_default_version_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let type_version_summary_of_xml i =
  let r_type_ = ref None in
  let r_type_name = ref None in
  let r_version_id = ref None in
  let r_is_default_version = ref None in
  let r_arn = ref None in
  let r_time_created = ref None in
  let r_description = ref None in
  let r_public_version_number = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Type";
      "TypeName";
      "VersionId";
      "IsDefaultVersion";
      "Arn";
      "TimeCreated";
      "Description";
      "PublicVersionNumber";
    ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "IsDefaultVersion" ->
          r_is_default_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsDefaultVersion"
                 (fun i _ -> is_default_version_of_xml i)
                 ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> type_arn_of_xml i) ())
      | "TimeCreated" ->
          r_time_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeCreated" (fun i _ -> timestamp_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "PublicVersionNumber" ->
          r_public_version_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicVersionNumber"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     type_name = ( ! ) r_type_name;
     version_id = ( ! ) r_version_id;
     is_default_version = ( ! ) r_is_default_version;
     arn = ( ! ) r_arn;
     time_created = ( ! ) r_time_created;
     description = ( ! ) r_description;
     public_version_number = ( ! ) r_public_version_number;
   }
    : type_version_summary)

let type_version_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> type_version_summary_of_xml i) ()

let list_type_versions_output_of_xml i =
  let r_type_version_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TypeVersionSummaries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "TypeVersionSummaries" ->
          r_type_version_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeVersionSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> type_version_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ type_version_summaries = ( ! ) r_type_version_summaries; next_token = ( ! ) r_next_token }
    : list_type_versions_output)

let deprecated_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "LIVE" -> LIVE | "DEPRECATED" -> DEPRECATED | _ -> failwith "unknown enum value"
    : deprecated_status)

let max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_type_versions_input_of_xml i =
  let r_type_ = ref None in
  let r_type_name = ref None in
  let r_arn = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_deprecated_status = ref None in
  let r_publisher_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Type"; "TypeName"; "Arn"; "MaxResults"; "NextToken"; "DeprecatedStatus"; "PublisherId" ]
    (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> type_arn_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "DeprecatedStatus" ->
          r_deprecated_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeprecatedStatus"
                 (fun i _ -> deprecated_status_of_xml i)
                 ())
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     type_name = ( ! ) r_type_name;
     arn = ( ! ) r_arn;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     deprecated_status = ( ! ) r_deprecated_status;
     publisher_id = ( ! ) r_publisher_id;
   }
    : list_type_versions_input)

let is_activated_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let publisher_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let identity_provider_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "AWS_Marketplace" -> AWS_Marketplace
   | "GitHub" -> GitHub
   | "Bitbucket" -> Bitbucket
   | _ -> failwith "unknown enum value"
    : identity_provider)

let type_summary_of_xml i =
  let r_type_ = ref None in
  let r_type_name = ref None in
  let r_default_version_id = ref None in
  let r_type_arn = ref None in
  let r_last_updated = ref None in
  let r_description = ref None in
  let r_publisher_id = ref None in
  let r_original_type_name = ref None in
  let r_public_version_number = ref None in
  let r_latest_public_version = ref None in
  let r_publisher_identity = ref None in
  let r_publisher_name = ref None in
  let r_is_activated = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Type";
      "TypeName";
      "DefaultVersionId";
      "TypeArn";
      "LastUpdated";
      "Description";
      "PublisherId";
      "OriginalTypeName";
      "PublicVersionNumber";
      "LatestPublicVersion";
      "PublisherIdentity";
      "PublisherName";
      "IsActivated";
    ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "DefaultVersionId" ->
          r_default_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultVersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | "LastUpdated" ->
          r_last_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdated" (fun i _ -> timestamp_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | "OriginalTypeName" ->
          r_original_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OriginalTypeName"
                 (fun i _ -> type_name_of_xml i)
                 ())
      | "PublicVersionNumber" ->
          r_public_version_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicVersionNumber"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | "LatestPublicVersion" ->
          r_latest_public_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LatestPublicVersion"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | "PublisherIdentity" ->
          r_publisher_identity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherIdentity"
                 (fun i _ -> identity_provider_of_xml i)
                 ())
      | "PublisherName" ->
          r_publisher_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherName"
                 (fun i _ -> publisher_name_of_xml i)
                 ())
      | "IsActivated" ->
          r_is_activated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsActivated"
                 (fun i _ -> is_activated_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     type_name = ( ! ) r_type_name;
     default_version_id = ( ! ) r_default_version_id;
     type_arn = ( ! ) r_type_arn;
     last_updated = ( ! ) r_last_updated;
     description = ( ! ) r_description;
     publisher_id = ( ! ) r_publisher_id;
     original_type_name = ( ! ) r_original_type_name;
     public_version_number = ( ! ) r_public_version_number;
     latest_public_version = ( ! ) r_latest_public_version;
     publisher_identity = ( ! ) r_publisher_identity;
     publisher_name = ( ! ) r_publisher_name;
     is_activated = ( ! ) r_is_activated;
   }
    : type_summary)

let type_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> type_summary_of_xml i) ()

let list_types_output_of_xml i =
  let r_type_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TypeSummaries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "TypeSummaries" ->
          r_type_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> type_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ type_summaries = ( ! ) r_type_summaries; next_token = ( ! ) r_next_token } : list_types_output)

let type_name_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let type_filters_of_xml i =
  let r_category = ref None in
  let r_publisher_id = ref None in
  let r_type_name_prefix = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Category"; "PublisherId"; "TypeNamePrefix" ]
    (fun tag _ ->
      match tag with
      | "Category" ->
          r_category :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Category" (fun i _ -> category_of_xml i) ())
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | "TypeNamePrefix" ->
          r_type_name_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeNamePrefix"
                 (fun i _ -> type_name_prefix_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     category = ( ! ) r_category;
     publisher_id = ( ! ) r_publisher_id;
     type_name_prefix = ( ! ) r_type_name_prefix;
   }
    : type_filters)

let provisioning_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "NON_PROVISIONABLE" -> NON_PROVISIONABLE
   | "IMMUTABLE" -> IMMUTABLE
   | "FULLY_MUTABLE" -> FULLY_MUTABLE
   | _ -> failwith "unknown enum value"
    : provisioning_type)

let visibility_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "PUBLIC" -> PUBLIC | "PRIVATE" -> PRIVATE | _ -> failwith "unknown enum value"
    : visibility)

let list_types_input_of_xml i =
  let r_visibility = ref None in
  let r_provisioning_type = ref None in
  let r_deprecated_status = ref None in
  let r_type_ = ref None in
  let r_filters = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Visibility";
      "ProvisioningType";
      "DeprecatedStatus";
      "Type";
      "Filters";
      "MaxResults";
      "NextToken";
    ] (fun tag _ ->
      match tag with
      | "Visibility" ->
          r_visibility :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Visibility" (fun i _ -> visibility_of_xml i) ())
      | "ProvisioningType" ->
          r_provisioning_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProvisioningType"
                 (fun i _ -> provisioning_type_of_xml i)
                 ())
      | "DeprecatedStatus" ->
          r_deprecated_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeprecatedStatus"
                 (fun i _ -> deprecated_status_of_xml i)
                 ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters" (fun i _ -> type_filters_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     visibility = ( ! ) r_visibility;
     provisioning_type = ( ! ) r_provisioning_type;
     deprecated_status = ( ! ) r_deprecated_status;
     type_ = ( ! ) r_type_;
     filters = ( ! ) r_filters;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
   }
    : list_types_input)

let registration_token_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> registration_token_of_xml i) ()

let list_type_registrations_output_of_xml i =
  let r_registration_token_list = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RegistrationTokenList"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "RegistrationTokenList" ->
          r_registration_token_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegistrationTokenList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> registration_token_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ registration_token_list = ( ! ) r_registration_token_list; next_token = ( ! ) r_next_token }
    : list_type_registrations_output)

let registration_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "COMPLETE" -> COMPLETE
   | "IN_PROGRESS" -> IN_PROGRESS
   | "FAILED" -> FAILED
   | _ -> failwith "unknown enum value"
    : registration_status)

let list_type_registrations_input_of_xml i =
  let r_type_ = ref None in
  let r_type_name = ref None in
  let r_type_arn = ref None in
  let r_registration_status_filter = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Type"; "TypeName"; "TypeArn"; "RegistrationStatusFilter"; "MaxResults"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | "RegistrationStatusFilter" ->
          r_registration_status_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegistrationStatusFilter"
                 (fun i _ -> registration_status_of_xml i)
                 ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     type_name = ( ! ) r_type_name;
     type_arn = ( ! ) r_type_arn;
     registration_status_filter = ( ! ) r_registration_status_filter;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
   }
    : list_type_registrations_input)

let stack_drift_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DRIFTED" -> DRIFTED
   | "IN_SYNC" -> IN_SYNC
   | "UNKNOWN" -> UNKNOWN
   | "NOT_CHECKED" -> NOT_CHECKED
   | _ -> failwith "unknown enum value"
    : stack_drift_status)

let stack_set_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "ACTIVE" -> ACTIVE | "DELETED" -> DELETED | _ -> failwith "unknown enum value"
    : stack_set_status)

let stack_set_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_set_summary_of_xml i =
  let r_stack_set_name = ref None in
  let r_stack_set_id = ref None in
  let r_description = ref None in
  let r_status = ref None in
  let r_auto_deployment = ref None in
  let r_permission_model = ref None in
  let r_drift_status = ref None in
  let r_last_drift_check_timestamp = ref None in
  let r_managed_execution = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetName";
      "StackSetId";
      "Description";
      "Status";
      "AutoDeployment";
      "PermissionModel";
      "DriftStatus";
      "LastDriftCheckTimestamp";
      "ManagedExecution";
    ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "StackSetId" ->
          r_stack_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetId"
                 (fun i _ -> stack_set_id_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_status_of_xml i)
                 ())
      | "AutoDeployment" ->
          r_auto_deployment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoDeployment"
                 (fun i _ -> auto_deployment_of_xml i)
                 ())
      | "PermissionModel" ->
          r_permission_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionModel"
                 (fun i _ -> permission_models_of_xml i)
                 ())
      | "DriftStatus" ->
          r_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | "LastDriftCheckTimestamp" ->
          r_last_drift_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastDriftCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ManagedExecution" ->
          r_managed_execution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedExecution"
                 (fun i _ -> managed_execution_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = ( ! ) r_stack_set_name;
     stack_set_id = ( ! ) r_stack_set_id;
     description = ( ! ) r_description;
     status = ( ! ) r_status;
     auto_deployment = ( ! ) r_auto_deployment;
     permission_model = ( ! ) r_permission_model;
     drift_status = ( ! ) r_drift_status;
     last_drift_check_timestamp = ( ! ) r_last_drift_check_timestamp;
     managed_execution = ( ! ) r_managed_execution;
   }
    : stack_set_summary)

let stack_set_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_set_summary_of_xml i) ()

let list_stack_sets_output_of_xml i =
  let r_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Summaries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_set_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ summaries = ( ! ) r_summaries; next_token = ( ! ) r_next_token } : list_stack_sets_output)

let list_stack_sets_input_of_xml i =
  let r_next_token = ref None in
  let r_max_results = ref None in
  let r_status = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxResults"; "Status"; "CallAs" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_status_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
     status = ( ! ) r_status;
     call_as = ( ! ) r_call_as;
   }
    : list_stack_sets_input)

let failed_stack_instances_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let stack_set_operation_status_details_of_xml i =
  let r_failed_stack_instances_count = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FailedStackInstancesCount" ] (fun tag _ ->
      match tag with
      | "FailedStackInstancesCount" ->
          r_failed_stack_instances_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailedStackInstancesCount"
                 (fun i _ -> failed_stack_instances_count_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ failed_stack_instances_count = ( ! ) r_failed_stack_instances_count }
    : stack_set_operation_status_details)

let stack_set_operation_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_set_operation_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "RUNNING" -> RUNNING
   | "SUCCEEDED" -> SUCCEEDED
   | "FAILED" -> FAILED
   | "STOPPING" -> STOPPING
   | "STOPPED" -> STOPPED
   | "QUEUED" -> QUEUED
   | _ -> failwith "unknown enum value"
    : stack_set_operation_status)

let stack_set_operation_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CREATE" -> CREATE
   | "UPDATE" -> UPDATE
   | "DELETE" -> DELETE
   | "DETECT_DRIFT" -> DETECT_DRIFT
   | _ -> failwith "unknown enum value"
    : stack_set_operation_action)

let stack_set_operation_summary_of_xml i =
  let r_operation_id = ref None in
  let r_action = ref None in
  let r_status = ref None in
  let r_creation_timestamp = ref None in
  let r_end_timestamp = ref None in
  let r_status_reason = ref None in
  let r_status_details = ref None in
  let r_operation_preferences = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OperationId";
      "Action";
      "Status";
      "CreationTimestamp";
      "EndTimestamp";
      "StatusReason";
      "StatusDetails";
      "OperationPreferences";
    ] (fun tag _ ->
      match tag with
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "Action" ->
          r_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Action"
                 (fun i _ -> stack_set_operation_action_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_operation_status_of_xml i)
                 ())
      | "CreationTimestamp" ->
          r_creation_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "EndTimestamp" ->
          r_end_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> stack_set_operation_status_reason_of_xml i)
                 ())
      | "StatusDetails" ->
          r_status_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusDetails"
                 (fun i _ -> stack_set_operation_status_details_of_xml i)
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     operation_id = ( ! ) r_operation_id;
     action = ( ! ) r_action;
     status = ( ! ) r_status;
     creation_timestamp = ( ! ) r_creation_timestamp;
     end_timestamp = ( ! ) r_end_timestamp;
     status_reason = ( ! ) r_status_reason;
     status_details = ( ! ) r_status_details;
     operation_preferences = ( ! ) r_operation_preferences;
   }
    : stack_set_operation_summary)

let stack_set_operation_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_set_operation_summary_of_xml i) ()

let list_stack_set_operations_output_of_xml i =
  let r_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Summaries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_set_operation_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ summaries = ( ! ) r_summaries; next_token = ( ! ) r_next_token }
    : list_stack_set_operations_output)

let list_stack_set_operations_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackSetName"; "NextToken"; "MaxResults"; "CallAs" ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
     call_as = ( ! ) r_call_as;
   }
    : list_stack_set_operations_input)

let reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_set_operation_result_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PENDING" -> PENDING
   | "RUNNING" -> RUNNING
   | "SUCCEEDED" -> SUCCEEDED
   | "FAILED" -> FAILED
   | "CANCELLED" -> CANCELLED
   | _ -> failwith "unknown enum value"
    : stack_set_operation_result_status)

let stack_set_operation_result_summary_of_xml i =
  let r_account = ref None in
  let r_region = ref None in
  let r_status = ref None in
  let r_status_reason = ref None in
  let r_account_gate_result = ref None in
  let r_organizational_unit_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Account"; "Region"; "Status"; "StatusReason"; "AccountGateResult"; "OrganizationalUnitId" ]
    (fun tag _ ->
      match tag with
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> account_of_xml i) ())
      | "Region" ->
          r_region :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Region" (fun i _ -> region_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_operation_result_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason" (fun i _ -> reason_of_xml i) ())
      | "AccountGateResult" ->
          r_account_gate_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountGateResult"
                 (fun i _ -> account_gate_result_of_xml i)
                 ())
      | "OrganizationalUnitId" ->
          r_organizational_unit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationalUnitId"
                 (fun i _ -> organizational_unit_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     account = ( ! ) r_account;
     region = ( ! ) r_region;
     status = ( ! ) r_status;
     status_reason = ( ! ) r_status_reason;
     account_gate_result = ( ! ) r_account_gate_result;
     organizational_unit_id = ( ! ) r_organizational_unit_id;
   }
    : stack_set_operation_result_summary)

let stack_set_operation_result_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> stack_set_operation_result_summary_of_xml i)
    ()

let list_stack_set_operation_results_output_of_xml i =
  let r_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Summaries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_set_operation_result_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ summaries = ( ! ) r_summaries; next_token = ( ! ) r_next_token }
    : list_stack_set_operation_results_output)

let operation_result_filter_values_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let operation_result_filter_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "OPERATION_RESULT_STATUS" -> OPERATION_RESULT_STATUS
   | _ -> failwith "unknown enum value"
    : operation_result_filter_name)

let operation_result_filter_of_xml i =
  let r_name = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Values" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> operation_result_filter_name_of_xml i)
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ -> operation_result_filter_values_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; values = ( ! ) r_values } : operation_result_filter)

let operation_result_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> operation_result_filter_of_xml i) ()

let list_stack_set_operation_results_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_operation_id = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  let r_call_as = ref None in
  let r_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackSetName"; "OperationId"; "NextToken"; "MaxResults"; "CallAs"; "Filters" ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> operation_result_filter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     operation_id = Smaws_Lib.Xml.Parse.required "OperationId" (( ! ) r_operation_id) i;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
     call_as = ( ! ) r_call_as;
     filters = ( ! ) r_filters;
   }
    : list_stack_set_operation_results_input)

let stack_set_auto_deployment_target_summary_of_xml i =
  let r_organizational_unit_id = ref None in
  let r_regions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OrganizationalUnitId"; "Regions" ] (fun tag _ ->
      match tag with
      | "OrganizationalUnitId" ->
          r_organizational_unit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationalUnitId"
                 (fun i _ -> organizational_unit_id_of_xml i)
                 ())
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ organizational_unit_id = ( ! ) r_organizational_unit_id; regions = ( ! ) r_regions }
    : stack_set_auto_deployment_target_summary)

let stack_set_auto_deployment_target_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> stack_set_auto_deployment_target_summary_of_xml i)
    ()

let list_stack_set_auto_deployment_targets_output_of_xml i =
  let r_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Summaries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_set_auto_deployment_target_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ summaries = ( ! ) r_summaries; next_token = ( ! ) r_next_token }
    : list_stack_set_auto_deployment_targets_output)

let list_stack_set_auto_deployment_targets_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackSetName"; "NextToken"; "MaxResults"; "CallAs" ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
     call_as = ( ! ) r_call_as;
   }
    : list_stack_set_auto_deployment_targets_input)

let operation_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CREATE_STACK" -> CREATE_STACK
   | "UPDATE_STACK" -> UPDATE_STACK
   | "DELETE_STACK" -> DELETE_STACK
   | "CONTINUE_ROLLBACK" -> CONTINUE_ROLLBACK
   | "ROLLBACK" -> ROLLBACK
   | "CREATE_CHANGESET" -> CREATE_CHANGESET
   | _ -> failwith "unknown enum value"
    : operation_type)

let operation_entry_of_xml i =
  let r_operation_type = ref None in
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationType"; "OperationId" ] (fun tag _ ->
      match tag with
      | "OperationType" ->
          r_operation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationType"
                 (fun i _ -> operation_type_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_type = ( ! ) r_operation_type; operation_id = ( ! ) r_operation_id }
    : operation_entry)

let last_operations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> operation_entry_of_xml i) ()

let stack_drift_information_summary_of_xml i =
  let r_stack_drift_status = ref None in
  let r_last_check_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackDriftStatus"; "LastCheckTimestamp" ]
    (fun tag _ ->
      match tag with
      | "StackDriftStatus" ->
          r_stack_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | "LastCheckTimestamp" ->
          r_last_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_drift_status =
       Smaws_Lib.Xml.Parse.required "StackDriftStatus" (( ! ) r_stack_drift_status) i;
     last_check_timestamp = ( ! ) r_last_check_timestamp;
   }
    : stack_drift_information_summary)

let stack_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | "CREATE_FAILED" -> CREATE_FAILED
   | "CREATE_COMPLETE" -> CREATE_COMPLETE
   | "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
   | "ROLLBACK_FAILED" -> ROLLBACK_FAILED
   | "ROLLBACK_COMPLETE" -> ROLLBACK_COMPLETE
   | "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | "DELETE_FAILED" -> DELETE_FAILED
   | "DELETE_COMPLETE" -> DELETE_COMPLETE
   | "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
   | "UPDATE_COMPLETE_CLEANUP_IN_PROGRESS" -> UPDATE_COMPLETE_CLEANUP_IN_PROGRESS
   | "UPDATE_COMPLETE" -> UPDATE_COMPLETE
   | "UPDATE_FAILED" -> UPDATE_FAILED
   | "UPDATE_ROLLBACK_IN_PROGRESS" -> UPDATE_ROLLBACK_IN_PROGRESS
   | "UPDATE_ROLLBACK_FAILED" -> UPDATE_ROLLBACK_FAILED
   | "UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS" -> UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS
   | "UPDATE_ROLLBACK_COMPLETE" -> UPDATE_ROLLBACK_COMPLETE
   | "REVIEW_IN_PROGRESS" -> REVIEW_IN_PROGRESS
   | "IMPORT_IN_PROGRESS" -> IMPORT_IN_PROGRESS
   | "IMPORT_COMPLETE" -> IMPORT_COMPLETE
   | "IMPORT_ROLLBACK_IN_PROGRESS" -> IMPORT_ROLLBACK_IN_PROGRESS
   | "IMPORT_ROLLBACK_FAILED" -> IMPORT_ROLLBACK_FAILED
   | "IMPORT_ROLLBACK_COMPLETE" -> IMPORT_ROLLBACK_COMPLETE
   | _ -> failwith "unknown enum value"
    : stack_status)

let deletion_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let last_updated_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let template_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_summary_of_xml i =
  let r_stack_id = ref None in
  let r_stack_name = ref None in
  let r_template_description = ref None in
  let r_creation_time = ref None in
  let r_last_updated_time = ref None in
  let r_deletion_time = ref None in
  let r_stack_status = ref None in
  let r_stack_status_reason = ref None in
  let r_parent_id = ref None in
  let r_root_id = ref None in
  let r_drift_information = ref None in
  let r_last_operations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackId";
      "StackName";
      "TemplateDescription";
      "CreationTime";
      "LastUpdatedTime";
      "DeletionTime";
      "StackStatus";
      "StackStatusReason";
      "ParentId";
      "RootId";
      "DriftInformation";
      "LastOperations";
    ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "TemplateDescription" ->
          r_template_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateDescription"
                 (fun i _ -> template_description_of_xml i)
                 ())
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "LastUpdatedTime" ->
          r_last_updated_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTime"
                 (fun i _ -> last_updated_time_of_xml i)
                 ())
      | "DeletionTime" ->
          r_deletion_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionTime"
                 (fun i _ -> deletion_time_of_xml i)
                 ())
      | "StackStatus" ->
          r_stack_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackStatus"
                 (fun i _ -> stack_status_of_xml i)
                 ())
      | "StackStatusReason" ->
          r_stack_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackStatusReason"
                 (fun i _ -> stack_status_reason_of_xml i)
                 ())
      | "ParentId" ->
          r_parent_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ParentId" (fun i _ -> stack_id_of_xml i) ())
      | "RootId" ->
          r_root_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RootId" (fun i _ -> stack_id_of_xml i) ())
      | "DriftInformation" ->
          r_drift_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftInformation"
                 (fun i _ -> stack_drift_information_summary_of_xml i)
                 ())
      | "LastOperations" ->
          r_last_operations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastOperations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> operation_entry_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_id = ( ! ) r_stack_id;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     template_description = ( ! ) r_template_description;
     creation_time = Smaws_Lib.Xml.Parse.required "CreationTime" (( ! ) r_creation_time) i;
     last_updated_time = ( ! ) r_last_updated_time;
     deletion_time = ( ! ) r_deletion_time;
     stack_status = Smaws_Lib.Xml.Parse.required "StackStatus" (( ! ) r_stack_status) i;
     stack_status_reason = ( ! ) r_stack_status_reason;
     parent_id = ( ! ) r_parent_id;
     root_id = ( ! ) r_root_id;
     drift_information = ( ! ) r_drift_information;
     last_operations = ( ! ) r_last_operations;
   }
    : stack_summary)

let stack_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_summary_of_xml i) ()

let list_stacks_output_of_xml i =
  let r_stack_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackSummaries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "StackSummaries" ->
          r_stack_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_summaries = ( ! ) r_stack_summaries; next_token = ( ! ) r_next_token }
    : list_stacks_output)

let stack_status_filter_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_status_of_xml i) ()

let list_stacks_input_of_xml i =
  let r_next_token = ref None in
  let r_stack_status_filter = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "StackStatusFilter" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackStatusFilter" ->
          r_stack_status_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackStatusFilter"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; stack_status_filter = ( ! ) r_stack_status_filter }
    : list_stacks_input)

let stack_resource_drift_information_summary_of_xml i =
  let r_stack_resource_drift_status = ref None in
  let r_last_check_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackResourceDriftStatus"; "LastCheckTimestamp" ]
    (fun tag _ ->
      match tag with
      | "StackResourceDriftStatus" ->
          r_stack_resource_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDriftStatus"
                 (fun i _ -> stack_resource_drift_status_of_xml i)
                 ())
      | "LastCheckTimestamp" ->
          r_last_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_resource_drift_status =
       Smaws_Lib.Xml.Parse.required "StackResourceDriftStatus"
         (( ! ) r_stack_resource_drift_status)
         i;
     last_check_timestamp = ( ! ) r_last_check_timestamp;
   }
    : stack_resource_drift_information_summary)

let resource_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | "CREATE_FAILED" -> CREATE_FAILED
   | "CREATE_COMPLETE" -> CREATE_COMPLETE
   | "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | "DELETE_FAILED" -> DELETE_FAILED
   | "DELETE_COMPLETE" -> DELETE_COMPLETE
   | "DELETE_SKIPPED" -> DELETE_SKIPPED
   | "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
   | "UPDATE_FAILED" -> UPDATE_FAILED
   | "UPDATE_COMPLETE" -> UPDATE_COMPLETE
   | "IMPORT_FAILED" -> IMPORT_FAILED
   | "IMPORT_COMPLETE" -> IMPORT_COMPLETE
   | "IMPORT_IN_PROGRESS" -> IMPORT_IN_PROGRESS
   | "IMPORT_ROLLBACK_IN_PROGRESS" -> IMPORT_ROLLBACK_IN_PROGRESS
   | "IMPORT_ROLLBACK_FAILED" -> IMPORT_ROLLBACK_FAILED
   | "IMPORT_ROLLBACK_COMPLETE" -> IMPORT_ROLLBACK_COMPLETE
   | "EXPORT_FAILED" -> EXPORT_FAILED
   | "EXPORT_COMPLETE" -> EXPORT_COMPLETE
   | "EXPORT_IN_PROGRESS" -> EXPORT_IN_PROGRESS
   | "EXPORT_ROLLBACK_IN_PROGRESS" -> EXPORT_ROLLBACK_IN_PROGRESS
   | "EXPORT_ROLLBACK_FAILED" -> EXPORT_ROLLBACK_FAILED
   | "EXPORT_ROLLBACK_COMPLETE" -> EXPORT_ROLLBACK_COMPLETE
   | "UPDATE_ROLLBACK_IN_PROGRESS" -> UPDATE_ROLLBACK_IN_PROGRESS
   | "UPDATE_ROLLBACK_COMPLETE" -> UPDATE_ROLLBACK_COMPLETE
   | "UPDATE_ROLLBACK_FAILED" -> UPDATE_ROLLBACK_FAILED
   | "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
   | "ROLLBACK_COMPLETE" -> ROLLBACK_COMPLETE
   | "ROLLBACK_FAILED" -> ROLLBACK_FAILED
   | _ -> failwith "unknown enum value"
    : resource_status)

let stack_resource_summary_of_xml i =
  let r_logical_resource_id = ref None in
  let r_physical_resource_id = ref None in
  let r_resource_type = ref None in
  let r_last_updated_timestamp = ref None in
  let r_resource_status = ref None in
  let r_resource_status_reason = ref None in
  let r_drift_information = ref None in
  let r_module_info = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LogicalResourceId";
      "PhysicalResourceId";
      "ResourceType";
      "LastUpdatedTimestamp";
      "ResourceStatus";
      "ResourceStatusReason";
      "DriftInformation";
      "ModuleInfo";
    ] (fun tag _ ->
      match tag with
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "LastUpdatedTimestamp" ->
          r_last_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> resource_status_of_xml i)
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "DriftInformation" ->
          r_drift_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftInformation"
                 (fun i _ -> stack_resource_drift_information_summary_of_xml i)
                 ())
      | "ModuleInfo" ->
          r_module_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModuleInfo"
                 (fun i _ -> module_info_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     physical_resource_id = ( ! ) r_physical_resource_id;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     last_updated_timestamp =
       Smaws_Lib.Xml.Parse.required "LastUpdatedTimestamp" (( ! ) r_last_updated_timestamp) i;
     resource_status = Smaws_Lib.Xml.Parse.required "ResourceStatus" (( ! ) r_resource_status) i;
     resource_status_reason = ( ! ) r_resource_status_reason;
     drift_information = ( ! ) r_drift_information;
     module_info = ( ! ) r_module_info;
   }
    : stack_resource_summary)

let stack_resource_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_resource_summary_of_xml i) ()

let list_stack_resources_output_of_xml i =
  let r_stack_resource_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackResourceSummaries"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "StackResourceSummaries" ->
          r_stack_resource_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_resource_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_resource_summaries = ( ! ) r_stack_resource_summaries; next_token = ( ! ) r_next_token }
    : list_stack_resources_output)

let list_stack_resources_input_of_xml i =
  let r_stack_name = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "NextToken" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     next_token = ( ! ) r_next_token;
   }
    : list_stack_resources_input)

let stack_refactor_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_refactor_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | "CREATE_COMPLETE" -> CREATE_COMPLETE
   | "CREATE_FAILED" -> CREATE_FAILED
   | "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | "DELETE_COMPLETE" -> DELETE_COMPLETE
   | "DELETE_FAILED" -> DELETE_FAILED
   | _ -> failwith "unknown enum value"
    : stack_refactor_status)

let execution_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_refactor_execution_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "UNAVAILABLE" -> UNAVAILABLE
   | "AVAILABLE" -> AVAILABLE
   | "OBSOLETE" -> OBSOLETE
   | "EXECUTE_IN_PROGRESS" -> EXECUTE_IN_PROGRESS
   | "EXECUTE_COMPLETE" -> EXECUTE_COMPLETE
   | "EXECUTE_FAILED" -> EXECUTE_FAILED
   | "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
   | "ROLLBACK_COMPLETE" -> ROLLBACK_COMPLETE
   | "ROLLBACK_FAILED" -> ROLLBACK_FAILED
   | _ -> failwith "unknown enum value"
    : stack_refactor_execution_status)

let stack_refactor_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_refactor_summary_of_xml i =
  let r_stack_refactor_id = ref None in
  let r_description = ref None in
  let r_execution_status = ref None in
  let r_execution_status_reason = ref None in
  let r_status = ref None in
  let r_status_reason = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackRefactorId";
      "Description";
      "ExecutionStatus";
      "ExecutionStatusReason";
      "Status";
      "StatusReason";
    ] (fun tag _ ->
      match tag with
      | "StackRefactorId" ->
          r_stack_refactor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackRefactorId"
                 (fun i _ -> stack_refactor_id_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ExecutionStatus" ->
          r_execution_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatus"
                 (fun i _ -> stack_refactor_execution_status_of_xml i)
                 ())
      | "ExecutionStatusReason" ->
          r_execution_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatusReason"
                 (fun i _ -> execution_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_refactor_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> stack_refactor_status_reason_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_refactor_id = ( ! ) r_stack_refactor_id;
     description = ( ! ) r_description;
     execution_status = ( ! ) r_execution_status;
     execution_status_reason = ( ! ) r_execution_status_reason;
     status = ( ! ) r_status;
     status_reason = ( ! ) r_status_reason;
   }
    : stack_refactor_summary)

let stack_refactor_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_refactor_summary_of_xml i) ()

let list_stack_refactors_output_of_xml i =
  let r_stack_refactor_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackRefactorSummaries"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "StackRefactorSummaries" ->
          r_stack_refactor_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackRefactorSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_refactor_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_refactor_summaries =
       Smaws_Lib.Xml.Parse.required "StackRefactorSummaries" (( ! ) r_stack_refactor_summaries) i;
     next_token = ( ! ) r_next_token;
   }
    : list_stack_refactors_output)

let stack_refactor_execution_status_filter_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> stack_refactor_execution_status_of_xml i)
    ()

let list_stack_refactors_input_of_xml i =
  let r_execution_status_filter = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ExecutionStatusFilter"; "NextToken"; "MaxResults" ] (fun tag _ ->
      match tag with
      | "ExecutionStatusFilter" ->
          r_execution_status_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatusFilter"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_refactor_execution_status_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     execution_status_filter = ( ! ) r_execution_status_filter;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
   }
    : list_stack_refactors_input)

let resource_location_of_xml i =
  let r_stack_name = ref None in
  let r_logical_resource_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "LogicalResourceId" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
   }
    : resource_location)

let resource_mapping_of_xml i =
  let r_source = ref None in
  let r_destination = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Source"; "Destination" ] (fun tag _ ->
      match tag with
      | "Source" ->
          r_source :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Source"
                 (fun i _ -> resource_location_of_xml i)
                 ())
      | "Destination" ->
          r_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destination"
                 (fun i _ -> resource_location_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source = Smaws_Lib.Xml.Parse.required "Source" (( ! ) r_source) i;
     destination = Smaws_Lib.Xml.Parse.required "Destination" (( ! ) r_destination) i;
   }
    : resource_mapping)

let stack_refactor_untag_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ()

let stack_refactor_tag_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let detection_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_refactor_detection_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "AUTO" -> AUTO | "MANUAL" -> MANUAL | _ -> failwith "unknown enum value"
    : stack_refactor_detection)

let stack_refactor_resource_identifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_refactor_action_entity_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "RESOURCE" -> RESOURCE | "STACK" -> STACK | _ -> failwith "unknown enum value"
    : stack_refactor_action_entity)

let stack_refactor_action_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "MOVE" -> MOVE | "CREATE" -> CREATE | _ -> failwith "unknown enum value"
    : stack_refactor_action_type)

let stack_refactor_action_of_xml i =
  let r_action = ref None in
  let r_entity = ref None in
  let r_physical_resource_id = ref None in
  let r_resource_identifier = ref None in
  let r_description = ref None in
  let r_detection = ref None in
  let r_detection_reason = ref None in
  let r_tag_resources = ref None in
  let r_untag_resources = ref None in
  let r_resource_mapping = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Action";
      "Entity";
      "PhysicalResourceId";
      "ResourceIdentifier";
      "Description";
      "Detection";
      "DetectionReason";
      "TagResources";
      "UntagResources";
      "ResourceMapping";
    ] (fun tag _ ->
      match tag with
      | "Action" ->
          r_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Action"
                 (fun i _ -> stack_refactor_action_type_of_xml i)
                 ())
      | "Entity" ->
          r_entity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Entity"
                 (fun i _ -> stack_refactor_action_entity_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ -> stack_refactor_resource_identifier_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Detection" ->
          r_detection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Detection"
                 (fun i _ -> stack_refactor_detection_of_xml i)
                 ())
      | "DetectionReason" ->
          r_detection_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetectionReason"
                 (fun i _ -> detection_reason_of_xml i)
                 ())
      | "TagResources" ->
          r_tag_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "UntagResources" ->
          r_untag_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UntagResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ())
                 ())
      | "ResourceMapping" ->
          r_resource_mapping :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceMapping"
                 (fun i _ -> resource_mapping_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     action = ( ! ) r_action;
     entity = ( ! ) r_entity;
     physical_resource_id = ( ! ) r_physical_resource_id;
     resource_identifier = ( ! ) r_resource_identifier;
     description = ( ! ) r_description;
     detection = ( ! ) r_detection;
     detection_reason = ( ! ) r_detection_reason;
     tag_resources = ( ! ) r_tag_resources;
     untag_resources = ( ! ) r_untag_resources;
     resource_mapping = ( ! ) r_resource_mapping;
   }
    : stack_refactor_action)

let stack_refactor_actions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_refactor_action_of_xml i) ()

let list_stack_refactor_actions_output_of_xml i =
  let r_stack_refactor_actions = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackRefactorActions"; "NextToken" ] (fun tag _ ->
      match tag with
      | "StackRefactorActions" ->
          r_stack_refactor_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackRefactorActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_refactor_action_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_refactor_actions =
       Smaws_Lib.Xml.Parse.required "StackRefactorActions" (( ! ) r_stack_refactor_actions) i;
     next_token = ( ! ) r_next_token;
   }
    : list_stack_refactor_actions_output)

let list_stack_refactor_actions_input_of_xml i =
  let r_stack_refactor_id = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackRefactorId"; "NextToken"; "MaxResults" ]
    (fun tag _ ->
      match tag with
      | "StackRefactorId" ->
          r_stack_refactor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackRefactorId"
                 (fun i _ -> stack_refactor_id_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_refactor_id =
       Smaws_Lib.Xml.Parse.required "StackRefactorId" (( ! ) r_stack_refactor_id) i;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
   }
    : list_stack_refactor_actions_input)

let stack_instance_detailed_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PENDING" -> PENDING
   | "RUNNING" -> RUNNING
   | "SUCCEEDED" -> SUCCEEDED
   | "FAILED" -> FAILED
   | "CANCELLED" -> CANCELLED
   | "INOPERABLE" -> INOPERABLE
   | "SKIPPED_SUSPENDED_ACCOUNT" -> SKIPPED_SUSPENDED_ACCOUNT
   | "FAILED_IMPORT" -> FAILED_IMPORT
   | _ -> failwith "unknown enum value"
    : stack_instance_detailed_status)

let stack_instance_comprehensive_status_of_xml i =
  let r_detailed_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DetailedStatus" ] (fun tag _ ->
      match tag with
      | "DetailedStatus" ->
          r_detailed_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetailedStatus"
                 (fun i _ -> stack_instance_detailed_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ detailed_status = ( ! ) r_detailed_status } : stack_instance_comprehensive_status)

let stack_instance_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CURRENT" -> CURRENT
   | "OUTDATED" -> OUTDATED
   | "INOPERABLE" -> INOPERABLE
   | _ -> failwith "unknown enum value"
    : stack_instance_status)

let stack_instance_summary_of_xml i =
  let r_stack_set_id = ref None in
  let r_region = ref None in
  let r_account = ref None in
  let r_stack_id = ref None in
  let r_status = ref None in
  let r_status_reason = ref None in
  let r_stack_instance_status = ref None in
  let r_organizational_unit_id = ref None in
  let r_drift_status = ref None in
  let r_last_drift_check_timestamp = ref None in
  let r_last_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetId";
      "Region";
      "Account";
      "StackId";
      "Status";
      "StatusReason";
      "StackInstanceStatus";
      "OrganizationalUnitId";
      "DriftStatus";
      "LastDriftCheckTimestamp";
      "LastOperationId";
    ] (fun tag _ ->
      match tag with
      | "StackSetId" ->
          r_stack_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetId"
                 (fun i _ -> stack_set_id_of_xml i)
                 ())
      | "Region" ->
          r_region :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Region" (fun i _ -> region_of_xml i) ())
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> account_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_instance_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason" (fun i _ -> reason_of_xml i) ())
      | "StackInstanceStatus" ->
          r_stack_instance_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceStatus"
                 (fun i _ -> stack_instance_comprehensive_status_of_xml i)
                 ())
      | "OrganizationalUnitId" ->
          r_organizational_unit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationalUnitId"
                 (fun i _ -> organizational_unit_id_of_xml i)
                 ())
      | "DriftStatus" ->
          r_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | "LastDriftCheckTimestamp" ->
          r_last_drift_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastDriftCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "LastOperationId" ->
          r_last_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastOperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_id = ( ! ) r_stack_set_id;
     region = ( ! ) r_region;
     account = ( ! ) r_account;
     stack_id = ( ! ) r_stack_id;
     status = ( ! ) r_status;
     status_reason = ( ! ) r_status_reason;
     stack_instance_status = ( ! ) r_stack_instance_status;
     organizational_unit_id = ( ! ) r_organizational_unit_id;
     drift_status = ( ! ) r_drift_status;
     last_drift_check_timestamp = ( ! ) r_last_drift_check_timestamp;
     last_operation_id = ( ! ) r_last_operation_id;
   }
    : stack_instance_summary)

let stack_instance_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_instance_summary_of_xml i) ()

let list_stack_instances_output_of_xml i =
  let r_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Summaries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_instance_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ summaries = ( ! ) r_summaries; next_token = ( ! ) r_next_token } : list_stack_instances_output)

let stack_instance_filter_values_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_instance_filter_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DETAILED_STATUS" -> DETAILED_STATUS
   | "LAST_OPERATION_ID" -> LAST_OPERATION_ID
   | "DRIFT_STATUS" -> DRIFT_STATUS
   | _ -> failwith "unknown enum value"
    : stack_instance_filter_name)

let stack_instance_filter_of_xml i =
  let r_name = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Values" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> stack_instance_filter_name_of_xml i)
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ -> stack_instance_filter_values_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; values = ( ! ) r_values } : stack_instance_filter)

let stack_instance_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_instance_filter_of_xml i) ()

let list_stack_instances_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  let r_filters = ref None in
  let r_stack_instance_account = ref None in
  let r_stack_instance_region = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetName";
      "NextToken";
      "MaxResults";
      "Filters";
      "StackInstanceAccount";
      "StackInstanceRegion";
      "CallAs";
    ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_instance_filter_of_xml i)
                     ())
                 ())
      | "StackInstanceAccount" ->
          r_stack_instance_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceAccount"
                 (fun i _ -> account_of_xml i)
                 ())
      | "StackInstanceRegion" ->
          r_stack_instance_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceRegion"
                 (fun i _ -> region_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
     filters = ( ! ) r_filters;
     stack_instance_account = ( ! ) r_stack_instance_account;
     stack_instance_region = ( ! ) r_stack_instance_region;
     call_as = ( ! ) r_call_as;
   }
    : list_stack_instances_input)

let difference_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ADD" -> ADD
   | "REMOVE" -> REMOVE
   | "NOT_EQUAL" -> NOT_EQUAL
   | _ -> failwith "unknown enum value"
    : difference_type)

let property_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let property_path_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let property_difference_of_xml i =
  let r_property_path = ref None in
  let r_expected_value = ref None in
  let r_actual_value = ref None in
  let r_difference_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PropertyPath"; "ExpectedValue"; "ActualValue"; "DifferenceType" ] (fun tag _ ->
      match tag with
      | "PropertyPath" ->
          r_property_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PropertyPath"
                 (fun i _ -> property_path_of_xml i)
                 ())
      | "ExpectedValue" ->
          r_expected_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpectedValue"
                 (fun i _ -> property_value_of_xml i)
                 ())
      | "ActualValue" ->
          r_actual_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActualValue"
                 (fun i _ -> property_value_of_xml i)
                 ())
      | "DifferenceType" ->
          r_difference_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DifferenceType"
                 (fun i _ -> difference_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     property_path = Smaws_Lib.Xml.Parse.required "PropertyPath" (( ! ) r_property_path) i;
     expected_value = Smaws_Lib.Xml.Parse.required "ExpectedValue" (( ! ) r_expected_value) i;
     actual_value = Smaws_Lib.Xml.Parse.required "ActualValue" (( ! ) r_actual_value) i;
     difference_type = Smaws_Lib.Xml.Parse.required "DifferenceType" (( ! ) r_difference_type) i;
   }
    : property_difference)

let property_differences_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> property_difference_of_xml i) ()

let value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let physical_resource_id_context_key_value_pair_of_xml i =
  let r_key = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Key"; "Value" ] (fun tag _ ->
      match tag with
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> key_of_xml i) ())
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> value_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i;
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
   }
    : physical_resource_id_context_key_value_pair)

let physical_resource_id_context_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> physical_resource_id_context_key_value_pair_of_xml i)
    ()

let stack_instance_resource_drifts_summary_of_xml i =
  let r_stack_id = ref None in
  let r_logical_resource_id = ref None in
  let r_physical_resource_id = ref None in
  let r_physical_resource_id_context = ref None in
  let r_resource_type = ref None in
  let r_property_differences = ref None in
  let r_stack_resource_drift_status = ref None in
  let r_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackId";
      "LogicalResourceId";
      "PhysicalResourceId";
      "PhysicalResourceIdContext";
      "ResourceType";
      "PropertyDifferences";
      "StackResourceDriftStatus";
      "Timestamp";
    ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "PhysicalResourceIdContext" ->
          r_physical_resource_id_context :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceIdContext"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> physical_resource_id_context_key_value_pair_of_xml i)
                     ())
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "PropertyDifferences" ->
          r_property_differences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PropertyDifferences"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> property_difference_of_xml i)
                     ())
                 ())
      | "StackResourceDriftStatus" ->
          r_stack_resource_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDriftStatus"
                 (fun i _ -> stack_resource_drift_status_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_id = Smaws_Lib.Xml.Parse.required "StackId" (( ! ) r_stack_id) i;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     physical_resource_id = ( ! ) r_physical_resource_id;
     physical_resource_id_context = ( ! ) r_physical_resource_id_context;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     property_differences = ( ! ) r_property_differences;
     stack_resource_drift_status =
       Smaws_Lib.Xml.Parse.required "StackResourceDriftStatus"
         (( ! ) r_stack_resource_drift_status)
         i;
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
   }
    : stack_instance_resource_drifts_summary)

let stack_instance_resource_drifts_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> stack_instance_resource_drifts_summary_of_xml i)
    ()

let list_stack_instance_resource_drifts_output_of_xml i =
  let r_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Summaries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_instance_resource_drifts_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ summaries = ( ! ) r_summaries; next_token = ( ! ) r_next_token }
    : list_stack_instance_resource_drifts_output)

let stack_resource_drift_status_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_resource_drift_status_of_xml i) ()

let list_stack_instance_resource_drifts_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  let r_stack_instance_resource_drift_statuses = ref None in
  let r_stack_instance_account = ref None in
  let r_stack_instance_region = ref None in
  let r_operation_id = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetName";
      "NextToken";
      "MaxResults";
      "StackInstanceResourceDriftStatuses";
      "StackInstanceAccount";
      "StackInstanceRegion";
      "OperationId";
      "CallAs";
    ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | "StackInstanceResourceDriftStatuses" ->
          r_stack_instance_resource_drift_statuses :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceResourceDriftStatuses"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_resource_drift_status_of_xml i)
                     ())
                 ())
      | "StackInstanceAccount" ->
          r_stack_instance_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceAccount"
                 (fun i _ -> account_of_xml i)
                 ())
      | "StackInstanceRegion" ->
          r_stack_instance_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceRegion"
                 (fun i _ -> region_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
     stack_instance_resource_drift_statuses = ( ! ) r_stack_instance_resource_drift_statuses;
     stack_instance_account =
       Smaws_Lib.Xml.Parse.required "StackInstanceAccount" (( ! ) r_stack_instance_account) i;
     stack_instance_region =
       Smaws_Lib.Xml.Parse.required "StackInstanceRegion" (( ! ) r_stack_instance_region) i;
     operation_id = Smaws_Lib.Xml.Parse.required "OperationId" (( ! ) r_operation_id) i;
     call_as = ( ! ) r_call_as;
   }
    : list_stack_instance_resource_drifts_input)

let scan_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "FULL" -> FULL | "PARTIAL" -> PARTIAL | _ -> failwith "unknown enum value"
    : scan_type)

let percentage_completed_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resource_scan_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_scan_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "IN_PROGRESS" -> IN_PROGRESS
   | "FAILED" -> FAILED
   | "COMPLETE" -> COMPLETE
   | "EXPIRED" -> EXPIRED
   | _ -> failwith "unknown enum value"
    : resource_scan_status)

let resource_scan_summary_of_xml i =
  let r_resource_scan_id = ref None in
  let r_status = ref None in
  let r_status_reason = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_percentage_completed = ref None in
  let r_scan_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ResourceScanId";
      "Status";
      "StatusReason";
      "StartTime";
      "EndTime";
      "PercentageCompleted";
      "ScanType";
    ] (fun tag _ ->
      match tag with
      | "ResourceScanId" ->
          r_resource_scan_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanId"
                 (fun i _ -> resource_scan_id_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> resource_scan_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> resource_scan_status_reason_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "PercentageCompleted" ->
          r_percentage_completed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageCompleted"
                 (fun i _ -> percentage_completed_of_xml i)
                 ())
      | "ScanType" ->
          r_scan_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ScanType" (fun i _ -> scan_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_scan_id = ( ! ) r_resource_scan_id;
     status = ( ! ) r_status;
     status_reason = ( ! ) r_status_reason;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     percentage_completed = ( ! ) r_percentage_completed;
     scan_type = ( ! ) r_scan_type;
   }
    : resource_scan_summary)

let resource_scan_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_scan_summary_of_xml i) ()

let list_resource_scans_output_of_xml i =
  let r_resource_scan_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceScanSummaries"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "ResourceScanSummaries" ->
          r_resource_scan_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_scan_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_scan_summaries = ( ! ) r_resource_scan_summaries; next_token = ( ! ) r_next_token }
    : list_resource_scans_output)

let resource_scanner_max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_resource_scans_input_of_xml i =
  let r_next_token = ref None in
  let r_max_results = ref None in
  let r_scan_type_filter = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxResults"; "ScanTypeFilter" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> resource_scanner_max_results_of_xml i)
                 ())
      | "ScanTypeFilter" ->
          r_scan_type_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScanTypeFilter"
                 (fun i _ -> scan_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
     scan_type_filter = ( ! ) r_scan_type_filter;
   }
    : list_resource_scans_input)

let resource_scan_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_scan_not_found_exception)

let managed_by_stack_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let jazz_resource_identifier_property_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let jazz_resource_identifier_property_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let jazz_resource_identifier_properties_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k =
        Smaws_Lib.Xml.Parse.Read.sequence i "key"
          (fun i _ -> jazz_resource_identifier_property_key_of_xml i)
          ()
      in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> jazz_resource_identifier_property_value_of_xml i)
          ()
      in
      (k, v))
    ()

let scanned_resource_of_xml i =
  let r_resource_type = ref None in
  let r_resource_identifier = ref None in
  let r_managed_by_stack = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceType"; "ResourceIdentifier"; "ManagedByStack" ] (fun tag _ ->
      match tag with
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> jazz_resource_identifier_property_key_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> jazz_resource_identifier_property_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "ManagedByStack" ->
          r_managed_by_stack :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedByStack"
                 (fun i _ -> managed_by_stack_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_type = ( ! ) r_resource_type;
     resource_identifier = ( ! ) r_resource_identifier;
     managed_by_stack = ( ! ) r_managed_by_stack;
   }
    : scanned_resource)

let scanned_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> scanned_resource_of_xml i) ()

let list_resource_scan_resources_output_of_xml i =
  let r_resources = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Resources"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scanned_resource_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resources = ( ! ) r_resources; next_token = ( ! ) r_next_token }
    : list_resource_scan_resources_output)

let resource_type_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_identifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let list_resource_scan_resources_input_of_xml i =
  let r_resource_scan_id = ref None in
  let r_resource_identifier = ref None in
  let r_resource_type_prefix = ref None in
  let r_tag_key = ref None in
  let r_tag_value = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ResourceScanId";
      "ResourceIdentifier";
      "ResourceTypePrefix";
      "TagKey";
      "TagValue";
      "NextToken";
      "MaxResults";
    ] (fun tag _ ->
      match tag with
      | "ResourceScanId" ->
          r_resource_scan_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanId"
                 (fun i _ -> resource_scan_id_of_xml i)
                 ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ -> resource_identifier_of_xml i)
                 ())
      | "ResourceTypePrefix" ->
          r_resource_type_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTypePrefix"
                 (fun i _ -> resource_type_prefix_of_xml i)
                 ())
      | "TagKey" ->
          r_tag_key :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TagKey" (fun i _ -> tag_key_of_xml i) ())
      | "TagValue" ->
          r_tag_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TagValue" (fun i _ -> tag_value_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> resource_scanner_max_results_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_scan_id = Smaws_Lib.Xml.Parse.required "ResourceScanId" (( ! ) r_resource_scan_id) i;
     resource_identifier = ( ! ) r_resource_identifier;
     resource_type_prefix = ( ! ) r_resource_type_prefix;
     tag_key = ( ! ) r_tag_key;
     tag_value = ( ! ) r_tag_value;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
   }
    : list_resource_scan_resources_input)

let related_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> scanned_resource_of_xml i) ()

let list_resource_scan_related_resources_output_of_xml i =
  let r_related_resources = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RelatedResources"; "NextToken" ] (fun tag _ ->
      match tag with
      | "RelatedResources" ->
          r_related_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RelatedResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scanned_resource_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ related_resources = ( ! ) r_related_resources; next_token = ( ! ) r_next_token }
    : list_resource_scan_related_resources_output)

let scanned_resource_identifier_of_xml i =
  let r_resource_type = ref None in
  let r_resource_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceType"; "ResourceIdentifier" ]
    (fun tag _ ->
      match tag with
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> jazz_resource_identifier_property_key_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> jazz_resource_identifier_property_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     resource_identifier =
       Smaws_Lib.Xml.Parse.required "ResourceIdentifier" (( ! ) r_resource_identifier) i;
   }
    : scanned_resource_identifier)

let scanned_resource_identifiers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> scanned_resource_identifier_of_xml i) ()

let list_resource_scan_related_resources_input_of_xml i =
  let r_resource_scan_id = ref None in
  let r_resources = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceScanId"; "Resources"; "NextToken"; "MaxResults" ] (fun tag _ ->
      match tag with
      | "ResourceScanId" ->
          r_resource_scan_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanId"
                 (fun i _ -> resource_scan_id_of_xml i)
                 ())
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scanned_resource_identifier_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> boxed_max_results_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_scan_id = Smaws_Lib.Xml.Parse.required "ResourceScanId" (( ! ) r_resource_scan_id) i;
     resources = Smaws_Lib.Xml.Parse.required "Resources" (( ! ) r_resources) i;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
   }
    : list_resource_scan_related_resources_input)

let imports_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_name_of_xml i) ()

let list_imports_output_of_xml i =
  let r_imports = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Imports"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Imports" ->
          r_imports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Imports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_name_of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ imports = ( ! ) r_imports; next_token = ( ! ) r_next_token } : list_imports_output)

let export_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let list_imports_input_of_xml i =
  let r_export_name = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ExportName"; "NextToken" ] (fun tag _ ->
      match tag with
      | "ExportName" ->
          r_export_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExportName"
                 (fun i _ -> export_name_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     export_name = Smaws_Lib.Xml.Parse.required "ExportName" (( ! ) r_export_name) i;
     next_token = ( ! ) r_next_token;
   }
    : list_imports_input)

let hook_result_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : hook_result_not_found_exception)

let hook_result_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let hook_type_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let list_hook_results_target_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CHANGE_SET" -> CHANGE_SET
   | "STACK" -> STACK
   | "RESOURCE" -> RESOURCE
   | "CLOUD_CONTROL" -> CLOUD_CONTROL
   | _ -> failwith "unknown enum value"
    : list_hook_results_target_type)

let hook_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let hook_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "HOOK_IN_PROGRESS" -> HOOK_IN_PROGRESS
   | "HOOK_COMPLETE_SUCCEEDED" -> HOOK_COMPLETE_SUCCEEDED
   | "HOOK_COMPLETE_FAILED" -> HOOK_COMPLETE_FAILED
   | "HOOK_FAILED" -> HOOK_FAILED
   | _ -> failwith "unknown enum value"
    : hook_status)

let hook_invocation_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let hook_result_summary_of_xml i =
  let r_hook_result_id = ref None in
  let r_invocation_point = ref None in
  let r_failure_mode = ref None in
  let r_type_name = ref None in
  let r_type_version_id = ref None in
  let r_type_configuration_version_id = ref None in
  let r_status = ref None in
  let r_hook_status_reason = ref None in
  let r_invoked_at = ref None in
  let r_target_type = ref None in
  let r_target_id = ref None in
  let r_type_arn = ref None in
  let r_hook_execution_target = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "HookResultId";
      "InvocationPoint";
      "FailureMode";
      "TypeName";
      "TypeVersionId";
      "TypeConfigurationVersionId";
      "Status";
      "HookStatusReason";
      "InvokedAt";
      "TargetType";
      "TargetId";
      "TypeArn";
      "HookExecutionTarget";
    ] (fun tag _ ->
      match tag with
      | "HookResultId" ->
          r_hook_result_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookResultId"
                 (fun i _ -> hook_invocation_id_of_xml i)
                 ())
      | "InvocationPoint" ->
          r_invocation_point :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvocationPoint"
                 (fun i _ -> hook_invocation_point_of_xml i)
                 ())
      | "FailureMode" ->
          r_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName"
                 (fun i _ -> hook_type_name_of_xml i)
                 ())
      | "TypeVersionId" ->
          r_type_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeVersionId"
                 (fun i _ -> hook_type_version_id_of_xml i)
                 ())
      | "TypeConfigurationVersionId" ->
          r_type_configuration_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationVersionId"
                 (fun i _ -> hook_type_configuration_version_id_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> hook_status_of_xml i) ())
      | "HookStatusReason" ->
          r_hook_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatusReason"
                 (fun i _ -> hook_status_reason_of_xml i)
                 ())
      | "InvokedAt" ->
          r_invoked_at :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvokedAt" (fun i _ -> timestamp_of_xml i) ())
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> list_hook_results_target_type_of_xml i)
                 ())
      | "TargetId" ->
          r_target_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetId"
                 (fun i _ -> hook_result_id_of_xml i)
                 ())
      | "TypeArn" ->
          r_type_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> hook_type_arn_of_xml i) ())
      | "HookExecutionTarget" ->
          r_hook_execution_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookExecutionTarget"
                 (fun i _ -> hook_result_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     hook_result_id = ( ! ) r_hook_result_id;
     invocation_point = ( ! ) r_invocation_point;
     failure_mode = ( ! ) r_failure_mode;
     type_name = ( ! ) r_type_name;
     type_version_id = ( ! ) r_type_version_id;
     type_configuration_version_id = ( ! ) r_type_configuration_version_id;
     status = ( ! ) r_status;
     hook_status_reason = ( ! ) r_hook_status_reason;
     invoked_at = ( ! ) r_invoked_at;
     target_type = ( ! ) r_target_type;
     target_id = ( ! ) r_target_id;
     type_arn = ( ! ) r_type_arn;
     hook_execution_target = ( ! ) r_hook_execution_target;
   }
    : hook_result_summary)

let hook_result_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> hook_result_summary_of_xml i) ()

let list_hook_results_output_of_xml i =
  let r_target_type = ref None in
  let r_target_id = ref None in
  let r_hook_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TargetType"; "TargetId"; "HookResults"; "NextToken" ] (fun tag _ ->
      match tag with
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> list_hook_results_target_type_of_xml i)
                 ())
      | "TargetId" ->
          r_target_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetId"
                 (fun i _ -> hook_result_id_of_xml i)
                 ())
      | "HookResults" ->
          r_hook_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookResults"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> hook_result_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_type = ( ! ) r_target_type;
     target_id = ( ! ) r_target_id;
     hook_results = ( ! ) r_hook_results;
     next_token = ( ! ) r_next_token;
   }
    : list_hook_results_output)

let list_hook_results_input_of_xml i =
  let r_target_type = ref None in
  let r_target_id = ref None in
  let r_type_arn = ref None in
  let r_status = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TargetType"; "TargetId"; "TypeArn"; "Status"; "NextToken" ] (fun tag _ ->
      match tag with
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> list_hook_results_target_type_of_xml i)
                 ())
      | "TargetId" ->
          r_target_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetId"
                 (fun i _ -> hook_result_id_of_xml i)
                 ())
      | "TypeArn" ->
          r_type_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> hook_type_arn_of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> hook_status_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_type = ( ! ) r_target_type;
     target_id = ( ! ) r_target_id;
     type_arn = ( ! ) r_type_arn;
     status = ( ! ) r_status;
     next_token = ( ! ) r_next_token;
   }
    : list_hook_results_input)

let number_of_resources_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let template_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let generated_template_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CREATE_PENDING" -> CREATE_PENDING
   | "UPDATE_PENDING" -> UPDATE_PENDING
   | "DELETE_PENDING" -> DELETE_PENDING
   | "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
   | "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | "FAILED" -> FAILED
   | "COMPLETE" -> COMPLETE
   | _ -> failwith "unknown enum value"
    : generated_template_status)

let template_summary_of_xml i =
  let r_generated_template_id = ref None in
  let r_generated_template_name = ref None in
  let r_status = ref None in
  let r_status_reason = ref None in
  let r_creation_time = ref None in
  let r_last_updated_time = ref None in
  let r_number_of_resources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "GeneratedTemplateId";
      "GeneratedTemplateName";
      "Status";
      "StatusReason";
      "CreationTime";
      "LastUpdatedTime";
      "NumberOfResources";
    ] (fun tag _ ->
      match tag with
      | "GeneratedTemplateId" ->
          r_generated_template_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateId"
                 (fun i _ -> generated_template_id_of_xml i)
                 ())
      | "GeneratedTemplateName" ->
          r_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> generated_template_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> template_status_reason_of_xml i)
                 ())
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "LastUpdatedTime" ->
          r_last_updated_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTime"
                 (fun i _ -> last_updated_time_of_xml i)
                 ())
      | "NumberOfResources" ->
          r_number_of_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfResources"
                 (fun i _ -> number_of_resources_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     generated_template_id = ( ! ) r_generated_template_id;
     generated_template_name = ( ! ) r_generated_template_name;
     status = ( ! ) r_status;
     status_reason = ( ! ) r_status_reason;
     creation_time = ( ! ) r_creation_time;
     last_updated_time = ( ! ) r_last_updated_time;
     number_of_resources = ( ! ) r_number_of_resources;
   }
    : template_summary)

let template_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> template_summary_of_xml i) ()

let list_generated_templates_output_of_xml i =
  let r_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Summaries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> template_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ summaries = ( ! ) r_summaries; next_token = ( ! ) r_next_token }
    : list_generated_templates_output)

let list_generated_templates_input_of_xml i =
  let r_next_token = ref None in
  let r_max_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxResults" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_results_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; max_results = ( ! ) r_max_results }
    : list_generated_templates_input)

let export_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let export__of_xml i =
  let r_exporting_stack_id = ref None in
  let r_name = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ExportingStackId"; "Name"; "Value" ] (fun tag _ ->
      match tag with
      | "ExportingStackId" ->
          r_exporting_stack_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExportingStackId"
                 (fun i _ -> stack_id_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> export_name_of_xml i) ())
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> export_value_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ exporting_stack_id = ( ! ) r_exporting_stack_id; name = ( ! ) r_name; value = ( ! ) r_value }
    : export_)

let exports_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> export__of_xml i) ()

let list_exports_output_of_xml i =
  let r_exports = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Exports"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Exports" ->
          r_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Exports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> export__of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ exports = ( ! ) r_exports; next_token = ( ! ) r_next_token } : list_exports_output)

let list_exports_input_of_xml i =
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token } : list_exports_input)

let list_change_sets_output_of_xml i =
  let r_summaries = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Summaries"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> change_set_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ summaries = ( ! ) r_summaries; next_token = ( ! ) r_next_token } : list_change_sets_output)

let list_change_sets_input_of_xml i =
  let r_stack_name = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "NextToken" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     next_token = ( ! ) r_next_token;
   }
    : list_change_sets_input)

let stack_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : stack_not_found_exception)

let import_stacks_to_stack_set_output_of_xml i =
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationId" ] (fun tag _ ->
      match tag with
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_id = ( ! ) r_operation_id } : import_stacks_to_stack_set_output)

let stack_ids_url_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_id_of_xml i) ()

let import_stacks_to_stack_set_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_stack_ids = ref None in
  let r_stack_ids_url = ref None in
  let r_organizational_unit_ids = ref None in
  let r_operation_preferences = ref None in
  let r_operation_id = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetName";
      "StackIds";
      "StackIdsUrl";
      "OrganizationalUnitIds";
      "OperationPreferences";
      "OperationId";
      "CallAs";
    ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | "StackIds" ->
          r_stack_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_id_of_xml i) ())
                 ())
      | "StackIdsUrl" ->
          r_stack_ids_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackIdsUrl"
                 (fun i _ -> stack_ids_url_of_xml i)
                 ())
      | "OrganizationalUnitIds" ->
          r_organizational_unit_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationalUnitIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> organizational_unit_id_of_xml i)
                     ())
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     stack_ids = ( ! ) r_stack_ids;
     stack_ids_url = ( ! ) r_stack_ids_url;
     organizational_unit_ids = ( ! ) r_organizational_unit_ids;
     operation_preferences = ( ! ) r_operation_preferences;
     operation_id = ( ! ) r_operation_id;
     call_as = ( ! ) r_call_as;
   }
    : import_stacks_to_stack_set_input)

let warnings_of_xml i =
  let r_unrecognized_resource_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UnrecognizedResourceTypes" ] (fun tag _ ->
      match tag with
      | "UnrecognizedResourceTypes" ->
          r_unrecognized_resource_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UnrecognizedResourceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_type_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ unrecognized_resource_types = ( ! ) r_unrecognized_resource_types } : warnings)

let resource_identifiers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> resource_identifier_property_key_of_xml i)
    ()

let logical_resource_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> logical_resource_id_of_xml i) ()

let resource_identifier_summary_of_xml i =
  let r_resource_type = ref None in
  let r_logical_resource_ids = ref None in
  let r_resource_identifiers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceType"; "LogicalResourceIds"; "ResourceIdentifiers" ] (fun tag _ ->
      match tag with
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "LogicalResourceIds" ->
          r_logical_resource_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> logical_resource_id_of_xml i)
                     ())
                 ())
      | "ResourceIdentifiers" ->
          r_resource_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_identifier_property_key_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_type = ( ! ) r_resource_type;
     logical_resource_ids = ( ! ) r_logical_resource_ids;
     resource_identifiers = ( ! ) r_resource_identifiers;
   }
    : resource_identifier_summary)

let resource_identifier_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_identifier_summary_of_xml i) ()

let metadata_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let version_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let parameter_constraints_of_xml i =
  let r_allowed_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AllowedValues" ] (fun tag _ ->
      match tag with
      | "AllowedValues" ->
          r_allowed_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AllowedValues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> allowed_value_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ allowed_values = ( ! ) r_allowed_values } : parameter_constraints)

let parameter_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let parameter_declaration_of_xml i =
  let r_parameter_key = ref None in
  let r_default_value = ref None in
  let r_parameter_type = ref None in
  let r_no_echo = ref None in
  let r_description = ref None in
  let r_parameter_constraints = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ParameterKey";
      "DefaultValue";
      "ParameterType";
      "NoEcho";
      "Description";
      "ParameterConstraints";
    ] (fun tag _ ->
      match tag with
      | "ParameterKey" ->
          r_parameter_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterKey"
                 (fun i _ -> parameter_key_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> parameter_value_of_xml i)
                 ())
      | "ParameterType" ->
          r_parameter_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterType"
                 (fun i _ -> parameter_type_of_xml i)
                 ())
      | "NoEcho" ->
          r_no_echo :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NoEcho" (fun i _ -> no_echo_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ParameterConstraints" ->
          r_parameter_constraints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterConstraints"
                 (fun i _ -> parameter_constraints_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_key = ( ! ) r_parameter_key;
     default_value = ( ! ) r_default_value;
     parameter_type = ( ! ) r_parameter_type;
     no_echo = ( ! ) r_no_echo;
     description = ( ! ) r_description;
     parameter_constraints = ( ! ) r_parameter_constraints;
   }
    : parameter_declaration)

let parameter_declarations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_declaration_of_xml i) ()

let get_template_summary_output_of_xml i =
  let r_parameters = ref None in
  let r_description = ref None in
  let r_capabilities = ref None in
  let r_capabilities_reason = ref None in
  let r_resource_types = ref None in
  let r_version = ref None in
  let r_metadata = ref None in
  let r_declared_transforms = ref None in
  let r_resource_identifier_summaries = ref None in
  let r_warnings = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Parameters";
      "Description";
      "Capabilities";
      "CapabilitiesReason";
      "ResourceTypes";
      "Version";
      "Metadata";
      "DeclaredTransforms";
      "ResourceIdentifierSummaries";
      "Warnings";
    ] (fun tag _ ->
      match tag with
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> parameter_declaration_of_xml i)
                     ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "CapabilitiesReason" ->
          r_capabilities_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapabilitiesReason"
                 (fun i _ -> capabilities_reason_of_xml i)
                 ())
      | "ResourceTypes" ->
          r_resource_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_type_of_xml i)
                     ())
                 ())
      | "Version" ->
          r_version :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Version" (fun i _ -> version_of_xml i) ())
      | "Metadata" ->
          r_metadata :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Metadata" (fun i _ -> metadata_of_xml i) ())
      | "DeclaredTransforms" ->
          r_declared_transforms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeclaredTransforms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> transform_name_of_xml i)
                     ())
                 ())
      | "ResourceIdentifierSummaries" ->
          r_resource_identifier_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifierSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_identifier_summary_of_xml i)
                     ())
                 ())
      | "Warnings" ->
          r_warnings :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Warnings" (fun i _ -> warnings_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameters = ( ! ) r_parameters;
     description = ( ! ) r_description;
     capabilities = ( ! ) r_capabilities;
     capabilities_reason = ( ! ) r_capabilities_reason;
     resource_types = ( ! ) r_resource_types;
     version = ( ! ) r_version;
     metadata = ( ! ) r_metadata;
     declared_transforms = ( ! ) r_declared_transforms;
     resource_identifier_summaries = ( ! ) r_resource_identifier_summaries;
     warnings = ( ! ) r_warnings;
   }
    : get_template_summary_output)

let treat_unrecognized_resource_types_as_warnings_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let template_summary_config_of_xml i =
  let r_treat_unrecognized_resource_types_as_warnings = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TreatUnrecognizedResourceTypesAsWarnings" ]
    (fun tag _ ->
      match tag with
      | "TreatUnrecognizedResourceTypesAsWarnings" ->
          r_treat_unrecognized_resource_types_as_warnings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TreatUnrecognizedResourceTypesAsWarnings"
                 (fun i _ -> treat_unrecognized_resource_types_as_warnings_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     treat_unrecognized_resource_types_as_warnings =
       ( ! ) r_treat_unrecognized_resource_types_as_warnings;
   }
    : template_summary_config)

let get_template_summary_input_of_xml i =
  let r_template_body = ref None in
  let r_template_ur_l = ref None in
  let r_stack_name = ref None in
  let r_stack_set_name = ref None in
  let r_call_as = ref None in
  let r_template_summary_config = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TemplateBody"; "TemplateURL"; "StackName"; "StackSetName"; "CallAs"; "TemplateSummaryConfig";
    ] (fun tag _ ->
      match tag with
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "TemplateSummaryConfig" ->
          r_template_summary_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateSummaryConfig"
                 (fun i _ -> template_summary_config_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_body = ( ! ) r_template_body;
     template_ur_l = ( ! ) r_template_ur_l;
     stack_name = ( ! ) r_stack_name;
     stack_set_name = ( ! ) r_stack_set_name;
     call_as = ( ! ) r_call_as;
     template_summary_config = ( ! ) r_template_summary_config;
   }
    : get_template_summary_input)

let template_stage_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Original" -> Original
   | "Processed" -> Processed
   | _ -> failwith "unknown enum value"
    : template_stage)

let stage_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> template_stage_of_xml i) ()

let get_template_output_of_xml i =
  let r_template_body = ref None in
  let r_stages_available = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateBody"; "StagesAvailable" ] (fun tag _ ->
      match tag with
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "StagesAvailable" ->
          r_stages_available :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StagesAvailable"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> template_stage_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_body = ( ! ) r_template_body; stages_available = ( ! ) r_stages_available }
    : get_template_output)

let get_template_input_of_xml i =
  let r_stack_name = ref None in
  let r_change_set_name = ref None in
  let r_template_stage = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "ChangeSetName"; "TemplateStage" ]
    (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_or_id_of_xml i)
                 ())
      | "TemplateStage" ->
          r_template_stage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateStage"
                 (fun i _ -> template_stage_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = ( ! ) r_stack_name;
     change_set_name = ( ! ) r_change_set_name;
     template_stage = ( ! ) r_template_stage;
   }
    : get_template_input)

let get_stack_policy_output_of_xml i =
  let r_stack_policy_body = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackPolicyBody" ] (fun tag _ ->
      match tag with
      | "StackPolicyBody" ->
          r_stack_policy_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyBody"
                 (fun i _ -> stack_policy_body_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_policy_body = ( ! ) r_stack_policy_body } : get_stack_policy_output)

let get_stack_policy_input_of_xml i =
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i }
    : get_stack_policy_input)

let hook_target_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CREATE" -> CREATE
   | "UPDATE" -> UPDATE
   | "DELETE" -> DELETE
   | "IMPORT" -> IMPORT
   | _ -> failwith "unknown enum value"
    : hook_target_action)

let hook_target_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let hook_target_of_xml i =
  let r_target_type = ref None in
  let r_target_type_name = ref None in
  let r_target_id = ref None in
  let r_action = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TargetType"; "TargetTypeName"; "TargetId"; "Action" ] (fun tag _ ->
      match tag with
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> hook_target_type_of_xml i)
                 ())
      | "TargetTypeName" ->
          r_target_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetTypeName"
                 (fun i _ -> hook_target_type_name_of_xml i)
                 ())
      | "TargetId" ->
          r_target_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetId"
                 (fun i _ -> hook_target_id_of_xml i)
                 ())
      | "Action" ->
          r_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Action"
                 (fun i _ -> hook_target_action_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_type = Smaws_Lib.Xml.Parse.required "TargetType" (( ! ) r_target_type) i;
     target_type_name = Smaws_Lib.Xml.Parse.required "TargetTypeName" (( ! ) r_target_type_name) i;
     target_id = Smaws_Lib.Xml.Parse.required "TargetId" (( ! ) r_target_id) i;
     action = Smaws_Lib.Xml.Parse.required "Action" (( ! ) r_action) i;
   }
    : hook_target)

let get_hook_result_output_of_xml i =
  let r_hook_result_id = ref None in
  let r_invocation_point = ref None in
  let r_failure_mode = ref None in
  let r_type_name = ref None in
  let r_original_type_name = ref None in
  let r_type_version_id = ref None in
  let r_type_configuration_version_id = ref None in
  let r_type_arn = ref None in
  let r_status = ref None in
  let r_hook_status_reason = ref None in
  let r_invoked_at = ref None in
  let r_target = ref None in
  let r_annotations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "HookResultId";
      "InvocationPoint";
      "FailureMode";
      "TypeName";
      "OriginalTypeName";
      "TypeVersionId";
      "TypeConfigurationVersionId";
      "TypeArn";
      "Status";
      "HookStatusReason";
      "InvokedAt";
      "Target";
      "Annotations";
    ] (fun tag _ ->
      match tag with
      | "HookResultId" ->
          r_hook_result_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookResultId"
                 (fun i _ -> hook_invocation_id_of_xml i)
                 ())
      | "InvocationPoint" ->
          r_invocation_point :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvocationPoint"
                 (fun i _ -> hook_invocation_point_of_xml i)
                 ())
      | "FailureMode" ->
          r_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName"
                 (fun i _ -> hook_type_name_of_xml i)
                 ())
      | "OriginalTypeName" ->
          r_original_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OriginalTypeName"
                 (fun i _ -> hook_type_name_of_xml i)
                 ())
      | "TypeVersionId" ->
          r_type_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeVersionId"
                 (fun i _ -> hook_type_version_id_of_xml i)
                 ())
      | "TypeConfigurationVersionId" ->
          r_type_configuration_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationVersionId"
                 (fun i _ -> hook_type_configuration_version_id_of_xml i)
                 ())
      | "TypeArn" ->
          r_type_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> hook_type_arn_of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> hook_status_of_xml i) ())
      | "HookStatusReason" ->
          r_hook_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatusReason"
                 (fun i _ -> hook_status_reason_of_xml i)
                 ())
      | "InvokedAt" ->
          r_invoked_at :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvokedAt" (fun i _ -> timestamp_of_xml i) ())
      | "Target" ->
          r_target :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Target" (fun i _ -> hook_target_of_xml i) ())
      | "Annotations" ->
          r_annotations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Annotations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> annotation_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     hook_result_id = ( ! ) r_hook_result_id;
     invocation_point = ( ! ) r_invocation_point;
     failure_mode = ( ! ) r_failure_mode;
     type_name = ( ! ) r_type_name;
     original_type_name = ( ! ) r_original_type_name;
     type_version_id = ( ! ) r_type_version_id;
     type_configuration_version_id = ( ! ) r_type_configuration_version_id;
     type_arn = ( ! ) r_type_arn;
     status = ( ! ) r_status;
     hook_status_reason = ( ! ) r_hook_status_reason;
     invoked_at = ( ! ) r_invoked_at;
     target = ( ! ) r_target;
     annotations = ( ! ) r_annotations;
   }
    : get_hook_result_output)

let get_hook_result_input_of_xml i =
  let r_hook_result_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HookResultId" ] (fun tag _ ->
      match tag with
      | "HookResultId" ->
          r_hook_result_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookResultId"
                 (fun i _ -> hook_invocation_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ hook_result_id = ( ! ) r_hook_result_id } : get_hook_result_input)

let get_generated_template_output_of_xml i =
  let r_status = ref None in
  let r_template_body = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "TemplateBody" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> generated_template_status_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status; template_body = ( ! ) r_template_body }
    : get_generated_template_output)

let template_format_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "JSON" -> JSON | "YAML" -> YAML | _ -> failwith "unknown enum value"
    : template_format)

let get_generated_template_input_of_xml i =
  let r_format = ref None in
  let r_generated_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Format"; "GeneratedTemplateName" ] (fun tag _ ->
      match tag with
      | "Format" ->
          r_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Format"
                 (fun i _ -> template_format_of_xml i)
                 ())
      | "GeneratedTemplateName" ->
          r_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     format = ( ! ) r_format;
     generated_template_name =
       Smaws_Lib.Xml.Parse.required "GeneratedTemplateName" (( ! ) r_generated_template_name) i;
   }
    : get_generated_template_input)

let execute_stack_refactor_input_of_xml i =
  let r_stack_refactor_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackRefactorId" ] (fun tag _ ->
      match tag with
      | "StackRefactorId" ->
          r_stack_refactor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackRefactorId"
                 (fun i _ -> stack_refactor_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_refactor_id =
       Smaws_Lib.Xml.Parse.required "StackRefactorId" (( ! ) r_stack_refactor_id) i;
   }
    : execute_stack_refactor_input)

let invalid_change_set_status_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_change_set_status_exception)

let execute_change_set_output_of_xml i = ()

let execute_change_set_input_of_xml i =
  let r_change_set_name = ref None in
  let r_stack_name = ref None in
  let r_client_request_token = ref None in
  let r_disable_rollback = ref None in
  let r_retain_except_on_create = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ChangeSetName"; "StackName"; "ClientRequestToken"; "DisableRollback"; "RetainExceptOnCreate";
    ] (fun tag _ ->
      match tag with
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_or_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "DisableRollback" ->
          r_disable_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableRollback"
                 (fun i _ -> disable_rollback_of_xml i)
                 ())
      | "RetainExceptOnCreate" ->
          r_retain_except_on_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainExceptOnCreate"
                 (fun i _ -> retain_except_on_create_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     change_set_name = Smaws_Lib.Xml.Parse.required "ChangeSetName" (( ! ) r_change_set_name) i;
     stack_name = ( ! ) r_stack_name;
     client_request_token = ( ! ) r_client_request_token;
     disable_rollback = ( ! ) r_disable_rollback;
     retain_except_on_create = ( ! ) r_retain_except_on_create;
   }
    : execute_change_set_input)

let url_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let estimate_template_cost_output_of_xml i =
  let r_url = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Url" ] (fun tag _ ->
      match tag with
      | "Url" ->
          r_url := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Url" (fun i _ -> url_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ url = ( ! ) r_url } : estimate_template_cost_output)

let estimate_template_cost_input_of_xml i =
  let r_template_body = ref None in
  let r_template_ur_l = ref None in
  let r_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateBody"; "TemplateURL"; "Parameters" ]
    (fun tag _ ->
      match tag with
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_body = ( ! ) r_template_body;
     template_ur_l = ( ! ) r_template_ur_l;
     parameters = ( ! ) r_parameters;
   }
    : estimate_template_cost_input)

let detect_stack_set_drift_output_of_xml i =
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationId" ] (fun tag _ ->
      match tag with
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_id = ( ! ) r_operation_id } : detect_stack_set_drift_output)

let detect_stack_set_drift_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_operation_preferences = ref None in
  let r_operation_id = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackSetName"; "OperationPreferences"; "OperationId"; "CallAs" ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     operation_preferences = ( ! ) r_operation_preferences;
     operation_id = ( ! ) r_operation_id;
     call_as = ( ! ) r_call_as;
   }
    : detect_stack_set_drift_input)

let stack_resource_drift_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let properties_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_resource_drift_of_xml i =
  let r_stack_id = ref None in
  let r_logical_resource_id = ref None in
  let r_physical_resource_id = ref None in
  let r_physical_resource_id_context = ref None in
  let r_resource_type = ref None in
  let r_expected_properties = ref None in
  let r_actual_properties = ref None in
  let r_property_differences = ref None in
  let r_stack_resource_drift_status = ref None in
  let r_timestamp = ref None in
  let r_module_info = ref None in
  let r_drift_status_reason = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackId";
      "LogicalResourceId";
      "PhysicalResourceId";
      "PhysicalResourceIdContext";
      "ResourceType";
      "ExpectedProperties";
      "ActualProperties";
      "PropertyDifferences";
      "StackResourceDriftStatus";
      "Timestamp";
      "ModuleInfo";
      "DriftStatusReason";
    ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "PhysicalResourceIdContext" ->
          r_physical_resource_id_context :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceIdContext"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> physical_resource_id_context_key_value_pair_of_xml i)
                     ())
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "ExpectedProperties" ->
          r_expected_properties :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpectedProperties"
                 (fun i _ -> properties_of_xml i)
                 ())
      | "ActualProperties" ->
          r_actual_properties :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActualProperties"
                 (fun i _ -> properties_of_xml i)
                 ())
      | "PropertyDifferences" ->
          r_property_differences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PropertyDifferences"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> property_difference_of_xml i)
                     ())
                 ())
      | "StackResourceDriftStatus" ->
          r_stack_resource_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDriftStatus"
                 (fun i _ -> stack_resource_drift_status_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "ModuleInfo" ->
          r_module_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModuleInfo"
                 (fun i _ -> module_info_of_xml i)
                 ())
      | "DriftStatusReason" ->
          r_drift_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftStatusReason"
                 (fun i _ -> stack_resource_drift_status_reason_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_id = Smaws_Lib.Xml.Parse.required "StackId" (( ! ) r_stack_id) i;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     physical_resource_id = ( ! ) r_physical_resource_id;
     physical_resource_id_context = ( ! ) r_physical_resource_id_context;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     expected_properties = ( ! ) r_expected_properties;
     actual_properties = ( ! ) r_actual_properties;
     property_differences = ( ! ) r_property_differences;
     stack_resource_drift_status =
       Smaws_Lib.Xml.Parse.required "StackResourceDriftStatus"
         (( ! ) r_stack_resource_drift_status)
         i;
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
     module_info = ( ! ) r_module_info;
     drift_status_reason = ( ! ) r_drift_status_reason;
   }
    : stack_resource_drift)

let detect_stack_resource_drift_output_of_xml i =
  let r_stack_resource_drift = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackResourceDrift" ] (fun tag _ ->
      match tag with
      | "StackResourceDrift" ->
          r_stack_resource_drift :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDrift"
                 (fun i _ -> stack_resource_drift_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_resource_drift =
       Smaws_Lib.Xml.Parse.required "StackResourceDrift" (( ! ) r_stack_resource_drift) i;
   }
    : detect_stack_resource_drift_output)

let detect_stack_resource_drift_input_of_xml i =
  let r_stack_name = ref None in
  let r_logical_resource_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "LogicalResourceId" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
   }
    : detect_stack_resource_drift_input)

let stack_drift_detection_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let detect_stack_drift_output_of_xml i =
  let r_stack_drift_detection_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackDriftDetectionId" ] (fun tag _ ->
      match tag with
      | "StackDriftDetectionId" ->
          r_stack_drift_detection_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftDetectionId"
                 (fun i _ -> stack_drift_detection_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_drift_detection_id =
       Smaws_Lib.Xml.Parse.required "StackDriftDetectionId" (( ! ) r_stack_drift_detection_id) i;
   }
    : detect_stack_drift_output)

let detect_stack_drift_input_of_xml i =
  let r_stack_name = ref None in
  let r_logical_resource_ids = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "LogicalResourceIds" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "LogicalResourceIds" ->
          r_logical_resource_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> logical_resource_id_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     logical_resource_ids = ( ! ) r_logical_resource_ids;
   }
    : detect_stack_drift_input)

let describe_type_registration_output_of_xml i =
  let r_progress_status = ref None in
  let r_description = ref None in
  let r_type_arn = ref None in
  let r_type_version_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ProgressStatus"; "Description"; "TypeArn"; "TypeVersionArn" ] (fun tag _ ->
      match tag with
      | "ProgressStatus" ->
          r_progress_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressStatus"
                 (fun i _ -> registration_status_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | "TypeVersionArn" ->
          r_type_version_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeVersionArn"
                 (fun i _ -> type_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     progress_status = ( ! ) r_progress_status;
     description = ( ! ) r_description;
     type_arn = ( ! ) r_type_arn;
     type_version_arn = ( ! ) r_type_version_arn;
   }
    : describe_type_registration_output)

let describe_type_registration_input_of_xml i =
  let r_registration_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "RegistrationToken" ] (fun tag _ ->
      match tag with
      | "RegistrationToken" ->
          r_registration_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegistrationToken"
                 (fun i _ -> registration_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     registration_token =
       Smaws_Lib.Xml.Parse.required "RegistrationToken" (( ! ) r_registration_token) i;
   }
    : describe_type_registration_input)

let configuration_schema_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let optional_secure_url_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let supported_major_version_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let supported_major_versions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> supported_major_version_of_xml i) ()

let required_activated_type_of_xml i =
  let r_type_name_alias = ref None in
  let r_original_type_name = ref None in
  let r_publisher_id = ref None in
  let r_supported_major_versions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TypeNameAlias"; "OriginalTypeName"; "PublisherId"; "SupportedMajorVersions" ] (fun tag _ ->
      match tag with
      | "TypeNameAlias" ->
          r_type_name_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeNameAlias"
                 (fun i _ -> type_name_of_xml i)
                 ())
      | "OriginalTypeName" ->
          r_original_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OriginalTypeName"
                 (fun i _ -> type_name_of_xml i)
                 ())
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | "SupportedMajorVersions" ->
          r_supported_major_versions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedMajorVersions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> supported_major_version_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_name_alias = ( ! ) r_type_name_alias;
     original_type_name = ( ! ) r_original_type_name;
     publisher_id = ( ! ) r_publisher_id;
     supported_major_versions = ( ! ) r_supported_major_versions;
   }
    : required_activated_type)

let required_activated_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> required_activated_type_of_xml i) ()

let type_schema_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let type_tests_status_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let type_tests_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PASSED" -> PASSED
   | "FAILED" -> FAILED
   | "IN_PROGRESS" -> IN_PROGRESS
   | "NOT_TESTED" -> NOT_TESTED
   | _ -> failwith "unknown enum value"
    : type_tests_status)

let describe_type_output_of_xml i =
  let r_arn = ref None in
  let r_type_ = ref None in
  let r_type_name = ref None in
  let r_default_version_id = ref None in
  let r_is_default_version = ref None in
  let r_type_tests_status = ref None in
  let r_type_tests_status_description = ref None in
  let r_description = ref None in
  let r_schema = ref None in
  let r_provisioning_type = ref None in
  let r_deprecated_status = ref None in
  let r_logging_config = ref None in
  let r_required_activated_types = ref None in
  let r_execution_role_arn = ref None in
  let r_visibility = ref None in
  let r_source_url = ref None in
  let r_documentation_url = ref None in
  let r_last_updated = ref None in
  let r_time_created = ref None in
  let r_configuration_schema = ref None in
  let r_publisher_id = ref None in
  let r_original_type_name = ref None in
  let r_original_type_arn = ref None in
  let r_public_version_number = ref None in
  let r_latest_public_version = ref None in
  let r_is_activated = ref None in
  let r_auto_update = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Arn";
      "Type";
      "TypeName";
      "DefaultVersionId";
      "IsDefaultVersion";
      "TypeTestsStatus";
      "TypeTestsStatusDescription";
      "Description";
      "Schema";
      "ProvisioningType";
      "DeprecatedStatus";
      "LoggingConfig";
      "RequiredActivatedTypes";
      "ExecutionRoleArn";
      "Visibility";
      "SourceUrl";
      "DocumentationUrl";
      "LastUpdated";
      "TimeCreated";
      "ConfigurationSchema";
      "PublisherId";
      "OriginalTypeName";
      "OriginalTypeArn";
      "PublicVersionNumber";
      "LatestPublicVersion";
      "IsActivated";
      "AutoUpdate";
    ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> type_arn_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "DefaultVersionId" ->
          r_default_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultVersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "IsDefaultVersion" ->
          r_is_default_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsDefaultVersion"
                 (fun i _ -> is_default_version_of_xml i)
                 ())
      | "TypeTestsStatus" ->
          r_type_tests_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeTestsStatus"
                 (fun i _ -> type_tests_status_of_xml i)
                 ())
      | "TypeTestsStatusDescription" ->
          r_type_tests_status_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeTestsStatusDescription"
                 (fun i _ -> type_tests_status_description_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Schema" ->
          r_schema :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Schema" (fun i _ -> type_schema_of_xml i) ())
      | "ProvisioningType" ->
          r_provisioning_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProvisioningType"
                 (fun i _ -> provisioning_type_of_xml i)
                 ())
      | "DeprecatedStatus" ->
          r_deprecated_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeprecatedStatus"
                 (fun i _ -> deprecated_status_of_xml i)
                 ())
      | "LoggingConfig" ->
          r_logging_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoggingConfig"
                 (fun i _ -> logging_config_of_xml i)
                 ())
      | "RequiredActivatedTypes" ->
          r_required_activated_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequiredActivatedTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> required_activated_type_of_xml i)
                     ())
                 ())
      | "ExecutionRoleArn" ->
          r_execution_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleArn"
                 (fun i _ -> role_ar_n2_of_xml i)
                 ())
      | "Visibility" ->
          r_visibility :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Visibility" (fun i _ -> visibility_of_xml i) ())
      | "SourceUrl" ->
          r_source_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceUrl"
                 (fun i _ -> optional_secure_url_of_xml i)
                 ())
      | "DocumentationUrl" ->
          r_documentation_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DocumentationUrl"
                 (fun i _ -> optional_secure_url_of_xml i)
                 ())
      | "LastUpdated" ->
          r_last_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdated" (fun i _ -> timestamp_of_xml i) ())
      | "TimeCreated" ->
          r_time_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeCreated" (fun i _ -> timestamp_of_xml i) ())
      | "ConfigurationSchema" ->
          r_configuration_schema :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSchema"
                 (fun i _ -> configuration_schema_of_xml i)
                 ())
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | "OriginalTypeName" ->
          r_original_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OriginalTypeName"
                 (fun i _ -> type_name_of_xml i)
                 ())
      | "OriginalTypeArn" ->
          r_original_type_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OriginalTypeArn"
                 (fun i _ -> type_arn_of_xml i)
                 ())
      | "PublicVersionNumber" ->
          r_public_version_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicVersionNumber"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | "LatestPublicVersion" ->
          r_latest_public_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LatestPublicVersion"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | "IsActivated" ->
          r_is_activated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsActivated"
                 (fun i _ -> is_activated_of_xml i)
                 ())
      | "AutoUpdate" ->
          r_auto_update :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoUpdate"
                 (fun i _ -> auto_update_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = ( ! ) r_arn;
     type_ = ( ! ) r_type_;
     type_name = ( ! ) r_type_name;
     default_version_id = ( ! ) r_default_version_id;
     is_default_version = ( ! ) r_is_default_version;
     type_tests_status = ( ! ) r_type_tests_status;
     type_tests_status_description = ( ! ) r_type_tests_status_description;
     description = ( ! ) r_description;
     schema = ( ! ) r_schema;
     provisioning_type = ( ! ) r_provisioning_type;
     deprecated_status = ( ! ) r_deprecated_status;
     logging_config = ( ! ) r_logging_config;
     required_activated_types = ( ! ) r_required_activated_types;
     execution_role_arn = ( ! ) r_execution_role_arn;
     visibility = ( ! ) r_visibility;
     source_url = ( ! ) r_source_url;
     documentation_url = ( ! ) r_documentation_url;
     last_updated = ( ! ) r_last_updated;
     time_created = ( ! ) r_time_created;
     configuration_schema = ( ! ) r_configuration_schema;
     publisher_id = ( ! ) r_publisher_id;
     original_type_name = ( ! ) r_original_type_name;
     original_type_arn = ( ! ) r_original_type_arn;
     public_version_number = ( ! ) r_public_version_number;
     latest_public_version = ( ! ) r_latest_public_version;
     is_activated = ( ! ) r_is_activated;
     auto_update = ( ! ) r_auto_update;
   }
    : describe_type_output)

let describe_type_input_of_xml i =
  let r_type_ = ref None in
  let r_type_name = ref None in
  let r_arn = ref None in
  let r_version_id = ref None in
  let r_publisher_id = ref None in
  let r_public_version_number = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Type"; "TypeName"; "Arn"; "VersionId"; "PublisherId"; "PublicVersionNumber" ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> type_arn_of_xml i) ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | "PublicVersionNumber" ->
          r_public_version_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicVersionNumber"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     type_name = ( ! ) r_type_name;
     arn = ( ! ) r_arn;
     version_id = ( ! ) r_version_id;
     publisher_id = ( ! ) r_publisher_id;
     public_version_number = ( ! ) r_public_version_number;
   }
    : describe_type_input)

let in_progress_stack_instances_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let in_sync_stack_instances_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let drifted_stack_instances_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let total_stack_instances_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let stack_set_drift_detection_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "COMPLETED" -> COMPLETED
   | "FAILED" -> FAILED
   | "PARTIAL_SUCCESS" -> PARTIAL_SUCCESS
   | "IN_PROGRESS" -> IN_PROGRESS
   | "STOPPED" -> STOPPED
   | _ -> failwith "unknown enum value"
    : stack_set_drift_detection_status)

let stack_set_drift_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DRIFTED" -> DRIFTED
   | "IN_SYNC" -> IN_SYNC
   | "NOT_CHECKED" -> NOT_CHECKED
   | _ -> failwith "unknown enum value"
    : stack_set_drift_status)

let stack_set_drift_detection_details_of_xml i =
  let r_drift_status = ref None in
  let r_drift_detection_status = ref None in
  let r_last_drift_check_timestamp = ref None in
  let r_total_stack_instances_count = ref None in
  let r_drifted_stack_instances_count = ref None in
  let r_in_sync_stack_instances_count = ref None in
  let r_in_progress_stack_instances_count = ref None in
  let r_failed_stack_instances_count = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DriftStatus";
      "DriftDetectionStatus";
      "LastDriftCheckTimestamp";
      "TotalStackInstancesCount";
      "DriftedStackInstancesCount";
      "InSyncStackInstancesCount";
      "InProgressStackInstancesCount";
      "FailedStackInstancesCount";
    ] (fun tag _ ->
      match tag with
      | "DriftStatus" ->
          r_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftStatus"
                 (fun i _ -> stack_set_drift_status_of_xml i)
                 ())
      | "DriftDetectionStatus" ->
          r_drift_detection_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftDetectionStatus"
                 (fun i _ -> stack_set_drift_detection_status_of_xml i)
                 ())
      | "LastDriftCheckTimestamp" ->
          r_last_drift_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastDriftCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "TotalStackInstancesCount" ->
          r_total_stack_instances_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalStackInstancesCount"
                 (fun i _ -> total_stack_instances_count_of_xml i)
                 ())
      | "DriftedStackInstancesCount" ->
          r_drifted_stack_instances_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftedStackInstancesCount"
                 (fun i _ -> drifted_stack_instances_count_of_xml i)
                 ())
      | "InSyncStackInstancesCount" ->
          r_in_sync_stack_instances_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InSyncStackInstancesCount"
                 (fun i _ -> in_sync_stack_instances_count_of_xml i)
                 ())
      | "InProgressStackInstancesCount" ->
          r_in_progress_stack_instances_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InProgressStackInstancesCount"
                 (fun i _ -> in_progress_stack_instances_count_of_xml i)
                 ())
      | "FailedStackInstancesCount" ->
          r_failed_stack_instances_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailedStackInstancesCount"
                 (fun i _ -> failed_stack_instances_count_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     drift_status = ( ! ) r_drift_status;
     drift_detection_status = ( ! ) r_drift_detection_status;
     last_drift_check_timestamp = ( ! ) r_last_drift_check_timestamp;
     total_stack_instances_count = ( ! ) r_total_stack_instances_count;
     drifted_stack_instances_count = ( ! ) r_drifted_stack_instances_count;
     in_sync_stack_instances_count = ( ! ) r_in_sync_stack_instances_count;
     in_progress_stack_instances_count = ( ! ) r_in_progress_stack_instances_count;
     failed_stack_instances_count = ( ! ) r_failed_stack_instances_count;
   }
    : stack_set_drift_detection_details)

let retain_stacks_nullable_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let stack_set_operation_of_xml i =
  let r_operation_id = ref None in
  let r_stack_set_id = ref None in
  let r_action = ref None in
  let r_status = ref None in
  let r_operation_preferences = ref None in
  let r_retain_stacks = ref None in
  let r_administration_role_ar_n = ref None in
  let r_execution_role_name = ref None in
  let r_creation_timestamp = ref None in
  let r_end_timestamp = ref None in
  let r_deployment_targets = ref None in
  let r_stack_set_drift_detection_details = ref None in
  let r_status_reason = ref None in
  let r_status_details = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OperationId";
      "StackSetId";
      "Action";
      "Status";
      "OperationPreferences";
      "RetainStacks";
      "AdministrationRoleARN";
      "ExecutionRoleName";
      "CreationTimestamp";
      "EndTimestamp";
      "DeploymentTargets";
      "StackSetDriftDetectionDetails";
      "StatusReason";
      "StatusDetails";
    ] (fun tag _ ->
      match tag with
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "StackSetId" ->
          r_stack_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetId"
                 (fun i _ -> stack_set_id_of_xml i)
                 ())
      | "Action" ->
          r_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Action"
                 (fun i _ -> stack_set_operation_action_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_operation_status_of_xml i)
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "RetainStacks" ->
          r_retain_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainStacks"
                 (fun i _ -> retain_stacks_nullable_of_xml i)
                 ())
      | "AdministrationRoleARN" ->
          r_administration_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdministrationRoleARN"
                 (fun i _ -> role_ar_n_of_xml i)
                 ())
      | "ExecutionRoleName" ->
          r_execution_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleName"
                 (fun i _ -> execution_role_name_of_xml i)
                 ())
      | "CreationTimestamp" ->
          r_creation_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "EndTimestamp" ->
          r_end_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "DeploymentTargets" ->
          r_deployment_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTargets"
                 (fun i _ -> deployment_targets_of_xml i)
                 ())
      | "StackSetDriftDetectionDetails" ->
          r_stack_set_drift_detection_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetDriftDetectionDetails"
                 (fun i _ -> stack_set_drift_detection_details_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> stack_set_operation_status_reason_of_xml i)
                 ())
      | "StatusDetails" ->
          r_status_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusDetails"
                 (fun i _ -> stack_set_operation_status_details_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     operation_id = ( ! ) r_operation_id;
     stack_set_id = ( ! ) r_stack_set_id;
     action = ( ! ) r_action;
     status = ( ! ) r_status;
     operation_preferences = ( ! ) r_operation_preferences;
     retain_stacks = ( ! ) r_retain_stacks;
     administration_role_ar_n = ( ! ) r_administration_role_ar_n;
     execution_role_name = ( ! ) r_execution_role_name;
     creation_timestamp = ( ! ) r_creation_timestamp;
     end_timestamp = ( ! ) r_end_timestamp;
     deployment_targets = ( ! ) r_deployment_targets;
     stack_set_drift_detection_details = ( ! ) r_stack_set_drift_detection_details;
     status_reason = ( ! ) r_status_reason;
     status_details = ( ! ) r_status_details;
   }
    : stack_set_operation)

let describe_stack_set_operation_output_of_xml i =
  let r_stack_set_operation = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackSetOperation" ] (fun tag _ ->
      match tag with
      | "StackSetOperation" ->
          r_stack_set_operation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetOperation"
                 (fun i _ -> stack_set_operation_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_set_operation = ( ! ) r_stack_set_operation } : describe_stack_set_operation_output)

let describe_stack_set_operation_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_operation_id = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackSetName"; "OperationId"; "CallAs" ]
    (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     operation_id = Smaws_Lib.Xml.Parse.required "OperationId" (( ! ) r_operation_id) i;
     call_as = ( ! ) r_call_as;
   }
    : describe_stack_set_operation_input)

let stack_set_of_xml i =
  let r_stack_set_name = ref None in
  let r_stack_set_id = ref None in
  let r_description = ref None in
  let r_status = ref None in
  let r_template_body = ref None in
  let r_parameters = ref None in
  let r_capabilities = ref None in
  let r_tags = ref None in
  let r_stack_set_ar_n = ref None in
  let r_administration_role_ar_n = ref None in
  let r_execution_role_name = ref None in
  let r_stack_set_drift_detection_details = ref None in
  let r_auto_deployment = ref None in
  let r_permission_model = ref None in
  let r_organizational_unit_ids = ref None in
  let r_managed_execution = ref None in
  let r_regions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetName";
      "StackSetId";
      "Description";
      "Status";
      "TemplateBody";
      "Parameters";
      "Capabilities";
      "Tags";
      "StackSetARN";
      "AdministrationRoleARN";
      "ExecutionRoleName";
      "StackSetDriftDetectionDetails";
      "AutoDeployment";
      "PermissionModel";
      "OrganizationalUnitIds";
      "ManagedExecution";
      "Regions";
    ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "StackSetId" ->
          r_stack_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetId"
                 (fun i _ -> stack_set_id_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_status_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "StackSetARN" ->
          r_stack_set_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetARN"
                 (fun i _ -> stack_set_ar_n_of_xml i)
                 ())
      | "AdministrationRoleARN" ->
          r_administration_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdministrationRoleARN"
                 (fun i _ -> role_ar_n_of_xml i)
                 ())
      | "ExecutionRoleName" ->
          r_execution_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleName"
                 (fun i _ -> execution_role_name_of_xml i)
                 ())
      | "StackSetDriftDetectionDetails" ->
          r_stack_set_drift_detection_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetDriftDetectionDetails"
                 (fun i _ -> stack_set_drift_detection_details_of_xml i)
                 ())
      | "AutoDeployment" ->
          r_auto_deployment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoDeployment"
                 (fun i _ -> auto_deployment_of_xml i)
                 ())
      | "PermissionModel" ->
          r_permission_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionModel"
                 (fun i _ -> permission_models_of_xml i)
                 ())
      | "OrganizationalUnitIds" ->
          r_organizational_unit_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationalUnitIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> organizational_unit_id_of_xml i)
                     ())
                 ())
      | "ManagedExecution" ->
          r_managed_execution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedExecution"
                 (fun i _ -> managed_execution_of_xml i)
                 ())
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = ( ! ) r_stack_set_name;
     stack_set_id = ( ! ) r_stack_set_id;
     description = ( ! ) r_description;
     status = ( ! ) r_status;
     template_body = ( ! ) r_template_body;
     parameters = ( ! ) r_parameters;
     capabilities = ( ! ) r_capabilities;
     tags = ( ! ) r_tags;
     stack_set_ar_n = ( ! ) r_stack_set_ar_n;
     administration_role_ar_n = ( ! ) r_administration_role_ar_n;
     execution_role_name = ( ! ) r_execution_role_name;
     stack_set_drift_detection_details = ( ! ) r_stack_set_drift_detection_details;
     auto_deployment = ( ! ) r_auto_deployment;
     permission_model = ( ! ) r_permission_model;
     organizational_unit_ids = ( ! ) r_organizational_unit_ids;
     managed_execution = ( ! ) r_managed_execution;
     regions = ( ! ) r_regions;
   }
    : stack_set)

let describe_stack_set_output_of_xml i =
  let r_stack_set = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackSet" ] (fun tag _ ->
      match tag with
      | "StackSet" ->
          r_stack_set :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackSet" (fun i _ -> stack_set_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_set = ( ! ) r_stack_set } : describe_stack_set_output)

let describe_stack_set_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackSetName"; "CallAs" ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     call_as = ( ! ) r_call_as;
   }
    : describe_stack_set_input)

let detailed_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CONFIGURATION_COMPLETE" -> CONFIGURATION_COMPLETE
   | "VALIDATION_FAILED" -> VALIDATION_FAILED
   | _ -> failwith "unknown enum value"
    : detailed_status)

let deletion_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "STANDARD" -> STANDARD
   | "FORCE_DELETE_STACK" -> FORCE_DELETE_STACK
   | _ -> failwith "unknown enum value"
    : deletion_mode)

let stack_drift_information_of_xml i =
  let r_stack_drift_status = ref None in
  let r_last_check_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackDriftStatus"; "LastCheckTimestamp" ]
    (fun tag _ ->
      match tag with
      | "StackDriftStatus" ->
          r_stack_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | "LastCheckTimestamp" ->
          r_last_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_drift_status =
       Smaws_Lib.Xml.Parse.required "StackDriftStatus" (( ! ) r_stack_drift_status) i;
     last_check_timestamp = ( ! ) r_last_check_timestamp;
   }
    : stack_drift_information)

let output_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let output_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let output_of_xml i =
  let r_output_key = ref None in
  let r_output_value = ref None in
  let r_description = ref None in
  let r_export_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "OutputKey"; "OutputValue"; "Description"; "ExportName" ] (fun tag _ ->
      match tag with
      | "OutputKey" ->
          r_output_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputKey" (fun i _ -> output_key_of_xml i) ())
      | "OutputValue" ->
          r_output_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputValue"
                 (fun i _ -> output_value_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ExportName" ->
          r_export_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExportName"
                 (fun i _ -> export_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     output_key = ( ! ) r_output_key;
     output_value = ( ! ) r_output_value;
     description = ( ! ) r_description;
     export_name = ( ! ) r_export_name;
   }
    : output)

let outputs_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> output_of_xml i) ()

let timeout_minutes_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let stack_of_xml i =
  let r_stack_id = ref None in
  let r_stack_name = ref None in
  let r_change_set_id = ref None in
  let r_description = ref None in
  let r_parameters = ref None in
  let r_creation_time = ref None in
  let r_deletion_time = ref None in
  let r_last_updated_time = ref None in
  let r_rollback_configuration = ref None in
  let r_stack_status = ref None in
  let r_stack_status_reason = ref None in
  let r_disable_rollback = ref None in
  let r_deployment_config = ref None in
  let r_notification_ar_ns = ref None in
  let r_timeout_in_minutes = ref None in
  let r_capabilities = ref None in
  let r_outputs = ref None in
  let r_role_ar_n = ref None in
  let r_tags = ref None in
  let r_enable_termination_protection = ref None in
  let r_parent_id = ref None in
  let r_root_id = ref None in
  let r_drift_information = ref None in
  let r_retain_except_on_create = ref None in
  let r_deletion_mode = ref None in
  let r_detailed_status = ref None in
  let r_last_operations = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackId";
      "StackName";
      "ChangeSetId";
      "Description";
      "Parameters";
      "CreationTime";
      "DeletionTime";
      "LastUpdatedTime";
      "RollbackConfiguration";
      "StackStatus";
      "StackStatusReason";
      "DisableRollback";
      "DeploymentConfig";
      "NotificationARNs";
      "TimeoutInMinutes";
      "Capabilities";
      "Outputs";
      "RoleARN";
      "Tags";
      "EnableTerminationProtection";
      "ParentId";
      "RootId";
      "DriftInformation";
      "RetainExceptOnCreate";
      "DeletionMode";
      "DetailedStatus";
      "LastOperations";
    ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "ChangeSetId" ->
          r_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "DeletionTime" ->
          r_deletion_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionTime"
                 (fun i _ -> deletion_time_of_xml i)
                 ())
      | "LastUpdatedTime" ->
          r_last_updated_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTime"
                 (fun i _ -> last_updated_time_of_xml i)
                 ())
      | "RollbackConfiguration" ->
          r_rollback_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackConfiguration"
                 (fun i _ -> rollback_configuration_of_xml i)
                 ())
      | "StackStatus" ->
          r_stack_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackStatus"
                 (fun i _ -> stack_status_of_xml i)
                 ())
      | "StackStatusReason" ->
          r_stack_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackStatusReason"
                 (fun i _ -> stack_status_reason_of_xml i)
                 ())
      | "DisableRollback" ->
          r_disable_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableRollback"
                 (fun i _ -> disable_rollback_of_xml i)
                 ())
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | "NotificationARNs" ->
          r_notification_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> notification_ar_n_of_xml i)
                     ())
                 ())
      | "TimeoutInMinutes" ->
          r_timeout_in_minutes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeoutInMinutes"
                 (fun i _ -> timeout_minutes_of_xml i)
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "Outputs" ->
          r_outputs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Outputs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> output_of_xml i) ())
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "EnableTerminationProtection" ->
          r_enable_termination_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableTerminationProtection"
                 (fun i _ -> enable_termination_protection_of_xml i)
                 ())
      | "ParentId" ->
          r_parent_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ParentId" (fun i _ -> stack_id_of_xml i) ())
      | "RootId" ->
          r_root_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RootId" (fun i _ -> stack_id_of_xml i) ())
      | "DriftInformation" ->
          r_drift_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftInformation"
                 (fun i _ -> stack_drift_information_of_xml i)
                 ())
      | "RetainExceptOnCreate" ->
          r_retain_except_on_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainExceptOnCreate"
                 (fun i _ -> retain_except_on_create_of_xml i)
                 ())
      | "DeletionMode" ->
          r_deletion_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionMode"
                 (fun i _ -> deletion_mode_of_xml i)
                 ())
      | "DetailedStatus" ->
          r_detailed_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetailedStatus"
                 (fun i _ -> detailed_status_of_xml i)
                 ())
      | "LastOperations" ->
          r_last_operations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastOperations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> operation_entry_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_id = ( ! ) r_stack_id;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     change_set_id = ( ! ) r_change_set_id;
     description = ( ! ) r_description;
     parameters = ( ! ) r_parameters;
     creation_time = Smaws_Lib.Xml.Parse.required "CreationTime" (( ! ) r_creation_time) i;
     deletion_time = ( ! ) r_deletion_time;
     last_updated_time = ( ! ) r_last_updated_time;
     rollback_configuration = ( ! ) r_rollback_configuration;
     stack_status = Smaws_Lib.Xml.Parse.required "StackStatus" (( ! ) r_stack_status) i;
     stack_status_reason = ( ! ) r_stack_status_reason;
     disable_rollback = ( ! ) r_disable_rollback;
     deployment_config = ( ! ) r_deployment_config;
     notification_ar_ns = ( ! ) r_notification_ar_ns;
     timeout_in_minutes = ( ! ) r_timeout_in_minutes;
     capabilities = ( ! ) r_capabilities;
     outputs = ( ! ) r_outputs;
     role_ar_n = ( ! ) r_role_ar_n;
     tags = ( ! ) r_tags;
     enable_termination_protection = ( ! ) r_enable_termination_protection;
     parent_id = ( ! ) r_parent_id;
     root_id = ( ! ) r_root_id;
     drift_information = ( ! ) r_drift_information;
     retain_except_on_create = ( ! ) r_retain_except_on_create;
     deletion_mode = ( ! ) r_deletion_mode;
     detailed_status = ( ! ) r_detailed_status;
     last_operations = ( ! ) r_last_operations;
   }
    : stack)

let stacks_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_of_xml i) ()

let describe_stacks_output_of_xml i =
  let r_stacks = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Stacks"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Stacks" ->
          r_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stacks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stacks = ( ! ) r_stacks; next_token = ( ! ) r_next_token } : describe_stacks_output)

let describe_stacks_input_of_xml i =
  let r_stack_name = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "NextToken" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_name = ( ! ) r_stack_name; next_token = ( ! ) r_next_token } : describe_stacks_input)

let stack_resource_drift_information_of_xml i =
  let r_stack_resource_drift_status = ref None in
  let r_last_check_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackResourceDriftStatus"; "LastCheckTimestamp" ]
    (fun tag _ ->
      match tag with
      | "StackResourceDriftStatus" ->
          r_stack_resource_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDriftStatus"
                 (fun i _ -> stack_resource_drift_status_of_xml i)
                 ())
      | "LastCheckTimestamp" ->
          r_last_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_resource_drift_status =
       Smaws_Lib.Xml.Parse.required "StackResourceDriftStatus"
         (( ! ) r_stack_resource_drift_status)
         i;
     last_check_timestamp = ( ! ) r_last_check_timestamp;
   }
    : stack_resource_drift_information)

let stack_resource_of_xml i =
  let r_stack_name = ref None in
  let r_stack_id = ref None in
  let r_logical_resource_id = ref None in
  let r_physical_resource_id = ref None in
  let r_resource_type = ref None in
  let r_timestamp = ref None in
  let r_resource_status = ref None in
  let r_resource_status_reason = ref None in
  let r_description = ref None in
  let r_drift_information = ref None in
  let r_module_info = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackName";
      "StackId";
      "LogicalResourceId";
      "PhysicalResourceId";
      "ResourceType";
      "Timestamp";
      "ResourceStatus";
      "ResourceStatusReason";
      "Description";
      "DriftInformation";
      "ModuleInfo";
    ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> resource_status_of_xml i)
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "DriftInformation" ->
          r_drift_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftInformation"
                 (fun i _ -> stack_resource_drift_information_of_xml i)
                 ())
      | "ModuleInfo" ->
          r_module_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModuleInfo"
                 (fun i _ -> module_info_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = ( ! ) r_stack_name;
     stack_id = ( ! ) r_stack_id;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     physical_resource_id = ( ! ) r_physical_resource_id;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
     resource_status = Smaws_Lib.Xml.Parse.required "ResourceStatus" (( ! ) r_resource_status) i;
     resource_status_reason = ( ! ) r_resource_status_reason;
     description = ( ! ) r_description;
     drift_information = ( ! ) r_drift_information;
     module_info = ( ! ) r_module_info;
   }
    : stack_resource)

let stack_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_resource_of_xml i) ()

let describe_stack_resources_output_of_xml i =
  let r_stack_resources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackResources" ] (fun tag _ ->
      match tag with
      | "StackResources" ->
          r_stack_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_resource_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_resources = ( ! ) r_stack_resources } : describe_stack_resources_output)

let describe_stack_resources_input_of_xml i =
  let r_stack_name = ref None in
  let r_logical_resource_id = ref None in
  let r_physical_resource_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackName"; "LogicalResourceId"; "PhysicalResourceId" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = ( ! ) r_stack_name;
     logical_resource_id = ( ! ) r_logical_resource_id;
     physical_resource_id = ( ! ) r_physical_resource_id;
   }
    : describe_stack_resources_input)

let stack_resource_drifts_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_resource_drift_of_xml i) ()

let describe_stack_resource_drifts_output_of_xml i =
  let r_stack_resource_drifts = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackResourceDrifts"; "NextToken" ] (fun tag _ ->
      match tag with
      | "StackResourceDrifts" ->
          r_stack_resource_drifts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDrifts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_resource_drift_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_resource_drifts =
       Smaws_Lib.Xml.Parse.required "StackResourceDrifts" (( ! ) r_stack_resource_drifts) i;
     next_token = ( ! ) r_next_token;
   }
    : describe_stack_resource_drifts_output)

let describe_stack_resource_drifts_input_of_xml i =
  let r_stack_name = ref None in
  let r_stack_resource_drift_status_filters = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackName"; "StackResourceDriftStatusFilters"; "NextToken"; "MaxResults" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "StackResourceDriftStatusFilters" ->
          r_stack_resource_drift_status_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDriftStatusFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_resource_drift_status_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> boxed_max_results_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     stack_resource_drift_status_filters = ( ! ) r_stack_resource_drift_status_filters;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
   }
    : describe_stack_resource_drifts_input)

let stack_resource_detail_of_xml i =
  let r_stack_name = ref None in
  let r_stack_id = ref None in
  let r_logical_resource_id = ref None in
  let r_physical_resource_id = ref None in
  let r_resource_type = ref None in
  let r_last_updated_timestamp = ref None in
  let r_resource_status = ref None in
  let r_resource_status_reason = ref None in
  let r_description = ref None in
  let r_metadata = ref None in
  let r_drift_information = ref None in
  let r_module_info = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackName";
      "StackId";
      "LogicalResourceId";
      "PhysicalResourceId";
      "ResourceType";
      "LastUpdatedTimestamp";
      "ResourceStatus";
      "ResourceStatusReason";
      "Description";
      "Metadata";
      "DriftInformation";
      "ModuleInfo";
    ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "LastUpdatedTimestamp" ->
          r_last_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> resource_status_of_xml i)
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Metadata" ->
          r_metadata :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Metadata" (fun i _ -> metadata_of_xml i) ())
      | "DriftInformation" ->
          r_drift_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftInformation"
                 (fun i _ -> stack_resource_drift_information_of_xml i)
                 ())
      | "ModuleInfo" ->
          r_module_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModuleInfo"
                 (fun i _ -> module_info_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = ( ! ) r_stack_name;
     stack_id = ( ! ) r_stack_id;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     physical_resource_id = ( ! ) r_physical_resource_id;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     last_updated_timestamp =
       Smaws_Lib.Xml.Parse.required "LastUpdatedTimestamp" (( ! ) r_last_updated_timestamp) i;
     resource_status = Smaws_Lib.Xml.Parse.required "ResourceStatus" (( ! ) r_resource_status) i;
     resource_status_reason = ( ! ) r_resource_status_reason;
     description = ( ! ) r_description;
     metadata = ( ! ) r_metadata;
     drift_information = ( ! ) r_drift_information;
     module_info = ( ! ) r_module_info;
   }
    : stack_resource_detail)

let describe_stack_resource_output_of_xml i =
  let r_stack_resource_detail = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackResourceDetail" ] (fun tag _ ->
      match tag with
      | "StackResourceDetail" ->
          r_stack_resource_detail :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDetail"
                 (fun i _ -> stack_resource_detail_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_resource_detail = ( ! ) r_stack_resource_detail } : describe_stack_resource_output)

let describe_stack_resource_input_of_xml i =
  let r_stack_name = ref None in
  let r_logical_resource_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "LogicalResourceId" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
   }
    : describe_stack_resource_input)

let stack_refactor_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : stack_refactor_not_found_exception)

let stack_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_id_of_xml i) ()

let describe_stack_refactor_output_of_xml i =
  let r_description = ref None in
  let r_stack_refactor_id = ref None in
  let r_stack_ids = ref None in
  let r_execution_status = ref None in
  let r_execution_status_reason = ref None in
  let r_status = ref None in
  let r_status_reason = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Description";
      "StackRefactorId";
      "StackIds";
      "ExecutionStatus";
      "ExecutionStatusReason";
      "Status";
      "StatusReason";
    ] (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "StackRefactorId" ->
          r_stack_refactor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackRefactorId"
                 (fun i _ -> stack_refactor_id_of_xml i)
                 ())
      | "StackIds" ->
          r_stack_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_id_of_xml i) ())
                 ())
      | "ExecutionStatus" ->
          r_execution_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatus"
                 (fun i _ -> stack_refactor_execution_status_of_xml i)
                 ())
      | "ExecutionStatusReason" ->
          r_execution_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatusReason"
                 (fun i _ -> execution_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_refactor_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> stack_refactor_status_reason_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     description = ( ! ) r_description;
     stack_refactor_id = ( ! ) r_stack_refactor_id;
     stack_ids = ( ! ) r_stack_ids;
     execution_status = ( ! ) r_execution_status;
     execution_status_reason = ( ! ) r_execution_status_reason;
     status = ( ! ) r_status;
     status_reason = ( ! ) r_status_reason;
   }
    : describe_stack_refactor_output)

let describe_stack_refactor_input_of_xml i =
  let r_stack_refactor_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackRefactorId" ] (fun tag _ ->
      match tag with
      | "StackRefactorId" ->
          r_stack_refactor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackRefactorId"
                 (fun i _ -> stack_refactor_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_refactor_id =
       Smaws_Lib.Xml.Parse.required "StackRefactorId" (( ! ) r_stack_refactor_id) i;
   }
    : describe_stack_refactor_input)

let stack_instance_of_xml i =
  let r_stack_set_id = ref None in
  let r_region = ref None in
  let r_account = ref None in
  let r_stack_id = ref None in
  let r_parameter_overrides = ref None in
  let r_status = ref None in
  let r_stack_instance_status = ref None in
  let r_status_reason = ref None in
  let r_organizational_unit_id = ref None in
  let r_drift_status = ref None in
  let r_last_drift_check_timestamp = ref None in
  let r_last_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetId";
      "Region";
      "Account";
      "StackId";
      "ParameterOverrides";
      "Status";
      "StackInstanceStatus";
      "StatusReason";
      "OrganizationalUnitId";
      "DriftStatus";
      "LastDriftCheckTimestamp";
      "LastOperationId";
    ] (fun tag _ ->
      match tag with
      | "StackSetId" ->
          r_stack_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetId"
                 (fun i _ -> stack_set_id_of_xml i)
                 ())
      | "Region" ->
          r_region :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Region" (fun i _ -> region_of_xml i) ())
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> account_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "ParameterOverrides" ->
          r_parameter_overrides :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterOverrides"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_instance_status_of_xml i)
                 ())
      | "StackInstanceStatus" ->
          r_stack_instance_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceStatus"
                 (fun i _ -> stack_instance_comprehensive_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason" (fun i _ -> reason_of_xml i) ())
      | "OrganizationalUnitId" ->
          r_organizational_unit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationalUnitId"
                 (fun i _ -> organizational_unit_id_of_xml i)
                 ())
      | "DriftStatus" ->
          r_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | "LastDriftCheckTimestamp" ->
          r_last_drift_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastDriftCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "LastOperationId" ->
          r_last_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastOperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_id = ( ! ) r_stack_set_id;
     region = ( ! ) r_region;
     account = ( ! ) r_account;
     stack_id = ( ! ) r_stack_id;
     parameter_overrides = ( ! ) r_parameter_overrides;
     status = ( ! ) r_status;
     stack_instance_status = ( ! ) r_stack_instance_status;
     status_reason = ( ! ) r_status_reason;
     organizational_unit_id = ( ! ) r_organizational_unit_id;
     drift_status = ( ! ) r_drift_status;
     last_drift_check_timestamp = ( ! ) r_last_drift_check_timestamp;
     last_operation_id = ( ! ) r_last_operation_id;
   }
    : stack_instance)

let describe_stack_instance_output_of_xml i =
  let r_stack_instance = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackInstance" ] (fun tag _ ->
      match tag with
      | "StackInstance" ->
          r_stack_instance :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstance"
                 (fun i _ -> stack_instance_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_instance = ( ! ) r_stack_instance } : describe_stack_instance_output)

let describe_stack_instance_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_stack_instance_account = ref None in
  let r_stack_instance_region = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackSetName"; "StackInstanceAccount"; "StackInstanceRegion"; "CallAs" ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "StackInstanceAccount" ->
          r_stack_instance_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceAccount"
                 (fun i _ -> account_of_xml i)
                 ())
      | "StackInstanceRegion" ->
          r_stack_instance_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceRegion"
                 (fun i _ -> region_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     stack_instance_account =
       Smaws_Lib.Xml.Parse.required "StackInstanceAccount" (( ! ) r_stack_instance_account) i;
     stack_instance_region =
       Smaws_Lib.Xml.Parse.required "StackInstanceRegion" (( ! ) r_stack_instance_region) i;
     call_as = ( ! ) r_call_as;
   }
    : describe_stack_instance_input)

let hook_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_properties_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let event_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_event_of_xml i =
  let r_stack_id = ref None in
  let r_event_id = ref None in
  let r_stack_name = ref None in
  let r_operation_id = ref None in
  let r_logical_resource_id = ref None in
  let r_physical_resource_id = ref None in
  let r_resource_type = ref None in
  let r_timestamp = ref None in
  let r_resource_status = ref None in
  let r_resource_status_reason = ref None in
  let r_resource_properties = ref None in
  let r_client_request_token = ref None in
  let r_hook_type = ref None in
  let r_hook_status = ref None in
  let r_hook_status_reason = ref None in
  let r_hook_invocation_point = ref None in
  let r_hook_invocation_id = ref None in
  let r_hook_failure_mode = ref None in
  let r_detailed_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackId";
      "EventId";
      "StackName";
      "OperationId";
      "LogicalResourceId";
      "PhysicalResourceId";
      "ResourceType";
      "Timestamp";
      "ResourceStatus";
      "ResourceStatusReason";
      "ResourceProperties";
      "ClientRequestToken";
      "HookType";
      "HookStatus";
      "HookStatusReason";
      "HookInvocationPoint";
      "HookInvocationId";
      "HookFailureMode";
      "DetailedStatus";
    ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "EventId" ->
          r_event_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EventId" (fun i _ -> event_id_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> resource_status_of_xml i)
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "ResourceProperties" ->
          r_resource_properties :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceProperties"
                 (fun i _ -> resource_properties_of_xml i)
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "HookType" ->
          r_hook_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "HookType" (fun i _ -> hook_type_of_xml i) ())
      | "HookStatus" ->
          r_hook_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatus"
                 (fun i _ -> hook_status_of_xml i)
                 ())
      | "HookStatusReason" ->
          r_hook_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatusReason"
                 (fun i _ -> hook_status_reason_of_xml i)
                 ())
      | "HookInvocationPoint" ->
          r_hook_invocation_point :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookInvocationPoint"
                 (fun i _ -> hook_invocation_point_of_xml i)
                 ())
      | "HookInvocationId" ->
          r_hook_invocation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookInvocationId"
                 (fun i _ -> hook_invocation_id_of_xml i)
                 ())
      | "HookFailureMode" ->
          r_hook_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookFailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "DetailedStatus" ->
          r_detailed_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetailedStatus"
                 (fun i _ -> detailed_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_id = Smaws_Lib.Xml.Parse.required "StackId" (( ! ) r_stack_id) i;
     event_id = Smaws_Lib.Xml.Parse.required "EventId" (( ! ) r_event_id) i;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     operation_id = ( ! ) r_operation_id;
     logical_resource_id = ( ! ) r_logical_resource_id;
     physical_resource_id = ( ! ) r_physical_resource_id;
     resource_type = ( ! ) r_resource_type;
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
     resource_status = ( ! ) r_resource_status;
     resource_status_reason = ( ! ) r_resource_status_reason;
     resource_properties = ( ! ) r_resource_properties;
     client_request_token = ( ! ) r_client_request_token;
     hook_type = ( ! ) r_hook_type;
     hook_status = ( ! ) r_hook_status;
     hook_status_reason = ( ! ) r_hook_status_reason;
     hook_invocation_point = ( ! ) r_hook_invocation_point;
     hook_invocation_id = ( ! ) r_hook_invocation_id;
     hook_failure_mode = ( ! ) r_hook_failure_mode;
     detailed_status = ( ! ) r_detailed_status;
   }
    : stack_event)

let stack_events_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_event_of_xml i) ()

let describe_stack_events_output_of_xml i =
  let r_stack_events = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackEvents"; "NextToken" ] (fun tag _ ->
      match tag with
      | "StackEvents" ->
          r_stack_events :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackEvents"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_event_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_events = ( ! ) r_stack_events; next_token = ( ! ) r_next_token }
    : describe_stack_events_output)

let describe_stack_events_input_of_xml i =
  let r_stack_name = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "NextToken" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     next_token = ( ! ) r_next_token;
   }
    : describe_stack_events_input)

let stack_drift_detection_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_drift_detection_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DETECTION_IN_PROGRESS" -> DETECTION_IN_PROGRESS
   | "DETECTION_FAILED" -> DETECTION_FAILED
   | "DETECTION_COMPLETE" -> DETECTION_COMPLETE
   | _ -> failwith "unknown enum value"
    : stack_drift_detection_status)

let describe_stack_drift_detection_status_output_of_xml i =
  let r_stack_id = ref None in
  let r_stack_drift_detection_id = ref None in
  let r_stack_drift_status = ref None in
  let r_detection_status = ref None in
  let r_detection_status_reason = ref None in
  let r_drifted_stack_resource_count = ref None in
  let r_timestamp = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackId";
      "StackDriftDetectionId";
      "StackDriftStatus";
      "DetectionStatus";
      "DetectionStatusReason";
      "DriftedStackResourceCount";
      "Timestamp";
    ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "StackDriftDetectionId" ->
          r_stack_drift_detection_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftDetectionId"
                 (fun i _ -> stack_drift_detection_id_of_xml i)
                 ())
      | "StackDriftStatus" ->
          r_stack_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | "DetectionStatus" ->
          r_detection_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetectionStatus"
                 (fun i _ -> stack_drift_detection_status_of_xml i)
                 ())
      | "DetectionStatusReason" ->
          r_detection_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetectionStatusReason"
                 (fun i _ -> stack_drift_detection_status_reason_of_xml i)
                 ())
      | "DriftedStackResourceCount" ->
          r_drifted_stack_resource_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftedStackResourceCount"
                 (fun i _ -> boxed_integer_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_id = Smaws_Lib.Xml.Parse.required "StackId" (( ! ) r_stack_id) i;
     stack_drift_detection_id =
       Smaws_Lib.Xml.Parse.required "StackDriftDetectionId" (( ! ) r_stack_drift_detection_id) i;
     stack_drift_status = ( ! ) r_stack_drift_status;
     detection_status = Smaws_Lib.Xml.Parse.required "DetectionStatus" (( ! ) r_detection_status) i;
     detection_status_reason = ( ! ) r_detection_status_reason;
     drifted_stack_resource_count = ( ! ) r_drifted_stack_resource_count;
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
   }
    : describe_stack_drift_detection_status_output)

let describe_stack_drift_detection_status_input_of_xml i =
  let r_stack_drift_detection_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackDriftDetectionId" ] (fun tag _ ->
      match tag with
      | "StackDriftDetectionId" ->
          r_stack_drift_detection_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftDetectionId"
                 (fun i _ -> stack_drift_detection_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_drift_detection_id =
       Smaws_Lib.Xml.Parse.required "StackDriftDetectionId" (( ! ) r_stack_drift_detection_id) i;
   }
    : describe_stack_drift_detection_status_input)

let resources_read_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resources_scanned_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let describe_resource_scan_output_of_xml i =
  let r_resource_scan_id = ref None in
  let r_status = ref None in
  let r_status_reason = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_percentage_completed = ref None in
  let r_resource_types = ref None in
  let r_resources_scanned = ref None in
  let r_resources_read = ref None in
  let r_scan_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ResourceScanId";
      "Status";
      "StatusReason";
      "StartTime";
      "EndTime";
      "PercentageCompleted";
      "ResourceTypes";
      "ResourcesScanned";
      "ResourcesRead";
      "ScanFilters";
    ] (fun tag _ ->
      match tag with
      | "ResourceScanId" ->
          r_resource_scan_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanId"
                 (fun i _ -> resource_scan_id_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> resource_scan_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> resource_scan_status_reason_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "PercentageCompleted" ->
          r_percentage_completed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageCompleted"
                 (fun i _ -> percentage_completed_of_xml i)
                 ())
      | "ResourceTypes" ->
          r_resource_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_type_of_xml i)
                     ())
                 ())
      | "ResourcesScanned" ->
          r_resources_scanned :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesScanned"
                 (fun i _ -> resources_scanned_of_xml i)
                 ())
      | "ResourcesRead" ->
          r_resources_read :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesRead"
                 (fun i _ -> resources_read_of_xml i)
                 ())
      | "ScanFilters" ->
          r_scan_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScanFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scan_filter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_scan_id = ( ! ) r_resource_scan_id;
     status = ( ! ) r_status;
     status_reason = ( ! ) r_status_reason;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     percentage_completed = ( ! ) r_percentage_completed;
     resource_types = ( ! ) r_resource_types;
     resources_scanned = ( ! ) r_resources_scanned;
     resources_read = ( ! ) r_resources_read;
     scan_filters = ( ! ) r_scan_filters;
   }
    : describe_resource_scan_output)

let describe_resource_scan_input_of_xml i =
  let r_resource_scan_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceScanId" ] (fun tag _ ->
      match tag with
      | "ResourceScanId" ->
          r_resource_scan_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanId"
                 (fun i _ -> resource_scan_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_scan_id = Smaws_Lib.Xml.Parse.required "ResourceScanId" (( ! ) r_resource_scan_id) i }
    : describe_resource_scan_input)

let publisher_profile_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let publisher_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "VERIFIED" -> VERIFIED
   | "UNVERIFIED" -> UNVERIFIED
   | _ -> failwith "unknown enum value"
    : publisher_status)

let describe_publisher_output_of_xml i =
  let r_publisher_id = ref None in
  let r_publisher_status = ref None in
  let r_identity_provider = ref None in
  let r_publisher_profile = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PublisherId"; "PublisherStatus"; "IdentityProvider"; "PublisherProfile" ] (fun tag _ ->
      match tag with
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | "PublisherStatus" ->
          r_publisher_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherStatus"
                 (fun i _ -> publisher_status_of_xml i)
                 ())
      | "IdentityProvider" ->
          r_identity_provider :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdentityProvider"
                 (fun i _ -> identity_provider_of_xml i)
                 ())
      | "PublisherProfile" ->
          r_publisher_profile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherProfile"
                 (fun i _ -> publisher_profile_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     publisher_id = ( ! ) r_publisher_id;
     publisher_status = ( ! ) r_publisher_status;
     identity_provider = ( ! ) r_identity_provider;
     publisher_profile = ( ! ) r_publisher_profile;
   }
    : describe_publisher_output)

let describe_publisher_input_of_xml i =
  let r_publisher_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PublisherId" ] (fun tag _ ->
      match tag with
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ publisher_id = ( ! ) r_publisher_id } : describe_publisher_input)

let organization_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ENABLED" -> ENABLED
   | "DISABLED" -> DISABLED
   | "DISABLED_PERMANENTLY" -> DISABLED_PERMANENTLY
   | _ -> failwith "unknown enum value"
    : organization_status)

let describe_organizations_access_output_of_xml i =
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> organization_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status } : describe_organizations_access_output)

let describe_organizations_access_input_of_xml i =
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CallAs" ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ call_as = ( ! ) r_call_as } : describe_organizations_access_input)

let total_warnings_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resources_pending_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resources_processing_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resources_failed_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resources_succeeded_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let template_progress_of_xml i =
  let r_resources_succeeded = ref None in
  let r_resources_failed = ref None in
  let r_resources_processing = ref None in
  let r_resources_pending = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourcesSucceeded"; "ResourcesFailed"; "ResourcesProcessing"; "ResourcesPending" ]
    (fun tag _ ->
      match tag with
      | "ResourcesSucceeded" ->
          r_resources_succeeded :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesSucceeded"
                 (fun i _ -> resources_succeeded_of_xml i)
                 ())
      | "ResourcesFailed" ->
          r_resources_failed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesFailed"
                 (fun i _ -> resources_failed_of_xml i)
                 ())
      | "ResourcesProcessing" ->
          r_resources_processing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesProcessing"
                 (fun i _ -> resources_processing_of_xml i)
                 ())
      | "ResourcesPending" ->
          r_resources_pending :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesPending"
                 (fun i _ -> resources_pending_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resources_succeeded = ( ! ) r_resources_succeeded;
     resources_failed = ( ! ) r_resources_failed;
     resources_processing = ( ! ) r_resources_processing;
     resources_pending = ( ! ) r_resources_pending;
   }
    : template_progress)

let property_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let required_property_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let warning_property_of_xml i =
  let r_property_path = ref None in
  let r_required = ref None in
  let r_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PropertyPath"; "Required"; "Description" ]
    (fun tag _ ->
      match tag with
      | "PropertyPath" ->
          r_property_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PropertyPath"
                 (fun i _ -> property_path_of_xml i)
                 ())
      | "Required" ->
          r_required :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Required"
                 (fun i _ -> required_property_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> property_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     property_path = ( ! ) r_property_path;
     required = ( ! ) r_required;
     description = ( ! ) r_description;
   }
    : warning_property)

let warning_properties_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> warning_property_of_xml i) ()

let warning_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "MUTUALLY_EXCLUSIVE_PROPERTIES" -> MUTUALLY_EXCLUSIVE_PROPERTIES
   | "UNSUPPORTED_PROPERTIES" -> UNSUPPORTED_PROPERTIES
   | "MUTUALLY_EXCLUSIVE_TYPES" -> MUTUALLY_EXCLUSIVE_TYPES
   | "EXCLUDED_PROPERTIES" -> EXCLUDED_PROPERTIES
   | "EXCLUDED_RESOURCES" -> EXCLUDED_RESOURCES
   | _ -> failwith "unknown enum value"
    : warning_type)

let warning_detail_of_xml i =
  let r_type_ = ref None in
  let r_properties = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Type"; "Properties" ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> warning_type_of_xml i) ())
      | "Properties" ->
          r_properties :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Properties"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> warning_property_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ type_ = ( ! ) r_type_; properties = ( ! ) r_properties } : warning_detail)

let warning_details_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> warning_detail_of_xml i) ()

let generated_template_resource_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PENDING" -> PENDING
   | "IN_PROGRESS" -> IN_PROGRESS
   | "FAILED" -> FAILED
   | "COMPLETE" -> COMPLETE
   | _ -> failwith "unknown enum value"
    : generated_template_resource_status)

let resource_detail_of_xml i =
  let r_resource_type = ref None in
  let r_logical_resource_id = ref None in
  let r_resource_identifier = ref None in
  let r_resource_status = ref None in
  let r_resource_status_reason = ref None in
  let r_warnings = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ResourceType";
      "LogicalResourceId";
      "ResourceIdentifier";
      "ResourceStatus";
      "ResourceStatusReason";
      "Warnings";
    ] (fun tag _ ->
      match tag with
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> resource_identifier_property_key_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> resource_identifier_property_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> generated_template_resource_status_of_xml i)
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "Warnings" ->
          r_warnings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Warnings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> warning_detail_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_type = ( ! ) r_resource_type;
     logical_resource_id = ( ! ) r_logical_resource_id;
     resource_identifier = ( ! ) r_resource_identifier;
     resource_status = ( ! ) r_resource_status;
     resource_status_reason = ( ! ) r_resource_status_reason;
     warnings = ( ! ) r_warnings;
   }
    : resource_detail)

let resource_details_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_detail_of_xml i) ()

let describe_generated_template_output_of_xml i =
  let r_generated_template_id = ref None in
  let r_generated_template_name = ref None in
  let r_resources = ref None in
  let r_status = ref None in
  let r_status_reason = ref None in
  let r_creation_time = ref None in
  let r_last_updated_time = ref None in
  let r_progress = ref None in
  let r_stack_id = ref None in
  let r_template_configuration = ref None in
  let r_total_warnings = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "GeneratedTemplateId";
      "GeneratedTemplateName";
      "Resources";
      "Status";
      "StatusReason";
      "CreationTime";
      "LastUpdatedTime";
      "Progress";
      "StackId";
      "TemplateConfiguration";
      "TotalWarnings";
    ] (fun tag _ ->
      match tag with
      | "GeneratedTemplateId" ->
          r_generated_template_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateId"
                 (fun i _ -> generated_template_id_of_xml i)
                 ())
      | "GeneratedTemplateName" ->
          r_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_detail_of_xml i)
                     ())
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> generated_template_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> template_status_reason_of_xml i)
                 ())
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "LastUpdatedTime" ->
          r_last_updated_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTime"
                 (fun i _ -> last_updated_time_of_xml i)
                 ())
      | "Progress" ->
          r_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Progress"
                 (fun i _ -> template_progress_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "TemplateConfiguration" ->
          r_template_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateConfiguration"
                 (fun i _ -> template_configuration_of_xml i)
                 ())
      | "TotalWarnings" ->
          r_total_warnings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalWarnings"
                 (fun i _ -> total_warnings_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     generated_template_id = ( ! ) r_generated_template_id;
     generated_template_name = ( ! ) r_generated_template_name;
     resources = ( ! ) r_resources;
     status = ( ! ) r_status;
     status_reason = ( ! ) r_status_reason;
     creation_time = ( ! ) r_creation_time;
     last_updated_time = ( ! ) r_last_updated_time;
     progress = ( ! ) r_progress;
     stack_id = ( ! ) r_stack_id;
     template_configuration = ( ! ) r_template_configuration;
     total_warnings = ( ! ) r_total_warnings;
   }
    : describe_generated_template_output)

let describe_generated_template_input_of_xml i =
  let r_generated_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GeneratedTemplateName" ] (fun tag _ ->
      match tag with
      | "GeneratedTemplateName" ->
          r_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     generated_template_name =
       Smaws_Lib.Xml.Parse.required "GeneratedTemplateName" (( ! ) r_generated_template_name) i;
   }
    : describe_generated_template_input)

let validation_path_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let validation_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let validation_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "FAILED" -> FAILED | "SKIPPED" -> SKIPPED | _ -> failwith "unknown enum value"
    : validation_status)

let validation_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let event_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "STACK_EVENT" -> STACK_EVENT
   | "PROGRESS_EVENT" -> PROGRESS_EVENT
   | "VALIDATION_ERROR" -> VALIDATION_ERROR
   | "PROVISIONING_ERROR" -> PROVISIONING_ERROR
   | "HOOK_INVOCATION_ERROR" -> HOOK_INVOCATION_ERROR
   | _ -> failwith "unknown enum value"
    : event_type)

let operation_event_of_xml i =
  let r_event_id = ref None in
  let r_stack_id = ref None in
  let r_operation_id = ref None in
  let r_operation_type = ref None in
  let r_operation_status = ref None in
  let r_event_type = ref None in
  let r_logical_resource_id = ref None in
  let r_physical_resource_id = ref None in
  let r_resource_type = ref None in
  let r_timestamp = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_resource_status = ref None in
  let r_resource_status_reason = ref None in
  let r_resource_properties = ref None in
  let r_client_request_token = ref None in
  let r_hook_type = ref None in
  let r_hook_status = ref None in
  let r_hook_status_reason = ref None in
  let r_hook_invocation_point = ref None in
  let r_hook_failure_mode = ref None in
  let r_detailed_status = ref None in
  let r_validation_failure_mode = ref None in
  let r_validation_name = ref None in
  let r_validation_status = ref None in
  let r_validation_status_reason = ref None in
  let r_validation_path = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EventId";
      "StackId";
      "OperationId";
      "OperationType";
      "OperationStatus";
      "EventType";
      "LogicalResourceId";
      "PhysicalResourceId";
      "ResourceType";
      "Timestamp";
      "StartTime";
      "EndTime";
      "ResourceStatus";
      "ResourceStatusReason";
      "ResourceProperties";
      "ClientRequestToken";
      "HookType";
      "HookStatus";
      "HookStatusReason";
      "HookInvocationPoint";
      "HookFailureMode";
      "DetailedStatus";
      "ValidationFailureMode";
      "ValidationName";
      "ValidationStatus";
      "ValidationStatusReason";
      "ValidationPath";
    ] (fun tag _ ->
      match tag with
      | "EventId" ->
          r_event_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EventId" (fun i _ -> event_id_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
      | "OperationType" ->
          r_operation_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationType"
                 (fun i _ -> operation_type_of_xml i)
                 ())
      | "OperationStatus" ->
          r_operation_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationStatus"
                 (fun i _ -> beacon_stack_operation_status_of_xml i)
                 ())
      | "EventType" ->
          r_event_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventType" (fun i _ -> event_type_of_xml i) ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> resource_status_of_xml i)
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "ResourceProperties" ->
          r_resource_properties :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceProperties"
                 (fun i _ -> resource_properties_of_xml i)
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "HookType" ->
          r_hook_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "HookType" (fun i _ -> hook_type_of_xml i) ())
      | "HookStatus" ->
          r_hook_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatus"
                 (fun i _ -> hook_status_of_xml i)
                 ())
      | "HookStatusReason" ->
          r_hook_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatusReason"
                 (fun i _ -> hook_status_reason_of_xml i)
                 ())
      | "HookInvocationPoint" ->
          r_hook_invocation_point :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookInvocationPoint"
                 (fun i _ -> hook_invocation_point_of_xml i)
                 ())
      | "HookFailureMode" ->
          r_hook_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookFailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "DetailedStatus" ->
          r_detailed_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetailedStatus"
                 (fun i _ -> detailed_status_of_xml i)
                 ())
      | "ValidationFailureMode" ->
          r_validation_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidationFailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "ValidationName" ->
          r_validation_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidationName"
                 (fun i _ -> validation_name_of_xml i)
                 ())
      | "ValidationStatus" ->
          r_validation_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidationStatus"
                 (fun i _ -> validation_status_of_xml i)
                 ())
      | "ValidationStatusReason" ->
          r_validation_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidationStatusReason"
                 (fun i _ -> validation_status_reason_of_xml i)
                 ())
      | "ValidationPath" ->
          r_validation_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidationPath"
                 (fun i _ -> validation_path_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     event_id = ( ! ) r_event_id;
     stack_id = ( ! ) r_stack_id;
     operation_id = ( ! ) r_operation_id;
     operation_type = ( ! ) r_operation_type;
     operation_status = ( ! ) r_operation_status;
     event_type = ( ! ) r_event_type;
     logical_resource_id = ( ! ) r_logical_resource_id;
     physical_resource_id = ( ! ) r_physical_resource_id;
     resource_type = ( ! ) r_resource_type;
     timestamp = ( ! ) r_timestamp;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     resource_status = ( ! ) r_resource_status;
     resource_status_reason = ( ! ) r_resource_status_reason;
     resource_properties = ( ! ) r_resource_properties;
     client_request_token = ( ! ) r_client_request_token;
     hook_type = ( ! ) r_hook_type;
     hook_status = ( ! ) r_hook_status;
     hook_status_reason = ( ! ) r_hook_status_reason;
     hook_invocation_point = ( ! ) r_hook_invocation_point;
     hook_failure_mode = ( ! ) r_hook_failure_mode;
     detailed_status = ( ! ) r_detailed_status;
     validation_failure_mode = ( ! ) r_validation_failure_mode;
     validation_name = ( ! ) r_validation_name;
     validation_status = ( ! ) r_validation_status;
     validation_status_reason = ( ! ) r_validation_status_reason;
     validation_path = ( ! ) r_validation_path;
   }
    : operation_event)

let operation_events_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> operation_event_of_xml i) ()

let describe_events_output_of_xml i =
  let r_operation_events = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationEvents"; "NextToken" ] (fun tag _ ->
      match tag with
      | "OperationEvents" ->
          r_operation_events :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationEvents"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> operation_event_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_events = ( ! ) r_operation_events; next_token = ( ! ) r_next_token }
    : describe_events_output)

let failed_events_filter_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let event_filter_of_xml i =
  let r_failed_events = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FailedEvents" ] (fun tag _ ->
      match tag with
      | "FailedEvents" ->
          r_failed_events :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailedEvents"
                 (fun i _ -> failed_events_filter_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ failed_events = ( ! ) r_failed_events } : event_filter)

let describe_events_input_of_xml i =
  let r_stack_name = ref None in
  let r_change_set_name = ref None in
  let r_operation_id = ref None in
  let r_filters = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackName"; "ChangeSetName"; "OperationId"; "Filters"; "NextToken" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_or_id_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters" (fun i _ -> event_filter_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = ( ! ) r_stack_name;
     change_set_name = ( ! ) r_change_set_name;
     operation_id = ( ! ) r_operation_id;
     filters = ( ! ) r_filters;
     next_token = ( ! ) r_next_token;
   }
    : describe_events_input)

let describe_change_set_hooks_output_of_xml i =
  let r_change_set_id = ref None in
  let r_change_set_name = ref None in
  let r_hooks = ref None in
  let r_status = ref None in
  let r_next_token = ref None in
  let r_stack_id = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ChangeSetId"; "ChangeSetName"; "Hooks"; "Status"; "NextToken"; "StackId"; "StackName" ]
    (fun tag _ ->
      match tag with
      | "ChangeSetId" ->
          r_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_of_xml i)
                 ())
      | "Hooks" ->
          r_hooks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Hooks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> change_set_hook_of_xml i)
                     ())
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> change_set_hooks_status_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     change_set_id = ( ! ) r_change_set_id;
     change_set_name = ( ! ) r_change_set_name;
     hooks = ( ! ) r_hooks;
     status = ( ! ) r_status;
     next_token = ( ! ) r_next_token;
     stack_id = ( ! ) r_stack_id;
     stack_name = ( ! ) r_stack_name;
   }
    : describe_change_set_hooks_output)

let describe_change_set_hooks_input_of_xml i =
  let r_change_set_name = ref None in
  let r_stack_name = ref None in
  let r_next_token = ref None in
  let r_logical_resource_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ChangeSetName"; "StackName"; "NextToken"; "LogicalResourceId" ] (fun tag _ ->
      match tag with
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_or_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     change_set_name = Smaws_Lib.Xml.Parse.required "ChangeSetName" (( ! ) r_change_set_name) i;
     stack_name = ( ! ) r_stack_name;
     next_token = ( ! ) r_next_token;
     logical_resource_id = ( ! ) r_logical_resource_id;
   }
    : describe_change_set_hooks_input)

let deployment_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "REVERT_DRIFT" -> REVERT_DRIFT | _ -> failwith "unknown enum value"
    : deployment_mode)

let on_stack_failure_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DO_NOTHING" -> DO_NOTHING
   | "ROLLBACK" -> ROLLBACK
   | "DELETE" -> DELETE
   | _ -> failwith "unknown enum value"
    : on_stack_failure)

let describe_change_set_output_of_xml i =
  let r_change_set_name = ref None in
  let r_change_set_id = ref None in
  let r_stack_id = ref None in
  let r_stack_name = ref None in
  let r_description = ref None in
  let r_parameters = ref None in
  let r_creation_time = ref None in
  let r_execution_status = ref None in
  let r_status = ref None in
  let r_status_reason = ref None in
  let r_stack_drift_status = ref None in
  let r_notification_ar_ns = ref None in
  let r_rollback_configuration = ref None in
  let r_capabilities = ref None in
  let r_tags = ref None in
  let r_changes = ref None in
  let r_next_token = ref None in
  let r_include_nested_stacks = ref None in
  let r_parent_change_set_id = ref None in
  let r_root_change_set_id = ref None in
  let r_on_stack_failure = ref None in
  let r_import_existing_resources = ref None in
  let r_deployment_mode = ref None in
  let r_deployment_config = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ChangeSetName";
      "ChangeSetId";
      "StackId";
      "StackName";
      "Description";
      "Parameters";
      "CreationTime";
      "ExecutionStatus";
      "Status";
      "StatusReason";
      "StackDriftStatus";
      "NotificationARNs";
      "RollbackConfiguration";
      "Capabilities";
      "Tags";
      "Changes";
      "NextToken";
      "IncludeNestedStacks";
      "ParentChangeSetId";
      "RootChangeSetId";
      "OnStackFailure";
      "ImportExistingResources";
      "DeploymentMode";
      "DeploymentConfig";
    ] (fun tag _ ->
      match tag with
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_of_xml i)
                 ())
      | "ChangeSetId" ->
          r_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "ExecutionStatus" ->
          r_execution_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatus"
                 (fun i _ -> execution_status_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> change_set_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> change_set_status_reason_of_xml i)
                 ())
      | "StackDriftStatus" ->
          r_stack_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | "NotificationARNs" ->
          r_notification_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> notification_ar_n_of_xml i)
                     ())
                 ())
      | "RollbackConfiguration" ->
          r_rollback_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackConfiguration"
                 (fun i _ -> rollback_configuration_of_xml i)
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Changes" ->
          r_changes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Changes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> change_of_xml i) ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "IncludeNestedStacks" ->
          r_include_nested_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeNestedStacks"
                 (fun i _ -> include_nested_stacks_of_xml i)
                 ())
      | "ParentChangeSetId" ->
          r_parent_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParentChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "RootChangeSetId" ->
          r_root_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RootChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "OnStackFailure" ->
          r_on_stack_failure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnStackFailure"
                 (fun i _ -> on_stack_failure_of_xml i)
                 ())
      | "ImportExistingResources" ->
          r_import_existing_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImportExistingResources"
                 (fun i _ -> import_existing_resources_of_xml i)
                 ())
      | "DeploymentMode" ->
          r_deployment_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentMode"
                 (fun i _ -> deployment_mode_of_xml i)
                 ())
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     change_set_name = ( ! ) r_change_set_name;
     change_set_id = ( ! ) r_change_set_id;
     stack_id = ( ! ) r_stack_id;
     stack_name = ( ! ) r_stack_name;
     description = ( ! ) r_description;
     parameters = ( ! ) r_parameters;
     creation_time = ( ! ) r_creation_time;
     execution_status = ( ! ) r_execution_status;
     status = ( ! ) r_status;
     status_reason = ( ! ) r_status_reason;
     stack_drift_status = ( ! ) r_stack_drift_status;
     notification_ar_ns = ( ! ) r_notification_ar_ns;
     rollback_configuration = ( ! ) r_rollback_configuration;
     capabilities = ( ! ) r_capabilities;
     tags = ( ! ) r_tags;
     changes = ( ! ) r_changes;
     next_token = ( ! ) r_next_token;
     include_nested_stacks = ( ! ) r_include_nested_stacks;
     parent_change_set_id = ( ! ) r_parent_change_set_id;
     root_change_set_id = ( ! ) r_root_change_set_id;
     on_stack_failure = ( ! ) r_on_stack_failure;
     import_existing_resources = ( ! ) r_import_existing_resources;
     deployment_mode = ( ! ) r_deployment_mode;
     deployment_config = ( ! ) r_deployment_config;
   }
    : describe_change_set_output)

let include_property_values_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let describe_change_set_input_of_xml i =
  let r_change_set_name = ref None in
  let r_stack_name = ref None in
  let r_next_token = ref None in
  let r_include_property_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ChangeSetName"; "StackName"; "NextToken"; "IncludePropertyValues" ] (fun tag _ ->
      match tag with
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_or_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "IncludePropertyValues" ->
          r_include_property_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludePropertyValues"
                 (fun i _ -> include_property_values_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     change_set_name = Smaws_Lib.Xml.Parse.required "ChangeSetName" (( ! ) r_change_set_name) i;
     stack_name = ( ! ) r_stack_name;
     next_token = ( ! ) r_next_token;
     include_property_values = ( ! ) r_include_property_values;
   }
    : describe_change_set_input)

let describe_account_limits_output_of_xml i =
  let r_account_limits = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AccountLimits"; "NextToken" ] (fun tag _ ->
      match tag with
      | "AccountLimits" ->
          r_account_limits :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountLimits"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> account_limit_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ account_limits = ( ! ) r_account_limits; next_token = ( ! ) r_next_token }
    : describe_account_limits_output)

let describe_account_limits_input_of_xml i =
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token } : describe_account_limits_input)

let deregister_type_output_of_xml i = ()

let deregister_type_input_of_xml i =
  let r_arn = ref None in
  let r_type_ = ref None in
  let r_type_name = ref None in
  let r_version_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Arn"; "Type"; "TypeName"; "VersionId" ]
    (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> private_type_arn_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     arn = ( ! ) r_arn;
     type_ = ( ! ) r_type_;
     type_name = ( ! ) r_type_name;
     version_id = ( ! ) r_version_id;
   }
    : deregister_type_input)

let stack_set_not_empty_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : stack_set_not_empty_exception)

let delete_stack_set_output_of_xml i = ()

let delete_stack_set_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackSetName"; "CallAs" ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     call_as = ( ! ) r_call_as;
   }
    : delete_stack_set_input)

let delete_stack_instances_output_of_xml i =
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationId" ] (fun tag _ ->
      match tag with
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_id = ( ! ) r_operation_id } : delete_stack_instances_output)

let retain_stacks_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let delete_stack_instances_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_accounts = ref None in
  let r_deployment_targets = ref None in
  let r_regions = ref None in
  let r_operation_preferences = ref None in
  let r_retain_stacks = ref None in
  let r_operation_id = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetName";
      "Accounts";
      "DeploymentTargets";
      "Regions";
      "OperationPreferences";
      "RetainStacks";
      "OperationId";
      "CallAs";
    ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "Accounts" ->
          r_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Accounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ())
                 ())
      | "DeploymentTargets" ->
          r_deployment_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTargets"
                 (fun i _ -> deployment_targets_of_xml i)
                 ())
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "RetainStacks" ->
          r_retain_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainStacks"
                 (fun i _ -> retain_stacks_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     accounts = ( ! ) r_accounts;
     deployment_targets = ( ! ) r_deployment_targets;
     regions = Smaws_Lib.Xml.Parse.required "Regions" (( ! ) r_regions) i;
     operation_preferences = ( ! ) r_operation_preferences;
     retain_stacks = Smaws_Lib.Xml.Parse.required "RetainStacks" (( ! ) r_retain_stacks) i;
     operation_id = ( ! ) r_operation_id;
     call_as = ( ! ) r_call_as;
   }
    : delete_stack_instances_input)

let retain_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> logical_resource_id_of_xml i) ()

let delete_stack_input_of_xml i =
  let r_stack_name = ref None in
  let r_retain_resources = ref None in
  let r_role_ar_n = ref None in
  let r_client_request_token = ref None in
  let r_deletion_mode = ref None in
  let r_deployment_config = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackName";
      "RetainResources";
      "RoleARN";
      "ClientRequestToken";
      "DeletionMode";
      "DeploymentConfig";
    ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "RetainResources" ->
          r_retain_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> logical_resource_id_of_xml i)
                     ())
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "DeletionMode" ->
          r_deletion_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionMode"
                 (fun i _ -> deletion_mode_of_xml i)
                 ())
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     retain_resources = ( ! ) r_retain_resources;
     role_ar_n = ( ! ) r_role_ar_n;
     client_request_token = ( ! ) r_client_request_token;
     deletion_mode = ( ! ) r_deletion_mode;
     deployment_config = ( ! ) r_deployment_config;
   }
    : delete_stack_input)

let concurrent_resources_limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : concurrent_resources_limit_exceeded_exception)

let delete_generated_template_input_of_xml i =
  let r_generated_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GeneratedTemplateName" ] (fun tag _ ->
      match tag with
      | "GeneratedTemplateName" ->
          r_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     generated_template_name =
       Smaws_Lib.Xml.Parse.required "GeneratedTemplateName" (( ! ) r_generated_template_name) i;
   }
    : delete_generated_template_input)

let delete_change_set_output_of_xml i = ()

let delete_change_set_input_of_xml i =
  let r_change_set_name = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ChangeSetName"; "StackName" ] (fun tag _ ->
      match tag with
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_or_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     change_set_name = Smaws_Lib.Xml.Parse.required "ChangeSetName" (( ! ) r_change_set_name) i;
     stack_name = ( ! ) r_stack_name;
   }
    : delete_change_set_input)

let deactivate_type_output_of_xml i = ()

let deactivate_type_input_of_xml i =
  let r_type_name = ref None in
  let r_type_ = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TypeName"; "Type"; "Arn" ] (fun tag _ ->
      match tag with
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> private_type_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ type_name = ( ! ) r_type_name; type_ = ( ! ) r_type_; arn = ( ! ) r_arn }
    : deactivate_type_input)

let deactivate_organizations_access_output_of_xml i = ()
let deactivate_organizations_access_input_of_xml i = ()

let name_already_exists_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : name_already_exists_exception)

let created_but_modified_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> error_message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : created_but_modified_exception)

let create_stack_set_output_of_xml i =
  let r_stack_set_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackSetId" ] (fun tag _ ->
      match tag with
      | "StackSetId" ->
          r_stack_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetId"
                 (fun i _ -> stack_set_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_set_id = ( ! ) r_stack_set_id } : create_stack_set_output)

let create_stack_set_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_description = ref None in
  let r_template_body = ref None in
  let r_template_ur_l = ref None in
  let r_stack_id = ref None in
  let r_parameters = ref None in
  let r_capabilities = ref None in
  let r_tags = ref None in
  let r_administration_role_ar_n = ref None in
  let r_execution_role_name = ref None in
  let r_permission_model = ref None in
  let r_auto_deployment = ref None in
  let r_call_as = ref None in
  let r_client_request_token = ref None in
  let r_managed_execution = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetName";
      "Description";
      "TemplateBody";
      "TemplateURL";
      "StackId";
      "Parameters";
      "Capabilities";
      "Tags";
      "AdministrationRoleARN";
      "ExecutionRoleName";
      "PermissionModel";
      "AutoDeployment";
      "CallAs";
      "ClientRequestToken";
      "ManagedExecution";
    ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "AdministrationRoleARN" ->
          r_administration_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdministrationRoleARN"
                 (fun i _ -> role_ar_n_of_xml i)
                 ())
      | "ExecutionRoleName" ->
          r_execution_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleName"
                 (fun i _ -> execution_role_name_of_xml i)
                 ())
      | "PermissionModel" ->
          r_permission_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermissionModel"
                 (fun i _ -> permission_models_of_xml i)
                 ())
      | "AutoDeployment" ->
          r_auto_deployment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoDeployment"
                 (fun i _ -> auto_deployment_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "ManagedExecution" ->
          r_managed_execution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedExecution"
                 (fun i _ -> managed_execution_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     description = ( ! ) r_description;
     template_body = ( ! ) r_template_body;
     template_ur_l = ( ! ) r_template_ur_l;
     stack_id = ( ! ) r_stack_id;
     parameters = ( ! ) r_parameters;
     capabilities = ( ! ) r_capabilities;
     tags = ( ! ) r_tags;
     administration_role_ar_n = ( ! ) r_administration_role_ar_n;
     execution_role_name = ( ! ) r_execution_role_name;
     permission_model = ( ! ) r_permission_model;
     auto_deployment = ( ! ) r_auto_deployment;
     call_as = ( ! ) r_call_as;
     client_request_token = ( ! ) r_client_request_token;
     managed_execution = ( ! ) r_managed_execution;
   }
    : create_stack_set_input)

let create_stack_refactor_output_of_xml i =
  let r_stack_refactor_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackRefactorId" ] (fun tag _ ->
      match tag with
      | "StackRefactorId" ->
          r_stack_refactor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackRefactorId"
                 (fun i _ -> stack_refactor_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_refactor_id =
       Smaws_Lib.Xml.Parse.required "StackRefactorId" (( ! ) r_stack_refactor_id) i;
   }
    : create_stack_refactor_output)

let stack_definition_of_xml i =
  let r_stack_name = ref None in
  let r_template_body = ref None in
  let r_template_ur_l = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "TemplateBody"; "TemplateURL" ]
    (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = ( ! ) r_stack_name;
     template_body = ( ! ) r_template_body;
     template_ur_l = ( ! ) r_template_ur_l;
   }
    : stack_definition)

let stack_definitions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_definition_of_xml i) ()

let resource_mappings_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_mapping_of_xml i) ()

let enable_stack_creation_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let create_stack_refactor_input_of_xml i =
  let r_description = ref None in
  let r_enable_stack_creation = ref None in
  let r_resource_mappings = ref None in
  let r_stack_definitions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Description"; "EnableStackCreation"; "ResourceMappings"; "StackDefinitions" ] (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "EnableStackCreation" ->
          r_enable_stack_creation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableStackCreation"
                 (fun i _ -> enable_stack_creation_of_xml i)
                 ())
      | "ResourceMappings" ->
          r_resource_mappings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceMappings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_mapping_of_xml i)
                     ())
                 ())
      | "StackDefinitions" ->
          r_stack_definitions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDefinitions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_definition_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     description = ( ! ) r_description;
     enable_stack_creation = ( ! ) r_enable_stack_creation;
     resource_mappings = ( ! ) r_resource_mappings;
     stack_definitions =
       Smaws_Lib.Xml.Parse.required "StackDefinitions" (( ! ) r_stack_definitions) i;
   }
    : create_stack_refactor_input)

let create_stack_instances_output_of_xml i =
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationId" ] (fun tag _ ->
      match tag with
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_id = ( ! ) r_operation_id } : create_stack_instances_output)

let create_stack_instances_input_of_xml i =
  let r_stack_set_name = ref None in
  let r_accounts = ref None in
  let r_deployment_targets = ref None in
  let r_regions = ref None in
  let r_parameter_overrides = ref None in
  let r_operation_preferences = ref None in
  let r_operation_id = ref None in
  let r_call_as = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackSetName";
      "Accounts";
      "DeploymentTargets";
      "Regions";
      "ParameterOverrides";
      "OperationPreferences";
      "OperationId";
      "CallAs";
    ] (fun tag _ ->
      match tag with
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | "Accounts" ->
          r_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Accounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ())
                 ())
      | "DeploymentTargets" ->
          r_deployment_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTargets"
                 (fun i _ -> deployment_targets_of_xml i)
                 ())
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "ParameterOverrides" ->
          r_parameter_overrides :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterOverrides"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
     accounts = ( ! ) r_accounts;
     deployment_targets = ( ! ) r_deployment_targets;
     regions = Smaws_Lib.Xml.Parse.required "Regions" (( ! ) r_regions) i;
     parameter_overrides = ( ! ) r_parameter_overrides;
     operation_preferences = ( ! ) r_operation_preferences;
     operation_id = ( ! ) r_operation_id;
     call_as = ( ! ) r_call_as;
   }
    : create_stack_instances_input)

let create_stack_output_of_xml i =
  let r_stack_id = ref None in
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackId"; "OperationId" ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_id = ( ! ) r_stack_id; operation_id = ( ! ) r_operation_id } : create_stack_output)

let on_failure_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DO_NOTHING" -> DO_NOTHING
   | "ROLLBACK" -> ROLLBACK
   | "DELETE" -> DELETE
   | _ -> failwith "unknown enum value"
    : on_failure)

let create_stack_input_of_xml i =
  let r_stack_name = ref None in
  let r_template_body = ref None in
  let r_template_ur_l = ref None in
  let r_parameters = ref None in
  let r_disable_rollback = ref None in
  let r_rollback_configuration = ref None in
  let r_timeout_in_minutes = ref None in
  let r_notification_ar_ns = ref None in
  let r_capabilities = ref None in
  let r_resource_types = ref None in
  let r_role_ar_n = ref None in
  let r_on_failure = ref None in
  let r_stack_policy_body = ref None in
  let r_stack_policy_ur_l = ref None in
  let r_tags = ref None in
  let r_client_request_token = ref None in
  let r_enable_termination_protection = ref None in
  let r_retain_except_on_create = ref None in
  let r_deployment_config = ref None in
  let r_disable_validation = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackName";
      "TemplateBody";
      "TemplateURL";
      "Parameters";
      "DisableRollback";
      "RollbackConfiguration";
      "TimeoutInMinutes";
      "NotificationARNs";
      "Capabilities";
      "ResourceTypes";
      "RoleARN";
      "OnFailure";
      "StackPolicyBody";
      "StackPolicyURL";
      "Tags";
      "ClientRequestToken";
      "EnableTerminationProtection";
      "RetainExceptOnCreate";
      "DeploymentConfig";
      "DisableValidation";
    ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "DisableRollback" ->
          r_disable_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableRollback"
                 (fun i _ -> disable_rollback_of_xml i)
                 ())
      | "RollbackConfiguration" ->
          r_rollback_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackConfiguration"
                 (fun i _ -> rollback_configuration_of_xml i)
                 ())
      | "TimeoutInMinutes" ->
          r_timeout_in_minutes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeoutInMinutes"
                 (fun i _ -> timeout_minutes_of_xml i)
                 ())
      | "NotificationARNs" ->
          r_notification_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> notification_ar_n_of_xml i)
                     ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "ResourceTypes" ->
          r_resource_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_type_of_xml i)
                     ())
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "OnFailure" ->
          r_on_failure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnFailure" (fun i _ -> on_failure_of_xml i) ())
      | "StackPolicyBody" ->
          r_stack_policy_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyBody"
                 (fun i _ -> stack_policy_body_of_xml i)
                 ())
      | "StackPolicyURL" ->
          r_stack_policy_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyURL"
                 (fun i _ -> stack_policy_ur_l_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "EnableTerminationProtection" ->
          r_enable_termination_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableTerminationProtection"
                 (fun i _ -> enable_termination_protection_of_xml i)
                 ())
      | "RetainExceptOnCreate" ->
          r_retain_except_on_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainExceptOnCreate"
                 (fun i _ -> retain_except_on_create_of_xml i)
                 ())
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | "DisableValidation" ->
          r_disable_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableValidation"
                 (fun i _ -> disable_validation_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     template_body = ( ! ) r_template_body;
     template_ur_l = ( ! ) r_template_ur_l;
     parameters = ( ! ) r_parameters;
     disable_rollback = ( ! ) r_disable_rollback;
     rollback_configuration = ( ! ) r_rollback_configuration;
     timeout_in_minutes = ( ! ) r_timeout_in_minutes;
     notification_ar_ns = ( ! ) r_notification_ar_ns;
     capabilities = ( ! ) r_capabilities;
     resource_types = ( ! ) r_resource_types;
     role_ar_n = ( ! ) r_role_ar_n;
     on_failure = ( ! ) r_on_failure;
     stack_policy_body = ( ! ) r_stack_policy_body;
     stack_policy_ur_l = ( ! ) r_stack_policy_ur_l;
     tags = ( ! ) r_tags;
     client_request_token = ( ! ) r_client_request_token;
     enable_termination_protection = ( ! ) r_enable_termination_protection;
     retain_except_on_create = ( ! ) r_retain_except_on_create;
     deployment_config = ( ! ) r_deployment_config;
     disable_validation = ( ! ) r_disable_validation;
   }
    : create_stack_input)

let create_generated_template_output_of_xml i =
  let r_generated_template_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GeneratedTemplateId" ] (fun tag _ ->
      match tag with
      | "GeneratedTemplateId" ->
          r_generated_template_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateId"
                 (fun i _ -> generated_template_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ generated_template_id = ( ! ) r_generated_template_id } : create_generated_template_output)

let create_generated_template_input_of_xml i =
  let r_resources = ref None in
  let r_generated_template_name = ref None in
  let r_stack_name = ref None in
  let r_template_configuration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Resources"; "GeneratedTemplateName"; "StackName"; "TemplateConfiguration" ] (fun tag _ ->
      match tag with
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_definition_of_xml i)
                     ())
                 ())
      | "GeneratedTemplateName" ->
          r_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "TemplateConfiguration" ->
          r_template_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateConfiguration"
                 (fun i _ -> template_configuration_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resources = ( ! ) r_resources;
     generated_template_name =
       Smaws_Lib.Xml.Parse.required "GeneratedTemplateName" (( ! ) r_generated_template_name) i;
     stack_name = ( ! ) r_stack_name;
     template_configuration = ( ! ) r_template_configuration;
   }
    : create_generated_template_input)

let create_change_set_output_of_xml i =
  let r_id = ref None in
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Id"; "StackId" ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> change_set_id_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ id = ( ! ) r_id; stack_id = ( ! ) r_stack_id } : create_change_set_output)

let resource_to_import_of_xml i =
  let r_resource_type = ref None in
  let r_logical_resource_id = ref None in
  let r_resource_identifier = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceType"; "LogicalResourceId"; "ResourceIdentifier" ] (fun tag _ ->
      match tag with
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> resource_identifier_property_key_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> resource_identifier_property_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     resource_identifier =
       Smaws_Lib.Xml.Parse.required "ResourceIdentifier" (( ! ) r_resource_identifier) i;
   }
    : resource_to_import)

let resources_to_import_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_to_import_of_xml i) ()

let create_change_set_input_of_xml i =
  let r_stack_name = ref None in
  let r_template_body = ref None in
  let r_template_ur_l = ref None in
  let r_use_previous_template = ref None in
  let r_parameters = ref None in
  let r_capabilities = ref None in
  let r_resource_types = ref None in
  let r_role_ar_n = ref None in
  let r_rollback_configuration = ref None in
  let r_notification_ar_ns = ref None in
  let r_tags = ref None in
  let r_change_set_name = ref None in
  let r_client_token = ref None in
  let r_description = ref None in
  let r_change_set_type = ref None in
  let r_resources_to_import = ref None in
  let r_include_nested_stacks = ref None in
  let r_on_stack_failure = ref None in
  let r_import_existing_resources = ref None in
  let r_deployment_mode = ref None in
  let r_deployment_config = ref None in
  let r_disable_validation = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StackName";
      "TemplateBody";
      "TemplateURL";
      "UsePreviousTemplate";
      "Parameters";
      "Capabilities";
      "ResourceTypes";
      "RoleARN";
      "RollbackConfiguration";
      "NotificationARNs";
      "Tags";
      "ChangeSetName";
      "ClientToken";
      "Description";
      "ChangeSetType";
      "ResourcesToImport";
      "IncludeNestedStacks";
      "OnStackFailure";
      "ImportExistingResources";
      "DeploymentMode";
      "DeploymentConfig";
      "DisableValidation";
    ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "UsePreviousTemplate" ->
          r_use_previous_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsePreviousTemplate"
                 (fun i _ -> use_previous_template_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "ResourceTypes" ->
          r_resource_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_type_of_xml i)
                     ())
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "RollbackConfiguration" ->
          r_rollback_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackConfiguration"
                 (fun i _ -> rollback_configuration_of_xml i)
                 ())
      | "NotificationARNs" ->
          r_notification_ar_ns :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NotificationARNs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> notification_ar_n_of_xml i)
                     ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_of_xml i)
                 ())
      | "ClientToken" ->
          r_client_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientToken"
                 (fun i _ -> client_token_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ChangeSetType" ->
          r_change_set_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetType"
                 (fun i _ -> change_set_type_of_xml i)
                 ())
      | "ResourcesToImport" ->
          r_resources_to_import :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesToImport"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_to_import_of_xml i)
                     ())
                 ())
      | "IncludeNestedStacks" ->
          r_include_nested_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeNestedStacks"
                 (fun i _ -> include_nested_stacks_of_xml i)
                 ())
      | "OnStackFailure" ->
          r_on_stack_failure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnStackFailure"
                 (fun i _ -> on_stack_failure_of_xml i)
                 ())
      | "ImportExistingResources" ->
          r_import_existing_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImportExistingResources"
                 (fun i _ -> import_existing_resources_of_xml i)
                 ())
      | "DeploymentMode" ->
          r_deployment_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentMode"
                 (fun i _ -> deployment_mode_of_xml i)
                 ())
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | "DisableValidation" ->
          r_disable_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableValidation"
                 (fun i _ -> disable_validation_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     template_body = ( ! ) r_template_body;
     template_ur_l = ( ! ) r_template_ur_l;
     use_previous_template = ( ! ) r_use_previous_template;
     parameters = ( ! ) r_parameters;
     capabilities = ( ! ) r_capabilities;
     resource_types = ( ! ) r_resource_types;
     role_ar_n = ( ! ) r_role_ar_n;
     rollback_configuration = ( ! ) r_rollback_configuration;
     notification_ar_ns = ( ! ) r_notification_ar_ns;
     tags = ( ! ) r_tags;
     change_set_name = Smaws_Lib.Xml.Parse.required "ChangeSetName" (( ! ) r_change_set_name) i;
     client_token = ( ! ) r_client_token;
     description = ( ! ) r_description;
     change_set_type = ( ! ) r_change_set_type;
     resources_to_import = ( ! ) r_resources_to_import;
     include_nested_stacks = ( ! ) r_include_nested_stacks;
     on_stack_failure = ( ! ) r_on_stack_failure;
     import_existing_resources = ( ! ) r_import_existing_resources;
     deployment_mode = ( ! ) r_deployment_mode;
     deployment_config = ( ! ) r_deployment_config;
     disable_validation = ( ! ) r_disable_validation;
   }
    : create_change_set_input)

let continue_update_rollback_output_of_xml i = ()
let resource_to_skip_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resources_to_skip_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_to_skip_of_xml i) ()

let continue_update_rollback_input_of_xml i =
  let r_stack_name = ref None in
  let r_role_ar_n = ref None in
  let r_resources_to_skip = ref None in
  let r_client_request_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackName"; "RoleARN"; "ResourcesToSkip"; "ClientRequestToken" ] (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "ResourcesToSkip" ->
          r_resources_to_skip :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesToSkip"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_to_skip_of_xml i)
                     ())
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     role_ar_n = ( ! ) r_role_ar_n;
     resources_to_skip = ( ! ) r_resources_to_skip;
     client_request_token = ( ! ) r_client_request_token;
   }
    : continue_update_rollback_input)
