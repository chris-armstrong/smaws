open Types

let unit_of_xml _ = ()
let virtualization_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let version_label_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let version_labels_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> version_label_of_xml i) ()

let version_labels_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> version_label_of_xml i) ()

let validation_severity_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "warning" -> Warning | "error" -> Error_ | _ -> failwith "unknown enum value"
    : validation_severity)

let validation_message_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let option_namespace_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let configuration_option_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let validation_message_of_xml i =
  let r_option_name = ref None in
  let r_namespace = ref None in
  let r_severity = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OptionName"; "Namespace"; "Severity"; "Message" ]
    (fun tag _ ->
      match tag with
      | "OptionName" ->
          r_option_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionName"
                 (fun i _ -> configuration_option_name_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> option_namespace_of_xml i)
                 ())
      | "Severity" ->
          r_severity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Severity"
                 (fun i _ -> validation_severity_of_xml i)
                 ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> validation_message_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     option_name = ( ! ) r_option_name;
     namespace = ( ! ) r_namespace;
     severity = ( ! ) r_severity;
     message = ( ! ) r_message;
   }
    : validation_message)

let validation_messages_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> validation_message_of_xml i) ()

let application_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let configuration_template_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let environment_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let configuration_option_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let configuration_option_setting_of_xml i =
  let r_value = ref None in
  let r_option_name = ref None in
  let r_namespace = ref None in
  let r_resource_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Value"; "OptionName"; "Namespace"; "ResourceName" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> configuration_option_value_of_xml i)
                 ())
      | "OptionName" ->
          r_option_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionName"
                 (fun i _ -> configuration_option_name_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> option_namespace_of_xml i)
                 ())
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     value = ( ! ) r_value;
     option_name = ( ! ) r_option_name;
     namespace = ( ! ) r_namespace;
     resource_name = ( ! ) r_resource_name;
   }
    : configuration_option_setting)

let configuration_option_settings_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> configuration_option_setting_of_xml i)
    ()

let validate_configuration_settings_message_of_xml i =
  let r_option_settings = ref None in
  let r_environment_name = ref None in
  let r_template_name = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "OptionSettings"; "EnvironmentName"; "TemplateName"; "ApplicationName" ] (fun tag _ ->
      match tag with
      | "OptionSettings" ->
          r_option_settings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionSettings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_option_setting_of_xml i)
                     ())
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     option_settings = Smaws_Lib.Xml.Parse.required "OptionSettings" (( ! ) r_option_settings) i;
     environment_name = ( ! ) r_environment_name;
     template_name = ( ! ) r_template_name;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : validate_configuration_settings_message)

let exception_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let too_many_buckets_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_buckets_exception)

let insufficient_privileges_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : insufficient_privileges_exception)

let configuration_settings_validation_messages_of_xml i =
  let r_messages = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Messages" ] (fun tag _ ->
      match tag with
      | "Messages" ->
          r_messages :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Messages"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> validation_message_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ messages = ( ! ) r_messages } : configuration_settings_validation_messages)

let user_defined_option_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resource_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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
  ({ value = ( ! ) r_value; key = ( ! ) r_key } : tag)

let tag_list_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let tag_key_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ()

let update_tags_for_resource_message_of_xml i =
  let r_tags_to_remove = ref None in
  let r_tags_to_add = ref None in
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TagsToRemove"; "TagsToAdd"; "ResourceArn" ]
    (fun tag _ ->
      match tag with
      | "TagsToRemove" ->
          r_tags_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ())
                 ())
      | "TagsToAdd" ->
          r_tags_to_add :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagsToAdd"
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
  ({
     tags_to_remove = ( ! ) r_tags_to_remove;
     tags_to_add = ( ! ) r_tags_to_add;
     resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i;
   }
    : update_tags_for_resource_message)

let too_many_tags_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_tags_exception)

let resource_type_not_supported_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_type_not_supported_exception)

let resource_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_not_found_exception)

let operation_in_progress_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : operation_in_progress_exception)

let environment_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let group_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let environment_tier_of_xml i =
  let r_version = ref None in
  let r_type_ = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Version"; "Type"; "Name" ] (fun tag _ ->
      match tag with
      | "Version" ->
          r_version :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Version" (fun i _ -> string__of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> string__of_xml i) ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ version = ( ! ) r_version; type_ = ( ! ) r_type_; name = ( ! ) r_name } : environment_tier)

let solution_stack_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let option_specification_of_xml i =
  let r_option_name = ref None in
  let r_namespace = ref None in
  let r_resource_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OptionName"; "Namespace"; "ResourceName" ]
    (fun tag _ ->
      match tag with
      | "OptionName" ->
          r_option_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionName"
                 (fun i _ -> configuration_option_name_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> option_namespace_of_xml i)
                 ())
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     option_name = ( ! ) r_option_name;
     namespace = ( ! ) r_namespace;
     resource_name = ( ! ) r_resource_name;
   }
    : option_specification)

let options_specifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> option_specification_of_xml i) ()

let update_environment_message_of_xml i =
  let r_options_to_remove = ref None in
  let r_option_settings = ref None in
  let r_platform_arn = ref None in
  let r_solution_stack_name = ref None in
  let r_template_name = ref None in
  let r_version_label = ref None in
  let r_tier = ref None in
  let r_description = ref None in
  let r_group_name = ref None in
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OptionsToRemove";
      "OptionSettings";
      "PlatformArn";
      "SolutionStackName";
      "TemplateName";
      "VersionLabel";
      "Tier";
      "Description";
      "GroupName";
      "EnvironmentName";
      "EnvironmentId";
      "ApplicationName";
    ] (fun tag _ ->
      match tag with
      | "OptionsToRemove" ->
          r_options_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> option_specification_of_xml i)
                     ())
                 ())
      | "OptionSettings" ->
          r_option_settings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionSettings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_option_setting_of_xml i)
                     ())
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "Tier" ->
          r_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tier" (fun i _ -> environment_tier_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName" (fun i _ -> group_name_of_xml i) ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options_to_remove = ( ! ) r_options_to_remove;
     option_settings = ( ! ) r_option_settings;
     platform_arn = ( ! ) r_platform_arn;
     solution_stack_name = ( ! ) r_solution_stack_name;
     template_name = ( ! ) r_template_name;
     version_label = ( ! ) r_version_label;
     tier = ( ! ) r_tier;
     description = ( ! ) r_description;
     group_name = ( ! ) r_group_name;
     environment_name = ( ! ) r_environment_name;
     environment_id = ( ! ) r_environment_id;
     application_name = ( ! ) r_application_name;
   }
    : update_environment_message)

let endpoint_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let dns_cname_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let creation_date_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let update_date_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let environment_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Terminated" -> Terminated
   | "Terminating" -> Terminating
   | "Ready" -> Ready
   | "LinkingTo" -> LinkingTo
   | "LinkingFrom" -> LinkingFrom
   | "Updating" -> Updating
   | "Launching" -> Launching
   | "Aborting" -> Aborting
   | _ -> failwith "unknown enum value"
    : environment_status)

let abortable_operation_in_progress_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let environment_health_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Grey" -> Grey
   | "Red" -> Red
   | "Yellow" -> Yellow
   | "Green" -> Green
   | _ -> failwith "unknown enum value"
    : environment_health)

let environment_health_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Suspended" -> Suspended
   | "Severe" -> Severe
   | "Degraded" -> Degraded
   | "Warning" -> Warning
   | "Info" -> Info
   | "Ok" -> Ok_
   | "Pending" -> Pending
   | "Unknown" -> Unknown
   | "NoData" -> NoData
   | _ -> failwith "unknown enum value"
    : environment_health_status)

let integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let listener_of_xml i =
  let r_port = ref None in
  let r_protocol = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Port"; "Protocol" ] (fun tag _ ->
      match tag with
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | "Protocol" ->
          r_protocol :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Protocol" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ port = ( ! ) r_port; protocol = ( ! ) r_protocol } : listener)

let load_balancer_listeners_description_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_of_xml i) ()

let load_balancer_description_of_xml i =
  let r_listeners = ref None in
  let r_domain = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Listeners"; "Domain"; "LoadBalancerName" ]
    (fun tag _ ->
      match tag with
      | "Listeners" ->
          r_listeners :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Listeners"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_of_xml i) ())
                 ())
      | "Domain" ->
          r_domain :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Domain" (fun i _ -> string__of_xml i) ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     listeners = ( ! ) r_listeners;
     domain = ( ! ) r_domain;
     load_balancer_name = ( ! ) r_load_balancer_name;
   }
    : load_balancer_description)

let environment_resources_description_of_xml i =
  let r_load_balancer = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancer" ] (fun tag _ ->
      match tag with
      | "LoadBalancer" ->
          r_load_balancer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancer"
                 (fun i _ -> load_balancer_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ load_balancer = ( ! ) r_load_balancer } : environment_resources_description)

let environment_link_of_xml i =
  let r_environment_name = ref None in
  let r_link_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentName"; "LinkName" ] (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "LinkName" ->
          r_link_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "LinkName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ environment_name = ( ! ) r_environment_name; link_name = ( ! ) r_link_name }
    : environment_link)

let environment_links_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> environment_link_of_xml i) ()

let environment_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let operations_role_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let environment_description_of_xml i =
  let r_operations_role = ref None in
  let r_environment_arn = ref None in
  let r_environment_links = ref None in
  let r_tier = ref None in
  let r_resources = ref None in
  let r_health_status = ref None in
  let r_health = ref None in
  let r_abortable_operation_in_progress = ref None in
  let r_status = ref None in
  let r_date_updated = ref None in
  let r_date_created = ref None in
  let r_cnam_e = ref None in
  let r_endpoint_ur_l = ref None in
  let r_description = ref None in
  let r_template_name = ref None in
  let r_platform_arn = ref None in
  let r_solution_stack_name = ref None in
  let r_version_label = ref None in
  let r_application_name = ref None in
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OperationsRole";
      "EnvironmentArn";
      "EnvironmentLinks";
      "Tier";
      "Resources";
      "HealthStatus";
      "Health";
      "AbortableOperationInProgress";
      "Status";
      "DateUpdated";
      "DateCreated";
      "CNAME";
      "EndpointURL";
      "Description";
      "TemplateName";
      "PlatformArn";
      "SolutionStackName";
      "VersionLabel";
      "ApplicationName";
      "EnvironmentId";
      "EnvironmentName";
    ] (fun tag _ ->
      match tag with
      | "OperationsRole" ->
          r_operations_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationsRole"
                 (fun i _ -> operations_role_of_xml i)
                 ())
      | "EnvironmentArn" ->
          r_environment_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentArn"
                 (fun i _ -> environment_arn_of_xml i)
                 ())
      | "EnvironmentLinks" ->
          r_environment_links :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentLinks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> environment_link_of_xml i)
                     ())
                 ())
      | "Tier" ->
          r_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tier" (fun i _ -> environment_tier_of_xml i) ())
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ -> environment_resources_description_of_xml i)
                 ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus"
                 (fun i _ -> environment_health_status_of_xml i)
                 ())
      | "Health" ->
          r_health :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Health"
                 (fun i _ -> environment_health_of_xml i)
                 ())
      | "AbortableOperationInProgress" ->
          r_abortable_operation_in_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AbortableOperationInProgress"
                 (fun i _ -> abortable_operation_in_progress_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> environment_status_of_xml i)
                 ())
      | "DateUpdated" ->
          r_date_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateUpdated"
                 (fun i _ -> update_date_of_xml i)
                 ())
      | "DateCreated" ->
          r_date_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateCreated"
                 (fun i _ -> creation_date_of_xml i)
                 ())
      | "CNAME" ->
          r_cnam_e :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CNAME" (fun i _ -> dns_cname_of_xml i) ())
      | "EndpointURL" ->
          r_endpoint_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointURL"
                 (fun i _ -> endpoint_ur_l_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     operations_role = ( ! ) r_operations_role;
     environment_arn = ( ! ) r_environment_arn;
     environment_links = ( ! ) r_environment_links;
     tier = ( ! ) r_tier;
     resources = ( ! ) r_resources;
     health_status = ( ! ) r_health_status;
     health = ( ! ) r_health;
     abortable_operation_in_progress = ( ! ) r_abortable_operation_in_progress;
     status = ( ! ) r_status;
     date_updated = ( ! ) r_date_updated;
     date_created = ( ! ) r_date_created;
     cnam_e = ( ! ) r_cnam_e;
     endpoint_ur_l = ( ! ) r_endpoint_ur_l;
     description = ( ! ) r_description;
     template_name = ( ! ) r_template_name;
     platform_arn = ( ! ) r_platform_arn;
     solution_stack_name = ( ! ) r_solution_stack_name;
     version_label = ( ! ) r_version_label;
     application_name = ( ! ) r_application_name;
     environment_id = ( ! ) r_environment_id;
     environment_name = ( ! ) r_environment_name;
   }
    : environment_description)

