open Types

let unit_of_xml _ = ()
let ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
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

let configuration_option_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let option_namespace_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let validation_severity_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "error" -> Error_ | "warning" -> Warning | _ -> failwith "unknown enum value"
    : validation_severity)

let validation_message_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let validation_message_of_xml i =
  let r_message = ref None in
  let r_severity = ref None in
  let r_namespace = ref None in
  let r_option_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message"; "Severity"; "Namespace"; "OptionName" ]
    (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> validation_message_string_of_xml i)
                 ())
      | "Severity" ->
          r_severity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Severity"
                 (fun i _ -> validation_severity_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> option_namespace_of_xml i)
                 ())
      | "OptionName" ->
          r_option_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionName"
                 (fun i _ -> configuration_option_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message = ( ! ) r_message;
     severity = ( ! ) r_severity;
     namespace = ( ! ) r_namespace;
     option_name = ( ! ) r_option_name;
   }
    : validation_message)

let validation_messages_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> validation_message_of_xml i) ()

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

let configuration_option_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let configuration_option_setting_of_xml i =
  let r_resource_name = ref None in
  let r_namespace = ref None in
  let r_option_name = ref None in
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceName"; "Namespace"; "OptionName"; "Value" ] (fun tag _ ->
      match tag with
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> option_namespace_of_xml i)
                 ())
      | "OptionName" ->
          r_option_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionName"
                 (fun i _ -> configuration_option_name_of_xml i)
                 ())
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> configuration_option_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_name = ( ! ) r_resource_name;
     namespace = ( ! ) r_namespace;
     option_name = ( ! ) r_option_name;
     value = ( ! ) r_value;
   }
    : configuration_option_setting)

let configuration_option_settings_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> configuration_option_setting_of_xml i)
    ()

let environment_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let configuration_template_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let application_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let validate_configuration_settings_message_of_xml i =
  let r_application_name = ref None in
  let r_template_name = ref None in
  let r_environment_name = ref None in
  let r_option_settings = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ApplicationName"; "TemplateName"; "EnvironmentName"; "OptionSettings" ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     template_name = ( ! ) r_template_name;
     environment_name = ( ! ) r_environment_name;
     option_settings = Smaws_Lib.Xml.Parse.required "OptionSettings" (( ! ) r_option_settings) i;
   }
    : validate_configuration_settings_message)

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

let tag_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_key_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ()

let tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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
  ({ key = ( ! ) r_key; value = ( ! ) r_value } : tag)

let tag_list_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()
let resource_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_tags_for_resource_message_of_xml i =
  let r_resource_arn = ref None in
  let r_tags_to_add = ref None in
  let r_tags_to_remove = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArn"; "TagsToAdd"; "TagsToRemove" ]
    (fun tag _ ->
      match tag with
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn"
                 (fun i _ -> resource_arn_of_xml i)
                 ())
      | "TagsToAdd" ->
          r_tags_to_add :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagsToAdd"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "TagsToRemove" ->
          r_tags_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i;
     tags_to_add = ( ! ) r_tags_to_add;
     tags_to_remove = ( ! ) r_tags_to_remove;
   }
    : update_tags_for_resource_message)

let operations_role_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let environment_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let environment_link_of_xml i =
  let r_link_name = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LinkName"; "EnvironmentName" ] (fun tag _ ->
      match tag with
      | "LinkName" ->
          r_link_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "LinkName" (fun i _ -> string__of_xml i) ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ link_name = ( ! ) r_link_name; environment_name = ( ! ) r_environment_name }
    : environment_link)

let environment_links_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> environment_link_of_xml i) ()

let environment_tier_of_xml i =
  let r_name = ref None in
  let r_type_ = ref None in
  let r_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Type"; "Version" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> string__of_xml i) ())
      | "Version" ->
          r_version :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Version" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; type_ = ( ! ) r_type_; version = ( ! ) r_version } : environment_tier)

let integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let listener_of_xml i =
  let r_protocol = ref None in
  let r_port = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Protocol"; "Port" ] (fun tag _ ->
      match tag with
      | "Protocol" ->
          r_protocol :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Protocol" (fun i _ -> string__of_xml i) ())
      | "Port" ->
          r_port :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Port" (fun i _ -> integer_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ protocol = ( ! ) r_protocol; port = ( ! ) r_port } : listener)

let load_balancer_listeners_description_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_of_xml i) ()

let load_balancer_description_of_xml i =
  let r_load_balancer_name = ref None in
  let r_domain = ref None in
  let r_listeners = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerName"; "Domain"; "Listeners" ]
    (fun tag _ ->
      match tag with
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Domain" ->
          r_domain :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Domain" (fun i _ -> string__of_xml i) ())
      | "Listeners" ->
          r_listeners :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Listeners"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_name = ( ! ) r_load_balancer_name;
     domain = ( ! ) r_domain;
     listeners = ( ! ) r_listeners;
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

let environment_health_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "NoData" -> NoData
   | "Unknown" -> Unknown
   | "Pending" -> Pending
   | "Ok" -> Ok_
   | "Info" -> Info
   | "Warning" -> Warning
   | "Degraded" -> Degraded
   | "Severe" -> Severe
   | "Suspended" -> Suspended
   | _ -> failwith "unknown enum value"
    : environment_health_status)

let environment_health_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Green" -> Green
   | "Yellow" -> Yellow
   | "Red" -> Red
   | "Grey" -> Grey
   | _ -> failwith "unknown enum value"
    : environment_health)

let abortable_operation_in_progress_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let environment_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Aborting" -> Aborting
   | "Launching" -> Launching
   | "Updating" -> Updating
   | "LinkingFrom" -> LinkingFrom
   | "LinkingTo" -> LinkingTo
   | "Ready" -> Ready
   | "Terminating" -> Terminating
   | "Terminated" -> Terminated
   | _ -> failwith "unknown enum value"
    : environment_status)

let update_date_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let creation_date_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let dns_cname_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let endpoint_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let solution_stack_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let version_label_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let environment_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let environment_description_of_xml i =
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  let r_application_name = ref None in
  let r_version_label = ref None in
  let r_solution_stack_name = ref None in
  let r_platform_arn = ref None in
  let r_template_name = ref None in
  let r_description = ref None in
  let r_endpoint_ur_l = ref None in
  let r_cnam_e = ref None in
  let r_date_created = ref None in
  let r_date_updated = ref None in
  let r_status = ref None in
  let r_abortable_operation_in_progress = ref None in
  let r_health = ref None in
  let r_health_status = ref None in
  let r_resources = ref None in
  let r_tier = ref None in
  let r_environment_links = ref None in
  let r_environment_arn = ref None in
  let r_operations_role = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EnvironmentName";
      "EnvironmentId";
      "ApplicationName";
      "VersionLabel";
      "SolutionStackName";
      "PlatformArn";
      "TemplateName";
      "Description";
      "EndpointURL";
      "CNAME";
      "DateCreated";
      "DateUpdated";
      "Status";
      "AbortableOperationInProgress";
      "Health";
      "HealthStatus";
      "Resources";
      "Tier";
      "EnvironmentLinks";
      "EnvironmentArn";
      "OperationsRole";
    ] (fun tag _ ->
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
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "EndpointURL" ->
          r_endpoint_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointURL"
                 (fun i _ -> endpoint_ur_l_of_xml i)
                 ())
      | "CNAME" ->
          r_cnam_e :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CNAME" (fun i _ -> dns_cname_of_xml i) ())
      | "DateCreated" ->
          r_date_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateCreated"
                 (fun i _ -> creation_date_of_xml i)
                 ())
      | "DateUpdated" ->
          r_date_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateUpdated"
                 (fun i _ -> update_date_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> environment_status_of_xml i)
                 ())
      | "AbortableOperationInProgress" ->
          r_abortable_operation_in_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AbortableOperationInProgress"
                 (fun i _ -> abortable_operation_in_progress_of_xml i)
                 ())
      | "Health" ->
          r_health :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Health"
                 (fun i _ -> environment_health_of_xml i)
                 ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus"
                 (fun i _ -> environment_health_status_of_xml i)
                 ())
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ -> environment_resources_description_of_xml i)
                 ())
      | "Tier" ->
          r_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tier" (fun i _ -> environment_tier_of_xml i) ())
      | "EnvironmentLinks" ->
          r_environment_links :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentLinks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> environment_link_of_xml i)
                     ())
                 ())
      | "EnvironmentArn" ->
          r_environment_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentArn"
                 (fun i _ -> environment_arn_of_xml i)
                 ())
      | "OperationsRole" ->
          r_operations_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationsRole"
                 (fun i _ -> operations_role_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_name = ( ! ) r_environment_name;
     environment_id = ( ! ) r_environment_id;
     application_name = ( ! ) r_application_name;
     version_label = ( ! ) r_version_label;
     solution_stack_name = ( ! ) r_solution_stack_name;
     platform_arn = ( ! ) r_platform_arn;
     template_name = ( ! ) r_template_name;
     description = ( ! ) r_description;
     endpoint_ur_l = ( ! ) r_endpoint_ur_l;
     cnam_e = ( ! ) r_cnam_e;
     date_created = ( ! ) r_date_created;
     date_updated = ( ! ) r_date_updated;
     status = ( ! ) r_status;
     abortable_operation_in_progress = ( ! ) r_abortable_operation_in_progress;
     health = ( ! ) r_health;
     health_status = ( ! ) r_health_status;
     resources = ( ! ) r_resources;
     tier = ( ! ) r_tier;
     environment_links = ( ! ) r_environment_links;
     environment_arn = ( ! ) r_environment_arn;
     operations_role = ( ! ) r_operations_role;
   }
    : environment_description)

let option_specification_of_xml i =
  let r_resource_name = ref None in
  let r_namespace = ref None in
  let r_option_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceName"; "Namespace"; "OptionName" ]
    (fun tag _ ->
      match tag with
      | "ResourceName" ->
          r_resource_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceName"
                 (fun i _ -> resource_name_of_xml i)
                 ())
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> option_namespace_of_xml i)
                 ())
      | "OptionName" ->
          r_option_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionName"
                 (fun i _ -> configuration_option_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_name = ( ! ) r_resource_name;
     namespace = ( ! ) r_namespace;
     option_name = ( ! ) r_option_name;
   }
    : option_specification)

let options_specifier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> option_specification_of_xml i) ()

let group_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_environment_message_of_xml i =
  let r_application_name = ref None in
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  let r_group_name = ref None in
  let r_description = ref None in
  let r_tier = ref None in
  let r_version_label = ref None in
  let r_template_name = ref None in
  let r_solution_stack_name = ref None in
  let r_platform_arn = ref None in
  let r_option_settings = ref None in
  let r_options_to_remove = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ApplicationName";
      "EnvironmentId";
      "EnvironmentName";
      "GroupName";
      "Description";
      "Tier";
      "VersionLabel";
      "TemplateName";
      "SolutionStackName";
      "PlatformArn";
      "OptionSettings";
      "OptionsToRemove";
    ] (fun tag _ ->
      match tag with
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
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName" (fun i _ -> group_name_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Tier" ->
          r_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tier" (fun i _ -> environment_tier_of_xml i) ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
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
      | "OptionsToRemove" ->
          r_options_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> option_specification_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = ( ! ) r_application_name;
     environment_id = ( ! ) r_environment_id;
     environment_name = ( ! ) r_environment_name;
     group_name = ( ! ) r_group_name;
     description = ( ! ) r_description;
     tier = ( ! ) r_tier;
     version_label = ( ! ) r_version_label;
     template_name = ( ! ) r_template_name;
     solution_stack_name = ( ! ) r_solution_stack_name;
     platform_arn = ( ! ) r_platform_arn;
     option_settings = ( ! ) r_option_settings;
     options_to_remove = ( ! ) r_options_to_remove;
   }
    : update_environment_message)

