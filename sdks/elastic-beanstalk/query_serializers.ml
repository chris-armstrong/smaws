open Types

let ar_n_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let exception_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let too_many_buckets_exception_to_query path (x : too_many_buckets_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let insufficient_privileges_exception_to_query path (x : insufficient_privileges_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let configuration_option_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let option_namespace_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let validation_severity_to_query path (x : validation_severity) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Error_ -> "error" | Warning -> "warning")

let validation_message_string_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let validation_message_to_query path (x : validation_message) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> validation_message_string_to_query (List.append path [ "Message" ]) v);
      (match x.severity with
      | None -> []
      | Some v -> validation_severity_to_query (List.append path [ "Severity" ]) v);
      (match x.namespace with
      | None -> []
      | Some v -> option_namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.option_name with
      | None -> []
      | Some v -> configuration_option_name_to_query (List.append path [ "OptionName" ]) v);
    ]

let validation_messages_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" validation_message_to_query path xs

let configuration_settings_validation_messages_to_query path
    (x : configuration_settings_validation_messages) =
  List.concat
    [
      (match x.messages with
      | None -> []
      | Some v -> validation_messages_list_to_query (List.append path [ "Messages" ]) v);
    ]

let configuration_option_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let configuration_option_setting_to_query path (x : configuration_option_setting) =
  List.concat
    [
      (match x.resource_name with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "ResourceName" ]) v);
      (match x.namespace with
      | None -> []
      | Some v -> option_namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.option_name with
      | None -> []
      | Some v -> configuration_option_name_to_query (List.append path [ "OptionName" ]) v);
      (match x.value with
      | None -> []
      | Some v -> configuration_option_value_to_query (List.append path [ "Value" ]) v);
    ]

let configuration_option_settings_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    configuration_option_setting_to_query path xs