let update_configuration_template_message_of_xml i =
  let r_options_to_remove = ref None in
  let r_option_settings = ref None in
  let r_description = ref None in
  let r_template_name = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "OptionsToRemove"; "OptionSettings"; "Description"; "TemplateName"; "ApplicationName" ]
    (fun tag _ ->
      match tag with
      | "OptionsToRemove" ->
          r_options_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> option_specification_of_xml i)
                     ())
                 ())
      | "OptionSettings" ->
          r_option_settings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionSettings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_option_setting_of_xml i)
                     ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options_to_remove = ( ! ) r_options_to_remove;
     option_settings = ( ! ) r_option_settings;
     description = ( ! ) r_description;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : update_configuration_template_message)

let configuration_deployment_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "failed" -> Failed
   | "pending" -> Pending
   | "deployed" -> Deployed
   | _ -> failwith "unknown enum value"
    : configuration_deployment_status)

let configuration_settings_description_of_xml i =
  let r_option_settings = ref None in
  let r_date_updated = ref None in
  let r_date_created = ref None in
  let r_deployment_status = ref None in
  let r_environment_name = ref None in
  let r_description = ref None in
  let r_template_name = ref None in
  let r_application_name = ref None in
  let r_platform_arn = ref None in
  let r_solution_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OptionSettings";
      "DateUpdated";
      "DateCreated";
      "DeploymentStatus";
      "EnvironmentName";
      "Description";
      "TemplateName";
      "ApplicationName";
      "PlatformArn";
      "SolutionStackName";
    ] (fun tag _ ->
      match tag with
      | "OptionSettings" ->
          r_option_settings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionSettings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_option_setting_of_xml i)
                     ())
                 ())
      | "DateUpdated" ->
          r_date_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateUpdated"
                 (fun i _ -> update_date_of_xml i)
                 ())
      | "DateCreated" ->
          r_date_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateCreated"
                 (fun i _ -> creation_date_of_xml i)
                 ())
      | "DeploymentStatus" ->
          r_deployment_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentStatus"
                 (fun i _ -> configuration_deployment_status_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     option_settings = ( ! ) r_option_settings;
     date_updated = ( ! ) r_date_updated;
     date_created = ( ! ) r_date_created;
     deployment_status = ( ! ) r_deployment_status;
     environment_name = ( ! ) r_environment_name;
     description = ( ! ) r_description;
     template_name = ( ! ) r_template_name;
     application_name = ( ! ) r_application_name;
     platform_arn = ( ! ) r_platform_arn;
     solution_stack_name = ( ! ) r_solution_stack_name;
   }
    : configuration_settings_description)

let update_application_version_message_of_xml i =
  let r_description = ref None in
  let r_version_label = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Description"; "VersionLabel"; "ApplicationName" ]
    (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     description = ( ! ) r_description;
     version_label = Smaws_Lib.Xml.Parse.required "VersionLabel" (( ! ) r_version_label) i;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : update_application_version_message)

let application_version_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let source_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Zip" -> Zip | "Git" -> Git | _ -> failwith "unknown enum value" : source_type)

let source_repository_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "S3" -> S3 | "CodeCommit" -> CodeCommit | _ -> failwith "unknown enum value"
    : source_repository)

let source_location_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let source_build_information_of_xml i =
  let r_source_location = ref None in
  let r_source_repository = ref None in
  let r_source_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourceLocation"; "SourceRepository"; "SourceType" ] (fun tag _ ->
      match tag with
      | "SourceLocation" ->
          r_source_location :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceLocation"
                 (fun i _ -> source_location_of_xml i)
                 ())
      | "SourceRepository" ->
          r_source_repository :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceRepository"
                 (fun i _ -> source_repository_of_xml i)
                 ())
      | "SourceType" ->
          r_source_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType"
                 (fun i _ -> source_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_location = Smaws_Lib.Xml.Parse.required "SourceLocation" (( ! ) r_source_location) i;
     source_repository =
       Smaws_Lib.Xml.Parse.required "SourceRepository" (( ! ) r_source_repository) i;
     source_type = Smaws_Lib.Xml.Parse.required "SourceType" (( ! ) r_source_type) i;
   }
    : source_build_information)

let s3_bucket_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let s3_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let s3_location_of_xml i =
  let r_s3_key = ref None in
  let r_s3_bucket = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "S3Key"; "S3Bucket" ] (fun tag _ ->
      match tag with
      | "S3Key" ->
          r_s3_key :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "S3Key" (fun i _ -> s3_key_of_xml i) ())
      | "S3Bucket" ->
          r_s3_bucket :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "S3Bucket" (fun i _ -> s3_bucket_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ s3_key = ( ! ) r_s3_key; s3_bucket = ( ! ) r_s3_bucket } : s3_location)

let application_version_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Building" -> Building
   | "Processing" -> Processing
   | "Failed" -> Failed
   | "Unprocessed" -> Unprocessed
   | "Processed" -> Processed
   | _ -> failwith "unknown enum value"
    : application_version_status)

let application_version_description_of_xml i =
  let r_status = ref None in
  let r_date_updated = ref None in
  let r_date_created = ref None in
  let r_source_bundle = ref None in
  let r_build_arn = ref None in
  let r_source_build_information = ref None in
  let r_version_label = ref None in
  let r_description = ref None in
  let r_application_name = ref None in
  let r_application_version_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Status";
      "DateUpdated";
      "DateCreated";
      "SourceBundle";
      "BuildArn";
      "SourceBuildInformation";
      "VersionLabel";
      "Description";
      "ApplicationName";
      "ApplicationVersionArn";
    ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> application_version_status_of_xml i)
                 ())
      | "DateUpdated" ->
          r_date_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateUpdated"
                 (fun i _ -> update_date_of_xml i)
                 ())
      | "DateCreated" ->
          r_date_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateCreated"
                 (fun i _ -> creation_date_of_xml i)
                 ())
      | "SourceBundle" ->
          r_source_bundle :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceBundle"
                 (fun i _ -> s3_location_of_xml i)
                 ())
      | "BuildArn" ->
          r_build_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "BuildArn" (fun i _ -> string__of_xml i) ())
      | "SourceBuildInformation" ->
          r_source_build_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceBuildInformation"
                 (fun i _ -> source_build_information_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "ApplicationVersionArn" ->
          r_application_version_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationVersionArn"
                 (fun i _ -> application_version_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = ( ! ) r_status;
     date_updated = ( ! ) r_date_updated;
     date_created = ( ! ) r_date_created;
     source_bundle = ( ! ) r_source_bundle;
     build_arn = ( ! ) r_build_arn;
     source_build_information = ( ! ) r_source_build_information;
     version_label = ( ! ) r_version_label;
     description = ( ! ) r_description;
     application_name = ( ! ) r_application_name;
     application_version_arn = ( ! ) r_application_version_arn;
   }
    : application_version_description)

let application_version_description_message_of_xml i =
  let r_application_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationVersion" ] (fun tag _ ->
      match tag with
      | "ApplicationVersion" ->
          r_application_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationVersion"
                 (fun i _ -> application_version_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ application_version = ( ! ) r_application_version } : application_version_description_message)

let boxed_boolean_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let boxed_int_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_count_rule_of_xml i =
  let r_delete_source_from_s3 = ref None in
  let r_max_count = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DeleteSourceFromS3"; "MaxCount"; "Enabled" ]
    (fun tag _ ->
      match tag with
      | "DeleteSourceFromS3" ->
          r_delete_source_from_s3 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeleteSourceFromS3"
                 (fun i _ -> boxed_boolean_of_xml i)
                 ())
      | "MaxCount" ->
          r_max_count :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCount" (fun i _ -> boxed_int_of_xml i) ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> boxed_boolean_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delete_source_from_s3 = ( ! ) r_delete_source_from_s3;
     max_count = ( ! ) r_max_count;
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
   }
    : max_count_rule)

let max_age_rule_of_xml i =
  let r_delete_source_from_s3 = ref None in
  let r_max_age_in_days = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DeleteSourceFromS3"; "MaxAgeInDays"; "Enabled" ]
    (fun tag _ ->
      match tag with
      | "DeleteSourceFromS3" ->
          r_delete_source_from_s3 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeleteSourceFromS3"
                 (fun i _ -> boxed_boolean_of_xml i)
                 ())
      | "MaxAgeInDays" ->
          r_max_age_in_days :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxAgeInDays"
                 (fun i _ -> boxed_int_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> boxed_boolean_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delete_source_from_s3 = ( ! ) r_delete_source_from_s3;
     max_age_in_days = ( ! ) r_max_age_in_days;
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
   }
    : max_age_rule)

let application_version_lifecycle_config_of_xml i =
  let r_max_age_rule = ref None in
  let r_max_count_rule = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxAgeRule"; "MaxCountRule" ] (fun tag _ ->
      match tag with
      | "MaxAgeRule" ->
          r_max_age_rule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxAgeRule"
                 (fun i _ -> max_age_rule_of_xml i)
                 ())
      | "MaxCountRule" ->
          r_max_count_rule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCountRule"
                 (fun i _ -> max_count_rule_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_age_rule = ( ! ) r_max_age_rule; max_count_rule = ( ! ) r_max_count_rule }
    : application_version_lifecycle_config)

let application_resource_lifecycle_config_of_xml i =
  let r_version_lifecycle_config = ref None in
  let r_service_role = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VersionLifecycleConfig"; "ServiceRole" ]
    (fun tag _ ->
      match tag with
      | "VersionLifecycleConfig" ->
          r_version_lifecycle_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLifecycleConfig"
                 (fun i _ -> application_version_lifecycle_config_of_xml i)
                 ())
      | "ServiceRole" ->
          r_service_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceRole" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     version_lifecycle_config = ( ! ) r_version_lifecycle_config;
     service_role = ( ! ) r_service_role;
   }
    : application_resource_lifecycle_config)

let update_application_resource_lifecycle_message_of_xml i =
  let r_resource_lifecycle_config = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceLifecycleConfig"; "ApplicationName" ]
    (fun tag _ ->
      match tag with
      | "ResourceLifecycleConfig" ->
          r_resource_lifecycle_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLifecycleConfig"
                 (fun i _ -> application_resource_lifecycle_config_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_lifecycle_config =
       Smaws_Lib.Xml.Parse.required "ResourceLifecycleConfig" (( ! ) r_resource_lifecycle_config) i;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : update_application_resource_lifecycle_message)

let application_resource_lifecycle_description_message_of_xml i =
  let r_resource_lifecycle_config = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceLifecycleConfig"; "ApplicationName" ]
    (fun tag _ ->
      match tag with
      | "ResourceLifecycleConfig" ->
          r_resource_lifecycle_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLifecycleConfig"
                 (fun i _ -> application_resource_lifecycle_config_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_lifecycle_config = ( ! ) r_resource_lifecycle_config;
     application_name = ( ! ) r_application_name;
   }
    : application_resource_lifecycle_description_message)

let update_application_message_of_xml i =
  let r_description = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Description"; "ApplicationName" ] (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     description = ( ! ) r_description;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : update_application_message)

let application_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let configuration_template_names_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> configuration_template_name_of_xml i) ()

let application_description_of_xml i =
  let r_resource_lifecycle_config = ref None in
  let r_configuration_templates = ref None in
  let r_versions = ref None in
  let r_date_updated = ref None in
  let r_date_created = ref None in
  let r_description = ref None in
  let r_application_name = ref None in
  let r_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ResourceLifecycleConfig";
      "ConfigurationTemplates";
      "Versions";
      "DateUpdated";
      "DateCreated";
      "Description";
      "ApplicationName";
      "ApplicationArn";
    ] (fun tag _ ->
      match tag with
      | "ResourceLifecycleConfig" ->
          r_resource_lifecycle_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLifecycleConfig"
                 (fun i _ -> application_resource_lifecycle_config_of_xml i)
                 ())
      | "ConfigurationTemplates" ->
          r_configuration_templates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationTemplates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_template_name_of_xml i)
                     ())
                 ())
      | "Versions" ->
          r_versions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Versions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> version_label_of_xml i)
                     ())
                 ())
      | "DateUpdated" ->
          r_date_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateUpdated"
                 (fun i _ -> update_date_of_xml i)
                 ())
      | "DateCreated" ->
          r_date_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateCreated"
                 (fun i _ -> creation_date_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "ApplicationArn" ->
          r_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationArn"
                 (fun i _ -> application_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_lifecycle_config = ( ! ) r_resource_lifecycle_config;
     configuration_templates = ( ! ) r_configuration_templates;
     versions = ( ! ) r_versions;
     date_updated = ( ! ) r_date_updated;
     date_created = ( ! ) r_date_created;
     description = ( ! ) r_description;
     application_name = ( ! ) r_application_name;
     application_arn = ( ! ) r_application_arn;
   }
    : application_description)