let configuration_deployment_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "deployed" -> Deployed
   | "pending" -> Pending
   | "failed" -> Failed
   | _ -> failwith "unknown enum value"
    : configuration_deployment_status)

let configuration_settings_description_of_xml i =
  let r_solution_stack_name = ref None in
  let r_platform_arn = ref None in
  let r_application_name = ref None in
  let r_template_name = ref None in
  let r_description = ref None in
  let r_environment_name = ref None in
  let r_deployment_status = ref None in
  let r_date_created = ref None in
  let r_date_updated = ref None in
  let r_option_settings = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SolutionStackName";
      "PlatformArn";
      "ApplicationName";
      "TemplateName";
      "Description";
      "EnvironmentName";
      "DeploymentStatus";
      "DateCreated";
      "DateUpdated";
      "OptionSettings";
    ] (fun tag _ ->
      match tag with
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "DeploymentStatus" ->
          r_deployment_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentStatus"
                 (fun i _ -> configuration_deployment_status_of_xml i)
                 ())
      | "DateCreated" ->
          r_date_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateCreated"
                 (fun i _ -> creation_date_of_xml i)
                 ())
      | "DateUpdated" ->
          r_date_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateUpdated"
                 (fun i _ -> update_date_of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     solution_stack_name = ( ! ) r_solution_stack_name;
     platform_arn = ( ! ) r_platform_arn;
     application_name = ( ! ) r_application_name;
     template_name = ( ! ) r_template_name;
     description = ( ! ) r_description;
     environment_name = ( ! ) r_environment_name;
     deployment_status = ( ! ) r_deployment_status;
     date_created = ( ! ) r_date_created;
     date_updated = ( ! ) r_date_updated;
     option_settings = ( ! ) r_option_settings;
   }
    : configuration_settings_description)

let update_configuration_template_message_of_xml i =
  let r_application_name = ref None in
  let r_template_name = ref None in
  let r_description = ref None in
  let r_option_settings = ref None in
  let r_options_to_remove = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ApplicationName"; "TemplateName"; "Description"; "OptionSettings"; "OptionsToRemove" ]
    (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
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
      | "OptionsToRemove" ->
          r_options_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> option_specification_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     description = ( ! ) r_description;
     option_settings = ( ! ) r_option_settings;
     options_to_remove = ( ! ) r_options_to_remove;
   }
    : update_configuration_template_message)

let application_version_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Processed" -> Processed
   | "Unprocessed" -> Unprocessed
   | "Failed" -> Failed
   | "Processing" -> Processing
   | "Building" -> Building
   | _ -> failwith "unknown enum value"
    : application_version_status)

let s3_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let s3_bucket_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let s3_location_of_xml i =
  let r_s3_bucket = ref None in
  let r_s3_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "S3Bucket"; "S3Key" ] (fun tag _ ->
      match tag with
      | "S3Bucket" ->
          r_s3_bucket :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "S3Bucket" (fun i _ -> s3_bucket_of_xml i) ())
      | "S3Key" ->
          r_s3_key :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "S3Key" (fun i _ -> s3_key_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ s3_bucket = ( ! ) r_s3_bucket; s3_key = ( ! ) r_s3_key } : s3_location)

let source_location_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let source_repository_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "CodeCommit" -> CodeCommit | "S3" -> S3 | _ -> failwith "unknown enum value"
    : source_repository)

let source_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Git" -> Git | "Zip" -> Zip | _ -> failwith "unknown enum value" : source_type)

let source_build_information_of_xml i =
  let r_source_type = ref None in
  let r_source_repository = ref None in
  let r_source_location = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SourceType"; "SourceRepository"; "SourceLocation" ] (fun tag _ ->
      match tag with
      | "SourceType" ->
          r_source_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceType"
                 (fun i _ -> source_type_of_xml i)
                 ())
      | "SourceRepository" ->
          r_source_repository :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceRepository"
                 (fun i _ -> source_repository_of_xml i)
                 ())
      | "SourceLocation" ->
          r_source_location :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceLocation"
                 (fun i _ -> source_location_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_type = Smaws_Lib.Xml.Parse.required "SourceType" (( ! ) r_source_type) i;
     source_repository =
       Smaws_Lib.Xml.Parse.required "SourceRepository" (( ! ) r_source_repository) i;
     source_location = Smaws_Lib.Xml.Parse.required "SourceLocation" (( ! ) r_source_location) i;
   }
    : source_build_information)

let application_version_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let application_version_description_of_xml i =
  let r_application_version_arn = ref None in
  let r_application_name = ref None in
  let r_description = ref None in
  let r_version_label = ref None in
  let r_source_build_information = ref None in
  let r_build_arn = ref None in
  let r_source_bundle = ref None in
  let r_date_created = ref None in
  let r_date_updated = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ApplicationVersionArn";
      "ApplicationName";
      "Description";
      "VersionLabel";
      "SourceBuildInformation";
      "BuildArn";
      "SourceBundle";
      "DateCreated";
      "DateUpdated";
      "Status";
    ] (fun tag _ ->
      match tag with
      | "ApplicationVersionArn" ->
          r_application_version_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationVersionArn"
                 (fun i _ -> application_version_arn_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
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
      | "SourceBuildInformation" ->
          r_source_build_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceBuildInformation"
                 (fun i _ -> source_build_information_of_xml i)
                 ())
      | "BuildArn" ->
          r_build_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "BuildArn" (fun i _ -> string__of_xml i) ())
      | "SourceBundle" ->
          r_source_bundle :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceBundle"
                 (fun i _ -> s3_location_of_xml i)
                 ())
      | "DateCreated" ->
          r_date_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateCreated"
                 (fun i _ -> creation_date_of_xml i)
                 ())
      | "DateUpdated" ->
          r_date_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateUpdated"
                 (fun i _ -> update_date_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> application_version_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_version_arn = ( ! ) r_application_version_arn;
     application_name = ( ! ) r_application_name;
     description = ( ! ) r_description;
     version_label = ( ! ) r_version_label;
     source_build_information = ( ! ) r_source_build_information;
     build_arn = ( ! ) r_build_arn;
     source_bundle = ( ! ) r_source_bundle;
     date_created = ( ! ) r_date_created;
     date_updated = ( ! ) r_date_updated;
     status = ( ! ) r_status;
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

let update_application_version_message_of_xml i =
  let r_application_name = ref None in
  let r_version_label = ref None in
  let r_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationName"; "VersionLabel"; "Description" ]
    (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     version_label = Smaws_Lib.Xml.Parse.required "VersionLabel" (( ! ) r_version_label) i;
     description = ( ! ) r_description;
   }
    : update_application_version_message)

let boxed_boolean_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let boxed_int_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_age_rule_of_xml i =
  let r_enabled = ref None in
  let r_max_age_in_days = ref None in
  let r_delete_source_from_s3 = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled"; "MaxAgeInDays"; "DeleteSourceFromS3" ]
    (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> boxed_boolean_of_xml i) ())
      | "MaxAgeInDays" ->
          r_max_age_in_days :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxAgeInDays"
                 (fun i _ -> boxed_int_of_xml i)
                 ())
      | "DeleteSourceFromS3" ->
          r_delete_source_from_s3 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeleteSourceFromS3"
                 (fun i _ -> boxed_boolean_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
     max_age_in_days = ( ! ) r_max_age_in_days;
     delete_source_from_s3 = ( ! ) r_delete_source_from_s3;
   }
    : max_age_rule)

let max_count_rule_of_xml i =
  let r_enabled = ref None in
  let r_max_count = ref None in
  let r_delete_source_from_s3 = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled"; "MaxCount"; "DeleteSourceFromS3" ]
    (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled" (fun i _ -> boxed_boolean_of_xml i) ())
      | "MaxCount" ->
          r_max_count :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCount" (fun i _ -> boxed_int_of_xml i) ())
      | "DeleteSourceFromS3" ->
          r_delete_source_from_s3 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeleteSourceFromS3"
                 (fun i _ -> boxed_boolean_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
     max_count = ( ! ) r_max_count;
     delete_source_from_s3 = ( ! ) r_delete_source_from_s3;
   }
    : max_count_rule)

let application_version_lifecycle_config_of_xml i =
  let r_max_count_rule = ref None in
  let r_max_age_rule = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxCountRule"; "MaxAgeRule" ] (fun tag _ ->
      match tag with
      | "MaxCountRule" ->
          r_max_count_rule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxCountRule"
                 (fun i _ -> max_count_rule_of_xml i)
                 ())
      | "MaxAgeRule" ->
          r_max_age_rule :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxAgeRule"
                 (fun i _ -> max_age_rule_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_count_rule = ( ! ) r_max_count_rule; max_age_rule = ( ! ) r_max_age_rule }
    : application_version_lifecycle_config)

let application_resource_lifecycle_config_of_xml i =
  let r_service_role = ref None in
  let r_version_lifecycle_config = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ServiceRole"; "VersionLifecycleConfig" ]
    (fun tag _ ->
      match tag with
      | "ServiceRole" ->
          r_service_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ServiceRole" (fun i _ -> string__of_xml i) ())
      | "VersionLifecycleConfig" ->
          r_version_lifecycle_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLifecycleConfig"
                 (fun i _ -> application_version_lifecycle_config_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     service_role = ( ! ) r_service_role;
     version_lifecycle_config = ( ! ) r_version_lifecycle_config;
   }
    : application_resource_lifecycle_config)

let application_resource_lifecycle_description_message_of_xml i =
  let r_application_name = ref None in
  let r_resource_lifecycle_config = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationName"; "ResourceLifecycleConfig" ]
    (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "ResourceLifecycleConfig" ->
          r_resource_lifecycle_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLifecycleConfig"
                 (fun i _ -> application_resource_lifecycle_config_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = ( ! ) r_application_name;
     resource_lifecycle_config = ( ! ) r_resource_lifecycle_config;
   }
    : application_resource_lifecycle_description_message)

let update_application_resource_lifecycle_message_of_xml i =
  let r_application_name = ref None in
  let r_resource_lifecycle_config = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationName"; "ResourceLifecycleConfig" ]
    (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "ResourceLifecycleConfig" ->
          r_resource_lifecycle_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLifecycleConfig"
                 (fun i _ -> application_resource_lifecycle_config_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     resource_lifecycle_config =
       Smaws_Lib.Xml.Parse.required "ResourceLifecycleConfig" (( ! ) r_resource_lifecycle_config) i;
   }
    : update_application_resource_lifecycle_message)

let configuration_template_names_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> configuration_template_name_of_xml i) ()

let version_labels_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> version_label_of_xml i) ()