let environment_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let configuration_template_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let application_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let validate_configuration_settings_message_to_query path
    (x : validate_configuration_settings_message) =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      (match x.template_name with
      | None -> []
      | Some v -> configuration_template_name_to_query (List.append path [ "TemplateName" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      configuration_option_settings_list_to_query
        (List.append path [ "OptionSettings" ])
        x.option_settings;
    ]

let too_many_tags_exception_to_query path (x : too_many_tags_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let resource_type_not_supported_exception_to_query path (x : resource_type_not_supported_exception)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let resource_not_found_exception_to_query path (x : resource_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let operation_in_progress_exception_to_query path (x : operation_in_progress_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let tag_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_key_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_key_to_query path xs

let tag_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_to_query path (x : tag) =
  List.concat
    [
      (match x.key with None -> [] | Some v -> tag_key_to_query (List.append path [ "Key" ]) v);
      (match x.value with
      | None -> []
      | Some v -> tag_value_to_query (List.append path [ "Value" ]) v);
    ]

let tag_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let resource_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_tags_for_resource_message_to_query path (x : update_tags_for_resource_message) =
  List.concat
    [
      resource_arn_to_query (List.append path [ "ResourceArn" ]) x.resource_arn;
      (match x.tags_to_add with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagsToAdd" ]) v);
      (match x.tags_to_remove with
      | None -> []
      | Some v -> tag_key_list_to_query (List.append path [ "TagsToRemove" ]) v);
    ]

let operations_role_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let environment_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let environment_link_to_query path (x : environment_link) =
  List.concat
    [
      (match x.link_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LinkName" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EnvironmentName" ]) v);
    ]

let environment_links_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" environment_link_to_query path xs

let environment_tier_to_query path (x : environment_tier) =
  List.concat
    [
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
      (match x.type_ with None -> [] | Some v -> string__to_query (List.append path [ "Type" ]) v);
      (match x.version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Version" ]) v);
    ]

let integer_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let listener_to_query path (x : listener) =
  List.concat
    [
      (match x.protocol with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Protocol" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
    ]

let load_balancer_listeners_description_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" listener_to_query path xs

let load_balancer_description_to_query path (x : load_balancer_description) =
  List.concat
    [
      (match x.load_balancer_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LoadBalancerName" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.listeners with
      | None -> []
      | Some v -> load_balancer_listeners_description_to_query (List.append path [ "Listeners" ]) v);
    ]

let environment_resources_description_to_query path (x : environment_resources_description) =
  List.concat
    [
      (match x.load_balancer with
      | None -> []
      | Some v -> load_balancer_description_to_query (List.append path [ "LoadBalancer" ]) v);
    ]

let environment_health_status_to_query path (x : environment_health_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NoData -> "NoData"
    | Unknown -> "Unknown"
    | Pending -> "Pending"
    | Ok_ -> "Ok"
    | Info -> "Info"
    | Warning -> "Warning"
    | Degraded -> "Degraded"
    | Severe -> "Severe"
    | Suspended -> "Suspended")

let environment_health_to_query path (x : environment_health) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Green -> "Green" | Yellow -> "Yellow" | Red -> "Red" | Grey -> "Grey")

let abortable_operation_in_progress_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let environment_status_to_query path (x : environment_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Aborting -> "Aborting"
    | Launching -> "Launching"
    | Updating -> "Updating"
    | LinkingFrom -> "LinkingFrom"
    | LinkingTo -> "LinkingTo"
    | Ready -> "Ready"
    | Terminating -> "Terminating"
    | Terminated -> "Terminated")

let update_date_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let creation_date_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let dns_cname_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let endpoint_ur_l_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let description_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let platform_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let solution_stack_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let version_label_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let environment_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let environment_description_to_query path (x : environment_description) =
  List.concat
    [
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.version_label with
      | None -> []
      | Some v -> version_label_to_query (List.append path [ "VersionLabel" ]) v);
      (match x.solution_stack_name with
      | None -> []
      | Some v -> solution_stack_name_to_query (List.append path [ "SolutionStackName" ]) v);
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> configuration_template_name_to_query (List.append path [ "TemplateName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.endpoint_ur_l with
      | None -> []
      | Some v -> endpoint_ur_l_to_query (List.append path [ "EndpointURL" ]) v);
      (match x.cnam_e with
      | None -> []
      | Some v -> dns_cname_to_query (List.append path [ "CNAME" ]) v);
      (match x.date_created with
      | None -> []
      | Some v -> creation_date_to_query (List.append path [ "DateCreated" ]) v);
      (match x.date_updated with
      | None -> []
      | Some v -> update_date_to_query (List.append path [ "DateUpdated" ]) v);
      (match x.status with
      | None -> []
      | Some v -> environment_status_to_query (List.append path [ "Status" ]) v);
      (match x.abortable_operation_in_progress with
      | None -> []
      | Some v ->
          abortable_operation_in_progress_to_query
            (List.append path [ "AbortableOperationInProgress" ])
            v);
      (match x.health with
      | None -> []
      | Some v -> environment_health_to_query (List.append path [ "Health" ]) v);
      (match x.health_status with
      | None -> []
      | Some v -> environment_health_status_to_query (List.append path [ "HealthStatus" ]) v);
      (match x.resources with
      | None -> []
      | Some v -> environment_resources_description_to_query (List.append path [ "Resources" ]) v);
      (match x.tier with
      | None -> []
      | Some v -> environment_tier_to_query (List.append path [ "Tier" ]) v);
      (match x.environment_links with
      | None -> []
      | Some v -> environment_links_to_query (List.append path [ "EnvironmentLinks" ]) v);
      (match x.environment_arn with
      | None -> []
      | Some v -> environment_arn_to_query (List.append path [ "EnvironmentArn" ]) v);
      (match x.operations_role with
      | None -> []
      | Some v -> operations_role_to_query (List.append path [ "OperationsRole" ]) v);
    ]

let option_specification_to_query path (x : option_specification) =
  List.concat
    [
      (match x.resource_name with
      | None -> []
      | Some v -> resource_name_to_query (List.append path [ "ResourceName" ]) v);
      (match x.namespace with
      | None -> []
      | Some v -> option_namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.option_name with
      | None -> []
      | Some v -> configuration_option_name_to_query (List.append path [ "OptionName" ]) v);
    ]

let options_specifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" option_specification_to_query path
    xs

let group_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_environment_message_to_query path (x : update_environment_message) =
  List.concat
    [
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.group_name with
      | None -> []
      | Some v -> group_name_to_query (List.append path [ "GroupName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.tier with
      | None -> []
      | Some v -> environment_tier_to_query (List.append path [ "Tier" ]) v);
      (match x.version_label with
      | None -> []
      | Some v -> version_label_to_query (List.append path [ "VersionLabel" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> configuration_template_name_to_query (List.append path [ "TemplateName" ]) v);
      (match x.solution_stack_name with
      | None -> []
      | Some v -> solution_stack_name_to_query (List.append path [ "SolutionStackName" ]) v);
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
      (match x.option_settings with
      | None -> []
      | Some v ->
          configuration_option_settings_list_to_query (List.append path [ "OptionSettings" ]) v);
      (match x.options_to_remove with
      | None -> []
      | Some v -> options_specifier_list_to_query (List.append path [ "OptionsToRemove" ]) v);
    ]

let configuration_deployment_status_to_query path (x : configuration_deployment_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Deployed -> "deployed" | Pending -> "pending" | Failed -> "failed")

let configuration_settings_description_to_query path (x : configuration_settings_description) =
  List.concat
    [
      (match x.solution_stack_name with
      | None -> []
      | Some v -> solution_stack_name_to_query (List.append path [ "SolutionStackName" ]) v);
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> configuration_template_name_to_query (List.append path [ "TemplateName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.deployment_status with
      | None -> []
      | Some v ->
          configuration_deployment_status_to_query (List.append path [ "DeploymentStatus" ]) v);
      (match x.date_created with
      | None -> []
      | Some v -> creation_date_to_query (List.append path [ "DateCreated" ]) v);
      (match x.date_updated with
      | None -> []
      | Some v -> update_date_to_query (List.append path [ "DateUpdated" ]) v);
      (match x.option_settings with
      | None -> []
      | Some v ->
          configuration_option_settings_list_to_query (List.append path [ "OptionSettings" ]) v);
    ]

let update_configuration_template_message_to_query path (x : update_configuration_template_message)
    =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      configuration_template_name_to_query (List.append path [ "TemplateName" ]) x.template_name;
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.option_settings with
      | None -> []
      | Some v ->
          configuration_option_settings_list_to_query (List.append path [ "OptionSettings" ]) v);
      (match x.options_to_remove with
      | None -> []
      | Some v -> options_specifier_list_to_query (List.append path [ "OptionsToRemove" ]) v);
    ]

let application_version_status_to_query path (x : application_version_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Processed -> "Processed"
    | Unprocessed -> "Unprocessed"
    | Failed -> "Failed"
    | Processing -> "Processing"
    | Building -> "Building")

let s3_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let s3_bucket_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let s3_location_to_query path (x : s3_location) =
  List.concat
    [
      (match x.s3_bucket with
      | None -> []
      | Some v -> s3_bucket_to_query (List.append path [ "S3Bucket" ]) v);
      (match x.s3_key with
      | None -> []
      | Some v -> s3_key_to_query (List.append path [ "S3Key" ]) v);
    ]

let source_location_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let source_repository_to_query path (x : source_repository) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with CodeCommit -> "CodeCommit" | S3 -> "S3")

let source_type_to_query path (x : source_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Git -> "Git" | Zip -> "Zip")

let source_build_information_to_query path (x : source_build_information) =
  List.concat
    [
      source_type_to_query (List.append path [ "SourceType" ]) x.source_type;
      source_repository_to_query (List.append path [ "SourceRepository" ]) x.source_repository;
      source_location_to_query (List.append path [ "SourceLocation" ]) x.source_location;
    ]

let application_version_arn_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let application_version_description_to_query path (x : application_version_description) =
  List.concat
    [
      (match x.application_version_arn with
      | None -> []
      | Some v -> application_version_arn_to_query (List.append path [ "ApplicationVersionArn" ]) v);
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.version_label with
      | None -> []
      | Some v -> version_label_to_query (List.append path [ "VersionLabel" ]) v);
      (match x.source_build_information with
      | None -> []
      | Some v ->
          source_build_information_to_query (List.append path [ "SourceBuildInformation" ]) v);
      (match x.build_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BuildArn" ]) v);
      (match x.source_bundle with
      | None -> []
      | Some v -> s3_location_to_query (List.append path [ "SourceBundle" ]) v);
      (match x.date_created with
      | None -> []
      | Some v -> creation_date_to_query (List.append path [ "DateCreated" ]) v);
      (match x.date_updated with
      | None -> []
      | Some v -> update_date_to_query (List.append path [ "DateUpdated" ]) v);
      (match x.status with
      | None -> []
      | Some v -> application_version_status_to_query (List.append path [ "Status" ]) v);
    ]

let application_version_description_message_to_query path
    (x : application_version_description_message) =
  List.concat
    [
      (match x.application_version with
      | None -> []
      | Some v ->
          application_version_description_to_query (List.append path [ "ApplicationVersion" ]) v);
    ]

let update_application_version_message_to_query path (x : update_application_version_message) =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      version_label_to_query (List.append path [ "VersionLabel" ]) x.version_label;
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
    ]

let boxed_boolean_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let boxed_int_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let max_age_rule_to_query path (x : max_age_rule) =
  List.concat
    [
      boxed_boolean_to_query (List.append path [ "Enabled" ]) x.enabled;
      (match x.max_age_in_days with
      | None -> []
      | Some v -> boxed_int_to_query (List.append path [ "MaxAgeInDays" ]) v);
      (match x.delete_source_from_s3 with
      | None -> []
      | Some v -> boxed_boolean_to_query (List.append path [ "DeleteSourceFromS3" ]) v);
    ]

let max_count_rule_to_query path (x : max_count_rule) =
  List.concat
    [
      boxed_boolean_to_query (List.append path [ "Enabled" ]) x.enabled;
      (match x.max_count with
      | None -> []
      | Some v -> boxed_int_to_query (List.append path [ "MaxCount" ]) v);
      (match x.delete_source_from_s3 with
      | None -> []
      | Some v -> boxed_boolean_to_query (List.append path [ "DeleteSourceFromS3" ]) v);
    ]

let application_version_lifecycle_config_to_query path (x : application_version_lifecycle_config) =
  List.concat
    [
      (match x.max_count_rule with
      | None -> []
      | Some v -> max_count_rule_to_query (List.append path [ "MaxCountRule" ]) v);
      (match x.max_age_rule with
      | None -> []
      | Some v -> max_age_rule_to_query (List.append path [ "MaxAgeRule" ]) v);
    ]

let application_resource_lifecycle_config_to_query path (x : application_resource_lifecycle_config)
    =
  List.concat
    [
      (match x.service_role with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServiceRole" ]) v);
      (match x.version_lifecycle_config with
      | None -> []
      | Some v ->
          application_version_lifecycle_config_to_query
            (List.append path [ "VersionLifecycleConfig" ])
            v);
    ]

let application_resource_lifecycle_description_message_to_query path
    (x : application_resource_lifecycle_description_message) =
  List.concat
    [
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.resource_lifecycle_config with
      | None -> []
      | Some v ->
          application_resource_lifecycle_config_to_query
            (List.append path [ "ResourceLifecycleConfig" ])
            v);
    ]

let update_application_resource_lifecycle_message_to_query path
    (x : update_application_resource_lifecycle_message) =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      application_resource_lifecycle_config_to_query
        (List.append path [ "ResourceLifecycleConfig" ])
        x.resource_lifecycle_config;
    ]

let configuration_template_names_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" configuration_template_name_to_query
    path xs

let version_labels_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" version_label_to_query path xs

let application_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let application_description_to_query path (x : application_description) =
  List.concat
    [
      (match x.application_arn with
      | None -> []
      | Some v -> application_arn_to_query (List.append path [ "ApplicationArn" ]) v);
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.date_created with
      | None -> []
      | Some v -> creation_date_to_query (List.append path [ "DateCreated" ]) v);
      (match x.date_updated with
      | None -> []
      | Some v -> update_date_to_query (List.append path [ "DateUpdated" ]) v);
      (match x.versions with
      | None -> []
      | Some v -> version_labels_list_to_query (List.append path [ "Versions" ]) v);
      (match x.configuration_templates with
      | None -> []
      | Some v ->
          configuration_template_names_list_to_query
            (List.append path [ "ConfigurationTemplates" ])
            v);
      (match x.resource_lifecycle_config with
      | None -> []
      | Some v ->
          application_resource_lifecycle_config_to_query
            (List.append path [ "ResourceLifecycleConfig" ])
            v);
    ]

let application_description_message_to_query path (x : application_description_message) =
  List.concat
    [
      (match x.application with
      | None -> []
      | Some v -> application_description_to_query (List.append path [ "Application" ]) v);
    ]

let update_application_message_to_query path (x : update_application_message) =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
    ]

let force_terminate_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let terminate_environment_resources_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let terminate_environment_message_to_query path (x : terminate_environment_message) =
  List.concat
    [
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.terminate_resources with
      | None -> []
      | Some v ->
          terminate_environment_resources_to_query (List.append path [ "TerminateResources" ]) v);
      (match x.force_terminate with
      | None -> []
      | Some v -> force_terminate_to_query (List.append path [ "ForceTerminate" ]) v);
    ]

let swap_environment_cnam_es_message_to_query path (x : swap_environment_cnam_es_message) =
  List.concat
    [
      (match x.source_environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "SourceEnvironmentId" ]) v);
      (match x.source_environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "SourceEnvironmentName" ]) v);
      (match x.destination_environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "DestinationEnvironmentId" ]) v);
      (match x.destination_environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "DestinationEnvironmentName" ]) v);
    ]