let application_description_message_of_xml i =
  let r_application = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Application" ] (fun tag _ ->
      match tag with
      | "Application" ->
          r_application :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Application"
                 (fun i _ -> application_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ application = ( ! ) r_application } : application_description_message)

let resource_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let trigger_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> resource_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name } : trigger)

let trigger_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> trigger_of_xml i) ()

let too_many_platforms_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_platforms_exception)

let too_many_environments_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_environments_exception)

let too_many_configuration_templates_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_configuration_templates_exception)

let too_many_applications_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_applications_exception)

let too_many_application_versions_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_application_versions_exception)

let token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let time_filter_start_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let time_filter_end_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let terminate_environment_resources_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let force_terminate_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let terminate_environment_message_of_xml i =
  let r_force_terminate = ref None in
  let r_terminate_resources = ref None in
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ForceTerminate"; "TerminateResources"; "EnvironmentName"; "EnvironmentId" ] (fun tag _ ->
      match tag with
      | "ForceTerminate" ->
          r_force_terminate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForceTerminate"
                 (fun i _ -> force_terminate_of_xml i)
                 ())
      | "TerminateResources" ->
          r_terminate_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminateResources"
                 (fun i _ -> terminate_environment_resources_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     force_terminate = ( ! ) r_force_terminate;
     terminate_resources = ( ! ) r_terminate_resources;
     environment_name = ( ! ) r_environment_name;
     environment_id = ( ! ) r_environment_id;
   }
    : terminate_environment_message)

let terminate_env_force_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let tags_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let nullable_double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let cpu_utilization_of_xml i =
  let r_privileged = ref None in
  let r_soft_ir_q = ref None in
  let r_ir_q = ref None in
  let r_io_wait = ref None in
  let r_idle = ref None in
  let r_system = ref None in
  let r_nice = ref None in
  let r_user = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Privileged"; "SoftIRQ"; "IRQ"; "IOWait"; "Idle"; "System"; "Nice"; "User" ] (fun tag _ ->
      match tag with
      | "Privileged" ->
          r_privileged :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Privileged"
                 (fun i _ -> nullable_double_of_xml i)
                 ())
      | "SoftIRQ" ->
          r_soft_ir_q :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SoftIRQ"
                 (fun i _ -> nullable_double_of_xml i)
                 ())
      | "IRQ" ->
          r_ir_q :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IRQ" (fun i _ -> nullable_double_of_xml i) ())
      | "IOWait" ->
          r_io_wait :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IOWait"
                 (fun i _ -> nullable_double_of_xml i)
                 ())
      | "Idle" ->
          r_idle :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Idle" (fun i _ -> nullable_double_of_xml i) ())
      | "System" ->
          r_system :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "System"
                 (fun i _ -> nullable_double_of_xml i)
                 ())
      | "Nice" ->
          r_nice :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Nice" (fun i _ -> nullable_double_of_xml i) ())
      | "User" ->
          r_user :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "User" (fun i _ -> nullable_double_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     privileged = ( ! ) r_privileged;
     soft_ir_q = ( ! ) r_soft_ir_q;
     ir_q = ( ! ) r_ir_q;
     io_wait = ( ! ) r_io_wait;
     idle = ( ! ) r_idle;
     system = ( ! ) r_system;
     nice = ( ! ) r_nice;
     user = ( ! ) r_user;
   }
    : cpu_utilization)

let load_average_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let load_average_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_average_value_of_xml i) ()

let system_status_of_xml i =
  let r_load_average = ref None in
  let r_cpu_utilization = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadAverage"; "CPUUtilization" ] (fun tag _ ->
      match tag with
      | "LoadAverage" ->
          r_load_average :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadAverage"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_average_value_of_xml i)
                     ())
                 ())
      | "CPUUtilization" ->
          r_cpu_utilization :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CPUUtilization"
                 (fun i _ -> cpu_utilization_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ load_average = ( ! ) r_load_average; cpu_utilization = ( ! ) r_cpu_utilization }
    : system_status)

let swap_environment_cnam_es_message_of_xml i =
  let r_destination_environment_name = ref None in
  let r_destination_environment_id = ref None in
  let r_source_environment_name = ref None in
  let r_source_environment_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DestinationEnvironmentName";
      "DestinationEnvironmentId";
      "SourceEnvironmentName";
      "SourceEnvironmentId";
    ] (fun tag _ ->
      match tag with
      | "DestinationEnvironmentName" ->
          r_destination_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationEnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "DestinationEnvironmentId" ->
          r_destination_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationEnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | "SourceEnvironmentName" ->
          r_source_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceEnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "SourceEnvironmentId" ->
          r_source_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceEnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     destination_environment_name = ( ! ) r_destination_environment_name;
     destination_environment_id = ( ! ) r_destination_environment_id;
     source_environment_name = ( ! ) r_source_environment_name;
     source_environment_id = ( ! ) r_source_environment_id;
   }
    : swap_environment_cnam_es_message)

let supported_tier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let supported_tier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> supported_tier_of_xml i) ()

let supported_addon_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let supported_addon_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> supported_addon_of_xml i) ()

let nullable_integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let status_codes_of_xml i =
  let r_status5xx = ref None in
  let r_status4xx = ref None in
  let r_status3xx = ref None in
  let r_status2xx = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Status5xx"; "Status4xx"; "Status3xx"; "Status2xx" ] (fun tag _ ->
      match tag with
      | "Status5xx" ->
          r_status5xx :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status5xx"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Status4xx" ->
          r_status4xx :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status4xx"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Status3xx" ->
          r_status3xx :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status3xx"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Status2xx" ->
          r_status2xx :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status2xx"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status5xx = ( ! ) r_status5xx;
     status4xx = ( ! ) r_status4xx;
     status3xx = ( ! ) r_status3xx;
     status2xx = ( ! ) r_status2xx;
   }
    : status_codes)

let source_configuration_of_xml i =
  let r_template_name = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName"; "ApplicationName" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_name = ( ! ) r_template_name; application_name = ( ! ) r_application_name }
    : source_configuration)

let source_bundle_deletion_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : source_bundle_deletion_exception)

let file_type_extension_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let solution_stack_file_type_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> file_type_extension_of_xml i) ()

let solution_stack_description_of_xml i =
  let r_permitted_file_types = ref None in
  let r_solution_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PermittedFileTypes"; "SolutionStackName" ]
    (fun tag _ ->
      match tag with
      | "PermittedFileTypes" ->
          r_permitted_file_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermittedFileTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> file_type_extension_of_xml i)
                     ())
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     permitted_file_types = ( ! ) r_permitted_file_types;
     solution_stack_name = ( ! ) r_solution_stack_name;
   }
    : solution_stack_description)

let instance_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let cause_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let causes_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cause_of_xml i) ()

let launched_at_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let request_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let latency_of_xml i =
  let r_p10 = ref None in
  let r_p50 = ref None in
  let r_p75 = ref None in
  let r_p85 = ref None in
  let r_p90 = ref None in
  let r_p95 = ref None in
  let r_p99 = ref None in
  let r_p999 = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "P10"; "P50"; "P75"; "P85"; "P90"; "P95"; "P99"; "P999" ] (fun tag _ ->
      match tag with
      | "P10" ->
          r_p10 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P10" (fun i _ -> nullable_double_of_xml i) ())
      | "P50" ->
          r_p50 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P50" (fun i _ -> nullable_double_of_xml i) ())
      | "P75" ->
          r_p75 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P75" (fun i _ -> nullable_double_of_xml i) ())
      | "P85" ->
          r_p85 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P85" (fun i _ -> nullable_double_of_xml i) ())
      | "P90" ->
          r_p90 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P90" (fun i _ -> nullable_double_of_xml i) ())
      | "P95" ->
          r_p95 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P95" (fun i _ -> nullable_double_of_xml i) ())
      | "P99" ->
          r_p99 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P99" (fun i _ -> nullable_double_of_xml i) ())
      | "P999" ->
          r_p999 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P999" (fun i _ -> nullable_double_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     p10 = ( ! ) r_p10;
     p50 = ( ! ) r_p50;
     p75 = ( ! ) r_p75;
     p85 = ( ! ) r_p85;
     p90 = ( ! ) r_p90;
     p95 = ( ! ) r_p95;
     p99 = ( ! ) r_p99;
     p999 = ( ! ) r_p999;
   }
    : latency)

let application_metrics_of_xml i =
  let r_latency = ref None in
  let r_status_codes = ref None in
  let r_request_count = ref None in
  let r_duration = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Latency"; "StatusCodes"; "RequestCount"; "Duration" ] (fun tag _ ->
      match tag with
      | "Latency" ->
          r_latency :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Latency" (fun i _ -> latency_of_xml i) ())
      | "StatusCodes" ->
          r_status_codes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusCodes"
                 (fun i _ -> status_codes_of_xml i)
                 ())
      | "RequestCount" ->
          r_request_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestCount"
                 (fun i _ -> request_count_of_xml i)
                 ())
      | "Duration" ->
          r_duration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Duration"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     latency = ( ! ) r_latency;
     status_codes = ( ! ) r_status_codes;
     request_count = ( ! ) r_request_count;
     duration = ( ! ) r_duration;
   }
    : application_metrics)

let nullable_long_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let deployment_timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let deployment_of_xml i =
  let r_deployment_time = ref None in
  let r_status = ref None in
  let r_deployment_id = ref None in
  let r_version_label = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DeploymentTime"; "Status"; "DeploymentId"; "VersionLabel" ] (fun tag _ ->
      match tag with
      | "DeploymentTime" ->
          r_deployment_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTime"
                 (fun i _ -> deployment_timestamp_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "DeploymentId" ->
          r_deployment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentId"
                 (fun i _ -> nullable_long_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deployment_time = ( ! ) r_deployment_time;
     status = ( ! ) r_status;
     deployment_id = ( ! ) r_deployment_id;
     version_label = ( ! ) r_version_label;
   }
    : deployment)

let single_instance_health_of_xml i =
  let r_instance_type = ref None in
  let r_availability_zone = ref None in
  let r_deployment = ref None in
  let r_system = ref None in
  let r_application_metrics = ref None in
  let r_launched_at = ref None in
  let r_causes = ref None in
  let r_color = ref None in
  let r_health_status = ref None in
  let r_instance_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceType";
      "AvailabilityZone";
      "Deployment";
      "System";
      "ApplicationMetrics";
      "LaunchedAt";
      "Causes";
      "Color";
      "HealthStatus";
      "InstanceId";
    ] (fun tag _ ->
      match tag with
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType" (fun i _ -> string__of_xml i) ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Deployment" ->
          r_deployment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Deployment" (fun i _ -> deployment_of_xml i) ())
      | "System" ->
          r_system :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "System" (fun i _ -> system_status_of_xml i) ())
      | "ApplicationMetrics" ->
          r_application_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationMetrics"
                 (fun i _ -> application_metrics_of_xml i)
                 ())
      | "LaunchedAt" ->
          r_launched_at :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchedAt"
                 (fun i _ -> launched_at_of_xml i)
                 ())
      | "Causes" ->
          r_causes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Causes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cause_of_xml i) ())
                 ())
      | "Color" ->
          r_color :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Color" (fun i _ -> string__of_xml i) ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus" (fun i _ -> string__of_xml i) ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> instance_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_type = ( ! ) r_instance_type;
     availability_zone = ( ! ) r_availability_zone;
     deployment = ( ! ) r_deployment;
     system = ( ! ) r_system;
     application_metrics = ( ! ) r_application_metrics;
     launched_at = ( ! ) r_launched_at;
     causes = ( ! ) r_causes;
     color = ( ! ) r_color;
     health_status = ( ! ) r_health_status;
     instance_id = ( ! ) r_instance_id;
   }
    : single_instance_health)

let search_filter_attribute_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let search_filter_operator_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let search_filter_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let search_filter_values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> search_filter_value_of_xml i) ()