let application_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let application_description_of_xml i =
  let r_application_arn = ref None in
  let r_application_name = ref None in
  let r_description = ref None in
  let r_date_created = ref None in
  let r_date_updated = ref None in
  let r_versions = ref None in
  let r_configuration_templates = ref None in
  let r_resource_lifecycle_config = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ApplicationArn";
      "ApplicationName";
      "Description";
      "DateCreated";
      "DateUpdated";
      "Versions";
      "ConfigurationTemplates";
      "ResourceLifecycleConfig";
    ] (fun tag _ ->
      match tag with
      | "ApplicationArn" ->
          r_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationArn"
                 (fun i _ -> application_arn_of_xml i)
                 ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "DateCreated" ->
          r_date_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateCreated"
                 (fun i _ -> creation_date_of_xml i)
                 ())
      | "DateUpdated" ->
          r_date_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateUpdated"
                 (fun i _ -> update_date_of_xml i)
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
      | "ConfigurationTemplates" ->
          r_configuration_templates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationTemplates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_template_name_of_xml i)
                     ())
                 ())
      | "ResourceLifecycleConfig" ->
          r_resource_lifecycle_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLifecycleConfig"
                 (fun i _ -> application_resource_lifecycle_config_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_arn = ( ! ) r_application_arn;
     application_name = ( ! ) r_application_name;
     description = ( ! ) r_description;
     date_created = ( ! ) r_date_created;
     date_updated = ( ! ) r_date_updated;
     versions = ( ! ) r_versions;
     configuration_templates = ( ! ) r_configuration_templates;
     resource_lifecycle_config = ( ! ) r_resource_lifecycle_config;
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

let update_application_message_of_xml i =
  let r_application_name = ref None in
  let r_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationName"; "Description" ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     description = ( ! ) r_description;
   }
    : update_application_message)

let force_terminate_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let terminate_environment_resources_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let terminate_environment_message_of_xml i =
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  let r_terminate_resources = ref None in
  let r_force_terminate = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EnvironmentId"; "EnvironmentName"; "TerminateResources"; "ForceTerminate" ] (fun tag _ ->
      match tag with
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
      | "TerminateResources" ->
          r_terminate_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminateResources"
                 (fun i _ -> terminate_environment_resources_of_xml i)
                 ())
      | "ForceTerminate" ->
          r_force_terminate :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ForceTerminate"
                 (fun i _ -> force_terminate_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_id = ( ! ) r_environment_id;
     environment_name = ( ! ) r_environment_name;
     terminate_resources = ( ! ) r_terminate_resources;
     force_terminate = ( ! ) r_force_terminate;
   }
    : terminate_environment_message)

let swap_environment_cnam_es_message_of_xml i =
  let r_source_environment_id = ref None in
  let r_source_environment_name = ref None in
  let r_destination_environment_id = ref None in
  let r_destination_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SourceEnvironmentId";
      "SourceEnvironmentName";
      "DestinationEnvironmentId";
      "DestinationEnvironmentName";
    ] (fun tag _ ->
      match tag with
      | "SourceEnvironmentId" ->
          r_source_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceEnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | "SourceEnvironmentName" ->
          r_source_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceEnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "DestinationEnvironmentId" ->
          r_destination_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationEnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | "DestinationEnvironmentName" ->
          r_destination_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DestinationEnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     source_environment_id = ( ! ) r_source_environment_id;
     source_environment_name = ( ! ) r_source_environment_name;
     destination_environment_id = ( ! ) r_destination_environment_id;
     destination_environment_name = ( ! ) r_destination_environment_name;
   }
    : swap_environment_cnam_es_message)

let message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let sample_timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let ec2_instance_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let environment_info_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "tail" -> Tail
   | "bundle" -> Bundle
   | "analyze" -> Analyze
   | _ -> failwith "unknown enum value"
    : environment_info_type)

let environment_info_description_of_xml i =
  let r_info_type = ref None in
  let r_ec2_instance_id = ref None in
  let r_sample_timestamp = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "InfoType"; "Ec2InstanceId"; "SampleTimestamp"; "Message" ] (fun tag _ ->
      match tag with
      | "InfoType" ->
          r_info_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InfoType"
                 (fun i _ -> environment_info_type_of_xml i)
                 ())
      | "Ec2InstanceId" ->
          r_ec2_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Ec2InstanceId"
                 (fun i _ -> ec2_instance_id_of_xml i)
                 ())
      | "SampleTimestamp" ->
          r_sample_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SampleTimestamp"
                 (fun i _ -> sample_timestamp_of_xml i)
                 ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> message_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     info_type = ( ! ) r_info_type;
     ec2_instance_id = ( ! ) r_ec2_instance_id;
     sample_timestamp = ( ! ) r_sample_timestamp;
     message = ( ! ) r_message;
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
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  let r_info_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentId"; "EnvironmentName"; "InfoType" ]
    (fun tag _ ->
      match tag with
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
      | "InfoType" ->
          r_info_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InfoType"
                 (fun i _ -> environment_info_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_id = ( ! ) r_environment_id;
     environment_name = ( ! ) r_environment_name;
     info_type = Smaws_Lib.Xml.Parse.required "InfoType" (( ! ) r_info_type) i;
   }
    : retrieve_environment_info_message)

let restart_app_server_message_of_xml i =
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentId"; "EnvironmentName" ] (fun tag _ ->
      match tag with
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
  ({ environment_id = ( ! ) r_environment_id; environment_name = ( ! ) r_environment_name }
    : restart_app_server_message)

let request_environment_info_message_of_xml i =
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  let r_info_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentId"; "EnvironmentName"; "InfoType" ]
    (fun tag _ ->
      match tag with
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
      | "InfoType" ->
          r_info_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InfoType"
                 (fun i _ -> environment_info_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_id = ( ! ) r_environment_id;
     environment_name = ( ! ) r_environment_name;
     info_type = Smaws_Lib.Xml.Parse.required "InfoType" (( ! ) r_info_type) i;
   }
    : request_environment_info_message)

let rebuild_environment_message_of_xml i =
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentId"; "EnvironmentName" ] (fun tag _ ->
      match tag with
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
  ({ environment_id = ( ! ) r_environment_id; environment_name = ( ! ) r_environment_name }
    : rebuild_environment_message)

let resource_tags_description_message_of_xml i =
  let r_resource_arn = ref None in
  let r_resource_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArn"; "ResourceTags" ] (fun tag _ ->
      match tag with
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn"
                 (fun i _ -> resource_arn_of_xml i)
                 ())
      | "ResourceTags" ->
          r_resource_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_arn = ( ! ) r_resource_arn; resource_tags = ( ! ) r_resource_tags }
    : resource_tags_description_message)

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

let token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_branch_lifecycle_state_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let branch_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_version_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_lifecycle_state_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let supported_addon_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let supported_addon_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> supported_addon_of_xml i) ()

let supported_tier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let supported_tier_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> supported_tier_of_xml i) ()

let operating_system_version_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let operating_system_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_category_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let platform_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Creating" -> Creating
   | "Failed" -> Failed
   | "Ready" -> Ready
   | "Deleting" -> Deleting
   | "Deleted" -> Deleted
   | _ -> failwith "unknown enum value"
    : platform_status)

let platform_owner_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let platform_summary_of_xml i =
  let r_platform_arn = ref None in
  let r_platform_owner = ref None in
  let r_platform_status = ref None in
  let r_platform_category = ref None in
  let r_operating_system_name = ref None in
  let r_operating_system_version = ref None in
  let r_supported_tier_list = ref None in
  let r_supported_addon_list = ref None in
  let r_platform_lifecycle_state = ref None in
  let r_platform_version = ref None in
  let r_platform_branch_name = ref None in
  let r_platform_branch_lifecycle_state = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PlatformArn";
      "PlatformOwner";
      "PlatformStatus";
      "PlatformCategory";
      "OperatingSystemName";
      "OperatingSystemVersion";
      "SupportedTierList";
      "SupportedAddonList";
      "PlatformLifecycleState";
      "PlatformVersion";
      "PlatformBranchName";
      "PlatformBranchLifecycleState";
    ] (fun tag _ ->
      match tag with
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "PlatformOwner" ->
          r_platform_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformOwner"
                 (fun i _ -> platform_owner_of_xml i)
                 ())
      | "PlatformStatus" ->
          r_platform_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformStatus"
                 (fun i _ -> platform_status_of_xml i)
                 ())
      | "PlatformCategory" ->
          r_platform_category :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformCategory"
                 (fun i _ -> platform_category_of_xml i)
                 ())
      | "OperatingSystemName" ->
          r_operating_system_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperatingSystemName"
                 (fun i _ -> operating_system_name_of_xml i)
                 ())
      | "OperatingSystemVersion" ->
          r_operating_system_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperatingSystemVersion"
                 (fun i _ -> operating_system_version_of_xml i)
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
      | "SupportedAddonList" ->
          r_supported_addon_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedAddonList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> supported_addon_of_xml i)
                     ())
                 ())
      | "PlatformLifecycleState" ->
          r_platform_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformLifecycleState"
                 (fun i _ -> platform_lifecycle_state_of_xml i)
                 ())
      | "PlatformVersion" ->
          r_platform_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformVersion"
                 (fun i _ -> platform_version_of_xml i)
                 ())
      | "PlatformBranchName" ->
          r_platform_branch_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformBranchName"
                 (fun i _ -> branch_name_of_xml i)
                 ())
      | "PlatformBranchLifecycleState" ->
          r_platform_branch_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformBranchLifecycleState"
                 (fun i _ -> platform_branch_lifecycle_state_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     platform_arn = ( ! ) r_platform_arn;
     platform_owner = ( ! ) r_platform_owner;
     platform_status = ( ! ) r_platform_status;
     platform_category = ( ! ) r_platform_category;
     operating_system_name = ( ! ) r_operating_system_name;
     operating_system_version = ( ! ) r_operating_system_version;
     supported_tier_list = ( ! ) r_supported_tier_list;
     supported_addon_list = ( ! ) r_supported_addon_list;
     platform_lifecycle_state = ( ! ) r_platform_lifecycle_state;
     platform_version = ( ! ) r_platform_version;
     platform_branch_name = ( ! ) r_platform_branch_name;
     platform_branch_lifecycle_state = ( ! ) r_platform_branch_lifecycle_state;
   }
    : platform_summary)

let platform_summary_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> platform_summary_of_xml i) ()

let list_platform_versions_result_of_xml i =
  let r_platform_summary_list = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PlatformSummaryList"; "NextToken" ] (fun tag _ ->
      match tag with
      | "PlatformSummaryList" ->
          r_platform_summary_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformSummaryList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ platform_summary_list = ( ! ) r_platform_summary_list; next_token = ( ! ) r_next_token }
    : list_platform_versions_result)

let platform_max_records_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let platform_filter_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let platform_filter_value_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> platform_filter_value_of_xml i) ()

let platform_filter_operator_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let platform_filter_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let platform_filter_of_xml i =
  let r_type_ = ref None in
  let r_operator = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Type"; "Operator"; "Values" ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type"
                 (fun i _ -> platform_filter_type_of_xml i)
                 ())
      | "Operator" ->
          r_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Operator"
                 (fun i _ -> platform_filter_operator_of_xml i)
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_filter_value_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ type_ = ( ! ) r_type_; operator = ( ! ) r_operator; values = ( ! ) r_values }
    : platform_filter)

let platform_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> platform_filter_of_xml i) ()

let list_platform_versions_request_of_xml i =
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Filters"; "MaxRecords"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_filter_of_xml i)
                     ())
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> platform_max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ filters = ( ! ) r_filters; max_records = ( ! ) r_max_records; next_token = ( ! ) r_next_token }
    : list_platform_versions_request)

let branch_order_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let platform_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let platform_branch_summary_of_xml i =
  let r_platform_name = ref None in
  let r_branch_name = ref None in
  let r_lifecycle_state = ref None in
  let r_branch_order = ref None in
  let r_supported_tier_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PlatformName"; "BranchName"; "LifecycleState"; "BranchOrder"; "SupportedTierList" ]
    (fun tag _ ->
      match tag with
      | "PlatformName" ->
          r_platform_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformName"
                 (fun i _ -> platform_name_of_xml i)
                 ())
      | "BranchName" ->
          r_branch_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BranchName"
                 (fun i _ -> branch_name_of_xml i)
                 ())
      | "LifecycleState" ->
          r_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LifecycleState"
                 (fun i _ -> platform_branch_lifecycle_state_of_xml i)
                 ())
      | "BranchOrder" ->
          r_branch_order :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BranchOrder"
                 (fun i _ -> branch_order_of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     platform_name = ( ! ) r_platform_name;
     branch_name = ( ! ) r_branch_name;
     lifecycle_state = ( ! ) r_lifecycle_state;
     branch_order = ( ! ) r_branch_order;
     supported_tier_list = ( ! ) r_supported_tier_list;
   }
    : platform_branch_summary)

