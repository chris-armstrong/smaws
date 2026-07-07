open Types

let resource_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_type_to_query path xs

let warnings_to_query path (x : warnings) =
  List.concat
    [
      (match x.unrecognized_resource_types with
      | None -> []
      | Some v -> resource_types_to_query (List.append path [ "UnrecognizedResourceTypes" ]) v);
    ]

let warning_type_to_query path (x : warning_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | EXCLUDED_RESOURCES -> "EXCLUDED_RESOURCES"
    | EXCLUDED_PROPERTIES -> "EXCLUDED_PROPERTIES"
    | MUTUALLY_EXCLUSIVE_TYPES -> "MUTUALLY_EXCLUSIVE_TYPES"
    | UNSUPPORTED_PROPERTIES -> "UNSUPPORTED_PROPERTIES"
    | MUTUALLY_EXCLUSIVE_PROPERTIES -> "MUTUALLY_EXCLUSIVE_PROPERTIES")

let property_path_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let required_property_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let property_description_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let warning_property_to_query path (x : warning_property) =
  List.concat
    [
      (match x.description with
      | None -> []
      | Some v -> property_description_to_query (List.append path [ "Description" ]) v);
      (match x.required with
      | None -> []
      | Some v -> required_property_to_query (List.append path [ "Required" ]) v);
      (match x.property_path with
      | None -> []
      | Some v -> property_path_to_query (List.append path [ "PropertyPath" ]) v);
    ]

let warning_properties_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" warning_property_to_query path xs

let warning_detail_to_query path (x : warning_detail) =
  List.concat
    [
      (match x.properties with
      | None -> []
      | Some v -> warning_properties_to_query (List.append path [ "Properties" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> warning_type_to_query (List.append path [ "Type" ]) v);
    ]

let warning_details_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" warning_detail_to_query path xs

let visibility_to_query path (x : visibility) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with PRIVATE -> "PRIVATE" | PUBLIC -> "PUBLIC")

let version_bump_to_query path (x : version_bump) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with MINOR -> "MINOR" | MAJOR -> "MAJOR")

let version_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let validation_status_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let validation_status_to_query path (x : validation_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SKIPPED -> "SKIPPED" | FAILED -> "FAILED")

let validation_path_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let validation_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let parameter_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let parameter_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let no_echo_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let description_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let template_parameter_to_query path (x : template_parameter) =
  List.concat
    [
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.no_echo with
      | None -> []
      | Some v -> no_echo_to_query (List.append path [ "NoEcho" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> parameter_value_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.parameter_key with
      | None -> []
      | Some v -> parameter_key_to_query (List.append path [ "ParameterKey" ]) v);
    ]

let template_parameters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" template_parameter_to_query path xs

let capability_to_query path (x : capability) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | CAPABILITY_AUTO_EXPAND -> "CAPABILITY_AUTO_EXPAND"
    | CAPABILITY_NAMED_IAM -> "CAPABILITY_NAMED_IAM"
    | CAPABILITY_IAM -> "CAPABILITY_IAM")

let capabilities_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" capability_to_query path xs

let capabilities_reason_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let transform_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let transforms_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" transform_name_to_query path xs