let search_filter_of_xml i =
  let r_values = ref None in
  let r_operator = ref None in
  let r_attribute = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values"; "Operator"; "Attribute" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> search_filter_value_of_xml i)
                     ())
                 ())
      | "Operator" ->
          r_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Operator"
                 (fun i _ -> search_filter_operator_of_xml i)
                 ())
      | "Attribute" ->
          r_attribute :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attribute"
                 (fun i _ -> search_filter_attribute_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ values = ( ! ) r_values; operator = ( ! ) r_operator; attribute = ( ! ) r_attribute }
    : search_filter)

let search_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> search_filter_of_xml i) ()

let sample_timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let s3_subscription_required_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : s3_subscription_required_exception)

let s3_location_not_in_service_region_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : s3_location_not_in_service_region_exception)

let environment_info_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "analyze" -> Analyze
   | "bundle" -> Bundle
   | "tail" -> Tail
   | _ -> failwith "unknown enum value"
    : environment_info_type)

let ec2_instance_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let environment_info_description_of_xml i =
  let r_message = ref None in
  let r_sample_timestamp = ref None in
  let r_ec2_instance_id = ref None in
  let r_info_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Message"; "SampleTimestamp"; "Ec2InstanceId"; "InfoType" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> message_of_xml i) ())
      | "SampleTimestamp" ->
          r_sample_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SampleTimestamp"
                 (fun i _ -> sample_timestamp_of_xml i)
                 ())
      | "Ec2InstanceId" ->
          r_ec2_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Ec2InstanceId"
                 (fun i _ -> ec2_instance_id_of_xml i)
                 ())
      | "InfoType" ->
          r_info_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InfoType"
                 (fun i _ -> environment_info_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     sample_timestamp = ( ! ) r_sample_timestamp;
     ec2_instance_id = ( ! ) r_ec2_instance_id;
     info_type = ( ! ) r_info_type;
   }
    : environment_info_description)

let environment_info_description_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> environment_info_description_of_xml i)
    ()

let retrieve_environment_info_result_message_of_xml i =
  let r_environment_info = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentInfo" ] (fun tag _ ->
      match tag with
      | "EnvironmentInfo" ->
          r_environment_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentInfo"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> environment_info_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ environment_info = ( ! ) r_environment_info } : retrieve_environment_info_result_message)

let retrieve_environment_info_message_of_xml i =
  let r_info_type = ref None in
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InfoType"; "EnvironmentName"; "EnvironmentId" ]
    (fun tag _ ->
      match tag with
      | "InfoType" ->
          r_info_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InfoType"
                 (fun i _ -> environment_info_type_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     info_type = Smaws_Lib.Xml.Parse.required "InfoType" (( ! ) r_info_type) i;
     environment_name = ( ! ) r_environment_name;
     environment_id = ( ! ) r_environment_id;
   }
    : retrieve_environment_info_message)

let restart_app_server_message_of_xml i =
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentName"; "EnvironmentId" ] (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ environment_name = ( ! ) r_environment_name; environment_id = ( ! ) r_environment_id }
    : restart_app_server_message)

let resource_tags_description_message_of_xml i =
  let r_resource_tags = ref None in
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceTags"; "ResourceArn" ] (fun tag _ ->
      match tag with
      | "ResourceTags" ->
          r_resource_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTags"
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
  ({ resource_tags = ( ! ) r_resource_tags; resource_arn = ( ! ) r_resource_arn }
    : resource_tags_description_message)

let resource_quota_of_xml i =
  let r_maximum = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Maximum" ] (fun tag _ ->
      match tag with
      | "Maximum" ->
          r_maximum :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Maximum" (fun i _ -> boxed_int_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ maximum = ( ! ) r_maximum } : resource_quota)

let resource_quotas_of_xml i =
  let r_custom_platform_quota = ref None in
  let r_configuration_template_quota = ref None in
  let r_environment_quota = ref None in
  let r_application_version_quota = ref None in
  let r_application_quota = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CustomPlatformQuota";
      "ConfigurationTemplateQuota";
      "EnvironmentQuota";
      "ApplicationVersionQuota";
      "ApplicationQuota";
    ] (fun tag _ ->
      match tag with
      | "CustomPlatformQuota" ->
          r_custom_platform_quota :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomPlatformQuota"
                 (fun i _ -> resource_quota_of_xml i)
                 ())
      | "ConfigurationTemplateQuota" ->
          r_configuration_template_quota :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationTemplateQuota"
                 (fun i _ -> resource_quota_of_xml i)
                 ())
      | "EnvironmentQuota" ->
          r_environment_quota :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentQuota"
                 (fun i _ -> resource_quota_of_xml i)
                 ())
      | "ApplicationVersionQuota" ->
          r_application_version_quota :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationVersionQuota"
                 (fun i _ -> resource_quota_of_xml i)
                 ())
      | "ApplicationQuota" ->
          r_application_quota :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationQuota"
                 (fun i _ -> resource_quota_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     custom_platform_quota = ( ! ) r_custom_platform_quota;
     configuration_template_quota = ( ! ) r_configuration_template_quota;
     environment_quota = ( ! ) r_environment_quota;
     application_version_quota = ( ! ) r_application_version_quota;
     application_quota = ( ! ) r_application_quota;
   }
    : resource_quotas)

let request_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let request_environment_info_message_of_xml i =
  let r_info_type = ref None in
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InfoType"; "EnvironmentName"; "EnvironmentId" ]
    (fun tag _ ->
      match tag with
      | "InfoType" ->
          r_info_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InfoType"
                 (fun i _ -> environment_info_type_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     info_type = Smaws_Lib.Xml.Parse.required "InfoType" (( ! ) r_info_type) i;
     environment_name = ( ! ) r_environment_name;
     environment_id = ( ! ) r_environment_id;
   }
    : request_environment_info_message)

let regex_pattern_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let regex_label_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let refreshed_at_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let rebuild_environment_message_of_xml i =
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentName"; "EnvironmentId" ] (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ environment_name = ( ! ) r_environment_name; environment_id = ( ! ) r_environment_id }
    : rebuild_environment_message)

let queue_of_xml i =
  let r_ur_l = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "URL"; "Name" ] (fun tag _ ->
      match tag with
      | "URL" ->
          r_ur_l :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "URL" (fun i _ -> string__of_xml i) ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ ur_l = ( ! ) r_ur_l; name = ( ! ) r_name } : queue)

let queue_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> queue_of_xml i) ()

let platform_version_still_referenced_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : platform_version_still_referenced_exception)

let platform_version_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_owner_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let platform_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Deleted" -> Deleted
   | "Deleting" -> Deleting
   | "Ready" -> Ready
   | "Failed" -> Failed
   | "Creating" -> Creating
   | _ -> failwith "unknown enum value"
    : platform_status)

let platform_category_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let operating_system_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let operating_system_version_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_lifecycle_state_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let branch_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_branch_lifecycle_state_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let platform_summary_of_xml i =
  let r_platform_branch_lifecycle_state = ref None in
  let r_platform_branch_name = ref None in
  let r_platform_version = ref None in
  let r_platform_lifecycle_state = ref None in
  let r_supported_addon_list = ref None in
  let r_supported_tier_list = ref None in
  let r_operating_system_version = ref None in
  let r_operating_system_name = ref None in
  let r_platform_category = ref None in
  let r_platform_status = ref None in
  let r_platform_owner = ref None in
  let r_platform_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PlatformBranchLifecycleState";
      "PlatformBranchName";
      "PlatformVersion";
      "PlatformLifecycleState";
      "SupportedAddonList";
      "SupportedTierList";
      "OperatingSystemVersion";
      "OperatingSystemName";
      "PlatformCategory";
      "PlatformStatus";
      "PlatformOwner";
      "PlatformArn";
    ] (fun tag _ ->
      match tag with
      | "PlatformBranchLifecycleState" ->
          r_platform_branch_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformBranchLifecycleState"
                 (fun i _ -> platform_branch_lifecycle_state_of_xml i)
                 ())
      | "PlatformBranchName" ->
          r_platform_branch_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformBranchName"
                 (fun i _ -> branch_name_of_xml i)
                 ())
      | "PlatformVersion" ->
          r_platform_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformVersion"
                 (fun i _ -> platform_version_of_xml i)
                 ())
      | "PlatformLifecycleState" ->
          r_platform_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformLifecycleState"
                 (fun i _ -> platform_lifecycle_state_of_xml i)
                 ())
      | "SupportedAddonList" ->
          r_supported_addon_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedAddonList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> supported_addon_of_xml i)
                     ())
                 ())
      | "SupportedTierList" ->
          r_supported_tier_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedTierList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> supported_tier_of_xml i)
                     ())
                 ())
      | "OperatingSystemVersion" ->
          r_operating_system_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperatingSystemVersion"
                 (fun i _ -> operating_system_version_of_xml i)
                 ())
      | "OperatingSystemName" ->
          r_operating_system_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperatingSystemName"
                 (fun i _ -> operating_system_name_of_xml i)
                 ())
      | "PlatformCategory" ->
          r_platform_category :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformCategory"
                 (fun i _ -> platform_category_of_xml i)
                 ())
      | "PlatformStatus" ->
          r_platform_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformStatus"
                 (fun i _ -> platform_status_of_xml i)
                 ())
      | "PlatformOwner" ->
          r_platform_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformOwner"
                 (fun i _ -> platform_owner_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     platform_branch_lifecycle_state = ( ! ) r_platform_branch_lifecycle_state;
     platform_branch_name = ( ! ) r_platform_branch_name;
     platform_version = ( ! ) r_platform_version;
     platform_lifecycle_state = ( ! ) r_platform_lifecycle_state;
     supported_addon_list = ( ! ) r_supported_addon_list;
     supported_tier_list = ( ! ) r_supported_tier_list;
     operating_system_version = ( ! ) r_operating_system_version;
     operating_system_name = ( ! ) r_operating_system_name;
     platform_category = ( ! ) r_platform_category;
     platform_status = ( ! ) r_platform_status;
     platform_owner = ( ! ) r_platform_owner;
     platform_arn = ( ! ) r_platform_arn;
   }
    : platform_summary)

let platform_summary_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> platform_summary_of_xml i) ()

let platform_programming_language_of_xml i =
  let r_version = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Version"; "Name" ] (fun tag _ ->
      match tag with
      | "Version" ->
          r_version :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Version" (fun i _ -> string__of_xml i) ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ version = ( ! ) r_version; name = ( ! ) r_name } : platform_programming_language)

let platform_programming_languages_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> platform_programming_language_of_xml i)
    ()

let platform_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let platform_max_records_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let platform_framework_of_xml i =
  let r_version = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Version"; "Name" ] (fun tag _ ->
      match tag with
      | "Version" ->
          r_version :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Version" (fun i _ -> string__of_xml i) ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ version = ( ! ) r_version; name = ( ! ) r_name } : platform_framework)

let platform_frameworks_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> platform_framework_of_xml i) ()

let platform_filter_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_filter_operator_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_filter_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let platform_filter_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> platform_filter_value_of_xml i) ()

let platform_filter_of_xml i =
  let r_values = ref None in
  let r_operator = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values"; "Operator"; "Type" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_filter_value_of_xml i)
                     ())
                 ())
      | "Operator" ->
          r_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Operator"
                 (fun i _ -> platform_filter_operator_of_xml i)
                 ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> platform_filter_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ values = ( ! ) r_values; operator = ( ! ) r_operator; type_ = ( ! ) r_type_ }
    : platform_filter)

let platform_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> platform_filter_of_xml i) ()

let maintainer_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let image_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let custom_ami_of_xml i =
  let r_image_id = ref None in
  let r_virtualization_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ImageId"; "VirtualizationType" ] (fun tag _ ->
      match tag with
      | "ImageId" ->
          r_image_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId" (fun i _ -> image_id_of_xml i) ())
      | "VirtualizationType" ->
          r_virtualization_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VirtualizationType"
                 (fun i _ -> virtualization_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ image_id = ( ! ) r_image_id; virtualization_type = ( ! ) r_virtualization_type } : custom_ami)

let custom_ami_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> custom_ami_of_xml i) ()