let platform_branch_summary_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> platform_branch_summary_of_xml i) ()

let list_platform_branches_result_of_xml i =
  let r_platform_branch_summary_list = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PlatformBranchSummaryList"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "PlatformBranchSummaryList" ->
          r_platform_branch_summary_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformBranchSummaryList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_branch_summary_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     platform_branch_summary_list = ( ! ) r_platform_branch_summary_list;
     next_token = ( ! ) r_next_token;
   }
    : list_platform_branches_result)

let platform_branch_max_records_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let search_filter_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let search_filter_values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> search_filter_value_of_xml i) ()

let search_filter_operator_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let search_filter_attribute_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let search_filter_of_xml i =
  let r_attribute = ref None in
  let r_operator = ref None in
  let r_values = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attribute"; "Operator"; "Values" ] (fun tag _ ->
      match tag with
      | "Attribute" ->
          r_attribute :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attribute"
                 (fun i _ -> search_filter_attribute_of_xml i)
                 ())
      | "Operator" ->
          r_operator :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Operator"
                 (fun i _ -> search_filter_operator_of_xml i)
                 ())
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> search_filter_value_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attribute = ( ! ) r_attribute; operator = ( ! ) r_operator; values = ( ! ) r_values }
    : search_filter)

let search_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> search_filter_of_xml i) ()

let list_platform_branches_request_of_xml i =
  let r_filters = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Filters"; "MaxRecords"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> search_filter_of_xml i)
                     ())
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> platform_branch_max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ filters = ( ! ) r_filters; max_records = ( ! ) r_max_records; next_token = ( ! ) r_next_token }
    : list_platform_branches_request)

let file_type_extension_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let solution_stack_file_type_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> file_type_extension_of_xml i) ()

let solution_stack_description_of_xml i =
  let r_solution_stack_name = ref None in
  let r_permitted_file_types = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SolutionStackName"; "PermittedFileTypes" ]
    (fun tag _ ->
      match tag with
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "PermittedFileTypes" ->
          r_permitted_file_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PermittedFileTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> file_type_extension_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     solution_stack_name = ( ! ) r_solution_stack_name;
     permitted_file_types = ( ! ) r_permitted_file_types;
   }
    : solution_stack_description)

let available_solution_stack_details_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> solution_stack_description_of_xml i) ()

let available_solution_stack_names_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> solution_stack_name_of_xml i) ()

let list_available_solution_stacks_result_message_of_xml i =
  let r_solution_stacks = ref None in
  let r_solution_stack_details = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SolutionStacks"; "SolutionStackDetails" ]
    (fun tag _ ->
      match tag with
      | "SolutionStacks" ->
          r_solution_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStacks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> solution_stack_name_of_xml i)
                     ())
                 ())
      | "SolutionStackDetails" ->
          r_solution_stack_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackDetails"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> solution_stack_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     solution_stacks = ( ! ) r_solution_stacks;
     solution_stack_details = ( ! ) r_solution_stack_details;
   }
    : list_available_solution_stacks_result_message)

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

let image_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let virtualization_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let custom_ami_of_xml i =
  let r_virtualization_type = ref None in
  let r_image_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VirtualizationType"; "ImageId" ] (fun tag _ ->
      match tag with
      | "VirtualizationType" ->
          r_virtualization_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VirtualizationType"
                 (fun i _ -> virtualization_type_of_xml i)
                 ())
      | "ImageId" ->
          r_image_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ImageId" (fun i _ -> image_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ virtualization_type = ( ! ) r_virtualization_type; image_id = ( ! ) r_image_id } : custom_ami)

let custom_ami_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> custom_ami_of_xml i) ()

let platform_framework_of_xml i =
  let r_name = ref None in
  let r_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Version" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | "Version" ->
          r_version :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Version" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; version = ( ! ) r_version } : platform_framework)

let platform_frameworks_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> platform_framework_of_xml i) ()

let platform_programming_language_of_xml i =
  let r_name = ref None in
  let r_version = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "Version" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | "Version" ->
          r_version :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Version" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; version = ( ! ) r_version } : platform_programming_language)

let platform_programming_languages_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> platform_programming_language_of_xml i)
    ()

let maintainer_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let platform_description_of_xml i =
  let r_platform_arn = ref None in
  let r_platform_owner = ref None in
  let r_platform_name = ref None in
  let r_platform_version = ref None in
  let r_solution_stack_name = ref None in
  let r_platform_status = ref None in
  let r_date_created = ref None in
  let r_date_updated = ref None in
  let r_platform_category = ref None in
  let r_description = ref None in
  let r_maintainer = ref None in
  let r_operating_system_name = ref None in
  let r_operating_system_version = ref None in
  let r_programming_languages = ref None in
  let r_frameworks = ref None in
  let r_custom_ami_list = ref None in
  let r_supported_tier_list = ref None in
  let r_supported_addon_list = ref None in
  let r_platform_lifecycle_state = ref None in
  let r_platform_branch_name = ref None in
  let r_platform_branch_lifecycle_state = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PlatformArn";
      "PlatformOwner";
      "PlatformName";
      "PlatformVersion";
      "SolutionStackName";
      "PlatformStatus";
      "DateCreated";
      "DateUpdated";
      "PlatformCategory";
      "Description";
      "Maintainer";
      "OperatingSystemName";
      "OperatingSystemVersion";
      "ProgrammingLanguages";
      "Frameworks";
      "CustomAmiList";
      "SupportedTierList";
      "SupportedAddonList";
      "PlatformLifecycleState";
      "PlatformBranchName";
      "PlatformBranchLifecycleState";
    ] (fun tag _ ->
      match tag with
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "PlatformOwner" ->
          r_platform_owner :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformOwner"
                 (fun i _ -> platform_owner_of_xml i)
                 ())
      | "PlatformName" ->
          r_platform_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformName"
                 (fun i _ -> platform_name_of_xml i)
                 ())
      | "PlatformVersion" ->
          r_platform_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformVersion"
                 (fun i _ -> platform_version_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "PlatformStatus" ->
          r_platform_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformStatus"
                 (fun i _ -> platform_status_of_xml i)
                 ())
      | "DateCreated" ->
          r_date_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateCreated"
                 (fun i _ -> creation_date_of_xml i)
                 ())
      | "DateUpdated" ->
          r_date_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DateUpdated"
                 (fun i _ -> update_date_of_xml i)
                 ())
      | "PlatformCategory" ->
          r_platform_category :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformCategory"
                 (fun i _ -> platform_category_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "Maintainer" ->
          r_maintainer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Maintainer" (fun i _ -> maintainer_of_xml i) ())
      | "OperatingSystemName" ->
          r_operating_system_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperatingSystemName"
                 (fun i _ -> operating_system_name_of_xml i)
                 ())
      | "OperatingSystemVersion" ->
          r_operating_system_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperatingSystemVersion"
                 (fun i _ -> operating_system_version_of_xml i)
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
      | "Frameworks" ->
          r_frameworks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Frameworks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_framework_of_xml i)
                     ())
                 ())
      | "CustomAmiList" ->
          r_custom_ami_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomAmiList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> custom_ami_of_xml i) ())
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
      | "SupportedAddonList" ->
          r_supported_addon_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedAddonList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> supported_addon_of_xml i)
                     ())
                 ())
      | "PlatformLifecycleState" ->
          r_platform_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformLifecycleState"
                 (fun i _ -> platform_lifecycle_state_of_xml i)
                 ())
      | "PlatformBranchName" ->
          r_platform_branch_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformBranchName"
                 (fun i _ -> branch_name_of_xml i)
                 ())
      | "PlatformBranchLifecycleState" ->
          r_platform_branch_lifecycle_state :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformBranchLifecycleState"
                 (fun i _ -> platform_branch_lifecycle_state_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     platform_arn = ( ! ) r_platform_arn;
     platform_owner = ( ! ) r_platform_owner;
     platform_name = ( ! ) r_platform_name;
     platform_version = ( ! ) r_platform_version;
     solution_stack_name = ( ! ) r_solution_stack_name;
     platform_status = ( ! ) r_platform_status;
     date_created = ( ! ) r_date_created;
     date_updated = ( ! ) r_date_updated;
     platform_category = ( ! ) r_platform_category;
     description = ( ! ) r_description;
     maintainer = ( ! ) r_maintainer;
     operating_system_name = ( ! ) r_operating_system_name;
     operating_system_version = ( ! ) r_operating_system_version;
     programming_languages = ( ! ) r_programming_languages;
     frameworks = ( ! ) r_frameworks;
     custom_ami_list = ( ! ) r_custom_ami_list;
     supported_tier_list = ( ! ) r_supported_tier_list;
     supported_addon_list = ( ! ) r_supported_addon_list;
     platform_lifecycle_state = ( ! ) r_platform_lifecycle_state;
     platform_branch_name = ( ! ) r_platform_branch_name;
     platform_branch_lifecycle_state = ( ! ) r_platform_branch_lifecycle_state;
   }
    : platform_description)

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

let next_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let refreshed_at_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let deployment_timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let nullable_long_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let deployment_of_xml i =
  let r_version_label = ref None in
  let r_deployment_id = ref None in
  let r_status = ref None in
  let r_deployment_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "VersionLabel"; "DeploymentId"; "Status"; "DeploymentTime" ] (fun tag _ ->
      match tag with
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel" (fun i _ -> string__of_xml i) ())
      | "DeploymentId" ->
          r_deployment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentId"
                 (fun i _ -> nullable_long_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "DeploymentTime" ->
          r_deployment_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTime"
                 (fun i _ -> deployment_timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     version_label = ( ! ) r_version_label;
     deployment_id = ( ! ) r_deployment_id;
     status = ( ! ) r_status;
     deployment_time = ( ! ) r_deployment_time;
   }
    : deployment)

let load_average_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let load_average_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_average_value_of_xml i) ()

let nullable_double_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let cpu_utilization_of_xml i =
  let r_user = ref None in
  let r_nice = ref None in
  let r_system = ref None in
  let r_idle = ref None in
  let r_io_wait = ref None in
  let r_ir_q = ref None in
  let r_soft_ir_q = ref None in
  let r_privileged = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "User"; "Nice"; "System"; "Idle"; "IOWait"; "IRQ"; "SoftIRQ"; "Privileged" ] (fun tag _ ->
      match tag with
      | "User" ->
          r_user :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "User" (fun i _ -> nullable_double_of_xml i) ())
      | "Nice" ->
          r_nice :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Nice" (fun i _ -> nullable_double_of_xml i) ())
      | "System" ->
          r_system :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "System"
                 (fun i _ -> nullable_double_of_xml i)
                 ())
      | "Idle" ->
          r_idle :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Idle" (fun i _ -> nullable_double_of_xml i) ())
      | "IOWait" ->
          r_io_wait :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IOWait"
                 (fun i _ -> nullable_double_of_xml i)
                 ())
      | "IRQ" ->
          r_ir_q :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IRQ" (fun i _ -> nullable_double_of_xml i) ())
      | "SoftIRQ" ->
          r_soft_ir_q :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SoftIRQ"
                 (fun i _ -> nullable_double_of_xml i)
                 ())
      | "Privileged" ->
          r_privileged :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Privileged"
                 (fun i _ -> nullable_double_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     user = ( ! ) r_user;
     nice = ( ! ) r_nice;
     system = ( ! ) r_system;
     idle = ( ! ) r_idle;
     io_wait = ( ! ) r_io_wait;
     ir_q = ( ! ) r_ir_q;
     soft_ir_q = ( ! ) r_soft_ir_q;
     privileged = ( ! ) r_privileged;
   }
    : cpu_utilization)