let validate_template_output_to_query path (x : validate_template_output) =
  List.concat
    [
      (match x.declared_transforms with
      | None -> []
      | Some v -> transforms_list_to_query (List.append path [ "DeclaredTransforms" ]) v);
      (match x.capabilities_reason with
      | None -> []
      | Some v -> capabilities_reason_to_query (List.append path [ "CapabilitiesReason" ]) v);
      (match x.capabilities with
      | None -> []
      | Some v -> capabilities_to_query (List.append path [ "Capabilities" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> template_parameters_to_query (List.append path [ "Parameters" ]) v);
    ]

let template_body_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let template_ur_l_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let validate_template_input_to_query path (x : validate_template_input) =
  List.concat
    [
      (match x.template_ur_l with
      | None -> []
      | Some v -> template_ur_l_to_query (List.append path [ "TemplateURL" ]) v);
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
    ]

let use_previous_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let use_previous_template_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let url_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let stack_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_termination_protection_output_to_query path (x : update_termination_protection_output) =
  List.concat
    [
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
    ]

let enable_termination_protection_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let stack_name_or_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_termination_protection_input_to_query path (x : update_termination_protection_input) =
  List.concat
    [
      stack_name_or_id_to_query (List.append path [ "StackName" ]) x.stack_name;
      enable_termination_protection_to_query
        (List.append path [ "EnableTerminationProtection" ])
        x.enable_termination_protection;
    ]

let client_request_token_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_stack_set_output_to_query path (x : update_stack_set_output) =
  List.concat
    [
      (match x.operation_id with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
    ]

let stack_set_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let parameter_to_query path (x : parameter) =
  List.concat
    [
      (match x.resolved_value with
      | None -> []
      | Some v -> parameter_value_to_query (List.append path [ "ResolvedValue" ]) v);
      (match x.use_previous_value with
      | None -> []
      | Some v -> use_previous_value_to_query (List.append path [ "UsePreviousValue" ]) v);
      (match x.parameter_value with
      | None -> []
      | Some v -> parameter_value_to_query (List.append path [ "ParameterValue" ]) v);
      (match x.parameter_key with
      | None -> []
      | Some v -> parameter_key_to_query (List.append path [ "ParameterKey" ]) v);
    ]

let parameters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" parameter_to_query path xs

let tag_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let tag_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_to_query path (x : tag) =
  List.concat
    [
      tag_value_to_query (List.append path [ "Value" ]) x.value;
      tag_key_to_query (List.append path [ "Key" ]) x.key;
    ]

let tags_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let region_concurrency_type_to_query path (x : region_concurrency_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with PARALLEL -> "PARALLEL" | SEQUENTIAL -> "SEQUENTIAL")

let region_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let region_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" region_to_query path xs

let failure_tolerance_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let failure_tolerance_percentage_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let max_concurrent_count_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let max_concurrent_percentage_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let concurrency_mode_to_query path (x : concurrency_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | SOFT_FAILURE_TOLERANCE -> "SOFT_FAILURE_TOLERANCE"
    | STRICT_FAILURE_TOLERANCE -> "STRICT_FAILURE_TOLERANCE")

let stack_set_operation_preferences_to_query path (x : stack_set_operation_preferences) =
  List.concat
    [
      (match x.concurrency_mode with
      | None -> []
      | Some v -> concurrency_mode_to_query (List.append path [ "ConcurrencyMode" ]) v);
      (match x.max_concurrent_percentage with
      | None -> []
      | Some v ->
          max_concurrent_percentage_to_query (List.append path [ "MaxConcurrentPercentage" ]) v);
      (match x.max_concurrent_count with
      | None -> []
      | Some v -> max_concurrent_count_to_query (List.append path [ "MaxConcurrentCount" ]) v);
      (match x.failure_tolerance_percentage with
      | None -> []
      | Some v ->
          failure_tolerance_percentage_to_query
            (List.append path [ "FailureTolerancePercentage" ])
            v);
      (match x.failure_tolerance_count with
      | None -> []
      | Some v -> failure_tolerance_count_to_query (List.append path [ "FailureToleranceCount" ]) v);
      (match x.region_order with
      | None -> []
      | Some v -> region_list_to_query (List.append path [ "RegionOrder" ]) v);
      (match x.region_concurrency_type with
      | None -> []
      | Some v -> region_concurrency_type_to_query (List.append path [ "RegionConcurrencyType" ]) v);
    ]

let role_ar_n_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let execution_role_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let account_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let account_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" account_to_query path xs

let accounts_url_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let organizational_unit_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let organizational_unit_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" organizational_unit_id_to_query path
    xs

let account_filter_type_to_query path (x : account_filter_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | UNION -> "UNION"
    | DIFFERENCE -> "DIFFERENCE"
    | INTERSECTION -> "INTERSECTION"
    | NONE -> "NONE")

let deployment_targets_to_query path (x : deployment_targets) =
  List.concat
    [
      (match x.account_filter_type with
      | None -> []
      | Some v -> account_filter_type_to_query (List.append path [ "AccountFilterType" ]) v);
      (match x.organizational_unit_ids with
      | None -> []
      | Some v ->
          organizational_unit_id_list_to_query (List.append path [ "OrganizationalUnitIds" ]) v);
      (match x.accounts_url with
      | None -> []
      | Some v -> accounts_url_to_query (List.append path [ "AccountsUrl" ]) v);
      (match x.accounts with
      | None -> []
      | Some v -> account_list_to_query (List.append path [ "Accounts" ]) v);
    ]

let permission_models_to_query path (x : permission_models) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SELF_MANAGED -> "SELF_MANAGED" | SERVICE_MANAGED -> "SERVICE_MANAGED")

let auto_deployment_nullable_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let retain_stacks_on_account_removal_nullable_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let stack_set_ar_n_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_set_arn_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_set_ar_n_to_query path xs

let auto_deployment_to_query path (x : auto_deployment) =
  List.concat
    [
      (match x.depends_on with
      | None -> []
      | Some v -> stack_set_arn_list_to_query (List.append path [ "DependsOn" ]) v);
      (match x.retain_stacks_on_account_removal with
      | None -> []
      | Some v ->
          retain_stacks_on_account_removal_nullable_to_query
            (List.append path [ "RetainStacksOnAccountRemoval" ])
            v);
      (match x.enabled with
      | None -> []
      | Some v -> auto_deployment_nullable_to_query (List.append path [ "Enabled" ]) v);
    ]

let call_as_to_query path (x : call_as) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DELEGATED_ADMIN -> "DELEGATED_ADMIN" | SELF -> "SELF")

let managed_execution_nullable_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let managed_execution_to_query path (x : managed_execution) =
  List.concat
    [
      (match x.active with
      | None -> []
      | Some v -> managed_execution_nullable_to_query (List.append path [ "Active" ]) v);
    ]

let update_stack_set_input_to_query path (x : update_stack_set_input) =
  List.concat
    [
      (match x.managed_execution with
      | None -> []
      | Some v -> managed_execution_to_query (List.append path [ "ManagedExecution" ]) v);
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.regions with
      | None -> []
      | Some v -> region_list_to_query (List.append path [ "Regions" ]) v);
      (match x.accounts with
      | None -> []
      | Some v -> account_list_to_query (List.append path [ "Accounts" ]) v);
      (match x.operation_id with
      | None ->
          client_request_token_to_query
            (List.append path [ "OperationId" ])
            (Smaws_Lib.Uuid.generate ())
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
      (match x.auto_deployment with
      | None -> []
      | Some v -> auto_deployment_to_query (List.append path [ "AutoDeployment" ]) v);
      (match x.permission_model with
      | None -> []
      | Some v -> permission_models_to_query (List.append path [ "PermissionModel" ]) v);
      (match x.deployment_targets with
      | None -> []
      | Some v -> deployment_targets_to_query (List.append path [ "DeploymentTargets" ]) v);
      (match x.execution_role_name with
      | None -> []
      | Some v -> execution_role_name_to_query (List.append path [ "ExecutionRoleName" ]) v);
      (match x.administration_role_ar_n with
      | None -> []
      | Some v -> role_ar_n_to_query (List.append path [ "AdministrationRoleARN" ]) v);
      (match x.operation_preferences with
      | None -> []
      | Some v ->
          stack_set_operation_preferences_to_query (List.append path [ "OperationPreferences" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
      (match x.capabilities with
      | None -> []
      | Some v -> capabilities_to_query (List.append path [ "Capabilities" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "Parameters" ]) v);
      (match x.use_previous_template with
      | None -> []
      | Some v -> use_previous_template_to_query (List.append path [ "UsePreviousTemplate" ]) v);
      (match x.template_ur_l with
      | None -> []
      | Some v -> template_ur_l_to_query (List.append path [ "TemplateURL" ]) v);
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let error_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stale_request_exception_to_query path (x : stale_request_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let stack_set_not_found_exception_to_query path (x : stack_set_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let stack_instance_not_found_exception_to_query path (x : stack_instance_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let operation_in_progress_exception_to_query path (x : operation_in_progress_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let operation_id_already_exists_exception_to_query path (x : operation_id_already_exists_exception)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_operation_exception_to_query path (x : invalid_operation_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let operation_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_stack_output_to_query path (x : update_stack_output) =
  List.concat
    [
      (match x.operation_id with
      | None -> []
      | Some v -> operation_id_to_query (List.append path [ "OperationId" ]) v);
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
    ]

let update_stack_instances_output_to_query path (x : update_stack_instances_output) =
  List.concat
    [
      (match x.operation_id with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
    ]

let stack_set_name_or_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_stack_instances_input_to_query path (x : update_stack_instances_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.operation_id with
      | None ->
          client_request_token_to_query
            (List.append path [ "OperationId" ])
            (Smaws_Lib.Uuid.generate ())
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
      (match x.operation_preferences with
      | None -> []
      | Some v ->
          stack_set_operation_preferences_to_query (List.append path [ "OperationPreferences" ]) v);
      (match x.parameter_overrides with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "ParameterOverrides" ]) v);
      region_list_to_query (List.append path [ "Regions" ]) x.regions;
      (match x.deployment_targets with
      | None -> []
      | Some v -> deployment_targets_to_query (List.append path [ "DeploymentTargets" ]) v);
      (match x.accounts with
      | None -> []
      | Some v -> account_list_to_query (List.append path [ "Accounts" ]) v);
      stack_set_name_or_id_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let stack_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_policy_during_update_body_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_policy_during_update_ur_l_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let type__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let rollback_trigger_to_query path (x : rollback_trigger) =
  List.concat
    [
      type__to_query (List.append path [ "Type" ]) x.type_;
      arn_to_query (List.append path [ "Arn" ]) x.arn;
    ]

let rollback_triggers_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" rollback_trigger_to_query path xs

let monitoring_time_in_minutes_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let rollback_configuration_to_query path (x : rollback_configuration) =
  List.concat
    [
      (match x.monitoring_time_in_minutes with
      | None -> []
      | Some v ->
          monitoring_time_in_minutes_to_query (List.append path [ "MonitoringTimeInMinutes" ]) v);
      (match x.rollback_triggers with
      | None -> []
      | Some v -> rollback_triggers_to_query (List.append path [ "RollbackTriggers" ]) v);
    ]

let stack_policy_body_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let stack_policy_ur_l_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let notification_ar_n_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let notification_ar_ns_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" notification_ar_n_to_query path xs

let disable_rollback_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let retain_except_on_create_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let deployment_config_mode_to_query path (x : deployment_config_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with EXPRESS -> "EXPRESS" | STANDARD -> "STANDARD")

let deployment_config_to_query path (x : deployment_config) =
  List.concat
    [
      (match x.disable_rollback with
      | None -> []
      | Some v -> disable_rollback_to_query (List.append path [ "DisableRollback" ]) v);
      (match x.mode with
      | None -> []
      | Some v -> deployment_config_mode_to_query (List.append path [ "Mode" ]) v);
    ]

let disable_validation_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let update_stack_input_to_query path (x : update_stack_input) =
  List.concat
    [
      (match x.disable_validation with
      | None -> []
      | Some v -> disable_validation_to_query (List.append path [ "DisableValidation" ]) v);
      (match x.deployment_config with
      | None -> []
      | Some v -> deployment_config_to_query (List.append path [ "DeploymentConfig" ]) v);
      (match x.retain_except_on_create with
      | None -> []
      | Some v -> retain_except_on_create_to_query (List.append path [ "RetainExceptOnCreate" ]) v);
      (match x.client_request_token with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      (match x.disable_rollback with
      | None -> []
      | Some v -> disable_rollback_to_query (List.append path [ "DisableRollback" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
      (match x.notification_ar_ns with
      | None -> []
      | Some v -> notification_ar_ns_to_query (List.append path [ "NotificationARNs" ]) v);
      (match x.stack_policy_ur_l with
      | None -> []
      | Some v -> stack_policy_ur_l_to_query (List.append path [ "StackPolicyURL" ]) v);
      (match x.stack_policy_body with
      | None -> []
      | Some v -> stack_policy_body_to_query (List.append path [ "StackPolicyBody" ]) v);
      (match x.rollback_configuration with
      | None -> []
      | Some v -> rollback_configuration_to_query (List.append path [ "RollbackConfiguration" ]) v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> role_ar_n_to_query (List.append path [ "RoleARN" ]) v);
      (match x.resource_types with
      | None -> []
      | Some v -> resource_types_to_query (List.append path [ "ResourceTypes" ]) v);
      (match x.capabilities with
      | None -> []
      | Some v -> capabilities_to_query (List.append path [ "Capabilities" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "Parameters" ]) v);
      (match x.stack_policy_during_update_ur_l with
      | None -> []
      | Some v ->
          stack_policy_during_update_ur_l_to_query
            (List.append path [ "StackPolicyDuringUpdateURL" ])
            v);
      (match x.stack_policy_during_update_body with
      | None -> []
      | Some v ->
          stack_policy_during_update_body_to_query
            (List.append path [ "StackPolicyDuringUpdateBody" ])
            v);
      (match x.use_previous_template with
      | None -> []
      | Some v -> use_previous_template_to_query (List.append path [ "UsePreviousTemplate" ]) v);
      (match x.template_ur_l with
      | None -> []
      | Some v -> template_ur_l_to_query (List.append path [ "TemplateURL" ]) v);
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let token_already_exists_exception_to_query path (x : token_already_exists_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let insufficient_capabilities_exception_to_query path (x : insufficient_capabilities_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let generated_template_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_generated_template_output_to_query path (x : update_generated_template_output) =
  List.concat
    [
      (match x.generated_template_id with
      | None -> []
      | Some v -> generated_template_id_to_query (List.append path [ "GeneratedTemplateId" ]) v);
    ]

let generated_template_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let logical_resource_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_identifier_property_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_identifier_property_key_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_identifier_properties_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    resource_identifier_property_key_to_query resource_identifier_property_value_to_query path pairs

let resource_definition_to_query path (x : resource_definition) =
  List.concat
    [
      resource_identifier_properties_to_query
        (List.append path [ "ResourceIdentifier" ])
        x.resource_identifier;
      (match x.logical_resource_id with
      | None -> []
      | Some v -> logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) v);
      resource_type_to_query (List.append path [ "ResourceType" ]) x.resource_type;
    ]

let resource_definitions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_definition_to_query path xs

let jazz_logical_resource_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" logical_resource_id_to_query path xs

let refresh_all_resources_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let generated_template_deletion_policy_to_query path (x : generated_template_deletion_policy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with RETAIN -> "RETAIN" | DELETE -> "DELETE")

let generated_template_update_replace_policy_to_query path
    (x : generated_template_update_replace_policy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with RETAIN -> "RETAIN" | DELETE -> "DELETE")

let template_configuration_to_query path (x : template_configuration) =
  List.concat
    [
      (match x.update_replace_policy with
      | None -> []
      | Some v ->
          generated_template_update_replace_policy_to_query
            (List.append path [ "UpdateReplacePolicy" ])
            v);
      (match x.deletion_policy with
      | None -> []
      | Some v ->
          generated_template_deletion_policy_to_query (List.append path [ "DeletionPolicy" ]) v);
    ]

let update_generated_template_input_to_query path (x : update_generated_template_input) =
  List.concat
    [
      (match x.template_configuration with
      | None -> []
      | Some v -> template_configuration_to_query (List.append path [ "TemplateConfiguration" ]) v);
      (match x.refresh_all_resources with
      | None -> []
      | Some v -> refresh_all_resources_to_query (List.append path [ "RefreshAllResources" ]) v);
      (match x.remove_resources with
      | None -> []
      | Some v -> jazz_logical_resource_ids_to_query (List.append path [ "RemoveResources" ]) v);
      (match x.add_resources with
      | None -> []
      | Some v -> resource_definitions_to_query (List.append path [ "AddResources" ]) v);
      (match x.new_generated_template_name with
      | None -> []
      | Some v ->
          generated_template_name_to_query (List.append path [ "NewGeneratedTemplateName" ]) v);
      generated_template_name_to_query
        (List.append path [ "GeneratedTemplateName" ])
        x.generated_template_name;
    ]

let limit_exceeded_exception_to_query path (x : limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let generated_template_not_found_exception_to_query path
    (x : generated_template_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let already_exists_exception_to_query path (x : already_exists_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let type_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let type_configuration_alias_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let type_configuration_arn_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let third_party_type_to_query path (x : third_party_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with HOOK -> "HOOK" | MODULE -> "MODULE" | RESOURCE -> "RESOURCE")

let type_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let type_configuration_identifier_to_query path (x : type_configuration_identifier) =
  List.concat
    [
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> third_party_type_to_query (List.append path [ "Type" ]) v);
      (match x.type_configuration_arn with
      | None -> []
      | Some v -> type_configuration_arn_to_query (List.append path [ "TypeConfigurationArn" ]) v);
      (match x.type_configuration_alias with
      | None -> []
      | Some v ->
          type_configuration_alias_to_query (List.append path [ "TypeConfigurationAlias" ]) v);
      (match x.type_arn with
      | None -> []
      | Some v -> type_arn_to_query (List.append path [ "TypeArn" ]) v);
    ]

let unprocessed_type_configurations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    type_configuration_identifier_to_query path xs

let registry_type_to_query path (x : registry_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with HOOK -> "HOOK" | MODULE -> "MODULE" | RESOURCE -> "RESOURCE")

let type_version_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let is_default_version_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let timestamp_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let public_version_number_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let type_version_summary_to_query path (x : type_version_summary) =
  List.concat
    [
      (match x.public_version_number with
      | None -> []
      | Some v -> public_version_number_to_query (List.append path [ "PublicVersionNumber" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.time_created with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "TimeCreated" ]) v);
      (match x.arn with None -> [] | Some v -> type_arn_to_query (List.append path [ "Arn" ]) v);
      (match x.is_default_version with
      | None -> []
      | Some v -> is_default_version_to_query (List.append path [ "IsDefaultVersion" ]) v);
      (match x.version_id with
      | None -> []
      | Some v -> type_version_id_to_query (List.append path [ "VersionId" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> registry_type_to_query (List.append path [ "Type" ]) v);
    ]

let type_version_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" type_version_summary_to_query path
    xs

let type_tests_status_description_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let type_tests_status_to_query path (x : type_tests_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NOT_TESTED -> "NOT_TESTED"
    | IN_PROGRESS -> "IN_PROGRESS"
    | FAILED -> "FAILED"
    | PASSED -> "PASSED")

let publisher_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let identity_provider_to_query path (x : identity_provider) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Bitbucket -> "Bitbucket"
    | GitHub -> "GitHub"
    | AWS_Marketplace -> "AWS_Marketplace")

let publisher_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let is_activated_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let type_summary_to_query path (x : type_summary) =
  List.concat
    [
      (match x.is_activated with
      | None -> []
      | Some v -> is_activated_to_query (List.append path [ "IsActivated" ]) v);
      (match x.publisher_name with
      | None -> []
      | Some v -> publisher_name_to_query (List.append path [ "PublisherName" ]) v);
      (match x.publisher_identity with
      | None -> []
      | Some v -> identity_provider_to_query (List.append path [ "PublisherIdentity" ]) v);
      (match x.latest_public_version with
      | None -> []
      | Some v -> public_version_number_to_query (List.append path [ "LatestPublicVersion" ]) v);
      (match x.public_version_number with
      | None -> []
      | Some v -> public_version_number_to_query (List.append path [ "PublicVersionNumber" ]) v);
      (match x.original_type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "OriginalTypeName" ]) v);
      (match x.publisher_id with
      | None -> []
      | Some v -> publisher_id_to_query (List.append path [ "PublisherId" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.last_updated with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastUpdated" ]) v);
      (match x.type_arn with
      | None -> []
      | Some v -> type_arn_to_query (List.append path [ "TypeArn" ]) v);
      (match x.default_version_id with
      | None -> []
      | Some v -> type_version_id_to_query (List.append path [ "DefaultVersionId" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> registry_type_to_query (List.append path [ "Type" ]) v);
    ]

let type_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" type_summary_to_query path xs

let type_schema_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let type_not_found_exception_to_query path (x : type_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let type_name_prefix_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let type_hierarchy_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let category_to_query path (x : category) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | AWS_TYPES -> "AWS_TYPES"
    | THIRD_PARTY -> "THIRD_PARTY"
    | ACTIVATED -> "ACTIVATED"
    | REGISTERED -> "REGISTERED")

let type_filters_to_query path (x : type_filters) =
  List.concat
    [
      (match x.type_name_prefix with
      | None -> []
      | Some v -> type_name_prefix_to_query (List.append path [ "TypeNamePrefix" ]) v);
      (match x.publisher_id with
      | None -> []
      | Some v -> publisher_id_to_query (List.append path [ "PublisherId" ]) v);
      (match x.category with
      | None -> []
      | Some v -> category_to_query (List.append path [ "Category" ]) v);
    ]

let type_configuration_not_found_exception_to_query path
    (x : type_configuration_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let type_configuration_identifiers_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    type_configuration_identifier_to_query path xs

let type_configuration_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let is_default_configuration_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let type_configuration_details_to_query path (x : type_configuration_details) =
  List.concat
    [
      (match x.is_default_configuration with
      | None -> []
      | Some v ->
          is_default_configuration_to_query (List.append path [ "IsDefaultConfiguration" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.type_arn with
      | None -> []
      | Some v -> type_arn_to_query (List.append path [ "TypeArn" ]) v);
      (match x.last_updated with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastUpdated" ]) v);
      (match x.configuration with
      | None -> []
      | Some v -> type_configuration_to_query (List.append path [ "Configuration" ]) v);
      (match x.alias with
      | None -> []
      | Some v -> type_configuration_alias_to_query (List.append path [ "Alias" ]) v);
      (match x.arn with
      | None -> []
      | Some v -> type_configuration_arn_to_query (List.append path [ "Arn" ]) v);
    ]

let type_configuration_details_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" type_configuration_details_to_query
    path xs

let treat_unrecognized_resource_types_as_warnings_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let total_warnings_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let total_stack_instances_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let timeout_minutes_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let third_party_type_arn_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let test_type_output_to_query path (x : test_type_output) =
  List.concat
    [
      (match x.type_version_arn with
      | None -> []
      | Some v -> type_arn_to_query (List.append path [ "TypeVersionArn" ]) v);
    ]

let s3_bucket_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let test_type_input_to_query path (x : test_type_input) =
  List.concat
    [
      (match x.log_delivery_bucket with
      | None -> []
      | Some v -> s3_bucket_to_query (List.append path [ "LogDeliveryBucket" ]) v);
      (match x.version_id with
      | None -> []
      | Some v -> type_version_id_to_query (List.append path [ "VersionId" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> third_party_type_to_query (List.append path [ "Type" ]) v);
      (match x.arn with None -> [] | Some v -> type_arn_to_query (List.append path [ "Arn" ]) v);
    ]

let cfn_registry_exception_to_query path (x : cfn_registry_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let template_summary_config_to_query path (x : template_summary_config) =
  List.concat
    [
      (match x.treat_unrecognized_resource_types_as_warnings with
      | None -> []
      | Some v ->
          treat_unrecognized_resource_types_as_warnings_to_query
            (List.append path [ "TreatUnrecognizedResourceTypesAsWarnings" ])
            v);
    ]

let generated_template_status_to_query path (x : generated_template_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | COMPLETE -> "COMPLETE"
    | FAILED -> "FAILED"
    | DELETE_IN_PROGRESS -> "DELETE_IN_PROGRESS"
    | UPDATE_IN_PROGRESS -> "UPDATE_IN_PROGRESS"
    | CREATE_IN_PROGRESS -> "CREATE_IN_PROGRESS"
    | DELETE_PENDING -> "DELETE_PENDING"
    | UPDATE_PENDING -> "UPDATE_PENDING"
    | CREATE_PENDING -> "CREATE_PENDING")

let template_status_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let creation_time_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let last_updated_time_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let number_of_resources_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let template_summary_to_query path (x : template_summary) =
  List.concat
    [
      (match x.number_of_resources with
      | None -> []
      | Some v -> number_of_resources_to_query (List.append path [ "NumberOfResources" ]) v);
      (match x.last_updated_time with
      | None -> []
      | Some v -> last_updated_time_to_query (List.append path [ "LastUpdatedTime" ]) v);
      (match x.creation_time with
      | None -> []
      | Some v -> creation_time_to_query (List.append path [ "CreationTime" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> template_status_reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> generated_template_status_to_query (List.append path [ "Status" ]) v);
      (match x.generated_template_name with
      | None -> []
      | Some v -> generated_template_name_to_query (List.append path [ "GeneratedTemplateName" ]) v);
      (match x.generated_template_id with
      | None -> []
      | Some v -> generated_template_id_to_query (List.append path [ "GeneratedTemplateId" ]) v);
    ]

let template_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" template_summary_to_query path xs

let template_stage_to_query path (x : template_stage) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Processed -> "Processed" | Original -> "Original")

let resources_succeeded_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let resources_failed_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let resources_processing_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let resources_pending_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let template_progress_to_query path (x : template_progress) =
  List.concat
    [
      (match x.resources_pending with
      | None -> []
      | Some v -> resources_pending_to_query (List.append path [ "ResourcesPending" ]) v);
      (match x.resources_processing with
      | None -> []
      | Some v -> resources_processing_to_query (List.append path [ "ResourcesProcessing" ]) v);
      (match x.resources_failed with
      | None -> []
      | Some v -> resources_failed_to_query (List.append path [ "ResourcesFailed" ]) v);
      (match x.resources_succeeded with
      | None -> []
      | Some v -> resources_succeeded_to_query (List.append path [ "ResourcesSucceeded" ]) v);
    ]

let template_format_to_query path (x : template_format) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with YAML -> "YAML" | JSON -> "JSON")

let template_description_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let supported_major_version_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let supported_major_versions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" supported_major_version_to_query
    path xs

let stop_stack_set_operation_output_to_query path _x = []

let stop_stack_set_operation_input_to_query path (x : stop_stack_set_operation_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      client_request_token_to_query (List.append path [ "OperationId" ]) x.operation_id;
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let operation_not_found_exception_to_query path (x : operation_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let status_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let resource_scan_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let start_resource_scan_output_to_query path (x : start_resource_scan_output) =
  List.concat
    [
      (match x.resource_scan_id with
      | None -> []
      | Some v -> resource_scan_id_to_query (List.append path [ "ResourceScanId" ]) v);
    ]

let resource_type_filter_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_type_filters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_type_filter_to_query path
    xs

let scan_filter_to_query path (x : scan_filter) =
  List.concat
    [
      (match x.types with
      | None -> []
      | Some v -> resource_type_filters_to_query (List.append path [ "Types" ]) v);
    ]

let scan_filters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" scan_filter_to_query path xs

let start_resource_scan_input_to_query path (x : start_resource_scan_input) =
  List.concat
    [
      (match x.scan_filters with
      | None -> []
      | Some v -> scan_filters_to_query (List.append path [ "ScanFilters" ]) v);
      (match x.client_request_token with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
    ]

let resource_scan_limit_exceeded_exception_to_query path
    (x : resource_scan_limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let resource_scan_in_progress_exception_to_query path (x : resource_scan_in_progress_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let stage_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" template_stage_to_query path xs

let change_set_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let deletion_time_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let stack_status_to_query path (x : stack_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | IMPORT_ROLLBACK_COMPLETE -> "IMPORT_ROLLBACK_COMPLETE"
    | IMPORT_ROLLBACK_FAILED -> "IMPORT_ROLLBACK_FAILED"
    | IMPORT_ROLLBACK_IN_PROGRESS -> "IMPORT_ROLLBACK_IN_PROGRESS"
    | IMPORT_COMPLETE -> "IMPORT_COMPLETE"
    | IMPORT_IN_PROGRESS -> "IMPORT_IN_PROGRESS"
    | REVIEW_IN_PROGRESS -> "REVIEW_IN_PROGRESS"
    | UPDATE_ROLLBACK_COMPLETE -> "UPDATE_ROLLBACK_COMPLETE"
    | UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS -> "UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS"
    | UPDATE_ROLLBACK_FAILED -> "UPDATE_ROLLBACK_FAILED"
    | UPDATE_ROLLBACK_IN_PROGRESS -> "UPDATE_ROLLBACK_IN_PROGRESS"
    | UPDATE_FAILED -> "UPDATE_FAILED"
    | UPDATE_COMPLETE -> "UPDATE_COMPLETE"
    | UPDATE_COMPLETE_CLEANUP_IN_PROGRESS -> "UPDATE_COMPLETE_CLEANUP_IN_PROGRESS"
    | UPDATE_IN_PROGRESS -> "UPDATE_IN_PROGRESS"
    | DELETE_COMPLETE -> "DELETE_COMPLETE"
    | DELETE_FAILED -> "DELETE_FAILED"
    | DELETE_IN_PROGRESS -> "DELETE_IN_PROGRESS"
    | ROLLBACK_COMPLETE -> "ROLLBACK_COMPLETE"
    | ROLLBACK_FAILED -> "ROLLBACK_FAILED"
    | ROLLBACK_IN_PROGRESS -> "ROLLBACK_IN_PROGRESS"
    | CREATE_COMPLETE -> "CREATE_COMPLETE"
    | CREATE_FAILED -> "CREATE_FAILED"
    | CREATE_IN_PROGRESS -> "CREATE_IN_PROGRESS")

let stack_status_reason_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let output_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let output_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let export_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let output_to_query path (x : output) =
  List.concat
    [
      (match x.export_name with
      | None -> []
      | Some v -> export_name_to_query (List.append path [ "ExportName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.output_value with
      | None -> []
      | Some v -> output_value_to_query (List.append path [ "OutputValue" ]) v);
      (match x.output_key with
      | None -> []
      | Some v -> output_key_to_query (List.append path [ "OutputKey" ]) v);
    ]

let outputs_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" output_to_query path xs

let stack_drift_status_to_query path (x : stack_drift_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NOT_CHECKED -> "NOT_CHECKED"
    | UNKNOWN -> "UNKNOWN"
    | IN_SYNC -> "IN_SYNC"
    | DRIFTED -> "DRIFTED")

let stack_drift_information_to_query path (x : stack_drift_information) =
  List.concat
    [
      (match x.last_check_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastCheckTimestamp" ]) v);
      stack_drift_status_to_query (List.append path [ "StackDriftStatus" ]) x.stack_drift_status;
    ]

let deletion_mode_to_query path (x : deletion_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with FORCE_DELETE_STACK -> "FORCE_DELETE_STACK" | STANDARD -> "STANDARD")

let detailed_status_to_query path (x : detailed_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | VALIDATION_FAILED -> "VALIDATION_FAILED"
    | CONFIGURATION_COMPLETE -> "CONFIGURATION_COMPLETE")

let operation_type_to_query path (x : operation_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | CREATE_CHANGESET -> "CREATE_CHANGESET"
    | ROLLBACK -> "ROLLBACK"
    | CONTINUE_ROLLBACK -> "CONTINUE_ROLLBACK"
    | DELETE_STACK -> "DELETE_STACK"
    | UPDATE_STACK -> "UPDATE_STACK"
    | CREATE_STACK -> "CREATE_STACK")

let operation_entry_to_query path (x : operation_entry) =
  List.concat
    [
      (match x.operation_id with
      | None -> []
      | Some v -> operation_id_to_query (List.append path [ "OperationId" ]) v);
      (match x.operation_type with
      | None -> []
      | Some v -> operation_type_to_query (List.append path [ "OperationType" ]) v);
    ]

let last_operations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" operation_entry_to_query path xs

let stack_to_query path (x : stack) =
  List.concat
    [
      (match x.last_operations with
      | None -> []
      | Some v -> last_operations_to_query (List.append path [ "LastOperations" ]) v);
      (match x.detailed_status with
      | None -> []
      | Some v -> detailed_status_to_query (List.append path [ "DetailedStatus" ]) v);
      (match x.deletion_mode with
      | None -> []
      | Some v -> deletion_mode_to_query (List.append path [ "DeletionMode" ]) v);
      (match x.retain_except_on_create with
      | None -> []
      | Some v -> retain_except_on_create_to_query (List.append path [ "RetainExceptOnCreate" ]) v);
      (match x.drift_information with
      | None -> []
      | Some v -> stack_drift_information_to_query (List.append path [ "DriftInformation" ]) v);
      (match x.root_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "RootId" ]) v);
      (match x.parent_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "ParentId" ]) v);
      (match x.enable_termination_protection with
      | None -> []
      | Some v ->
          enable_termination_protection_to_query
            (List.append path [ "EnableTerminationProtection" ])
            v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> role_ar_n_to_query (List.append path [ "RoleARN" ]) v);
      (match x.outputs with
      | None -> []
      | Some v -> outputs_to_query (List.append path [ "Outputs" ]) v);
      (match x.capabilities with
      | None -> []
      | Some v -> capabilities_to_query (List.append path [ "Capabilities" ]) v);
      (match x.timeout_in_minutes with
      | None -> []
      | Some v -> timeout_minutes_to_query (List.append path [ "TimeoutInMinutes" ]) v);
      (match x.notification_ar_ns with
      | None -> []
      | Some v -> notification_ar_ns_to_query (List.append path [ "NotificationARNs" ]) v);
      (match x.deployment_config with
      | None -> []
      | Some v -> deployment_config_to_query (List.append path [ "DeploymentConfig" ]) v);
      (match x.disable_rollback with
      | None -> []
      | Some v -> disable_rollback_to_query (List.append path [ "DisableRollback" ]) v);
      (match x.stack_status_reason with
      | None -> []
      | Some v -> stack_status_reason_to_query (List.append path [ "StackStatusReason" ]) v);
      stack_status_to_query (List.append path [ "StackStatus" ]) x.stack_status;
      (match x.rollback_configuration with
      | None -> []
      | Some v -> rollback_configuration_to_query (List.append path [ "RollbackConfiguration" ]) v);
      (match x.last_updated_time with
      | None -> []
      | Some v -> last_updated_time_to_query (List.append path [ "LastUpdatedTime" ]) v);
      (match x.deletion_time with
      | None -> []
      | Some v -> deletion_time_to_query (List.append path [ "DeletionTime" ]) v);
      creation_time_to_query (List.append path [ "CreationTime" ]) x.creation_time;
      (match x.parameters with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "Parameters" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.change_set_id with
      | None -> []
      | Some v -> change_set_id_to_query (List.append path [ "ChangeSetId" ]) v);
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
    ]

let stacks_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_to_query path xs

let stack_drift_information_summary_to_query path (x : stack_drift_information_summary) =
  List.concat
    [
      (match x.last_check_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastCheckTimestamp" ]) v);
      stack_drift_status_to_query (List.append path [ "StackDriftStatus" ]) x.stack_drift_status;
    ]

let stack_summary_to_query path (x : stack_summary) =
  List.concat
    [
      (match x.last_operations with
      | None -> []
      | Some v -> last_operations_to_query (List.append path [ "LastOperations" ]) v);
      (match x.drift_information with
      | None -> []
      | Some v ->
          stack_drift_information_summary_to_query (List.append path [ "DriftInformation" ]) v);
      (match x.root_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "RootId" ]) v);
      (match x.parent_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "ParentId" ]) v);
      (match x.stack_status_reason with
      | None -> []
      | Some v -> stack_status_reason_to_query (List.append path [ "StackStatusReason" ]) v);
      stack_status_to_query (List.append path [ "StackStatus" ]) x.stack_status;
      (match x.deletion_time with
      | None -> []
      | Some v -> deletion_time_to_query (List.append path [ "DeletionTime" ]) v);
      (match x.last_updated_time with
      | None -> []
      | Some v -> last_updated_time_to_query (List.append path [ "LastUpdatedTime" ]) v);
      creation_time_to_query (List.append path [ "CreationTime" ]) x.creation_time;
      (match x.template_description with
      | None -> []
      | Some v -> template_description_to_query (List.append path [ "TemplateDescription" ]) v);
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
    ]

let stack_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_summary_to_query path xs

let stack_status_filter_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_status_to_query path xs

let stack_set_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_set_status_to_query path (x : stack_set_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DELETED -> "DELETED" | ACTIVE -> "ACTIVE")

let stack_set_summary_to_query path (x : stack_set_summary) =
  List.concat
    [
      (match x.managed_execution with
      | None -> []
      | Some v -> managed_execution_to_query (List.append path [ "ManagedExecution" ]) v);
      (match x.last_drift_check_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastDriftCheckTimestamp" ]) v);
      (match x.drift_status with
      | None -> []
      | Some v -> stack_drift_status_to_query (List.append path [ "DriftStatus" ]) v);
      (match x.permission_model with
      | None -> []
      | Some v -> permission_models_to_query (List.append path [ "PermissionModel" ]) v);
      (match x.auto_deployment with
      | None -> []
      | Some v -> auto_deployment_to_query (List.append path [ "AutoDeployment" ]) v);
      (match x.status with
      | None -> []
      | Some v -> stack_set_status_to_query (List.append path [ "Status" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.stack_set_id with
      | None -> []
      | Some v -> stack_set_id_to_query (List.append path [ "StackSetId" ]) v);
      (match x.stack_set_name with
      | None -> []
      | Some v -> stack_set_name_to_query (List.append path [ "StackSetName" ]) v);
    ]

let stack_set_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_set_summary_to_query path xs

let stack_set_operation_action_to_query path (x : stack_set_operation_action) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | DETECT_DRIFT -> "DETECT_DRIFT"
    | DELETE -> "DELETE"
    | UPDATE -> "UPDATE"
    | CREATE -> "CREATE")

let stack_set_operation_status_to_query path (x : stack_set_operation_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | QUEUED -> "QUEUED"
    | STOPPED -> "STOPPED"
    | STOPPING -> "STOPPING"
    | FAILED -> "FAILED"
    | SUCCEEDED -> "SUCCEEDED"
    | RUNNING -> "RUNNING")

let stack_set_operation_status_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let failed_stack_instances_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let stack_set_operation_status_details_to_query path (x : stack_set_operation_status_details) =
  List.concat
    [
      (match x.failed_stack_instances_count with
      | None -> []
      | Some v ->
          failed_stack_instances_count_to_query (List.append path [ "FailedStackInstancesCount" ]) v);
    ]

let stack_set_operation_summary_to_query path (x : stack_set_operation_summary) =
  List.concat
    [
      (match x.operation_preferences with
      | None -> []
      | Some v ->
          stack_set_operation_preferences_to_query (List.append path [ "OperationPreferences" ]) v);
      (match x.status_details with
      | None -> []
      | Some v ->
          stack_set_operation_status_details_to_query (List.append path [ "StatusDetails" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> stack_set_operation_status_reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.end_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "EndTimestamp" ]) v);
      (match x.creation_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "CreationTimestamp" ]) v);
      (match x.status with
      | None -> []
      | Some v -> stack_set_operation_status_to_query (List.append path [ "Status" ]) v);
      (match x.action with
      | None -> []
      | Some v -> stack_set_operation_action_to_query (List.append path [ "Action" ]) v);
      (match x.operation_id with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
    ]

let stack_set_operation_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_set_operation_summary_to_query
    path xs

let stack_set_operation_result_status_to_query path (x : stack_set_operation_result_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | CANCELLED -> "CANCELLED"
    | FAILED -> "FAILED"
    | SUCCEEDED -> "SUCCEEDED"
    | RUNNING -> "RUNNING"
    | PENDING -> "PENDING")

let reason_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let account_gate_status_to_query path (x : account_gate_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SKIPPED -> "SKIPPED" | FAILED -> "FAILED" | SUCCEEDED -> "SUCCEEDED")

let account_gate_status_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let account_gate_result_to_query path (x : account_gate_result) =
  List.concat
    [
      (match x.status_reason with
      | None -> []
      | Some v -> account_gate_status_reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> account_gate_status_to_query (List.append path [ "Status" ]) v);
    ]

let stack_set_operation_result_summary_to_query path (x : stack_set_operation_result_summary) =
  List.concat
    [
      (match x.organizational_unit_id with
      | None -> []
      | Some v -> organizational_unit_id_to_query (List.append path [ "OrganizationalUnitId" ]) v);
      (match x.account_gate_result with
      | None -> []
      | Some v -> account_gate_result_to_query (List.append path [ "AccountGateResult" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> stack_set_operation_result_status_to_query (List.append path [ "Status" ]) v);
      (match x.region with
      | None -> []
      | Some v -> region_to_query (List.append path [ "Region" ]) v);
      (match x.account with
      | None -> []
      | Some v -> account_to_query (List.append path [ "Account" ]) v);
    ]

let stack_set_operation_result_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    stack_set_operation_result_summary_to_query path xs

let retain_stacks_nullable_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let stack_set_drift_status_to_query path (x : stack_set_drift_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with NOT_CHECKED -> "NOT_CHECKED" | IN_SYNC -> "IN_SYNC" | DRIFTED -> "DRIFTED")

let stack_set_drift_detection_status_to_query path (x : stack_set_drift_detection_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | STOPPED -> "STOPPED"
    | IN_PROGRESS -> "IN_PROGRESS"
    | PARTIAL_SUCCESS -> "PARTIAL_SUCCESS"
    | FAILED -> "FAILED"
    | COMPLETED -> "COMPLETED")

let drifted_stack_instances_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let in_sync_stack_instances_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let in_progress_stack_instances_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let stack_set_drift_detection_details_to_query path (x : stack_set_drift_detection_details) =
  List.concat
    [
      (match x.failed_stack_instances_count with
      | None -> []
      | Some v ->
          failed_stack_instances_count_to_query (List.append path [ "FailedStackInstancesCount" ]) v);
      (match x.in_progress_stack_instances_count with
      | None -> []
      | Some v ->
          in_progress_stack_instances_count_to_query
            (List.append path [ "InProgressStackInstancesCount" ])
            v);
      (match x.in_sync_stack_instances_count with
      | None -> []
      | Some v ->
          in_sync_stack_instances_count_to_query
            (List.append path [ "InSyncStackInstancesCount" ])
            v);
      (match x.drifted_stack_instances_count with
      | None -> []
      | Some v ->
          drifted_stack_instances_count_to_query
            (List.append path [ "DriftedStackInstancesCount" ])
            v);
      (match x.total_stack_instances_count with
      | None -> []
      | Some v ->
          total_stack_instances_count_to_query (List.append path [ "TotalStackInstancesCount" ]) v);
      (match x.last_drift_check_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastDriftCheckTimestamp" ]) v);
      (match x.drift_detection_status with
      | None -> []
      | Some v ->
          stack_set_drift_detection_status_to_query (List.append path [ "DriftDetectionStatus" ]) v);
      (match x.drift_status with
      | None -> []
      | Some v -> stack_set_drift_status_to_query (List.append path [ "DriftStatus" ]) v);
    ]

let stack_set_operation_to_query path (x : stack_set_operation) =
  List.concat
    [
      (match x.status_details with
      | None -> []
      | Some v ->
          stack_set_operation_status_details_to_query (List.append path [ "StatusDetails" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> stack_set_operation_status_reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.stack_set_drift_detection_details with
      | None -> []
      | Some v ->
          stack_set_drift_detection_details_to_query
            (List.append path [ "StackSetDriftDetectionDetails" ])
            v);
      (match x.deployment_targets with
      | None -> []
      | Some v -> deployment_targets_to_query (List.append path [ "DeploymentTargets" ]) v);
      (match x.end_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "EndTimestamp" ]) v);
      (match x.creation_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "CreationTimestamp" ]) v);
      (match x.execution_role_name with
      | None -> []
      | Some v -> execution_role_name_to_query (List.append path [ "ExecutionRoleName" ]) v);
      (match x.administration_role_ar_n with
      | None -> []
      | Some v -> role_ar_n_to_query (List.append path [ "AdministrationRoleARN" ]) v);
      (match x.retain_stacks with
      | None -> []
      | Some v -> retain_stacks_nullable_to_query (List.append path [ "RetainStacks" ]) v);
      (match x.operation_preferences with
      | None -> []
      | Some v ->
          stack_set_operation_preferences_to_query (List.append path [ "OperationPreferences" ]) v);
      (match x.status with
      | None -> []
      | Some v -> stack_set_operation_status_to_query (List.append path [ "Status" ]) v);
      (match x.action with
      | None -> []
      | Some v -> stack_set_operation_action_to_query (List.append path [ "Action" ]) v);
      (match x.stack_set_id with
      | None -> []
      | Some v -> stack_set_id_to_query (List.append path [ "StackSetId" ]) v);
      (match x.operation_id with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
    ]

let stack_set_not_empty_exception_to_query path (x : stack_set_not_empty_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let stack_set_auto_deployment_target_summary_to_query path
    (x : stack_set_auto_deployment_target_summary) =
  List.concat
    [
      (match x.regions with
      | None -> []
      | Some v -> region_list_to_query (List.append path [ "Regions" ]) v);
      (match x.organizational_unit_id with
      | None -> []
      | Some v -> organizational_unit_id_to_query (List.append path [ "OrganizationalUnitId" ]) v);
    ]

let stack_set_auto_deployment_target_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    stack_set_auto_deployment_target_summary_to_query path xs

let stack_set_to_query path (x : stack_set) =
  List.concat
    [
      (match x.regions with
      | None -> []
      | Some v -> region_list_to_query (List.append path [ "Regions" ]) v);
      (match x.managed_execution with
      | None -> []
      | Some v -> managed_execution_to_query (List.append path [ "ManagedExecution" ]) v);
      (match x.organizational_unit_ids with
      | None -> []
      | Some v ->
          organizational_unit_id_list_to_query (List.append path [ "OrganizationalUnitIds" ]) v);
      (match x.permission_model with
      | None -> []
      | Some v -> permission_models_to_query (List.append path [ "PermissionModel" ]) v);
      (match x.auto_deployment with
      | None -> []
      | Some v -> auto_deployment_to_query (List.append path [ "AutoDeployment" ]) v);
      (match x.stack_set_drift_detection_details with
      | None -> []
      | Some v ->
          stack_set_drift_detection_details_to_query
            (List.append path [ "StackSetDriftDetectionDetails" ])
            v);
      (match x.execution_role_name with
      | None -> []
      | Some v -> execution_role_name_to_query (List.append path [ "ExecutionRoleName" ]) v);
      (match x.administration_role_ar_n with
      | None -> []
      | Some v -> role_ar_n_to_query (List.append path [ "AdministrationRoleARN" ]) v);
      (match x.stack_set_ar_n with
      | None -> []
      | Some v -> stack_set_ar_n_to_query (List.append path [ "StackSetARN" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
      (match x.capabilities with
      | None -> []
      | Some v -> capabilities_to_query (List.append path [ "Capabilities" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "Parameters" ]) v);
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
      (match x.status with
      | None -> []
      | Some v -> stack_set_status_to_query (List.append path [ "Status" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.stack_set_id with
      | None -> []
      | Some v -> stack_set_id_to_query (List.append path [ "StackSetId" ]) v);
      (match x.stack_set_name with
      | None -> []
      | Some v -> stack_set_name_to_query (List.append path [ "StackSetName" ]) v);
    ]

let physical_resource_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_status_to_query path (x : resource_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ROLLBACK_FAILED -> "ROLLBACK_FAILED"
    | ROLLBACK_COMPLETE -> "ROLLBACK_COMPLETE"
    | ROLLBACK_IN_PROGRESS -> "ROLLBACK_IN_PROGRESS"
    | UPDATE_ROLLBACK_FAILED -> "UPDATE_ROLLBACK_FAILED"
    | UPDATE_ROLLBACK_COMPLETE -> "UPDATE_ROLLBACK_COMPLETE"
    | UPDATE_ROLLBACK_IN_PROGRESS -> "UPDATE_ROLLBACK_IN_PROGRESS"
    | EXPORT_ROLLBACK_COMPLETE -> "EXPORT_ROLLBACK_COMPLETE"
    | EXPORT_ROLLBACK_FAILED -> "EXPORT_ROLLBACK_FAILED"
    | EXPORT_ROLLBACK_IN_PROGRESS -> "EXPORT_ROLLBACK_IN_PROGRESS"
    | EXPORT_IN_PROGRESS -> "EXPORT_IN_PROGRESS"
    | EXPORT_COMPLETE -> "EXPORT_COMPLETE"
    | EXPORT_FAILED -> "EXPORT_FAILED"
    | IMPORT_ROLLBACK_COMPLETE -> "IMPORT_ROLLBACK_COMPLETE"
    | IMPORT_ROLLBACK_FAILED -> "IMPORT_ROLLBACK_FAILED"
    | IMPORT_ROLLBACK_IN_PROGRESS -> "IMPORT_ROLLBACK_IN_PROGRESS"
    | IMPORT_IN_PROGRESS -> "IMPORT_IN_PROGRESS"
    | IMPORT_COMPLETE -> "IMPORT_COMPLETE"
    | IMPORT_FAILED -> "IMPORT_FAILED"
    | UPDATE_COMPLETE -> "UPDATE_COMPLETE"
    | UPDATE_FAILED -> "UPDATE_FAILED"
    | UPDATE_IN_PROGRESS -> "UPDATE_IN_PROGRESS"
    | DELETE_SKIPPED -> "DELETE_SKIPPED"
    | DELETE_COMPLETE -> "DELETE_COMPLETE"
    | DELETE_FAILED -> "DELETE_FAILED"
    | DELETE_IN_PROGRESS -> "DELETE_IN_PROGRESS"
    | CREATE_COMPLETE -> "CREATE_COMPLETE"
    | CREATE_FAILED -> "CREATE_FAILED"
    | CREATE_IN_PROGRESS -> "CREATE_IN_PROGRESS")

let resource_status_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_resource_drift_status_to_query path (x : stack_resource_drift_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | UNSUPPORTED -> "UNSUPPORTED"
    | UNKNOWN -> "UNKNOWN"
    | NOT_CHECKED -> "NOT_CHECKED"
    | DELETED -> "DELETED"
    | MODIFIED -> "MODIFIED"
    | IN_SYNC -> "IN_SYNC")

let stack_resource_drift_information_to_query path (x : stack_resource_drift_information) =
  List.concat
    [
      (match x.last_check_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastCheckTimestamp" ]) v);
      stack_resource_drift_status_to_query
        (List.append path [ "StackResourceDriftStatus" ])
        x.stack_resource_drift_status;
    ]

let logical_id_hierarchy_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let module_info_to_query path (x : module_info) =
  List.concat
    [
      (match x.logical_id_hierarchy with
      | None -> []
      | Some v -> logical_id_hierarchy_to_query (List.append path [ "LogicalIdHierarchy" ]) v);
      (match x.type_hierarchy with
      | None -> []
      | Some v -> type_hierarchy_to_query (List.append path [ "TypeHierarchy" ]) v);
    ]

let stack_resource_to_query path (x : stack_resource) =
  List.concat
    [
      (match x.module_info with
      | None -> []
      | Some v -> module_info_to_query (List.append path [ "ModuleInfo" ]) v);
      (match x.drift_information with
      | None -> []
      | Some v ->
          stack_resource_drift_information_to_query (List.append path [ "DriftInformation" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.resource_status_reason with
      | None -> []
      | Some v -> resource_status_reason_to_query (List.append path [ "ResourceStatusReason" ]) v);
      resource_status_to_query (List.append path [ "ResourceStatus" ]) x.resource_status;
      timestamp_to_query (List.append path [ "Timestamp" ]) x.timestamp;
      resource_type_to_query (List.append path [ "ResourceType" ]) x.resource_type;
      (match x.physical_resource_id with
      | None -> []
      | Some v -> physical_resource_id_to_query (List.append path [ "PhysicalResourceId" ]) v);
      logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) x.logical_resource_id;
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_to_query (List.append path [ "StackName" ]) v);
    ]

let stack_resources_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_resource_to_query path xs

let stack_resource_drift_information_summary_to_query path
    (x : stack_resource_drift_information_summary) =
  List.concat
    [
      (match x.last_check_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastCheckTimestamp" ]) v);
      stack_resource_drift_status_to_query
        (List.append path [ "StackResourceDriftStatus" ])
        x.stack_resource_drift_status;
    ]

let stack_resource_summary_to_query path (x : stack_resource_summary) =
  List.concat
    [
      (match x.module_info with
      | None -> []
      | Some v -> module_info_to_query (List.append path [ "ModuleInfo" ]) v);
      (match x.drift_information with
      | None -> []
      | Some v ->
          stack_resource_drift_information_summary_to_query
            (List.append path [ "DriftInformation" ])
            v);
      (match x.resource_status_reason with
      | None -> []
      | Some v -> resource_status_reason_to_query (List.append path [ "ResourceStatusReason" ]) v);
      resource_status_to_query (List.append path [ "ResourceStatus" ]) x.resource_status;
      timestamp_to_query (List.append path [ "LastUpdatedTimestamp" ]) x.last_updated_timestamp;
      resource_type_to_query (List.append path [ "ResourceType" ]) x.resource_type;
      (match x.physical_resource_id with
      | None -> []
      | Some v -> physical_resource_id_to_query (List.append path [ "PhysicalResourceId" ]) v);
      logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) x.logical_resource_id;
    ]

let stack_resource_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_resource_summary_to_query path
    xs

let key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let physical_resource_id_context_key_value_pair_to_query path
    (x : physical_resource_id_context_key_value_pair) =
  List.concat
    [
      value_to_query (List.append path [ "Value" ]) x.value;
      key_to_query (List.append path [ "Key" ]) x.key;
    ]

let physical_resource_id_context_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    physical_resource_id_context_key_value_pair_to_query path xs

let properties_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let property_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let difference_type_to_query path (x : difference_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with NOT_EQUAL -> "NOT_EQUAL" | REMOVE -> "REMOVE" | ADD -> "ADD")

let property_difference_to_query path (x : property_difference) =
  List.concat
    [
      difference_type_to_query (List.append path [ "DifferenceType" ]) x.difference_type;
      property_value_to_query (List.append path [ "ActualValue" ]) x.actual_value;
      property_value_to_query (List.append path [ "ExpectedValue" ]) x.expected_value;
      property_path_to_query (List.append path [ "PropertyPath" ]) x.property_path;
    ]

let property_differences_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" property_difference_to_query path xs

let stack_resource_drift_status_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_resource_drift_to_query path (x : stack_resource_drift) =
  List.concat
    [
      (match x.drift_status_reason with
      | None -> []
      | Some v ->
          stack_resource_drift_status_reason_to_query (List.append path [ "DriftStatusReason" ]) v);
      (match x.module_info with
      | None -> []
      | Some v -> module_info_to_query (List.append path [ "ModuleInfo" ]) v);
      timestamp_to_query (List.append path [ "Timestamp" ]) x.timestamp;
      stack_resource_drift_status_to_query
        (List.append path [ "StackResourceDriftStatus" ])
        x.stack_resource_drift_status;
      (match x.property_differences with
      | None -> []
      | Some v -> property_differences_to_query (List.append path [ "PropertyDifferences" ]) v);
      (match x.actual_properties with
      | None -> []
      | Some v -> properties_to_query (List.append path [ "ActualProperties" ]) v);
      (match x.expected_properties with
      | None -> []
      | Some v -> properties_to_query (List.append path [ "ExpectedProperties" ]) v);
      resource_type_to_query (List.append path [ "ResourceType" ]) x.resource_type;
      (match x.physical_resource_id_context with
      | None -> []
      | Some v ->
          physical_resource_id_context_to_query (List.append path [ "PhysicalResourceIdContext" ]) v);
      (match x.physical_resource_id with
      | None -> []
      | Some v -> physical_resource_id_to_query (List.append path [ "PhysicalResourceId" ]) v);
      logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) x.logical_resource_id;
      stack_id_to_query (List.append path [ "StackId" ]) x.stack_id;
    ]

let stack_resource_drifts_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_resource_drift_to_query path
    xs

let stack_resource_drift_status_filters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_resource_drift_status_to_query
    path xs

let metadata_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_resource_detail_to_query path (x : stack_resource_detail) =
  List.concat
    [
      (match x.module_info with
      | None -> []
      | Some v -> module_info_to_query (List.append path [ "ModuleInfo" ]) v);
      (match x.drift_information with
      | None -> []
      | Some v ->
          stack_resource_drift_information_to_query (List.append path [ "DriftInformation" ]) v);
      (match x.metadata with
      | None -> []
      | Some v -> metadata_to_query (List.append path [ "Metadata" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.resource_status_reason with
      | None -> []
      | Some v -> resource_status_reason_to_query (List.append path [ "ResourceStatusReason" ]) v);
      resource_status_to_query (List.append path [ "ResourceStatus" ]) x.resource_status;
      timestamp_to_query (List.append path [ "LastUpdatedTimestamp" ]) x.last_updated_timestamp;
      resource_type_to_query (List.append path [ "ResourceType" ]) x.resource_type;
      (match x.physical_resource_id with
      | None -> []
      | Some v -> physical_resource_id_to_query (List.append path [ "PhysicalResourceId" ]) v);
      logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) x.logical_resource_id;
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_to_query (List.append path [ "StackName" ]) v);
    ]

let stack_refactor_untag_resources_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_key_to_query path xs

let stack_refactor_tag_resources_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let stack_refactor_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_refactor_execution_status_to_query path (x : stack_refactor_execution_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ROLLBACK_FAILED -> "ROLLBACK_FAILED"
    | ROLLBACK_COMPLETE -> "ROLLBACK_COMPLETE"
    | ROLLBACK_IN_PROGRESS -> "ROLLBACK_IN_PROGRESS"
    | EXECUTE_FAILED -> "EXECUTE_FAILED"
    | EXECUTE_COMPLETE -> "EXECUTE_COMPLETE"
    | EXECUTE_IN_PROGRESS -> "EXECUTE_IN_PROGRESS"
    | OBSOLETE -> "OBSOLETE"
    | AVAILABLE -> "AVAILABLE"
    | UNAVAILABLE -> "UNAVAILABLE")

let execution_status_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_refactor_status_to_query path (x : stack_refactor_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | DELETE_FAILED -> "DELETE_FAILED"
    | DELETE_COMPLETE -> "DELETE_COMPLETE"
    | DELETE_IN_PROGRESS -> "DELETE_IN_PROGRESS"
    | CREATE_FAILED -> "CREATE_FAILED"
    | CREATE_COMPLETE -> "CREATE_COMPLETE"
    | CREATE_IN_PROGRESS -> "CREATE_IN_PROGRESS")

let stack_refactor_status_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_refactor_summary_to_query path (x : stack_refactor_summary) =
  List.concat
    [
      (match x.status_reason with
      | None -> []
      | Some v -> stack_refactor_status_reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> stack_refactor_status_to_query (List.append path [ "Status" ]) v);
      (match x.execution_status_reason with
      | None -> []
      | Some v -> execution_status_reason_to_query (List.append path [ "ExecutionStatusReason" ]) v);
      (match x.execution_status with
      | None -> []
      | Some v ->
          stack_refactor_execution_status_to_query (List.append path [ "ExecutionStatus" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.stack_refactor_id with
      | None -> []
      | Some v -> stack_refactor_id_to_query (List.append path [ "StackRefactorId" ]) v);
    ]

let stack_refactor_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_refactor_summary_to_query path
    xs

let stack_refactor_resource_identifier_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_refactor_not_found_exception_to_query path (x : stack_refactor_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let stack_refactor_execution_status_filter_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    stack_refactor_execution_status_to_query path xs

let stack_refactor_detection_to_query path (x : stack_refactor_detection) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with MANUAL -> "MANUAL" | AUTO -> "AUTO")

let stack_refactor_action_type_to_query path (x : stack_refactor_action_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with CREATE -> "CREATE" | MOVE -> "MOVE")

let stack_refactor_action_entity_to_query path (x : stack_refactor_action_entity) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with STACK -> "STACK" | RESOURCE -> "RESOURCE")

let detection_reason_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_location_to_query path (x : resource_location) =
  List.concat
    [
      logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) x.logical_resource_id;
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let resource_mapping_to_query path (x : resource_mapping) =
  List.concat
    [
      resource_location_to_query (List.append path [ "Destination" ]) x.destination;
      resource_location_to_query (List.append path [ "Source" ]) x.source;
    ]

let stack_refactor_action_to_query path (x : stack_refactor_action) =
  List.concat
    [
      (match x.resource_mapping with
      | None -> []
      | Some v -> resource_mapping_to_query (List.append path [ "ResourceMapping" ]) v);
      (match x.untag_resources with
      | None -> []
      | Some v -> stack_refactor_untag_resources_to_query (List.append path [ "UntagResources" ]) v);
      (match x.tag_resources with
      | None -> []
      | Some v -> stack_refactor_tag_resources_to_query (List.append path [ "TagResources" ]) v);
      (match x.detection_reason with
      | None -> []
      | Some v -> detection_reason_to_query (List.append path [ "DetectionReason" ]) v);
      (match x.detection with
      | None -> []
      | Some v -> stack_refactor_detection_to_query (List.append path [ "Detection" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.resource_identifier with
      | None -> []
      | Some v ->
          stack_refactor_resource_identifier_to_query (List.append path [ "ResourceIdentifier" ]) v);
      (match x.physical_resource_id with
      | None -> []
      | Some v -> physical_resource_id_to_query (List.append path [ "PhysicalResourceId" ]) v);
      (match x.entity with
      | None -> []
      | Some v -> stack_refactor_action_entity_to_query (List.append path [ "Entity" ]) v);
      (match x.action with
      | None -> []
      | Some v -> stack_refactor_action_type_to_query (List.append path [ "Action" ]) v);
    ]

let stack_refactor_actions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_refactor_action_to_query path
    xs

let stack_not_found_exception_to_query path (x : stack_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let stack_instance_status_to_query path (x : stack_instance_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with INOPERABLE -> "INOPERABLE" | OUTDATED -> "OUTDATED" | CURRENT -> "CURRENT")

let stack_instance_detailed_status_to_query path (x : stack_instance_detailed_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | FAILED_IMPORT -> "FAILED_IMPORT"
    | SKIPPED_SUSPENDED_ACCOUNT -> "SKIPPED_SUSPENDED_ACCOUNT"
    | INOPERABLE -> "INOPERABLE"
    | CANCELLED -> "CANCELLED"
    | FAILED -> "FAILED"
    | SUCCEEDED -> "SUCCEEDED"
    | RUNNING -> "RUNNING"
    | PENDING -> "PENDING")

let stack_instance_comprehensive_status_to_query path (x : stack_instance_comprehensive_status) =
  List.concat
    [
      (match x.detailed_status with
      | None -> []
      | Some v -> stack_instance_detailed_status_to_query (List.append path [ "DetailedStatus" ]) v);
    ]

let stack_instance_summary_to_query path (x : stack_instance_summary) =
  List.concat
    [
      (match x.last_operation_id with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "LastOperationId" ]) v);
      (match x.last_drift_check_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastDriftCheckTimestamp" ]) v);
      (match x.drift_status with
      | None -> []
      | Some v -> stack_drift_status_to_query (List.append path [ "DriftStatus" ]) v);
      (match x.organizational_unit_id with
      | None -> []
      | Some v -> organizational_unit_id_to_query (List.append path [ "OrganizationalUnitId" ]) v);
      (match x.stack_instance_status with
      | None -> []
      | Some v ->
          stack_instance_comprehensive_status_to_query
            (List.append path [ "StackInstanceStatus" ])
            v);
      (match x.status_reason with
      | None -> []
      | Some v -> reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> stack_instance_status_to_query (List.append path [ "Status" ]) v);
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
      (match x.account with
      | None -> []
      | Some v -> account_to_query (List.append path [ "Account" ]) v);
      (match x.region with
      | None -> []
      | Some v -> region_to_query (List.append path [ "Region" ]) v);
      (match x.stack_set_id with
      | None -> []
      | Some v -> stack_set_id_to_query (List.append path [ "StackSetId" ]) v);
    ]

let stack_instance_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_instance_summary_to_query path
    xs

let stack_instance_resource_drifts_summary_to_query path
    (x : stack_instance_resource_drifts_summary) =
  List.concat
    [
      timestamp_to_query (List.append path [ "Timestamp" ]) x.timestamp;
      stack_resource_drift_status_to_query
        (List.append path [ "StackResourceDriftStatus" ])
        x.stack_resource_drift_status;
      (match x.property_differences with
      | None -> []
      | Some v -> property_differences_to_query (List.append path [ "PropertyDifferences" ]) v);
      resource_type_to_query (List.append path [ "ResourceType" ]) x.resource_type;
      (match x.physical_resource_id_context with
      | None -> []
      | Some v ->
          physical_resource_id_context_to_query (List.append path [ "PhysicalResourceIdContext" ]) v);
      (match x.physical_resource_id with
      | None -> []
      | Some v -> physical_resource_id_to_query (List.append path [ "PhysicalResourceId" ]) v);
      logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) x.logical_resource_id;
      stack_id_to_query (List.append path [ "StackId" ]) x.stack_id;
    ]

let stack_instance_resource_drifts_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    stack_instance_resource_drifts_summary_to_query path xs

let stack_instance_filter_name_to_query path (x : stack_instance_filter_name) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | DRIFT_STATUS -> "DRIFT_STATUS"
    | LAST_OPERATION_ID -> "LAST_OPERATION_ID"
    | DETAILED_STATUS -> "DETAILED_STATUS")

let stack_instance_filter_values_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_instance_filter_to_query path (x : stack_instance_filter) =
  List.concat
    [
      (match x.values with
      | None -> []
      | Some v -> stack_instance_filter_values_to_query (List.append path [ "Values" ]) v);
      (match x.name with
      | None -> []
      | Some v -> stack_instance_filter_name_to_query (List.append path [ "Name" ]) v);
    ]

let stack_instance_filters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_instance_filter_to_query path
    xs

let stack_instance_to_query path (x : stack_instance) =
  List.concat
    [
      (match x.last_operation_id with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "LastOperationId" ]) v);
      (match x.last_drift_check_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastDriftCheckTimestamp" ]) v);
      (match x.drift_status with
      | None -> []
      | Some v -> stack_drift_status_to_query (List.append path [ "DriftStatus" ]) v);
      (match x.organizational_unit_id with
      | None -> []
      | Some v -> organizational_unit_id_to_query (List.append path [ "OrganizationalUnitId" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.stack_instance_status with
      | None -> []
      | Some v ->
          stack_instance_comprehensive_status_to_query
            (List.append path [ "StackInstanceStatus" ])
            v);
      (match x.status with
      | None -> []
      | Some v -> stack_instance_status_to_query (List.append path [ "Status" ]) v);
      (match x.parameter_overrides with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "ParameterOverrides" ]) v);
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
      (match x.account with
      | None -> []
      | Some v -> account_to_query (List.append path [ "Account" ]) v);
      (match x.region with
      | None -> []
      | Some v -> region_to_query (List.append path [ "Region" ]) v);
      (match x.stack_set_id with
      | None -> []
      | Some v -> stack_set_id_to_query (List.append path [ "StackSetId" ]) v);
    ]

let stack_ids_url_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_id_to_query path xs

let stack_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_id_to_query path xs

let event_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let resource_properties_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let hook_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let hook_status_to_query path (x : hook_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | HOOK_FAILED -> "HOOK_FAILED"
    | HOOK_COMPLETE_FAILED -> "HOOK_COMPLETE_FAILED"
    | HOOK_COMPLETE_SUCCEEDED -> "HOOK_COMPLETE_SUCCEEDED"
    | HOOK_IN_PROGRESS -> "HOOK_IN_PROGRESS")

let hook_status_reason_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let hook_invocation_point_to_query path (x : hook_invocation_point) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with PRE_PROVISION -> "PRE_PROVISION")

let hook_invocation_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let hook_failure_mode_to_query path (x : hook_failure_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with WARN -> "WARN" | FAIL -> "FAIL")

let stack_event_to_query path (x : stack_event) =
  List.concat
    [
      (match x.detailed_status with
      | None -> []
      | Some v -> detailed_status_to_query (List.append path [ "DetailedStatus" ]) v);
      (match x.hook_failure_mode with
      | None -> []
      | Some v -> hook_failure_mode_to_query (List.append path [ "HookFailureMode" ]) v);
      (match x.hook_invocation_id with
      | None -> []
      | Some v -> hook_invocation_id_to_query (List.append path [ "HookInvocationId" ]) v);
      (match x.hook_invocation_point with
      | None -> []
      | Some v -> hook_invocation_point_to_query (List.append path [ "HookInvocationPoint" ]) v);
      (match x.hook_status_reason with
      | None -> []
      | Some v -> hook_status_reason_to_query (List.append path [ "HookStatusReason" ]) v);
      (match x.hook_status with
      | None -> []
      | Some v -> hook_status_to_query (List.append path [ "HookStatus" ]) v);
      (match x.hook_type with
      | None -> []
      | Some v -> hook_type_to_query (List.append path [ "HookType" ]) v);
      (match x.client_request_token with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      (match x.resource_properties with
      | None -> []
      | Some v -> resource_properties_to_query (List.append path [ "ResourceProperties" ]) v);
      (match x.resource_status_reason with
      | None -> []
      | Some v -> resource_status_reason_to_query (List.append path [ "ResourceStatusReason" ]) v);
      (match x.resource_status with
      | None -> []
      | Some v -> resource_status_to_query (List.append path [ "ResourceStatus" ]) v);
      timestamp_to_query (List.append path [ "Timestamp" ]) x.timestamp;
      (match x.resource_type with
      | None -> []
      | Some v -> resource_type_to_query (List.append path [ "ResourceType" ]) v);
      (match x.physical_resource_id with
      | None -> []
      | Some v -> physical_resource_id_to_query (List.append path [ "PhysicalResourceId" ]) v);
      (match x.logical_resource_id with
      | None -> []
      | Some v -> logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) v);
      (match x.operation_id with
      | None -> []
      | Some v -> operation_id_to_query (List.append path [ "OperationId" ]) v);
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
      event_id_to_query (List.append path [ "EventId" ]) x.event_id;
      stack_id_to_query (List.append path [ "StackId" ]) x.stack_id;
    ]

let stack_events_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_event_to_query path xs

let stack_drift_detection_status_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_drift_detection_status_to_query path (x : stack_drift_detection_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | DETECTION_COMPLETE -> "DETECTION_COMPLETE"
    | DETECTION_FAILED -> "DETECTION_FAILED"
    | DETECTION_IN_PROGRESS -> "DETECTION_IN_PROGRESS")

let stack_drift_detection_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let stack_definition_to_query path (x : stack_definition) =
  List.concat
    [
      (match x.template_ur_l with
      | None -> []
      | Some v -> template_ur_l_to_query (List.append path [ "TemplateURL" ]) v);
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_to_query (List.append path [ "StackName" ]) v);
    ]

let stack_definitions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_definition_to_query path xs

let resource_signal_unique_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_signal_status_to_query path (x : resource_signal_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with FAILURE -> "FAILURE" | SUCCESS -> "SUCCESS")

let signal_resource_input_to_query path (x : signal_resource_input) =
  List.concat
    [
      resource_signal_status_to_query (List.append path [ "Status" ]) x.status;
      resource_signal_unique_id_to_query (List.append path [ "UniqueId" ]) x.unique_id;
      logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) x.logical_resource_id;
      stack_name_or_id_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let set_type_default_version_output_to_query path _x = []
let private_type_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let set_type_default_version_input_to_query path (x : set_type_default_version_input) =
  List.concat
    [
      (match x.version_id with
      | None -> []
      | Some v -> type_version_id_to_query (List.append path [ "VersionId" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> registry_type_to_query (List.append path [ "Type" ]) v);
      (match x.arn with
      | None -> []
      | Some v -> private_type_arn_to_query (List.append path [ "Arn" ]) v);
    ]

let set_type_configuration_output_to_query path (x : set_type_configuration_output) =
  List.concat
    [
      (match x.configuration_arn with
      | None -> []
      | Some v -> type_configuration_arn_to_query (List.append path [ "ConfigurationArn" ]) v);
    ]

let set_type_configuration_input_to_query path (x : set_type_configuration_input) =
  List.concat
    [
      (match x.type_ with
      | None -> []
      | Some v -> third_party_type_to_query (List.append path [ "Type" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.configuration_alias with
      | None -> []
      | Some v -> type_configuration_alias_to_query (List.append path [ "ConfigurationAlias" ]) v);
      type_configuration_to_query (List.append path [ "Configuration" ]) x.configuration;
      (match x.type_arn with
      | None -> []
      | Some v -> type_arn_to_query (List.append path [ "TypeArn" ]) v);
    ]

let set_stack_policy_input_to_query path (x : set_stack_policy_input) =
  List.concat
    [
      (match x.stack_policy_ur_l with
      | None -> []
      | Some v -> stack_policy_ur_l_to_query (List.append path [ "StackPolicyURL" ]) v);
      (match x.stack_policy_body with
      | None -> []
      | Some v -> stack_policy_body_to_query (List.append path [ "StackPolicyBody" ]) v);
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let resource_attribute_to_query path (x : resource_attribute) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Tags -> "Tags"
    | UpdateReplacePolicy -> "UpdateReplacePolicy"
    | DeletionPolicy -> "DeletionPolicy"
    | UpdatePolicy -> "UpdatePolicy"
    | CreationPolicy -> "CreationPolicy"
    | Metadata -> "Metadata"
    | Properties -> "Properties")

let scope_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_attribute_to_query path xs

let jazz_resource_identifier_property_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let jazz_resource_identifier_property_key_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let jazz_resource_identifier_properties_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    jazz_resource_identifier_property_key_to_query jazz_resource_identifier_property_value_to_query
    path pairs

let managed_by_stack_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let scanned_resource_to_query path (x : scanned_resource) =
  List.concat
    [
      (match x.managed_by_stack with
      | None -> []
      | Some v -> managed_by_stack_to_query (List.append path [ "ManagedByStack" ]) v);
      (match x.resource_identifier with
      | None -> []
      | Some v ->
          jazz_resource_identifier_properties_to_query (List.append path [ "ResourceIdentifier" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> resource_type_to_query (List.append path [ "ResourceType" ]) v);
    ]

let scanned_resources_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" scanned_resource_to_query path xs

let scanned_resource_identifier_to_query path (x : scanned_resource_identifier) =
  List.concat
    [
      jazz_resource_identifier_properties_to_query
        (List.append path [ "ResourceIdentifier" ])
        x.resource_identifier;
      resource_type_to_query (List.append path [ "ResourceType" ]) x.resource_type;
    ]

let scanned_resource_identifiers_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" scanned_resource_identifier_to_query
    path xs

let scan_type_to_query path (x : scan_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with PARTIAL -> "PARTIAL" | FULL -> "FULL")

let s3_url_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let rollback_stack_output_to_query path (x : rollback_stack_output) =
  List.concat
    [
      (match x.operation_id with
      | None -> []
      | Some v -> operation_id_to_query (List.append path [ "OperationId" ]) v);
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
    ]

let rollback_stack_input_to_query path (x : rollback_stack_input) =
  List.concat
    [
      (match x.deployment_config with
      | None -> []
      | Some v -> deployment_config_to_query (List.append path [ "DeploymentConfig" ]) v);
      (match x.retain_except_on_create with
      | None -> []
      | Some v -> retain_except_on_create_to_query (List.append path [ "RetainExceptOnCreate" ]) v);
      (match x.client_request_token with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> role_ar_n_to_query (List.append path [ "RoleARN" ]) v);
      stack_name_or_id_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let role_ar_n2_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let retain_stacks_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let retain_resources_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" logical_resource_id_to_query path xs

let resource_to_skip_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resources_to_skip_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_to_skip_to_query path xs

let resource_to_import_to_query path (x : resource_to_import) =
  List.concat
    [
      resource_identifier_properties_to_query
        (List.append path [ "ResourceIdentifier" ])
        x.resource_identifier;
      logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) x.logical_resource_id;
      resource_type_to_query (List.append path [ "ResourceType" ]) x.resource_type;
    ]

let resources_to_import_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_to_import_to_query path xs

let resources_scanned_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let resources_read_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let resource_type_prefix_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let property_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let requires_recreation_to_query path (x : requires_recreation) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Always -> "Always" | Conditionally -> "Conditionally" | Never -> "Never")

let resource_property_path_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let before_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let after_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let before_value_from_to_query path (x : before_value_from) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ACTUAL_STATE -> "ACTUAL_STATE"
    | PREVIOUS_DEPLOYMENT_STATE -> "PREVIOUS_DEPLOYMENT_STATE")

let after_value_from_to_query path (x : after_value_from) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with TEMPLATE -> "TEMPLATE")

let resource_drift_previous_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_drift_actual_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let live_resource_drift_to_query path (x : live_resource_drift) =
  List.concat
    [
      (match x.drift_detection_timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "DriftDetectionTimestamp" ]) v);
      (match x.actual_value with
      | None -> []
      | Some v -> resource_drift_actual_value_to_query (List.append path [ "ActualValue" ]) v);
      (match x.previous_value with
      | None -> []
      | Some v -> resource_drift_previous_value_to_query (List.append path [ "PreviousValue" ]) v);
    ]

let attribute_change_type_to_query path (x : attribute_change_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | SyncWithActual -> "SyncWithActual"
    | Modify -> "Modify"
    | Remove -> "Remove"
    | Add -> "Add")

let resource_target_definition_to_query path (x : resource_target_definition) =
  List.concat
    [
      (match x.attribute_change_type with
      | None -> []
      | Some v -> attribute_change_type_to_query (List.append path [ "AttributeChangeType" ]) v);
      (match x.drift with
      | None -> []
      | Some v -> live_resource_drift_to_query (List.append path [ "Drift" ]) v);
      (match x.after_value_from with
      | None -> []
      | Some v -> after_value_from_to_query (List.append path [ "AfterValueFrom" ]) v);
      (match x.before_value_from with
      | None -> []
      | Some v -> before_value_from_to_query (List.append path [ "BeforeValueFrom" ]) v);
      (match x.after_value with
      | None -> []
      | Some v -> after_value_to_query (List.append path [ "AfterValue" ]) v);
      (match x.before_value with
      | None -> []
      | Some v -> before_value_to_query (List.append path [ "BeforeValue" ]) v);
      (match x.path with
      | None -> []
      | Some v -> resource_property_path_to_query (List.append path [ "Path" ]) v);
      (match x.requires_recreation with
      | None -> []
      | Some v -> requires_recreation_to_query (List.append path [ "RequiresRecreation" ]) v);
      (match x.name with
      | None -> []
      | Some v -> property_name_to_query (List.append path [ "Name" ]) v);
      (match x.attribute with
      | None -> []
      | Some v -> resource_attribute_to_query (List.append path [ "Attribute" ]) v);
    ]

let resource_scanner_max_results_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let resource_scan_status_to_query path (x : resource_scan_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | EXPIRED -> "EXPIRED"
    | COMPLETE -> "COMPLETE"
    | FAILED -> "FAILED"
    | IN_PROGRESS -> "IN_PROGRESS")

let resource_scan_status_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let percentage_completed_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let resource_scan_summary_to_query path (x : resource_scan_summary) =
  List.concat
    [
      (match x.scan_type with
      | None -> []
      | Some v -> scan_type_to_query (List.append path [ "ScanType" ]) v);
      (match x.percentage_completed with
      | None -> []
      | Some v -> percentage_completed_to_query (List.append path [ "PercentageCompleted" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> resource_scan_status_reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> resource_scan_status_to_query (List.append path [ "Status" ]) v);
      (match x.resource_scan_id with
      | None -> []
      | Some v -> resource_scan_id_to_query (List.append path [ "ResourceScanId" ]) v);
    ]

let resource_scan_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_scan_summary_to_query path
    xs

let resource_scan_not_found_exception_to_query path (x : resource_scan_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let resource_model_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_mappings_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_mapping_to_query path xs

let resource_identifiers_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    resource_identifier_property_key_to_query path xs

let logical_resource_ids_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" logical_resource_id_to_query path xs

let resource_identifier_summary_to_query path (x : resource_identifier_summary) =
  List.concat
    [
      (match x.resource_identifiers with
      | None -> []
      | Some v -> resource_identifiers_to_query (List.append path [ "ResourceIdentifiers" ]) v);
      (match x.logical_resource_ids with
      | None -> []
      | Some v -> logical_resource_ids_to_query (List.append path [ "LogicalResourceIds" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> resource_type_to_query (List.append path [ "ResourceType" ]) v);
    ]

let resource_identifier_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_identifier_summary_to_query
    path xs

let resource_identifier_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let drift_ignored_reason_to_query path (x : drift_ignored_reason) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | WRITE_ONLY_PROPERTY -> "WRITE_ONLY_PROPERTY"
    | MANAGED_BY_AWS -> "MANAGED_BY_AWS")

let resource_drift_ignored_attribute_to_query path (x : resource_drift_ignored_attribute) =
  List.concat
    [
      (match x.reason with
      | None -> []
      | Some v -> drift_ignored_reason_to_query (List.append path [ "Reason" ]) v);
      (match x.path with
      | None -> []
      | Some v -> resource_property_path_to_query (List.append path [ "Path" ]) v);
    ]

let resource_drift_ignored_attributes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    resource_drift_ignored_attribute_to_query path xs

let generated_template_resource_status_to_query path (x : generated_template_resource_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | COMPLETE -> "COMPLETE"
    | FAILED -> "FAILED"
    | IN_PROGRESS -> "IN_PROGRESS"
    | PENDING -> "PENDING")

let resource_detail_to_query path (x : resource_detail) =
  List.concat
    [
      (match x.warnings with
      | None -> []
      | Some v -> warning_details_to_query (List.append path [ "Warnings" ]) v);
      (match x.resource_status_reason with
      | None -> []
      | Some v -> resource_status_reason_to_query (List.append path [ "ResourceStatusReason" ]) v);
      (match x.resource_status with
      | None -> []
      | Some v ->
          generated_template_resource_status_to_query (List.append path [ "ResourceStatus" ]) v);
      (match x.resource_identifier with
      | None -> []
      | Some v ->
          resource_identifier_properties_to_query (List.append path [ "ResourceIdentifier" ]) v);
      (match x.logical_resource_id with
      | None -> []
      | Some v -> logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> resource_type_to_query (List.append path [ "ResourceType" ]) v);
    ]

let resource_details_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_detail_to_query path xs

let evaluation_type_to_query path (x : evaluation_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Dynamic -> "Dynamic" | Static -> "Static")

let change_source_to_query path (x : change_source) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NoModification -> "NoModification"
    | Automatic -> "Automatic"
    | DirectModification -> "DirectModification"
    | ResourceAttribute -> "ResourceAttribute"
    | ParameterReference -> "ParameterReference"
    | ResourceReference -> "ResourceReference")

let causing_entity_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_change_detail_to_query path (x : resource_change_detail) =
  List.concat
    [
      (match x.causing_entity with
      | None -> []
      | Some v -> causing_entity_to_query (List.append path [ "CausingEntity" ]) v);
      (match x.change_source with
      | None -> []
      | Some v -> change_source_to_query (List.append path [ "ChangeSource" ]) v);
      (match x.evaluation with
      | None -> []
      | Some v -> evaluation_type_to_query (List.append path [ "Evaluation" ]) v);
      (match x.target with
      | None -> []
      | Some v -> resource_target_definition_to_query (List.append path [ "Target" ]) v);
    ]

let resource_change_details_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_change_detail_to_query path
    xs

let policy_action_to_query path (x : policy_action) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ReplaceAndSnapshot -> "ReplaceAndSnapshot"
    | ReplaceAndRetain -> "ReplaceAndRetain"
    | ReplaceAndDelete -> "ReplaceAndDelete"
    | Snapshot -> "Snapshot"
    | Retain -> "Retain"
    | Delete -> "Delete")

let change_action_to_query path (x : change_action) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | SyncWithActual -> "SyncWithActual"
    | Dynamic -> "Dynamic"
    | Import -> "Import"
    | Remove -> "Remove"
    | Modify -> "Modify"
    | Add -> "Add")

let replacement_to_query path (x : replacement) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Conditional -> "Conditional" | False -> "False" | True -> "True")

let before_context_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let after_context_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let previous_deployment_context_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_change_to_query path (x : resource_change) =
  List.concat
    [
      (match x.previous_deployment_context with
      | None -> []
      | Some v ->
          previous_deployment_context_to_query (List.append path [ "PreviousDeploymentContext" ]) v);
      (match x.after_context with
      | None -> []
      | Some v -> after_context_to_query (List.append path [ "AfterContext" ]) v);
      (match x.before_context with
      | None -> []
      | Some v -> before_context_to_query (List.append path [ "BeforeContext" ]) v);
      (match x.module_info with
      | None -> []
      | Some v -> module_info_to_query (List.append path [ "ModuleInfo" ]) v);
      (match x.change_set_id with
      | None -> []
      | Some v -> change_set_id_to_query (List.append path [ "ChangeSetId" ]) v);
      (match x.details with
      | None -> []
      | Some v -> resource_change_details_to_query (List.append path [ "Details" ]) v);
      (match x.resource_drift_ignored_attributes with
      | None -> []
      | Some v ->
          resource_drift_ignored_attributes_to_query
            (List.append path [ "ResourceDriftIgnoredAttributes" ])
            v);
      (match x.resource_drift_status with
      | None -> []
      | Some v ->
          stack_resource_drift_status_to_query (List.append path [ "ResourceDriftStatus" ]) v);
      (match x.scope with None -> [] | Some v -> scope_to_query (List.append path [ "Scope" ]) v);
      (match x.replacement with
      | None -> []
      | Some v -> replacement_to_query (List.append path [ "Replacement" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> resource_type_to_query (List.append path [ "ResourceType" ]) v);
      (match x.physical_resource_id with
      | None -> []
      | Some v -> physical_resource_id_to_query (List.append path [ "PhysicalResourceId" ]) v);
      (match x.logical_resource_id with
      | None -> []
      | Some v -> logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) v);
      (match x.action with
      | None -> []
      | Some v -> change_action_to_query (List.append path [ "Action" ]) v);
      (match x.policy_action with
      | None -> []
      | Some v -> policy_action_to_query (List.append path [ "PolicyAction" ]) v);
    ]

let required_activated_type_to_query path (x : required_activated_type) =
  List.concat
    [
      (match x.supported_major_versions with
      | None -> []
      | Some v ->
          supported_major_versions_to_query (List.append path [ "SupportedMajorVersions" ]) v);
      (match x.publisher_id with
      | None -> []
      | Some v -> publisher_id_to_query (List.append path [ "PublisherId" ]) v);
      (match x.original_type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "OriginalTypeName" ]) v);
      (match x.type_name_alias with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeNameAlias" ]) v);
    ]

let required_activated_types_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" required_activated_type_to_query
    path xs

let request_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let remediation_message_status_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let remediation_message_remediation_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let related_resources_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" scanned_resource_to_query path xs

let registration_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let registration_token_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" registration_token_to_query path xs

let registration_status_to_query path (x : registration_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with FAILED -> "FAILED" | IN_PROGRESS -> "IN_PROGRESS" | COMPLETE -> "COMPLETE")

let register_type_output_to_query path (x : register_type_output) =
  List.concat
    [
      (match x.registration_token with
      | None -> []
      | Some v -> registration_token_to_query (List.append path [ "RegistrationToken" ]) v);
    ]

let log_group_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let logging_config_to_query path (x : logging_config) =
  List.concat
    [
      log_group_name_to_query (List.append path [ "LogGroupName" ]) x.log_group_name;
      role_ar_n2_to_query (List.append path [ "LogRoleArn" ]) x.log_role_arn;
    ]

let register_type_input_to_query path (x : register_type_input) =
  List.concat
    [
      (match x.client_request_token with
      | None -> []
      | Some v -> request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      (match x.execution_role_arn with
      | None -> []
      | Some v -> role_ar_n2_to_query (List.append path [ "ExecutionRoleArn" ]) v);
      (match x.logging_config with
      | None -> []
      | Some v -> logging_config_to_query (List.append path [ "LoggingConfig" ]) v);
      s3_url_to_query (List.append path [ "SchemaHandlerPackage" ]) x.schema_handler_package;
      type_name_to_query (List.append path [ "TypeName" ]) x.type_name;
      (match x.type_ with
      | None -> []
      | Some v -> registry_type_to_query (List.append path [ "Type" ]) v);
    ]

let register_publisher_output_to_query path (x : register_publisher_output) =
  List.concat
    [
      (match x.publisher_id with
      | None -> []
      | Some v -> publisher_id_to_query (List.append path [ "PublisherId" ]) v);
    ]

let accept_terms_and_conditions_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let connection_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let register_publisher_input_to_query path (x : register_publisher_input) =
  List.concat
    [
      (match x.connection_arn with
      | None -> []
      | Some v -> connection_arn_to_query (List.append path [ "ConnectionArn" ]) v);
      (match x.accept_terms_and_conditions with
      | None -> []
      | Some v ->
          accept_terms_and_conditions_to_query (List.append path [ "AcceptTermsAndConditions" ]) v);
    ]

let record_handler_progress_output_to_query path _x = []
let client_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let operation_status_to_query path (x : operation_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | FAILED -> "FAILED"
    | SUCCESS -> "SUCCESS"
    | IN_PROGRESS -> "IN_PROGRESS"
    | PENDING -> "PENDING")

let handler_error_code_to_query path (x : handler_error_code) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | UnsupportedTarget -> "UnsupportedTarget"
    | Unknown -> "Unknown"
    | NonCompliant -> "NonCompliant"
    | HandlerInternalFailure -> "HandlerInternalFailure"
    | InvalidTypeConfiguration -> "InvalidTypeConfiguration"
    | InternalFailure -> "InternalFailure"
    | NetworkFailure -> "NetworkFailure"
    | ServiceInternalError -> "ServiceInternalError"
    | GeneralServiceException -> "GeneralServiceException"
    | ServiceTimeout -> "NotStabilized"
    | ServiceLimitExceeded -> "ServiceLimitExceeded"
    | Throttling -> "Throttling"
    | ResourceConflict -> "ResourceConflict"
    | NotFound -> "NotFound"
    | AlreadyExists -> "AlreadyExists"
    | InvalidCredentials -> "InvalidCredentials"
    | AccessDenied -> "AccessDenied"
    | InvalidRequest -> "InvalidRequest"
    | NotUpdatable -> "NotUpdatable")

let record_handler_progress_input_to_query path (x : record_handler_progress_input) =
  List.concat
    [
      (match x.client_request_token with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      (match x.resource_model with
      | None -> []
      | Some v -> resource_model_to_query (List.append path [ "ResourceModel" ]) v);
      (match x.error_code with
      | None -> []
      | Some v -> handler_error_code_to_query (List.append path [ "ErrorCode" ]) v);
      (match x.status_message with
      | None -> []
      | Some v -> status_message_to_query (List.append path [ "StatusMessage" ]) v);
      (match x.current_operation_status with
      | None -> []
      | Some v -> operation_status_to_query (List.append path [ "CurrentOperationStatus" ]) v);
      operation_status_to_query (List.append path [ "OperationStatus" ]) x.operation_status;
      client_token_to_query (List.append path [ "BearerToken" ]) x.bearer_token;
    ]

let operation_status_check_failed_exception_to_query path
    (x : operation_status_check_failed_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_state_transition_exception_to_query path (x : invalid_state_transition_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let publisher_status_to_query path (x : publisher_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with UNVERIFIED -> "UNVERIFIED" | VERIFIED -> "VERIFIED")

let publisher_profile_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let publish_type_output_to_query path (x : publish_type_output) =
  List.concat
    [
      (match x.public_type_arn with
      | None -> []
      | Some v -> type_arn_to_query (List.append path [ "PublicTypeArn" ]) v);
    ]

let publish_type_input_to_query path (x : publish_type_input) =
  List.concat
    [
      (match x.public_version_number with
      | None -> []
      | Some v -> public_version_number_to_query (List.append path [ "PublicVersionNumber" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.arn with
      | None -> []
      | Some v -> private_type_arn_to_query (List.append path [ "Arn" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> third_party_type_to_query (List.append path [ "Type" ]) v);
    ]

let provisioning_type_to_query path (x : provisioning_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | FULLY_MUTABLE -> "FULLY_MUTABLE"
    | IMMUTABLE -> "IMMUTABLE"
    | NON_PROVISIONABLE -> "NON_PROVISIONABLE")

let parameter_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let allowed_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let allowed_values_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" allowed_value_to_query path xs

let parameter_constraints_to_query path (x : parameter_constraints) =
  List.concat
    [
      (match x.allowed_values with
      | None -> []
      | Some v -> allowed_values_to_query (List.append path [ "AllowedValues" ]) v);
    ]

let parameter_declaration_to_query path (x : parameter_declaration) =
  List.concat
    [
      (match x.parameter_constraints with
      | None -> []
      | Some v -> parameter_constraints_to_query (List.append path [ "ParameterConstraints" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.no_echo with
      | None -> []
      | Some v -> no_echo_to_query (List.append path [ "NoEcho" ]) v);
      (match x.parameter_type with
      | None -> []
      | Some v -> parameter_type_to_query (List.append path [ "ParameterType" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> parameter_value_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.parameter_key with
      | None -> []
      | Some v -> parameter_key_to_query (List.append path [ "ParameterKey" ]) v);
    ]

let parameter_declarations_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" parameter_declaration_to_query path
    xs

let organization_status_to_query path (x : organization_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | DISABLED_PERMANENTLY -> "DISABLED_PERMANENTLY"
    | DISABLED -> "DISABLED"
    | ENABLED -> "ENABLED")

let optional_secure_url_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let operation_result_filter_name_to_query path (x : operation_result_filter_name) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with OPERATION_RESULT_STATUS -> "OPERATION_RESULT_STATUS")

let operation_result_filter_values_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let operation_result_filter_to_query path (x : operation_result_filter) =
  List.concat
    [
      (match x.values with
      | None -> []
      | Some v -> operation_result_filter_values_to_query (List.append path [ "Values" ]) v);
      (match x.name with
      | None -> []
      | Some v -> operation_result_filter_name_to_query (List.append path [ "Name" ]) v);
    ]

let operation_result_filters_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" operation_result_filter_to_query
    path xs

let beacon_stack_operation_status_to_query path (x : beacon_stack_operation_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with FAILED -> "FAILED" | SUCCEEDED -> "SUCCEEDED" | IN_PROGRESS -> "IN_PROGRESS")

let event_type_to_query path (x : event_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | HOOK_INVOCATION_ERROR -> "HOOK_INVOCATION_ERROR"
    | PROVISIONING_ERROR -> "PROVISIONING_ERROR"
    | VALIDATION_ERROR -> "VALIDATION_ERROR"
    | PROGRESS_EVENT -> "PROGRESS_EVENT"
    | STACK_EVENT -> "STACK_EVENT")

let operation_event_to_query path (x : operation_event) =
  List.concat
    [
      (match x.validation_path with
      | None -> []
      | Some v -> validation_path_to_query (List.append path [ "ValidationPath" ]) v);
      (match x.validation_status_reason with
      | None -> []
      | Some v ->
          validation_status_reason_to_query (List.append path [ "ValidationStatusReason" ]) v);
      (match x.validation_status with
      | None -> []
      | Some v -> validation_status_to_query (List.append path [ "ValidationStatus" ]) v);
      (match x.validation_name with
      | None -> []
      | Some v -> validation_name_to_query (List.append path [ "ValidationName" ]) v);
      (match x.validation_failure_mode with
      | None -> []
      | Some v -> hook_failure_mode_to_query (List.append path [ "ValidationFailureMode" ]) v);
      (match x.detailed_status with
      | None -> []
      | Some v -> detailed_status_to_query (List.append path [ "DetailedStatus" ]) v);
      (match x.hook_failure_mode with
      | None -> []
      | Some v -> hook_failure_mode_to_query (List.append path [ "HookFailureMode" ]) v);
      (match x.hook_invocation_point with
      | None -> []
      | Some v -> hook_invocation_point_to_query (List.append path [ "HookInvocationPoint" ]) v);
      (match x.hook_status_reason with
      | None -> []
      | Some v -> hook_status_reason_to_query (List.append path [ "HookStatusReason" ]) v);
      (match x.hook_status with
      | None -> []
      | Some v -> hook_status_to_query (List.append path [ "HookStatus" ]) v);
      (match x.hook_type with
      | None -> []
      | Some v -> hook_type_to_query (List.append path [ "HookType" ]) v);
      (match x.client_request_token with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      (match x.resource_properties with
      | None -> []
      | Some v -> resource_properties_to_query (List.append path [ "ResourceProperties" ]) v);
      (match x.resource_status_reason with
      | None -> []
      | Some v -> resource_status_reason_to_query (List.append path [ "ResourceStatusReason" ]) v);
      (match x.resource_status with
      | None -> []
      | Some v -> resource_status_to_query (List.append path [ "ResourceStatus" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.timestamp with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "Timestamp" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> resource_type_to_query (List.append path [ "ResourceType" ]) v);
      (match x.physical_resource_id with
      | None -> []
      | Some v -> physical_resource_id_to_query (List.append path [ "PhysicalResourceId" ]) v);
      (match x.logical_resource_id with
      | None -> []
      | Some v -> logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) v);
      (match x.event_type with
      | None -> []
      | Some v -> event_type_to_query (List.append path [ "EventType" ]) v);
      (match x.operation_status with
      | None -> []
      | Some v -> beacon_stack_operation_status_to_query (List.append path [ "OperationStatus" ]) v);
      (match x.operation_type with
      | None -> []
      | Some v -> operation_type_to_query (List.append path [ "OperationType" ]) v);
      (match x.operation_id with
      | None -> []
      | Some v -> operation_id_to_query (List.append path [ "OperationId" ]) v);
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
      (match x.event_id with
      | None -> []
      | Some v -> event_id_to_query (List.append path [ "EventId" ]) v);
    ]

let operation_events_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" operation_event_to_query path xs

let on_stack_failure_to_query path (x : on_stack_failure) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DELETE -> "DELETE" | ROLLBACK -> "ROLLBACK" | DO_NOTHING -> "DO_NOTHING")

let on_failure_to_query path (x : on_failure) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DELETE -> "DELETE" | ROLLBACK -> "ROLLBACK" | DO_NOTHING -> "DO_NOTHING")

let next_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let name_already_exists_exception_to_query path (x : name_already_exists_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let max_results_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let major_version_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let list_types_output_to_query path (x : list_types_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.type_summaries with
      | None -> []
      | Some v -> type_summaries_to_query (List.append path [ "TypeSummaries" ]) v);
    ]

let deprecated_status_to_query path (x : deprecated_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DEPRECATED -> "DEPRECATED" | LIVE -> "LIVE")

let list_types_input_to_query path (x : list_types_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> type_filters_to_query (List.append path [ "Filters" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> registry_type_to_query (List.append path [ "Type" ]) v);
      (match x.deprecated_status with
      | None -> []
      | Some v -> deprecated_status_to_query (List.append path [ "DeprecatedStatus" ]) v);
      (match x.provisioning_type with
      | None -> []
      | Some v -> provisioning_type_to_query (List.append path [ "ProvisioningType" ]) v);
      (match x.visibility with
      | None -> []
      | Some v -> visibility_to_query (List.append path [ "Visibility" ]) v);
    ]

let list_type_versions_output_to_query path (x : list_type_versions_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.type_version_summaries with
      | None -> []
      | Some v -> type_version_summaries_to_query (List.append path [ "TypeVersionSummaries" ]) v);
    ]

let list_type_versions_input_to_query path (x : list_type_versions_input) =
  List.concat
    [
      (match x.publisher_id with
      | None -> []
      | Some v -> publisher_id_to_query (List.append path [ "PublisherId" ]) v);
      (match x.deprecated_status with
      | None -> []
      | Some v -> deprecated_status_to_query (List.append path [ "DeprecatedStatus" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.arn with None -> [] | Some v -> type_arn_to_query (List.append path [ "Arn" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> registry_type_to_query (List.append path [ "Type" ]) v);
    ]

let list_type_registrations_output_to_query path (x : list_type_registrations_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.registration_token_list with
      | None -> []
      | Some v -> registration_token_list_to_query (List.append path [ "RegistrationTokenList" ]) v);
    ]

let list_type_registrations_input_to_query path (x : list_type_registrations_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.registration_status_filter with
      | None -> []
      | Some v -> registration_status_to_query (List.append path [ "RegistrationStatusFilter" ]) v);
      (match x.type_arn with
      | None -> []
      | Some v -> type_arn_to_query (List.append path [ "TypeArn" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> registry_type_to_query (List.append path [ "Type" ]) v);
    ]

let list_stacks_output_to_query path (x : list_stacks_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.stack_summaries with
      | None -> []
      | Some v -> stack_summaries_to_query (List.append path [ "StackSummaries" ]) v);
    ]

let list_stacks_input_to_query path (x : list_stacks_input) =
  List.concat
    [
      (match x.stack_status_filter with
      | None -> []
      | Some v -> stack_status_filter_to_query (List.append path [ "StackStatusFilter" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_stack_sets_output_to_query path (x : list_stack_sets_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.summaries with
      | None -> []
      | Some v -> stack_set_summaries_to_query (List.append path [ "Summaries" ]) v);
    ]

let list_stack_sets_input_to_query path (x : list_stack_sets_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.status with
      | None -> []
      | Some v -> stack_set_status_to_query (List.append path [ "Status" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_stack_set_operations_output_to_query path (x : list_stack_set_operations_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.summaries with
      | None -> []
      | Some v -> stack_set_operation_summaries_to_query (List.append path [ "Summaries" ]) v);
    ]

let list_stack_set_operations_input_to_query path (x : list_stack_set_operations_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let list_stack_set_operation_results_output_to_query path
    (x : list_stack_set_operation_results_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.summaries with
      | None -> []
      | Some v -> stack_set_operation_result_summaries_to_query (List.append path [ "Summaries" ]) v);
    ]

let list_stack_set_operation_results_input_to_query path
    (x : list_stack_set_operation_results_input) =
  List.concat
    [
      (match x.filters with
      | None -> []
      | Some v -> operation_result_filters_to_query (List.append path [ "Filters" ]) v);
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      client_request_token_to_query (List.append path [ "OperationId" ]) x.operation_id;
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let list_stack_set_auto_deployment_targets_output_to_query path
    (x : list_stack_set_auto_deployment_targets_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.summaries with
      | None -> []
      | Some v ->
          stack_set_auto_deployment_target_summaries_to_query (List.append path [ "Summaries" ]) v);
    ]

let list_stack_set_auto_deployment_targets_input_to_query path
    (x : list_stack_set_auto_deployment_targets_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      stack_set_name_or_id_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let list_stack_resources_output_to_query path (x : list_stack_resources_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.stack_resource_summaries with
      | None -> []
      | Some v ->
          stack_resource_summaries_to_query (List.append path [ "StackResourceSummaries" ]) v);
    ]

let list_stack_resources_input_to_query path (x : list_stack_resources_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let list_stack_refactors_output_to_query path (x : list_stack_refactors_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      stack_refactor_summaries_to_query
        (List.append path [ "StackRefactorSummaries" ])
        x.stack_refactor_summaries;
    ]

let list_stack_refactors_input_to_query path (x : list_stack_refactors_input) =
  List.concat
    [
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.execution_status_filter with
      | None -> []
      | Some v ->
          stack_refactor_execution_status_filter_to_query
            (List.append path [ "ExecutionStatusFilter" ])
            v);
    ]

let list_stack_refactor_actions_output_to_query path (x : list_stack_refactor_actions_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      stack_refactor_actions_to_query
        (List.append path [ "StackRefactorActions" ])
        x.stack_refactor_actions;
    ]

let list_stack_refactor_actions_input_to_query path (x : list_stack_refactor_actions_input) =
  List.concat
    [
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      stack_refactor_id_to_query (List.append path [ "StackRefactorId" ]) x.stack_refactor_id;
    ]

let list_stack_instances_output_to_query path (x : list_stack_instances_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.summaries with
      | None -> []
      | Some v -> stack_instance_summaries_to_query (List.append path [ "Summaries" ]) v);
    ]

let list_stack_instances_input_to_query path (x : list_stack_instances_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.stack_instance_region with
      | None -> []
      | Some v -> region_to_query (List.append path [ "StackInstanceRegion" ]) v);
      (match x.stack_instance_account with
      | None -> []
      | Some v -> account_to_query (List.append path [ "StackInstanceAccount" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> stack_instance_filters_to_query (List.append path [ "Filters" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let list_stack_instance_resource_drifts_output_to_query path
    (x : list_stack_instance_resource_drifts_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.summaries with
      | None -> []
      | Some v ->
          stack_instance_resource_drifts_summaries_to_query (List.append path [ "Summaries" ]) v);
    ]

let list_stack_instance_resource_drifts_input_to_query path
    (x : list_stack_instance_resource_drifts_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      client_request_token_to_query (List.append path [ "OperationId" ]) x.operation_id;
      region_to_query (List.append path [ "StackInstanceRegion" ]) x.stack_instance_region;
      account_to_query (List.append path [ "StackInstanceAccount" ]) x.stack_instance_account;
      (match x.stack_instance_resource_drift_statuses with
      | None -> []
      | Some v ->
          stack_resource_drift_status_filters_to_query
            (List.append path [ "StackInstanceResourceDriftStatuses" ])
            v);
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      stack_set_name_or_id_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let list_resource_scans_output_to_query path (x : list_resource_scans_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.resource_scan_summaries with
      | None -> []
      | Some v -> resource_scan_summaries_to_query (List.append path [ "ResourceScanSummaries" ]) v);
    ]

let list_resource_scans_input_to_query path (x : list_resource_scans_input) =
  List.concat
    [
      (match x.scan_type_filter with
      | None -> []
      | Some v -> scan_type_to_query (List.append path [ "ScanTypeFilter" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> resource_scanner_max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_resource_scan_resources_output_to_query path (x : list_resource_scan_resources_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.resources with
      | None -> []
      | Some v -> scanned_resources_to_query (List.append path [ "Resources" ]) v);
    ]

let list_resource_scan_resources_input_to_query path (x : list_resource_scan_resources_input) =
  List.concat
    [
      (match x.max_results with
      | None -> []
      | Some v -> resource_scanner_max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.tag_value with
      | None -> []
      | Some v -> tag_value_to_query (List.append path [ "TagValue" ]) v);
      (match x.tag_key with
      | None -> []
      | Some v -> tag_key_to_query (List.append path [ "TagKey" ]) v);
      (match x.resource_type_prefix with
      | None -> []
      | Some v -> resource_type_prefix_to_query (List.append path [ "ResourceTypePrefix" ]) v);
      (match x.resource_identifier with
      | None -> []
      | Some v -> resource_identifier_to_query (List.append path [ "ResourceIdentifier" ]) v);
      resource_scan_id_to_query (List.append path [ "ResourceScanId" ]) x.resource_scan_id;
    ]

let list_resource_scan_related_resources_output_to_query path
    (x : list_resource_scan_related_resources_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.related_resources with
      | None -> []
      | Some v -> related_resources_to_query (List.append path [ "RelatedResources" ]) v);
    ]

let boxed_max_results_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let list_resource_scan_related_resources_input_to_query path
    (x : list_resource_scan_related_resources_input) =
  List.concat
    [
      (match x.max_results with
      | None -> []
      | Some v -> boxed_max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      scanned_resource_identifiers_to_query (List.append path [ "Resources" ]) x.resources;
      resource_scan_id_to_query (List.append path [ "ResourceScanId" ]) x.resource_scan_id;
    ]

let imports_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" stack_name_to_query path xs

let list_imports_output_to_query path (x : list_imports_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.imports with
      | None -> []
      | Some v -> imports_to_query (List.append path [ "Imports" ]) v);
    ]

let list_imports_input_to_query path (x : list_imports_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      export_name_to_query (List.append path [ "ExportName" ]) x.export_name;
    ]

let list_hook_results_target_type_to_query path (x : list_hook_results_target_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | CLOUD_CONTROL -> "CLOUD_CONTROL"
    | RESOURCE -> "RESOURCE"
    | STACK -> "STACK"
    | CHANGE_SET -> "CHANGE_SET")

let hook_result_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let hook_type_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let hook_type_version_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let hook_type_configuration_version_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let hook_type_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let hook_result_summary_to_query path (x : hook_result_summary) =
  List.concat
    [
      (match x.hook_execution_target with
      | None -> []
      | Some v -> hook_result_id_to_query (List.append path [ "HookExecutionTarget" ]) v);
      (match x.type_arn with
      | None -> []
      | Some v -> hook_type_arn_to_query (List.append path [ "TypeArn" ]) v);
      (match x.target_id with
      | None -> []
      | Some v -> hook_result_id_to_query (List.append path [ "TargetId" ]) v);
      (match x.target_type with
      | None -> []
      | Some v -> list_hook_results_target_type_to_query (List.append path [ "TargetType" ]) v);
      (match x.invoked_at with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "InvokedAt" ]) v);
      (match x.hook_status_reason with
      | None -> []
      | Some v -> hook_status_reason_to_query (List.append path [ "HookStatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> hook_status_to_query (List.append path [ "Status" ]) v);
      (match x.type_configuration_version_id with
      | None -> []
      | Some v ->
          hook_type_configuration_version_id_to_query
            (List.append path [ "TypeConfigurationVersionId" ])
            v);
      (match x.type_version_id with
      | None -> []
      | Some v -> hook_type_version_id_to_query (List.append path [ "TypeVersionId" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> hook_type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.failure_mode with
      | None -> []
      | Some v -> hook_failure_mode_to_query (List.append path [ "FailureMode" ]) v);
      (match x.invocation_point with
      | None -> []
      | Some v -> hook_invocation_point_to_query (List.append path [ "InvocationPoint" ]) v);
      (match x.hook_result_id with
      | None -> []
      | Some v -> hook_invocation_id_to_query (List.append path [ "HookResultId" ]) v);
    ]

let hook_result_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" hook_result_summary_to_query path xs

let list_hook_results_output_to_query path (x : list_hook_results_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.hook_results with
      | None -> []
      | Some v -> hook_result_summaries_to_query (List.append path [ "HookResults" ]) v);
      (match x.target_id with
      | None -> []
      | Some v -> hook_result_id_to_query (List.append path [ "TargetId" ]) v);
      (match x.target_type with
      | None -> []
      | Some v -> list_hook_results_target_type_to_query (List.append path [ "TargetType" ]) v);
    ]

let list_hook_results_input_to_query path (x : list_hook_results_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.status with
      | None -> []
      | Some v -> hook_status_to_query (List.append path [ "Status" ]) v);
      (match x.type_arn with
      | None -> []
      | Some v -> hook_type_arn_to_query (List.append path [ "TypeArn" ]) v);
      (match x.target_id with
      | None -> []
      | Some v -> hook_result_id_to_query (List.append path [ "TargetId" ]) v);
      (match x.target_type with
      | None -> []
      | Some v -> list_hook_results_target_type_to_query (List.append path [ "TargetType" ]) v);
    ]

let hook_result_not_found_exception_to_query path (x : hook_result_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let list_generated_templates_output_to_query path (x : list_generated_templates_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.summaries with
      | None -> []
      | Some v -> template_summaries_to_query (List.append path [ "Summaries" ]) v);
    ]

let list_generated_templates_input_to_query path (x : list_generated_templates_input) =
  List.concat
    [
      (match x.max_results with
      | None -> []
      | Some v -> max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let export_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let export__to_query path (x : export_) =
  List.concat
    [
      (match x.value with
      | None -> []
      | Some v -> export_value_to_query (List.append path [ "Value" ]) v);
      (match x.name with
      | None -> []
      | Some v -> export_name_to_query (List.append path [ "Name" ]) v);
      (match x.exporting_stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "ExportingStackId" ]) v);
    ]

let exports_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" export__to_query path xs

let list_exports_output_to_query path (x : list_exports_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.exports with
      | None -> []
      | Some v -> exports_to_query (List.append path [ "Exports" ]) v);
    ]

let list_exports_input_to_query path (x : list_exports_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let change_set_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let execution_status_to_query path (x : execution_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | OBSOLETE -> "OBSOLETE"
    | EXECUTE_FAILED -> "EXECUTE_FAILED"
    | EXECUTE_COMPLETE -> "EXECUTE_COMPLETE"
    | EXECUTE_IN_PROGRESS -> "EXECUTE_IN_PROGRESS"
    | AVAILABLE -> "AVAILABLE"
    | UNAVAILABLE -> "UNAVAILABLE")

let change_set_status_to_query path (x : change_set_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | FAILED -> "FAILED"
    | DELETE_FAILED -> "DELETE_FAILED"
    | DELETE_COMPLETE -> "DELETE_COMPLETE"
    | DELETE_IN_PROGRESS -> "DELETE_IN_PROGRESS"
    | DELETE_PENDING -> "DELETE_PENDING"
    | CREATE_COMPLETE -> "CREATE_COMPLETE"
    | CREATE_IN_PROGRESS -> "CREATE_IN_PROGRESS"
    | CREATE_PENDING -> "CREATE_PENDING")

let change_set_status_reason_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let include_nested_stacks_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let import_existing_resources_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let change_set_summary_to_query path (x : change_set_summary) =
  List.concat
    [
      (match x.import_existing_resources with
      | None -> []
      | Some v ->
          import_existing_resources_to_query (List.append path [ "ImportExistingResources" ]) v);
      (match x.root_change_set_id with
      | None -> []
      | Some v -> change_set_id_to_query (List.append path [ "RootChangeSetId" ]) v);
      (match x.parent_change_set_id with
      | None -> []
      | Some v -> change_set_id_to_query (List.append path [ "ParentChangeSetId" ]) v);
      (match x.include_nested_stacks with
      | None -> []
      | Some v -> include_nested_stacks_to_query (List.append path [ "IncludeNestedStacks" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.creation_time with
      | None -> []
      | Some v -> creation_time_to_query (List.append path [ "CreationTime" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> change_set_status_reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> change_set_status_to_query (List.append path [ "Status" ]) v);
      (match x.execution_status with
      | None -> []
      | Some v -> execution_status_to_query (List.append path [ "ExecutionStatus" ]) v);
      (match x.change_set_name with
      | None -> []
      | Some v -> change_set_name_to_query (List.append path [ "ChangeSetName" ]) v);
      (match x.change_set_id with
      | None -> []
      | Some v -> change_set_id_to_query (List.append path [ "ChangeSetId" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_to_query (List.append path [ "StackName" ]) v);
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
    ]

let change_set_summaries_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" change_set_summary_to_query path xs

let list_change_sets_output_to_query path (x : list_change_sets_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.summaries with
      | None -> []
      | Some v -> change_set_summaries_to_query (List.append path [ "Summaries" ]) v);
    ]

let list_change_sets_input_to_query path (x : list_change_sets_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      stack_name_or_id_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let limit_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let limit_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_change_set_status_exception_to_query path (x : invalid_change_set_status_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let include_property_values_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let import_stacks_to_stack_set_output_to_query path (x : import_stacks_to_stack_set_output) =
  List.concat
    [
      (match x.operation_id with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
    ]

let import_stacks_to_stack_set_input_to_query path (x : import_stacks_to_stack_set_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.operation_id with
      | None ->
          client_request_token_to_query
            (List.append path [ "OperationId" ])
            (Smaws_Lib.Uuid.generate ())
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
      (match x.operation_preferences with
      | None -> []
      | Some v ->
          stack_set_operation_preferences_to_query (List.append path [ "OperationPreferences" ]) v);
      (match x.organizational_unit_ids with
      | None -> []
      | Some v ->
          organizational_unit_id_list_to_query (List.append path [ "OrganizationalUnitIds" ]) v);
      (match x.stack_ids_url with
      | None -> []
      | Some v -> stack_ids_url_to_query (List.append path [ "StackIdsUrl" ]) v);
      (match x.stack_ids with
      | None -> []
      | Some v -> stack_id_list_to_query (List.append path [ "StackIds" ]) v);
      stack_set_name_or_id_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let hook_target_type_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let hook_target_type_to_query path (x : hook_target_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with RESOURCE -> "RESOURCE")

let hook_target_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let hook_target_action_to_query path (x : hook_target_action) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | IMPORT -> "IMPORT"
    | DELETE -> "DELETE"
    | UPDATE -> "UPDATE"
    | CREATE -> "CREATE")

let hook_target_to_query path (x : hook_target) =
  List.concat
    [
      hook_target_action_to_query (List.append path [ "Action" ]) x.action;
      hook_target_id_to_query (List.append path [ "TargetId" ]) x.target_id;
      hook_target_type_name_to_query (List.append path [ "TargetTypeName" ]) x.target_type_name;
      hook_target_type_to_query (List.append path [ "TargetType" ]) x.target_type;
    ]

let hook_invocation_count_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let get_template_summary_output_to_query path (x : get_template_summary_output) =
  List.concat
    [
      (match x.warnings with
      | None -> []
      | Some v -> warnings_to_query (List.append path [ "Warnings" ]) v);
      (match x.resource_identifier_summaries with
      | None -> []
      | Some v ->
          resource_identifier_summaries_to_query
            (List.append path [ "ResourceIdentifierSummaries" ])
            v);
      (match x.declared_transforms with
      | None -> []
      | Some v -> transforms_list_to_query (List.append path [ "DeclaredTransforms" ]) v);
      (match x.metadata with
      | None -> []
      | Some v -> metadata_to_query (List.append path [ "Metadata" ]) v);
      (match x.version with
      | None -> []
      | Some v -> version_to_query (List.append path [ "Version" ]) v);
      (match x.resource_types with
      | None -> []
      | Some v -> resource_types_to_query (List.append path [ "ResourceTypes" ]) v);
      (match x.capabilities_reason with
      | None -> []
      | Some v -> capabilities_reason_to_query (List.append path [ "CapabilitiesReason" ]) v);
      (match x.capabilities with
      | None -> []
      | Some v -> capabilities_to_query (List.append path [ "Capabilities" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameter_declarations_to_query (List.append path [ "Parameters" ]) v);
    ]

let get_template_summary_input_to_query path (x : get_template_summary_input) =
  List.concat
    [
      (match x.template_summary_config with
      | None -> []
      | Some v -> template_summary_config_to_query (List.append path [ "TemplateSummaryConfig" ]) v);
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.stack_set_name with
      | None -> []
      | Some v -> stack_set_name_or_id_to_query (List.append path [ "StackSetName" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_or_id_to_query (List.append path [ "StackName" ]) v);
      (match x.template_ur_l with
      | None -> []
      | Some v -> template_ur_l_to_query (List.append path [ "TemplateURL" ]) v);
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
    ]

let get_template_output_to_query path (x : get_template_output) =
  List.concat
    [
      (match x.stages_available with
      | None -> []
      | Some v -> stage_list_to_query (List.append path [ "StagesAvailable" ]) v);
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
    ]

let change_set_name_or_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let get_template_input_to_query path (x : get_template_input) =
  List.concat
    [
      (match x.template_stage with
      | None -> []
      | Some v -> template_stage_to_query (List.append path [ "TemplateStage" ]) v);
      (match x.change_set_name with
      | None -> []
      | Some v -> change_set_name_or_id_to_query (List.append path [ "ChangeSetName" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_to_query (List.append path [ "StackName" ]) v);
    ]

let change_set_not_found_exception_to_query path (x : change_set_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let get_stack_policy_output_to_query path (x : get_stack_policy_output) =
  List.concat
    [
      (match x.stack_policy_body with
      | None -> []
      | Some v -> stack_policy_body_to_query (List.append path [ "StackPolicyBody" ]) v);
    ]

let get_stack_policy_input_to_query path (x : get_stack_policy_input) =
  List.concat [ stack_name_to_query (List.append path [ "StackName" ]) x.stack_name ]

let annotation_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let annotation_status_to_query path (x : annotation_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SKIPPED -> "SKIPPED" | FAILED -> "FAILED" | PASSED -> "PASSED")

let annotation_remediation_link_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let annotation_severity_level_to_query path (x : annotation_severity_level) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | CRITICAL -> "CRITICAL"
    | HIGH -> "HIGH"
    | MEDIUM -> "MEDIUM"
    | LOW -> "LOW"
    | INFORMATIONAL -> "INFORMATIONAL")

let annotation_to_query path (x : annotation) =
  List.concat
    [
      (match x.severity_level with
      | None -> []
      | Some v -> annotation_severity_level_to_query (List.append path [ "SeverityLevel" ]) v);
      (match x.remediation_link with
      | None -> []
      | Some v -> annotation_remediation_link_to_query (List.append path [ "RemediationLink" ]) v);
      (match x.remediation_message with
      | None -> []
      | Some v ->
          remediation_message_remediation_message_to_query
            (List.append path [ "RemediationMessage" ])
            v);
      (match x.status_message with
      | None -> []
      | Some v ->
          remediation_message_status_message_to_query (List.append path [ "StatusMessage" ]) v);
      (match x.status with
      | None -> []
      | Some v -> annotation_status_to_query (List.append path [ "Status" ]) v);
      (match x.annotation_name with
      | None -> []
      | Some v -> annotation_name_to_query (List.append path [ "AnnotationName" ]) v);
    ]

let annotation_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" annotation_to_query path xs

let get_hook_result_output_to_query path (x : get_hook_result_output) =
  List.concat
    [
      (match x.annotations with
      | None -> []
      | Some v -> annotation_list_to_query (List.append path [ "Annotations" ]) v);
      (match x.target with
      | None -> []
      | Some v -> hook_target_to_query (List.append path [ "Target" ]) v);
      (match x.invoked_at with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "InvokedAt" ]) v);
      (match x.hook_status_reason with
      | None -> []
      | Some v -> hook_status_reason_to_query (List.append path [ "HookStatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> hook_status_to_query (List.append path [ "Status" ]) v);
      (match x.type_arn with
      | None -> []
      | Some v -> hook_type_arn_to_query (List.append path [ "TypeArn" ]) v);
      (match x.type_configuration_version_id with
      | None -> []
      | Some v ->
          hook_type_configuration_version_id_to_query
            (List.append path [ "TypeConfigurationVersionId" ])
            v);
      (match x.type_version_id with
      | None -> []
      | Some v -> hook_type_version_id_to_query (List.append path [ "TypeVersionId" ]) v);
      (match x.original_type_name with
      | None -> []
      | Some v -> hook_type_name_to_query (List.append path [ "OriginalTypeName" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> hook_type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.failure_mode with
      | None -> []
      | Some v -> hook_failure_mode_to_query (List.append path [ "FailureMode" ]) v);
      (match x.invocation_point with
      | None -> []
      | Some v -> hook_invocation_point_to_query (List.append path [ "InvocationPoint" ]) v);
      (match x.hook_result_id with
      | None -> []
      | Some v -> hook_invocation_id_to_query (List.append path [ "HookResultId" ]) v);
    ]

let get_hook_result_input_to_query path (x : get_hook_result_input) =
  List.concat
    [
      (match x.hook_result_id with
      | None -> []
      | Some v -> hook_invocation_id_to_query (List.append path [ "HookResultId" ]) v);
    ]

let get_generated_template_output_to_query path (x : get_generated_template_output) =
  List.concat
    [
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
      (match x.status with
      | None -> []
      | Some v -> generated_template_status_to_query (List.append path [ "Status" ]) v);
    ]

let get_generated_template_input_to_query path (x : get_generated_template_input) =
  List.concat
    [
      generated_template_name_to_query
        (List.append path [ "GeneratedTemplateName" ])
        x.generated_template_name;
      (match x.format with
      | None -> []
      | Some v -> template_format_to_query (List.append path [ "Format" ]) v);
    ]

let failed_events_filter_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let execute_stack_refactor_input_to_query path (x : execute_stack_refactor_input) =
  List.concat
    [ stack_refactor_id_to_query (List.append path [ "StackRefactorId" ]) x.stack_refactor_id ]

let execute_change_set_output_to_query path _x = []

let execute_change_set_input_to_query path (x : execute_change_set_input) =
  List.concat
    [
      (match x.retain_except_on_create with
      | None -> []
      | Some v -> retain_except_on_create_to_query (List.append path [ "RetainExceptOnCreate" ]) v);
      (match x.disable_rollback with
      | None -> []
      | Some v -> disable_rollback_to_query (List.append path [ "DisableRollback" ]) v);
      (match x.client_request_token with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_or_id_to_query (List.append path [ "StackName" ]) v);
      change_set_name_or_id_to_query (List.append path [ "ChangeSetName" ]) x.change_set_name;
    ]

let event_filter_to_query path (x : event_filter) =
  List.concat
    [
      (match x.failed_events with
      | None -> []
      | Some v -> failed_events_filter_to_query (List.append path [ "FailedEvents" ]) v);
    ]

let estimate_template_cost_output_to_query path (x : estimate_template_cost_output) =
  List.concat
    [ (match x.url with None -> [] | Some v -> url_to_query (List.append path [ "Url" ]) v) ]

let estimate_template_cost_input_to_query path (x : estimate_template_cost_input) =
  List.concat
    [
      (match x.parameters with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "Parameters" ]) v);
      (match x.template_ur_l with
      | None -> []
      | Some v -> template_ur_l_to_query (List.append path [ "TemplateURL" ]) v);
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
    ]

let error_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let enable_stack_creation_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let detect_stack_set_drift_output_to_query path (x : detect_stack_set_drift_output) =
  List.concat
    [
      (match x.operation_id with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
    ]

let detect_stack_set_drift_input_to_query path (x : detect_stack_set_drift_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.operation_id with
      | None ->
          client_request_token_to_query
            (List.append path [ "OperationId" ])
            (Smaws_Lib.Uuid.generate ())
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
      (match x.operation_preferences with
      | None -> []
      | Some v ->
          stack_set_operation_preferences_to_query (List.append path [ "OperationPreferences" ]) v);
      stack_set_name_or_id_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let detect_stack_resource_drift_output_to_query path (x : detect_stack_resource_drift_output) =
  List.concat
    [
      stack_resource_drift_to_query
        (List.append path [ "StackResourceDrift" ])
        x.stack_resource_drift;
    ]

let detect_stack_resource_drift_input_to_query path (x : detect_stack_resource_drift_input) =
  List.concat
    [
      logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) x.logical_resource_id;
      stack_name_or_id_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let detect_stack_drift_output_to_query path (x : detect_stack_drift_output) =
  List.concat
    [
      stack_drift_detection_id_to_query
        (List.append path [ "StackDriftDetectionId" ])
        x.stack_drift_detection_id;
    ]

let detect_stack_drift_input_to_query path (x : detect_stack_drift_input) =
  List.concat
    [
      (match x.logical_resource_ids with
      | None -> []
      | Some v -> logical_resource_ids_to_query (List.append path [ "LogicalResourceIds" ]) v);
      stack_name_or_id_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let describe_type_registration_output_to_query path (x : describe_type_registration_output) =
  List.concat
    [
      (match x.type_version_arn with
      | None -> []
      | Some v -> type_arn_to_query (List.append path [ "TypeVersionArn" ]) v);
      (match x.type_arn with
      | None -> []
      | Some v -> type_arn_to_query (List.append path [ "TypeArn" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.progress_status with
      | None -> []
      | Some v -> registration_status_to_query (List.append path [ "ProgressStatus" ]) v);
    ]

let describe_type_registration_input_to_query path (x : describe_type_registration_input) =
  List.concat
    [ registration_token_to_query (List.append path [ "RegistrationToken" ]) x.registration_token ]

let configuration_schema_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let auto_update_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let describe_type_output_to_query path (x : describe_type_output) =
  List.concat
    [
      (match x.auto_update with
      | None -> []
      | Some v -> auto_update_to_query (List.append path [ "AutoUpdate" ]) v);
      (match x.is_activated with
      | None -> []
      | Some v -> is_activated_to_query (List.append path [ "IsActivated" ]) v);
      (match x.latest_public_version with
      | None -> []
      | Some v -> public_version_number_to_query (List.append path [ "LatestPublicVersion" ]) v);
      (match x.public_version_number with
      | None -> []
      | Some v -> public_version_number_to_query (List.append path [ "PublicVersionNumber" ]) v);
      (match x.original_type_arn with
      | None -> []
      | Some v -> type_arn_to_query (List.append path [ "OriginalTypeArn" ]) v);
      (match x.original_type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "OriginalTypeName" ]) v);
      (match x.publisher_id with
      | None -> []
      | Some v -> publisher_id_to_query (List.append path [ "PublisherId" ]) v);
      (match x.configuration_schema with
      | None -> []
      | Some v -> configuration_schema_to_query (List.append path [ "ConfigurationSchema" ]) v);
      (match x.time_created with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "TimeCreated" ]) v);
      (match x.last_updated with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "LastUpdated" ]) v);
      (match x.documentation_url with
      | None -> []
      | Some v -> optional_secure_url_to_query (List.append path [ "DocumentationUrl" ]) v);
      (match x.source_url with
      | None -> []
      | Some v -> optional_secure_url_to_query (List.append path [ "SourceUrl" ]) v);
      (match x.visibility with
      | None -> []
      | Some v -> visibility_to_query (List.append path [ "Visibility" ]) v);
      (match x.execution_role_arn with
      | None -> []
      | Some v -> role_ar_n2_to_query (List.append path [ "ExecutionRoleArn" ]) v);
      (match x.required_activated_types with
      | None -> []
      | Some v ->
          required_activated_types_to_query (List.append path [ "RequiredActivatedTypes" ]) v);
      (match x.logging_config with
      | None -> []
      | Some v -> logging_config_to_query (List.append path [ "LoggingConfig" ]) v);
      (match x.deprecated_status with
      | None -> []
      | Some v -> deprecated_status_to_query (List.append path [ "DeprecatedStatus" ]) v);
      (match x.provisioning_type with
      | None -> []
      | Some v -> provisioning_type_to_query (List.append path [ "ProvisioningType" ]) v);
      (match x.schema with
      | None -> []
      | Some v -> type_schema_to_query (List.append path [ "Schema" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.type_tests_status_description with
      | None -> []
      | Some v ->
          type_tests_status_description_to_query
            (List.append path [ "TypeTestsStatusDescription" ])
            v);
      (match x.type_tests_status with
      | None -> []
      | Some v -> type_tests_status_to_query (List.append path [ "TypeTestsStatus" ]) v);
      (match x.is_default_version with
      | None -> []
      | Some v -> is_default_version_to_query (List.append path [ "IsDefaultVersion" ]) v);
      (match x.default_version_id with
      | None -> []
      | Some v -> type_version_id_to_query (List.append path [ "DefaultVersionId" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> registry_type_to_query (List.append path [ "Type" ]) v);
      (match x.arn with None -> [] | Some v -> type_arn_to_query (List.append path [ "Arn" ]) v);
    ]

let describe_type_input_to_query path (x : describe_type_input) =
  List.concat
    [
      (match x.public_version_number with
      | None -> []
      | Some v -> public_version_number_to_query (List.append path [ "PublicVersionNumber" ]) v);
      (match x.publisher_id with
      | None -> []
      | Some v -> publisher_id_to_query (List.append path [ "PublisherId" ]) v);
      (match x.version_id with
      | None -> []
      | Some v -> type_version_id_to_query (List.append path [ "VersionId" ]) v);
      (match x.arn with None -> [] | Some v -> type_arn_to_query (List.append path [ "Arn" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> registry_type_to_query (List.append path [ "Type" ]) v);
    ]

let describe_stacks_output_to_query path (x : describe_stacks_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.stacks with
      | None -> []
      | Some v -> stacks_to_query (List.append path [ "Stacks" ]) v);
    ]

let describe_stacks_input_to_query path (x : describe_stacks_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_to_query (List.append path [ "StackName" ]) v);
    ]

let describe_stack_set_output_to_query path (x : describe_stack_set_output) =
  List.concat
    [
      (match x.stack_set with
      | None -> []
      | Some v -> stack_set_to_query (List.append path [ "StackSet" ]) v);
    ]

let describe_stack_set_operation_output_to_query path (x : describe_stack_set_operation_output) =
  List.concat
    [
      (match x.stack_set_operation with
      | None -> []
      | Some v -> stack_set_operation_to_query (List.append path [ "StackSetOperation" ]) v);
    ]

let describe_stack_set_operation_input_to_query path (x : describe_stack_set_operation_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      client_request_token_to_query (List.append path [ "OperationId" ]) x.operation_id;
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let describe_stack_set_input_to_query path (x : describe_stack_set_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let describe_stack_resources_output_to_query path (x : describe_stack_resources_output) =
  List.concat
    [
      (match x.stack_resources with
      | None -> []
      | Some v -> stack_resources_to_query (List.append path [ "StackResources" ]) v);
    ]

let describe_stack_resources_input_to_query path (x : describe_stack_resources_input) =
  List.concat
    [
      (match x.physical_resource_id with
      | None -> []
      | Some v -> physical_resource_id_to_query (List.append path [ "PhysicalResourceId" ]) v);
      (match x.logical_resource_id with
      | None -> []
      | Some v -> logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_to_query (List.append path [ "StackName" ]) v);
    ]

let describe_stack_resource_output_to_query path (x : describe_stack_resource_output) =
  List.concat
    [
      (match x.stack_resource_detail with
      | None -> []
      | Some v -> stack_resource_detail_to_query (List.append path [ "StackResourceDetail" ]) v);
    ]

let describe_stack_resource_input_to_query path (x : describe_stack_resource_input) =
  List.concat
    [
      logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) x.logical_resource_id;
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let describe_stack_resource_drifts_output_to_query path (x : describe_stack_resource_drifts_output)
    =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      stack_resource_drifts_to_query
        (List.append path [ "StackResourceDrifts" ])
        x.stack_resource_drifts;
    ]

let describe_stack_resource_drifts_input_to_query path (x : describe_stack_resource_drifts_input) =
  List.concat
    [
      (match x.max_results with
      | None -> []
      | Some v -> boxed_max_results_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.stack_resource_drift_status_filters with
      | None -> []
      | Some v ->
          stack_resource_drift_status_filters_to_query
            (List.append path [ "StackResourceDriftStatusFilters" ])
            v);
      stack_name_or_id_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let describe_stack_refactor_output_to_query path (x : describe_stack_refactor_output) =
  List.concat
    [
      (match x.status_reason with
      | None -> []
      | Some v -> stack_refactor_status_reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> stack_refactor_status_to_query (List.append path [ "Status" ]) v);
      (match x.execution_status_reason with
      | None -> []
      | Some v -> execution_status_reason_to_query (List.append path [ "ExecutionStatusReason" ]) v);
      (match x.execution_status with
      | None -> []
      | Some v ->
          stack_refactor_execution_status_to_query (List.append path [ "ExecutionStatus" ]) v);
      (match x.stack_ids with
      | None -> []
      | Some v -> stack_ids_to_query (List.append path [ "StackIds" ]) v);
      (match x.stack_refactor_id with
      | None -> []
      | Some v -> stack_refactor_id_to_query (List.append path [ "StackRefactorId" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
    ]

let describe_stack_refactor_input_to_query path (x : describe_stack_refactor_input) =
  List.concat
    [ stack_refactor_id_to_query (List.append path [ "StackRefactorId" ]) x.stack_refactor_id ]

let describe_stack_instance_output_to_query path (x : describe_stack_instance_output) =
  List.concat
    [
      (match x.stack_instance with
      | None -> []
      | Some v -> stack_instance_to_query (List.append path [ "StackInstance" ]) v);
    ]

let describe_stack_instance_input_to_query path (x : describe_stack_instance_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      region_to_query (List.append path [ "StackInstanceRegion" ]) x.stack_instance_region;
      account_to_query (List.append path [ "StackInstanceAccount" ]) x.stack_instance_account;
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let describe_stack_events_output_to_query path (x : describe_stack_events_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.stack_events with
      | None -> []
      | Some v -> stack_events_to_query (List.append path [ "StackEvents" ]) v);
    ]

let describe_stack_events_input_to_query path (x : describe_stack_events_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let boxed_integer_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let describe_stack_drift_detection_status_output_to_query path
    (x : describe_stack_drift_detection_status_output) =
  List.concat
    [
      timestamp_to_query (List.append path [ "Timestamp" ]) x.timestamp;
      (match x.drifted_stack_resource_count with
      | None -> []
      | Some v -> boxed_integer_to_query (List.append path [ "DriftedStackResourceCount" ]) v);
      (match x.detection_status_reason with
      | None -> []
      | Some v ->
          stack_drift_detection_status_reason_to_query
            (List.append path [ "DetectionStatusReason" ])
            v);
      stack_drift_detection_status_to_query
        (List.append path [ "DetectionStatus" ])
        x.detection_status;
      (match x.stack_drift_status with
      | None -> []
      | Some v -> stack_drift_status_to_query (List.append path [ "StackDriftStatus" ]) v);
      stack_drift_detection_id_to_query
        (List.append path [ "StackDriftDetectionId" ])
        x.stack_drift_detection_id;
      stack_id_to_query (List.append path [ "StackId" ]) x.stack_id;
    ]

let describe_stack_drift_detection_status_input_to_query path
    (x : describe_stack_drift_detection_status_input) =
  List.concat
    [
      stack_drift_detection_id_to_query
        (List.append path [ "StackDriftDetectionId" ])
        x.stack_drift_detection_id;
    ]

let describe_resource_scan_output_to_query path (x : describe_resource_scan_output) =
  List.concat
    [
      (match x.scan_filters with
      | None -> []
      | Some v -> scan_filters_to_query (List.append path [ "ScanFilters" ]) v);
      (match x.resources_read with
      | None -> []
      | Some v -> resources_read_to_query (List.append path [ "ResourcesRead" ]) v);
      (match x.resources_scanned with
      | None -> []
      | Some v -> resources_scanned_to_query (List.append path [ "ResourcesScanned" ]) v);
      (match x.resource_types with
      | None -> []
      | Some v -> resource_types_to_query (List.append path [ "ResourceTypes" ]) v);
      (match x.percentage_completed with
      | None -> []
      | Some v -> percentage_completed_to_query (List.append path [ "PercentageCompleted" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> resource_scan_status_reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> resource_scan_status_to_query (List.append path [ "Status" ]) v);
      (match x.resource_scan_id with
      | None -> []
      | Some v -> resource_scan_id_to_query (List.append path [ "ResourceScanId" ]) v);
    ]

let describe_resource_scan_input_to_query path (x : describe_resource_scan_input) =
  List.concat
    [ resource_scan_id_to_query (List.append path [ "ResourceScanId" ]) x.resource_scan_id ]

let describe_publisher_output_to_query path (x : describe_publisher_output) =
  List.concat
    [
      (match x.publisher_profile with
      | None -> []
      | Some v -> publisher_profile_to_query (List.append path [ "PublisherProfile" ]) v);
      (match x.identity_provider with
      | None -> []
      | Some v -> identity_provider_to_query (List.append path [ "IdentityProvider" ]) v);
      (match x.publisher_status with
      | None -> []
      | Some v -> publisher_status_to_query (List.append path [ "PublisherStatus" ]) v);
      (match x.publisher_id with
      | None -> []
      | Some v -> publisher_id_to_query (List.append path [ "PublisherId" ]) v);
    ]

let describe_publisher_input_to_query path (x : describe_publisher_input) =
  List.concat
    [
      (match x.publisher_id with
      | None -> []
      | Some v -> publisher_id_to_query (List.append path [ "PublisherId" ]) v);
    ]

let describe_organizations_access_output_to_query path (x : describe_organizations_access_output) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> organization_status_to_query (List.append path [ "Status" ]) v);
    ]

let describe_organizations_access_input_to_query path (x : describe_organizations_access_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
    ]

let describe_generated_template_output_to_query path (x : describe_generated_template_output) =
  List.concat
    [
      (match x.total_warnings with
      | None -> []
      | Some v -> total_warnings_to_query (List.append path [ "TotalWarnings" ]) v);
      (match x.template_configuration with
      | None -> []
      | Some v -> template_configuration_to_query (List.append path [ "TemplateConfiguration" ]) v);
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
      (match x.progress with
      | None -> []
      | Some v -> template_progress_to_query (List.append path [ "Progress" ]) v);
      (match x.last_updated_time with
      | None -> []
      | Some v -> last_updated_time_to_query (List.append path [ "LastUpdatedTime" ]) v);
      (match x.creation_time with
      | None -> []
      | Some v -> creation_time_to_query (List.append path [ "CreationTime" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> template_status_reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> generated_template_status_to_query (List.append path [ "Status" ]) v);
      (match x.resources with
      | None -> []
      | Some v -> resource_details_to_query (List.append path [ "Resources" ]) v);
      (match x.generated_template_name with
      | None -> []
      | Some v -> generated_template_name_to_query (List.append path [ "GeneratedTemplateName" ]) v);
      (match x.generated_template_id with
      | None -> []
      | Some v -> generated_template_id_to_query (List.append path [ "GeneratedTemplateId" ]) v);
    ]

let describe_generated_template_input_to_query path (x : describe_generated_template_input) =
  List.concat
    [
      generated_template_name_to_query
        (List.append path [ "GeneratedTemplateName" ])
        x.generated_template_name;
    ]

let describe_events_output_to_query path (x : describe_events_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.operation_events with
      | None -> []
      | Some v -> operation_events_to_query (List.append path [ "OperationEvents" ]) v);
    ]

let describe_events_input_to_query path (x : describe_events_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> event_filter_to_query (List.append path [ "Filters" ]) v);
      (match x.operation_id with
      | None -> []
      | Some v -> operation_id_to_query (List.append path [ "OperationId" ]) v);
      (match x.change_set_name with
      | None -> []
      | Some v -> change_set_name_or_id_to_query (List.append path [ "ChangeSetName" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_or_id_to_query (List.append path [ "StackName" ]) v);
    ]

let change_type_to_query path (x : change_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with Resource -> "Resource")

let change_to_query path (x : change) =
  List.concat
    [
      (match x.resource_change with
      | None -> []
      | Some v -> resource_change_to_query (List.append path [ "ResourceChange" ]) v);
      (match x.hook_invocation_count with
      | None -> []
      | Some v -> hook_invocation_count_to_query (List.append path [ "HookInvocationCount" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> change_type_to_query (List.append path [ "Type" ]) v);
    ]

let changes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" change_to_query path xs

let deployment_mode_to_query path (x : deployment_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with REVERT_DRIFT -> "REVERT_DRIFT")

let describe_change_set_output_to_query path (x : describe_change_set_output) =
  List.concat
    [
      (match x.deployment_config with
      | None -> []
      | Some v -> deployment_config_to_query (List.append path [ "DeploymentConfig" ]) v);
      (match x.deployment_mode with
      | None -> []
      | Some v -> deployment_mode_to_query (List.append path [ "DeploymentMode" ]) v);
      (match x.import_existing_resources with
      | None -> []
      | Some v ->
          import_existing_resources_to_query (List.append path [ "ImportExistingResources" ]) v);
      (match x.on_stack_failure with
      | None -> []
      | Some v -> on_stack_failure_to_query (List.append path [ "OnStackFailure" ]) v);
      (match x.root_change_set_id with
      | None -> []
      | Some v -> change_set_id_to_query (List.append path [ "RootChangeSetId" ]) v);
      (match x.parent_change_set_id with
      | None -> []
      | Some v -> change_set_id_to_query (List.append path [ "ParentChangeSetId" ]) v);
      (match x.include_nested_stacks with
      | None -> []
      | Some v -> include_nested_stacks_to_query (List.append path [ "IncludeNestedStacks" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.changes with
      | None -> []
      | Some v -> changes_to_query (List.append path [ "Changes" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
      (match x.capabilities with
      | None -> []
      | Some v -> capabilities_to_query (List.append path [ "Capabilities" ]) v);
      (match x.rollback_configuration with
      | None -> []
      | Some v -> rollback_configuration_to_query (List.append path [ "RollbackConfiguration" ]) v);
      (match x.notification_ar_ns with
      | None -> []
      | Some v -> notification_ar_ns_to_query (List.append path [ "NotificationARNs" ]) v);
      (match x.stack_drift_status with
      | None -> []
      | Some v -> stack_drift_status_to_query (List.append path [ "StackDriftStatus" ]) v);
      (match x.status_reason with
      | None -> []
      | Some v -> change_set_status_reason_to_query (List.append path [ "StatusReason" ]) v);
      (match x.status with
      | None -> []
      | Some v -> change_set_status_to_query (List.append path [ "Status" ]) v);
      (match x.execution_status with
      | None -> []
      | Some v -> execution_status_to_query (List.append path [ "ExecutionStatus" ]) v);
      (match x.creation_time with
      | None -> []
      | Some v -> creation_time_to_query (List.append path [ "CreationTime" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "Parameters" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_to_query (List.append path [ "StackName" ]) v);
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
      (match x.change_set_id with
      | None -> []
      | Some v -> change_set_id_to_query (List.append path [ "ChangeSetId" ]) v);
      (match x.change_set_name with
      | None -> []
      | Some v -> change_set_name_to_query (List.append path [ "ChangeSetName" ]) v);
    ]

let describe_change_set_input_to_query path (x : describe_change_set_input) =
  List.concat
    [
      (match x.include_property_values with
      | None -> []
      | Some v -> include_property_values_to_query (List.append path [ "IncludePropertyValues" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_or_id_to_query (List.append path [ "StackName" ]) v);
      change_set_name_or_id_to_query (List.append path [ "ChangeSetName" ]) x.change_set_name;
    ]

let change_set_hook_resource_target_details_to_query path
    (x : change_set_hook_resource_target_details) =
  List.concat
    [
      (match x.resource_action with
      | None -> []
      | Some v -> change_action_to_query (List.append path [ "ResourceAction" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> hook_target_type_name_to_query (List.append path [ "ResourceType" ]) v);
      (match x.logical_resource_id with
      | None -> []
      | Some v -> logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) v);
    ]

let change_set_hook_target_details_to_query path (x : change_set_hook_target_details) =
  List.concat
    [
      (match x.resource_target_details with
      | None -> []
      | Some v ->
          change_set_hook_resource_target_details_to_query
            (List.append path [ "ResourceTargetDetails" ])
            v);
      (match x.target_type with
      | None -> []
      | Some v -> hook_target_type_to_query (List.append path [ "TargetType" ]) v);
    ]

let change_set_hook_to_query path (x : change_set_hook) =
  List.concat
    [
      (match x.target_details with
      | None -> []
      | Some v -> change_set_hook_target_details_to_query (List.append path [ "TargetDetails" ]) v);
      (match x.type_configuration_version_id with
      | None -> []
      | Some v ->
          hook_type_configuration_version_id_to_query
            (List.append path [ "TypeConfigurationVersionId" ])
            v);
      (match x.type_version_id with
      | None -> []
      | Some v -> hook_type_version_id_to_query (List.append path [ "TypeVersionId" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> hook_type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.failure_mode with
      | None -> []
      | Some v -> hook_failure_mode_to_query (List.append path [ "FailureMode" ]) v);
      (match x.invocation_point with
      | None -> []
      | Some v -> hook_invocation_point_to_query (List.append path [ "InvocationPoint" ]) v);
    ]

let change_set_hooks_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" change_set_hook_to_query path xs

let change_set_hooks_status_to_query path (x : change_set_hooks_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with UNAVAILABLE -> "UNAVAILABLE" | PLANNED -> "PLANNED" | PLANNING -> "PLANNING")

let describe_change_set_hooks_output_to_query path (x : describe_change_set_hooks_output) =
  List.concat
    [
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_to_query (List.append path [ "StackName" ]) v);
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.status with
      | None -> []
      | Some v -> change_set_hooks_status_to_query (List.append path [ "Status" ]) v);
      (match x.hooks with
      | None -> []
      | Some v -> change_set_hooks_to_query (List.append path [ "Hooks" ]) v);
      (match x.change_set_name with
      | None -> []
      | Some v -> change_set_name_to_query (List.append path [ "ChangeSetName" ]) v);
      (match x.change_set_id with
      | None -> []
      | Some v -> change_set_id_to_query (List.append path [ "ChangeSetId" ]) v);
    ]

let describe_change_set_hooks_input_to_query path (x : describe_change_set_hooks_input) =
  List.concat
    [
      (match x.logical_resource_id with
      | None -> []
      | Some v -> logical_resource_id_to_query (List.append path [ "LogicalResourceId" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_or_id_to_query (List.append path [ "StackName" ]) v);
      change_set_name_or_id_to_query (List.append path [ "ChangeSetName" ]) x.change_set_name;
    ]

let account_limit_to_query path (x : account_limit) =
  List.concat
    [
      (match x.value with
      | None -> []
      | Some v -> limit_value_to_query (List.append path [ "Value" ]) v);
      (match x.name with
      | None -> []
      | Some v -> limit_name_to_query (List.append path [ "Name" ]) v);
    ]

let account_limit_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" account_limit_to_query path xs

let describe_account_limits_output_to_query path (x : describe_account_limits_output) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.account_limits with
      | None -> []
      | Some v -> account_limit_list_to_query (List.append path [ "AccountLimits" ]) v);
    ]

let describe_account_limits_input_to_query path (x : describe_account_limits_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let deregister_type_output_to_query path _x = []

let deregister_type_input_to_query path (x : deregister_type_input) =
  List.concat
    [
      (match x.version_id with
      | None -> []
      | Some v -> type_version_id_to_query (List.append path [ "VersionId" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> registry_type_to_query (List.append path [ "Type" ]) v);
      (match x.arn with
      | None -> []
      | Some v -> private_type_arn_to_query (List.append path [ "Arn" ]) v);
    ]

let delete_stack_set_output_to_query path _x = []

let delete_stack_set_input_to_query path (x : delete_stack_set_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let delete_stack_instances_output_to_query path (x : delete_stack_instances_output) =
  List.concat
    [
      (match x.operation_id with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
    ]

let delete_stack_instances_input_to_query path (x : delete_stack_instances_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.operation_id with
      | None ->
          client_request_token_to_query
            (List.append path [ "OperationId" ])
            (Smaws_Lib.Uuid.generate ())
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
      retain_stacks_to_query (List.append path [ "RetainStacks" ]) x.retain_stacks;
      (match x.operation_preferences with
      | None -> []
      | Some v ->
          stack_set_operation_preferences_to_query (List.append path [ "OperationPreferences" ]) v);
      region_list_to_query (List.append path [ "Regions" ]) x.regions;
      (match x.deployment_targets with
      | None -> []
      | Some v -> deployment_targets_to_query (List.append path [ "DeploymentTargets" ]) v);
      (match x.accounts with
      | None -> []
      | Some v -> account_list_to_query (List.append path [ "Accounts" ]) v);
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let delete_stack_input_to_query path (x : delete_stack_input) =
  List.concat
    [
      (match x.deployment_config with
      | None -> []
      | Some v -> deployment_config_to_query (List.append path [ "DeploymentConfig" ]) v);
      (match x.deletion_mode with
      | None -> []
      | Some v -> deletion_mode_to_query (List.append path [ "DeletionMode" ]) v);
      (match x.client_request_token with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> role_ar_n_to_query (List.append path [ "RoleARN" ]) v);
      (match x.retain_resources with
      | None -> []
      | Some v -> retain_resources_to_query (List.append path [ "RetainResources" ]) v);
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let delete_generated_template_input_to_query path (x : delete_generated_template_input) =
  List.concat
    [
      generated_template_name_to_query
        (List.append path [ "GeneratedTemplateName" ])
        x.generated_template_name;
    ]

let concurrent_resources_limit_exceeded_exception_to_query path
    (x : concurrent_resources_limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let delete_change_set_output_to_query path _x = []

let delete_change_set_input_to_query path (x : delete_change_set_input) =
  List.concat
    [
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_or_id_to_query (List.append path [ "StackName" ]) v);
      change_set_name_or_id_to_query (List.append path [ "ChangeSetName" ]) x.change_set_name;
    ]

let deactivate_type_output_to_query path _x = []

let deactivate_type_input_to_query path (x : deactivate_type_input) =
  List.concat
    [
      (match x.arn with
      | None -> []
      | Some v -> private_type_arn_to_query (List.append path [ "Arn" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> third_party_type_to_query (List.append path [ "Type" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
    ]

let deactivate_organizations_access_output_to_query path _x = []
let deactivate_organizations_access_input_to_query path _x = []

let created_but_modified_exception_to_query path (x : created_but_modified_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let create_stack_set_output_to_query path (x : create_stack_set_output) =
  List.concat
    [
      (match x.stack_set_id with
      | None -> []
      | Some v -> stack_set_id_to_query (List.append path [ "StackSetId" ]) v);
    ]

let create_stack_set_input_to_query path (x : create_stack_set_input) =
  List.concat
    [
      (match x.managed_execution with
      | None -> []
      | Some v -> managed_execution_to_query (List.append path [ "ManagedExecution" ]) v);
      (match x.client_request_token with
      | None ->
          client_request_token_to_query
            (List.append path [ "ClientRequestToken" ])
            (Smaws_Lib.Uuid.generate ())
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.auto_deployment with
      | None -> []
      | Some v -> auto_deployment_to_query (List.append path [ "AutoDeployment" ]) v);
      (match x.permission_model with
      | None -> []
      | Some v -> permission_models_to_query (List.append path [ "PermissionModel" ]) v);
      (match x.execution_role_name with
      | None -> []
      | Some v -> execution_role_name_to_query (List.append path [ "ExecutionRoleName" ]) v);
      (match x.administration_role_ar_n with
      | None -> []
      | Some v -> role_ar_n_to_query (List.append path [ "AdministrationRoleARN" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
      (match x.capabilities with
      | None -> []
      | Some v -> capabilities_to_query (List.append path [ "Capabilities" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "Parameters" ]) v);
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
      (match x.template_ur_l with
      | None -> []
      | Some v -> template_ur_l_to_query (List.append path [ "TemplateURL" ]) v);
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let create_stack_refactor_output_to_query path (x : create_stack_refactor_output) =
  List.concat
    [ stack_refactor_id_to_query (List.append path [ "StackRefactorId" ]) x.stack_refactor_id ]

let create_stack_refactor_input_to_query path (x : create_stack_refactor_input) =
  List.concat
    [
      stack_definitions_to_query (List.append path [ "StackDefinitions" ]) x.stack_definitions;
      (match x.resource_mappings with
      | None -> []
      | Some v -> resource_mappings_to_query (List.append path [ "ResourceMappings" ]) v);
      (match x.enable_stack_creation with
      | None -> []
      | Some v -> enable_stack_creation_to_query (List.append path [ "EnableStackCreation" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
    ]

let create_stack_output_to_query path (x : create_stack_output) =
  List.concat
    [
      (match x.operation_id with
      | None -> []
      | Some v -> operation_id_to_query (List.append path [ "OperationId" ]) v);
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
    ]

let create_stack_instances_output_to_query path (x : create_stack_instances_output) =
  List.concat
    [
      (match x.operation_id with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
    ]

let create_stack_instances_input_to_query path (x : create_stack_instances_input) =
  List.concat
    [
      (match x.call_as with
      | None -> []
      | Some v -> call_as_to_query (List.append path [ "CallAs" ]) v);
      (match x.operation_id with
      | None ->
          client_request_token_to_query
            (List.append path [ "OperationId" ])
            (Smaws_Lib.Uuid.generate ())
      | Some v -> client_request_token_to_query (List.append path [ "OperationId" ]) v);
      (match x.operation_preferences with
      | None -> []
      | Some v ->
          stack_set_operation_preferences_to_query (List.append path [ "OperationPreferences" ]) v);
      (match x.parameter_overrides with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "ParameterOverrides" ]) v);
      region_list_to_query (List.append path [ "Regions" ]) x.regions;
      (match x.deployment_targets with
      | None -> []
      | Some v -> deployment_targets_to_query (List.append path [ "DeploymentTargets" ]) v);
      (match x.accounts with
      | None -> []
      | Some v -> account_list_to_query (List.append path [ "Accounts" ]) v);
      stack_set_name_to_query (List.append path [ "StackSetName" ]) x.stack_set_name;
    ]

let create_stack_input_to_query path (x : create_stack_input) =
  List.concat
    [
      (match x.disable_validation with
      | None -> []
      | Some v -> disable_validation_to_query (List.append path [ "DisableValidation" ]) v);
      (match x.deployment_config with
      | None -> []
      | Some v -> deployment_config_to_query (List.append path [ "DeploymentConfig" ]) v);
      (match x.retain_except_on_create with
      | None -> []
      | Some v -> retain_except_on_create_to_query (List.append path [ "RetainExceptOnCreate" ]) v);
      (match x.enable_termination_protection with
      | None -> []
      | Some v ->
          enable_termination_protection_to_query
            (List.append path [ "EnableTerminationProtection" ])
            v);
      (match x.client_request_token with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
      (match x.stack_policy_ur_l with
      | None -> []
      | Some v -> stack_policy_ur_l_to_query (List.append path [ "StackPolicyURL" ]) v);
      (match x.stack_policy_body with
      | None -> []
      | Some v -> stack_policy_body_to_query (List.append path [ "StackPolicyBody" ]) v);
      (match x.on_failure with
      | None -> []
      | Some v -> on_failure_to_query (List.append path [ "OnFailure" ]) v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> role_ar_n_to_query (List.append path [ "RoleARN" ]) v);
      (match x.resource_types with
      | None -> []
      | Some v -> resource_types_to_query (List.append path [ "ResourceTypes" ]) v);
      (match x.capabilities with
      | None -> []
      | Some v -> capabilities_to_query (List.append path [ "Capabilities" ]) v);
      (match x.notification_ar_ns with
      | None -> []
      | Some v -> notification_ar_ns_to_query (List.append path [ "NotificationARNs" ]) v);
      (match x.timeout_in_minutes with
      | None -> []
      | Some v -> timeout_minutes_to_query (List.append path [ "TimeoutInMinutes" ]) v);
      (match x.rollback_configuration with
      | None -> []
      | Some v -> rollback_configuration_to_query (List.append path [ "RollbackConfiguration" ]) v);
      (match x.disable_rollback with
      | None -> []
      | Some v -> disable_rollback_to_query (List.append path [ "DisableRollback" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "Parameters" ]) v);
      (match x.template_ur_l with
      | None -> []
      | Some v -> template_ur_l_to_query (List.append path [ "TemplateURL" ]) v);
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let create_generated_template_output_to_query path (x : create_generated_template_output) =
  List.concat
    [
      (match x.generated_template_id with
      | None -> []
      | Some v -> generated_template_id_to_query (List.append path [ "GeneratedTemplateId" ]) v);
    ]

let create_generated_template_input_to_query path (x : create_generated_template_input) =
  List.concat
    [
      (match x.template_configuration with
      | None -> []
      | Some v -> template_configuration_to_query (List.append path [ "TemplateConfiguration" ]) v);
      (match x.stack_name with
      | None -> []
      | Some v -> stack_name_to_query (List.append path [ "StackName" ]) v);
      generated_template_name_to_query
        (List.append path [ "GeneratedTemplateName" ])
        x.generated_template_name;
      (match x.resources with
      | None -> []
      | Some v -> resource_definitions_to_query (List.append path [ "Resources" ]) v);
    ]

let create_change_set_output_to_query path (x : create_change_set_output) =
  List.concat
    [
      (match x.stack_id with
      | None -> []
      | Some v -> stack_id_to_query (List.append path [ "StackId" ]) v);
      (match x.id with
      | None -> []
      | Some v -> change_set_id_to_query (List.append path [ "Id" ]) v);
    ]

let change_set_type_to_query path (x : change_set_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with IMPORT -> "IMPORT" | UPDATE -> "UPDATE" | CREATE -> "CREATE")

let create_change_set_input_to_query path (x : create_change_set_input) =
  List.concat
    [
      (match x.disable_validation with
      | None -> []
      | Some v -> disable_validation_to_query (List.append path [ "DisableValidation" ]) v);
      (match x.deployment_config with
      | None -> []
      | Some v -> deployment_config_to_query (List.append path [ "DeploymentConfig" ]) v);
      (match x.deployment_mode with
      | None -> []
      | Some v -> deployment_mode_to_query (List.append path [ "DeploymentMode" ]) v);
      (match x.import_existing_resources with
      | None -> []
      | Some v ->
          import_existing_resources_to_query (List.append path [ "ImportExistingResources" ]) v);
      (match x.on_stack_failure with
      | None -> []
      | Some v -> on_stack_failure_to_query (List.append path [ "OnStackFailure" ]) v);
      (match x.include_nested_stacks with
      | None -> []
      | Some v -> include_nested_stacks_to_query (List.append path [ "IncludeNestedStacks" ]) v);
      (match x.resources_to_import with
      | None -> []
      | Some v -> resources_to_import_to_query (List.append path [ "ResourcesToImport" ]) v);
      (match x.change_set_type with
      | None -> []
      | Some v -> change_set_type_to_query (List.append path [ "ChangeSetType" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.client_token with
      | None -> []
      | Some v -> client_token_to_query (List.append path [ "ClientToken" ]) v);
      change_set_name_to_query (List.append path [ "ChangeSetName" ]) x.change_set_name;
      (match x.tags with None -> [] | Some v -> tags_to_query (List.append path [ "Tags" ]) v);
      (match x.notification_ar_ns with
      | None -> []
      | Some v -> notification_ar_ns_to_query (List.append path [ "NotificationARNs" ]) v);
      (match x.rollback_configuration with
      | None -> []
      | Some v -> rollback_configuration_to_query (List.append path [ "RollbackConfiguration" ]) v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> role_ar_n_to_query (List.append path [ "RoleARN" ]) v);
      (match x.resource_types with
      | None -> []
      | Some v -> resource_types_to_query (List.append path [ "ResourceTypes" ]) v);
      (match x.capabilities with
      | None -> []
      | Some v -> capabilities_to_query (List.append path [ "Capabilities" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_to_query (List.append path [ "Parameters" ]) v);
      (match x.use_previous_template with
      | None -> []
      | Some v -> use_previous_template_to_query (List.append path [ "UsePreviousTemplate" ]) v);
      (match x.template_ur_l with
      | None -> []
      | Some v -> template_ur_l_to_query (List.append path [ "TemplateURL" ]) v);
      (match x.template_body with
      | None -> []
      | Some v -> template_body_to_query (List.append path [ "TemplateBody" ]) v);
      stack_name_or_id_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let continue_update_rollback_output_to_query path _x = []

let continue_update_rollback_input_to_query path (x : continue_update_rollback_input) =
  List.concat
    [
      (match x.client_request_token with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      (match x.resources_to_skip with
      | None -> []
      | Some v -> resources_to_skip_to_query (List.append path [ "ResourcesToSkip" ]) v);
      (match x.role_ar_n with
      | None -> []
      | Some v -> role_ar_n_to_query (List.append path [ "RoleARN" ]) v);
      stack_name_or_id_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let cancel_update_stack_input_to_query path (x : cancel_update_stack_input) =
  List.concat
    [
      (match x.client_request_token with
      | None -> []
      | Some v -> client_request_token_to_query (List.append path [ "ClientRequestToken" ]) v);
      stack_name_to_query (List.append path [ "StackName" ]) x.stack_name;
    ]

let batch_describe_type_configurations_error_to_query path
    (x : batch_describe_type_configurations_error) =
  List.concat
    [
      (match x.type_configuration_identifier with
      | None -> []
      | Some v ->
          type_configuration_identifier_to_query
            (List.append path [ "TypeConfigurationIdentifier" ])
            v);
      (match x.error_message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "ErrorMessage" ]) v);
      (match x.error_code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "ErrorCode" ]) v);
    ]

let batch_describe_type_configurations_errors_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    batch_describe_type_configurations_error_to_query path xs

let batch_describe_type_configurations_output_to_query path
    (x : batch_describe_type_configurations_output) =
  List.concat
    [
      (match x.type_configurations with
      | None -> []
      | Some v ->
          type_configuration_details_list_to_query (List.append path [ "TypeConfigurations" ]) v);
      (match x.unprocessed_type_configurations with
      | None -> []
      | Some v ->
          unprocessed_type_configurations_to_query
            (List.append path [ "UnprocessedTypeConfigurations" ])
            v);
      (match x.errors with
      | None -> []
      | Some v ->
          batch_describe_type_configurations_errors_to_query (List.append path [ "Errors" ]) v);
    ]

let batch_describe_type_configurations_input_to_query path
    (x : batch_describe_type_configurations_input) =
  List.concat
    [
      type_configuration_identifiers_to_query
        (List.append path [ "TypeConfigurationIdentifiers" ])
        x.type_configuration_identifiers;
    ]

let activate_type_output_to_query path (x : activate_type_output) =
  List.concat
    [
      (match x.arn with
      | None -> []
      | Some v -> private_type_arn_to_query (List.append path [ "Arn" ]) v);
    ]

let activate_type_input_to_query path (x : activate_type_input) =
  List.concat
    [
      (match x.major_version with
      | None -> []
      | Some v -> major_version_to_query (List.append path [ "MajorVersion" ]) v);
      (match x.version_bump with
      | None -> []
      | Some v -> version_bump_to_query (List.append path [ "VersionBump" ]) v);
      (match x.execution_role_arn with
      | None -> []
      | Some v -> role_ar_n2_to_query (List.append path [ "ExecutionRoleArn" ]) v);
      (match x.logging_config with
      | None -> []
      | Some v -> logging_config_to_query (List.append path [ "LoggingConfig" ]) v);
      (match x.auto_update with
      | None -> []
      | Some v -> auto_update_to_query (List.append path [ "AutoUpdate" ]) v);
      (match x.type_name_alias with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeNameAlias" ]) v);
      (match x.type_name with
      | None -> []
      | Some v -> type_name_to_query (List.append path [ "TypeName" ]) v);
      (match x.publisher_id with
      | None -> []
      | Some v -> publisher_id_to_query (List.append path [ "PublisherId" ]) v);
      (match x.public_type_arn with
      | None -> []
      | Some v -> third_party_type_arn_to_query (List.append path [ "PublicTypeArn" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> third_party_type_to_query (List.append path [ "Type" ]) v);
    ]

let activate_organizations_access_output_to_query path _x = []
let activate_organizations_access_input_to_query path _x = []