let platform_description_of_xml i =
  let r_platform_branch_lifecycle_state = ref None in
  let r_platform_branch_name = ref None in
  let r_platform_lifecycle_state = ref None in
  let r_supported_addon_list = ref None in
  let r_supported_tier_list = ref None in
  let r_custom_ami_list = ref None in
  let r_frameworks = ref None in
  let r_programming_languages = ref None in
  let r_operating_system_version = ref None in
  let r_operating_system_name = ref None in
  let r_maintainer = ref None in
  let r_description = ref None in
  let r_platform_category = ref None in
  let r_date_updated = ref None in
  let r_date_created = ref None in
  let r_platform_status = ref None in
  let r_solution_stack_name = ref None in
  let r_platform_version = ref None in
  let r_platform_name = ref None in
  let r_platform_owner = ref None in
  let r_platform_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PlatformBranchLifecycleState";
      "PlatformBranchName";
      "PlatformLifecycleState";
      "SupportedAddonList";
      "SupportedTierList";
      "CustomAmiList";
      "Frameworks";
      "ProgrammingLanguages";
      "OperatingSystemVersion";
      "OperatingSystemName";
      "Maintainer";
      "Description";
      "PlatformCategory";
      "DateUpdated";
      "DateCreated";
      "PlatformStatus";
      "SolutionStackName";
      "PlatformVersion";
      "PlatformName";
      "PlatformOwner";
      "PlatformArn";
    ] (fun tag _ ->
      match tag with
      | "PlatformBranchLifecycleState" ->
          r_platform_branch_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformBranchLifecycleState"
                 (fun i _ -> platform_branch_lifecycle_state_of_xml i)
                 ())
      | "PlatformBranchName" ->
          r_platform_branch_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformBranchName"
                 (fun i _ -> branch_name_of_xml i)
                 ())
      | "PlatformLifecycleState" ->
          r_platform_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformLifecycleState"
                 (fun i _ -> platform_lifecycle_state_of_xml i)
                 ())
      | "SupportedAddonList" ->
          r_supported_addon_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedAddonList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> supported_addon_of_xml i)
                     ())
                 ())
      | "SupportedTierList" ->
          r_supported_tier_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedTierList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> supported_tier_of_xml i)
                     ())
                 ())
      | "CustomAmiList" ->
          r_custom_ami_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomAmiList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> custom_ami_of_xml i) ())
                 ())
      | "Frameworks" ->
          r_frameworks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Frameworks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_framework_of_xml i)
                     ())
                 ())
      | "ProgrammingLanguages" ->
          r_programming_languages :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgrammingLanguages"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_programming_language_of_xml i)
                     ())
                 ())
      | "OperatingSystemVersion" ->
          r_operating_system_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperatingSystemVersion"
                 (fun i _ -> operating_system_version_of_xml i)
                 ())
      | "OperatingSystemName" ->
          r_operating_system_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperatingSystemName"
                 (fun i _ -> operating_system_name_of_xml i)
                 ())
      | "Maintainer" ->
          r_maintainer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Maintainer" (fun i _ -> maintainer_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "PlatformCategory" ->
          r_platform_category :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformCategory"
                 (fun i _ -> platform_category_of_xml i)
                 ())
      | "DateUpdated" ->
          r_date_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateUpdated"
                 (fun i _ -> update_date_of_xml i)
                 ())
      | "DateCreated" ->
          r_date_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateCreated"
                 (fun i _ -> creation_date_of_xml i)
                 ())
      | "PlatformStatus" ->
          r_platform_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformStatus"
                 (fun i _ -> platform_status_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "PlatformVersion" ->
          r_platform_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformVersion"
                 (fun i _ -> platform_version_of_xml i)
                 ())
      | "PlatformName" ->
          r_platform_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformName"
                 (fun i _ -> platform_name_of_xml i)
                 ())
      | "PlatformOwner" ->
          r_platform_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformOwner"
                 (fun i _ -> platform_owner_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     platform_branch_lifecycle_state = ( ! ) r_platform_branch_lifecycle_state;
     platform_branch_name = ( ! ) r_platform_branch_name;
     platform_lifecycle_state = ( ! ) r_platform_lifecycle_state;
     supported_addon_list = ( ! ) r_supported_addon_list;
     supported_tier_list = ( ! ) r_supported_tier_list;
     custom_ami_list = ( ! ) r_custom_ami_list;
     frameworks = ( ! ) r_frameworks;
     programming_languages = ( ! ) r_programming_languages;
     operating_system_version = ( ! ) r_operating_system_version;
     operating_system_name = ( ! ) r_operating_system_name;
     maintainer = ( ! ) r_maintainer;
     description = ( ! ) r_description;
     platform_category = ( ! ) r_platform_category;
     date_updated = ( ! ) r_date_updated;
     date_created = ( ! ) r_date_created;
     platform_status = ( ! ) r_platform_status;
     solution_stack_name = ( ! ) r_solution_stack_name;
     platform_version = ( ! ) r_platform_version;
     platform_name = ( ! ) r_platform_name;
     platform_owner = ( ! ) r_platform_owner;
     platform_arn = ( ! ) r_platform_arn;
   }
    : platform_description)

let branch_order_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let platform_branch_summary_of_xml i =
  let r_supported_tier_list = ref None in
  let r_branch_order = ref None in
  let r_lifecycle_state = ref None in
  let r_branch_name = ref None in
  let r_platform_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SupportedTierList"; "BranchOrder"; "LifecycleState"; "BranchName"; "PlatformName" ]
    (fun tag _ ->
      match tag with
      | "SupportedTierList" ->
          r_supported_tier_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedTierList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> supported_tier_of_xml i)
                     ())
                 ())
      | "BranchOrder" ->
          r_branch_order :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BranchOrder"
                 (fun i _ -> branch_order_of_xml i)
                 ())
      | "LifecycleState" ->
          r_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleState"
                 (fun i _ -> platform_branch_lifecycle_state_of_xml i)
                 ())
      | "BranchName" ->
          r_branch_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BranchName"
                 (fun i _ -> branch_name_of_xml i)
                 ())
      | "PlatformName" ->
          r_platform_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformName"
                 (fun i _ -> platform_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     supported_tier_list = ( ! ) r_supported_tier_list;
     branch_order = ( ! ) r_branch_order;
     lifecycle_state = ( ! ) r_lifecycle_state;
     branch_name = ( ! ) r_branch_name;
     platform_name = ( ! ) r_platform_name;
   }
    : platform_branch_summary)

let platform_branch_summary_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> platform_branch_summary_of_xml i) ()

let platform_branch_max_records_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let option_restriction_regex_of_xml i =
  let r_label = ref None in
  let r_pattern = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Label"; "Pattern" ] (fun tag _ ->
      match tag with
      | "Label" ->
          r_label :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Label" (fun i _ -> regex_label_of_xml i) ())
      | "Pattern" ->
          r_pattern :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Pattern" (fun i _ -> regex_pattern_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ label = ( ! ) r_label; pattern = ( ! ) r_pattern } : option_restriction_regex)

let option_restriction_min_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let option_restriction_max_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let option_restriction_max_length_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let non_empty_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let next_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let max_records_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let action_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Unknown" -> Unknown
   | "PlatformUpdate" -> PlatformUpdate
   | "InstanceRefresh" -> InstanceRefresh
   | _ -> failwith "unknown enum value"
    : action_type)

let action_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Unknown" -> Unknown
   | "Running" -> Running
   | "Pending" -> Pending
   | "Scheduled" -> Scheduled
   | _ -> failwith "unknown enum value"
    : action_status)

let managed_action_of_xml i =
  let r_window_start_time = ref None in
  let r_status = ref None in
  let r_action_type = ref None in
  let r_action_description = ref None in
  let r_action_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "WindowStartTime"; "Status"; "ActionType"; "ActionDescription"; "ActionId" ] (fun tag _ ->
      match tag with
      | "WindowStartTime" ->
          r_window_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WindowStartTime"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> action_status_of_xml i) ())
      | "ActionType" ->
          r_action_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionType"
                 (fun i _ -> action_type_of_xml i)
                 ())
      | "ActionDescription" ->
          r_action_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ActionId" ->
          r_action_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ActionId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     window_start_time = ( ! ) r_window_start_time;
     status = ( ! ) r_status;
     action_type = ( ! ) r_action_type;
     action_description = ( ! ) r_action_description;
     action_id = ( ! ) r_action_id;
   }
    : managed_action)

let managed_actions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> managed_action_of_xml i) ()

let managed_action_invalid_state_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : managed_action_invalid_state_exception)

let managed_action_history_max_items_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let failure_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PermissionsError" -> PermissionsError
   | "InvalidEnvironmentState" -> InvalidEnvironmentState
   | "InternalFailure" -> InternalFailure
   | "RollbackSuccessful" -> RollbackSuccessful
   | "RollbackFailed" -> RollbackFailed
   | "CancellationFailed" -> CancellationFailed
   | "UpdateCancelled" -> UpdateCancelled
   | _ -> failwith "unknown enum value"
    : failure_type)

let action_history_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Unknown" -> Unknown
   | "Failed" -> Failed
   | "Completed" -> Completed
   | _ -> failwith "unknown enum value"
    : action_history_status)

let managed_action_history_item_of_xml i =
  let r_finished_time = ref None in
  let r_executed_time = ref None in
  let r_failure_description = ref None in
  let r_status = ref None in
  let r_failure_type = ref None in
  let r_action_description = ref None in
  let r_action_type = ref None in
  let r_action_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "FinishedTime";
      "ExecutedTime";
      "FailureDescription";
      "Status";
      "FailureType";
      "ActionDescription";
      "ActionType";
      "ActionId";
    ] (fun tag _ ->
      match tag with
      | "FinishedTime" ->
          r_finished_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinishedTime"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ExecutedTime" ->
          r_executed_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutedTime"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "FailureDescription" ->
          r_failure_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> action_history_status_of_xml i)
                 ())
      | "FailureType" ->
          r_failure_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureType"
                 (fun i _ -> failure_type_of_xml i)
                 ())
      | "ActionDescription" ->
          r_action_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ActionType" ->
          r_action_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionType"
                 (fun i _ -> action_type_of_xml i)
                 ())
      | "ActionId" ->
          r_action_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ActionId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     finished_time = ( ! ) r_finished_time;
     executed_time = ( ! ) r_executed_time;
     failure_description = ( ! ) r_failure_description;
     status = ( ! ) r_status;
     failure_type = ( ! ) r_failure_type;
     action_description = ( ! ) r_action_description;
     action_type = ( ! ) r_action_type;
     action_id = ( ! ) r_action_id;
   }
    : managed_action_history_item)

let managed_action_history_items_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> managed_action_history_item_of_xml i) ()

let load_balancer_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> resource_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name } : load_balancer)

let load_balancer_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_balancer_of_xml i) ()

let list_tags_for_resource_message_of_xml i =
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
    : list_tags_for_resource_message)

let list_platform_versions_result_of_xml i =
  let r_next_token = ref None in
  let r_platform_summary_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "PlatformSummaryList" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | "PlatformSummaryList" ->
          r_platform_summary_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformSummaryList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; platform_summary_list = ( ! ) r_platform_summary_list }
    : list_platform_versions_result)

let list_platform_versions_request_of_xml i =
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxRecords"; "Filters" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> platform_max_records_of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_filter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; max_records = ( ! ) r_max_records; filters = ( ! ) r_filters }
    : list_platform_versions_request)

let elastic_beanstalk_service_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : elastic_beanstalk_service_exception)

let list_platform_branches_result_of_xml i =
  let r_next_token = ref None in
  let r_platform_branch_summary_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "PlatformBranchSummaryList" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | "PlatformBranchSummaryList" ->
          r_platform_branch_summary_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformBranchSummaryList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_branch_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     platform_branch_summary_list = ( ! ) r_platform_branch_summary_list;
   }
    : list_platform_branches_result)

let list_platform_branches_request_of_xml i =
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_filters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "MaxRecords"; "Filters" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> platform_branch_max_records_of_xml i)
                 ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> search_filter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; max_records = ( ! ) r_max_records; filters = ( ! ) r_filters }
    : list_platform_branches_request)

let available_solution_stack_names_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> solution_stack_name_of_xml i) ()

let available_solution_stack_details_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> solution_stack_description_of_xml i) ()

let list_available_solution_stacks_result_message_of_xml i =
  let r_solution_stack_details = ref None in
  let r_solution_stacks = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SolutionStackDetails"; "SolutionStacks" ]
    (fun tag _ ->
      match tag with
      | "SolutionStackDetails" ->
          r_solution_stack_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackDetails"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> solution_stack_description_of_xml i)
                     ())
                 ())
      | "SolutionStacks" ->
          r_solution_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStacks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> solution_stack_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     solution_stack_details = ( ! ) r_solution_stack_details;
     solution_stacks = ( ! ) r_solution_stacks;
   }
    : list_available_solution_stacks_result_message)