let system_status_of_xml i =
  let r_cpu_utilization = ref None in
  let r_load_average = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CPUUtilization"; "LoadAverage" ] (fun tag _ ->
      match tag with
      | "CPUUtilization" ->
          r_cpu_utilization :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CPUUtilization"
                 (fun i _ -> cpu_utilization_of_xml i)
                 ())
      | "LoadAverage" ->
          r_load_average :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadAverage"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_average_value_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cpu_utilization = ( ! ) r_cpu_utilization; load_average = ( ! ) r_load_average }
    : system_status)

let latency_of_xml i =
  let r_p999 = ref None in
  let r_p99 = ref None in
  let r_p95 = ref None in
  let r_p90 = ref None in
  let r_p85 = ref None in
  let r_p75 = ref None in
  let r_p50 = ref None in
  let r_p10 = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "P999"; "P99"; "P95"; "P90"; "P85"; "P75"; "P50"; "P10" ] (fun tag _ ->
      match tag with
      | "P999" ->
          r_p999 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P999" (fun i _ -> nullable_double_of_xml i) ())
      | "P99" ->
          r_p99 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P99" (fun i _ -> nullable_double_of_xml i) ())
      | "P95" ->
          r_p95 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P95" (fun i _ -> nullable_double_of_xml i) ())
      | "P90" ->
          r_p90 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P90" (fun i _ -> nullable_double_of_xml i) ())
      | "P85" ->
          r_p85 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P85" (fun i _ -> nullable_double_of_xml i) ())
      | "P75" ->
          r_p75 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P75" (fun i _ -> nullable_double_of_xml i) ())
      | "P50" ->
          r_p50 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P50" (fun i _ -> nullable_double_of_xml i) ())
      | "P10" ->
          r_p10 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "P10" (fun i _ -> nullable_double_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     p999 = ( ! ) r_p999;
     p99 = ( ! ) r_p99;
     p95 = ( ! ) r_p95;
     p90 = ( ! ) r_p90;
     p85 = ( ! ) r_p85;
     p75 = ( ! ) r_p75;
     p50 = ( ! ) r_p50;
     p10 = ( ! ) r_p10;
   }
    : latency)

let nullable_integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let status_codes_of_xml i =
  let r_status2xx = ref None in
  let r_status3xx = ref None in
  let r_status4xx = ref None in
  let r_status5xx = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Status2xx"; "Status3xx"; "Status4xx"; "Status5xx" ] (fun tag _ ->
      match tag with
      | "Status2xx" ->
          r_status2xx :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status2xx"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Status3xx" ->
          r_status3xx :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status3xx"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Status4xx" ->
          r_status4xx :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status4xx"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Status5xx" ->
          r_status5xx :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status5xx"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status2xx = ( ! ) r_status2xx;
     status3xx = ( ! ) r_status3xx;
     status4xx = ( ! ) r_status4xx;
     status5xx = ( ! ) r_status5xx;
   }
    : status_codes)

let request_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let application_metrics_of_xml i =
  let r_duration = ref None in
  let r_request_count = ref None in
  let r_status_codes = ref None in
  let r_latency = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Duration"; "RequestCount"; "StatusCodes"; "Latency" ] (fun tag _ ->
      match tag with
      | "Duration" ->
          r_duration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Duration"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "RequestCount" ->
          r_request_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestCount"
                 (fun i _ -> request_count_of_xml i)
                 ())
      | "StatusCodes" ->
          r_status_codes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusCodes"
                 (fun i _ -> status_codes_of_xml i)
                 ())
      | "Latency" ->
          r_latency :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Latency" (fun i _ -> latency_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     duration = ( ! ) r_duration;
     request_count = ( ! ) r_request_count;
     status_codes = ( ! ) r_status_codes;
     latency = ( ! ) r_latency;
   }
    : application_metrics)

let launched_at_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let cause_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let causes_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cause_of_xml i) ()
let instance_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let single_instance_health_of_xml i =
  let r_instance_id = ref None in
  let r_health_status = ref None in
  let r_color = ref None in
  let r_causes = ref None in
  let r_launched_at = ref None in
  let r_application_metrics = ref None in
  let r_system = ref None in
  let r_deployment = ref None in
  let r_availability_zone = ref None in
  let r_instance_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "InstanceId";
      "HealthStatus";
      "Color";
      "Causes";
      "LaunchedAt";
      "ApplicationMetrics";
      "System";
      "Deployment";
      "AvailabilityZone";
      "InstanceType";
    ] (fun tag _ ->
      match tag with
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> instance_id_of_xml i)
                 ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus" (fun i _ -> string__of_xml i) ())
      | "Color" ->
          r_color :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Color" (fun i _ -> string__of_xml i) ())
      | "Causes" ->
          r_causes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Causes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cause_of_xml i) ())
                 ())
      | "LaunchedAt" ->
          r_launched_at :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchedAt"
                 (fun i _ -> launched_at_of_xml i)
                 ())
      | "ApplicationMetrics" ->
          r_application_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationMetrics"
                 (fun i _ -> application_metrics_of_xml i)
                 ())
      | "System" ->
          r_system :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "System" (fun i _ -> system_status_of_xml i) ())
      | "Deployment" ->
          r_deployment :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Deployment" (fun i _ -> deployment_of_xml i) ())
      | "AvailabilityZone" ->
          r_availability_zone :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZone"
                 (fun i _ -> string__of_xml i)
                 ())
      | "InstanceType" ->
          r_instance_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_id = ( ! ) r_instance_id;
     health_status = ( ! ) r_health_status;
     color = ( ! ) r_color;
     causes = ( ! ) r_causes;
     launched_at = ( ! ) r_launched_at;
     application_metrics = ( ! ) r_application_metrics;
     system = ( ! ) r_system;
     deployment = ( ! ) r_deployment;
     availability_zone = ( ! ) r_availability_zone;
     instance_type = ( ! ) r_instance_type;
   }
    : single_instance_health)

let instance_health_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> single_instance_health_of_xml i) ()

let describe_instances_health_result_of_xml i =
  let r_instance_health_list = ref None in
  let r_refreshed_at = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceHealthList"; "RefreshedAt"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "InstanceHealthList" ->
          r_instance_health_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceHealthList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> single_instance_health_of_xml i)
                     ())
                 ())
      | "RefreshedAt" ->
          r_refreshed_at :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RefreshedAt"
                 (fun i _ -> refreshed_at_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instance_health_list = ( ! ) r_instance_health_list;
     refreshed_at = ( ! ) r_refreshed_at;
     next_token = ( ! ) r_next_token;
   }
    : describe_instances_health_result)

let instances_health_attribute_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "HealthStatus" -> HealthStatus
   | "Color" -> Color
   | "Causes" -> Causes
   | "ApplicationMetrics" -> ApplicationMetrics
   | "RefreshedAt" -> RefreshedAt
   | "LaunchedAt" -> LaunchedAt
   | "System" -> System
   | "Deployment" -> Deployment
   | "AvailabilityZone" -> AvailabilityZone
   | "InstanceType" -> InstanceType
   | "All" -> All
   | _ -> failwith "unknown enum value"
    : instances_health_attribute)

let instances_health_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instances_health_attribute_of_xml i) ()

let describe_instances_health_request_of_xml i =
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  let r_attribute_names = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EnvironmentName"; "EnvironmentId"; "AttributeNames"; "NextToken" ] (fun tag _ ->
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
      | "AttributeNames" ->
          r_attribute_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instances_health_attribute_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_name = ( ! ) r_environment_name;
     environment_id = ( ! ) r_environment_id;
     attribute_names = ( ! ) r_attribute_names;
     next_token = ( ! ) r_next_token;
   }
    : describe_instances_health_request)

let event_severity_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "TRACE" -> TRACE
   | "DEBUG" -> DEBUG
   | "INFO" -> INFO
   | "WARN" -> WARN
   | "ERROR" -> ERROR
   | "FATAL" -> FATAL
   | _ -> failwith "unknown enum value"
    : event_severity)

let request_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let event_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let event_date_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let event_description_of_xml i =
  let r_event_date = ref None in
  let r_message = ref None in
  let r_application_name = ref None in
  let r_version_label = ref None in
  let r_template_name = ref None in
  let r_environment_name = ref None in
  let r_platform_arn = ref None in
  let r_request_id = ref None in
  let r_severity = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EventDate";
      "Message";
      "ApplicationName";
      "VersionLabel";
      "TemplateName";
      "EnvironmentName";
      "PlatformArn";
      "RequestId";
      "Severity";
    ] (fun tag _ ->
      match tag with
      | "EventDate" ->
          r_event_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventDate" (fun i _ -> event_date_of_xml i) ())
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> event_message_of_xml i) ())
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "RequestId" ->
          r_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestId" (fun i _ -> request_id_of_xml i) ())
      | "Severity" ->
          r_severity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Severity"
                 (fun i _ -> event_severity_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     event_date = ( ! ) r_event_date;
     message = ( ! ) r_message;
     application_name = ( ! ) r_application_name;
     version_label = ( ! ) r_version_label;
     template_name = ( ! ) r_template_name;
     environment_name = ( ! ) r_environment_name;
     platform_arn = ( ! ) r_platform_arn;
     request_id = ( ! ) r_request_id;
     severity = ( ! ) r_severity;
   }
    : event_description)

let event_description_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> event_description_of_xml i) ()

let event_descriptions_message_of_xml i =
  let r_events = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Events"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Events" ->
          r_events :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Events"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> event_description_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ events = ( ! ) r_events; next_token = ( ! ) r_next_token } : event_descriptions_message)

let max_records_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let time_filter_end_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let time_filter_start_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let describe_events_message_of_xml i =
  let r_application_name = ref None in
  let r_version_label = ref None in
  let r_template_name = ref None in
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  let r_platform_arn = ref None in
  let r_request_id = ref None in
  let r_severity = ref None in
  let r_start_time = ref None in
  let r_end_time = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ApplicationName";
      "VersionLabel";
      "TemplateName";
      "EnvironmentId";
      "EnvironmentName";
      "PlatformArn";
      "RequestId";
      "Severity";
      "StartTime";
      "EndTime";
      "MaxRecords";
      "NextToken";
    ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
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
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "RequestId" ->
          r_request_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequestId" (fun i _ -> request_id_of_xml i) ())
      | "Severity" ->
          r_severity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Severity"
                 (fun i _ -> event_severity_of_xml i)
                 ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime"
                 (fun i _ -> time_filter_start_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime"
                 (fun i _ -> time_filter_end_of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = ( ! ) r_application_name;
     version_label = ( ! ) r_version_label;
     template_name = ( ! ) r_template_name;
     environment_id = ( ! ) r_environment_id;
     environment_name = ( ! ) r_environment_name;
     platform_arn = ( ! ) r_platform_arn;
     request_id = ( ! ) r_request_id;
     severity = ( ! ) r_severity;
     start_time = ( ! ) r_start_time;
     end_time = ( ! ) r_end_time;
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
   }
    : describe_events_message)

let environment_descriptions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> environment_description_of_xml i) ()

let environment_descriptions_message_of_xml i =
  let r_environments = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Environments"; "NextToken" ] (fun tag _ ->
      match tag with
      | "Environments" ->
          r_environments :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Environments"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> environment_description_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ environments = ( ! ) r_environments; next_token = ( ! ) r_next_token }
    : environment_descriptions_message)