let message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let sample_timestamp_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let ec2_instance_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let environment_info_type_to_query path (x : environment_info_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Tail -> "tail" | Bundle -> "bundle" | Analyze -> "analyze")

let environment_info_description_to_query path (x : environment_info_description) =
  List.concat
    [
      (match x.info_type with
      | None -> []
      | Some v -> environment_info_type_to_query (List.append path [ "InfoType" ]) v);
      (match x.ec2_instance_id with
      | None -> []
      | Some v -> ec2_instance_id_to_query (List.append path [ "Ec2InstanceId" ]) v);
      (match x.sample_timestamp with
      | None -> []
      | Some v -> sample_timestamp_to_query (List.append path [ "SampleTimestamp" ]) v);
      (match x.message with
      | None -> []
      | Some v -> message_to_query (List.append path [ "Message" ]) v);
    ]

let environment_info_description_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    environment_info_description_to_query path xs

let retrieve_environment_info_result_message_to_query path
    (x : retrieve_environment_info_result_message) =
  List.concat
    [
      (match x.environment_info with
      | None -> []
      | Some v ->
          environment_info_description_list_to_query (List.append path [ "EnvironmentInfo" ]) v);
    ]

let retrieve_environment_info_message_to_query path (x : retrieve_environment_info_message) =
  List.concat
    [
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      environment_info_type_to_query (List.append path [ "InfoType" ]) x.info_type;
    ]

let restart_app_server_message_to_query path (x : restart_app_server_message) =
  List.concat
    [
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
    ]

let request_environment_info_message_to_query path (x : request_environment_info_message) =
  List.concat
    [
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      environment_info_type_to_query (List.append path [ "InfoType" ]) x.info_type;
    ]

let rebuild_environment_message_to_query path (x : rebuild_environment_message) =
  List.concat
    [
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
    ]

let resource_tags_description_message_to_query path (x : resource_tags_description_message) =
  List.concat
    [
      (match x.resource_arn with
      | None -> []
      | Some v -> resource_arn_to_query (List.append path [ "ResourceArn" ]) v);
      (match x.resource_tags with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "ResourceTags" ]) v);
    ]

let list_tags_for_resource_message_to_query path (x : list_tags_for_resource_message) =
  List.concat [ resource_arn_to_query (List.append path [ "ResourceArn" ]) x.resource_arn ]