let launch_template_of_xml i =
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Id" ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> resource_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ id = ( ! ) r_id } : launch_template)

let launch_template_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> launch_template_of_xml i) ()

let launch_configuration_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> resource_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name } : launch_configuration)

let launch_configuration_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> launch_configuration_of_xml i) ()

let invalid_request_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_request_exception)

let instances_health_attribute_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "All" -> All
   | "InstanceType" -> InstanceType
   | "AvailabilityZone" -> AvailabilityZone
   | "Deployment" -> Deployment
   | "System" -> System
   | "LaunchedAt" -> LaunchedAt
   | "RefreshedAt" -> RefreshedAt
   | "ApplicationMetrics" -> ApplicationMetrics
   | "Causes" -> Causes
   | "Color" -> Color
   | "HealthStatus" -> HealthStatus
   | _ -> failwith "unknown enum value"
    : instances_health_attribute)

let instances_health_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instances_health_attribute_of_xml i) ()

let instance_of_xml i =
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Id" ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> resource_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ id = ( ! ) r_id } : instance)

let instance_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ()

let instance_health_summary_of_xml i =
  let r_severe = ref None in
  let r_degraded = ref None in
  let r_warning = ref None in
  let r_info = ref None in
  let r_ok = ref None in
  let r_pending = ref None in
  let r_unknown = ref None in
  let r_no_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Severe"; "Degraded"; "Warning"; "Info"; "Ok"; "Pending"; "Unknown"; "NoData" ] (fun tag _ ->
      match tag with
      | "Severe" ->
          r_severe :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Severe"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Degraded" ->
          r_degraded :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Degraded"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Warning" ->
          r_warning :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Warning"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Info" ->
          r_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Info" (fun i _ -> nullable_integer_of_xml i) ())
      | "Ok" ->
          r_ok :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Ok" (fun i _ -> nullable_integer_of_xml i) ())
      | "Pending" ->
          r_pending :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Pending"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Unknown" ->
          r_unknown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Unknown"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "NoData" ->
          r_no_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NoData"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     severe = ( ! ) r_severe;
     degraded = ( ! ) r_degraded;
     warning = ( ! ) r_warning;
     info = ( ! ) r_info;
     ok = ( ! ) r_ok;
     pending = ( ! ) r_pending;
     unknown = ( ! ) r_unknown;
     no_data = ( ! ) r_no_data;
   }
    : instance_health_summary)

let instance_health_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> single_instance_health_of_xml i) ()

let include_deleted_back_to_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let include_deleted_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let event_severity_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "FATAL" -> FATAL
   | "ERROR" -> ERROR
   | "WARN" -> WARN
   | "INFO" -> INFO
   | "DEBUG" -> DEBUG
   | "TRACE" -> TRACE
   | _ -> failwith "unknown enum value"
    : event_severity)

let event_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let event_date_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let event_description_of_xml i =
  let r_severity = ref None in
  let r_request_id = ref None in
  let r_platform_arn = ref None in
  let r_environment_name = ref None in
  let r_template_name = ref None in
  let r_version_label = ref None in
  let r_application_name = ref None in
  let r_message = ref None in
  let r_event_date = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Severity";
      "RequestId";
      "PlatformArn";
      "EnvironmentName";
      "TemplateName";
      "VersionLabel";
      "ApplicationName";
      "Message";
      "EventDate";
    ] (fun tag _ ->
      match tag with
      | "Severity" ->
          r_severity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Severity"
                 (fun i _ -> event_severity_of_xml i)
                 ())
      | "RequestId" ->
          r_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestId" (fun i _ -> request_id_of_xml i) ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> event_message_of_xml i) ())
      | "EventDate" ->
          r_event_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDate" (fun i _ -> event_date_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     severity = ( ! ) r_severity;
     request_id = ( ! ) r_request_id;
     platform_arn = ( ! ) r_platform_arn;
     environment_name = ( ! ) r_environment_name;
     template_name = ( ! ) r_template_name;
     version_label = ( ! ) r_version_label;
     application_name = ( ! ) r_application_name;
     message = ( ! ) r_message;
     event_date = ( ! ) r_event_date;
   }
    : event_description)

let event_description_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> event_description_of_xml i) ()

let event_descriptions_message_of_xml i =
  let r_next_token = ref None in
  let r_events = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Events" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | "Events" ->
          r_events :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Events"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> event_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; events = ( ! ) r_events } : event_descriptions_message)

let auto_scaling_group_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> resource_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name } : auto_scaling_group)

let auto_scaling_group_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> auto_scaling_group_of_xml i) ()

let environment_resource_description_of_xml i =
  let r_queues = ref None in
  let r_triggers = ref None in
  let r_load_balancers = ref None in
  let r_launch_templates = ref None in
  let r_launch_configurations = ref None in
  let r_instances = ref None in
  let r_auto_scaling_groups = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Queues";
      "Triggers";
      "LoadBalancers";
      "LaunchTemplates";
      "LaunchConfigurations";
      "Instances";
      "AutoScalingGroups";
      "EnvironmentName";
    ] (fun tag _ ->
      match tag with
      | "Queues" ->
          r_queues :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Queues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> queue_of_xml i) ())
                 ())
      | "Triggers" ->
          r_triggers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Triggers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> trigger_of_xml i) ())
                 ())
      | "LoadBalancers" ->
          r_load_balancers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_of_xml i)
                     ())
                 ())
      | "LaunchTemplates" ->
          r_launch_templates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> launch_template_of_xml i)
                     ())
                 ())
      | "LaunchConfigurations" ->
          r_launch_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> launch_configuration_of_xml i)
                     ())
                 ())
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
                 ())
      | "AutoScalingGroups" ->
          r_auto_scaling_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoScalingGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> auto_scaling_group_of_xml i)
                     ())
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     queues = ( ! ) r_queues;
     triggers = ( ! ) r_triggers;
     load_balancers = ( ! ) r_load_balancers;
     launch_templates = ( ! ) r_launch_templates;
     launch_configurations = ( ! ) r_launch_configurations;
     instances = ( ! ) r_instances;
     auto_scaling_groups = ( ! ) r_auto_scaling_groups;
     environment_name = ( ! ) r_environment_name;
   }
    : environment_resource_description)

let environment_resource_descriptions_message_of_xml i =
  let r_environment_resources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentResources" ] (fun tag _ ->
      match tag with
      | "EnvironmentResources" ->
          r_environment_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentResources"
                 (fun i _ -> environment_resource_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ environment_resources = ( ! ) r_environment_resources }
    : environment_resource_descriptions_message)

let environment_names_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> environment_name_of_xml i) ()

let environment_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> environment_id_of_xml i) ()

let environment_health_attribute_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "RefreshedAt" -> RefreshedAt
   | "HealthStatus" -> HealthStatus
   | "All" -> All
   | "InstancesHealth" -> InstancesHealth
   | "ApplicationMetrics" -> ApplicationMetrics
   | "Causes" -> Causes
   | "Color" -> Color
   | "Status" -> Status
   | _ -> failwith "unknown enum value"
    : environment_health_attribute)

let environment_health_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> environment_health_attribute_of_xml i)
    ()

let environment_descriptions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> environment_description_of_xml i) ()

let environment_descriptions_message_of_xml i =
  let r_next_token = ref None in
  let r_environments = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Environments" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | "Environments" ->
          r_environments :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Environments"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> environment_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; environments = ( ! ) r_environments }
    : environment_descriptions_message)

let disassociate_environment_operations_role_message_of_xml i =
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentName" ] (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_name = Smaws_Lib.Xml.Parse.required "EnvironmentName" (( ! ) r_environment_name) i;
   }
    : disassociate_environment_operations_role_message)

let describe_platform_version_result_of_xml i =
  let r_platform_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PlatformDescription" ] (fun tag _ ->
      match tag with
      | "PlatformDescription" ->
          r_platform_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformDescription"
                 (fun i _ -> platform_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ platform_description = ( ! ) r_platform_description } : describe_platform_version_result)

let describe_platform_version_request_of_xml i =
  let r_platform_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PlatformArn" ] (fun tag _ ->
      match tag with
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ platform_arn = ( ! ) r_platform_arn } : describe_platform_version_request)

let describe_instances_health_result_of_xml i =
  let r_next_token = ref None in
  let r_refreshed_at = ref None in
  let r_instance_health_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "RefreshedAt"; "InstanceHealthList" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "RefreshedAt" ->
          r_refreshed_at :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RefreshedAt"
                 (fun i _ -> refreshed_at_of_xml i)
                 ())
      | "InstanceHealthList" ->
          r_instance_health_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceHealthList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> single_instance_health_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     refreshed_at = ( ! ) r_refreshed_at;
     instance_health_list = ( ! ) r_instance_health_list;
   }
    : describe_instances_health_result)

let describe_instances_health_request_of_xml i =
  let r_next_token = ref None in
  let r_attribute_names = ref None in
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NextToken"; "AttributeNames"; "EnvironmentId"; "EnvironmentName" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "AttributeNames" ->
          r_attribute_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instances_health_attribute_of_xml i)
                     ())
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     attribute_names = ( ! ) r_attribute_names;
     environment_id = ( ! ) r_environment_id;
     environment_name = ( ! ) r_environment_name;
   }
    : describe_instances_health_request)

let describe_events_message_of_xml i =
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_severity = ref None in
  let r_request_id = ref None in
  let r_platform_arn = ref None in
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  let r_template_name = ref None in
  let r_version_label = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NextToken";
      "MaxRecords";
      "EndTime";
      "StartTime";
      "Severity";
      "RequestId";
      "PlatformArn";
      "EnvironmentName";
      "EnvironmentId";
      "TemplateName";
      "VersionLabel";
      "ApplicationName";
    ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> time_filter_end_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> time_filter_start_of_xml i)
                 ())
      | "Severity" ->
          r_severity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Severity"
                 (fun i _ -> event_severity_of_xml i)
                 ())
      | "RequestId" ->
          r_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestId" (fun i _ -> request_id_of_xml i) ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     severity = ( ! ) r_severity;
     request_id = ( ! ) r_request_id;
     platform_arn = ( ! ) r_platform_arn;
     environment_name = ( ! ) r_environment_name;
     environment_id = ( ! ) r_environment_id;
     template_name = ( ! ) r_template_name;
     version_label = ( ! ) r_version_label;
     application_name = ( ! ) r_application_name;
   }
    : describe_events_message)

let describe_environments_message_of_xml i =
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_included_deleted_back_to = ref None in
  let r_include_deleted = ref None in
  let r_environment_names = ref None in
  let r_environment_ids = ref None in
  let r_version_label = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NextToken";
      "MaxRecords";
      "IncludedDeletedBackTo";
      "IncludeDeleted";
      "EnvironmentNames";
      "EnvironmentIds";
      "VersionLabel";
      "ApplicationName";
    ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "IncludedDeletedBackTo" ->
          r_included_deleted_back_to :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludedDeletedBackTo"
                 (fun i _ -> include_deleted_back_to_of_xml i)
                 ())
      | "IncludeDeleted" ->
          r_include_deleted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeDeleted"
                 (fun i _ -> include_deleted_of_xml i)
                 ())
      | "EnvironmentNames" ->
          r_environment_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> environment_name_of_xml i)
                     ())
                 ())
      | "EnvironmentIds" ->
          r_environment_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> environment_id_of_xml i)
                     ())
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
     included_deleted_back_to = ( ! ) r_included_deleted_back_to;
     include_deleted = ( ! ) r_include_deleted;
     environment_names = ( ! ) r_environment_names;
     environment_ids = ( ! ) r_environment_ids;
     version_label = ( ! ) r_version_label;
     application_name = ( ! ) r_application_name;
   }
    : describe_environments_message)

let describe_environment_resources_message_of_xml i =
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentName"; "EnvironmentId" ] (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ environment_name = ( ! ) r_environment_name; environment_id = ( ! ) r_environment_id }
    : describe_environment_resources_message)

let describe_environment_managed_actions_result_of_xml i =
  let r_managed_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ManagedActions" ] (fun tag _ ->
      match tag with
      | "ManagedActions" ->
          r_managed_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> managed_action_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ managed_actions = ( ! ) r_managed_actions } : describe_environment_managed_actions_result)

let describe_environment_managed_actions_request_of_xml i =
  let r_status = ref None in
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "EnvironmentId"; "EnvironmentName" ]
    (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> action_status_of_xml i) ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId" (fun i _ -> string__of_xml i) ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = ( ! ) r_status;
     environment_id = ( ! ) r_environment_id;
     environment_name = ( ! ) r_environment_name;
   }
    : describe_environment_managed_actions_request)