let include_deleted_back_to_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let include_deleted_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let environment_names_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> environment_name_of_xml i) ()

let environment_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> environment_id_of_xml i) ()

let describe_environments_message_of_xml i =
  let r_application_name = ref None in
  let r_version_label = ref None in
  let r_environment_ids = ref None in
  let r_environment_names = ref None in
  let r_include_deleted = ref None in
  let r_included_deleted_back_to = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ApplicationName";
      "VersionLabel";
      "EnvironmentIds";
      "EnvironmentNames";
      "IncludeDeleted";
      "IncludedDeletedBackTo";
      "MaxRecords";
      "NextToken";
    ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
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
      | "EnvironmentNames" ->
          r_environment_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> environment_name_of_xml i)
                     ())
                 ())
      | "IncludeDeleted" ->
          r_include_deleted :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeDeleted"
                 (fun i _ -> include_deleted_of_xml i)
                 ())
      | "IncludedDeletedBackTo" ->
          r_included_deleted_back_to :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludedDeletedBackTo"
                 (fun i _ -> include_deleted_back_to_of_xml i)
                 ())
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = ( ! ) r_application_name;
     version_label = ( ! ) r_version_label;
     environment_ids = ( ! ) r_environment_ids;
     environment_names = ( ! ) r_environment_names;
     include_deleted = ( ! ) r_include_deleted;
     included_deleted_back_to = ( ! ) r_included_deleted_back_to;
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
   }
    : describe_environments_message)

let queue_of_xml i =
  let r_name = ref None in
  let r_ur_l = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Name"; "URL" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | "URL" ->
          r_ur_l :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "URL" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; ur_l = ( ! ) r_ur_l } : queue)

let queue_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> queue_of_xml i) ()

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
  let r_environment_name = ref None in
  let r_auto_scaling_groups = ref None in
  let r_instances = ref None in
  let r_launch_configurations = ref None in
  let r_launch_templates = ref None in
  let r_load_balancers = ref None in
  let r_triggers = ref None in
  let r_queues = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EnvironmentName";
      "AutoScalingGroups";
      "Instances";
      "LaunchConfigurations";
      "LaunchTemplates";
      "LoadBalancers";
      "Triggers";
      "Queues";
    ] (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
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
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
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
      | "LaunchTemplates" ->
          r_launch_templates :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LaunchTemplates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> launch_template_of_xml i)
                     ())
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
      | "Triggers" ->
          r_triggers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Triggers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> trigger_of_xml i) ())
                 ())
      | "Queues" ->
          r_queues :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Queues"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> queue_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_name = ( ! ) r_environment_name;
     auto_scaling_groups = ( ! ) r_auto_scaling_groups;
     instances = ( ! ) r_instances;
     launch_configurations = ( ! ) r_launch_configurations;
     launch_templates = ( ! ) r_launch_templates;
     load_balancers = ( ! ) r_load_balancers;
     triggers = ( ! ) r_triggers;
     queues = ( ! ) r_queues;
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

let describe_environment_resources_message_of_xml i =
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentId"; "EnvironmentName" ] (fun tag _ ->
      match tag with
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
  ({ environment_id = ( ! ) r_environment_id; environment_name = ( ! ) r_environment_name }
    : describe_environment_resources_message)

let timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let action_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Scheduled" -> Scheduled
   | "Pending" -> Pending
   | "Running" -> Running
   | "Unknown" -> Unknown
   | _ -> failwith "unknown enum value"
    : action_status)

let action_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "InstanceRefresh" -> InstanceRefresh
   | "PlatformUpdate" -> PlatformUpdate
   | "Unknown" -> Unknown
   | _ -> failwith "unknown enum value"
    : action_type)

let managed_action_of_xml i =
  let r_action_id = ref None in
  let r_action_description = ref None in
  let r_action_type = ref None in
  let r_status = ref None in
  let r_window_start_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ActionId"; "ActionDescription"; "ActionType"; "Status"; "WindowStartTime" ] (fun tag _ ->
      match tag with
      | "ActionId" ->
          r_action_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ActionId" (fun i _ -> string__of_xml i) ())
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
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> action_status_of_xml i) ())
      | "WindowStartTime" ->
          r_window_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "WindowStartTime"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     action_id = ( ! ) r_action_id;
     action_description = ( ! ) r_action_description;
     action_type = ( ! ) r_action_type;
     status = ( ! ) r_status;
     window_start_time = ( ! ) r_window_start_time;
   }
    : managed_action)

let managed_actions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> managed_action_of_xml i) ()

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
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentName"; "EnvironmentId"; "Status" ]
    (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> action_status_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_name = ( ! ) r_environment_name;
     environment_id = ( ! ) r_environment_id;
     status = ( ! ) r_status;
   }
    : describe_environment_managed_actions_request)

let action_history_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Completed" -> Completed
   | "Failed" -> Failed
   | "Unknown" -> Unknown
   | _ -> failwith "unknown enum value"
    : action_history_status)

let failure_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "UpdateCancelled" -> UpdateCancelled
   | "CancellationFailed" -> CancellationFailed
   | "RollbackFailed" -> RollbackFailed
   | "RollbackSuccessful" -> RollbackSuccessful
   | "InternalFailure" -> InternalFailure
   | "InvalidEnvironmentState" -> InvalidEnvironmentState
   | "PermissionsError" -> PermissionsError
   | _ -> failwith "unknown enum value"
    : failure_type)

let managed_action_history_item_of_xml i =
  let r_action_id = ref None in
  let r_action_type = ref None in
  let r_action_description = ref None in
  let r_failure_type = ref None in
  let r_status = ref None in
  let r_failure_description = ref None in
  let r_executed_time = ref None in
  let r_finished_time = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ActionId";
      "ActionType";
      "ActionDescription";
      "FailureType";
      "Status";
      "FailureDescription";
      "ExecutedTime";
      "FinishedTime";
    ] (fun tag _ ->
      match tag with
      | "ActionId" ->
          r_action_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ActionId" (fun i _ -> string__of_xml i) ())
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
      | "FailureType" ->
          r_failure_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureType"
                 (fun i _ -> failure_type_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> action_history_status_of_xml i)
                 ())
      | "FailureDescription" ->
          r_failure_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureDescription"
                 (fun i _ -> string__of_xml i)
                 ())
      | "ExecutedTime" ->
          r_executed_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutedTime"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "FinishedTime" ->
          r_finished_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FinishedTime"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     action_id = ( ! ) r_action_id;
     action_type = ( ! ) r_action_type;
     action_description = ( ! ) r_action_description;
     failure_type = ( ! ) r_failure_type;
     status = ( ! ) r_status;
     failure_description = ( ! ) r_failure_description;
     executed_time = ( ! ) r_executed_time;
     finished_time = ( ! ) r_finished_time;
   }
    : managed_action_history_item)

let managed_action_history_items_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> managed_action_history_item_of_xml i) ()

let describe_environment_managed_action_history_result_of_xml i =
  let r_managed_action_history_items = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ManagedActionHistoryItems"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "ManagedActionHistoryItems" ->
          r_managed_action_history_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedActionHistoryItems"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> managed_action_history_item_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     managed_action_history_items = ( ! ) r_managed_action_history_items;
     next_token = ( ! ) r_next_token;
   }
    : describe_environment_managed_action_history_result)

let managed_action_history_max_items_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let describe_environment_managed_action_history_request_of_xml i =
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  let r_next_token = ref None in
  let r_max_items = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EnvironmentId"; "EnvironmentName"; "NextToken"; "MaxItems" ] (fun tag _ ->
      match tag with
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
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | "MaxItems" ->
          r_max_items :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxItems"
                 (fun i _ -> managed_action_history_max_items_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_id = ( ! ) r_environment_id;
     environment_name = ( ! ) r_environment_name;
     next_token = ( ! ) r_next_token;
     max_items = ( ! ) r_max_items;
   }
    : describe_environment_managed_action_history_request)

let instance_health_summary_of_xml i =
  let r_no_data = ref None in
  let r_unknown = ref None in
  let r_pending = ref None in
  let r_ok = ref None in
  let r_info = ref None in
  let r_warning = ref None in
  let r_degraded = ref None in
  let r_severe = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NoData"; "Unknown"; "Pending"; "Ok"; "Info"; "Warning"; "Degraded"; "Severe" ] (fun tag _ ->
      match tag with
      | "NoData" ->
          r_no_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NoData"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Unknown" ->
          r_unknown :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Unknown"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Pending" ->
          r_pending :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Pending"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Ok" ->
          r_ok :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Ok" (fun i _ -> nullable_integer_of_xml i) ())
      | "Info" ->
          r_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Info" (fun i _ -> nullable_integer_of_xml i) ())
      | "Warning" ->
          r_warning :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Warning"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Degraded" ->
          r_degraded :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Degraded"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | "Severe" ->
          r_severe :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Severe"
                 (fun i _ -> nullable_integer_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     no_data = ( ! ) r_no_data;
     unknown = ( ! ) r_unknown;
     pending = ( ! ) r_pending;
     ok = ( ! ) r_ok;
     info = ( ! ) r_info;
     warning = ( ! ) r_warning;
     degraded = ( ! ) r_degraded;
     severe = ( ! ) r_severe;
   }
    : instance_health_summary)

let describe_environment_health_result_of_xml i =
  let r_environment_name = ref None in
  let r_health_status = ref None in
  let r_status = ref None in
  let r_color = ref None in
  let r_causes = ref None in
  let r_application_metrics = ref None in
  let r_instances_health = ref None in
  let r_refreshed_at = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "EnvironmentName";
      "HealthStatus";
      "Status";
      "Color";
      "Causes";
      "ApplicationMetrics";
      "InstancesHealth";
      "RefreshedAt";
    ] (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "HealthStatus" ->
          r_health_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthStatus" (fun i _ -> string__of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> environment_health_of_xml i)
                 ())
      | "Color" ->
          r_color :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Color" (fun i _ -> string__of_xml i) ())
      | "Causes" ->
          r_causes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Causes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> cause_of_xml i) ())
                 ())
      | "ApplicationMetrics" ->
          r_application_metrics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationMetrics"
                 (fun i _ -> application_metrics_of_xml i)
                 ())
      | "InstancesHealth" ->
          r_instances_health :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancesHealth"
                 (fun i _ -> instance_health_summary_of_xml i)
                 ())
      | "RefreshedAt" ->
          r_refreshed_at :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RefreshedAt"
                 (fun i _ -> refreshed_at_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_name = ( ! ) r_environment_name;
     health_status = ( ! ) r_health_status;
     status = ( ! ) r_status;
     color = ( ! ) r_color;
     causes = ( ! ) r_causes;
     application_metrics = ( ! ) r_application_metrics;
     instances_health = ( ! ) r_instances_health;
     refreshed_at = ( ! ) r_refreshed_at;
   }
    : describe_environment_health_result)

let environment_health_attribute_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Status" -> Status
   | "Color" -> Color
   | "Causes" -> Causes
   | "ApplicationMetrics" -> ApplicationMetrics
   | "InstancesHealth" -> InstancesHealth
   | "All" -> All
   | "HealthStatus" -> HealthStatus
   | "RefreshedAt" -> RefreshedAt
   | _ -> failwith "unknown enum value"
    : environment_health_attribute)

let environment_health_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> environment_health_attribute_of_xml i)
    ()

let describe_environment_health_request_of_xml i =
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  let r_attribute_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "EnvironmentName"; "EnvironmentId"; "AttributeNames" ] (fun tag _ ->
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
      | "AttributeNames" ->
          r_attribute_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> environment_health_attribute_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_name = ( ! ) r_environment_name;
     environment_id = ( ! ) r_environment_id;
     attribute_names = ( ! ) r_attribute_names;
   }
    : describe_environment_health_request)

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