let elastic_beanstalk_service_exception_to_query path (x : elastic_beanstalk_service_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let platform_branch_lifecycle_state_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let branch_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let platform_version_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let platform_lifecycle_state_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let supported_addon_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let supported_addon_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" supported_addon_to_query path xs

let supported_tier_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let supported_tier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" supported_tier_to_query path xs

let operating_system_version_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let operating_system_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let platform_category_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let platform_status_to_query path (x : platform_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Creating -> "Creating"
    | Failed -> "Failed"
    | Ready -> "Ready"
    | Deleting -> "Deleting"
    | Deleted -> "Deleted")

let platform_owner_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let platform_summary_to_query path (x : platform_summary) =
  List.concat
    [
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
      (match x.platform_owner with
      | None -> []
      | Some v -> platform_owner_to_query (List.append path [ "PlatformOwner" ]) v);
      (match x.platform_status with
      | None -> []
      | Some v -> platform_status_to_query (List.append path [ "PlatformStatus" ]) v);
      (match x.platform_category with
      | None -> []
      | Some v -> platform_category_to_query (List.append path [ "PlatformCategory" ]) v);
      (match x.operating_system_name with
      | None -> []
      | Some v -> operating_system_name_to_query (List.append path [ "OperatingSystemName" ]) v);
      (match x.operating_system_version with
      | None -> []
      | Some v ->
          operating_system_version_to_query (List.append path [ "OperatingSystemVersion" ]) v);
      (match x.supported_tier_list with
      | None -> []
      | Some v -> supported_tier_list_to_query (List.append path [ "SupportedTierList" ]) v);
      (match x.supported_addon_list with
      | None -> []
      | Some v -> supported_addon_list_to_query (List.append path [ "SupportedAddonList" ]) v);
      (match x.platform_lifecycle_state with
      | None -> []
      | Some v ->
          platform_lifecycle_state_to_query (List.append path [ "PlatformLifecycleState" ]) v);
      (match x.platform_version with
      | None -> []
      | Some v -> platform_version_to_query (List.append path [ "PlatformVersion" ]) v);
      (match x.platform_branch_name with
      | None -> []
      | Some v -> branch_name_to_query (List.append path [ "PlatformBranchName" ]) v);
      (match x.platform_branch_lifecycle_state with
      | None -> []
      | Some v ->
          platform_branch_lifecycle_state_to_query
            (List.append path [ "PlatformBranchLifecycleState" ])
            v);
    ]

let platform_summary_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" platform_summary_to_query path xs

let list_platform_versions_result_to_query path (x : list_platform_versions_result) =
  List.concat
    [
      (match x.platform_summary_list with
      | None -> []
      | Some v -> platform_summary_list_to_query (List.append path [ "PlatformSummaryList" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> token_to_query (List.append path [ "NextToken" ]) v);
    ]

let platform_max_records_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let platform_filter_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let platform_filter_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" platform_filter_value_to_query path
    xs

let platform_filter_operator_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let platform_filter_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let platform_filter_to_query path (x : platform_filter) =
  List.concat
    [
      (match x.type_ with
      | None -> []
      | Some v -> platform_filter_type_to_query (List.append path [ "Type" ]) v);
      (match x.operator with
      | None -> []
      | Some v -> platform_filter_operator_to_query (List.append path [ "Operator" ]) v);
      (match x.values with
      | None -> []
      | Some v -> platform_filter_value_list_to_query (List.append path [ "Values" ]) v);
    ]

let platform_filters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" platform_filter_to_query path xs

let list_platform_versions_request_to_query path (x : list_platform_versions_request) =
  List.concat
    [
      (match x.filters with
      | None -> []
      | Some v -> platform_filters_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> platform_max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> token_to_query (List.append path [ "NextToken" ]) v);
    ]

let branch_order_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let platform_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let platform_branch_summary_to_query path (x : platform_branch_summary) =
  List.concat
    [
      (match x.platform_name with
      | None -> []
      | Some v -> platform_name_to_query (List.append path [ "PlatformName" ]) v);
      (match x.branch_name with
      | None -> []
      | Some v -> branch_name_to_query (List.append path [ "BranchName" ]) v);
      (match x.lifecycle_state with
      | None -> []
      | Some v -> platform_branch_lifecycle_state_to_query (List.append path [ "LifecycleState" ]) v);
      (match x.branch_order with
      | None -> []
      | Some v -> branch_order_to_query (List.append path [ "BranchOrder" ]) v);
      (match x.supported_tier_list with
      | None -> []
      | Some v -> supported_tier_list_to_query (List.append path [ "SupportedTierList" ]) v);
    ]

let platform_branch_summary_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" platform_branch_summary_to_query
    path xs

let list_platform_branches_result_to_query path (x : list_platform_branches_result) =
  List.concat
    [
      (match x.platform_branch_summary_list with
      | None -> []
      | Some v ->
          platform_branch_summary_list_to_query (List.append path [ "PlatformBranchSummaryList" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> token_to_query (List.append path [ "NextToken" ]) v);
    ]

let platform_branch_max_records_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let search_filter_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let search_filter_values_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" search_filter_value_to_query path xs

let search_filter_operator_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let search_filter_attribute_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let search_filter_to_query path (x : search_filter) =
  List.concat
    [
      (match x.attribute with
      | None -> []
      | Some v -> search_filter_attribute_to_query (List.append path [ "Attribute" ]) v);
      (match x.operator with
      | None -> []
      | Some v -> search_filter_operator_to_query (List.append path [ "Operator" ]) v);
      (match x.values with
      | None -> []
      | Some v -> search_filter_values_to_query (List.append path [ "Values" ]) v);
    ]

let search_filters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" search_filter_to_query path xs

let list_platform_branches_request_to_query path (x : list_platform_branches_request) =
  List.concat
    [
      (match x.filters with
      | None -> []
      | Some v -> search_filters_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> platform_branch_max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> token_to_query (List.append path [ "NextToken" ]) v);
    ]

let file_type_extension_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let solution_stack_file_type_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" file_type_extension_to_query path xs

let solution_stack_description_to_query path (x : solution_stack_description) =
  List.concat
    [
      (match x.solution_stack_name with
      | None -> []
      | Some v -> solution_stack_name_to_query (List.append path [ "SolutionStackName" ]) v);
      (match x.permitted_file_types with
      | None -> []
      | Some v ->
          solution_stack_file_type_list_to_query (List.append path [ "PermittedFileTypes" ]) v);
    ]

let available_solution_stack_details_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" solution_stack_description_to_query
    path xs

let available_solution_stack_names_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" solution_stack_name_to_query path xs

let list_available_solution_stacks_result_message_to_query path
    (x : list_available_solution_stacks_result_message) =
  List.concat
    [
      (match x.solution_stacks with
      | None -> []
      | Some v ->
          available_solution_stack_names_list_to_query (List.append path [ "SolutionStacks" ]) v);
      (match x.solution_stack_details with
      | None -> []
      | Some v ->
          available_solution_stack_details_list_to_query
            (List.append path [ "SolutionStackDetails" ])
            v);
    ]

let disassociate_environment_operations_role_message_to_query path
    (x : disassociate_environment_operations_role_message) =
  List.concat
    [ environment_name_to_query (List.append path [ "EnvironmentName" ]) x.environment_name ]

let image_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let virtualization_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let custom_ami_to_query path (x : custom_ami) =
  List.concat
    [
      (match x.virtualization_type with
      | None -> []
      | Some v -> virtualization_type_to_query (List.append path [ "VirtualizationType" ]) v);
      (match x.image_id with
      | None -> []
      | Some v -> image_id_to_query (List.append path [ "ImageId" ]) v);
    ]

let custom_ami_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" custom_ami_to_query path xs

let platform_framework_to_query path (x : platform_framework) =
  List.concat
    [
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
      (match x.version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Version" ]) v);
    ]

let platform_frameworks_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" platform_framework_to_query path xs

let platform_programming_language_to_query path (x : platform_programming_language) =
  List.concat
    [
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
      (match x.version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Version" ]) v);
    ]

let platform_programming_languages_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    platform_programming_language_to_query path xs

let maintainer_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let platform_description_to_query path (x : platform_description) =
  List.concat
    [
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
      (match x.platform_owner with
      | None -> []
      | Some v -> platform_owner_to_query (List.append path [ "PlatformOwner" ]) v);
      (match x.platform_name with
      | None -> []
      | Some v -> platform_name_to_query (List.append path [ "PlatformName" ]) v);
      (match x.platform_version with
      | None -> []
      | Some v -> platform_version_to_query (List.append path [ "PlatformVersion" ]) v);
      (match x.solution_stack_name with
      | None -> []
      | Some v -> solution_stack_name_to_query (List.append path [ "SolutionStackName" ]) v);
      (match x.platform_status with
      | None -> []
      | Some v -> platform_status_to_query (List.append path [ "PlatformStatus" ]) v);
      (match x.date_created with
      | None -> []
      | Some v -> creation_date_to_query (List.append path [ "DateCreated" ]) v);
      (match x.date_updated with
      | None -> []
      | Some v -> update_date_to_query (List.append path [ "DateUpdated" ]) v);
      (match x.platform_category with
      | None -> []
      | Some v -> platform_category_to_query (List.append path [ "PlatformCategory" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.maintainer with
      | None -> []
      | Some v -> maintainer_to_query (List.append path [ "Maintainer" ]) v);
      (match x.operating_system_name with
      | None -> []
      | Some v -> operating_system_name_to_query (List.append path [ "OperatingSystemName" ]) v);
      (match x.operating_system_version with
      | None -> []
      | Some v ->
          operating_system_version_to_query (List.append path [ "OperatingSystemVersion" ]) v);
      (match x.programming_languages with
      | None -> []
      | Some v ->
          platform_programming_languages_to_query (List.append path [ "ProgrammingLanguages" ]) v);
      (match x.frameworks with
      | None -> []
      | Some v -> platform_frameworks_to_query (List.append path [ "Frameworks" ]) v);
      (match x.custom_ami_list with
      | None -> []
      | Some v -> custom_ami_list_to_query (List.append path [ "CustomAmiList" ]) v);
      (match x.supported_tier_list with
      | None -> []
      | Some v -> supported_tier_list_to_query (List.append path [ "SupportedTierList" ]) v);
      (match x.supported_addon_list with
      | None -> []
      | Some v -> supported_addon_list_to_query (List.append path [ "SupportedAddonList" ]) v);
      (match x.platform_lifecycle_state with
      | None -> []
      | Some v ->
          platform_lifecycle_state_to_query (List.append path [ "PlatformLifecycleState" ]) v);
      (match x.platform_branch_name with
      | None -> []
      | Some v -> branch_name_to_query (List.append path [ "PlatformBranchName" ]) v);
      (match x.platform_branch_lifecycle_state with
      | None -> []
      | Some v ->
          platform_branch_lifecycle_state_to_query
            (List.append path [ "PlatformBranchLifecycleState" ])
            v);
    ]

let describe_platform_version_result_to_query path (x : describe_platform_version_result) =
  List.concat
    [
      (match x.platform_description with
      | None -> []
      | Some v -> platform_description_to_query (List.append path [ "PlatformDescription" ]) v);
    ]

let describe_platform_version_request_to_query path (x : describe_platform_version_request) =
  List.concat
    [
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
    ]

let invalid_request_exception_to_query path (x : invalid_request_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let next_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let refreshed_at_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let deployment_timestamp_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let nullable_long_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let deployment_to_query path (x : deployment) =
  List.concat
    [
      (match x.version_label with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VersionLabel" ]) v);
      (match x.deployment_id with
      | None -> []
      | Some v -> nullable_long_to_query (List.append path [ "DeploymentId" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.deployment_time with
      | None -> []
      | Some v -> deployment_timestamp_to_query (List.append path [ "DeploymentTime" ]) v);
    ]

let load_average_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let load_average_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_average_value_to_query path xs

let nullable_double_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let cpu_utilization_to_query path (x : cpu_utilization) =
  List.concat
    [
      (match x.user with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "User" ]) v);
      (match x.nice with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "Nice" ]) v);
      (match x.system with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "System" ]) v);
      (match x.idle with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "Idle" ]) v);
      (match x.io_wait with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "IOWait" ]) v);
      (match x.ir_q with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "IRQ" ]) v);
      (match x.soft_ir_q with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "SoftIRQ" ]) v);
      (match x.privileged with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "Privileged" ]) v);
    ]