let describe_environment_managed_action_history_result_of_xml i =
  let r_next_token = ref None in
  let r_managed_action_history_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "ManagedActionHistoryItems" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | "ManagedActionHistoryItems" ->
          r_managed_action_history_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedActionHistoryItems"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> managed_action_history_item_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     managed_action_history_items = ( ! ) r_managed_action_history_items;
   }
    : describe_environment_managed_action_history_result)

let describe_environment_managed_action_history_request_of_xml i =
  let r_max_items = ref None in
  let r_next_token = ref None in
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxItems"; "NextToken"; "EnvironmentName"; "EnvironmentId" ] (fun tag _ ->
      match tag with
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> managed_action_history_max_items_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_items = ( ! ) r_max_items;
     next_token = ( ! ) r_next_token;
     environment_name = ( ! ) r_environment_name;
     environment_id = ( ! ) r_environment_id;
   }
    : describe_environment_managed_action_history_request)

let describe_environment_health_result_of_xml i =
  let r_refreshed_at = ref None in
  let r_instances_health = ref None in
  let r_application_metrics = ref None in
  let r_causes = ref None in
  let r_color = ref None in
  let r_status = ref None in
  let r_health_status = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RefreshedAt";
      "InstancesHealth";
      "ApplicationMetrics";
      "Causes";
      "Color";
      "Status";
      "HealthStatus";
      "EnvironmentName";
    ] (fun tag _ ->
      match tag with
      | "RefreshedAt" ->
          r_refreshed_at :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RefreshedAt"
                 (fun i _ -> refreshed_at_of_xml i)
                 ())
      | "InstancesHealth" ->
          r_instances_health :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesHealth"
                 (fun i _ -> instance_health_summary_of_xml i)
                 ())
      | "ApplicationMetrics" ->
          r_application_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationMetrics"
                 (fun i _ -> application_metrics_of_xml i)
                 ())
      | "Causes" ->
          r_causes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Causes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cause_of_xml i) ())
                 ())
      | "Color" ->
          r_color :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Color" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> environment_health_of_xml i)
                 ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus" (fun i _ -> string__of_xml i) ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     refreshed_at = ( ! ) r_refreshed_at;
     instances_health = ( ! ) r_instances_health;
     application_metrics = ( ! ) r_application_metrics;
     causes = ( ! ) r_causes;
     color = ( ! ) r_color;
     status = ( ! ) r_status;
     health_status = ( ! ) r_health_status;
     environment_name = ( ! ) r_environment_name;
   }
    : describe_environment_health_result)

let describe_environment_health_request_of_xml i =
  let r_attribute_names = ref None in
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AttributeNames"; "EnvironmentId"; "EnvironmentName" ] (fun tag _ ->
      match tag with
      | "AttributeNames" ->
          r_attribute_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> environment_health_attribute_of_xml i)
                     ())
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attribute_names = ( ! ) r_attribute_names;
     environment_id = ( ! ) r_environment_id;
     environment_name = ( ! ) r_environment_name;
   }
    : describe_environment_health_request)

let describe_configuration_settings_message_of_xml i =
  let r_environment_name = ref None in
  let r_template_name = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EnvironmentName"; "TemplateName"; "ApplicationName" ] (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_name = ( ! ) r_environment_name;
     template_name = ( ! ) r_template_name;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : describe_configuration_settings_message)

let configuration_settings_description_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> configuration_settings_description_of_xml i)
    ()

let configuration_settings_descriptions_of_xml i =
  let r_configuration_settings = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConfigurationSettings" ] (fun tag _ ->
      match tag with
      | "ConfigurationSettings" ->
          r_configuration_settings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSettings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_settings_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ configuration_settings = ( ! ) r_configuration_settings }
    : configuration_settings_descriptions)

let describe_configuration_options_message_of_xml i =
  let r_options = ref None in
  let r_platform_arn = ref None in
  let r_solution_stack_name = ref None in
  let r_environment_name = ref None in
  let r_template_name = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Options";
      "PlatformArn";
      "SolutionStackName";
      "EnvironmentName";
      "TemplateName";
      "ApplicationName";
    ] (fun tag _ ->
      match tag with
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> option_specification_of_xml i)
                     ())
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options = ( ! ) r_options;
     platform_arn = ( ! ) r_platform_arn;
     solution_stack_name = ( ! ) r_solution_stack_name;
     environment_name = ( ! ) r_environment_name;
     template_name = ( ! ) r_template_name;
     application_name = ( ! ) r_application_name;
   }
    : describe_configuration_options_message)

let configuration_option_default_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let configuration_option_severity_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let configuration_option_value_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "List" -> List | "Scalar" -> Scalar | _ -> failwith "unknown enum value"
    : configuration_option_value_type)

let configuration_option_possible_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let configuration_option_possible_values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> configuration_option_possible_value_of_xml i)
    ()

let configuration_option_description_of_xml i =
  let r_regex = ref None in
  let r_max_length = ref None in
  let r_max_value = ref None in
  let r_min_value = ref None in
  let r_value_options = ref None in
  let r_value_type = ref None in
  let r_user_defined = ref None in
  let r_change_severity = ref None in
  let r_default_value = ref None in
  let r_name = ref None in
  let r_namespace = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Regex";
      "MaxLength";
      "MaxValue";
      "MinValue";
      "ValueOptions";
      "ValueType";
      "UserDefined";
      "ChangeSeverity";
      "DefaultValue";
      "Name";
      "Namespace";
    ] (fun tag _ ->
      match tag with
      | "Regex" ->
          r_regex :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regex"
                 (fun i _ -> option_restriction_regex_of_xml i)
                 ())
      | "MaxLength" ->
          r_max_length :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxLength"
                 (fun i _ -> option_restriction_max_length_of_xml i)
                 ())
      | "MaxValue" ->
          r_max_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxValue"
                 (fun i _ -> option_restriction_max_value_of_xml i)
                 ())
      | "MinValue" ->
          r_min_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinValue"
                 (fun i _ -> option_restriction_min_value_of_xml i)
                 ())
      | "ValueOptions" ->
          r_value_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValueOptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_option_possible_value_of_xml i)
                     ())
                 ())
      | "ValueType" ->
          r_value_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValueType"
                 (fun i _ -> configuration_option_value_type_of_xml i)
                 ())
      | "UserDefined" ->
          r_user_defined :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserDefined"
                 (fun i _ -> user_defined_option_of_xml i)
                 ())
      | "ChangeSeverity" ->
          r_change_severity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSeverity"
                 (fun i _ -> configuration_option_severity_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> configuration_option_default_value_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> configuration_option_name_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> option_namespace_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     regex = ( ! ) r_regex;
     max_length = ( ! ) r_max_length;
     max_value = ( ! ) r_max_value;
     min_value = ( ! ) r_min_value;
     value_options = ( ! ) r_value_options;
     value_type = ( ! ) r_value_type;
     user_defined = ( ! ) r_user_defined;
     change_severity = ( ! ) r_change_severity;
     default_value = ( ! ) r_default_value;
     name = ( ! ) r_name;
     namespace = ( ! ) r_namespace;
   }
    : configuration_option_description)

let configuration_option_descriptions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> configuration_option_description_of_xml i)
    ()

let configuration_options_description_of_xml i =
  let r_options = ref None in
  let r_platform_arn = ref None in
  let r_solution_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Options"; "PlatformArn"; "SolutionStackName" ]
    (fun tag _ ->
      match tag with
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_option_description_of_xml i)
                     ())
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     options = ( ! ) r_options;
     platform_arn = ( ! ) r_platform_arn;
     solution_stack_name = ( ! ) r_solution_stack_name;
   }
    : configuration_options_description)

let application_names_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> application_name_of_xml i) ()

let describe_applications_message_of_xml i =
  let r_application_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationNames" ] (fun tag _ ->
      match tag with
      | "ApplicationNames" ->
          r_application_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> application_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ application_names = ( ! ) r_application_names } : describe_applications_message)

let application_description_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> application_description_of_xml i) ()

let application_descriptions_message_of_xml i =
  let r_applications = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Applications" ] (fun tag _ ->
      match tag with
      | "Applications" ->
          r_applications :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Applications"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> application_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ applications = ( ! ) r_applications } : application_descriptions_message)

let describe_application_versions_message_of_xml i =
  let r_next_token = ref None in
  let r_max_records = ref None in
  let r_version_labels = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NextToken"; "MaxRecords"; "VersionLabels"; "ApplicationName" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "VersionLabels" ->
          r_version_labels :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabels"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> version_label_of_xml i)
                     ())
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_records = ( ! ) r_max_records;
     version_labels = ( ! ) r_version_labels;
     application_name = ( ! ) r_application_name;
   }
    : describe_application_versions_message)

let application_version_description_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> application_version_description_of_xml i)
    ()

let application_version_descriptions_message_of_xml i =
  let r_next_token = ref None in
  let r_application_versions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "ApplicationVersions" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | "ApplicationVersions" ->
          r_application_versions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationVersions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> application_version_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; application_versions = ( ! ) r_application_versions }
    : application_version_descriptions_message)

let describe_account_attributes_result_of_xml i =
  let r_resource_quotas = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceQuotas" ] (fun tag _ ->
      match tag with
      | "ResourceQuotas" ->
          r_resource_quotas :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceQuotas"
                 (fun i _ -> resource_quotas_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_quotas = ( ! ) r_resource_quotas } : describe_account_attributes_result)

let delete_source_bundle_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let delete_platform_version_result_of_xml i =
  let r_platform_summary = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PlatformSummary" ] (fun tag _ ->
      match tag with
      | "PlatformSummary" ->
          r_platform_summary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformSummary"
                 (fun i _ -> platform_summary_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ platform_summary = ( ! ) r_platform_summary } : delete_platform_version_result)

let delete_platform_version_request_of_xml i =
  let r_platform_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PlatformArn" ] (fun tag _ ->
      match tag with
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ platform_arn = ( ! ) r_platform_arn } : delete_platform_version_request)

let delete_environment_configuration_message_of_xml i =
  let r_environment_name = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentName"; "ApplicationName" ]
    (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_name = Smaws_Lib.Xml.Parse.required "EnvironmentName" (( ! ) r_environment_name) i;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : delete_environment_configuration_message)

let delete_configuration_template_message_of_xml i =
  let r_template_name = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateName"; "ApplicationName" ] (fun tag _ ->
      match tag with
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : delete_configuration_template_message)

let delete_application_version_message_of_xml i =
  let r_delete_source_bundle = ref None in
  let r_version_label = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DeleteSourceBundle"; "VersionLabel"; "ApplicationName" ] (fun tag _ ->
      match tag with
      | "DeleteSourceBundle" ->
          r_delete_source_bundle :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeleteSourceBundle"
                 (fun i _ -> delete_source_bundle_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     delete_source_bundle = ( ! ) r_delete_source_bundle;
     version_label = Smaws_Lib.Xml.Parse.required "VersionLabel" (( ! ) r_version_label) i;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : delete_application_version_message)

let delete_application_message_of_xml i =
  let r_terminate_env_by_force = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TerminateEnvByForce"; "ApplicationName" ]
    (fun tag _ ->
      match tag with
      | "TerminateEnvByForce" ->
          r_terminate_env_by_force :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminateEnvByForce"
                 (fun i _ -> terminate_env_force_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     terminate_env_by_force = ( ! ) r_terminate_env_by_force;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : delete_application_message)

let dns_cname_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let create_storage_location_result_message_of_xml i =
  let r_s3_bucket = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "S3Bucket" ] (fun tag _ ->
      match tag with
      | "S3Bucket" ->
          r_s3_bucket :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "S3Bucket" (fun i _ -> s3_bucket_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ s3_bucket = ( ! ) r_s3_bucket } : create_storage_location_result_message)

let ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let builder_of_xml i =
  let r_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ARN" ] (fun tag _ ->
      match tag with
      | "ARN" ->
          r_ar_n := Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ ar_n = ( ! ) r_ar_n } : builder)

let create_platform_version_result_of_xml i =
  let r_builder = ref None in
  let r_platform_summary = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Builder"; "PlatformSummary" ] (fun tag _ ->
      match tag with
      | "Builder" ->
          r_builder :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Builder" (fun i _ -> builder_of_xml i) ())
      | "PlatformSummary" ->
          r_platform_summary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformSummary"
                 (fun i _ -> platform_summary_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ builder = ( ! ) r_builder; platform_summary = ( ! ) r_platform_summary }
    : create_platform_version_result)