let describe_configuration_settings_message_of_xml i =
  let r_application_name = ref None in
  let r_template_name = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ApplicationName"; "TemplateName"; "EnvironmentName" ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     template_name = ( ! ) r_template_name;
     environment_name = ( ! ) r_environment_name;
   }
    : describe_configuration_settings_message)

let regex_label_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let regex_pattern_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let option_restriction_regex_of_xml i =
  let r_pattern = ref None in
  let r_label = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Pattern"; "Label" ] (fun tag _ ->
      match tag with
      | "Pattern" ->
          r_pattern :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Pattern" (fun i _ -> regex_pattern_of_xml i) ())
      | "Label" ->
          r_label :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Label" (fun i _ -> regex_label_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ pattern = ( ! ) r_pattern; label = ( ! ) r_label } : option_restriction_regex)

let option_restriction_max_length_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let option_restriction_max_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let option_restriction_min_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let configuration_option_possible_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let configuration_option_possible_values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> configuration_option_possible_value_of_xml i)
    ()

let configuration_option_value_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Scalar" -> Scalar | "List" -> List | _ -> failwith "unknown enum value"
    : configuration_option_value_type)

let user_defined_option_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let configuration_option_severity_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let configuration_option_default_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let configuration_option_description_of_xml i =
  let r_namespace = ref None in
  let r_name = ref None in
  let r_default_value = ref None in
  let r_change_severity = ref None in
  let r_user_defined = ref None in
  let r_value_type = ref None in
  let r_value_options = ref None in
  let r_min_value = ref None in
  let r_max_value = ref None in
  let r_max_length = ref None in
  let r_regex = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Namespace";
      "Name";
      "DefaultValue";
      "ChangeSeverity";
      "UserDefined";
      "ValueType";
      "ValueOptions";
      "MinValue";
      "MaxValue";
      "MaxLength";
      "Regex";
    ] (fun tag _ ->
      match tag with
      | "Namespace" ->
          r_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Namespace"
                 (fun i _ -> option_namespace_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> configuration_option_name_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> configuration_option_default_value_of_xml i)
                 ())
      | "ChangeSeverity" ->
          r_change_severity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSeverity"
                 (fun i _ -> configuration_option_severity_of_xml i)
                 ())
      | "UserDefined" ->
          r_user_defined :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UserDefined"
                 (fun i _ -> user_defined_option_of_xml i)
                 ())
      | "ValueType" ->
          r_value_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValueType"
                 (fun i _ -> configuration_option_value_type_of_xml i)
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
      | "MinValue" ->
          r_min_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MinValue"
                 (fun i _ -> option_restriction_min_value_of_xml i)
                 ())
      | "MaxValue" ->
          r_max_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxValue"
                 (fun i _ -> option_restriction_max_value_of_xml i)
                 ())
      | "MaxLength" ->
          r_max_length :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxLength"
                 (fun i _ -> option_restriction_max_length_of_xml i)
                 ())
      | "Regex" ->
          r_regex :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regex"
                 (fun i _ -> option_restriction_regex_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     namespace = ( ! ) r_namespace;
     name = ( ! ) r_name;
     default_value = ( ! ) r_default_value;
     change_severity = ( ! ) r_change_severity;
     user_defined = ( ! ) r_user_defined;
     value_type = ( ! ) r_value_type;
     value_options = ( ! ) r_value_options;
     min_value = ( ! ) r_min_value;
     max_value = ( ! ) r_max_value;
     max_length = ( ! ) r_max_length;
     regex = ( ! ) r_regex;
   }
    : configuration_option_description)

let configuration_option_descriptions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> configuration_option_description_of_xml i)
    ()

let configuration_options_description_of_xml i =
  let r_solution_stack_name = ref None in
  let r_platform_arn = ref None in
  let r_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SolutionStackName"; "PlatformArn"; "Options" ]
    (fun tag _ ->
      match tag with
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> configuration_option_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     solution_stack_name = ( ! ) r_solution_stack_name;
     platform_arn = ( ! ) r_platform_arn;
     options = ( ! ) r_options;
   }
    : configuration_options_description)

let describe_configuration_options_message_of_xml i =
  let r_application_name = ref None in
  let r_template_name = ref None in
  let r_environment_name = ref None in
  let r_solution_stack_name = ref None in
  let r_platform_arn = ref None in
  let r_options = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ApplicationName";
      "TemplateName";
      "EnvironmentName";
      "SolutionStackName";
      "PlatformArn";
      "Options";
    ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "Options" ->
          r_options :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Options"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> option_specification_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = ( ! ) r_application_name;
     template_name = ( ! ) r_template_name;
     environment_name = ( ! ) r_environment_name;
     solution_stack_name = ( ! ) r_solution_stack_name;
     platform_arn = ( ! ) r_platform_arn;
     options = ( ! ) r_options;
   }
    : describe_configuration_options_message)

let application_version_description_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> application_version_description_of_xml i)
    ()

let application_version_descriptions_message_of_xml i =
  let r_application_versions = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationVersions"; "NextToken" ] (fun tag _ ->
      match tag with
      | "ApplicationVersions" ->
          r_application_versions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationVersions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> application_version_description_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ application_versions = ( ! ) r_application_versions; next_token = ( ! ) r_next_token }
    : application_version_descriptions_message)

let describe_application_versions_message_of_xml i =
  let r_application_name = ref None in
  let r_version_labels = ref None in
  let r_max_records = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ApplicationName"; "VersionLabels"; "MaxRecords"; "NextToken" ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
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
      | "MaxRecords" ->
          r_max_records :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxRecords"
                 (fun i _ -> max_records_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = ( ! ) r_application_name;
     version_labels = ( ! ) r_version_labels;
     max_records = ( ! ) r_max_records;
     next_token = ( ! ) r_next_token;
   }
    : describe_application_versions_message)

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
  let r_application_quota = ref None in
  let r_application_version_quota = ref None in
  let r_environment_quota = ref None in
  let r_configuration_template_quota = ref None in
  let r_custom_platform_quota = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ApplicationQuota";
      "ApplicationVersionQuota";
      "EnvironmentQuota";
      "ConfigurationTemplateQuota";
      "CustomPlatformQuota";
    ] (fun tag _ ->
      match tag with
      | "ApplicationQuota" ->
          r_application_quota :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationQuota"
                 (fun i _ -> resource_quota_of_xml i)
                 ())
      | "ApplicationVersionQuota" ->
          r_application_version_quota :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationVersionQuota"
                 (fun i _ -> resource_quota_of_xml i)
                 ())
      | "EnvironmentQuota" ->
          r_environment_quota :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentQuota"
                 (fun i _ -> resource_quota_of_xml i)
                 ())
      | "ConfigurationTemplateQuota" ->
          r_configuration_template_quota :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationTemplateQuota"
                 (fun i _ -> resource_quota_of_xml i)
                 ())
      | "CustomPlatformQuota" ->
          r_custom_platform_quota :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomPlatformQuota"
                 (fun i _ -> resource_quota_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_quota = ( ! ) r_application_quota;
     application_version_quota = ( ! ) r_application_version_quota;
     environment_quota = ( ! ) r_environment_quota;
     configuration_template_quota = ( ! ) r_configuration_template_quota;
     custom_platform_quota = ( ! ) r_custom_platform_quota;
   }
    : resource_quotas)

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
  let r_application_name = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationName"; "EnvironmentName" ]
    (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     environment_name = Smaws_Lib.Xml.Parse.required "EnvironmentName" (( ! ) r_environment_name) i;
   }
    : delete_environment_configuration_message)

let delete_configuration_template_message_of_xml i =
  let r_application_name = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationName"; "TemplateName" ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
   }
    : delete_configuration_template_message)

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

let delete_source_bundle_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let delete_application_version_message_of_xml i =
  let r_application_name = ref None in
  let r_version_label = ref None in
  let r_delete_source_bundle = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ApplicationName"; "VersionLabel"; "DeleteSourceBundle" ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "DeleteSourceBundle" ->
          r_delete_source_bundle :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeleteSourceBundle"
                 (fun i _ -> delete_source_bundle_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     version_label = Smaws_Lib.Xml.Parse.required "VersionLabel" (( ! ) r_version_label) i;
     delete_source_bundle = ( ! ) r_delete_source_bundle;
   }
    : delete_application_version_message)

let terminate_env_force_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let delete_application_message_of_xml i =
  let r_application_name = ref None in
  let r_terminate_env_by_force = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationName"; "TerminateEnvByForce" ]
    (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "TerminateEnvByForce" ->
          r_terminate_env_by_force :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TerminateEnvByForce"
                 (fun i _ -> terminate_env_force_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     terminate_env_by_force = ( ! ) r_terminate_env_by_force;
   }
    : delete_application_message)

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

let create_storage_location_result_message_of_xml i =
  let r_s3_bucket = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "S3Bucket" ] (fun tag _ ->
      match tag with
      | "S3Bucket" ->
          r_s3_bucket :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "S3Bucket" (fun i _ -> s3_bucket_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ s3_bucket = ( ! ) r_s3_bucket } : create_storage_location_result_message)

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

let builder_of_xml i =
  let r_ar_n = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ARN" ] (fun tag _ ->
      match tag with
      | "ARN" ->
          r_ar_n := Some (Smaws_Lib.Xml.Parse.Read.sequence i "ARN" (fun i _ -> ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ ar_n = ( ! ) r_ar_n } : builder)

let create_platform_version_result_of_xml i =
  let r_platform_summary = ref None in
  let r_builder = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PlatformSummary"; "Builder" ] (fun tag _ ->
      match tag with
      | "PlatformSummary" ->
          r_platform_summary :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformSummary"
                 (fun i _ -> platform_summary_of_xml i)
                 ())
      | "Builder" ->
          r_builder :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Builder" (fun i _ -> builder_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ platform_summary = ( ! ) r_platform_summary; builder = ( ! ) r_builder }
    : create_platform_version_result)

let tags_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let create_platform_version_request_of_xml i =
  let r_platform_name = ref None in
  let r_platform_version = ref None in
  let r_platform_definition_bundle = ref None in
  let r_environment_name = ref None in
  let r_option_settings = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PlatformName";
      "PlatformVersion";
      "PlatformDefinitionBundle";
      "EnvironmentName";
      "OptionSettings";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "PlatformName" ->
          r_platform_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformName"
                 (fun i _ -> platform_name_of_xml i)
                 ())
      | "PlatformVersion" ->
          r_platform_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformVersion"
                 (fun i _ -> platform_version_of_xml i)
                 ())
      | "PlatformDefinitionBundle" ->
          r_platform_definition_bundle :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformDefinitionBundle"
                 (fun i _ -> s3_location_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
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
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     platform_name = Smaws_Lib.Xml.Parse.required "PlatformName" (( ! ) r_platform_name) i;
     platform_version = Smaws_Lib.Xml.Parse.required "PlatformVersion" (( ! ) r_platform_version) i;
     platform_definition_bundle =
       Smaws_Lib.Xml.Parse.required "PlatformDefinitionBundle"
         (( ! ) r_platform_definition_bundle)
         i;
     environment_name = ( ! ) r_environment_name;
     option_settings = ( ! ) r_option_settings;
     tags = ( ! ) r_tags;
   }
    : create_platform_version_request)

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