let system_status_to_query path (x : system_status) =
  List.concat
    [
      (match x.cpu_utilization with
      | None -> []
      | Some v -> cpu_utilization_to_query (List.append path [ "CPUUtilization" ]) v);
      (match x.load_average with
      | None -> []
      | Some v -> load_average_to_query (List.append path [ "LoadAverage" ]) v);
    ]

let latency_to_query path (x : latency) =
  List.concat
    [
      (match x.p999 with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "P999" ]) v);
      (match x.p99 with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "P99" ]) v);
      (match x.p95 with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "P95" ]) v);
      (match x.p90 with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "P90" ]) v);
      (match x.p85 with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "P85" ]) v);
      (match x.p75 with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "P75" ]) v);
      (match x.p50 with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "P50" ]) v);
      (match x.p10 with
      | None -> []
      | Some v -> nullable_double_to_query (List.append path [ "P10" ]) v);
    ]

let nullable_integer_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let status_codes_to_query path (x : status_codes) =
  List.concat
    [
      (match x.status2xx with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Status2xx" ]) v);
      (match x.status3xx with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Status3xx" ]) v);
      (match x.status4xx with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Status4xx" ]) v);
      (match x.status5xx with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Status5xx" ]) v);
    ]

let request_count_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let application_metrics_to_query path (x : application_metrics) =
  List.concat
    [
      (match x.duration with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Duration" ]) v);
      (match x.request_count with
      | None -> []
      | Some v -> request_count_to_query (List.append path [ "RequestCount" ]) v);
      (match x.status_codes with
      | None -> []
      | Some v -> status_codes_to_query (List.append path [ "StatusCodes" ]) v);
      (match x.latency with
      | None -> []
      | Some v -> latency_to_query (List.append path [ "Latency" ]) v);
    ]

let launched_at_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v
let cause_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let causes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" cause_to_query path xs

let instance_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let single_instance_health_to_query path (x : single_instance_health) =
  List.concat
    [
      (match x.instance_id with
      | None -> []
      | Some v -> instance_id_to_query (List.append path [ "InstanceId" ]) v);
      (match x.health_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HealthStatus" ]) v);
      (match x.color with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Color" ]) v);
      (match x.causes with
      | None -> []
      | Some v -> causes_to_query (List.append path [ "Causes" ]) v);
      (match x.launched_at with
      | None -> []
      | Some v -> launched_at_to_query (List.append path [ "LaunchedAt" ]) v);
      (match x.application_metrics with
      | None -> []
      | Some v -> application_metrics_to_query (List.append path [ "ApplicationMetrics" ]) v);
      (match x.system with
      | None -> []
      | Some v -> system_status_to_query (List.append path [ "System" ]) v);
      (match x.deployment with
      | None -> []
      | Some v -> deployment_to_query (List.append path [ "Deployment" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.instance_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "InstanceType" ]) v);
    ]

let instance_health_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" single_instance_health_to_query path
    xs

let describe_instances_health_result_to_query path (x : describe_instances_health_result) =
  List.concat
    [
      (match x.instance_health_list with
      | None -> []
      | Some v -> instance_health_list_to_query (List.append path [ "InstanceHealthList" ]) v);
      (match x.refreshed_at with
      | None -> []
      | Some v -> refreshed_at_to_query (List.append path [ "RefreshedAt" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let instances_health_attribute_to_query path (x : instances_health_attribute) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | HealthStatus -> "HealthStatus"
    | Color -> "Color"
    | Causes -> "Causes"
    | ApplicationMetrics -> "ApplicationMetrics"
    | RefreshedAt -> "RefreshedAt"
    | LaunchedAt -> "LaunchedAt"
    | System -> "System"
    | Deployment -> "Deployment"
    | AvailabilityZone -> "AvailabilityZone"
    | InstanceType -> "InstanceType"
    | All -> "All")

let instances_health_attributes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instances_health_attribute_to_query
    path xs

let describe_instances_health_request_to_query path (x : describe_instances_health_request) =
  List.concat
    [
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.attribute_names with
      | None -> []
      | Some v -> instances_health_attributes_to_query (List.append path [ "AttributeNames" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let event_severity_to_query path (x : event_severity) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | TRACE -> "TRACE"
    | DEBUG -> "DEBUG"
    | INFO -> "INFO"
    | WARN -> "WARN"
    | ERROR -> "ERROR"
    | FATAL -> "FATAL")

let request_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let event_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let event_date_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let event_description_to_query path (x : event_description) =
  List.concat
    [
      (match x.event_date with
      | None -> []
      | Some v -> event_date_to_query (List.append path [ "EventDate" ]) v);
      (match x.message with
      | None -> []
      | Some v -> event_message_to_query (List.append path [ "Message" ]) v);
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.version_label with
      | None -> []
      | Some v -> version_label_to_query (List.append path [ "VersionLabel" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> configuration_template_name_to_query (List.append path [ "TemplateName" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
      (match x.request_id with
      | None -> []
      | Some v -> request_id_to_query (List.append path [ "RequestId" ]) v);
      (match x.severity with
      | None -> []
      | Some v -> event_severity_to_query (List.append path [ "Severity" ]) v);
    ]

let event_description_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" event_description_to_query path xs

let event_descriptions_message_to_query path (x : event_descriptions_message) =
  List.concat
    [
      (match x.events with
      | None -> []
      | Some v -> event_description_list_to_query (List.append path [ "Events" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> token_to_query (List.append path [ "NextToken" ]) v);
    ]

let max_records_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let time_filter_end_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let time_filter_start_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let describe_events_message_to_query path (x : describe_events_message) =
  List.concat
    [
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.version_label with
      | None -> []
      | Some v -> version_label_to_query (List.append path [ "VersionLabel" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> configuration_template_name_to_query (List.append path [ "TemplateName" ]) v);
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
      (match x.request_id with
      | None -> []
      | Some v -> request_id_to_query (List.append path [ "RequestId" ]) v);
      (match x.severity with
      | None -> []
      | Some v -> event_severity_to_query (List.append path [ "Severity" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> time_filter_start_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> time_filter_end_to_query (List.append path [ "EndTime" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> token_to_query (List.append path [ "NextToken" ]) v);
    ]

let environment_descriptions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" environment_description_to_query
    path xs

let environment_descriptions_message_to_query path (x : environment_descriptions_message) =
  List.concat
    [
      (match x.environments with
      | None -> []
      | Some v -> environment_descriptions_list_to_query (List.append path [ "Environments" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> token_to_query (List.append path [ "NextToken" ]) v);
    ]

let include_deleted_back_to_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let include_deleted_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let environment_names_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" environment_name_to_query path xs

let environment_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" environment_id_to_query path xs

let describe_environments_message_to_query path (x : describe_environments_message) =
  List.concat
    [
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.version_label with
      | None -> []
      | Some v -> version_label_to_query (List.append path [ "VersionLabel" ]) v);
      (match x.environment_ids with
      | None -> []
      | Some v -> environment_id_list_to_query (List.append path [ "EnvironmentIds" ]) v);
      (match x.environment_names with
      | None -> []
      | Some v -> environment_names_list_to_query (List.append path [ "EnvironmentNames" ]) v);
      (match x.include_deleted with
      | None -> []
      | Some v -> include_deleted_to_query (List.append path [ "IncludeDeleted" ]) v);
      (match x.included_deleted_back_to with
      | None -> []
      | Some v -> include_deleted_back_to_to_query (List.append path [ "IncludedDeletedBackTo" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> token_to_query (List.append path [ "NextToken" ]) v);
    ]

let queue_to_query path (x : queue) =
  List.concat
    [
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
      (match x.ur_l with None -> [] | Some v -> string__to_query (List.append path [ "URL" ]) v);
    ]

let queue_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" queue_to_query path xs

let resource_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let trigger_to_query path (x : trigger) =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v -> resource_id_to_query (List.append path [ "Name" ]) v);
    ]

let trigger_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" trigger_to_query path xs

let load_balancer_to_query path (x : load_balancer) =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v -> resource_id_to_query (List.append path [ "Name" ]) v);
    ]

let load_balancer_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_balancer_to_query path xs

let launch_template_to_query path (x : launch_template) =
  List.concat
    [
      (match x.id with None -> [] | Some v -> resource_id_to_query (List.append path [ "Id" ]) v);
    ]

let launch_template_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" launch_template_to_query path xs

let launch_configuration_to_query path (x : launch_configuration) =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v -> resource_id_to_query (List.append path [ "Name" ]) v);
    ]

let launch_configuration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" launch_configuration_to_query path
    xs

let instance_to_query path (x : instance) =
  List.concat
    [
      (match x.id with None -> [] | Some v -> resource_id_to_query (List.append path [ "Id" ]) v);
    ]

let instance_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_to_query path xs

let auto_scaling_group_to_query path (x : auto_scaling_group) =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v -> resource_id_to_query (List.append path [ "Name" ]) v);
    ]

let auto_scaling_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" auto_scaling_group_to_query path xs

let environment_resource_description_to_query path (x : environment_resource_description) =
  List.concat
    [
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.auto_scaling_groups with
      | None -> []
      | Some v -> auto_scaling_group_list_to_query (List.append path [ "AutoScalingGroups" ]) v);
      (match x.instances with
      | None -> []
      | Some v -> instance_list_to_query (List.append path [ "Instances" ]) v);
      (match x.launch_configurations with
      | None -> []
      | Some v -> launch_configuration_list_to_query (List.append path [ "LaunchConfigurations" ]) v);
      (match x.launch_templates with
      | None -> []
      | Some v -> launch_template_list_to_query (List.append path [ "LaunchTemplates" ]) v);
      (match x.load_balancers with
      | None -> []
      | Some v -> load_balancer_list_to_query (List.append path [ "LoadBalancers" ]) v);
      (match x.triggers with
      | None -> []
      | Some v -> trigger_list_to_query (List.append path [ "Triggers" ]) v);
      (match x.queues with
      | None -> []
      | Some v -> queue_list_to_query (List.append path [ "Queues" ]) v);
    ]

let environment_resource_descriptions_message_to_query path
    (x : environment_resource_descriptions_message) =
  List.concat
    [
      (match x.environment_resources with
      | None -> []
      | Some v ->
          environment_resource_description_to_query (List.append path [ "EnvironmentResources" ]) v);
    ]

let describe_environment_resources_message_to_query path
    (x : describe_environment_resources_message) =
  List.concat
    [
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
    ]

let timestamp_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let action_status_to_query path (x : action_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Scheduled -> "Scheduled"
    | Pending -> "Pending"
    | Running -> "Running"
    | Unknown -> "Unknown")

let action_type_to_query path (x : action_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | InstanceRefresh -> "InstanceRefresh"
    | PlatformUpdate -> "PlatformUpdate"
    | Unknown -> "Unknown")

let managed_action_to_query path (x : managed_action) =
  List.concat
    [
      (match x.action_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ActionId" ]) v);
      (match x.action_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ActionDescription" ]) v);
      (match x.action_type with
      | None -> []
      | Some v -> action_type_to_query (List.append path [ "ActionType" ]) v);
      (match x.status with
      | None -> []
      | Some v -> action_status_to_query (List.append path [ "Status" ]) v);
      (match x.window_start_time with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "WindowStartTime" ]) v);
    ]

let managed_actions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" managed_action_to_query path xs

let describe_environment_managed_actions_result_to_query path
    (x : describe_environment_managed_actions_result) =
  List.concat
    [
      (match x.managed_actions with
      | None -> []
      | Some v -> managed_actions_to_query (List.append path [ "ManagedActions" ]) v);
    ]

let describe_environment_managed_actions_request_to_query path
    (x : describe_environment_managed_actions_request) =
  List.concat
    [
      (match x.environment_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.environment_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.status with
      | None -> []
      | Some v -> action_status_to_query (List.append path [ "Status" ]) v);
    ]

let action_history_status_to_query path (x : action_history_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Completed -> "Completed" | Failed -> "Failed" | Unknown -> "Unknown")

let failure_type_to_query path (x : failure_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | UpdateCancelled -> "UpdateCancelled"
    | CancellationFailed -> "CancellationFailed"
    | RollbackFailed -> "RollbackFailed"
    | RollbackSuccessful -> "RollbackSuccessful"
    | InternalFailure -> "InternalFailure"
    | InvalidEnvironmentState -> "InvalidEnvironmentState"
    | PermissionsError -> "PermissionsError")

let managed_action_history_item_to_query path (x : managed_action_history_item) =
  List.concat
    [
      (match x.action_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ActionId" ]) v);
      (match x.action_type with
      | None -> []
      | Some v -> action_type_to_query (List.append path [ "ActionType" ]) v);
      (match x.action_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ActionDescription" ]) v);
      (match x.failure_type with
      | None -> []
      | Some v -> failure_type_to_query (List.append path [ "FailureType" ]) v);
      (match x.status with
      | None -> []
      | Some v -> action_history_status_to_query (List.append path [ "Status" ]) v);
      (match x.failure_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FailureDescription" ]) v);
      (match x.executed_time with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "ExecutedTime" ]) v);
      (match x.finished_time with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "FinishedTime" ]) v);
    ]

let managed_action_history_items_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" managed_action_history_item_to_query
    path xs

let describe_environment_managed_action_history_result_to_query path
    (x : describe_environment_managed_action_history_result) =
  List.concat
    [
      (match x.managed_action_history_items with
      | None -> []
      | Some v ->
          managed_action_history_items_to_query (List.append path [ "ManagedActionHistoryItems" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
    ]

let managed_action_history_max_items_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let describe_environment_managed_action_history_request_to_query path
    (x : describe_environment_managed_action_history_request) =
  List.concat
    [
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
      (match x.max_items with
      | None -> []
      | Some v -> managed_action_history_max_items_to_query (List.append path [ "MaxItems" ]) v);
    ]

let instance_health_summary_to_query path (x : instance_health_summary) =
  List.concat
    [
      (match x.no_data with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "NoData" ]) v);
      (match x.unknown with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Unknown" ]) v);
      (match x.pending with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Pending" ]) v);
      (match x.ok with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Ok" ]) v);
      (match x.info with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Info" ]) v);
      (match x.warning with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Warning" ]) v);
      (match x.degraded with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Degraded" ]) v);
      (match x.severe with
      | None -> []
      | Some v -> nullable_integer_to_query (List.append path [ "Severe" ]) v);
    ]

let describe_environment_health_result_to_query path (x : describe_environment_health_result) =
  List.concat
    [
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.health_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HealthStatus" ]) v);
      (match x.status with
      | None -> []
      | Some v -> environment_health_to_query (List.append path [ "Status" ]) v);
      (match x.color with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Color" ]) v);
      (match x.causes with
      | None -> []
      | Some v -> causes_to_query (List.append path [ "Causes" ]) v);
      (match x.application_metrics with
      | None -> []
      | Some v -> application_metrics_to_query (List.append path [ "ApplicationMetrics" ]) v);
      (match x.instances_health with
      | None -> []
      | Some v -> instance_health_summary_to_query (List.append path [ "InstancesHealth" ]) v);
      (match x.refreshed_at with
      | None -> []
      | Some v -> refreshed_at_to_query (List.append path [ "RefreshedAt" ]) v);
    ]

let environment_health_attribute_to_query path (x : environment_health_attribute) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Status -> "Status"
    | Color -> "Color"
    | Causes -> "Causes"
    | ApplicationMetrics -> "ApplicationMetrics"
    | InstancesHealth -> "InstancesHealth"
    | All -> "All"
    | HealthStatus -> "HealthStatus"
    | RefreshedAt -> "RefreshedAt")

let environment_health_attributes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    environment_health_attribute_to_query path xs

let describe_environment_health_request_to_query path (x : describe_environment_health_request) =
  List.concat
    [
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.attribute_names with
      | None -> []
      | Some v -> environment_health_attributes_to_query (List.append path [ "AttributeNames" ]) v);
    ]

let configuration_settings_description_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    configuration_settings_description_to_query path xs

let configuration_settings_descriptions_to_query path (x : configuration_settings_descriptions) =
  List.concat
    [
      (match x.configuration_settings with
      | None -> []
      | Some v ->
          configuration_settings_description_list_to_query
            (List.append path [ "ConfigurationSettings" ])
            v);
    ]

let describe_configuration_settings_message_to_query path
    (x : describe_configuration_settings_message) =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      (match x.template_name with
      | None -> []
      | Some v -> configuration_template_name_to_query (List.append path [ "TemplateName" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
    ]

let regex_label_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let regex_pattern_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let option_restriction_regex_to_query path (x : option_restriction_regex) =
  List.concat
    [
      (match x.pattern with
      | None -> []
      | Some v -> regex_pattern_to_query (List.append path [ "Pattern" ]) v);
      (match x.label with
      | None -> []
      | Some v -> regex_label_to_query (List.append path [ "Label" ]) v);
    ]

let option_restriction_max_length_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let option_restriction_max_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let option_restriction_min_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let configuration_option_possible_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let configuration_option_possible_values_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    configuration_option_possible_value_to_query path xs

let configuration_option_value_type_to_query path (x : configuration_option_value_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Scalar -> "Scalar" | List -> "List")

let user_defined_option_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let configuration_option_severity_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let configuration_option_default_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let configuration_option_description_to_query path (x : configuration_option_description) =
  List.concat
    [
      (match x.namespace with
      | None -> []
      | Some v -> option_namespace_to_query (List.append path [ "Namespace" ]) v);
      (match x.name with
      | None -> []
      | Some v -> configuration_option_name_to_query (List.append path [ "Name" ]) v);
      (match x.default_value with
      | None -> []
      | Some v ->
          configuration_option_default_value_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.change_severity with
      | None -> []
      | Some v -> configuration_option_severity_to_query (List.append path [ "ChangeSeverity" ]) v);
      (match x.user_defined with
      | None -> []
      | Some v -> user_defined_option_to_query (List.append path [ "UserDefined" ]) v);
      (match x.value_type with
      | None -> []
      | Some v -> configuration_option_value_type_to_query (List.append path [ "ValueType" ]) v);
      (match x.value_options with
      | None -> []
      | Some v ->
          configuration_option_possible_values_to_query (List.append path [ "ValueOptions" ]) v);
      (match x.min_value with
      | None -> []
      | Some v -> option_restriction_min_value_to_query (List.append path [ "MinValue" ]) v);
      (match x.max_value with
      | None -> []
      | Some v -> option_restriction_max_value_to_query (List.append path [ "MaxValue" ]) v);
      (match x.max_length with
      | None -> []
      | Some v -> option_restriction_max_length_to_query (List.append path [ "MaxLength" ]) v);
      (match x.regex with
      | None -> []
      | Some v -> option_restriction_regex_to_query (List.append path [ "Regex" ]) v);
    ]

let configuration_option_descriptions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    configuration_option_description_to_query path xs

let configuration_options_description_to_query path (x : configuration_options_description) =
  List.concat
    [
      (match x.solution_stack_name with
      | None -> []
      | Some v -> solution_stack_name_to_query (List.append path [ "SolutionStackName" ]) v);
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
      (match x.options with
      | None -> []
      | Some v -> configuration_option_descriptions_list_to_query (List.append path [ "Options" ]) v);
    ]

let describe_configuration_options_message_to_query path
    (x : describe_configuration_options_message) =
  List.concat
    [
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> configuration_template_name_to_query (List.append path [ "TemplateName" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.solution_stack_name with
      | None -> []
      | Some v -> solution_stack_name_to_query (List.append path [ "SolutionStackName" ]) v);
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
      (match x.options with
      | None -> []
      | Some v -> options_specifier_list_to_query (List.append path [ "Options" ]) v);
    ]

let application_version_description_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    application_version_description_to_query path xs

let application_version_descriptions_message_to_query path
    (x : application_version_descriptions_message) =
  List.concat
    [
      (match x.application_versions with
      | None -> []
      | Some v ->
          application_version_description_list_to_query
            (List.append path [ "ApplicationVersions" ])
            v);
      (match x.next_token with
      | None -> []
      | Some v -> token_to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_application_versions_message_to_query path (x : describe_application_versions_message)
    =
  List.concat
    [
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.version_labels with
      | None -> []
      | Some v -> version_labels_list_to_query (List.append path [ "VersionLabels" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> token_to_query (List.append path [ "NextToken" ]) v);
    ]

let application_description_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" application_description_to_query
    path xs

let application_descriptions_message_to_query path (x : application_descriptions_message) =
  List.concat
    [
      (match x.applications with
      | None -> []
      | Some v -> application_description_list_to_query (List.append path [ "Applications" ]) v);
    ]

let application_names_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" application_name_to_query path xs

let describe_applications_message_to_query path (x : describe_applications_message) =
  List.concat
    [
      (match x.application_names with
      | None -> []
      | Some v -> application_names_list_to_query (List.append path [ "ApplicationNames" ]) v);
    ]

let resource_quota_to_query path (x : resource_quota) =
  List.concat
    [
      (match x.maximum with
      | None -> []
      | Some v -> boxed_int_to_query (List.append path [ "Maximum" ]) v);
    ]

let resource_quotas_to_query path (x : resource_quotas) =
  List.concat
    [
      (match x.application_quota with
      | None -> []
      | Some v -> resource_quota_to_query (List.append path [ "ApplicationQuota" ]) v);
      (match x.application_version_quota with
      | None -> []
      | Some v -> resource_quota_to_query (List.append path [ "ApplicationVersionQuota" ]) v);
      (match x.environment_quota with
      | None -> []
      | Some v -> resource_quota_to_query (List.append path [ "EnvironmentQuota" ]) v);
      (match x.configuration_template_quota with
      | None -> []
      | Some v -> resource_quota_to_query (List.append path [ "ConfigurationTemplateQuota" ]) v);
      (match x.custom_platform_quota with
      | None -> []
      | Some v -> resource_quota_to_query (List.append path [ "CustomPlatformQuota" ]) v);
    ]

let describe_account_attributes_result_to_query path (x : describe_account_attributes_result) =
  List.concat
    [
      (match x.resource_quotas with
      | None -> []
      | Some v -> resource_quotas_to_query (List.append path [ "ResourceQuotas" ]) v);
    ]

let platform_version_still_referenced_exception_to_query path
    (x : platform_version_still_referenced_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_platform_version_result_to_query path (x : delete_platform_version_result) =
  List.concat
    [
      (match x.platform_summary with
      | None -> []
      | Some v -> platform_summary_to_query (List.append path [ "PlatformSummary" ]) v);
    ]

let delete_platform_version_request_to_query path (x : delete_platform_version_request) =
  List.concat
    [
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
    ]

let delete_environment_configuration_message_to_query path
    (x : delete_environment_configuration_message) =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      environment_name_to_query (List.append path [ "EnvironmentName" ]) x.environment_name;
    ]

let delete_configuration_template_message_to_query path (x : delete_configuration_template_message)
    =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      configuration_template_name_to_query (List.append path [ "TemplateName" ]) x.template_name;
    ]

let source_bundle_deletion_exception_to_query path (x : source_bundle_deletion_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let s3_location_not_in_service_region_exception_to_query path
    (x : s3_location_not_in_service_region_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_source_bundle_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let delete_application_version_message_to_query path (x : delete_application_version_message) =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      version_label_to_query (List.append path [ "VersionLabel" ]) x.version_label;
      (match x.delete_source_bundle with
      | None -> []
      | Some v -> delete_source_bundle_to_query (List.append path [ "DeleteSourceBundle" ]) v);
    ]

let terminate_env_force_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let delete_application_message_to_query path (x : delete_application_message) =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      (match x.terminate_env_by_force with
      | None -> []
      | Some v -> terminate_env_force_to_query (List.append path [ "TerminateEnvByForce" ]) v);
    ]

let s3_subscription_required_exception_to_query path (x : s3_subscription_required_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_storage_location_result_message_to_query path
    (x : create_storage_location_result_message) =
  List.concat
    [
      (match x.s3_bucket with
      | None -> []
      | Some v -> s3_bucket_to_query (List.append path [ "S3Bucket" ]) v);
    ]

let too_many_platforms_exception_to_query path (x : too_many_platforms_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let builder_to_query path (x : builder) =
  List.concat
    [ (match x.ar_n with None -> [] | Some v -> ar_n_to_query (List.append path [ "ARN" ]) v) ]

let create_platform_version_result_to_query path (x : create_platform_version_result) =
  List.concat
    [
      (match x.platform_summary with
      | None -> []
      | Some v -> platform_summary_to_query (List.append path [ "PlatformSummary" ]) v);
      (match x.builder with
      | None -> []
      | Some v -> builder_to_query (List.append path [ "Builder" ]) v);
    ]

let tags_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let create_platform_version_request_to_query path (x : create_platform_version_request) =
  List.concat
    [
      platform_name_to_query (List.append path [ "PlatformName" ]) x.platform_name;
      platform_version_to_query (List.append path [ "PlatformVersion" ]) x.platform_version;
      s3_location_to_query
        (List.append path [ "PlatformDefinitionBundle" ])
        x.platform_definition_bundle;
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.option_settings with
      | None -> []
      | Some v ->
          configuration_option_settings_list_to_query (List.append path [ "OptionSettings" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
    ]

let too_many_environments_exception_to_query path (x : too_many_environments_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let dns_cname_prefix_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let create_environment_message_to_query path (x : create_environment_message) =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.group_name with
      | None -> []
      | Some v -> group_name_to_query (List.append path [ "GroupName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.cname_prefix with
      | None -> []
      | Some v -> dns_cname_prefix_to_query (List.append path [ "CNAMEPrefix" ]) v);
      (match x.tier with
      | None -> []
      | Some v -> environment_tier_to_query (List.append path [ "Tier" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
      (match x.version_label with
      | None -> []
      | Some v -> version_label_to_query (List.append path [ "VersionLabel" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> configuration_template_name_to_query (List.append path [ "TemplateName" ]) v);
      (match x.solution_stack_name with
      | None -> []
      | Some v -> solution_stack_name_to_query (List.append path [ "SolutionStackName" ]) v);
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
      (match x.option_settings with
      | None -> []
      | Some v ->
          configuration_option_settings_list_to_query (List.append path [ "OptionSettings" ]) v);
      (match x.options_to_remove with
      | None -> []
      | Some v -> options_specifier_list_to_query (List.append path [ "OptionsToRemove" ]) v);
      (match x.operations_role with
      | None -> []
      | Some v -> operations_role_to_query (List.append path [ "OperationsRole" ]) v);
    ]

let too_many_configuration_templates_exception_to_query path
    (x : too_many_configuration_templates_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let source_configuration_to_query path (x : source_configuration) =
  List.concat
    [
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.template_name with
      | None -> []
      | Some v -> configuration_template_name_to_query (List.append path [ "TemplateName" ]) v);
    ]

let create_configuration_template_message_to_query path (x : create_configuration_template_message)
    =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      configuration_template_name_to_query (List.append path [ "TemplateName" ]) x.template_name;
      (match x.solution_stack_name with
      | None -> []
      | Some v -> solution_stack_name_to_query (List.append path [ "SolutionStackName" ]) v);
      (match x.platform_arn with
      | None -> []
      | Some v -> platform_arn_to_query (List.append path [ "PlatformArn" ]) v);
      (match x.source_configuration with
      | None -> []
      | Some v -> source_configuration_to_query (List.append path [ "SourceConfiguration" ]) v);
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.option_settings with
      | None -> []
      | Some v ->
          configuration_option_settings_list_to_query (List.append path [ "OptionSettings" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
    ]

let too_many_application_versions_exception_to_query path
    (x : too_many_application_versions_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let too_many_applications_exception_to_query path (x : too_many_applications_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let code_build_not_in_service_region_exception_to_query path
    (x : code_build_not_in_service_region_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let application_version_proccess_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let auto_create_application_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let non_empty_string_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let compute_type_to_query path (x : compute_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | BUILD_GENERAL1_SMALL -> "BUILD_GENERAL1_SMALL"
    | BUILD_GENERAL1_MEDIUM -> "BUILD_GENERAL1_MEDIUM"
    | BUILD_GENERAL1_LARGE -> "BUILD_GENERAL1_LARGE")

let build_configuration_to_query path (x : build_configuration) =
  List.concat
    [
      (match x.artifact_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ArtifactName" ]) v);
      non_empty_string_to_query
        (List.append path [ "CodeBuildServiceRole" ])
        x.code_build_service_role;
      (match x.compute_type with
      | None -> []
      | Some v -> compute_type_to_query (List.append path [ "ComputeType" ]) v);
      non_empty_string_to_query (List.append path [ "Image" ]) x.image;
      (match x.timeout_in_minutes with
      | None -> []
      | Some v -> boxed_int_to_query (List.append path [ "TimeoutInMinutes" ]) v);
    ]

let create_application_version_message_to_query path (x : create_application_version_message) =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      version_label_to_query (List.append path [ "VersionLabel" ]) x.version_label;
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.source_build_information with
      | None -> []
      | Some v ->
          source_build_information_to_query (List.append path [ "SourceBuildInformation" ]) v);
      (match x.source_bundle with
      | None -> []
      | Some v -> s3_location_to_query (List.append path [ "SourceBundle" ]) v);
      (match x.build_configuration with
      | None -> []
      | Some v -> build_configuration_to_query (List.append path [ "BuildConfiguration" ]) v);
      (match x.auto_create_application with
      | None -> []
      | Some v -> auto_create_application_to_query (List.append path [ "AutoCreateApplication" ]) v);
      (match x.process with
      | None -> []
      | Some v -> application_version_proccess_to_query (List.append path [ "Process" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
    ]

let create_application_message_to_query path (x : create_application_message) =
  List.concat
    [
      application_name_to_query (List.append path [ "ApplicationName" ]) x.application_name;
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.resource_lifecycle_config with
      | None -> []
      | Some v ->
          application_resource_lifecycle_config_to_query
            (List.append path [ "ResourceLifecycleConfig" ])
            v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
    ]

let version_labels_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" version_label_to_query path xs

let compose_environments_message_to_query path (x : compose_environments_message) =
  List.concat
    [
      (match x.application_name with
      | None -> []
      | Some v -> application_name_to_query (List.append path [ "ApplicationName" ]) v);
      (match x.group_name with
      | None -> []
      | Some v -> group_name_to_query (List.append path [ "GroupName" ]) v);
      (match x.version_labels with
      | None -> []
      | Some v -> version_labels_to_query (List.append path [ "VersionLabels" ]) v);
    ]

let cname_availability_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let check_dns_availability_result_message_to_query path (x : check_dns_availability_result_message)
    =
  List.concat
    [
      (match x.available with
      | None -> []
      | Some v -> cname_availability_to_query (List.append path [ "Available" ]) v);
      (match x.fully_qualified_cnam_e with
      | None -> []
      | Some v -> dns_cname_to_query (List.append path [ "FullyQualifiedCNAME" ]) v);
    ]

let check_dns_availability_message_to_query path (x : check_dns_availability_message) =
  List.concat [ dns_cname_prefix_to_query (List.append path [ "CNAMEPrefix" ]) x.cname_prefix ]

let associate_environment_operations_role_message_to_query path
    (x : associate_environment_operations_role_message) =
  List.concat
    [
      environment_name_to_query (List.append path [ "EnvironmentName" ]) x.environment_name;
      operations_role_to_query (List.append path [ "OperationsRole" ]) x.operations_role;
    ]

let managed_action_invalid_state_exception_to_query path
    (x : managed_action_invalid_state_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let apply_environment_managed_action_result_to_query path
    (x : apply_environment_managed_action_result) =
  List.concat
    [
      (match x.action_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ActionId" ]) v);
      (match x.action_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ActionDescription" ]) v);
      (match x.action_type with
      | None -> []
      | Some v -> action_type_to_query (List.append path [ "ActionType" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
    ]

let apply_environment_managed_action_request_to_query path
    (x : apply_environment_managed_action_request) =
  List.concat
    [
      (match x.environment_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EnvironmentName" ]) v);
      (match x.environment_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EnvironmentId" ]) v);
      string__to_query (List.append path [ "ActionId" ]) x.action_id;
    ]

let abort_environment_update_message_to_query path (x : abort_environment_update_message) =
  List.concat
    [
      (match x.environment_id with
      | None -> []
      | Some v -> environment_id_to_query (List.append path [ "EnvironmentId" ]) v);
      (match x.environment_name with
      | None -> []
      | Some v -> environment_name_to_query (List.append path [ "EnvironmentName" ]) v);
    ]