let create_platform_version_request_of_xml i =
  let r_tags = ref None in
  let r_option_settings = ref None in
  let r_environment_name = ref None in
  let r_platform_definition_bundle = ref None in
  let r_platform_version = ref None in
  let r_platform_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "OptionSettings";
      "EnvironmentName";
      "PlatformDefinitionBundle";
      "PlatformVersion";
      "PlatformName";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "OptionSettings" ->
          r_option_settings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionSettings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_option_setting_of_xml i)
                     ())
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "PlatformDefinitionBundle" ->
          r_platform_definition_bundle :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformDefinitionBundle"
                 (fun i _ -> s3_location_of_xml i)
                 ())
      | "PlatformVersion" ->
          r_platform_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformVersion"
                 (fun i _ -> platform_version_of_xml i)
                 ())
      | "PlatformName" ->
          r_platform_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformName"
                 (fun i _ -> platform_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     option_settings = ( ! ) r_option_settings;
     environment_name = ( ! ) r_environment_name;
     platform_definition_bundle =
       Smaws_Lib.Xml.Parse.required "PlatformDefinitionBundle"
         (( ! ) r_platform_definition_bundle)
         i;
     platform_version = Smaws_Lib.Xml.Parse.required "PlatformVersion" (( ! ) r_platform_version) i;
     platform_name = Smaws_Lib.Xml.Parse.required "PlatformName" (( ! ) r_platform_name) i;
   }
    : create_platform_version_request)

let create_environment_message_of_xml i =
  let r_operations_role = ref None in
  let r_options_to_remove = ref None in
  let r_option_settings = ref None in
  let r_platform_arn = ref None in
  let r_solution_stack_name = ref None in
  let r_template_name = ref None in
  let r_version_label = ref None in
  let r_tags = ref None in
  let r_tier = ref None in
  let r_cname_prefix = ref None in
  let r_description = ref None in
  let r_group_name = ref None in
  let r_environment_name = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OperationsRole";
      "OptionsToRemove";
      "OptionSettings";
      "PlatformArn";
      "SolutionStackName";
      "TemplateName";
      "VersionLabel";
      "Tags";
      "Tier";
      "CNAMEPrefix";
      "Description";
      "GroupName";
      "EnvironmentName";
      "ApplicationName";
    ] (fun tag _ ->
      match tag with
      | "OperationsRole" ->
          r_operations_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationsRole"
                 (fun i _ -> operations_role_of_xml i)
                 ())
      | "OptionsToRemove" ->
          r_options_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> option_specification_of_xml i)
                     ())
                 ())
      | "OptionSettings" ->
          r_option_settings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionSettings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_option_setting_of_xml i)
                     ())
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Tier" ->
          r_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tier" (fun i _ -> environment_tier_of_xml i) ())
      | "CNAMEPrefix" ->
          r_cname_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CNAMEPrefix"
                 (fun i _ -> dns_cname_prefix_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName" (fun i _ -> group_name_of_xml i) ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     operations_role = ( ! ) r_operations_role;
     options_to_remove = ( ! ) r_options_to_remove;
     option_settings = ( ! ) r_option_settings;
     platform_arn = ( ! ) r_platform_arn;
     solution_stack_name = ( ! ) r_solution_stack_name;
     template_name = ( ! ) r_template_name;
     version_label = ( ! ) r_version_label;
     tags = ( ! ) r_tags;
     tier = ( ! ) r_tier;
     cname_prefix = ( ! ) r_cname_prefix;
     description = ( ! ) r_description;
     group_name = ( ! ) r_group_name;
     environment_name = ( ! ) r_environment_name;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : create_environment_message)

let create_configuration_template_message_of_xml i =
  let r_tags = ref None in
  let r_option_settings = ref None in
  let r_description = ref None in
  let r_environment_id = ref None in
  let r_source_configuration = ref None in
  let r_platform_arn = ref None in
  let r_solution_stack_name = ref None in
  let r_template_name = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "OptionSettings";
      "Description";
      "EnvironmentId";
      "SourceConfiguration";
      "PlatformArn";
      "SolutionStackName";
      "TemplateName";
      "ApplicationName";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "OptionSettings" ->
          r_option_settings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionSettings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_option_setting_of_xml i)
                     ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | "SourceConfiguration" ->
          r_source_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceConfiguration"
                 (fun i _ -> source_configuration_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     option_settings = ( ! ) r_option_settings;
     description = ( ! ) r_description;
     environment_id = ( ! ) r_environment_id;
     source_configuration = ( ! ) r_source_configuration;
     platform_arn = ( ! ) r_platform_arn;
     solution_stack_name = ( ! ) r_solution_stack_name;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : create_configuration_template_message)

let compute_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "BUILD_GENERAL1_LARGE" -> BUILD_GENERAL1_LARGE
   | "BUILD_GENERAL1_MEDIUM" -> BUILD_GENERAL1_MEDIUM
   | "BUILD_GENERAL1_SMALL" -> BUILD_GENERAL1_SMALL
   | _ -> failwith "unknown enum value"
    : compute_type)

let build_configuration_of_xml i =
  let r_timeout_in_minutes = ref None in
  let r_image = ref None in
  let r_compute_type = ref None in
  let r_code_build_service_role = ref None in
  let r_artifact_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TimeoutInMinutes"; "Image"; "ComputeType"; "CodeBuildServiceRole"; "ArtifactName" ]
    (fun tag _ ->
      match tag with
      | "TimeoutInMinutes" ->
          r_timeout_in_minutes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeoutInMinutes"
                 (fun i _ -> boxed_int_of_xml i)
                 ())
      | "Image" ->
          r_image :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Image"
                 (fun i _ -> non_empty_string_of_xml i)
                 ())
      | "ComputeType" ->
          r_compute_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComputeType"
                 (fun i _ -> compute_type_of_xml i)
                 ())
      | "CodeBuildServiceRole" ->
          r_code_build_service_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CodeBuildServiceRole"
                 (fun i _ -> non_empty_string_of_xml i)
                 ())
      | "ArtifactName" ->
          r_artifact_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ArtifactName" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timeout_in_minutes = ( ! ) r_timeout_in_minutes;
     image = Smaws_Lib.Xml.Parse.required "Image" (( ! ) r_image) i;
     compute_type = ( ! ) r_compute_type;
     code_build_service_role =
       Smaws_Lib.Xml.Parse.required "CodeBuildServiceRole" (( ! ) r_code_build_service_role) i;
     artifact_name = ( ! ) r_artifact_name;
   }
    : build_configuration)

let auto_create_application_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let application_version_proccess_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let create_application_version_message_of_xml i =
  let r_tags = ref None in
  let r_process = ref None in
  let r_auto_create_application = ref None in
  let r_build_configuration = ref None in
  let r_source_bundle = ref None in
  let r_source_build_information = ref None in
  let r_description = ref None in
  let r_version_label = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "Process";
      "AutoCreateApplication";
      "BuildConfiguration";
      "SourceBundle";
      "SourceBuildInformation";
      "Description";
      "VersionLabel";
      "ApplicationName";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Process" ->
          r_process :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Process"
                 (fun i _ -> application_version_proccess_of_xml i)
                 ())
      | "AutoCreateApplication" ->
          r_auto_create_application :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoCreateApplication"
                 (fun i _ -> auto_create_application_of_xml i)
                 ())
      | "BuildConfiguration" ->
          r_build_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BuildConfiguration"
                 (fun i _ -> build_configuration_of_xml i)
                 ())
      | "SourceBundle" ->
          r_source_bundle :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceBundle"
                 (fun i _ -> s3_location_of_xml i)
                 ())
      | "SourceBuildInformation" ->
          r_source_build_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceBuildInformation"
                 (fun i _ -> source_build_information_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     process = ( ! ) r_process;
     auto_create_application = ( ! ) r_auto_create_application;
     build_configuration = ( ! ) r_build_configuration;
     source_bundle = ( ! ) r_source_bundle;
     source_build_information = ( ! ) r_source_build_information;
     description = ( ! ) r_description;
     version_label = Smaws_Lib.Xml.Parse.required "VersionLabel" (( ! ) r_version_label) i;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : create_application_version_message)

let code_build_not_in_service_region_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "message"
                 (fun i _ -> exception_message_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : code_build_not_in_service_region_exception)

let create_application_message_of_xml i =
  let r_tags = ref None in
  let r_resource_lifecycle_config = ref None in
  let r_description = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Tags"; "ResourceLifecycleConfig"; "Description"; "ApplicationName" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ResourceLifecycleConfig" ->
          r_resource_lifecycle_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLifecycleConfig"
                 (fun i _ -> application_resource_lifecycle_config_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     resource_lifecycle_config = ( ! ) r_resource_lifecycle_config;
     description = ( ! ) r_description;
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
   }
    : create_application_message)

let compose_environments_message_of_xml i =
  let r_version_labels = ref None in
  let r_group_name = ref None in
  let r_application_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VersionLabels"; "GroupName"; "ApplicationName" ]
    (fun tag _ ->
      match tag with
      | "VersionLabels" ->
          r_version_labels :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabels"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> version_label_of_xml i)
                     ())
                 ())
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName" (fun i _ -> group_name_of_xml i) ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     version_labels = ( ! ) r_version_labels;
     group_name = ( ! ) r_group_name;
     application_name = ( ! ) r_application_name;
   }
    : compose_environments_message)

let cname_availability_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let check_dns_availability_result_message_of_xml i =
  let r_fully_qualified_cnam_e = ref None in
  let r_available = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "FullyQualifiedCNAME"; "Available" ] (fun tag _ ->
      match tag with
      | "FullyQualifiedCNAME" ->
          r_fully_qualified_cnam_e :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FullyQualifiedCNAME"
                 (fun i _ -> dns_cname_of_xml i)
                 ())
      | "Available" ->
          r_available :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Available"
                 (fun i _ -> cname_availability_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ fully_qualified_cnam_e = ( ! ) r_fully_qualified_cnam_e; available = ( ! ) r_available }
    : check_dns_availability_result_message)

let check_dns_availability_message_of_xml i =
  let r_cname_prefix = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CNAMEPrefix" ] (fun tag _ ->
      match tag with
      | "CNAMEPrefix" ->
          r_cname_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CNAMEPrefix"
                 (fun i _ -> dns_cname_prefix_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cname_prefix = Smaws_Lib.Xml.Parse.required "CNAMEPrefix" (( ! ) r_cname_prefix) i }
    : check_dns_availability_message)

let associate_environment_operations_role_message_of_xml i =
  let r_operations_role = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationsRole"; "EnvironmentName" ] (fun tag _ ->
      match tag with
      | "OperationsRole" ->
          r_operations_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationsRole"
                 (fun i _ -> operations_role_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     operations_role = Smaws_Lib.Xml.Parse.required "OperationsRole" (( ! ) r_operations_role) i;
     environment_name = Smaws_Lib.Xml.Parse.required "EnvironmentName" (( ! ) r_environment_name) i;
   }
    : associate_environment_operations_role_message)

let apply_environment_managed_action_result_of_xml i =
  let r_status = ref None in
  let r_action_type = ref None in
  let r_action_description = ref None in
  let r_action_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Status"; "ActionType"; "ActionDescription"; "ActionId" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "ActionType" ->
          r_action_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionType"
                 (fun i _ -> action_type_of_xml i)
                 ())
      | "ActionDescription" ->
          r_action_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ActionId" ->
          r_action_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ActionId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = ( ! ) r_status;
     action_type = ( ! ) r_action_type;
     action_description = ( ! ) r_action_description;
     action_id = ( ! ) r_action_id;
   }
    : apply_environment_managed_action_result)

let apply_environment_managed_action_request_of_xml i =
  let r_action_id = ref None in
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ActionId"; "EnvironmentId"; "EnvironmentName" ]
    (fun tag _ ->
      match tag with
      | "ActionId" ->
          r_action_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ActionId" (fun i _ -> string__of_xml i) ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId" (fun i _ -> string__of_xml i) ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     action_id = Smaws_Lib.Xml.Parse.required "ActionId" (( ! ) r_action_id) i;
     environment_id = ( ! ) r_environment_id;
     environment_name = ( ! ) r_environment_name;
   }
    : apply_environment_managed_action_request)

let abort_environment_update_message_of_xml i =
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentName"; "EnvironmentId" ] (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ environment_name = ( ! ) r_environment_name; environment_id = ( ! ) r_environment_id }
    : abort_environment_update_message)