let dns_cname_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let create_environment_message_of_xml i =
  let r_application_name = ref None in
  let r_environment_name = ref None in
  let r_group_name = ref None in
  let r_description = ref None in
  let r_cname_prefix = ref None in
  let r_tier = ref None in
  let r_tags = ref None in
  let r_version_label = ref None in
  let r_template_name = ref None in
  let r_solution_stack_name = ref None in
  let r_platform_arn = ref None in
  let r_option_settings = ref None in
  let r_options_to_remove = ref None in
  let r_operations_role = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ApplicationName";
      "EnvironmentName";
      "GroupName";
      "Description";
      "CNAMEPrefix";
      "Tier";
      "Tags";
      "VersionLabel";
      "TemplateName";
      "SolutionStackName";
      "PlatformArn";
      "OptionSettings";
      "OptionsToRemove";
      "OperationsRole";
    ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName" (fun i _ -> group_name_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "CNAMEPrefix" ->
          r_cname_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CNAMEPrefix"
                 (fun i _ -> dns_cname_prefix_of_xml i)
                 ())
      | "Tier" ->
          r_tier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tier" (fun i _ -> environment_tier_of_xml i) ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "VersionLabel" ->
          r_version_label :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabel"
                 (fun i _ -> version_label_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
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
      | "OptionsToRemove" ->
          r_options_to_remove :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OptionsToRemove"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> option_specification_of_xml i)
                     ())
                 ())
      | "OperationsRole" ->
          r_operations_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationsRole"
                 (fun i _ -> operations_role_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     environment_name = ( ! ) r_environment_name;
     group_name = ( ! ) r_group_name;
     description = ( ! ) r_description;
     cname_prefix = ( ! ) r_cname_prefix;
     tier = ( ! ) r_tier;
     tags = ( ! ) r_tags;
     version_label = ( ! ) r_version_label;
     template_name = ( ! ) r_template_name;
     solution_stack_name = ( ! ) r_solution_stack_name;
     platform_arn = ( ! ) r_platform_arn;
     option_settings = ( ! ) r_option_settings;
     options_to_remove = ( ! ) r_options_to_remove;
     operations_role = ( ! ) r_operations_role;
   }
    : create_environment_message)

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

let source_configuration_of_xml i =
  let r_application_name = ref None in
  let r_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationName"; "TemplateName" ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ application_name = ( ! ) r_application_name; template_name = ( ! ) r_template_name }
    : source_configuration)

let create_configuration_template_message_of_xml i =
  let r_application_name = ref None in
  let r_template_name = ref None in
  let r_solution_stack_name = ref None in
  let r_platform_arn = ref None in
  let r_source_configuration = ref None in
  let r_environment_id = ref None in
  let r_description = ref None in
  let r_option_settings = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ApplicationName";
      "TemplateName";
      "SolutionStackName";
      "PlatformArn";
      "SourceConfiguration";
      "EnvironmentId";
      "Description";
      "OptionSettings";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "TemplateName" ->
          r_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateName"
                 (fun i _ -> configuration_template_name_of_xml i)
                 ())
      | "SolutionStackName" ->
          r_solution_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SolutionStackName"
                 (fun i _ -> solution_stack_name_of_xml i)
                 ())
      | "PlatformArn" ->
          r_platform_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformArn"
                 (fun i _ -> platform_arn_of_xml i)
                 ())
      | "SourceConfiguration" ->
          r_source_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceConfiguration"
                 (fun i _ -> source_configuration_of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId"
                 (fun i _ -> environment_id_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
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
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     template_name = Smaws_Lib.Xml.Parse.required "TemplateName" (( ! ) r_template_name) i;
     solution_stack_name = ( ! ) r_solution_stack_name;
     platform_arn = ( ! ) r_platform_arn;
     source_configuration = ( ! ) r_source_configuration;
     environment_id = ( ! ) r_environment_id;
     description = ( ! ) r_description;
     option_settings = ( ! ) r_option_settings;
     tags = ( ! ) r_tags;
   }
    : create_configuration_template_message)

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

let application_version_proccess_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let auto_create_application_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let non_empty_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let compute_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "BUILD_GENERAL1_SMALL" -> BUILD_GENERAL1_SMALL
   | "BUILD_GENERAL1_MEDIUM" -> BUILD_GENERAL1_MEDIUM
   | "BUILD_GENERAL1_LARGE" -> BUILD_GENERAL1_LARGE
   | _ -> failwith "unknown enum value"
    : compute_type)

let build_configuration_of_xml i =
  let r_artifact_name = ref None in
  let r_code_build_service_role = ref None in
  let r_compute_type = ref None in
  let r_image = ref None in
  let r_timeout_in_minutes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ArtifactName"; "CodeBuildServiceRole"; "ComputeType"; "Image"; "TimeoutInMinutes" ]
    (fun tag _ ->
      match tag with
      | "ArtifactName" ->
          r_artifact_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ArtifactName" (fun i _ -> string__of_xml i) ())
      | "CodeBuildServiceRole" ->
          r_code_build_service_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CodeBuildServiceRole"
                 (fun i _ -> non_empty_string_of_xml i)
                 ())
      | "ComputeType" ->
          r_compute_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ComputeType"
                 (fun i _ -> compute_type_of_xml i)
                 ())
      | "Image" ->
          r_image :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Image"
                 (fun i _ -> non_empty_string_of_xml i)
                 ())
      | "TimeoutInMinutes" ->
          r_timeout_in_minutes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeoutInMinutes"
                 (fun i _ -> boxed_int_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     artifact_name = ( ! ) r_artifact_name;
     code_build_service_role =
       Smaws_Lib.Xml.Parse.required "CodeBuildServiceRole" (( ! ) r_code_build_service_role) i;
     compute_type = ( ! ) r_compute_type;
     image = Smaws_Lib.Xml.Parse.required "Image" (( ! ) r_image) i;
     timeout_in_minutes = ( ! ) r_timeout_in_minutes;
   }
    : build_configuration)

let create_application_version_message_of_xml i =
  let r_application_name = ref None in
  let r_version_label = ref None in
  let r_description = ref None in
  let r_source_build_information = ref None in
  let r_source_bundle = ref None in
  let r_build_configuration = ref None in
  let r_auto_create_application = ref None in
  let r_process = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ApplicationName";
      "VersionLabel";
      "Description";
      "SourceBuildInformation";
      "SourceBundle";
      "BuildConfiguration";
      "AutoCreateApplication";
      "Process";
      "Tags";
    ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
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
      | "SourceBuildInformation" ->
          r_source_build_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceBuildInformation"
                 (fun i _ -> source_build_information_of_xml i)
                 ())
      | "SourceBundle" ->
          r_source_bundle :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceBundle"
                 (fun i _ -> s3_location_of_xml i)
                 ())
      | "BuildConfiguration" ->
          r_build_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BuildConfiguration"
                 (fun i _ -> build_configuration_of_xml i)
                 ())
      | "AutoCreateApplication" ->
          r_auto_create_application :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoCreateApplication"
                 (fun i _ -> auto_create_application_of_xml i)
                 ())
      | "Process" ->
          r_process :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Process"
                 (fun i _ -> application_version_proccess_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     version_label = Smaws_Lib.Xml.Parse.required "VersionLabel" (( ! ) r_version_label) i;
     description = ( ! ) r_description;
     source_build_information = ( ! ) r_source_build_information;
     source_bundle = ( ! ) r_source_bundle;
     build_configuration = ( ! ) r_build_configuration;
     auto_create_application = ( ! ) r_auto_create_application;
     process = ( ! ) r_process;
     tags = ( ! ) r_tags;
   }
    : create_application_version_message)

let create_application_message_of_xml i =
  let r_application_name = ref None in
  let r_description = ref None in
  let r_resource_lifecycle_config = ref None in
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ApplicationName"; "Description"; "ResourceLifecycleConfig"; "Tags" ] (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ResourceLifecycleConfig" ->
          r_resource_lifecycle_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceLifecycleConfig"
                 (fun i _ -> application_resource_lifecycle_config_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = Smaws_Lib.Xml.Parse.required "ApplicationName" (( ! ) r_application_name) i;
     description = ( ! ) r_description;
     resource_lifecycle_config = ( ! ) r_resource_lifecycle_config;
     tags = ( ! ) r_tags;
   }
    : create_application_message)

let version_labels_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> version_label_of_xml i) ()

let compose_environments_message_of_xml i =
  let r_application_name = ref None in
  let r_group_name = ref None in
  let r_version_labels = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ApplicationName"; "GroupName"; "VersionLabels" ]
    (fun tag _ ->
      match tag with
      | "ApplicationName" ->
          r_application_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ApplicationName"
                 (fun i _ -> application_name_of_xml i)
                 ())
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName" (fun i _ -> group_name_of_xml i) ())
      | "VersionLabels" ->
          r_version_labels :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionLabels"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> version_label_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     application_name = ( ! ) r_application_name;
     group_name = ( ! ) r_group_name;
     version_labels = ( ! ) r_version_labels;
   }
    : compose_environments_message)

let cname_availability_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let check_dns_availability_result_message_of_xml i =
  let r_available = ref None in
  let r_fully_qualified_cnam_e = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Available"; "FullyQualifiedCNAME" ] (fun tag _ ->
      match tag with
      | "Available" ->
          r_available :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Available"
                 (fun i _ -> cname_availability_of_xml i)
                 ())
      | "FullyQualifiedCNAME" ->
          r_fully_qualified_cnam_e :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FullyQualifiedCNAME"
                 (fun i _ -> dns_cname_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ available = ( ! ) r_available; fully_qualified_cnam_e = ( ! ) r_fully_qualified_cnam_e }
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
  let r_environment_name = ref None in
  let r_operations_role = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentName"; "OperationsRole" ] (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> environment_name_of_xml i)
                 ())
      | "OperationsRole" ->
          r_operations_role :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationsRole"
                 (fun i _ -> operations_role_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_name = Smaws_Lib.Xml.Parse.required "EnvironmentName" (( ! ) r_environment_name) i;
     operations_role = Smaws_Lib.Xml.Parse.required "OperationsRole" (( ! ) r_operations_role) i;
   }
    : associate_environment_operations_role_message)

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

let apply_environment_managed_action_result_of_xml i =
  let r_action_id = ref None in
  let r_action_description = ref None in
  let r_action_type = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ActionId"; "ActionDescription"; "ActionType"; "Status" ] (fun tag _ ->
      match tag with
      | "ActionId" ->
          r_action_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ActionId" (fun i _ -> string__of_xml i) ())
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
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     action_id = ( ! ) r_action_id;
     action_description = ( ! ) r_action_description;
     action_type = ( ! ) r_action_type;
     status = ( ! ) r_status;
   }
    : apply_environment_managed_action_result)

let apply_environment_managed_action_request_of_xml i =
  let r_environment_name = ref None in
  let r_environment_id = ref None in
  let r_action_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentName"; "EnvironmentId"; "ActionId" ]
    (fun tag _ ->
      match tag with
      | "EnvironmentName" ->
          r_environment_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentName"
                 (fun i _ -> string__of_xml i)
                 ())
      | "EnvironmentId" ->
          r_environment_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnvironmentId" (fun i _ -> string__of_xml i) ())
      | "ActionId" ->
          r_action_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ActionId" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     environment_name = ( ! ) r_environment_name;
     environment_id = ( ! ) r_environment_id;
     action_id = Smaws_Lib.Xml.Parse.required "ActionId" (( ! ) r_action_id) i;
   }
    : apply_environment_managed_action_request)

let abort_environment_update_message_of_xml i =
  let r_environment_id = ref None in
  let r_environment_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EnvironmentId"; "EnvironmentName" ] (fun tag _ ->
      match tag with
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
  ({ environment_id = ( ! ) r_environment_id; environment_name = ( ! ) r_environment_name }
    : abort_environment_update_message)
