open Types

let unit_of_xml _ = ()
let resource_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_type_of_xml i) ()

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

let warning_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "EXCLUDED_RESOURCES" -> EXCLUDED_RESOURCES
   | "EXCLUDED_PROPERTIES" -> EXCLUDED_PROPERTIES
   | "MUTUALLY_EXCLUSIVE_TYPES" -> MUTUALLY_EXCLUSIVE_TYPES
   | "UNSUPPORTED_PROPERTIES" -> UNSUPPORTED_PROPERTIES
   | "MUTUALLY_EXCLUSIVE_PROPERTIES" -> MUTUALLY_EXCLUSIVE_PROPERTIES
   | _ -> failwith "unknown enum value"
    : warning_type)

let property_path_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let required_property_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let property_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let warning_property_of_xml i =
  let r_description = ref None in
  let r_required = ref None in
  let r_property_path = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Description"; "Required"; "PropertyPath" ]
    (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> property_description_of_xml i)
                 ())
      | "Required" ->
          r_required :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Required"
                 (fun i _ -> required_property_of_xml i)
                 ())
      | "PropertyPath" ->
          r_property_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PropertyPath"
                 (fun i _ -> property_path_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     description = ( ! ) r_description;
     required = ( ! ) r_required;
     property_path = ( ! ) r_property_path;
   }
    : warning_property)

let warning_properties_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> warning_property_of_xml i) ()

let warning_detail_of_xml i =
  let r_properties = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Properties"; "Type" ] (fun tag _ ->
      match tag with
      | "Properties" ->
          r_properties :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Properties"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> warning_property_of_xml i)
                     ())
                 ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> warning_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ properties = ( ! ) r_properties; type_ = ( ! ) r_type_ } : warning_detail)

let warning_details_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> warning_detail_of_xml i) ()

let visibility_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "PRIVATE" -> PRIVATE | "PUBLIC" -> PUBLIC | _ -> failwith "unknown enum value"
    : visibility)

let version_bump_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "MINOR" -> MINOR | "MAJOR" -> MAJOR | _ -> failwith "unknown enum value"
    : version_bump)

let version_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let validation_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let validation_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "SKIPPED" -> SKIPPED | "FAILED" -> FAILED | _ -> failwith "unknown enum value"
    : validation_status)

let validation_path_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let validation_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let parameter_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let parameter_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let no_echo_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let template_parameter_of_xml i =
  let r_description = ref None in
  let r_no_echo = ref None in
  let r_default_value = ref None in
  let r_parameter_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Description"; "NoEcho"; "DefaultValue"; "ParameterKey" ] (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "NoEcho" ->
          r_no_echo :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NoEcho" (fun i _ -> no_echo_of_xml i) ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> parameter_value_of_xml i)
                 ())
      | "ParameterKey" ->
          r_parameter_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterKey"
                 (fun i _ -> parameter_key_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     description = ( ! ) r_description;
     no_echo = ( ! ) r_no_echo;
     default_value = ( ! ) r_default_value;
     parameter_key = ( ! ) r_parameter_key;
   }
    : template_parameter)

let template_parameters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> template_parameter_of_xml i) ()

let capability_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CAPABILITY_AUTO_EXPAND" -> CAPABILITY_AUTO_EXPAND
   | "CAPABILITY_NAMED_IAM" -> CAPABILITY_NAMED_IAM
   | "CAPABILITY_IAM" -> CAPABILITY_IAM
   | _ -> failwith "unknown enum value"
    : capability)

let capabilities_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ()

let capabilities_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let transform_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let transforms_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> transform_name_of_xml i) ()

let validate_template_output_of_xml i =
  let r_declared_transforms = ref None in
  let r_capabilities_reason = ref None in
  let r_capabilities = ref None in
  let r_description = ref None in
  let r_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DeclaredTransforms"; "CapabilitiesReason"; "Capabilities"; "Description"; "Parameters" ]
    (fun tag _ ->
      match tag with
      | "DeclaredTransforms" ->
          r_declared_transforms :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeclaredTransforms"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> transform_name_of_xml i)
                     ())
                 ())
      | "CapabilitiesReason" ->
          r_capabilities_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapabilitiesReason"
                 (fun i _ -> capabilities_reason_of_xml i)
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
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
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> template_parameter_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     declared_transforms = ( ! ) r_declared_transforms;
     capabilities_reason = ( ! ) r_capabilities_reason;
     capabilities = ( ! ) r_capabilities;
     description = ( ! ) r_description;
     parameters = ( ! ) r_parameters;
   }
    : validate_template_output)

let template_body_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let template_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let validate_template_input_of_xml i =
  let r_template_ur_l = ref None in
  let r_template_body = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateURL"; "TemplateBody" ] (fun tag _ ->
      match tag with
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_ur_l = ( ! ) r_template_ur_l; template_body = ( ! ) r_template_body }
    : validate_template_input)

let use_previous_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let use_previous_template_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let url_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let stack_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_termination_protection_output_of_xml i =
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackId" ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_id = ( ! ) r_stack_id } : update_termination_protection_output)

let enable_termination_protection_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let stack_name_or_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_termination_protection_input_of_xml i =
  let r_stack_name = ref None in
  let r_enable_termination_protection = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "EnableTerminationProtection" ]
    (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "EnableTerminationProtection" ->
          r_enable_termination_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableTerminationProtection"
                 (fun i _ -> enable_termination_protection_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     enable_termination_protection =
       Smaws_Lib.Xml.Parse.required "EnableTerminationProtection"
         (( ! ) r_enable_termination_protection)
         i;
   }
    : update_termination_protection_input)

let client_request_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let stack_set_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let parameter_of_xml i =
  let r_resolved_value = ref None in
  let r_use_previous_value = ref None in
  let r_parameter_value = ref None in
  let r_parameter_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResolvedValue"; "UsePreviousValue"; "ParameterValue"; "ParameterKey" ] (fun tag _ ->
      match tag with
      | "ResolvedValue" ->
          r_resolved_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResolvedValue"
                 (fun i _ -> parameter_value_of_xml i)
                 ())
      | "UsePreviousValue" ->
          r_use_previous_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsePreviousValue"
                 (fun i _ -> use_previous_value_of_xml i)
                 ())
      | "ParameterValue" ->
          r_parameter_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterValue"
                 (fun i _ -> parameter_value_of_xml i)
                 ())
      | "ParameterKey" ->
          r_parameter_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterKey"
                 (fun i _ -> parameter_key_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resolved_value = ( ! ) r_resolved_value;
     use_previous_value = ( ! ) r_use_previous_value;
     parameter_value = ( ! ) r_parameter_value;
     parameter_key = ( ! ) r_parameter_key;
   }
    : parameter)

let parameters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ()

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
  ({
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
     key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i;
   }
    : tag)

let tags_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let region_concurrency_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "PARALLEL" -> PARALLEL
   | "SEQUENTIAL" -> SEQUENTIAL
   | _ -> failwith "unknown enum value"
    : region_concurrency_type)

let region_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let region_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ()

let failure_tolerance_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let failure_tolerance_percentage_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_concurrent_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_concurrent_percentage_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let concurrency_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SOFT_FAILURE_TOLERANCE" -> SOFT_FAILURE_TOLERANCE
   | "STRICT_FAILURE_TOLERANCE" -> STRICT_FAILURE_TOLERANCE
   | _ -> failwith "unknown enum value"
    : concurrency_mode)

let stack_set_operation_preferences_of_xml i =
  let r_concurrency_mode = ref None in
  let r_max_concurrent_percentage = ref None in
  let r_max_concurrent_count = ref None in
  let r_failure_tolerance_percentage = ref None in
  let r_failure_tolerance_count = ref None in
  let r_region_order = ref None in
  let r_region_concurrency_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ConcurrencyMode";
      "MaxConcurrentPercentage";
      "MaxConcurrentCount";
      "FailureTolerancePercentage";
      "FailureToleranceCount";
      "RegionOrder";
      "RegionConcurrencyType";
    ] (fun tag _ ->
      match tag with
      | "ConcurrencyMode" ->
          r_concurrency_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConcurrencyMode"
                 (fun i _ -> concurrency_mode_of_xml i)
                 ())
      | "MaxConcurrentPercentage" ->
          r_max_concurrent_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxConcurrentPercentage"
                 (fun i _ -> max_concurrent_percentage_of_xml i)
                 ())
      | "MaxConcurrentCount" ->
          r_max_concurrent_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxConcurrentCount"
                 (fun i _ -> max_concurrent_count_of_xml i)
                 ())
      | "FailureTolerancePercentage" ->
          r_failure_tolerance_percentage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureTolerancePercentage"
                 (fun i _ -> failure_tolerance_percentage_of_xml i)
                 ())
      | "FailureToleranceCount" ->
          r_failure_tolerance_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureToleranceCount"
                 (fun i _ -> failure_tolerance_count_of_xml i)
                 ())
      | "RegionOrder" ->
          r_region_order :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegionOrder"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "RegionConcurrencyType" ->
          r_region_concurrency_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegionConcurrencyType"
                 (fun i _ -> region_concurrency_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     concurrency_mode = ( ! ) r_concurrency_mode;
     max_concurrent_percentage = ( ! ) r_max_concurrent_percentage;
     max_concurrent_count = ( ! ) r_max_concurrent_count;
     failure_tolerance_percentage = ( ! ) r_failure_tolerance_percentage;
     failure_tolerance_count = ( ! ) r_failure_tolerance_count;
     region_order = ( ! ) r_region_order;
     region_concurrency_type = ( ! ) r_region_concurrency_type;
   }
    : stack_set_operation_preferences)

let role_ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let execution_role_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let account_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let account_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ()

let accounts_url_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let organizational_unit_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let organizational_unit_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> organizational_unit_id_of_xml i) ()

let account_filter_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "UNION" -> UNION
   | "DIFFERENCE" -> DIFFERENCE
   | "INTERSECTION" -> INTERSECTION
   | "NONE" -> NONE
   | _ -> failwith "unknown enum value"
    : account_filter_type)

let deployment_targets_of_xml i =
  let r_account_filter_type = ref None in
  let r_organizational_unit_ids = ref None in
  let r_accounts_url = ref None in
  let r_accounts = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AccountFilterType"; "OrganizationalUnitIds"; "AccountsUrl"; "Accounts" ] (fun tag _ ->
      match tag with
      | "AccountFilterType" ->
          r_account_filter_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountFilterType"
                 (fun i _ -> account_filter_type_of_xml i)
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
      | "AccountsUrl" ->
          r_accounts_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountsUrl"
                 (fun i _ -> accounts_url_of_xml i)
                 ())
      | "Accounts" ->
          r_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Accounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     account_filter_type = ( ! ) r_account_filter_type;
     organizational_unit_ids = ( ! ) r_organizational_unit_ids;
     accounts_url = ( ! ) r_accounts_url;
     accounts = ( ! ) r_accounts;
   }
    : deployment_targets)

let permission_models_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SELF_MANAGED" -> SELF_MANAGED
   | "SERVICE_MANAGED" -> SERVICE_MANAGED
   | _ -> failwith "unknown enum value"
    : permission_models)

let auto_deployment_nullable_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let retain_stacks_on_account_removal_nullable_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let stack_set_ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_set_arn_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_set_ar_n_of_xml i) ()

let auto_deployment_of_xml i =
  let r_depends_on = ref None in
  let r_retain_stacks_on_account_removal = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DependsOn"; "RetainStacksOnAccountRemoval"; "Enabled" ] (fun tag _ ->
      match tag with
      | "DependsOn" ->
          r_depends_on :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DependsOn"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_set_ar_n_of_xml i)
                     ())
                 ())
      | "RetainStacksOnAccountRemoval" ->
          r_retain_stacks_on_account_removal :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainStacksOnAccountRemoval"
                 (fun i _ -> retain_stacks_on_account_removal_nullable_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> auto_deployment_nullable_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     depends_on = ( ! ) r_depends_on;
     retain_stacks_on_account_removal = ( ! ) r_retain_stacks_on_account_removal;
     enabled = ( ! ) r_enabled;
   }
    : auto_deployment)

let call_as_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DELEGATED_ADMIN" -> DELEGATED_ADMIN
   | "SELF" -> SELF
   | _ -> failwith "unknown enum value"
    : call_as)

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

let update_stack_set_input_of_xml i =
  let r_managed_execution = ref None in
  let r_call_as = ref None in
  let r_regions = ref None in
  let r_accounts = ref None in
  let r_operation_id = ref None in
  let r_auto_deployment = ref None in
  let r_permission_model = ref None in
  let r_deployment_targets = ref None in
  let r_execution_role_name = ref None in
  let r_administration_role_ar_n = ref None in
  let r_operation_preferences = ref None in
  let r_tags = ref None in
  let r_capabilities = ref None in
  let r_parameters = ref None in
  let r_use_previous_template = ref None in
  let r_template_ur_l = ref None in
  let r_template_body = ref None in
  let r_description = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ManagedExecution";
      "CallAs";
      "Regions";
      "Accounts";
      "OperationId";
      "AutoDeployment";
      "PermissionModel";
      "DeploymentTargets";
      "ExecutionRoleName";
      "AdministrationRoleARN";
      "OperationPreferences";
      "Tags";
      "Capabilities";
      "Parameters";
      "UsePreviousTemplate";
      "TemplateURL";
      "TemplateBody";
      "Description";
      "StackSetName";
    ] (fun tag _ ->
      match tag with
      | "ManagedExecution" ->
          r_managed_execution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedExecution"
                 (fun i _ -> managed_execution_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "Accounts" ->
          r_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Accounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ())
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
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
      | "DeploymentTargets" ->
          r_deployment_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTargets"
                 (fun i _ -> deployment_targets_of_xml i)
                 ())
      | "ExecutionRoleName" ->
          r_execution_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleName"
                 (fun i _ -> execution_role_name_of_xml i)
                 ())
      | "AdministrationRoleARN" ->
          r_administration_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdministrationRoleARN"
                 (fun i _ -> role_ar_n_of_xml i)
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "UsePreviousTemplate" ->
          r_use_previous_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsePreviousTemplate"
                 (fun i _ -> use_previous_template_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     managed_execution = ( ! ) r_managed_execution;
     call_as = ( ! ) r_call_as;
     regions = ( ! ) r_regions;
     accounts = ( ! ) r_accounts;
     operation_id = ( ! ) r_operation_id;
     auto_deployment = ( ! ) r_auto_deployment;
     permission_model = ( ! ) r_permission_model;
     deployment_targets = ( ! ) r_deployment_targets;
     execution_role_name = ( ! ) r_execution_role_name;
     administration_role_ar_n = ( ! ) r_administration_role_ar_n;
     operation_preferences = ( ! ) r_operation_preferences;
     tags = ( ! ) r_tags;
     capabilities = ( ! ) r_capabilities;
     parameters = ( ! ) r_parameters;
     use_previous_template = ( ! ) r_use_previous_template;
     template_ur_l = ( ! ) r_template_ur_l;
     template_body = ( ! ) r_template_body;
     description = ( ! ) r_description;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : update_stack_set_input)

let error_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let operation_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let update_stack_output_of_xml i =
  let r_operation_id = ref None in
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationId"; "StackId" ] (fun tag _ ->
      match tag with
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_id = ( ! ) r_operation_id; stack_id = ( ! ) r_stack_id } : update_stack_output)

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
  let r_call_as = ref None in
  let r_operation_id = ref None in
  let r_operation_preferences = ref None in
  let r_parameter_overrides = ref None in
  let r_regions = ref None in
  let r_deployment_targets = ref None in
  let r_accounts = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CallAs";
      "OperationId";
      "OperationPreferences";
      "ParameterOverrides";
      "Regions";
      "DeploymentTargets";
      "Accounts";
      "StackSetName";
    ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "ParameterOverrides" ->
          r_parameter_overrides :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterOverrides"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "DeploymentTargets" ->
          r_deployment_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTargets"
                 (fun i _ -> deployment_targets_of_xml i)
                 ())
      | "Accounts" ->
          r_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Accounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ())
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     operation_id = ( ! ) r_operation_id;
     operation_preferences = ( ! ) r_operation_preferences;
     parameter_overrides = ( ! ) r_parameter_overrides;
     regions = Smaws_Lib.Xml.Parse.required "Regions" (( ! ) r_regions) i;
     deployment_targets = ( ! ) r_deployment_targets;
     accounts = ( ! ) r_accounts;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : update_stack_instances_input)

let stack_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let stack_policy_during_update_body_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let stack_policy_during_update_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let type__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let rollback_trigger_of_xml i =
  let r_type_ = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Type"; "Arn" ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> type__of_xml i) ())
      | "Arn" ->
          r_arn := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = Smaws_Lib.Xml.Parse.required "Type" (( ! ) r_type_) i;
     arn = Smaws_Lib.Xml.Parse.required "Arn" (( ! ) r_arn) i;
   }
    : rollback_trigger)

let rollback_triggers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> rollback_trigger_of_xml i) ()

let monitoring_time_in_minutes_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let rollback_configuration_of_xml i =
  let r_monitoring_time_in_minutes = ref None in
  let r_rollback_triggers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MonitoringTimeInMinutes"; "RollbackTriggers" ]
    (fun tag _ ->
      match tag with
      | "MonitoringTimeInMinutes" ->
          r_monitoring_time_in_minutes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MonitoringTimeInMinutes"
                 (fun i _ -> monitoring_time_in_minutes_of_xml i)
                 ())
      | "RollbackTriggers" ->
          r_rollback_triggers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackTriggers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> rollback_trigger_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     monitoring_time_in_minutes = ( ! ) r_monitoring_time_in_minutes;
     rollback_triggers = ( ! ) r_rollback_triggers;
   }
    : rollback_configuration)

let stack_policy_body_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let stack_policy_ur_l_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let notification_ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let notification_ar_ns_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> notification_ar_n_of_xml i) ()

let disable_rollback_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let retain_except_on_create_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let deployment_config_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "EXPRESS" -> EXPRESS | "STANDARD" -> STANDARD | _ -> failwith "unknown enum value"
    : deployment_config_mode)

let deployment_config_of_xml i =
  let r_disable_rollback = ref None in
  let r_mode = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DisableRollback"; "Mode" ] (fun tag _ ->
      match tag with
      | "DisableRollback" ->
          r_disable_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableRollback"
                 (fun i _ -> disable_rollback_of_xml i)
                 ())
      | "Mode" ->
          r_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Mode"
                 (fun i _ -> deployment_config_mode_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ disable_rollback = ( ! ) r_disable_rollback; mode = ( ! ) r_mode } : deployment_config)

let disable_validation_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let update_stack_input_of_xml i =
  let r_disable_validation = ref None in
  let r_deployment_config = ref None in
  let r_retain_except_on_create = ref None in
  let r_client_request_token = ref None in
  let r_disable_rollback = ref None in
  let r_tags = ref None in
  let r_notification_ar_ns = ref None in
  let r_stack_policy_ur_l = ref None in
  let r_stack_policy_body = ref None in
  let r_rollback_configuration = ref None in
  let r_role_ar_n = ref None in
  let r_resource_types = ref None in
  let r_capabilities = ref None in
  let r_parameters = ref None in
  let r_stack_policy_during_update_ur_l = ref None in
  let r_stack_policy_during_update_body = ref None in
  let r_use_previous_template = ref None in
  let r_template_ur_l = ref None in
  let r_template_body = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DisableValidation";
      "DeploymentConfig";
      "RetainExceptOnCreate";
      "ClientRequestToken";
      "DisableRollback";
      "Tags";
      "NotificationARNs";
      "StackPolicyURL";
      "StackPolicyBody";
      "RollbackConfiguration";
      "RoleARN";
      "ResourceTypes";
      "Capabilities";
      "Parameters";
      "StackPolicyDuringUpdateURL";
      "StackPolicyDuringUpdateBody";
      "UsePreviousTemplate";
      "TemplateURL";
      "TemplateBody";
      "StackName";
    ] (fun tag _ ->
      match tag with
      | "DisableValidation" ->
          r_disable_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableValidation"
                 (fun i _ -> disable_validation_of_xml i)
                 ())
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | "RetainExceptOnCreate" ->
          r_retain_except_on_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainExceptOnCreate"
                 (fun i _ -> retain_except_on_create_of_xml i)
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
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
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
      | "StackPolicyURL" ->
          r_stack_policy_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyURL"
                 (fun i _ -> stack_policy_ur_l_of_xml i)
                 ())
      | "StackPolicyBody" ->
          r_stack_policy_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyBody"
                 (fun i _ -> stack_policy_body_of_xml i)
                 ())
      | "RollbackConfiguration" ->
          r_rollback_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackConfiguration"
                 (fun i _ -> rollback_configuration_of_xml i)
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "ResourceTypes" ->
          r_resource_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_type_of_xml i)
                     ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "StackPolicyDuringUpdateURL" ->
          r_stack_policy_during_update_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyDuringUpdateURL"
                 (fun i _ -> stack_policy_during_update_ur_l_of_xml i)
                 ())
      | "StackPolicyDuringUpdateBody" ->
          r_stack_policy_during_update_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyDuringUpdateBody"
                 (fun i _ -> stack_policy_during_update_body_of_xml i)
                 ())
      | "UsePreviousTemplate" ->
          r_use_previous_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsePreviousTemplate"
                 (fun i _ -> use_previous_template_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     disable_validation = ( ! ) r_disable_validation;
     deployment_config = ( ! ) r_deployment_config;
     retain_except_on_create = ( ! ) r_retain_except_on_create;
     client_request_token = ( ! ) r_client_request_token;
     disable_rollback = ( ! ) r_disable_rollback;
     tags = ( ! ) r_tags;
     notification_ar_ns = ( ! ) r_notification_ar_ns;
     stack_policy_ur_l = ( ! ) r_stack_policy_ur_l;
     stack_policy_body = ( ! ) r_stack_policy_body;
     rollback_configuration = ( ! ) r_rollback_configuration;
     role_ar_n = ( ! ) r_role_ar_n;
     resource_types = ( ! ) r_resource_types;
     capabilities = ( ! ) r_capabilities;
     parameters = ( ! ) r_parameters;
     stack_policy_during_update_ur_l = ( ! ) r_stack_policy_during_update_ur_l;
     stack_policy_during_update_body = ( ! ) r_stack_policy_during_update_body;
     use_previous_template = ( ! ) r_use_previous_template;
     template_ur_l = ( ! ) r_template_ur_l;
     template_body = ( ! ) r_template_body;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : update_stack_input)

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

let generated_template_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let logical_resource_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
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
  let r_resource_identifier = ref None in
  let r_logical_resource_id = ref None in
  let r_resource_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceIdentifier"; "LogicalResourceId"; "ResourceType" ] (fun tag _ ->
      match tag with
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
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_identifier =
       Smaws_Lib.Xml.Parse.required "ResourceIdentifier" (( ! ) r_resource_identifier) i;
     logical_resource_id = ( ! ) r_logical_resource_id;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
   }
    : resource_definition)

let resource_definitions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_definition_of_xml i) ()

let jazz_logical_resource_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> logical_resource_id_of_xml i) ()

let refresh_all_resources_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let generated_template_deletion_policy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "RETAIN" -> RETAIN | "DELETE" -> DELETE | _ -> failwith "unknown enum value"
    : generated_template_deletion_policy)

let generated_template_update_replace_policy_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "RETAIN" -> RETAIN | "DELETE" -> DELETE | _ -> failwith "unknown enum value"
    : generated_template_update_replace_policy)

let template_configuration_of_xml i =
  let r_update_replace_policy = ref None in
  let r_deletion_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "UpdateReplacePolicy"; "DeletionPolicy" ]
    (fun tag _ ->
      match tag with
      | "UpdateReplacePolicy" ->
          r_update_replace_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UpdateReplacePolicy"
                 (fun i _ -> generated_template_update_replace_policy_of_xml i)
                 ())
      | "DeletionPolicy" ->
          r_deletion_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionPolicy"
                 (fun i _ -> generated_template_deletion_policy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     update_replace_policy = ( ! ) r_update_replace_policy;
     deletion_policy = ( ! ) r_deletion_policy;
   }
    : template_configuration)

let update_generated_template_input_of_xml i =
  let r_template_configuration = ref None in
  let r_refresh_all_resources = ref None in
  let r_remove_resources = ref None in
  let r_add_resources = ref None in
  let r_new_generated_template_name = ref None in
  let r_generated_template_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TemplateConfiguration";
      "RefreshAllResources";
      "RemoveResources";
      "AddResources";
      "NewGeneratedTemplateName";
      "GeneratedTemplateName";
    ] (fun tag _ ->
      match tag with
      | "TemplateConfiguration" ->
          r_template_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateConfiguration"
                 (fun i _ -> template_configuration_of_xml i)
                 ())
      | "RefreshAllResources" ->
          r_refresh_all_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RefreshAllResources"
                 (fun i _ -> refresh_all_resources_of_xml i)
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
      | "AddResources" ->
          r_add_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AddResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_definition_of_xml i)
                     ())
                 ())
      | "NewGeneratedTemplateName" ->
          r_new_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NewGeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | "GeneratedTemplateName" ->
          r_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_configuration = ( ! ) r_template_configuration;
     refresh_all_resources = ( ! ) r_refresh_all_resources;
     remove_resources = ( ! ) r_remove_resources;
     add_resources = ( ! ) r_add_resources;
     new_generated_template_name = ( ! ) r_new_generated_template_name;
     generated_template_name =
       Smaws_Lib.Xml.Parse.required "GeneratedTemplateName" (( ! ) r_generated_template_name) i;
   }
    : update_generated_template_input)

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

let type_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let type_configuration_alias_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let type_configuration_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let third_party_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "HOOK" -> HOOK
   | "MODULE" -> MODULE
   | "RESOURCE" -> RESOURCE
   | _ -> failwith "unknown enum value"
    : third_party_type)

let type_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let type_configuration_identifier_of_xml i =
  let r_type_name = ref None in
  let r_type_ = ref None in
  let r_type_configuration_arn = ref None in
  let r_type_configuration_alias = ref None in
  let r_type_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TypeName"; "Type"; "TypeConfigurationArn"; "TypeConfigurationAlias"; "TypeArn" ]
    (fun tag _ ->
      match tag with
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | "TypeConfigurationArn" ->
          r_type_configuration_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationArn"
                 (fun i _ -> type_configuration_arn_of_xml i)
                 ())
      | "TypeConfigurationAlias" ->
          r_type_configuration_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationAlias"
                 (fun i _ -> type_configuration_alias_of_xml i)
                 ())
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_name = ( ! ) r_type_name;
     type_ = ( ! ) r_type_;
     type_configuration_arn = ( ! ) r_type_configuration_arn;
     type_configuration_alias = ( ! ) r_type_configuration_alias;
     type_arn = ( ! ) r_type_arn;
   }
    : type_configuration_identifier)

let unprocessed_type_configurations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> type_configuration_identifier_of_xml i)
    ()

let registry_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "HOOK" -> HOOK
   | "MODULE" -> MODULE
   | "RESOURCE" -> RESOURCE
   | _ -> failwith "unknown enum value"
    : registry_type)

let type_version_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let is_default_version_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let public_version_number_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let type_version_summary_of_xml i =
  let r_public_version_number = ref None in
  let r_description = ref None in
  let r_time_created = ref None in
  let r_arn = ref None in
  let r_is_default_version = ref None in
  let r_version_id = ref None in
  let r_type_name = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PublicVersionNumber";
      "Description";
      "TimeCreated";
      "Arn";
      "IsDefaultVersion";
      "VersionId";
      "TypeName";
      "Type";
    ] (fun tag _ ->
      match tag with
      | "PublicVersionNumber" ->
          r_public_version_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicVersionNumber"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "TimeCreated" ->
          r_time_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeCreated" (fun i _ -> timestamp_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> type_arn_of_xml i) ())
      | "IsDefaultVersion" ->
          r_is_default_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsDefaultVersion"
                 (fun i _ -> is_default_version_of_xml i)
                 ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     public_version_number = ( ! ) r_public_version_number;
     description = ( ! ) r_description;
     time_created = ( ! ) r_time_created;
     arn = ( ! ) r_arn;
     is_default_version = ( ! ) r_is_default_version;
     version_id = ( ! ) r_version_id;
     type_name = ( ! ) r_type_name;
     type_ = ( ! ) r_type_;
   }
    : type_version_summary)

let type_version_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> type_version_summary_of_xml i) ()

let type_tests_status_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let type_tests_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "NOT_TESTED" -> NOT_TESTED
   | "IN_PROGRESS" -> IN_PROGRESS
   | "FAILED" -> FAILED
   | "PASSED" -> PASSED
   | _ -> failwith "unknown enum value"
    : type_tests_status)

let publisher_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let identity_provider_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Bitbucket" -> Bitbucket
   | "GitHub" -> GitHub
   | "AWS_Marketplace" -> AWS_Marketplace
   | _ -> failwith "unknown enum value"
    : identity_provider)

let publisher_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let is_activated_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let type_summary_of_xml i =
  let r_is_activated = ref None in
  let r_publisher_name = ref None in
  let r_publisher_identity = ref None in
  let r_latest_public_version = ref None in
  let r_public_version_number = ref None in
  let r_original_type_name = ref None in
  let r_publisher_id = ref None in
  let r_description = ref None in
  let r_last_updated = ref None in
  let r_type_arn = ref None in
  let r_default_version_id = ref None in
  let r_type_name = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "IsActivated";
      "PublisherName";
      "PublisherIdentity";
      "LatestPublicVersion";
      "PublicVersionNumber";
      "OriginalTypeName";
      "PublisherId";
      "Description";
      "LastUpdated";
      "TypeArn";
      "DefaultVersionId";
      "TypeName";
      "Type";
    ] (fun tag _ ->
      match tag with
      | "IsActivated" ->
          r_is_activated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsActivated"
                 (fun i _ -> is_activated_of_xml i)
                 ())
      | "PublisherName" ->
          r_publisher_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherName"
                 (fun i _ -> publisher_name_of_xml i)
                 ())
      | "PublisherIdentity" ->
          r_publisher_identity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherIdentity"
                 (fun i _ -> identity_provider_of_xml i)
                 ())
      | "LatestPublicVersion" ->
          r_latest_public_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LatestPublicVersion"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | "PublicVersionNumber" ->
          r_public_version_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicVersionNumber"
                 (fun i _ -> public_version_number_of_xml i)
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
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "LastUpdated" ->
          r_last_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdated" (fun i _ -> timestamp_of_xml i) ())
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | "DefaultVersionId" ->
          r_default_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultVersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     is_activated = ( ! ) r_is_activated;
     publisher_name = ( ! ) r_publisher_name;
     publisher_identity = ( ! ) r_publisher_identity;
     latest_public_version = ( ! ) r_latest_public_version;
     public_version_number = ( ! ) r_public_version_number;
     original_type_name = ( ! ) r_original_type_name;
     publisher_id = ( ! ) r_publisher_id;
     description = ( ! ) r_description;
     last_updated = ( ! ) r_last_updated;
     type_arn = ( ! ) r_type_arn;
     default_version_id = ( ! ) r_default_version_id;
     type_name = ( ! ) r_type_name;
     type_ = ( ! ) r_type_;
   }
    : type_summary)

let type_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> type_summary_of_xml i) ()

let type_schema_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let type_name_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let type_hierarchy_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let category_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "AWS_TYPES" -> AWS_TYPES
   | "THIRD_PARTY" -> THIRD_PARTY
   | "ACTIVATED" -> ACTIVATED
   | "REGISTERED" -> REGISTERED
   | _ -> failwith "unknown enum value"
    : category)

let type_filters_of_xml i =
  let r_type_name_prefix = ref None in
  let r_publisher_id = ref None in
  let r_category = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TypeNamePrefix"; "PublisherId"; "Category" ]
    (fun tag _ ->
      match tag with
      | "TypeNamePrefix" ->
          r_type_name_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeNamePrefix"
                 (fun i _ -> type_name_prefix_of_xml i)
                 ())
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | "Category" ->
          r_category :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Category" (fun i _ -> category_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_name_prefix = ( ! ) r_type_name_prefix;
     publisher_id = ( ! ) r_publisher_id;
     category = ( ! ) r_category;
   }
    : type_filters)

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

let type_configuration_identifiers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> type_configuration_identifier_of_xml i)
    ()

let type_configuration_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let is_default_configuration_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let type_configuration_details_of_xml i =
  let r_is_default_configuration = ref None in
  let r_type_name = ref None in
  let r_type_arn = ref None in
  let r_last_updated = ref None in
  let r_configuration = ref None in
  let r_alias = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "IsDefaultConfiguration";
      "TypeName";
      "TypeArn";
      "LastUpdated";
      "Configuration";
      "Alias";
      "Arn";
    ] (fun tag _ ->
      match tag with
      | "IsDefaultConfiguration" ->
          r_is_default_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsDefaultConfiguration"
                 (fun i _ -> is_default_configuration_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | "LastUpdated" ->
          r_last_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdated" (fun i _ -> timestamp_of_xml i) ())
      | "Configuration" ->
          r_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Configuration"
                 (fun i _ -> type_configuration_of_xml i)
                 ())
      | "Alias" ->
          r_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Alias"
                 (fun i _ -> type_configuration_alias_of_xml i)
                 ())
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn"
                 (fun i _ -> type_configuration_arn_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     is_default_configuration = ( ! ) r_is_default_configuration;
     type_name = ( ! ) r_type_name;
     type_arn = ( ! ) r_type_arn;
     last_updated = ( ! ) r_last_updated;
     configuration = ( ! ) r_configuration;
     alias = ( ! ) r_alias;
     arn = ( ! ) r_arn;
   }
    : type_configuration_details)

let type_configuration_details_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> type_configuration_details_of_xml i) ()

let treat_unrecognized_resource_types_as_warnings_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let total_warnings_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let total_stack_instances_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let timeout_minutes_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let third_party_type_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let test_type_input_of_xml i =
  let r_log_delivery_bucket = ref None in
  let r_version_id = ref None in
  let r_type_name = ref None in
  let r_type_ = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LogDeliveryBucket"; "VersionId"; "TypeName"; "Type"; "Arn" ] (fun tag _ ->
      match tag with
      | "LogDeliveryBucket" ->
          r_log_delivery_bucket :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogDeliveryBucket"
                 (fun i _ -> s3_bucket_of_xml i)
                 ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> type_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     log_delivery_bucket = ( ! ) r_log_delivery_bucket;
     version_id = ( ! ) r_version_id;
     type_name = ( ! ) r_type_name;
     type_ = ( ! ) r_type_;
     arn = ( ! ) r_arn;
   }
    : test_type_input)

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

let generated_template_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "COMPLETE" -> COMPLETE
   | "FAILED" -> FAILED
   | "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
   | "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | "DELETE_PENDING" -> DELETE_PENDING
   | "UPDATE_PENDING" -> UPDATE_PENDING
   | "CREATE_PENDING" -> CREATE_PENDING
   | _ -> failwith "unknown enum value"
    : generated_template_status)

let template_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let creation_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let last_updated_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let number_of_resources_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let template_summary_of_xml i =
  let r_number_of_resources = ref None in
  let r_last_updated_time = ref None in
  let r_creation_time = ref None in
  let r_status_reason = ref None in
  let r_status = ref None in
  let r_generated_template_name = ref None in
  let r_generated_template_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NumberOfResources";
      "LastUpdatedTime";
      "CreationTime";
      "StatusReason";
      "Status";
      "GeneratedTemplateName";
      "GeneratedTemplateId";
    ] (fun tag _ ->
      match tag with
      | "NumberOfResources" ->
          r_number_of_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberOfResources"
                 (fun i _ -> number_of_resources_of_xml i)
                 ())
      | "LastUpdatedTime" ->
          r_last_updated_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTime"
                 (fun i _ -> last_updated_time_of_xml i)
                 ())
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> template_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> generated_template_status_of_xml i)
                 ())
      | "GeneratedTemplateName" ->
          r_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | "GeneratedTemplateId" ->
          r_generated_template_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateId"
                 (fun i _ -> generated_template_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     number_of_resources = ( ! ) r_number_of_resources;
     last_updated_time = ( ! ) r_last_updated_time;
     creation_time = ( ! ) r_creation_time;
     status_reason = ( ! ) r_status_reason;
     status = ( ! ) r_status;
     generated_template_name = ( ! ) r_generated_template_name;
     generated_template_id = ( ! ) r_generated_template_id;
   }
    : template_summary)

let template_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> template_summary_of_xml i) ()

let template_stage_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Processed" -> Processed
   | "Original" -> Original
   | _ -> failwith "unknown enum value"
    : template_stage)

let resources_succeeded_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resources_failed_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resources_processing_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resources_pending_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let template_progress_of_xml i =
  let r_resources_pending = ref None in
  let r_resources_processing = ref None in
  let r_resources_failed = ref None in
  let r_resources_succeeded = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourcesPending"; "ResourcesProcessing"; "ResourcesFailed"; "ResourcesSucceeded" ]
    (fun tag _ ->
      match tag with
      | "ResourcesPending" ->
          r_resources_pending :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesPending"
                 (fun i _ -> resources_pending_of_xml i)
                 ())
      | "ResourcesProcessing" ->
          r_resources_processing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesProcessing"
                 (fun i _ -> resources_processing_of_xml i)
                 ())
      | "ResourcesFailed" ->
          r_resources_failed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesFailed"
                 (fun i _ -> resources_failed_of_xml i)
                 ())
      | "ResourcesSucceeded" ->
          r_resources_succeeded :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesSucceeded"
                 (fun i _ -> resources_succeeded_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resources_pending = ( ! ) r_resources_pending;
     resources_processing = ( ! ) r_resources_processing;
     resources_failed = ( ! ) r_resources_failed;
     resources_succeeded = ( ! ) r_resources_succeeded;
   }
    : template_progress)

let template_format_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "YAML" -> YAML | "JSON" -> JSON | _ -> failwith "unknown enum value"
    : template_format)

let template_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let supported_major_version_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let supported_major_versions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> supported_major_version_of_xml i) ()

let stop_stack_set_operation_output_of_xml i = ()

let stop_stack_set_operation_input_of_xml i =
  let r_call_as = ref None in
  let r_operation_id = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CallAs"; "OperationId"; "StackSetName" ]
    (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     operation_id = Smaws_Lib.Xml.Parse.required "OperationId" (( ! ) r_operation_id) i;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : stop_stack_set_operation_input)

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

let status_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
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
  let r_scan_filters = ref None in
  let r_client_request_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScanFilters"; "ClientRequestToken" ] (fun tag _ ->
      match tag with
      | "ScanFilters" ->
          r_scan_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScanFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scan_filter_of_xml i)
                     ())
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ scan_filters = ( ! ) r_scan_filters; client_request_token = ( ! ) r_client_request_token }
    : start_resource_scan_input)

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

let stage_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> template_stage_of_xml i) ()

let change_set_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let deletion_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let stack_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "IMPORT_ROLLBACK_COMPLETE" -> IMPORT_ROLLBACK_COMPLETE
   | "IMPORT_ROLLBACK_FAILED" -> IMPORT_ROLLBACK_FAILED
   | "IMPORT_ROLLBACK_IN_PROGRESS" -> IMPORT_ROLLBACK_IN_PROGRESS
   | "IMPORT_COMPLETE" -> IMPORT_COMPLETE
   | "IMPORT_IN_PROGRESS" -> IMPORT_IN_PROGRESS
   | "REVIEW_IN_PROGRESS" -> REVIEW_IN_PROGRESS
   | "UPDATE_ROLLBACK_COMPLETE" -> UPDATE_ROLLBACK_COMPLETE
   | "UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS" -> UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS
   | "UPDATE_ROLLBACK_FAILED" -> UPDATE_ROLLBACK_FAILED
   | "UPDATE_ROLLBACK_IN_PROGRESS" -> UPDATE_ROLLBACK_IN_PROGRESS
   | "UPDATE_FAILED" -> UPDATE_FAILED
   | "UPDATE_COMPLETE" -> UPDATE_COMPLETE
   | "UPDATE_COMPLETE_CLEANUP_IN_PROGRESS" -> UPDATE_COMPLETE_CLEANUP_IN_PROGRESS
   | "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
   | "DELETE_COMPLETE" -> DELETE_COMPLETE
   | "DELETE_FAILED" -> DELETE_FAILED
   | "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | "ROLLBACK_COMPLETE" -> ROLLBACK_COMPLETE
   | "ROLLBACK_FAILED" -> ROLLBACK_FAILED
   | "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
   | "CREATE_COMPLETE" -> CREATE_COMPLETE
   | "CREATE_FAILED" -> CREATE_FAILED
   | "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | _ -> failwith "unknown enum value"
    : stack_status)

let stack_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let output_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let output_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let export_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let output_of_xml i =
  let r_export_name = ref None in
  let r_description = ref None in
  let r_output_value = ref None in
  let r_output_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ExportName"; "Description"; "OutputValue"; "OutputKey" ] (fun tag _ ->
      match tag with
      | "ExportName" ->
          r_export_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExportName"
                 (fun i _ -> export_name_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "OutputValue" ->
          r_output_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputValue"
                 (fun i _ -> output_value_of_xml i)
                 ())
      | "OutputKey" ->
          r_output_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OutputKey" (fun i _ -> output_key_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     export_name = ( ! ) r_export_name;
     description = ( ! ) r_description;
     output_value = ( ! ) r_output_value;
     output_key = ( ! ) r_output_key;
   }
    : output)

let outputs_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> output_of_xml i) ()

let stack_drift_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "NOT_CHECKED" -> NOT_CHECKED
   | "UNKNOWN" -> UNKNOWN
   | "IN_SYNC" -> IN_SYNC
   | "DRIFTED" -> DRIFTED
   | _ -> failwith "unknown enum value"
    : stack_drift_status)

let stack_drift_information_of_xml i =
  let r_last_check_timestamp = ref None in
  let r_stack_drift_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LastCheckTimestamp"; "StackDriftStatus" ]
    (fun tag _ ->
      match tag with
      | "LastCheckTimestamp" ->
          r_last_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "StackDriftStatus" ->
          r_stack_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     last_check_timestamp = ( ! ) r_last_check_timestamp;
     stack_drift_status =
       Smaws_Lib.Xml.Parse.required "StackDriftStatus" (( ! ) r_stack_drift_status) i;
   }
    : stack_drift_information)

let deletion_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "FORCE_DELETE_STACK" -> FORCE_DELETE_STACK
   | "STANDARD" -> STANDARD
   | _ -> failwith "unknown enum value"
    : deletion_mode)

let detailed_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "VALIDATION_FAILED" -> VALIDATION_FAILED
   | "CONFIGURATION_COMPLETE" -> CONFIGURATION_COMPLETE
   | _ -> failwith "unknown enum value"
    : detailed_status)

let operation_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CREATE_CHANGESET" -> CREATE_CHANGESET
   | "ROLLBACK" -> ROLLBACK
   | "CONTINUE_ROLLBACK" -> CONTINUE_ROLLBACK
   | "DELETE_STACK" -> DELETE_STACK
   | "UPDATE_STACK" -> UPDATE_STACK
   | "CREATE_STACK" -> CREATE_STACK
   | _ -> failwith "unknown enum value"
    : operation_type)

let operation_entry_of_xml i =
  let r_operation_id = ref None in
  let r_operation_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationId"; "OperationType" ] (fun tag _ ->
      match tag with
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_id = ( ! ) r_operation_id; operation_type = ( ! ) r_operation_type }
    : operation_entry)

let last_operations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> operation_entry_of_xml i) ()

let stack_of_xml i =
  let r_last_operations = ref None in
  let r_detailed_status = ref None in
  let r_deletion_mode = ref None in
  let r_retain_except_on_create = ref None in
  let r_drift_information = ref None in
  let r_root_id = ref None in
  let r_parent_id = ref None in
  let r_enable_termination_protection = ref None in
  let r_tags = ref None in
  let r_role_ar_n = ref None in
  let r_outputs = ref None in
  let r_capabilities = ref None in
  let r_timeout_in_minutes = ref None in
  let r_notification_ar_ns = ref None in
  let r_deployment_config = ref None in
  let r_disable_rollback = ref None in
  let r_stack_status_reason = ref None in
  let r_stack_status = ref None in
  let r_rollback_configuration = ref None in
  let r_last_updated_time = ref None in
  let r_deletion_time = ref None in
  let r_creation_time = ref None in
  let r_parameters = ref None in
  let r_description = ref None in
  let r_change_set_id = ref None in
  let r_stack_name = ref None in
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LastOperations";
      "DetailedStatus";
      "DeletionMode";
      "RetainExceptOnCreate";
      "DriftInformation";
      "RootId";
      "ParentId";
      "EnableTerminationProtection";
      "Tags";
      "RoleARN";
      "Outputs";
      "Capabilities";
      "TimeoutInMinutes";
      "NotificationARNs";
      "DeploymentConfig";
      "DisableRollback";
      "StackStatusReason";
      "StackStatus";
      "RollbackConfiguration";
      "LastUpdatedTime";
      "DeletionTime";
      "CreationTime";
      "Parameters";
      "Description";
      "ChangeSetId";
      "StackName";
      "StackId";
    ] (fun tag _ ->
      match tag with
      | "LastOperations" ->
          r_last_operations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastOperations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> operation_entry_of_xml i)
                     ())
                 ())
      | "DetailedStatus" ->
          r_detailed_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetailedStatus"
                 (fun i _ -> detailed_status_of_xml i)
                 ())
      | "DeletionMode" ->
          r_deletion_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionMode"
                 (fun i _ -> deletion_mode_of_xml i)
                 ())
      | "RetainExceptOnCreate" ->
          r_retain_except_on_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainExceptOnCreate"
                 (fun i _ -> retain_except_on_create_of_xml i)
                 ())
      | "DriftInformation" ->
          r_drift_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftInformation"
                 (fun i _ -> stack_drift_information_of_xml i)
                 ())
      | "RootId" ->
          r_root_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RootId" (fun i _ -> stack_id_of_xml i) ())
      | "ParentId" ->
          r_parent_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ParentId" (fun i _ -> stack_id_of_xml i) ())
      | "EnableTerminationProtection" ->
          r_enable_termination_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableTerminationProtection"
                 (fun i _ -> enable_termination_protection_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "Outputs" ->
          r_outputs :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Outputs"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> output_of_xml i) ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
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
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | "DisableRollback" ->
          r_disable_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableRollback"
                 (fun i _ -> disable_rollback_of_xml i)
                 ())
      | "StackStatusReason" ->
          r_stack_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackStatusReason"
                 (fun i _ -> stack_status_reason_of_xml i)
                 ())
      | "StackStatus" ->
          r_stack_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackStatus"
                 (fun i _ -> stack_status_of_xml i)
                 ())
      | "RollbackConfiguration" ->
          r_rollback_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackConfiguration"
                 (fun i _ -> rollback_configuration_of_xml i)
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
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ChangeSetId" ->
          r_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     last_operations = ( ! ) r_last_operations;
     detailed_status = ( ! ) r_detailed_status;
     deletion_mode = ( ! ) r_deletion_mode;
     retain_except_on_create = ( ! ) r_retain_except_on_create;
     drift_information = ( ! ) r_drift_information;
     root_id = ( ! ) r_root_id;
     parent_id = ( ! ) r_parent_id;
     enable_termination_protection = ( ! ) r_enable_termination_protection;
     tags = ( ! ) r_tags;
     role_ar_n = ( ! ) r_role_ar_n;
     outputs = ( ! ) r_outputs;
     capabilities = ( ! ) r_capabilities;
     timeout_in_minutes = ( ! ) r_timeout_in_minutes;
     notification_ar_ns = ( ! ) r_notification_ar_ns;
     deployment_config = ( ! ) r_deployment_config;
     disable_rollback = ( ! ) r_disable_rollback;
     stack_status_reason = ( ! ) r_stack_status_reason;
     stack_status = Smaws_Lib.Xml.Parse.required "StackStatus" (( ! ) r_stack_status) i;
     rollback_configuration = ( ! ) r_rollback_configuration;
     last_updated_time = ( ! ) r_last_updated_time;
     deletion_time = ( ! ) r_deletion_time;
     creation_time = Smaws_Lib.Xml.Parse.required "CreationTime" (( ! ) r_creation_time) i;
     parameters = ( ! ) r_parameters;
     description = ( ! ) r_description;
     change_set_id = ( ! ) r_change_set_id;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     stack_id = ( ! ) r_stack_id;
   }
    : stack)

let stacks_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_of_xml i) ()

let stack_drift_information_summary_of_xml i =
  let r_last_check_timestamp = ref None in
  let r_stack_drift_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LastCheckTimestamp"; "StackDriftStatus" ]
    (fun tag _ ->
      match tag with
      | "LastCheckTimestamp" ->
          r_last_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "StackDriftStatus" ->
          r_stack_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     last_check_timestamp = ( ! ) r_last_check_timestamp;
     stack_drift_status =
       Smaws_Lib.Xml.Parse.required "StackDriftStatus" (( ! ) r_stack_drift_status) i;
   }
    : stack_drift_information_summary)

let stack_summary_of_xml i =
  let r_last_operations = ref None in
  let r_drift_information = ref None in
  let r_root_id = ref None in
  let r_parent_id = ref None in
  let r_stack_status_reason = ref None in
  let r_stack_status = ref None in
  let r_deletion_time = ref None in
  let r_last_updated_time = ref None in
  let r_creation_time = ref None in
  let r_template_description = ref None in
  let r_stack_name = ref None in
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LastOperations";
      "DriftInformation";
      "RootId";
      "ParentId";
      "StackStatusReason";
      "StackStatus";
      "DeletionTime";
      "LastUpdatedTime";
      "CreationTime";
      "TemplateDescription";
      "StackName";
      "StackId";
    ] (fun tag _ ->
      match tag with
      | "LastOperations" ->
          r_last_operations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastOperations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> operation_entry_of_xml i)
                     ())
                 ())
      | "DriftInformation" ->
          r_drift_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftInformation"
                 (fun i _ -> stack_drift_information_summary_of_xml i)
                 ())
      | "RootId" ->
          r_root_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RootId" (fun i _ -> stack_id_of_xml i) ())
      | "ParentId" ->
          r_parent_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ParentId" (fun i _ -> stack_id_of_xml i) ())
      | "StackStatusReason" ->
          r_stack_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackStatusReason"
                 (fun i _ -> stack_status_reason_of_xml i)
                 ())
      | "StackStatus" ->
          r_stack_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackStatus"
                 (fun i _ -> stack_status_of_xml i)
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
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "TemplateDescription" ->
          r_template_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateDescription"
                 (fun i _ -> template_description_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     last_operations = ( ! ) r_last_operations;
     drift_information = ( ! ) r_drift_information;
     root_id = ( ! ) r_root_id;
     parent_id = ( ! ) r_parent_id;
     stack_status_reason = ( ! ) r_stack_status_reason;
     stack_status = Smaws_Lib.Xml.Parse.required "StackStatus" (( ! ) r_stack_status) i;
     deletion_time = ( ! ) r_deletion_time;
     last_updated_time = ( ! ) r_last_updated_time;
     creation_time = Smaws_Lib.Xml.Parse.required "CreationTime" (( ! ) r_creation_time) i;
     template_description = ( ! ) r_template_description;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     stack_id = ( ! ) r_stack_id;
   }
    : stack_summary)

let stack_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_summary_of_xml i) ()

let stack_status_filter_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_status_of_xml i) ()

let stack_set_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_set_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "DELETED" -> DELETED | "ACTIVE" -> ACTIVE | _ -> failwith "unknown enum value"
    : stack_set_status)

let stack_set_summary_of_xml i =
  let r_managed_execution = ref None in
  let r_last_drift_check_timestamp = ref None in
  let r_drift_status = ref None in
  let r_permission_model = ref None in
  let r_auto_deployment = ref None in
  let r_status = ref None in
  let r_description = ref None in
  let r_stack_set_id = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ManagedExecution";
      "LastDriftCheckTimestamp";
      "DriftStatus";
      "PermissionModel";
      "AutoDeployment";
      "Status";
      "Description";
      "StackSetId";
      "StackSetName";
    ] (fun tag _ ->
      match tag with
      | "ManagedExecution" ->
          r_managed_execution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedExecution"
                 (fun i _ -> managed_execution_of_xml i)
                 ())
      | "LastDriftCheckTimestamp" ->
          r_last_drift_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastDriftCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "DriftStatus" ->
          r_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
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
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_status_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "StackSetId" ->
          r_stack_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetId"
                 (fun i _ -> stack_set_id_of_xml i)
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     managed_execution = ( ! ) r_managed_execution;
     last_drift_check_timestamp = ( ! ) r_last_drift_check_timestamp;
     drift_status = ( ! ) r_drift_status;
     permission_model = ( ! ) r_permission_model;
     auto_deployment = ( ! ) r_auto_deployment;
     status = ( ! ) r_status;
     description = ( ! ) r_description;
     stack_set_id = ( ! ) r_stack_set_id;
     stack_set_name = ( ! ) r_stack_set_name;
   }
    : stack_set_summary)

let stack_set_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_set_summary_of_xml i) ()

let stack_set_operation_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DETECT_DRIFT" -> DETECT_DRIFT
   | "DELETE" -> DELETE
   | "UPDATE" -> UPDATE
   | "CREATE" -> CREATE
   | _ -> failwith "unknown enum value"
    : stack_set_operation_action)

let stack_set_operation_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "QUEUED" -> QUEUED
   | "STOPPED" -> STOPPED
   | "STOPPING" -> STOPPING
   | "FAILED" -> FAILED
   | "SUCCEEDED" -> SUCCEEDED
   | "RUNNING" -> RUNNING
   | _ -> failwith "unknown enum value"
    : stack_set_operation_status)

let stack_set_operation_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let stack_set_operation_summary_of_xml i =
  let r_operation_preferences = ref None in
  let r_status_details = ref None in
  let r_status_reason = ref None in
  let r_end_timestamp = ref None in
  let r_creation_timestamp = ref None in
  let r_status = ref None in
  let r_action = ref None in
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "OperationPreferences";
      "StatusDetails";
      "StatusReason";
      "EndTimestamp";
      "CreationTimestamp";
      "Status";
      "Action";
      "OperationId";
    ] (fun tag _ ->
      match tag with
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "StatusDetails" ->
          r_status_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusDetails"
                 (fun i _ -> stack_set_operation_status_details_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> stack_set_operation_status_reason_of_xml i)
                 ())
      | "EndTimestamp" ->
          r_end_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "CreationTimestamp" ->
          r_creation_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_operation_status_of_xml i)
                 ())
      | "Action" ->
          r_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Action"
                 (fun i _ -> stack_set_operation_action_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     operation_preferences = ( ! ) r_operation_preferences;
     status_details = ( ! ) r_status_details;
     status_reason = ( ! ) r_status_reason;
     end_timestamp = ( ! ) r_end_timestamp;
     creation_timestamp = ( ! ) r_creation_timestamp;
     status = ( ! ) r_status;
     action = ( ! ) r_action;
     operation_id = ( ! ) r_operation_id;
   }
    : stack_set_operation_summary)

let stack_set_operation_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_set_operation_summary_of_xml i) ()

let stack_set_operation_result_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CANCELLED" -> CANCELLED
   | "FAILED" -> FAILED
   | "SUCCEEDED" -> SUCCEEDED
   | "RUNNING" -> RUNNING
   | "PENDING" -> PENDING
   | _ -> failwith "unknown enum value"
    : stack_set_operation_result_status)

let reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let account_gate_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SKIPPED" -> SKIPPED
   | "FAILED" -> FAILED
   | "SUCCEEDED" -> SUCCEEDED
   | _ -> failwith "unknown enum value"
    : account_gate_status)

let account_gate_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let account_gate_result_of_xml i =
  let r_status_reason = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StatusReason"; "Status" ] (fun tag _ ->
      match tag with
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> account_gate_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> account_gate_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status_reason = ( ! ) r_status_reason; status = ( ! ) r_status } : account_gate_result)

let stack_set_operation_result_summary_of_xml i =
  let r_organizational_unit_id = ref None in
  let r_account_gate_result = ref None in
  let r_status_reason = ref None in
  let r_status = ref None in
  let r_region = ref None in
  let r_account = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "OrganizationalUnitId"; "AccountGateResult"; "StatusReason"; "Status"; "Region"; "Account" ]
    (fun tag _ ->
      match tag with
      | "OrganizationalUnitId" ->
          r_organizational_unit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationalUnitId"
                 (fun i _ -> organizational_unit_id_of_xml i)
                 ())
      | "AccountGateResult" ->
          r_account_gate_result :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountGateResult"
                 (fun i _ -> account_gate_result_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason" (fun i _ -> reason_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_operation_result_status_of_xml i)
                 ())
      | "Region" ->
          r_region :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Region" (fun i _ -> region_of_xml i) ())
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> account_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     organizational_unit_id = ( ! ) r_organizational_unit_id;
     account_gate_result = ( ! ) r_account_gate_result;
     status_reason = ( ! ) r_status_reason;
     status = ( ! ) r_status;
     region = ( ! ) r_region;
     account = ( ! ) r_account;
   }
    : stack_set_operation_result_summary)

let stack_set_operation_result_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> stack_set_operation_result_summary_of_xml i)
    ()

let retain_stacks_nullable_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let stack_set_drift_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "NOT_CHECKED" -> NOT_CHECKED
   | "IN_SYNC" -> IN_SYNC
   | "DRIFTED" -> DRIFTED
   | _ -> failwith "unknown enum value"
    : stack_set_drift_status)

let stack_set_drift_detection_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "STOPPED" -> STOPPED
   | "IN_PROGRESS" -> IN_PROGRESS
   | "PARTIAL_SUCCESS" -> PARTIAL_SUCCESS
   | "FAILED" -> FAILED
   | "COMPLETED" -> COMPLETED
   | _ -> failwith "unknown enum value"
    : stack_set_drift_detection_status)

let drifted_stack_instances_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let in_sync_stack_instances_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let in_progress_stack_instances_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let stack_set_drift_detection_details_of_xml i =
  let r_failed_stack_instances_count = ref None in
  let r_in_progress_stack_instances_count = ref None in
  let r_in_sync_stack_instances_count = ref None in
  let r_drifted_stack_instances_count = ref None in
  let r_total_stack_instances_count = ref None in
  let r_last_drift_check_timestamp = ref None in
  let r_drift_detection_status = ref None in
  let r_drift_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "FailedStackInstancesCount";
      "InProgressStackInstancesCount";
      "InSyncStackInstancesCount";
      "DriftedStackInstancesCount";
      "TotalStackInstancesCount";
      "LastDriftCheckTimestamp";
      "DriftDetectionStatus";
      "DriftStatus";
    ] (fun tag _ ->
      match tag with
      | "FailedStackInstancesCount" ->
          r_failed_stack_instances_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailedStackInstancesCount"
                 (fun i _ -> failed_stack_instances_count_of_xml i)
                 ())
      | "InProgressStackInstancesCount" ->
          r_in_progress_stack_instances_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InProgressStackInstancesCount"
                 (fun i _ -> in_progress_stack_instances_count_of_xml i)
                 ())
      | "InSyncStackInstancesCount" ->
          r_in_sync_stack_instances_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InSyncStackInstancesCount"
                 (fun i _ -> in_sync_stack_instances_count_of_xml i)
                 ())
      | "DriftedStackInstancesCount" ->
          r_drifted_stack_instances_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftedStackInstancesCount"
                 (fun i _ -> drifted_stack_instances_count_of_xml i)
                 ())
      | "TotalStackInstancesCount" ->
          r_total_stack_instances_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalStackInstancesCount"
                 (fun i _ -> total_stack_instances_count_of_xml i)
                 ())
      | "LastDriftCheckTimestamp" ->
          r_last_drift_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastDriftCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "DriftDetectionStatus" ->
          r_drift_detection_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftDetectionStatus"
                 (fun i _ -> stack_set_drift_detection_status_of_xml i)
                 ())
      | "DriftStatus" ->
          r_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftStatus"
                 (fun i _ -> stack_set_drift_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     failed_stack_instances_count = ( ! ) r_failed_stack_instances_count;
     in_progress_stack_instances_count = ( ! ) r_in_progress_stack_instances_count;
     in_sync_stack_instances_count = ( ! ) r_in_sync_stack_instances_count;
     drifted_stack_instances_count = ( ! ) r_drifted_stack_instances_count;
     total_stack_instances_count = ( ! ) r_total_stack_instances_count;
     last_drift_check_timestamp = ( ! ) r_last_drift_check_timestamp;
     drift_detection_status = ( ! ) r_drift_detection_status;
     drift_status = ( ! ) r_drift_status;
   }
    : stack_set_drift_detection_details)

let stack_set_operation_of_xml i =
  let r_status_details = ref None in
  let r_status_reason = ref None in
  let r_stack_set_drift_detection_details = ref None in
  let r_deployment_targets = ref None in
  let r_end_timestamp = ref None in
  let r_creation_timestamp = ref None in
  let r_execution_role_name = ref None in
  let r_administration_role_ar_n = ref None in
  let r_retain_stacks = ref None in
  let r_operation_preferences = ref None in
  let r_status = ref None in
  let r_action = ref None in
  let r_stack_set_id = ref None in
  let r_operation_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StatusDetails";
      "StatusReason";
      "StackSetDriftDetectionDetails";
      "DeploymentTargets";
      "EndTimestamp";
      "CreationTimestamp";
      "ExecutionRoleName";
      "AdministrationRoleARN";
      "RetainStacks";
      "OperationPreferences";
      "Status";
      "Action";
      "StackSetId";
      "OperationId";
    ] (fun tag _ ->
      match tag with
      | "StatusDetails" ->
          r_status_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusDetails"
                 (fun i _ -> stack_set_operation_status_details_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> stack_set_operation_status_reason_of_xml i)
                 ())
      | "StackSetDriftDetectionDetails" ->
          r_stack_set_drift_detection_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetDriftDetectionDetails"
                 (fun i _ -> stack_set_drift_detection_details_of_xml i)
                 ())
      | "DeploymentTargets" ->
          r_deployment_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTargets"
                 (fun i _ -> deployment_targets_of_xml i)
                 ())
      | "EndTimestamp" ->
          r_end_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "CreationTimestamp" ->
          r_creation_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ExecutionRoleName" ->
          r_execution_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleName"
                 (fun i _ -> execution_role_name_of_xml i)
                 ())
      | "AdministrationRoleARN" ->
          r_administration_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdministrationRoleARN"
                 (fun i _ -> role_ar_n_of_xml i)
                 ())
      | "RetainStacks" ->
          r_retain_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainStacks"
                 (fun i _ -> retain_stacks_nullable_of_xml i)
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_operation_status_of_xml i)
                 ())
      | "Action" ->
          r_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Action"
                 (fun i _ -> stack_set_operation_action_of_xml i)
                 ())
      | "StackSetId" ->
          r_stack_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetId"
                 (fun i _ -> stack_set_id_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status_details = ( ! ) r_status_details;
     status_reason = ( ! ) r_status_reason;
     stack_set_drift_detection_details = ( ! ) r_stack_set_drift_detection_details;
     deployment_targets = ( ! ) r_deployment_targets;
     end_timestamp = ( ! ) r_end_timestamp;
     creation_timestamp = ( ! ) r_creation_timestamp;
     execution_role_name = ( ! ) r_execution_role_name;
     administration_role_ar_n = ( ! ) r_administration_role_ar_n;
     retain_stacks = ( ! ) r_retain_stacks;
     operation_preferences = ( ! ) r_operation_preferences;
     status = ( ! ) r_status;
     action = ( ! ) r_action;
     stack_set_id = ( ! ) r_stack_set_id;
     operation_id = ( ! ) r_operation_id;
   }
    : stack_set_operation)

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

let stack_set_auto_deployment_target_summary_of_xml i =
  let r_regions = ref None in
  let r_organizational_unit_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Regions"; "OrganizationalUnitId" ] (fun tag _ ->
      match tag with
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "OrganizationalUnitId" ->
          r_organizational_unit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationalUnitId"
                 (fun i _ -> organizational_unit_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ regions = ( ! ) r_regions; organizational_unit_id = ( ! ) r_organizational_unit_id }
    : stack_set_auto_deployment_target_summary)

let stack_set_auto_deployment_target_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> stack_set_auto_deployment_target_summary_of_xml i)
    ()

let stack_set_of_xml i =
  let r_regions = ref None in
  let r_managed_execution = ref None in
  let r_organizational_unit_ids = ref None in
  let r_permission_model = ref None in
  let r_auto_deployment = ref None in
  let r_stack_set_drift_detection_details = ref None in
  let r_execution_role_name = ref None in
  let r_administration_role_ar_n = ref None in
  let r_stack_set_ar_n = ref None in
  let r_tags = ref None in
  let r_capabilities = ref None in
  let r_parameters = ref None in
  let r_template_body = ref None in
  let r_status = ref None in
  let r_description = ref None in
  let r_stack_set_id = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Regions";
      "ManagedExecution";
      "OrganizationalUnitIds";
      "PermissionModel";
      "AutoDeployment";
      "StackSetDriftDetectionDetails";
      "ExecutionRoleName";
      "AdministrationRoleARN";
      "StackSetARN";
      "Tags";
      "Capabilities";
      "Parameters";
      "TemplateBody";
      "Status";
      "Description";
      "StackSetId";
      "StackSetName";
    ] (fun tag _ ->
      match tag with
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "ManagedExecution" ->
          r_managed_execution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedExecution"
                 (fun i _ -> managed_execution_of_xml i)
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
      | "StackSetDriftDetectionDetails" ->
          r_stack_set_drift_detection_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetDriftDetectionDetails"
                 (fun i _ -> stack_set_drift_detection_details_of_xml i)
                 ())
      | "ExecutionRoleName" ->
          r_execution_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleName"
                 (fun i _ -> execution_role_name_of_xml i)
                 ())
      | "AdministrationRoleARN" ->
          r_administration_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdministrationRoleARN"
                 (fun i _ -> role_ar_n_of_xml i)
                 ())
      | "StackSetARN" ->
          r_stack_set_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetARN"
                 (fun i _ -> stack_set_ar_n_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_status_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "StackSetId" ->
          r_stack_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetId"
                 (fun i _ -> stack_set_id_of_xml i)
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     regions = ( ! ) r_regions;
     managed_execution = ( ! ) r_managed_execution;
     organizational_unit_ids = ( ! ) r_organizational_unit_ids;
     permission_model = ( ! ) r_permission_model;
     auto_deployment = ( ! ) r_auto_deployment;
     stack_set_drift_detection_details = ( ! ) r_stack_set_drift_detection_details;
     execution_role_name = ( ! ) r_execution_role_name;
     administration_role_ar_n = ( ! ) r_administration_role_ar_n;
     stack_set_ar_n = ( ! ) r_stack_set_ar_n;
     tags = ( ! ) r_tags;
     capabilities = ( ! ) r_capabilities;
     parameters = ( ! ) r_parameters;
     template_body = ( ! ) r_template_body;
     status = ( ! ) r_status;
     description = ( ! ) r_description;
     stack_set_id = ( ! ) r_stack_set_id;
     stack_set_name = ( ! ) r_stack_set_name;
   }
    : stack_set)

let physical_resource_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ROLLBACK_FAILED" -> ROLLBACK_FAILED
   | "ROLLBACK_COMPLETE" -> ROLLBACK_COMPLETE
   | "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
   | "UPDATE_ROLLBACK_FAILED" -> UPDATE_ROLLBACK_FAILED
   | "UPDATE_ROLLBACK_COMPLETE" -> UPDATE_ROLLBACK_COMPLETE
   | "UPDATE_ROLLBACK_IN_PROGRESS" -> UPDATE_ROLLBACK_IN_PROGRESS
   | "EXPORT_ROLLBACK_COMPLETE" -> EXPORT_ROLLBACK_COMPLETE
   | "EXPORT_ROLLBACK_FAILED" -> EXPORT_ROLLBACK_FAILED
   | "EXPORT_ROLLBACK_IN_PROGRESS" -> EXPORT_ROLLBACK_IN_PROGRESS
   | "EXPORT_IN_PROGRESS" -> EXPORT_IN_PROGRESS
   | "EXPORT_COMPLETE" -> EXPORT_COMPLETE
   | "EXPORT_FAILED" -> EXPORT_FAILED
   | "IMPORT_ROLLBACK_COMPLETE" -> IMPORT_ROLLBACK_COMPLETE
   | "IMPORT_ROLLBACK_FAILED" -> IMPORT_ROLLBACK_FAILED
   | "IMPORT_ROLLBACK_IN_PROGRESS" -> IMPORT_ROLLBACK_IN_PROGRESS
   | "IMPORT_IN_PROGRESS" -> IMPORT_IN_PROGRESS
   | "IMPORT_COMPLETE" -> IMPORT_COMPLETE
   | "IMPORT_FAILED" -> IMPORT_FAILED
   | "UPDATE_COMPLETE" -> UPDATE_COMPLETE
   | "UPDATE_FAILED" -> UPDATE_FAILED
   | "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
   | "DELETE_SKIPPED" -> DELETE_SKIPPED
   | "DELETE_COMPLETE" -> DELETE_COMPLETE
   | "DELETE_FAILED" -> DELETE_FAILED
   | "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | "CREATE_COMPLETE" -> CREATE_COMPLETE
   | "CREATE_FAILED" -> CREATE_FAILED
   | "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | _ -> failwith "unknown enum value"
    : resource_status)

let resource_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_resource_drift_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "UNSUPPORTED" -> UNSUPPORTED
   | "UNKNOWN" -> UNKNOWN
   | "NOT_CHECKED" -> NOT_CHECKED
   | "DELETED" -> DELETED
   | "MODIFIED" -> MODIFIED
   | "IN_SYNC" -> IN_SYNC
   | _ -> failwith "unknown enum value"
    : stack_resource_drift_status)

let stack_resource_drift_information_of_xml i =
  let r_last_check_timestamp = ref None in
  let r_stack_resource_drift_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LastCheckTimestamp"; "StackResourceDriftStatus" ]
    (fun tag _ ->
      match tag with
      | "LastCheckTimestamp" ->
          r_last_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "StackResourceDriftStatus" ->
          r_stack_resource_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDriftStatus"
                 (fun i _ -> stack_resource_drift_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     last_check_timestamp = ( ! ) r_last_check_timestamp;
     stack_resource_drift_status =
       Smaws_Lib.Xml.Parse.required "StackResourceDriftStatus"
         (( ! ) r_stack_resource_drift_status)
         i;
   }
    : stack_resource_drift_information)

let logical_id_hierarchy_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let module_info_of_xml i =
  let r_logical_id_hierarchy = ref None in
  let r_type_hierarchy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LogicalIdHierarchy"; "TypeHierarchy" ]
    (fun tag _ ->
      match tag with
      | "LogicalIdHierarchy" ->
          r_logical_id_hierarchy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalIdHierarchy"
                 (fun i _ -> logical_id_hierarchy_of_xml i)
                 ())
      | "TypeHierarchy" ->
          r_type_hierarchy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeHierarchy"
                 (fun i _ -> type_hierarchy_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ logical_id_hierarchy = ( ! ) r_logical_id_hierarchy; type_hierarchy = ( ! ) r_type_hierarchy }
    : module_info)

let stack_resource_of_xml i =
  let r_module_info = ref None in
  let r_drift_information = ref None in
  let r_description = ref None in
  let r_resource_status_reason = ref None in
  let r_resource_status = ref None in
  let r_timestamp = ref None in
  let r_resource_type = ref None in
  let r_physical_resource_id = ref None in
  let r_logical_resource_id = ref None in
  let r_stack_id = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ModuleInfo";
      "DriftInformation";
      "Description";
      "ResourceStatusReason";
      "ResourceStatus";
      "Timestamp";
      "ResourceType";
      "PhysicalResourceId";
      "LogicalResourceId";
      "StackId";
      "StackName";
    ] (fun tag _ ->
      match tag with
      | "ModuleInfo" ->
          r_module_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModuleInfo"
                 (fun i _ -> module_info_of_xml i)
                 ())
      | "DriftInformation" ->
          r_drift_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftInformation"
                 (fun i _ -> stack_resource_drift_information_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> resource_status_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     module_info = ( ! ) r_module_info;
     drift_information = ( ! ) r_drift_information;
     description = ( ! ) r_description;
     resource_status_reason = ( ! ) r_resource_status_reason;
     resource_status = Smaws_Lib.Xml.Parse.required "ResourceStatus" (( ! ) r_resource_status) i;
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     physical_resource_id = ( ! ) r_physical_resource_id;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     stack_id = ( ! ) r_stack_id;
     stack_name = ( ! ) r_stack_name;
   }
    : stack_resource)

let stack_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_resource_of_xml i) ()

let stack_resource_drift_information_summary_of_xml i =
  let r_last_check_timestamp = ref None in
  let r_stack_resource_drift_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LastCheckTimestamp"; "StackResourceDriftStatus" ]
    (fun tag _ ->
      match tag with
      | "LastCheckTimestamp" ->
          r_last_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "StackResourceDriftStatus" ->
          r_stack_resource_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDriftStatus"
                 (fun i _ -> stack_resource_drift_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     last_check_timestamp = ( ! ) r_last_check_timestamp;
     stack_resource_drift_status =
       Smaws_Lib.Xml.Parse.required "StackResourceDriftStatus"
         (( ! ) r_stack_resource_drift_status)
         i;
   }
    : stack_resource_drift_information_summary)

let stack_resource_summary_of_xml i =
  let r_module_info = ref None in
  let r_drift_information = ref None in
  let r_resource_status_reason = ref None in
  let r_resource_status = ref None in
  let r_last_updated_timestamp = ref None in
  let r_resource_type = ref None in
  let r_physical_resource_id = ref None in
  let r_logical_resource_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ModuleInfo";
      "DriftInformation";
      "ResourceStatusReason";
      "ResourceStatus";
      "LastUpdatedTimestamp";
      "ResourceType";
      "PhysicalResourceId";
      "LogicalResourceId";
    ] (fun tag _ ->
      match tag with
      | "ModuleInfo" ->
          r_module_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModuleInfo"
                 (fun i _ -> module_info_of_xml i)
                 ())
      | "DriftInformation" ->
          r_drift_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftInformation"
                 (fun i _ -> stack_resource_drift_information_summary_of_xml i)
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> resource_status_of_xml i)
                 ())
      | "LastUpdatedTimestamp" ->
          r_last_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     module_info = ( ! ) r_module_info;
     drift_information = ( ! ) r_drift_information;
     resource_status_reason = ( ! ) r_resource_status_reason;
     resource_status = Smaws_Lib.Xml.Parse.required "ResourceStatus" (( ! ) r_resource_status) i;
     last_updated_timestamp =
       Smaws_Lib.Xml.Parse.required "LastUpdatedTimestamp" (( ! ) r_last_updated_timestamp) i;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     physical_resource_id = ( ! ) r_physical_resource_id;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
   }
    : stack_resource_summary)

let stack_resource_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_resource_summary_of_xml i) ()

let key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let physical_resource_id_context_key_value_pair_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Key" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> value_of_xml i) ())
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> key_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
     key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i;
   }
    : physical_resource_id_context_key_value_pair)

let physical_resource_id_context_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> physical_resource_id_context_key_value_pair_of_xml i)
    ()

let properties_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let property_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let difference_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "NOT_EQUAL" -> NOT_EQUAL
   | "REMOVE" -> REMOVE
   | "ADD" -> ADD
   | _ -> failwith "unknown enum value"
    : difference_type)

let property_difference_of_xml i =
  let r_difference_type = ref None in
  let r_actual_value = ref None in
  let r_expected_value = ref None in
  let r_property_path = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DifferenceType"; "ActualValue"; "ExpectedValue"; "PropertyPath" ] (fun tag _ ->
      match tag with
      | "DifferenceType" ->
          r_difference_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DifferenceType"
                 (fun i _ -> difference_type_of_xml i)
                 ())
      | "ActualValue" ->
          r_actual_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActualValue"
                 (fun i _ -> property_value_of_xml i)
                 ())
      | "ExpectedValue" ->
          r_expected_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpectedValue"
                 (fun i _ -> property_value_of_xml i)
                 ())
      | "PropertyPath" ->
          r_property_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PropertyPath"
                 (fun i _ -> property_path_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     difference_type = Smaws_Lib.Xml.Parse.required "DifferenceType" (( ! ) r_difference_type) i;
     actual_value = Smaws_Lib.Xml.Parse.required "ActualValue" (( ! ) r_actual_value) i;
     expected_value = Smaws_Lib.Xml.Parse.required "ExpectedValue" (( ! ) r_expected_value) i;
     property_path = Smaws_Lib.Xml.Parse.required "PropertyPath" (( ! ) r_property_path) i;
   }
    : property_difference)

let property_differences_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> property_difference_of_xml i) ()

let stack_resource_drift_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_resource_drift_of_xml i =
  let r_drift_status_reason = ref None in
  let r_module_info = ref None in
  let r_timestamp = ref None in
  let r_stack_resource_drift_status = ref None in
  let r_property_differences = ref None in
  let r_actual_properties = ref None in
  let r_expected_properties = ref None in
  let r_resource_type = ref None in
  let r_physical_resource_id_context = ref None in
  let r_physical_resource_id = ref None in
  let r_logical_resource_id = ref None in
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DriftStatusReason";
      "ModuleInfo";
      "Timestamp";
      "StackResourceDriftStatus";
      "PropertyDifferences";
      "ActualProperties";
      "ExpectedProperties";
      "ResourceType";
      "PhysicalResourceIdContext";
      "PhysicalResourceId";
      "LogicalResourceId";
      "StackId";
    ] (fun tag _ ->
      match tag with
      | "DriftStatusReason" ->
          r_drift_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftStatusReason"
                 (fun i _ -> stack_resource_drift_status_reason_of_xml i)
                 ())
      | "ModuleInfo" ->
          r_module_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModuleInfo"
                 (fun i _ -> module_info_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "StackResourceDriftStatus" ->
          r_stack_resource_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDriftStatus"
                 (fun i _ -> stack_resource_drift_status_of_xml i)
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
      | "ActualProperties" ->
          r_actual_properties :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActualProperties"
                 (fun i _ -> properties_of_xml i)
                 ())
      | "ExpectedProperties" ->
          r_expected_properties :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExpectedProperties"
                 (fun i _ -> properties_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
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
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     drift_status_reason = ( ! ) r_drift_status_reason;
     module_info = ( ! ) r_module_info;
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
     stack_resource_drift_status =
       Smaws_Lib.Xml.Parse.required "StackResourceDriftStatus"
         (( ! ) r_stack_resource_drift_status)
         i;
     property_differences = ( ! ) r_property_differences;
     actual_properties = ( ! ) r_actual_properties;
     expected_properties = ( ! ) r_expected_properties;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     physical_resource_id_context = ( ! ) r_physical_resource_id_context;
     physical_resource_id = ( ! ) r_physical_resource_id;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     stack_id = Smaws_Lib.Xml.Parse.required "StackId" (( ! ) r_stack_id) i;
   }
    : stack_resource_drift)

let stack_resource_drifts_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_resource_drift_of_xml i) ()

let stack_resource_drift_status_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_resource_drift_status_of_xml i) ()

let metadata_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_resource_detail_of_xml i =
  let r_module_info = ref None in
  let r_drift_information = ref None in
  let r_metadata = ref None in
  let r_description = ref None in
  let r_resource_status_reason = ref None in
  let r_resource_status = ref None in
  let r_last_updated_timestamp = ref None in
  let r_resource_type = ref None in
  let r_physical_resource_id = ref None in
  let r_logical_resource_id = ref None in
  let r_stack_id = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ModuleInfo";
      "DriftInformation";
      "Metadata";
      "Description";
      "ResourceStatusReason";
      "ResourceStatus";
      "LastUpdatedTimestamp";
      "ResourceType";
      "PhysicalResourceId";
      "LogicalResourceId";
      "StackId";
      "StackName";
    ] (fun tag _ ->
      match tag with
      | "ModuleInfo" ->
          r_module_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModuleInfo"
                 (fun i _ -> module_info_of_xml i)
                 ())
      | "DriftInformation" ->
          r_drift_information :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftInformation"
                 (fun i _ -> stack_resource_drift_information_of_xml i)
                 ())
      | "Metadata" ->
          r_metadata :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Metadata" (fun i _ -> metadata_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> resource_status_of_xml i)
                 ())
      | "LastUpdatedTimestamp" ->
          r_last_updated_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     module_info = ( ! ) r_module_info;
     drift_information = ( ! ) r_drift_information;
     metadata = ( ! ) r_metadata;
     description = ( ! ) r_description;
     resource_status_reason = ( ! ) r_resource_status_reason;
     resource_status = Smaws_Lib.Xml.Parse.required "ResourceStatus" (( ! ) r_resource_status) i;
     last_updated_timestamp =
       Smaws_Lib.Xml.Parse.required "LastUpdatedTimestamp" (( ! ) r_last_updated_timestamp) i;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     physical_resource_id = ( ! ) r_physical_resource_id;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     stack_id = ( ! ) r_stack_id;
     stack_name = ( ! ) r_stack_name;
   }
    : stack_resource_detail)

let stack_refactor_untag_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ()

let stack_refactor_tag_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let stack_refactor_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_refactor_execution_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ROLLBACK_FAILED" -> ROLLBACK_FAILED
   | "ROLLBACK_COMPLETE" -> ROLLBACK_COMPLETE
   | "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
   | "EXECUTE_FAILED" -> EXECUTE_FAILED
   | "EXECUTE_COMPLETE" -> EXECUTE_COMPLETE
   | "EXECUTE_IN_PROGRESS" -> EXECUTE_IN_PROGRESS
   | "OBSOLETE" -> OBSOLETE
   | "AVAILABLE" -> AVAILABLE
   | "UNAVAILABLE" -> UNAVAILABLE
   | _ -> failwith "unknown enum value"
    : stack_refactor_execution_status)

let execution_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_refactor_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DELETE_FAILED" -> DELETE_FAILED
   | "DELETE_COMPLETE" -> DELETE_COMPLETE
   | "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | "CREATE_FAILED" -> CREATE_FAILED
   | "CREATE_COMPLETE" -> CREATE_COMPLETE
   | "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | _ -> failwith "unknown enum value"
    : stack_refactor_status)

let stack_refactor_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_refactor_summary_of_xml i =
  let r_status_reason = ref None in
  let r_status = ref None in
  let r_execution_status_reason = ref None in
  let r_execution_status = ref None in
  let r_description = ref None in
  let r_stack_refactor_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StatusReason";
      "Status";
      "ExecutionStatusReason";
      "ExecutionStatus";
      "Description";
      "StackRefactorId";
    ] (fun tag _ ->
      match tag with
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> stack_refactor_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_refactor_status_of_xml i)
                 ())
      | "ExecutionStatusReason" ->
          r_execution_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatusReason"
                 (fun i _ -> execution_status_reason_of_xml i)
                 ())
      | "ExecutionStatus" ->
          r_execution_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatus"
                 (fun i _ -> stack_refactor_execution_status_of_xml i)
                 ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status_reason = ( ! ) r_status_reason;
     status = ( ! ) r_status;
     execution_status_reason = ( ! ) r_execution_status_reason;
     execution_status = ( ! ) r_execution_status;
     description = ( ! ) r_description;
     stack_refactor_id = ( ! ) r_stack_refactor_id;
   }
    : stack_refactor_summary)

let stack_refactor_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_refactor_summary_of_xml i) ()

let stack_refactor_resource_identifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let stack_refactor_execution_status_filter_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> stack_refactor_execution_status_of_xml i)
    ()

let stack_refactor_detection_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "MANUAL" -> MANUAL | "AUTO" -> AUTO | _ -> failwith "unknown enum value"
    : stack_refactor_detection)

let stack_refactor_action_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "CREATE" -> CREATE | "MOVE" -> MOVE | _ -> failwith "unknown enum value"
    : stack_refactor_action_type)

let stack_refactor_action_entity_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "STACK" -> STACK | "RESOURCE" -> RESOURCE | _ -> failwith "unknown enum value"
    : stack_refactor_action_entity)

let detection_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_location_of_xml i =
  let r_logical_resource_id = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LogicalResourceId"; "StackName" ] (fun tag _ ->
      match tag with
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : resource_location)

let resource_mapping_of_xml i =
  let r_destination = ref None in
  let r_source = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Destination"; "Source" ] (fun tag _ ->
      match tag with
      | "Destination" ->
          r_destination :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Destination"
                 (fun i _ -> resource_location_of_xml i)
                 ())
      | "Source" ->
          r_source :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Source"
                 (fun i _ -> resource_location_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     destination = Smaws_Lib.Xml.Parse.required "Destination" (( ! ) r_destination) i;
     source = Smaws_Lib.Xml.Parse.required "Source" (( ! ) r_source) i;
   }
    : resource_mapping)

let stack_refactor_action_of_xml i =
  let r_resource_mapping = ref None in
  let r_untag_resources = ref None in
  let r_tag_resources = ref None in
  let r_detection_reason = ref None in
  let r_detection = ref None in
  let r_description = ref None in
  let r_resource_identifier = ref None in
  let r_physical_resource_id = ref None in
  let r_entity = ref None in
  let r_action = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ResourceMapping";
      "UntagResources";
      "TagResources";
      "DetectionReason";
      "Detection";
      "Description";
      "ResourceIdentifier";
      "PhysicalResourceId";
      "Entity";
      "Action";
    ] (fun tag _ ->
      match tag with
      | "ResourceMapping" ->
          r_resource_mapping :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceMapping"
                 (fun i _ -> resource_mapping_of_xml i)
                 ())
      | "UntagResources" ->
          r_untag_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UntagResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ())
                 ())
      | "TagResources" ->
          r_tag_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "DetectionReason" ->
          r_detection_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetectionReason"
                 (fun i _ -> detection_reason_of_xml i)
                 ())
      | "Detection" ->
          r_detection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Detection"
                 (fun i _ -> stack_refactor_detection_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ -> stack_refactor_resource_identifier_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "Entity" ->
          r_entity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Entity"
                 (fun i _ -> stack_refactor_action_entity_of_xml i)
                 ())
      | "Action" ->
          r_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Action"
                 (fun i _ -> stack_refactor_action_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_mapping = ( ! ) r_resource_mapping;
     untag_resources = ( ! ) r_untag_resources;
     tag_resources = ( ! ) r_tag_resources;
     detection_reason = ( ! ) r_detection_reason;
     detection = ( ! ) r_detection;
     description = ( ! ) r_description;
     resource_identifier = ( ! ) r_resource_identifier;
     physical_resource_id = ( ! ) r_physical_resource_id;
     entity = ( ! ) r_entity;
     action = ( ! ) r_action;
   }
    : stack_refactor_action)

let stack_refactor_actions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_refactor_action_of_xml i) ()

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

let stack_instance_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "INOPERABLE" -> INOPERABLE
   | "OUTDATED" -> OUTDATED
   | "CURRENT" -> CURRENT
   | _ -> failwith "unknown enum value"
    : stack_instance_status)

let stack_instance_detailed_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "FAILED_IMPORT" -> FAILED_IMPORT
   | "SKIPPED_SUSPENDED_ACCOUNT" -> SKIPPED_SUSPENDED_ACCOUNT
   | "INOPERABLE" -> INOPERABLE
   | "CANCELLED" -> CANCELLED
   | "FAILED" -> FAILED
   | "SUCCEEDED" -> SUCCEEDED
   | "RUNNING" -> RUNNING
   | "PENDING" -> PENDING
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

let stack_instance_summary_of_xml i =
  let r_last_operation_id = ref None in
  let r_last_drift_check_timestamp = ref None in
  let r_drift_status = ref None in
  let r_organizational_unit_id = ref None in
  let r_stack_instance_status = ref None in
  let r_status_reason = ref None in
  let r_status = ref None in
  let r_stack_id = ref None in
  let r_account = ref None in
  let r_region = ref None in
  let r_stack_set_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LastOperationId";
      "LastDriftCheckTimestamp";
      "DriftStatus";
      "OrganizationalUnitId";
      "StackInstanceStatus";
      "StatusReason";
      "Status";
      "StackId";
      "Account";
      "Region";
      "StackSetId";
    ] (fun tag _ ->
      match tag with
      | "LastOperationId" ->
          r_last_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastOperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "LastDriftCheckTimestamp" ->
          r_last_drift_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastDriftCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "DriftStatus" ->
          r_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | "OrganizationalUnitId" ->
          r_organizational_unit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationalUnitId"
                 (fun i _ -> organizational_unit_id_of_xml i)
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
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_instance_status_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> account_of_xml i) ())
      | "Region" ->
          r_region :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Region" (fun i _ -> region_of_xml i) ())
      | "StackSetId" ->
          r_stack_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetId"
                 (fun i _ -> stack_set_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     last_operation_id = ( ! ) r_last_operation_id;
     last_drift_check_timestamp = ( ! ) r_last_drift_check_timestamp;
     drift_status = ( ! ) r_drift_status;
     organizational_unit_id = ( ! ) r_organizational_unit_id;
     stack_instance_status = ( ! ) r_stack_instance_status;
     status_reason = ( ! ) r_status_reason;
     status = ( ! ) r_status;
     stack_id = ( ! ) r_stack_id;
     account = ( ! ) r_account;
     region = ( ! ) r_region;
     stack_set_id = ( ! ) r_stack_set_id;
   }
    : stack_instance_summary)

let stack_instance_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_instance_summary_of_xml i) ()

let stack_instance_resource_drifts_summary_of_xml i =
  let r_timestamp = ref None in
  let r_stack_resource_drift_status = ref None in
  let r_property_differences = ref None in
  let r_resource_type = ref None in
  let r_physical_resource_id_context = ref None in
  let r_physical_resource_id = ref None in
  let r_logical_resource_id = ref None in
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Timestamp";
      "StackResourceDriftStatus";
      "PropertyDifferences";
      "ResourceType";
      "PhysicalResourceIdContext";
      "PhysicalResourceId";
      "LogicalResourceId";
      "StackId";
    ] (fun tag _ ->
      match tag with
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "StackResourceDriftStatus" ->
          r_stack_resource_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDriftStatus"
                 (fun i _ -> stack_resource_drift_status_of_xml i)
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
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
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
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
     stack_resource_drift_status =
       Smaws_Lib.Xml.Parse.required "StackResourceDriftStatus"
         (( ! ) r_stack_resource_drift_status)
         i;
     property_differences = ( ! ) r_property_differences;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
     physical_resource_id_context = ( ! ) r_physical_resource_id_context;
     physical_resource_id = ( ! ) r_physical_resource_id;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     stack_id = Smaws_Lib.Xml.Parse.required "StackId" (( ! ) r_stack_id) i;
   }
    : stack_instance_resource_drifts_summary)

let stack_instance_resource_drifts_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> stack_instance_resource_drifts_summary_of_xml i)
    ()

let stack_instance_filter_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DRIFT_STATUS" -> DRIFT_STATUS
   | "LAST_OPERATION_ID" -> LAST_OPERATION_ID
   | "DETAILED_STATUS" -> DETAILED_STATUS
   | _ -> failwith "unknown enum value"
    : stack_instance_filter_name)

let stack_instance_filter_values_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_instance_filter_of_xml i =
  let r_values = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values"; "Name" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ -> stack_instance_filter_values_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> stack_instance_filter_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ values = ( ! ) r_values; name = ( ! ) r_name } : stack_instance_filter)

let stack_instance_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_instance_filter_of_xml i) ()

let stack_instance_of_xml i =
  let r_last_operation_id = ref None in
  let r_last_drift_check_timestamp = ref None in
  let r_drift_status = ref None in
  let r_organizational_unit_id = ref None in
  let r_status_reason = ref None in
  let r_stack_instance_status = ref None in
  let r_status = ref None in
  let r_parameter_overrides = ref None in
  let r_stack_id = ref None in
  let r_account = ref None in
  let r_region = ref None in
  let r_stack_set_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "LastOperationId";
      "LastDriftCheckTimestamp";
      "DriftStatus";
      "OrganizationalUnitId";
      "StatusReason";
      "StackInstanceStatus";
      "Status";
      "ParameterOverrides";
      "StackId";
      "Account";
      "Region";
      "StackSetId";
    ] (fun tag _ ->
      match tag with
      | "LastOperationId" ->
          r_last_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastOperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "LastDriftCheckTimestamp" ->
          r_last_drift_check_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastDriftCheckTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "DriftStatus" ->
          r_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | "OrganizationalUnitId" ->
          r_organizational_unit_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OrganizationalUnitId"
                 (fun i _ -> organizational_unit_id_of_xml i)
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
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_instance_status_of_xml i)
                 ())
      | "ParameterOverrides" ->
          r_parameter_overrides :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterOverrides"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "Account" ->
          r_account :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Account" (fun i _ -> account_of_xml i) ())
      | "Region" ->
          r_region :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Region" (fun i _ -> region_of_xml i) ())
      | "StackSetId" ->
          r_stack_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetId"
                 (fun i _ -> stack_set_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     last_operation_id = ( ! ) r_last_operation_id;
     last_drift_check_timestamp = ( ! ) r_last_drift_check_timestamp;
     drift_status = ( ! ) r_drift_status;
     organizational_unit_id = ( ! ) r_organizational_unit_id;
     status_reason = ( ! ) r_status_reason;
     stack_instance_status = ( ! ) r_stack_instance_status;
     status = ( ! ) r_status;
     parameter_overrides = ( ! ) r_parameter_overrides;
     stack_id = ( ! ) r_stack_id;
     account = ( ! ) r_account;
     region = ( ! ) r_region;
     stack_set_id = ( ! ) r_stack_set_id;
   }
    : stack_instance)

let stack_ids_url_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_id_of_xml i) ()

let stack_id_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_id_of_xml i) ()

let event_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_properties_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let hook_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let hook_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "HOOK_FAILED" -> HOOK_FAILED
   | "HOOK_COMPLETE_FAILED" -> HOOK_COMPLETE_FAILED
   | "HOOK_COMPLETE_SUCCEEDED" -> HOOK_COMPLETE_SUCCEEDED
   | "HOOK_IN_PROGRESS" -> HOOK_IN_PROGRESS
   | _ -> failwith "unknown enum value"
    : hook_status)

let hook_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let hook_invocation_point_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "PRE_PROVISION" -> PRE_PROVISION | _ -> failwith "unknown enum value"
    : hook_invocation_point)

let hook_invocation_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let hook_failure_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "WARN" -> WARN | "FAIL" -> FAIL | _ -> failwith "unknown enum value"
    : hook_failure_mode)

let stack_event_of_xml i =
  let r_detailed_status = ref None in
  let r_hook_failure_mode = ref None in
  let r_hook_invocation_id = ref None in
  let r_hook_invocation_point = ref None in
  let r_hook_status_reason = ref None in
  let r_hook_status = ref None in
  let r_hook_type = ref None in
  let r_client_request_token = ref None in
  let r_resource_properties = ref None in
  let r_resource_status_reason = ref None in
  let r_resource_status = ref None in
  let r_timestamp = ref None in
  let r_resource_type = ref None in
  let r_physical_resource_id = ref None in
  let r_logical_resource_id = ref None in
  let r_operation_id = ref None in
  let r_stack_name = ref None in
  let r_event_id = ref None in
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DetailedStatus";
      "HookFailureMode";
      "HookInvocationId";
      "HookInvocationPoint";
      "HookStatusReason";
      "HookStatus";
      "HookType";
      "ClientRequestToken";
      "ResourceProperties";
      "ResourceStatusReason";
      "ResourceStatus";
      "Timestamp";
      "ResourceType";
      "PhysicalResourceId";
      "LogicalResourceId";
      "OperationId";
      "StackName";
      "EventId";
      "StackId";
    ] (fun tag _ ->
      match tag with
      | "DetailedStatus" ->
          r_detailed_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetailedStatus"
                 (fun i _ -> detailed_status_of_xml i)
                 ())
      | "HookFailureMode" ->
          r_hook_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookFailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "HookInvocationId" ->
          r_hook_invocation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookInvocationId"
                 (fun i _ -> hook_invocation_id_of_xml i)
                 ())
      | "HookInvocationPoint" ->
          r_hook_invocation_point :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookInvocationPoint"
                 (fun i _ -> hook_invocation_point_of_xml i)
                 ())
      | "HookStatusReason" ->
          r_hook_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatusReason"
                 (fun i _ -> hook_status_reason_of_xml i)
                 ())
      | "HookStatus" ->
          r_hook_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatus"
                 (fun i _ -> hook_status_of_xml i)
                 ())
      | "HookType" ->
          r_hook_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "HookType" (fun i _ -> hook_type_of_xml i) ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "ResourceProperties" ->
          r_resource_properties :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceProperties"
                 (fun i _ -> resource_properties_of_xml i)
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> resource_status_of_xml i)
                 ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "EventId" ->
          r_event_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EventId" (fun i _ -> event_id_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     detailed_status = ( ! ) r_detailed_status;
     hook_failure_mode = ( ! ) r_hook_failure_mode;
     hook_invocation_id = ( ! ) r_hook_invocation_id;
     hook_invocation_point = ( ! ) r_hook_invocation_point;
     hook_status_reason = ( ! ) r_hook_status_reason;
     hook_status = ( ! ) r_hook_status;
     hook_type = ( ! ) r_hook_type;
     client_request_token = ( ! ) r_client_request_token;
     resource_properties = ( ! ) r_resource_properties;
     resource_status_reason = ( ! ) r_resource_status_reason;
     resource_status = ( ! ) r_resource_status;
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
     resource_type = ( ! ) r_resource_type;
     physical_resource_id = ( ! ) r_physical_resource_id;
     logical_resource_id = ( ! ) r_logical_resource_id;
     operation_id = ( ! ) r_operation_id;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
     event_id = Smaws_Lib.Xml.Parse.required "EventId" (( ! ) r_event_id) i;
     stack_id = Smaws_Lib.Xml.Parse.required "StackId" (( ! ) r_stack_id) i;
   }
    : stack_event)

let stack_events_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_event_of_xml i) ()

let stack_drift_detection_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_drift_detection_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DETECTION_COMPLETE" -> DETECTION_COMPLETE
   | "DETECTION_FAILED" -> DETECTION_FAILED
   | "DETECTION_IN_PROGRESS" -> DETECTION_IN_PROGRESS
   | _ -> failwith "unknown enum value"
    : stack_drift_detection_status)

let stack_drift_detection_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let stack_definition_of_xml i =
  let r_template_ur_l = ref None in
  let r_template_body = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateURL"; "TemplateBody"; "StackName" ]
    (fun tag _ ->
      match tag with
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_ur_l = ( ! ) r_template_ur_l;
     template_body = ( ! ) r_template_body;
     stack_name = ( ! ) r_stack_name;
   }
    : stack_definition)

let stack_definitions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_definition_of_xml i) ()

let resource_signal_unique_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_signal_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "FAILURE" -> FAILURE | "SUCCESS" -> SUCCESS | _ -> failwith "unknown enum value"
    : resource_signal_status)

let signal_resource_input_of_xml i =
  let r_status = ref None in
  let r_unique_id = ref None in
  let r_logical_resource_id = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Status"; "UniqueId"; "LogicalResourceId"; "StackName" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> resource_signal_status_of_xml i)
                 ())
      | "UniqueId" ->
          r_unique_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UniqueId"
                 (fun i _ -> resource_signal_unique_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     unique_id = Smaws_Lib.Xml.Parse.required "UniqueId" (( ! ) r_unique_id) i;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : signal_resource_input)

let set_type_default_version_output_of_xml i = ()
let private_type_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let set_type_default_version_input_of_xml i =
  let r_version_id = ref None in
  let r_type_name = ref None in
  let r_type_ = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VersionId"; "TypeName"; "Type"; "Arn" ]
    (fun tag _ ->
      match tag with
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> private_type_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     version_id = ( ! ) r_version_id;
     type_name = ( ! ) r_type_name;
     type_ = ( ! ) r_type_;
     arn = ( ! ) r_arn;
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
  let r_type_ = ref None in
  let r_type_name = ref None in
  let r_configuration_alias = ref None in
  let r_configuration = ref None in
  let r_type_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Type"; "TypeName"; "ConfigurationAlias"; "Configuration"; "TypeArn" ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "ConfigurationAlias" ->
          r_configuration_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationAlias"
                 (fun i _ -> type_configuration_alias_of_xml i)
                 ())
      | "Configuration" ->
          r_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Configuration"
                 (fun i _ -> type_configuration_of_xml i)
                 ())
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_ = ( ! ) r_type_;
     type_name = ( ! ) r_type_name;
     configuration_alias = ( ! ) r_configuration_alias;
     configuration = Smaws_Lib.Xml.Parse.required "Configuration" (( ! ) r_configuration) i;
     type_arn = ( ! ) r_type_arn;
   }
    : set_type_configuration_input)

let set_stack_policy_input_of_xml i =
  let r_stack_policy_ur_l = ref None in
  let r_stack_policy_body = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackPolicyURL"; "StackPolicyBody"; "StackName" ]
    (fun tag _ ->
      match tag with
      | "StackPolicyURL" ->
          r_stack_policy_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyURL"
                 (fun i _ -> stack_policy_ur_l_of_xml i)
                 ())
      | "StackPolicyBody" ->
          r_stack_policy_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyBody"
                 (fun i _ -> stack_policy_body_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_policy_ur_l = ( ! ) r_stack_policy_ur_l;
     stack_policy_body = ( ! ) r_stack_policy_body;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : set_stack_policy_input)

let resource_attribute_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Tags" -> Tags
   | "UpdateReplacePolicy" -> UpdateReplacePolicy
   | "DeletionPolicy" -> DeletionPolicy
   | "UpdatePolicy" -> UpdatePolicy
   | "CreationPolicy" -> CreationPolicy
   | "Metadata" -> Metadata
   | "Properties" -> Properties
   | _ -> failwith "unknown enum value"
    : resource_attribute)

let scope_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_attribute_of_xml i) ()

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

let managed_by_stack_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let scanned_resource_of_xml i =
  let r_managed_by_stack = ref None in
  let r_resource_identifier = ref None in
  let r_resource_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ManagedByStack"; "ResourceIdentifier"; "ResourceType" ] (fun tag _ ->
      match tag with
      | "ManagedByStack" ->
          r_managed_by_stack :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedByStack"
                 (fun i _ -> managed_by_stack_of_xml i)
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
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     managed_by_stack = ( ! ) r_managed_by_stack;
     resource_identifier = ( ! ) r_resource_identifier;
     resource_type = ( ! ) r_resource_type;
   }
    : scanned_resource)

let scanned_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> scanned_resource_of_xml i) ()

let scanned_resource_identifier_of_xml i =
  let r_resource_identifier = ref None in
  let r_resource_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceIdentifier"; "ResourceType" ]
    (fun tag _ ->
      match tag with
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
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_identifier =
       Smaws_Lib.Xml.Parse.required "ResourceIdentifier" (( ! ) r_resource_identifier) i;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
   }
    : scanned_resource_identifier)

let scanned_resource_identifiers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> scanned_resource_identifier_of_xml i) ()

let scan_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "PARTIAL" -> PARTIAL | "FULL" -> FULL | _ -> failwith "unknown enum value"
    : scan_type)

let s3_url_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let rollback_stack_output_of_xml i =
  let r_operation_id = ref None in
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationId"; "StackId" ] (fun tag _ ->
      match tag with
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_id = ( ! ) r_operation_id; stack_id = ( ! ) r_stack_id } : rollback_stack_output)

let rollback_stack_input_of_xml i =
  let r_deployment_config = ref None in
  let r_retain_except_on_create = ref None in
  let r_client_request_token = ref None in
  let r_role_ar_n = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DeploymentConfig"; "RetainExceptOnCreate"; "ClientRequestToken"; "RoleARN"; "StackName" ]
    (fun tag _ ->
      match tag with
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | "RetainExceptOnCreate" ->
          r_retain_except_on_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainExceptOnCreate"
                 (fun i _ -> retain_except_on_create_of_xml i)
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deployment_config = ( ! ) r_deployment_config;
     retain_except_on_create = ( ! ) r_retain_except_on_create;
     client_request_token = ( ! ) r_client_request_token;
     role_ar_n = ( ! ) r_role_ar_n;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : rollback_stack_input)

let role_ar_n2_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let retain_stacks_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let retain_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> logical_resource_id_of_xml i) ()

let resource_to_skip_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resources_to_skip_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_to_skip_of_xml i) ()

let resource_to_import_of_xml i =
  let r_resource_identifier = ref None in
  let r_logical_resource_id = ref None in
  let r_resource_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceIdentifier"; "LogicalResourceId"; "ResourceType" ] (fun tag _ ->
      match tag with
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
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_identifier =
       Smaws_Lib.Xml.Parse.required "ResourceIdentifier" (( ! ) r_resource_identifier) i;
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     resource_type = Smaws_Lib.Xml.Parse.required "ResourceType" (( ! ) r_resource_type) i;
   }
    : resource_to_import)

let resources_to_import_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_to_import_of_xml i) ()

let resources_scanned_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resources_read_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resource_type_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let property_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let requires_recreation_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Always" -> Always
   | "Conditionally" -> Conditionally
   | "Never" -> Never
   | _ -> failwith "unknown enum value"
    : requires_recreation)

let resource_property_path_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let before_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let after_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let before_value_from_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ACTUAL_STATE" -> ACTUAL_STATE
   | "PREVIOUS_DEPLOYMENT_STATE" -> PREVIOUS_DEPLOYMENT_STATE
   | _ -> failwith "unknown enum value"
    : before_value_from)

let after_value_from_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "TEMPLATE" -> TEMPLATE | _ -> failwith "unknown enum value" : after_value_from)

let resource_drift_previous_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let resource_drift_actual_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let live_resource_drift_of_xml i =
  let r_drift_detection_timestamp = ref None in
  let r_actual_value = ref None in
  let r_previous_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DriftDetectionTimestamp"; "ActualValue"; "PreviousValue" ] (fun tag _ ->
      match tag with
      | "DriftDetectionTimestamp" ->
          r_drift_detection_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftDetectionTimestamp"
                 (fun i _ -> timestamp_of_xml i)
                 ())
      | "ActualValue" ->
          r_actual_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActualValue"
                 (fun i _ -> resource_drift_actual_value_of_xml i)
                 ())
      | "PreviousValue" ->
          r_previous_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreviousValue"
                 (fun i _ -> resource_drift_previous_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     drift_detection_timestamp = ( ! ) r_drift_detection_timestamp;
     actual_value = ( ! ) r_actual_value;
     previous_value = ( ! ) r_previous_value;
   }
    : live_resource_drift)

let attribute_change_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SyncWithActual" -> SyncWithActual
   | "Modify" -> Modify
   | "Remove" -> Remove
   | "Add" -> Add
   | _ -> failwith "unknown enum value"
    : attribute_change_type)

let resource_target_definition_of_xml i =
  let r_attribute_change_type = ref None in
  let r_drift = ref None in
  let r_after_value_from = ref None in
  let r_before_value_from = ref None in
  let r_after_value = ref None in
  let r_before_value = ref None in
  let r_path = ref None in
  let r_requires_recreation = ref None in
  let r_name = ref None in
  let r_attribute = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AttributeChangeType";
      "Drift";
      "AfterValueFrom";
      "BeforeValueFrom";
      "AfterValue";
      "BeforeValue";
      "Path";
      "RequiresRecreation";
      "Name";
      "Attribute";
    ] (fun tag _ ->
      match tag with
      | "AttributeChangeType" ->
          r_attribute_change_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeChangeType"
                 (fun i _ -> attribute_change_type_of_xml i)
                 ())
      | "Drift" ->
          r_drift :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Drift"
                 (fun i _ -> live_resource_drift_of_xml i)
                 ())
      | "AfterValueFrom" ->
          r_after_value_from :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AfterValueFrom"
                 (fun i _ -> after_value_from_of_xml i)
                 ())
      | "BeforeValueFrom" ->
          r_before_value_from :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BeforeValueFrom"
                 (fun i _ -> before_value_from_of_xml i)
                 ())
      | "AfterValue" ->
          r_after_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AfterValue"
                 (fun i _ -> after_value_of_xml i)
                 ())
      | "BeforeValue" ->
          r_before_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BeforeValue"
                 (fun i _ -> before_value_of_xml i)
                 ())
      | "Path" ->
          r_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Path"
                 (fun i _ -> resource_property_path_of_xml i)
                 ())
      | "RequiresRecreation" ->
          r_requires_recreation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RequiresRecreation"
                 (fun i _ -> requires_recreation_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> property_name_of_xml i) ())
      | "Attribute" ->
          r_attribute :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attribute"
                 (fun i _ -> resource_attribute_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attribute_change_type = ( ! ) r_attribute_change_type;
     drift = ( ! ) r_drift;
     after_value_from = ( ! ) r_after_value_from;
     before_value_from = ( ! ) r_before_value_from;
     after_value = ( ! ) r_after_value;
     before_value = ( ! ) r_before_value;
     path = ( ! ) r_path;
     requires_recreation = ( ! ) r_requires_recreation;
     name = ( ! ) r_name;
     attribute = ( ! ) r_attribute;
   }
    : resource_target_definition)

let resource_scanner_max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resource_scan_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "EXPIRED" -> EXPIRED
   | "COMPLETE" -> COMPLETE
   | "FAILED" -> FAILED
   | "IN_PROGRESS" -> IN_PROGRESS
   | _ -> failwith "unknown enum value"
    : resource_scan_status)

let resource_scan_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let percentage_completed_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.float_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let resource_scan_summary_of_xml i =
  let r_scan_type = ref None in
  let r_percentage_completed = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_status_reason = ref None in
  let r_status = ref None in
  let r_resource_scan_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ScanType";
      "PercentageCompleted";
      "EndTime";
      "StartTime";
      "StatusReason";
      "Status";
      "ResourceScanId";
    ] (fun tag _ ->
      match tag with
      | "ScanType" ->
          r_scan_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "ScanType" (fun i _ -> scan_type_of_xml i) ())
      | "PercentageCompleted" ->
          r_percentage_completed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageCompleted"
                 (fun i _ -> percentage_completed_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> resource_scan_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> resource_scan_status_of_xml i)
                 ())
      | "ResourceScanId" ->
          r_resource_scan_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanId"
                 (fun i _ -> resource_scan_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scan_type = ( ! ) r_scan_type;
     percentage_completed = ( ! ) r_percentage_completed;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     status_reason = ( ! ) r_status_reason;
     status = ( ! ) r_status;
     resource_scan_id = ( ! ) r_resource_scan_id;
   }
    : resource_scan_summary)

let resource_scan_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_scan_summary_of_xml i) ()

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

let resource_model_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_mappings_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_mapping_of_xml i) ()

let resource_identifiers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> resource_identifier_property_key_of_xml i)
    ()

let logical_resource_ids_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> logical_resource_id_of_xml i) ()

let resource_identifier_summary_of_xml i =
  let r_resource_identifiers = ref None in
  let r_logical_resource_ids = ref None in
  let r_resource_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceIdentifiers"; "LogicalResourceIds"; "ResourceType" ] (fun tag _ ->
      match tag with
      | "ResourceIdentifiers" ->
          r_resource_identifiers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifiers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_identifier_property_key_of_xml i)
                     ())
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
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_identifiers = ( ! ) r_resource_identifiers;
     logical_resource_ids = ( ! ) r_logical_resource_ids;
     resource_type = ( ! ) r_resource_type;
   }
    : resource_identifier_summary)

let resource_identifier_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_identifier_summary_of_xml i) ()

let resource_identifier_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let drift_ignored_reason_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "WRITE_ONLY_PROPERTY" -> WRITE_ONLY_PROPERTY
   | "MANAGED_BY_AWS" -> MANAGED_BY_AWS
   | _ -> failwith "unknown enum value"
    : drift_ignored_reason)

let resource_drift_ignored_attribute_of_xml i =
  let r_reason = ref None in
  let r_path = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Reason"; "Path" ] (fun tag _ ->
      match tag with
      | "Reason" ->
          r_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Reason"
                 (fun i _ -> drift_ignored_reason_of_xml i)
                 ())
      | "Path" ->
          r_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Path"
                 (fun i _ -> resource_property_path_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ reason = ( ! ) r_reason; path = ( ! ) r_path } : resource_drift_ignored_attribute)

let resource_drift_ignored_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> resource_drift_ignored_attribute_of_xml i)
    ()

let generated_template_resource_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "COMPLETE" -> COMPLETE
   | "FAILED" -> FAILED
   | "IN_PROGRESS" -> IN_PROGRESS
   | "PENDING" -> PENDING
   | _ -> failwith "unknown enum value"
    : generated_template_resource_status)

let resource_detail_of_xml i =
  let r_warnings = ref None in
  let r_resource_status_reason = ref None in
  let r_resource_status = ref None in
  let r_resource_identifier = ref None in
  let r_logical_resource_id = ref None in
  let r_resource_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Warnings";
      "ResourceStatusReason";
      "ResourceStatus";
      "ResourceIdentifier";
      "LogicalResourceId";
      "ResourceType";
    ] (fun tag _ ->
      match tag with
      | "Warnings" ->
          r_warnings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Warnings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> warning_detail_of_xml i)
                     ())
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> generated_template_resource_status_of_xml i)
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
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     warnings = ( ! ) r_warnings;
     resource_status_reason = ( ! ) r_resource_status_reason;
     resource_status = ( ! ) r_resource_status;
     resource_identifier = ( ! ) r_resource_identifier;
     logical_resource_id = ( ! ) r_logical_resource_id;
     resource_type = ( ! ) r_resource_type;
   }
    : resource_detail)

let resource_details_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_detail_of_xml i) ()

let evaluation_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Dynamic" -> Dynamic | "Static" -> Static | _ -> failwith "unknown enum value"
    : evaluation_type)

let change_source_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "NoModification" -> NoModification
   | "Automatic" -> Automatic
   | "DirectModification" -> DirectModification
   | "ResourceAttribute" -> ResourceAttribute
   | "ParameterReference" -> ParameterReference
   | "ResourceReference" -> ResourceReference
   | _ -> failwith "unknown enum value"
    : change_source)

let causing_entity_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_change_detail_of_xml i =
  let r_causing_entity = ref None in
  let r_change_source = ref None in
  let r_evaluation = ref None in
  let r_target = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CausingEntity"; "ChangeSource"; "Evaluation"; "Target" ] (fun tag _ ->
      match tag with
      | "CausingEntity" ->
          r_causing_entity :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CausingEntity"
                 (fun i _ -> causing_entity_of_xml i)
                 ())
      | "ChangeSource" ->
          r_change_source :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSource"
                 (fun i _ -> change_source_of_xml i)
                 ())
      | "Evaluation" ->
          r_evaluation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Evaluation"
                 (fun i _ -> evaluation_type_of_xml i)
                 ())
      | "Target" ->
          r_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Target"
                 (fun i _ -> resource_target_definition_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     causing_entity = ( ! ) r_causing_entity;
     change_source = ( ! ) r_change_source;
     evaluation = ( ! ) r_evaluation;
     target = ( ! ) r_target;
   }
    : resource_change_detail)

let resource_change_details_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> resource_change_detail_of_xml i) ()

let policy_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "ReplaceAndSnapshot" -> ReplaceAndSnapshot
   | "ReplaceAndRetain" -> ReplaceAndRetain
   | "ReplaceAndDelete" -> ReplaceAndDelete
   | "Snapshot" -> Snapshot
   | "Retain" -> Retain
   | "Delete" -> Delete
   | _ -> failwith "unknown enum value"
    : policy_action)

let change_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SyncWithActual" -> SyncWithActual
   | "Dynamic" -> Dynamic
   | "Import" -> Import
   | "Remove" -> Remove
   | "Modify" -> Modify
   | "Add" -> Add
   | _ -> failwith "unknown enum value"
    : change_action)

let replacement_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Conditional" -> Conditional
   | "False" -> False
   | "True" -> True
   | _ -> failwith "unknown enum value"
    : replacement)

let before_context_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let after_context_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let previous_deployment_context_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let resource_change_of_xml i =
  let r_previous_deployment_context = ref None in
  let r_after_context = ref None in
  let r_before_context = ref None in
  let r_module_info = ref None in
  let r_change_set_id = ref None in
  let r_details = ref None in
  let r_resource_drift_ignored_attributes = ref None in
  let r_resource_drift_status = ref None in
  let r_scope = ref None in
  let r_replacement = ref None in
  let r_resource_type = ref None in
  let r_physical_resource_id = ref None in
  let r_logical_resource_id = ref None in
  let r_action = ref None in
  let r_policy_action = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "PreviousDeploymentContext";
      "AfterContext";
      "BeforeContext";
      "ModuleInfo";
      "ChangeSetId";
      "Details";
      "ResourceDriftIgnoredAttributes";
      "ResourceDriftStatus";
      "Scope";
      "Replacement";
      "ResourceType";
      "PhysicalResourceId";
      "LogicalResourceId";
      "Action";
      "PolicyAction";
    ] (fun tag _ ->
      match tag with
      | "PreviousDeploymentContext" ->
          r_previous_deployment_context :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PreviousDeploymentContext"
                 (fun i _ -> previous_deployment_context_of_xml i)
                 ())
      | "AfterContext" ->
          r_after_context :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AfterContext"
                 (fun i _ -> after_context_of_xml i)
                 ())
      | "BeforeContext" ->
          r_before_context :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BeforeContext"
                 (fun i _ -> before_context_of_xml i)
                 ())
      | "ModuleInfo" ->
          r_module_info :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ModuleInfo"
                 (fun i _ -> module_info_of_xml i)
                 ())
      | "ChangeSetId" ->
          r_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
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
      | "ResourceDriftIgnoredAttributes" ->
          r_resource_drift_ignored_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceDriftIgnoredAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_drift_ignored_attribute_of_xml i)
                     ())
                 ())
      | "ResourceDriftStatus" ->
          r_resource_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceDriftStatus"
                 (fun i _ -> stack_resource_drift_status_of_xml i)
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
      | "Replacement" ->
          r_replacement :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Replacement"
                 (fun i _ -> replacement_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "Action" ->
          r_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Action" (fun i _ -> change_action_of_xml i) ())
      | "PolicyAction" ->
          r_policy_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyAction"
                 (fun i _ -> policy_action_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     previous_deployment_context = ( ! ) r_previous_deployment_context;
     after_context = ( ! ) r_after_context;
     before_context = ( ! ) r_before_context;
     module_info = ( ! ) r_module_info;
     change_set_id = ( ! ) r_change_set_id;
     details = ( ! ) r_details;
     resource_drift_ignored_attributes = ( ! ) r_resource_drift_ignored_attributes;
     resource_drift_status = ( ! ) r_resource_drift_status;
     scope = ( ! ) r_scope;
     replacement = ( ! ) r_replacement;
     resource_type = ( ! ) r_resource_type;
     physical_resource_id = ( ! ) r_physical_resource_id;
     logical_resource_id = ( ! ) r_logical_resource_id;
     action = ( ! ) r_action;
     policy_action = ( ! ) r_policy_action;
   }
    : resource_change)

let required_activated_type_of_xml i =
  let r_supported_major_versions = ref None in
  let r_publisher_id = ref None in
  let r_original_type_name = ref None in
  let r_type_name_alias = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SupportedMajorVersions"; "PublisherId"; "OriginalTypeName"; "TypeNameAlias" ] (fun tag _ ->
      match tag with
      | "SupportedMajorVersions" ->
          r_supported_major_versions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SupportedMajorVersions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> supported_major_version_of_xml i)
                     ())
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
      | "TypeNameAlias" ->
          r_type_name_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeNameAlias"
                 (fun i _ -> type_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     supported_major_versions = ( ! ) r_supported_major_versions;
     publisher_id = ( ! ) r_publisher_id;
     original_type_name = ( ! ) r_original_type_name;
     type_name_alias = ( ! ) r_type_name_alias;
   }
    : required_activated_type)

let required_activated_types_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> required_activated_type_of_xml i) ()

let request_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let remediation_message_status_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let remediation_message_remediation_message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let related_resources_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> scanned_resource_of_xml i) ()

let registration_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let registration_token_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> registration_token_of_xml i) ()

let registration_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "FAILED" -> FAILED
   | "IN_PROGRESS" -> IN_PROGRESS
   | "COMPLETE" -> COMPLETE
   | _ -> failwith "unknown enum value"
    : registration_status)

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

let log_group_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let logging_config_of_xml i =
  let r_log_group_name = ref None in
  let r_log_role_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LogGroupName"; "LogRoleArn" ] (fun tag _ ->
      match tag with
      | "LogGroupName" ->
          r_log_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogGroupName"
                 (fun i _ -> log_group_name_of_xml i)
                 ())
      | "LogRoleArn" ->
          r_log_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogRoleArn" (fun i _ -> role_ar_n2_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     log_group_name = Smaws_Lib.Xml.Parse.required "LogGroupName" (( ! ) r_log_group_name) i;
     log_role_arn = Smaws_Lib.Xml.Parse.required "LogRoleArn" (( ! ) r_log_role_arn) i;
   }
    : logging_config)

let register_type_input_of_xml i =
  let r_client_request_token = ref None in
  let r_execution_role_arn = ref None in
  let r_logging_config = ref None in
  let r_schema_handler_package = ref None in
  let r_type_name = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClientRequestToken";
      "ExecutionRoleArn";
      "LoggingConfig";
      "SchemaHandlerPackage";
      "TypeName";
      "Type";
    ] (fun tag _ ->
      match tag with
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> request_token_of_xml i)
                 ())
      | "ExecutionRoleArn" ->
          r_execution_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleArn"
                 (fun i _ -> role_ar_n2_of_xml i)
                 ())
      | "LoggingConfig" ->
          r_logging_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoggingConfig"
                 (fun i _ -> logging_config_of_xml i)
                 ())
      | "SchemaHandlerPackage" ->
          r_schema_handler_package :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SchemaHandlerPackage"
                 (fun i _ -> s3_url_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     client_request_token = ( ! ) r_client_request_token;
     execution_role_arn = ( ! ) r_execution_role_arn;
     logging_config = ( ! ) r_logging_config;
     schema_handler_package =
       Smaws_Lib.Xml.Parse.required "SchemaHandlerPackage" (( ! ) r_schema_handler_package) i;
     type_name = Smaws_Lib.Xml.Parse.required "TypeName" (( ! ) r_type_name) i;
     type_ = ( ! ) r_type_;
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

let accept_terms_and_conditions_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let connection_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let register_publisher_input_of_xml i =
  let r_connection_arn = ref None in
  let r_accept_terms_and_conditions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ConnectionArn"; "AcceptTermsAndConditions" ]
    (fun tag _ ->
      match tag with
      | "ConnectionArn" ->
          r_connection_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConnectionArn"
                 (fun i _ -> connection_arn_of_xml i)
                 ())
      | "AcceptTermsAndConditions" ->
          r_accept_terms_and_conditions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AcceptTermsAndConditions"
                 (fun i _ -> accept_terms_and_conditions_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     connection_arn = ( ! ) r_connection_arn;
     accept_terms_and_conditions = ( ! ) r_accept_terms_and_conditions;
   }
    : register_publisher_input)

let record_handler_progress_output_of_xml i = ()
let client_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let operation_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "FAILED" -> FAILED
   | "SUCCESS" -> SUCCESS
   | "IN_PROGRESS" -> IN_PROGRESS
   | "PENDING" -> PENDING
   | _ -> failwith "unknown enum value"
    : operation_status)

let handler_error_code_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "UnsupportedTarget" -> UnsupportedTarget
   | "Unknown" -> Unknown
   | "NonCompliant" -> NonCompliant
   | "HandlerInternalFailure" -> HandlerInternalFailure
   | "InvalidTypeConfiguration" -> InvalidTypeConfiguration
   | "InternalFailure" -> InternalFailure
   | "NetworkFailure" -> NetworkFailure
   | "ServiceInternalError" -> ServiceInternalError
   | "GeneralServiceException" -> GeneralServiceException
   | "NotStabilized" -> ServiceTimeout
   | "ServiceLimitExceeded" -> ServiceLimitExceeded
   | "Throttling" -> Throttling
   | "ResourceConflict" -> ResourceConflict
   | "NotFound" -> NotFound
   | "AlreadyExists" -> AlreadyExists
   | "InvalidCredentials" -> InvalidCredentials
   | "AccessDenied" -> AccessDenied
   | "InvalidRequest" -> InvalidRequest
   | "NotUpdatable" -> NotUpdatable
   | _ -> failwith "unknown enum value"
    : handler_error_code)

let record_handler_progress_input_of_xml i =
  let r_client_request_token = ref None in
  let r_resource_model = ref None in
  let r_error_code = ref None in
  let r_status_message = ref None in
  let r_current_operation_status = ref None in
  let r_operation_status = ref None in
  let r_bearer_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ClientRequestToken";
      "ResourceModel";
      "ErrorCode";
      "StatusMessage";
      "CurrentOperationStatus";
      "OperationStatus";
      "BearerToken";
    ] (fun tag _ ->
      match tag with
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "ResourceModel" ->
          r_resource_model :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceModel"
                 (fun i _ -> resource_model_of_xml i)
                 ())
      | "ErrorCode" ->
          r_error_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorCode"
                 (fun i _ -> handler_error_code_of_xml i)
                 ())
      | "StatusMessage" ->
          r_status_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusMessage"
                 (fun i _ -> status_message_of_xml i)
                 ())
      | "CurrentOperationStatus" ->
          r_current_operation_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CurrentOperationStatus"
                 (fun i _ -> operation_status_of_xml i)
                 ())
      | "OperationStatus" ->
          r_operation_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationStatus"
                 (fun i _ -> operation_status_of_xml i)
                 ())
      | "BearerToken" ->
          r_bearer_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BearerToken"
                 (fun i _ -> client_token_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     client_request_token = ( ! ) r_client_request_token;
     resource_model = ( ! ) r_resource_model;
     error_code = ( ! ) r_error_code;
     status_message = ( ! ) r_status_message;
     current_operation_status = ( ! ) r_current_operation_status;
     operation_status = Smaws_Lib.Xml.Parse.required "OperationStatus" (( ! ) r_operation_status) i;
     bearer_token = Smaws_Lib.Xml.Parse.required "BearerToken" (( ! ) r_bearer_token) i;
   }
    : record_handler_progress_input)

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

let publisher_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "UNVERIFIED" -> UNVERIFIED
   | "VERIFIED" -> VERIFIED
   | _ -> failwith "unknown enum value"
    : publisher_status)

let publisher_profile_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let publish_type_input_of_xml i =
  let r_public_version_number = ref None in
  let r_type_name = ref None in
  let r_arn = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PublicVersionNumber"; "TypeName"; "Arn"; "Type" ]
    (fun tag _ ->
      match tag with
      | "PublicVersionNumber" ->
          r_public_version_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicVersionNumber"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> private_type_arn_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     public_version_number = ( ! ) r_public_version_number;
     type_name = ( ! ) r_type_name;
     arn = ( ! ) r_arn;
     type_ = ( ! ) r_type_;
   }
    : publish_type_input)

let provisioning_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "FULLY_MUTABLE" -> FULLY_MUTABLE
   | "IMMUTABLE" -> IMMUTABLE
   | "NON_PROVISIONABLE" -> NON_PROVISIONABLE
   | _ -> failwith "unknown enum value"
    : provisioning_type)

let parameter_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let allowed_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let allowed_values_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> allowed_value_of_xml i) ()

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

let parameter_declaration_of_xml i =
  let r_parameter_constraints = ref None in
  let r_description = ref None in
  let r_no_echo = ref None in
  let r_parameter_type = ref None in
  let r_default_value = ref None in
  let r_parameter_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ParameterConstraints";
      "Description";
      "NoEcho";
      "ParameterType";
      "DefaultValue";
      "ParameterKey";
    ] (fun tag _ ->
      match tag with
      | "ParameterConstraints" ->
          r_parameter_constraints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterConstraints"
                 (fun i _ -> parameter_constraints_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "NoEcho" ->
          r_no_echo :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NoEcho" (fun i _ -> no_echo_of_xml i) ())
      | "ParameterType" ->
          r_parameter_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterType"
                 (fun i _ -> parameter_type_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> parameter_value_of_xml i)
                 ())
      | "ParameterKey" ->
          r_parameter_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterKey"
                 (fun i _ -> parameter_key_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameter_constraints = ( ! ) r_parameter_constraints;
     description = ( ! ) r_description;
     no_echo = ( ! ) r_no_echo;
     parameter_type = ( ! ) r_parameter_type;
     default_value = ( ! ) r_default_value;
     parameter_key = ( ! ) r_parameter_key;
   }
    : parameter_declaration)

let parameter_declarations_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_declaration_of_xml i) ()

let organization_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DISABLED_PERMANENTLY" -> DISABLED_PERMANENTLY
   | "DISABLED" -> DISABLED
   | "ENABLED" -> ENABLED
   | _ -> failwith "unknown enum value"
    : organization_status)

let optional_secure_url_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let operation_result_filter_name_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "OPERATION_RESULT_STATUS" -> OPERATION_RESULT_STATUS
   | _ -> failwith "unknown enum value"
    : operation_result_filter_name)

let operation_result_filter_values_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let operation_result_filter_of_xml i =
  let r_values = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Values"; "Name" ] (fun tag _ ->
      match tag with
      | "Values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Values"
                 (fun i _ -> operation_result_filter_values_of_xml i)
                 ())
      | "Name" ->
          r_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Name"
                 (fun i _ -> operation_result_filter_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ values = ( ! ) r_values; name = ( ! ) r_name } : operation_result_filter)

let operation_result_filters_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> operation_result_filter_of_xml i) ()

let beacon_stack_operation_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "FAILED" -> FAILED
   | "SUCCEEDED" -> SUCCEEDED
   | "IN_PROGRESS" -> IN_PROGRESS
   | _ -> failwith "unknown enum value"
    : beacon_stack_operation_status)

let event_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "HOOK_INVOCATION_ERROR" -> HOOK_INVOCATION_ERROR
   | "PROVISIONING_ERROR" -> PROVISIONING_ERROR
   | "VALIDATION_ERROR" -> VALIDATION_ERROR
   | "PROGRESS_EVENT" -> PROGRESS_EVENT
   | "STACK_EVENT" -> STACK_EVENT
   | _ -> failwith "unknown enum value"
    : event_type)

let operation_event_of_xml i =
  let r_validation_path = ref None in
  let r_validation_status_reason = ref None in
  let r_validation_status = ref None in
  let r_validation_name = ref None in
  let r_validation_failure_mode = ref None in
  let r_detailed_status = ref None in
  let r_hook_failure_mode = ref None in
  let r_hook_invocation_point = ref None in
  let r_hook_status_reason = ref None in
  let r_hook_status = ref None in
  let r_hook_type = ref None in
  let r_client_request_token = ref None in
  let r_resource_properties = ref None in
  let r_resource_status_reason = ref None in
  let r_resource_status = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_timestamp = ref None in
  let r_resource_type = ref None in
  let r_physical_resource_id = ref None in
  let r_logical_resource_id = ref None in
  let r_event_type = ref None in
  let r_operation_status = ref None in
  let r_operation_type = ref None in
  let r_operation_id = ref None in
  let r_stack_id = ref None in
  let r_event_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ValidationPath";
      "ValidationStatusReason";
      "ValidationStatus";
      "ValidationName";
      "ValidationFailureMode";
      "DetailedStatus";
      "HookFailureMode";
      "HookInvocationPoint";
      "HookStatusReason";
      "HookStatus";
      "HookType";
      "ClientRequestToken";
      "ResourceProperties";
      "ResourceStatusReason";
      "ResourceStatus";
      "EndTime";
      "StartTime";
      "Timestamp";
      "ResourceType";
      "PhysicalResourceId";
      "LogicalResourceId";
      "EventType";
      "OperationStatus";
      "OperationType";
      "OperationId";
      "StackId";
      "EventId";
    ] (fun tag _ ->
      match tag with
      | "ValidationPath" ->
          r_validation_path :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidationPath"
                 (fun i _ -> validation_path_of_xml i)
                 ())
      | "ValidationStatusReason" ->
          r_validation_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidationStatusReason"
                 (fun i _ -> validation_status_reason_of_xml i)
                 ())
      | "ValidationStatus" ->
          r_validation_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidationStatus"
                 (fun i _ -> validation_status_of_xml i)
                 ())
      | "ValidationName" ->
          r_validation_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidationName"
                 (fun i _ -> validation_name_of_xml i)
                 ())
      | "ValidationFailureMode" ->
          r_validation_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ValidationFailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "DetailedStatus" ->
          r_detailed_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetailedStatus"
                 (fun i _ -> detailed_status_of_xml i)
                 ())
      | "HookFailureMode" ->
          r_hook_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookFailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "HookInvocationPoint" ->
          r_hook_invocation_point :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookInvocationPoint"
                 (fun i _ -> hook_invocation_point_of_xml i)
                 ())
      | "HookStatusReason" ->
          r_hook_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatusReason"
                 (fun i _ -> hook_status_reason_of_xml i)
                 ())
      | "HookStatus" ->
          r_hook_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatus"
                 (fun i _ -> hook_status_of_xml i)
                 ())
      | "HookType" ->
          r_hook_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "HookType" (fun i _ -> hook_type_of_xml i) ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "ResourceProperties" ->
          r_resource_properties :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceProperties"
                 (fun i _ -> resource_properties_of_xml i)
                 ())
      | "ResourceStatusReason" ->
          r_resource_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatusReason"
                 (fun i _ -> resource_status_reason_of_xml i)
                 ())
      | "ResourceStatus" ->
          r_resource_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceStatus"
                 (fun i _ -> resource_status_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> resource_type_of_xml i)
                 ())
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "EventType" ->
          r_event_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EventType" (fun i _ -> event_type_of_xml i) ())
      | "OperationStatus" ->
          r_operation_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationStatus"
                 (fun i _ -> beacon_stack_operation_status_of_xml i)
                 ())
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
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "EventId" ->
          r_event_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EventId" (fun i _ -> event_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     validation_path = ( ! ) r_validation_path;
     validation_status_reason = ( ! ) r_validation_status_reason;
     validation_status = ( ! ) r_validation_status;
     validation_name = ( ! ) r_validation_name;
     validation_failure_mode = ( ! ) r_validation_failure_mode;
     detailed_status = ( ! ) r_detailed_status;
     hook_failure_mode = ( ! ) r_hook_failure_mode;
     hook_invocation_point = ( ! ) r_hook_invocation_point;
     hook_status_reason = ( ! ) r_hook_status_reason;
     hook_status = ( ! ) r_hook_status;
     hook_type = ( ! ) r_hook_type;
     client_request_token = ( ! ) r_client_request_token;
     resource_properties = ( ! ) r_resource_properties;
     resource_status_reason = ( ! ) r_resource_status_reason;
     resource_status = ( ! ) r_resource_status;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     timestamp = ( ! ) r_timestamp;
     resource_type = ( ! ) r_resource_type;
     physical_resource_id = ( ! ) r_physical_resource_id;
     logical_resource_id = ( ! ) r_logical_resource_id;
     event_type = ( ! ) r_event_type;
     operation_status = ( ! ) r_operation_status;
     operation_type = ( ! ) r_operation_type;
     operation_id = ( ! ) r_operation_id;
     stack_id = ( ! ) r_stack_id;
     event_id = ( ! ) r_event_id;
   }
    : operation_event)

let operation_events_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> operation_event_of_xml i) ()

let on_stack_failure_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DELETE" -> DELETE
   | "ROLLBACK" -> ROLLBACK
   | "DO_NOTHING" -> DO_NOTHING
   | _ -> failwith "unknown enum value"
    : on_stack_failure)

let on_failure_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "DELETE" -> DELETE
   | "ROLLBACK" -> ROLLBACK
   | "DO_NOTHING" -> DO_NOTHING
   | _ -> failwith "unknown enum value"
    : on_failure)

let next_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let major_version_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_types_output_of_xml i =
  let r_next_token = ref None in
  let r_type_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "TypeSummaries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "TypeSummaries" ->
          r_type_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> type_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; type_summaries = ( ! ) r_type_summaries } : list_types_output)

let deprecated_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "DEPRECATED" -> DEPRECATED | "LIVE" -> LIVE | _ -> failwith "unknown enum value"
    : deprecated_status)

let list_types_input_of_xml i =
  let r_next_token = ref None in
  let r_max_results = ref None in
  let r_filters = ref None in
  let r_type_ = ref None in
  let r_deprecated_status = ref None in
  let r_provisioning_type = ref None in
  let r_visibility = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "NextToken";
      "MaxResults";
      "Filters";
      "Type";
      "DeprecatedStatus";
      "ProvisioningType";
      "Visibility";
    ] (fun tag _ ->
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
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters" (fun i _ -> type_filters_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "DeprecatedStatus" ->
          r_deprecated_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeprecatedStatus"
                 (fun i _ -> deprecated_status_of_xml i)
                 ())
      | "ProvisioningType" ->
          r_provisioning_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProvisioningType"
                 (fun i _ -> provisioning_type_of_xml i)
                 ())
      | "Visibility" ->
          r_visibility :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Visibility" (fun i _ -> visibility_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
     filters = ( ! ) r_filters;
     type_ = ( ! ) r_type_;
     deprecated_status = ( ! ) r_deprecated_status;
     provisioning_type = ( ! ) r_provisioning_type;
     visibility = ( ! ) r_visibility;
   }
    : list_types_input)

let list_type_versions_output_of_xml i =
  let r_next_token = ref None in
  let r_type_version_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "TypeVersionSummaries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "TypeVersionSummaries" ->
          r_type_version_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeVersionSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> type_version_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; type_version_summaries = ( ! ) r_type_version_summaries }
    : list_type_versions_output)

let list_type_versions_input_of_xml i =
  let r_publisher_id = ref None in
  let r_deprecated_status = ref None in
  let r_next_token = ref None in
  let r_max_results = ref None in
  let r_arn = ref None in
  let r_type_name = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PublisherId"; "DeprecatedStatus"; "NextToken"; "MaxResults"; "Arn"; "TypeName"; "Type" ]
    (fun tag _ ->
      match tag with
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | "DeprecatedStatus" ->
          r_deprecated_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeprecatedStatus"
                 (fun i _ -> deprecated_status_of_xml i)
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
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> type_arn_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     publisher_id = ( ! ) r_publisher_id;
     deprecated_status = ( ! ) r_deprecated_status;
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
     arn = ( ! ) r_arn;
     type_name = ( ! ) r_type_name;
     type_ = ( ! ) r_type_;
   }
    : list_type_versions_input)

let list_type_registrations_output_of_xml i =
  let r_next_token = ref None in
  let r_registration_token_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "RegistrationTokenList" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "RegistrationTokenList" ->
          r_registration_token_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegistrationTokenList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> registration_token_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; registration_token_list = ( ! ) r_registration_token_list }
    : list_type_registrations_output)

let list_type_registrations_input_of_xml i =
  let r_next_token = ref None in
  let r_max_results = ref None in
  let r_registration_status_filter = ref None in
  let r_type_arn = ref None in
  let r_type_name = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NextToken"; "MaxResults"; "RegistrationStatusFilter"; "TypeArn"; "TypeName"; "Type" ]
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
      | "RegistrationStatusFilter" ->
          r_registration_status_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RegistrationStatusFilter"
                 (fun i _ -> registration_status_of_xml i)
                 ())
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     max_results = ( ! ) r_max_results;
     registration_status_filter = ( ! ) r_registration_status_filter;
     type_arn = ( ! ) r_type_arn;
     type_name = ( ! ) r_type_name;
     type_ = ( ! ) r_type_;
   }
    : list_type_registrations_input)

let list_stacks_output_of_xml i =
  let r_next_token = ref None in
  let r_stack_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "StackSummaries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackSummaries" ->
          r_stack_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; stack_summaries = ( ! ) r_stack_summaries }
    : list_stacks_output)

let list_stacks_input_of_xml i =
  let r_stack_status_filter = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackStatusFilter"; "NextToken" ] (fun tag _ ->
      match tag with
      | "StackStatusFilter" ->
          r_stack_status_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackStatusFilter"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_status_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_status_filter = ( ! ) r_stack_status_filter; next_token = ( ! ) r_next_token }
    : list_stacks_input)

let list_stack_sets_output_of_xml i =
  let r_next_token = ref None in
  let r_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Summaries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_set_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; summaries = ( ! ) r_summaries } : list_stack_sets_output)

let list_stack_sets_input_of_xml i =
  let r_call_as = ref None in
  let r_status = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CallAs"; "Status"; "MaxResults"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_set_status_of_xml i)
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
     call_as = ( ! ) r_call_as;
     status = ( ! ) r_status;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
   }
    : list_stack_sets_input)

let list_stack_set_operations_output_of_xml i =
  let r_next_token = ref None in
  let r_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Summaries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_set_operation_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; summaries = ( ! ) r_summaries }
    : list_stack_set_operations_output)

let list_stack_set_operations_input_of_xml i =
  let r_call_as = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CallAs"; "MaxResults"; "NextToken"; "StackSetName" ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
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
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : list_stack_set_operations_input)

let list_stack_set_operation_results_output_of_xml i =
  let r_next_token = ref None in
  let r_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Summaries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_set_operation_result_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; summaries = ( ! ) r_summaries }
    : list_stack_set_operation_results_output)

let list_stack_set_operation_results_input_of_xml i =
  let r_filters = ref None in
  let r_call_as = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_operation_id = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Filters"; "CallAs"; "MaxResults"; "NextToken"; "OperationId"; "StackSetName" ] (fun tag _ ->
      match tag with
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> operation_result_filter_of_xml i)
                     ())
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
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
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     filters = ( ! ) r_filters;
     call_as = ( ! ) r_call_as;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     operation_id = Smaws_Lib.Xml.Parse.required "OperationId" (( ! ) r_operation_id) i;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : list_stack_set_operation_results_input)

let list_stack_set_auto_deployment_targets_output_of_xml i =
  let r_next_token = ref None in
  let r_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Summaries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_set_auto_deployment_target_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; summaries = ( ! ) r_summaries }
    : list_stack_set_auto_deployment_targets_output)

let list_stack_set_auto_deployment_targets_input_of_xml i =
  let r_call_as = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CallAs"; "MaxResults"; "NextToken"; "StackSetName" ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
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
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : list_stack_set_auto_deployment_targets_input)

let list_stack_resources_output_of_xml i =
  let r_next_token = ref None in
  let r_stack_resource_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "StackResourceSummaries" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackResourceSummaries" ->
          r_stack_resource_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_resource_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; stack_resource_summaries = ( ! ) r_stack_resource_summaries }
    : list_stack_resources_output)

let list_stack_resources_input_of_xml i =
  let r_next_token = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "StackName" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : list_stack_resources_input)

let list_stack_refactors_output_of_xml i =
  let r_next_token = ref None in
  let r_stack_refactor_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "StackRefactorSummaries" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackRefactorSummaries" ->
          r_stack_refactor_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackRefactorSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_refactor_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     stack_refactor_summaries =
       Smaws_Lib.Xml.Parse.required "StackRefactorSummaries" (( ! ) r_stack_refactor_summaries) i;
   }
    : list_stack_refactors_output)

let list_stack_refactors_input_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_execution_status_filter = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxResults"; "NextToken"; "ExecutionStatusFilter" ] (fun tag _ ->
      match tag with
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
      | "ExecutionStatusFilter" ->
          r_execution_status_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatusFilter"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_refactor_execution_status_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     execution_status_filter = ( ! ) r_execution_status_filter;
   }
    : list_stack_refactors_input)

let list_stack_refactor_actions_output_of_xml i =
  let r_next_token = ref None in
  let r_stack_refactor_actions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "StackRefactorActions" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackRefactorActions" ->
          r_stack_refactor_actions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackRefactorActions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_refactor_action_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     stack_refactor_actions =
       Smaws_Lib.Xml.Parse.required "StackRefactorActions" (( ! ) r_stack_refactor_actions) i;
   }
    : list_stack_refactor_actions_output)

let list_stack_refactor_actions_input_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_stack_refactor_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxResults"; "NextToken"; "StackRefactorId" ]
    (fun tag _ ->
      match tag with
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
      | "StackRefactorId" ->
          r_stack_refactor_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackRefactorId"
                 (fun i _ -> stack_refactor_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     stack_refactor_id =
       Smaws_Lib.Xml.Parse.required "StackRefactorId" (( ! ) r_stack_refactor_id) i;
   }
    : list_stack_refactor_actions_input)

let list_stack_instances_output_of_xml i =
  let r_next_token = ref None in
  let r_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Summaries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_instance_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; summaries = ( ! ) r_summaries } : list_stack_instances_output)

let list_stack_instances_input_of_xml i =
  let r_call_as = ref None in
  let r_stack_instance_region = ref None in
  let r_stack_instance_account = ref None in
  let r_filters = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CallAs";
      "StackInstanceRegion";
      "StackInstanceAccount";
      "Filters";
      "MaxResults";
      "NextToken";
      "StackSetName";
    ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "StackInstanceRegion" ->
          r_stack_instance_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceRegion"
                 (fun i _ -> region_of_xml i)
                 ())
      | "StackInstanceAccount" ->
          r_stack_instance_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceAccount"
                 (fun i _ -> account_of_xml i)
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
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     stack_instance_region = ( ! ) r_stack_instance_region;
     stack_instance_account = ( ! ) r_stack_instance_account;
     filters = ( ! ) r_filters;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : list_stack_instances_input)

let list_stack_instance_resource_drifts_output_of_xml i =
  let r_next_token = ref None in
  let r_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Summaries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_instance_resource_drifts_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; summaries = ( ! ) r_summaries }
    : list_stack_instance_resource_drifts_output)

let list_stack_instance_resource_drifts_input_of_xml i =
  let r_call_as = ref None in
  let r_operation_id = ref None in
  let r_stack_instance_region = ref None in
  let r_stack_instance_account = ref None in
  let r_stack_instance_resource_drift_statuses = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CallAs";
      "OperationId";
      "StackInstanceRegion";
      "StackInstanceAccount";
      "StackInstanceResourceDriftStatuses";
      "MaxResults";
      "NextToken";
      "StackSetName";
    ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "StackInstanceRegion" ->
          r_stack_instance_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceRegion"
                 (fun i _ -> region_of_xml i)
                 ())
      | "StackInstanceAccount" ->
          r_stack_instance_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceAccount"
                 (fun i _ -> account_of_xml i)
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
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     operation_id = Smaws_Lib.Xml.Parse.required "OperationId" (( ! ) r_operation_id) i;
     stack_instance_region =
       Smaws_Lib.Xml.Parse.required "StackInstanceRegion" (( ! ) r_stack_instance_region) i;
     stack_instance_account =
       Smaws_Lib.Xml.Parse.required "StackInstanceAccount" (( ! ) r_stack_instance_account) i;
     stack_instance_resource_drift_statuses = ( ! ) r_stack_instance_resource_drift_statuses;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : list_stack_instance_resource_drifts_input)

let list_resource_scans_output_of_xml i =
  let r_next_token = ref None in
  let r_resource_scan_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "ResourceScanSummaries" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "ResourceScanSummaries" ->
          r_resource_scan_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_scan_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; resource_scan_summaries = ( ! ) r_resource_scan_summaries }
    : list_resource_scans_output)

let list_resource_scans_input_of_xml i =
  let r_scan_type_filter = ref None in
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ScanTypeFilter"; "MaxResults"; "NextToken" ]
    (fun tag _ ->
      match tag with
      | "ScanTypeFilter" ->
          r_scan_type_filter :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScanTypeFilter"
                 (fun i _ -> scan_type_of_xml i)
                 ())
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> resource_scanner_max_results_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scan_type_filter = ( ! ) r_scan_type_filter;
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
   }
    : list_resource_scans_input)

let list_resource_scan_resources_output_of_xml i =
  let r_next_token = ref None in
  let r_resources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Resources" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scanned_resource_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; resources = ( ! ) r_resources }
    : list_resource_scan_resources_output)

let list_resource_scan_resources_input_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_tag_value = ref None in
  let r_tag_key = ref None in
  let r_resource_type_prefix = ref None in
  let r_resource_identifier = ref None in
  let r_resource_scan_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MaxResults";
      "NextToken";
      "TagValue";
      "TagKey";
      "ResourceTypePrefix";
      "ResourceIdentifier";
      "ResourceScanId";
    ] (fun tag _ ->
      match tag with
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> resource_scanner_max_results_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "TagValue" ->
          r_tag_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TagValue" (fun i _ -> tag_value_of_xml i) ())
      | "TagKey" ->
          r_tag_key :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TagKey" (fun i _ -> tag_key_of_xml i) ())
      | "ResourceTypePrefix" ->
          r_resource_type_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTypePrefix"
                 (fun i _ -> resource_type_prefix_of_xml i)
                 ())
      | "ResourceIdentifier" ->
          r_resource_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifier"
                 (fun i _ -> resource_identifier_of_xml i)
                 ())
      | "ResourceScanId" ->
          r_resource_scan_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanId"
                 (fun i _ -> resource_scan_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     tag_value = ( ! ) r_tag_value;
     tag_key = ( ! ) r_tag_key;
     resource_type_prefix = ( ! ) r_resource_type_prefix;
     resource_identifier = ( ! ) r_resource_identifier;
     resource_scan_id = Smaws_Lib.Xml.Parse.required "ResourceScanId" (( ! ) r_resource_scan_id) i;
   }
    : list_resource_scan_resources_input)

let list_resource_scan_related_resources_output_of_xml i =
  let r_next_token = ref None in
  let r_related_resources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "RelatedResources" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "RelatedResources" ->
          r_related_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RelatedResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scanned_resource_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; related_resources = ( ! ) r_related_resources }
    : list_resource_scan_related_resources_output)

let boxed_max_results_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_resource_scan_related_resources_input_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_resources = ref None in
  let r_resource_scan_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxResults"; "NextToken"; "Resources"; "ResourceScanId" ] (fun tag _ ->
      match tag with
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> boxed_max_results_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Resources" ->
          r_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Resources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scanned_resource_identifier_of_xml i)
                     ())
                 ())
      | "ResourceScanId" ->
          r_resource_scan_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanId"
                 (fun i _ -> resource_scan_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     resources = Smaws_Lib.Xml.Parse.required "Resources" (( ! ) r_resources) i;
     resource_scan_id = Smaws_Lib.Xml.Parse.required "ResourceScanId" (( ! ) r_resource_scan_id) i;
   }
    : list_resource_scan_related_resources_input)

let imports_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_name_of_xml i) ()

let list_imports_output_of_xml i =
  let r_next_token = ref None in
  let r_imports = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Imports" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Imports" ->
          r_imports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Imports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_name_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; imports = ( ! ) r_imports } : list_imports_output)

let list_imports_input_of_xml i =
  let r_next_token = ref None in
  let r_export_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "ExportName" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "ExportName" ->
          r_export_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExportName"
                 (fun i _ -> export_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     export_name = Smaws_Lib.Xml.Parse.required "ExportName" (( ! ) r_export_name) i;
   }
    : list_imports_input)

let list_hook_results_target_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CLOUD_CONTROL" -> CLOUD_CONTROL
   | "RESOURCE" -> RESOURCE
   | "STACK" -> STACK
   | "CHANGE_SET" -> CHANGE_SET
   | _ -> failwith "unknown enum value"
    : list_hook_results_target_type)

let hook_result_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let hook_type_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let hook_type_version_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let hook_type_configuration_version_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let hook_type_arn_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let hook_result_summary_of_xml i =
  let r_hook_execution_target = ref None in
  let r_type_arn = ref None in
  let r_target_id = ref None in
  let r_target_type = ref None in
  let r_invoked_at = ref None in
  let r_hook_status_reason = ref None in
  let r_status = ref None in
  let r_type_configuration_version_id = ref None in
  let r_type_version_id = ref None in
  let r_type_name = ref None in
  let r_failure_mode = ref None in
  let r_invocation_point = ref None in
  let r_hook_result_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "HookExecutionTarget";
      "TypeArn";
      "TargetId";
      "TargetType";
      "InvokedAt";
      "HookStatusReason";
      "Status";
      "TypeConfigurationVersionId";
      "TypeVersionId";
      "TypeName";
      "FailureMode";
      "InvocationPoint";
      "HookResultId";
    ] (fun tag _ ->
      match tag with
      | "HookExecutionTarget" ->
          r_hook_execution_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookExecutionTarget"
                 (fun i _ -> hook_result_id_of_xml i)
                 ())
      | "TypeArn" ->
          r_type_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> hook_type_arn_of_xml i) ())
      | "TargetId" ->
          r_target_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetId"
                 (fun i _ -> hook_result_id_of_xml i)
                 ())
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> list_hook_results_target_type_of_xml i)
                 ())
      | "InvokedAt" ->
          r_invoked_at :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvokedAt" (fun i _ -> timestamp_of_xml i) ())
      | "HookStatusReason" ->
          r_hook_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatusReason"
                 (fun i _ -> hook_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> hook_status_of_xml i) ())
      | "TypeConfigurationVersionId" ->
          r_type_configuration_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationVersionId"
                 (fun i _ -> hook_type_configuration_version_id_of_xml i)
                 ())
      | "TypeVersionId" ->
          r_type_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeVersionId"
                 (fun i _ -> hook_type_version_id_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName"
                 (fun i _ -> hook_type_name_of_xml i)
                 ())
      | "FailureMode" ->
          r_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "InvocationPoint" ->
          r_invocation_point :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvocationPoint"
                 (fun i _ -> hook_invocation_point_of_xml i)
                 ())
      | "HookResultId" ->
          r_hook_result_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookResultId"
                 (fun i _ -> hook_invocation_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     hook_execution_target = ( ! ) r_hook_execution_target;
     type_arn = ( ! ) r_type_arn;
     target_id = ( ! ) r_target_id;
     target_type = ( ! ) r_target_type;
     invoked_at = ( ! ) r_invoked_at;
     hook_status_reason = ( ! ) r_hook_status_reason;
     status = ( ! ) r_status;
     type_configuration_version_id = ( ! ) r_type_configuration_version_id;
     type_version_id = ( ! ) r_type_version_id;
     type_name = ( ! ) r_type_name;
     failure_mode = ( ! ) r_failure_mode;
     invocation_point = ( ! ) r_invocation_point;
     hook_result_id = ( ! ) r_hook_result_id;
   }
    : hook_result_summary)

let hook_result_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> hook_result_summary_of_xml i) ()

let list_hook_results_output_of_xml i =
  let r_next_token = ref None in
  let r_hook_results = ref None in
  let r_target_id = ref None in
  let r_target_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NextToken"; "HookResults"; "TargetId"; "TargetType" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "HookResults" ->
          r_hook_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookResults"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> hook_result_summary_of_xml i)
                     ())
                 ())
      | "TargetId" ->
          r_target_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetId"
                 (fun i _ -> hook_result_id_of_xml i)
                 ())
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> list_hook_results_target_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     hook_results = ( ! ) r_hook_results;
     target_id = ( ! ) r_target_id;
     target_type = ( ! ) r_target_type;
   }
    : list_hook_results_output)

let list_hook_results_input_of_xml i =
  let r_next_token = ref None in
  let r_status = ref None in
  let r_type_arn = ref None in
  let r_target_id = ref None in
  let r_target_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NextToken"; "Status"; "TypeArn"; "TargetId"; "TargetType" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> hook_status_of_xml i) ())
      | "TypeArn" ->
          r_type_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> hook_type_arn_of_xml i) ())
      | "TargetId" ->
          r_target_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetId"
                 (fun i _ -> hook_result_id_of_xml i)
                 ())
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> list_hook_results_target_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     status = ( ! ) r_status;
     type_arn = ( ! ) r_type_arn;
     target_id = ( ! ) r_target_id;
     target_type = ( ! ) r_target_type;
   }
    : list_hook_results_input)

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

let list_generated_templates_output_of_xml i =
  let r_next_token = ref None in
  let r_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Summaries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> template_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; summaries = ( ! ) r_summaries }
    : list_generated_templates_output)

let list_generated_templates_input_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxResults"; "NextToken" ] (fun tag _ ->
      match tag with
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
  ({ max_results = ( ! ) r_max_results; next_token = ( ! ) r_next_token }
    : list_generated_templates_input)

let export_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let export__of_xml i =
  let r_value = ref None in
  let r_name = ref None in
  let r_exporting_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Name"; "ExportingStackId" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> export_value_of_xml i) ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> export_name_of_xml i) ())
      | "ExportingStackId" ->
          r_exporting_stack_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExportingStackId"
                 (fun i _ -> stack_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; name = ( ! ) r_name; exporting_stack_id = ( ! ) r_exporting_stack_id }
    : export_)

let exports_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> export__of_xml i) ()

let list_exports_output_of_xml i =
  let r_next_token = ref None in
  let r_exports = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Exports" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Exports" ->
          r_exports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Exports"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> export__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; exports = ( ! ) r_exports } : list_exports_output)

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

let change_set_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let execution_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "OBSOLETE" -> OBSOLETE
   | "EXECUTE_FAILED" -> EXECUTE_FAILED
   | "EXECUTE_COMPLETE" -> EXECUTE_COMPLETE
   | "EXECUTE_IN_PROGRESS" -> EXECUTE_IN_PROGRESS
   | "AVAILABLE" -> AVAILABLE
   | "UNAVAILABLE" -> UNAVAILABLE
   | _ -> failwith "unknown enum value"
    : execution_status)

let change_set_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "FAILED" -> FAILED
   | "DELETE_FAILED" -> DELETE_FAILED
   | "DELETE_COMPLETE" -> DELETE_COMPLETE
   | "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | "DELETE_PENDING" -> DELETE_PENDING
   | "CREATE_COMPLETE" -> CREATE_COMPLETE
   | "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | "CREATE_PENDING" -> CREATE_PENDING
   | _ -> failwith "unknown enum value"
    : change_set_status)

let change_set_status_reason_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let include_nested_stacks_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let import_existing_resources_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let change_set_summary_of_xml i =
  let r_import_existing_resources = ref None in
  let r_root_change_set_id = ref None in
  let r_parent_change_set_id = ref None in
  let r_include_nested_stacks = ref None in
  let r_description = ref None in
  let r_creation_time = ref None in
  let r_status_reason = ref None in
  let r_status = ref None in
  let r_execution_status = ref None in
  let r_change_set_name = ref None in
  let r_change_set_id = ref None in
  let r_stack_name = ref None in
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ImportExistingResources";
      "RootChangeSetId";
      "ParentChangeSetId";
      "IncludeNestedStacks";
      "Description";
      "CreationTime";
      "StatusReason";
      "Status";
      "ExecutionStatus";
      "ChangeSetName";
      "ChangeSetId";
      "StackName";
      "StackId";
    ] (fun tag _ ->
      match tag with
      | "ImportExistingResources" ->
          r_import_existing_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImportExistingResources"
                 (fun i _ -> import_existing_resources_of_xml i)
                 ())
      | "RootChangeSetId" ->
          r_root_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RootChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "ParentChangeSetId" ->
          r_parent_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParentChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "IncludeNestedStacks" ->
          r_include_nested_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeNestedStacks"
                 (fun i _ -> include_nested_stacks_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> change_set_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> change_set_status_of_xml i)
                 ())
      | "ExecutionStatus" ->
          r_execution_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatus"
                 (fun i _ -> execution_status_of_xml i)
                 ())
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
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     import_existing_resources = ( ! ) r_import_existing_resources;
     root_change_set_id = ( ! ) r_root_change_set_id;
     parent_change_set_id = ( ! ) r_parent_change_set_id;
     include_nested_stacks = ( ! ) r_include_nested_stacks;
     description = ( ! ) r_description;
     creation_time = ( ! ) r_creation_time;
     status_reason = ( ! ) r_status_reason;
     status = ( ! ) r_status;
     execution_status = ( ! ) r_execution_status;
     change_set_name = ( ! ) r_change_set_name;
     change_set_id = ( ! ) r_change_set_id;
     stack_name = ( ! ) r_stack_name;
     stack_id = ( ! ) r_stack_id;
   }
    : change_set_summary)

let change_set_summaries_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> change_set_summary_of_xml i) ()

let list_change_sets_output_of_xml i =
  let r_next_token = ref None in
  let r_summaries = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Summaries" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Summaries" ->
          r_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Summaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> change_set_summary_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; summaries = ( ! ) r_summaries } : list_change_sets_output)

let list_change_sets_input_of_xml i =
  let r_next_token = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "StackName" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : list_change_sets_input)

let limit_value_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let limit_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

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

let include_property_values_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

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

let import_stacks_to_stack_set_input_of_xml i =
  let r_call_as = ref None in
  let r_operation_id = ref None in
  let r_operation_preferences = ref None in
  let r_organizational_unit_ids = ref None in
  let r_stack_ids_url = ref None in
  let r_stack_ids = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CallAs";
      "OperationId";
      "OperationPreferences";
      "OrganizationalUnitIds";
      "StackIdsUrl";
      "StackIds";
      "StackSetName";
    ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
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
      | "StackIdsUrl" ->
          r_stack_ids_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackIdsUrl"
                 (fun i _ -> stack_ids_url_of_xml i)
                 ())
      | "StackIds" ->
          r_stack_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_id_of_xml i) ())
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     operation_id = ( ! ) r_operation_id;
     operation_preferences = ( ! ) r_operation_preferences;
     organizational_unit_ids = ( ! ) r_organizational_unit_ids;
     stack_ids_url = ( ! ) r_stack_ids_url;
     stack_ids = ( ! ) r_stack_ids;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : import_stacks_to_stack_set_input)

let hook_target_type_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let hook_target_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "RESOURCE" -> RESOURCE | _ -> failwith "unknown enum value" : hook_target_type)

let hook_target_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let hook_target_action_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "IMPORT" -> IMPORT
   | "DELETE" -> DELETE
   | "UPDATE" -> UPDATE
   | "CREATE" -> CREATE
   | _ -> failwith "unknown enum value"
    : hook_target_action)

let hook_target_of_xml i =
  let r_action = ref None in
  let r_target_id = ref None in
  let r_target_type_name = ref None in
  let r_target_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Action"; "TargetId"; "TargetTypeName"; "TargetType" ] (fun tag _ ->
      match tag with
      | "Action" ->
          r_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Action"
                 (fun i _ -> hook_target_action_of_xml i)
                 ())
      | "TargetId" ->
          r_target_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetId"
                 (fun i _ -> hook_target_id_of_xml i)
                 ())
      | "TargetTypeName" ->
          r_target_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetTypeName"
                 (fun i _ -> hook_target_type_name_of_xml i)
                 ())
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> hook_target_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     action = Smaws_Lib.Xml.Parse.required "Action" (( ! ) r_action) i;
     target_id = Smaws_Lib.Xml.Parse.required "TargetId" (( ! ) r_target_id) i;
     target_type_name = Smaws_Lib.Xml.Parse.required "TargetTypeName" (( ! ) r_target_type_name) i;
     target_type = Smaws_Lib.Xml.Parse.required "TargetType" (( ! ) r_target_type) i;
   }
    : hook_target)

let hook_invocation_count_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let get_template_summary_output_of_xml i =
  let r_warnings = ref None in
  let r_resource_identifier_summaries = ref None in
  let r_declared_transforms = ref None in
  let r_metadata = ref None in
  let r_version = ref None in
  let r_resource_types = ref None in
  let r_capabilities_reason = ref None in
  let r_capabilities = ref None in
  let r_description = ref None in
  let r_parameters = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Warnings";
      "ResourceIdentifierSummaries";
      "DeclaredTransforms";
      "Metadata";
      "Version";
      "ResourceTypes";
      "CapabilitiesReason";
      "Capabilities";
      "Description";
      "Parameters";
    ] (fun tag _ ->
      match tag with
      | "Warnings" ->
          r_warnings :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Warnings" (fun i _ -> warnings_of_xml i) ())
      | "ResourceIdentifierSummaries" ->
          r_resource_identifier_summaries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceIdentifierSummaries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_identifier_summary_of_xml i)
                     ())
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
      | "Metadata" ->
          r_metadata :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Metadata" (fun i _ -> metadata_of_xml i) ())
      | "Version" ->
          r_version :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Version" (fun i _ -> version_of_xml i) ())
      | "ResourceTypes" ->
          r_resource_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_type_of_xml i)
                     ())
                 ())
      | "CapabilitiesReason" ->
          r_capabilities_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CapabilitiesReason"
                 (fun i _ -> capabilities_reason_of_xml i)
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
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
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> parameter_declaration_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     warnings = ( ! ) r_warnings;
     resource_identifier_summaries = ( ! ) r_resource_identifier_summaries;
     declared_transforms = ( ! ) r_declared_transforms;
     metadata = ( ! ) r_metadata;
     version = ( ! ) r_version;
     resource_types = ( ! ) r_resource_types;
     capabilities_reason = ( ! ) r_capabilities_reason;
     capabilities = ( ! ) r_capabilities;
     description = ( ! ) r_description;
     parameters = ( ! ) r_parameters;
   }
    : get_template_summary_output)

let get_template_summary_input_of_xml i =
  let r_template_summary_config = ref None in
  let r_call_as = ref None in
  let r_stack_set_name = ref None in
  let r_stack_name = ref None in
  let r_template_ur_l = ref None in
  let r_template_body = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TemplateSummaryConfig"; "CallAs"; "StackSetName"; "StackName"; "TemplateURL"; "TemplateBody";
    ] (fun tag _ ->
      match tag with
      | "TemplateSummaryConfig" ->
          r_template_summary_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateSummaryConfig"
                 (fun i _ -> template_summary_config_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_summary_config = ( ! ) r_template_summary_config;
     call_as = ( ! ) r_call_as;
     stack_set_name = ( ! ) r_stack_set_name;
     stack_name = ( ! ) r_stack_name;
     template_ur_l = ( ! ) r_template_ur_l;
     template_body = ( ! ) r_template_body;
   }
    : get_template_summary_input)

let get_template_output_of_xml i =
  let r_stages_available = ref None in
  let r_template_body = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StagesAvailable"; "TemplateBody" ] (fun tag _ ->
      match tag with
      | "StagesAvailable" ->
          r_stages_available :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StagesAvailable"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> template_stage_of_xml i)
                     ())
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stages_available = ( ! ) r_stages_available; template_body = ( ! ) r_template_body }
    : get_template_output)

let change_set_name_or_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let get_template_input_of_xml i =
  let r_template_stage = ref None in
  let r_change_set_name = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateStage"; "ChangeSetName"; "StackName" ]
    (fun tag _ ->
      match tag with
      | "TemplateStage" ->
          r_template_stage :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateStage"
                 (fun i _ -> template_stage_of_xml i)
                 ())
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_or_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_stage = ( ! ) r_template_stage;
     change_set_name = ( ! ) r_change_set_name;
     stack_name = ( ! ) r_stack_name;
   }
    : get_template_input)

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

let annotation_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let annotation_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "SKIPPED" -> SKIPPED
   | "FAILED" -> FAILED
   | "PASSED" -> PASSED
   | _ -> failwith "unknown enum value"
    : annotation_status)

let annotation_remediation_link_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let annotation_severity_level_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "CRITICAL" -> CRITICAL
   | "HIGH" -> HIGH
   | "MEDIUM" -> MEDIUM
   | "LOW" -> LOW
   | "INFORMATIONAL" -> INFORMATIONAL
   | _ -> failwith "unknown enum value"
    : annotation_severity_level)

let annotation_of_xml i =
  let r_severity_level = ref None in
  let r_remediation_link = ref None in
  let r_remediation_message = ref None in
  let r_status_message = ref None in
  let r_status = ref None in
  let r_annotation_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "SeverityLevel";
      "RemediationLink";
      "RemediationMessage";
      "StatusMessage";
      "Status";
      "AnnotationName";
    ] (fun tag _ ->
      match tag with
      | "SeverityLevel" ->
          r_severity_level :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SeverityLevel"
                 (fun i _ -> annotation_severity_level_of_xml i)
                 ())
      | "RemediationLink" ->
          r_remediation_link :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemediationLink"
                 (fun i _ -> annotation_remediation_link_of_xml i)
                 ())
      | "RemediationMessage" ->
          r_remediation_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RemediationMessage"
                 (fun i _ -> remediation_message_remediation_message_of_xml i)
                 ())
      | "StatusMessage" ->
          r_status_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusMessage"
                 (fun i _ -> remediation_message_status_message_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> annotation_status_of_xml i)
                 ())
      | "AnnotationName" ->
          r_annotation_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AnnotationName"
                 (fun i _ -> annotation_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     severity_level = ( ! ) r_severity_level;
     remediation_link = ( ! ) r_remediation_link;
     remediation_message = ( ! ) r_remediation_message;
     status_message = ( ! ) r_status_message;
     status = ( ! ) r_status;
     annotation_name = ( ! ) r_annotation_name;
   }
    : annotation)

let annotation_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> annotation_of_xml i) ()

let get_hook_result_output_of_xml i =
  let r_annotations = ref None in
  let r_target = ref None in
  let r_invoked_at = ref None in
  let r_hook_status_reason = ref None in
  let r_status = ref None in
  let r_type_arn = ref None in
  let r_type_configuration_version_id = ref None in
  let r_type_version_id = ref None in
  let r_original_type_name = ref None in
  let r_type_name = ref None in
  let r_failure_mode = ref None in
  let r_invocation_point = ref None in
  let r_hook_result_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Annotations";
      "Target";
      "InvokedAt";
      "HookStatusReason";
      "Status";
      "TypeArn";
      "TypeConfigurationVersionId";
      "TypeVersionId";
      "OriginalTypeName";
      "TypeName";
      "FailureMode";
      "InvocationPoint";
      "HookResultId";
    ] (fun tag _ ->
      match tag with
      | "Annotations" ->
          r_annotations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Annotations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> annotation_of_xml i) ())
                 ())
      | "Target" ->
          r_target :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Target" (fun i _ -> hook_target_of_xml i) ())
      | "InvokedAt" ->
          r_invoked_at :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvokedAt" (fun i _ -> timestamp_of_xml i) ())
      | "HookStatusReason" ->
          r_hook_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookStatusReason"
                 (fun i _ -> hook_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> hook_status_of_xml i) ())
      | "TypeArn" ->
          r_type_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> hook_type_arn_of_xml i) ())
      | "TypeConfigurationVersionId" ->
          r_type_configuration_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationVersionId"
                 (fun i _ -> hook_type_configuration_version_id_of_xml i)
                 ())
      | "TypeVersionId" ->
          r_type_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeVersionId"
                 (fun i _ -> hook_type_version_id_of_xml i)
                 ())
      | "OriginalTypeName" ->
          r_original_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OriginalTypeName"
                 (fun i _ -> hook_type_name_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName"
                 (fun i _ -> hook_type_name_of_xml i)
                 ())
      | "FailureMode" ->
          r_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "InvocationPoint" ->
          r_invocation_point :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvocationPoint"
                 (fun i _ -> hook_invocation_point_of_xml i)
                 ())
      | "HookResultId" ->
          r_hook_result_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookResultId"
                 (fun i _ -> hook_invocation_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     annotations = ( ! ) r_annotations;
     target = ( ! ) r_target;
     invoked_at = ( ! ) r_invoked_at;
     hook_status_reason = ( ! ) r_hook_status_reason;
     status = ( ! ) r_status;
     type_arn = ( ! ) r_type_arn;
     type_configuration_version_id = ( ! ) r_type_configuration_version_id;
     type_version_id = ( ! ) r_type_version_id;
     original_type_name = ( ! ) r_original_type_name;
     type_name = ( ! ) r_type_name;
     failure_mode = ( ! ) r_failure_mode;
     invocation_point = ( ! ) r_invocation_point;
     hook_result_id = ( ! ) r_hook_result_id;
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
  let r_template_body = ref None in
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TemplateBody"; "Status" ] (fun tag _ ->
      match tag with
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> generated_template_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ template_body = ( ! ) r_template_body; status = ( ! ) r_status }
    : get_generated_template_output)

let get_generated_template_input_of_xml i =
  let r_generated_template_name = ref None in
  let r_format = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GeneratedTemplateName"; "Format" ] (fun tag _ ->
      match tag with
      | "GeneratedTemplateName" ->
          r_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | "Format" ->
          r_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Format"
                 (fun i _ -> template_format_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     generated_template_name =
       Smaws_Lib.Xml.Parse.required "GeneratedTemplateName" (( ! ) r_generated_template_name) i;
     format = ( ! ) r_format;
   }
    : get_generated_template_input)

let failed_events_filter_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

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

let execute_change_set_output_of_xml i = ()

let execute_change_set_input_of_xml i =
  let r_retain_except_on_create = ref None in
  let r_disable_rollback = ref None in
  let r_client_request_token = ref None in
  let r_stack_name = ref None in
  let r_change_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "RetainExceptOnCreate"; "DisableRollback"; "ClientRequestToken"; "StackName"; "ChangeSetName";
    ] (fun tag _ ->
      match tag with
      | "RetainExceptOnCreate" ->
          r_retain_except_on_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainExceptOnCreate"
                 (fun i _ -> retain_except_on_create_of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     retain_except_on_create = ( ! ) r_retain_except_on_create;
     disable_rollback = ( ! ) r_disable_rollback;
     client_request_token = ( ! ) r_client_request_token;
     stack_name = ( ! ) r_stack_name;
     change_set_name = Smaws_Lib.Xml.Parse.required "ChangeSetName" (( ! ) r_change_set_name) i;
   }
    : execute_change_set_input)

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

let estimate_template_cost_output_of_xml i =
  let r_url = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Url" ] (fun tag _ ->
      match tag with
      | "Url" ->
          r_url := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Url" (fun i _ -> url_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ url = ( ! ) r_url } : estimate_template_cost_output)

let estimate_template_cost_input_of_xml i =
  let r_parameters = ref None in
  let r_template_ur_l = ref None in
  let r_template_body = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Parameters"; "TemplateURL"; "TemplateBody" ]
    (fun tag _ ->
      match tag with
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     parameters = ( ! ) r_parameters;
     template_ur_l = ( ! ) r_template_ur_l;
     template_body = ( ! ) r_template_body;
   }
    : estimate_template_cost_input)

let error_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let enable_stack_creation_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

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
  let r_call_as = ref None in
  let r_operation_id = ref None in
  let r_operation_preferences = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CallAs"; "OperationId"; "OperationPreferences"; "StackSetName" ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     operation_id = ( ! ) r_operation_id;
     operation_preferences = ( ! ) r_operation_preferences;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : detect_stack_set_drift_input)

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
  let r_logical_resource_id = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LogicalResourceId"; "StackName" ] (fun tag _ ->
      match tag with
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : detect_stack_resource_drift_input)

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
  let r_logical_resource_ids = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LogicalResourceIds"; "StackName" ] (fun tag _ ->
      match tag with
      | "LogicalResourceIds" ->
          r_logical_resource_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> logical_resource_id_of_xml i)
                     ())
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     logical_resource_ids = ( ! ) r_logical_resource_ids;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : detect_stack_drift_input)

let describe_type_registration_output_of_xml i =
  let r_type_version_arn = ref None in
  let r_type_arn = ref None in
  let r_description = ref None in
  let r_progress_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TypeVersionArn"; "TypeArn"; "Description"; "ProgressStatus" ] (fun tag _ ->
      match tag with
      | "TypeVersionArn" ->
          r_type_version_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeVersionArn"
                 (fun i _ -> type_arn_of_xml i)
                 ())
      | "TypeArn" ->
          r_type_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeArn" (fun i _ -> type_arn_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ProgressStatus" ->
          r_progress_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProgressStatus"
                 (fun i _ -> registration_status_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_version_arn = ( ! ) r_type_version_arn;
     type_arn = ( ! ) r_type_arn;
     description = ( ! ) r_description;
     progress_status = ( ! ) r_progress_status;
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

let auto_update_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let describe_type_output_of_xml i =
  let r_auto_update = ref None in
  let r_is_activated = ref None in
  let r_latest_public_version = ref None in
  let r_public_version_number = ref None in
  let r_original_type_arn = ref None in
  let r_original_type_name = ref None in
  let r_publisher_id = ref None in
  let r_configuration_schema = ref None in
  let r_time_created = ref None in
  let r_last_updated = ref None in
  let r_documentation_url = ref None in
  let r_source_url = ref None in
  let r_visibility = ref None in
  let r_execution_role_arn = ref None in
  let r_required_activated_types = ref None in
  let r_logging_config = ref None in
  let r_deprecated_status = ref None in
  let r_provisioning_type = ref None in
  let r_schema = ref None in
  let r_description = ref None in
  let r_type_tests_status_description = ref None in
  let r_type_tests_status = ref None in
  let r_is_default_version = ref None in
  let r_default_version_id = ref None in
  let r_type_name = ref None in
  let r_type_ = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AutoUpdate";
      "IsActivated";
      "LatestPublicVersion";
      "PublicVersionNumber";
      "OriginalTypeArn";
      "OriginalTypeName";
      "PublisherId";
      "ConfigurationSchema";
      "TimeCreated";
      "LastUpdated";
      "DocumentationUrl";
      "SourceUrl";
      "Visibility";
      "ExecutionRoleArn";
      "RequiredActivatedTypes";
      "LoggingConfig";
      "DeprecatedStatus";
      "ProvisioningType";
      "Schema";
      "Description";
      "TypeTestsStatusDescription";
      "TypeTestsStatus";
      "IsDefaultVersion";
      "DefaultVersionId";
      "TypeName";
      "Type";
      "Arn";
    ] (fun tag _ ->
      match tag with
      | "AutoUpdate" ->
          r_auto_update :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoUpdate"
                 (fun i _ -> auto_update_of_xml i)
                 ())
      | "IsActivated" ->
          r_is_activated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsActivated"
                 (fun i _ -> is_activated_of_xml i)
                 ())
      | "LatestPublicVersion" ->
          r_latest_public_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LatestPublicVersion"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | "PublicVersionNumber" ->
          r_public_version_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicVersionNumber"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | "OriginalTypeArn" ->
          r_original_type_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OriginalTypeArn"
                 (fun i _ -> type_arn_of_xml i)
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
      | "ConfigurationSchema" ->
          r_configuration_schema :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConfigurationSchema"
                 (fun i _ -> configuration_schema_of_xml i)
                 ())
      | "TimeCreated" ->
          r_time_created :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TimeCreated" (fun i _ -> timestamp_of_xml i) ())
      | "LastUpdated" ->
          r_last_updated :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdated" (fun i _ -> timestamp_of_xml i) ())
      | "DocumentationUrl" ->
          r_documentation_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DocumentationUrl"
                 (fun i _ -> optional_secure_url_of_xml i)
                 ())
      | "SourceUrl" ->
          r_source_url :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceUrl"
                 (fun i _ -> optional_secure_url_of_xml i)
                 ())
      | "Visibility" ->
          r_visibility :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Visibility" (fun i _ -> visibility_of_xml i) ())
      | "ExecutionRoleArn" ->
          r_execution_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleArn"
                 (fun i _ -> role_ar_n2_of_xml i)
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
      | "LoggingConfig" ->
          r_logging_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoggingConfig"
                 (fun i _ -> logging_config_of_xml i)
                 ())
      | "DeprecatedStatus" ->
          r_deprecated_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeprecatedStatus"
                 (fun i _ -> deprecated_status_of_xml i)
                 ())
      | "ProvisioningType" ->
          r_provisioning_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ProvisioningType"
                 (fun i _ -> provisioning_type_of_xml i)
                 ())
      | "Schema" ->
          r_schema :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Schema" (fun i _ -> type_schema_of_xml i) ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "TypeTestsStatusDescription" ->
          r_type_tests_status_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeTestsStatusDescription"
                 (fun i _ -> type_tests_status_description_of_xml i)
                 ())
      | "TypeTestsStatus" ->
          r_type_tests_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeTestsStatus"
                 (fun i _ -> type_tests_status_of_xml i)
                 ())
      | "IsDefaultVersion" ->
          r_is_default_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsDefaultVersion"
                 (fun i _ -> is_default_version_of_xml i)
                 ())
      | "DefaultVersionId" ->
          r_default_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultVersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> type_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     auto_update = ( ! ) r_auto_update;
     is_activated = ( ! ) r_is_activated;
     latest_public_version = ( ! ) r_latest_public_version;
     public_version_number = ( ! ) r_public_version_number;
     original_type_arn = ( ! ) r_original_type_arn;
     original_type_name = ( ! ) r_original_type_name;
     publisher_id = ( ! ) r_publisher_id;
     configuration_schema = ( ! ) r_configuration_schema;
     time_created = ( ! ) r_time_created;
     last_updated = ( ! ) r_last_updated;
     documentation_url = ( ! ) r_documentation_url;
     source_url = ( ! ) r_source_url;
     visibility = ( ! ) r_visibility;
     execution_role_arn = ( ! ) r_execution_role_arn;
     required_activated_types = ( ! ) r_required_activated_types;
     logging_config = ( ! ) r_logging_config;
     deprecated_status = ( ! ) r_deprecated_status;
     provisioning_type = ( ! ) r_provisioning_type;
     schema = ( ! ) r_schema;
     description = ( ! ) r_description;
     type_tests_status_description = ( ! ) r_type_tests_status_description;
     type_tests_status = ( ! ) r_type_tests_status;
     is_default_version = ( ! ) r_is_default_version;
     default_version_id = ( ! ) r_default_version_id;
     type_name = ( ! ) r_type_name;
     type_ = ( ! ) r_type_;
     arn = ( ! ) r_arn;
   }
    : describe_type_output)

let describe_type_input_of_xml i =
  let r_public_version_number = ref None in
  let r_publisher_id = ref None in
  let r_version_id = ref None in
  let r_arn = ref None in
  let r_type_name = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PublicVersionNumber"; "PublisherId"; "VersionId"; "Arn"; "TypeName"; "Type" ] (fun tag _ ->
      match tag with
      | "PublicVersionNumber" ->
          r_public_version_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicVersionNumber"
                 (fun i _ -> public_version_number_of_xml i)
                 ())
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "Arn" ->
          r_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> type_arn_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     public_version_number = ( ! ) r_public_version_number;
     publisher_id = ( ! ) r_publisher_id;
     version_id = ( ! ) r_version_id;
     arn = ( ! ) r_arn;
     type_name = ( ! ) r_type_name;
     type_ = ( ! ) r_type_;
   }
    : describe_type_input)

let describe_stacks_output_of_xml i =
  let r_next_token = ref None in
  let r_stacks = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Stacks" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Stacks" ->
          r_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Stacks"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; stacks = ( ! ) r_stacks } : describe_stacks_output)

let describe_stacks_input_of_xml i =
  let r_next_token = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "StackName" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; stack_name = ( ! ) r_stack_name } : describe_stacks_input)

let describe_stack_set_output_of_xml i =
  let r_stack_set = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackSet" ] (fun tag _ ->
      match tag with
      | "StackSet" ->
          r_stack_set :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackSet" (fun i _ -> stack_set_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_set = ( ! ) r_stack_set } : describe_stack_set_output)

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
  let r_call_as = ref None in
  let r_operation_id = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CallAs"; "OperationId"; "StackSetName" ]
    (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     operation_id = Smaws_Lib.Xml.Parse.required "OperationId" (( ! ) r_operation_id) i;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : describe_stack_set_operation_input)

let describe_stack_set_input_of_xml i =
  let r_call_as = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CallAs"; "StackSetName" ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : describe_stack_set_input)

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
  let r_physical_resource_id = ref None in
  let r_logical_resource_id = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PhysicalResourceId"; "LogicalResourceId"; "StackName" ] (fun tag _ ->
      match tag with
      | "PhysicalResourceId" ->
          r_physical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhysicalResourceId"
                 (fun i _ -> physical_resource_id_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     physical_resource_id = ( ! ) r_physical_resource_id;
     logical_resource_id = ( ! ) r_logical_resource_id;
     stack_name = ( ! ) r_stack_name;
   }
    : describe_stack_resources_input)

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
  let r_logical_resource_id = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LogicalResourceId"; "StackName" ] (fun tag _ ->
      match tag with
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     logical_resource_id =
       Smaws_Lib.Xml.Parse.required "LogicalResourceId" (( ! ) r_logical_resource_id) i;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : describe_stack_resource_input)

let describe_stack_resource_drifts_output_of_xml i =
  let r_next_token = ref None in
  let r_stack_resource_drifts = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "StackResourceDrifts" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackResourceDrifts" ->
          r_stack_resource_drifts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDrifts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_resource_drift_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     stack_resource_drifts =
       Smaws_Lib.Xml.Parse.required "StackResourceDrifts" (( ! ) r_stack_resource_drifts) i;
   }
    : describe_stack_resource_drifts_output)

let describe_stack_resource_drifts_input_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  let r_stack_resource_drift_status_filters = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "MaxResults"; "NextToken"; "StackResourceDriftStatusFilters"; "StackName" ] (fun tag _ ->
      match tag with
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> boxed_max_results_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackResourceDriftStatusFilters" ->
          r_stack_resource_drift_status_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackResourceDriftStatusFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_resource_drift_status_of_xml i)
                     ())
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     max_results = ( ! ) r_max_results;
     next_token = ( ! ) r_next_token;
     stack_resource_drift_status_filters = ( ! ) r_stack_resource_drift_status_filters;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : describe_stack_resource_drifts_input)

let describe_stack_refactor_output_of_xml i =
  let r_status_reason = ref None in
  let r_status = ref None in
  let r_execution_status_reason = ref None in
  let r_execution_status = ref None in
  let r_stack_ids = ref None in
  let r_stack_refactor_id = ref None in
  let r_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "StatusReason";
      "Status";
      "ExecutionStatusReason";
      "ExecutionStatus";
      "StackIds";
      "StackRefactorId";
      "Description";
    ] (fun tag _ ->
      match tag with
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> stack_refactor_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> stack_refactor_status_of_xml i)
                 ())
      | "ExecutionStatusReason" ->
          r_execution_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatusReason"
                 (fun i _ -> execution_status_reason_of_xml i)
                 ())
      | "ExecutionStatus" ->
          r_execution_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatus"
                 (fun i _ -> stack_refactor_execution_status_of_xml i)
                 ())
      | "StackIds" ->
          r_stack_ids :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackIds"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> stack_id_of_xml i) ())
                 ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status_reason = ( ! ) r_status_reason;
     status = ( ! ) r_status;
     execution_status_reason = ( ! ) r_execution_status_reason;
     execution_status = ( ! ) r_execution_status;
     stack_ids = ( ! ) r_stack_ids;
     stack_refactor_id = ( ! ) r_stack_refactor_id;
     description = ( ! ) r_description;
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
  let r_call_as = ref None in
  let r_stack_instance_region = ref None in
  let r_stack_instance_account = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CallAs"; "StackInstanceRegion"; "StackInstanceAccount"; "StackSetName" ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "StackInstanceRegion" ->
          r_stack_instance_region :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceRegion"
                 (fun i _ -> region_of_xml i)
                 ())
      | "StackInstanceAccount" ->
          r_stack_instance_account :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackInstanceAccount"
                 (fun i _ -> account_of_xml i)
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     stack_instance_region =
       Smaws_Lib.Xml.Parse.required "StackInstanceRegion" (( ! ) r_stack_instance_region) i;
     stack_instance_account =
       Smaws_Lib.Xml.Parse.required "StackInstanceAccount" (( ! ) r_stack_instance_account) i;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : describe_stack_instance_input)

let describe_stack_events_output_of_xml i =
  let r_next_token = ref None in
  let r_stack_events = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "StackEvents" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackEvents" ->
          r_stack_events :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackEvents"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_event_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; stack_events = ( ! ) r_stack_events }
    : describe_stack_events_output)

let describe_stack_events_input_of_xml i =
  let r_next_token = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "StackName" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : describe_stack_events_input)

let boxed_integer_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let describe_stack_drift_detection_status_output_of_xml i =
  let r_timestamp = ref None in
  let r_drifted_stack_resource_count = ref None in
  let r_detection_status_reason = ref None in
  let r_detection_status = ref None in
  let r_stack_drift_status = ref None in
  let r_stack_drift_detection_id = ref None in
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Timestamp";
      "DriftedStackResourceCount";
      "DetectionStatusReason";
      "DetectionStatus";
      "StackDriftStatus";
      "StackDriftDetectionId";
      "StackId";
    ] (fun tag _ ->
      match tag with
      | "Timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timestamp" (fun i _ -> timestamp_of_xml i) ())
      | "DriftedStackResourceCount" ->
          r_drifted_stack_resource_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DriftedStackResourceCount"
                 (fun i _ -> boxed_integer_of_xml i)
                 ())
      | "DetectionStatusReason" ->
          r_detection_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetectionStatusReason"
                 (fun i _ -> stack_drift_detection_status_reason_of_xml i)
                 ())
      | "DetectionStatus" ->
          r_detection_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DetectionStatus"
                 (fun i _ -> stack_drift_detection_status_of_xml i)
                 ())
      | "StackDriftStatus" ->
          r_stack_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | "StackDriftDetectionId" ->
          r_stack_drift_detection_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftDetectionId"
                 (fun i _ -> stack_drift_detection_id_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timestamp = Smaws_Lib.Xml.Parse.required "Timestamp" (( ! ) r_timestamp) i;
     drifted_stack_resource_count = ( ! ) r_drifted_stack_resource_count;
     detection_status_reason = ( ! ) r_detection_status_reason;
     detection_status = Smaws_Lib.Xml.Parse.required "DetectionStatus" (( ! ) r_detection_status) i;
     stack_drift_status = ( ! ) r_stack_drift_status;
     stack_drift_detection_id =
       Smaws_Lib.Xml.Parse.required "StackDriftDetectionId" (( ! ) r_stack_drift_detection_id) i;
     stack_id = Smaws_Lib.Xml.Parse.required "StackId" (( ! ) r_stack_id) i;
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

let describe_resource_scan_output_of_xml i =
  let r_scan_filters = ref None in
  let r_resources_read = ref None in
  let r_resources_scanned = ref None in
  let r_resource_types = ref None in
  let r_percentage_completed = ref None in
  let r_end_time = ref None in
  let r_start_time = ref None in
  let r_status_reason = ref None in
  let r_status = ref None in
  let r_resource_scan_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ScanFilters";
      "ResourcesRead";
      "ResourcesScanned";
      "ResourceTypes";
      "PercentageCompleted";
      "EndTime";
      "StartTime";
      "StatusReason";
      "Status";
      "ResourceScanId";
    ] (fun tag _ ->
      match tag with
      | "ScanFilters" ->
          r_scan_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ScanFilters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> scan_filter_of_xml i)
                     ())
                 ())
      | "ResourcesRead" ->
          r_resources_read :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesRead"
                 (fun i _ -> resources_read_of_xml i)
                 ())
      | "ResourcesScanned" ->
          r_resources_scanned :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesScanned"
                 (fun i _ -> resources_scanned_of_xml i)
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
      | "PercentageCompleted" ->
          r_percentage_completed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PercentageCompleted"
                 (fun i _ -> percentage_completed_of_xml i)
                 ())
      | "EndTime" ->
          r_end_time :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "EndTime" (fun i _ -> timestamp_of_xml i) ())
      | "StartTime" ->
          r_start_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StartTime" (fun i _ -> timestamp_of_xml i) ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> resource_scan_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> resource_scan_status_of_xml i)
                 ())
      | "ResourceScanId" ->
          r_resource_scan_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceScanId"
                 (fun i _ -> resource_scan_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scan_filters = ( ! ) r_scan_filters;
     resources_read = ( ! ) r_resources_read;
     resources_scanned = ( ! ) r_resources_scanned;
     resource_types = ( ! ) r_resource_types;
     percentage_completed = ( ! ) r_percentage_completed;
     end_time = ( ! ) r_end_time;
     start_time = ( ! ) r_start_time;
     status_reason = ( ! ) r_status_reason;
     status = ( ! ) r_status;
     resource_scan_id = ( ! ) r_resource_scan_id;
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

let describe_publisher_output_of_xml i =
  let r_publisher_profile = ref None in
  let r_identity_provider = ref None in
  let r_publisher_status = ref None in
  let r_publisher_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PublisherProfile"; "IdentityProvider"; "PublisherStatus"; "PublisherId" ] (fun tag _ ->
      match tag with
      | "PublisherProfile" ->
          r_publisher_profile :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherProfile"
                 (fun i _ -> publisher_profile_of_xml i)
                 ())
      | "IdentityProvider" ->
          r_identity_provider :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdentityProvider"
                 (fun i _ -> identity_provider_of_xml i)
                 ())
      | "PublisherStatus" ->
          r_publisher_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherStatus"
                 (fun i _ -> publisher_status_of_xml i)
                 ())
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     publisher_profile = ( ! ) r_publisher_profile;
     identity_provider = ( ! ) r_identity_provider;
     publisher_status = ( ! ) r_publisher_status;
     publisher_id = ( ! ) r_publisher_id;
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

let describe_generated_template_output_of_xml i =
  let r_total_warnings = ref None in
  let r_template_configuration = ref None in
  let r_stack_id = ref None in
  let r_progress = ref None in
  let r_last_updated_time = ref None in
  let r_creation_time = ref None in
  let r_status_reason = ref None in
  let r_status = ref None in
  let r_resources = ref None in
  let r_generated_template_name = ref None in
  let r_generated_template_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TotalWarnings";
      "TemplateConfiguration";
      "StackId";
      "Progress";
      "LastUpdatedTime";
      "CreationTime";
      "StatusReason";
      "Status";
      "Resources";
      "GeneratedTemplateName";
      "GeneratedTemplateId";
    ] (fun tag _ ->
      match tag with
      | "TotalWarnings" ->
          r_total_warnings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TotalWarnings"
                 (fun i _ -> total_warnings_of_xml i)
                 ())
      | "TemplateConfiguration" ->
          r_template_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateConfiguration"
                 (fun i _ -> template_configuration_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "Progress" ->
          r_progress :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Progress"
                 (fun i _ -> template_progress_of_xml i)
                 ())
      | "LastUpdatedTime" ->
          r_last_updated_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LastUpdatedTime"
                 (fun i _ -> last_updated_time_of_xml i)
                 ())
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> template_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> generated_template_status_of_xml i)
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
      | "GeneratedTemplateName" ->
          r_generated_template_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateName"
                 (fun i _ -> generated_template_name_of_xml i)
                 ())
      | "GeneratedTemplateId" ->
          r_generated_template_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GeneratedTemplateId"
                 (fun i _ -> generated_template_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     total_warnings = ( ! ) r_total_warnings;
     template_configuration = ( ! ) r_template_configuration;
     stack_id = ( ! ) r_stack_id;
     progress = ( ! ) r_progress;
     last_updated_time = ( ! ) r_last_updated_time;
     creation_time = ( ! ) r_creation_time;
     status_reason = ( ! ) r_status_reason;
     status = ( ! ) r_status;
     resources = ( ! ) r_resources;
     generated_template_name = ( ! ) r_generated_template_name;
     generated_template_id = ( ! ) r_generated_template_id;
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

let describe_events_output_of_xml i =
  let r_next_token = ref None in
  let r_operation_events = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "OperationEvents" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "OperationEvents" ->
          r_operation_events :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationEvents"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> operation_event_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; operation_events = ( ! ) r_operation_events }
    : describe_events_output)

let describe_events_input_of_xml i =
  let r_next_token = ref None in
  let r_filters = ref None in
  let r_operation_id = ref None in
  let r_change_set_name = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NextToken"; "Filters"; "OperationId"; "ChangeSetName"; "StackName" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Filters" ->
          r_filters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Filters" (fun i _ -> event_filter_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
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
     next_token = ( ! ) r_next_token;
     filters = ( ! ) r_filters;
     operation_id = ( ! ) r_operation_id;
     change_set_name = ( ! ) r_change_set_name;
     stack_name = ( ! ) r_stack_name;
   }
    : describe_events_input)

let change_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Resource" -> Resource | _ -> failwith "unknown enum value" : change_type)

let change_of_xml i =
  let r_resource_change = ref None in
  let r_hook_invocation_count = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceChange"; "HookInvocationCount"; "Type" ]
    (fun tag _ ->
      match tag with
      | "ResourceChange" ->
          r_resource_change :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceChange"
                 (fun i _ -> resource_change_of_xml i)
                 ())
      | "HookInvocationCount" ->
          r_hook_invocation_count :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HookInvocationCount"
                 (fun i _ -> hook_invocation_count_of_xml i)
                 ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> change_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_change = ( ! ) r_resource_change;
     hook_invocation_count = ( ! ) r_hook_invocation_count;
     type_ = ( ! ) r_type_;
   }
    : change)

let changes_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> change_of_xml i) ()

let deployment_mode_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "REVERT_DRIFT" -> REVERT_DRIFT | _ -> failwith "unknown enum value"
    : deployment_mode)

let describe_change_set_output_of_xml i =
  let r_deployment_config = ref None in
  let r_deployment_mode = ref None in
  let r_import_existing_resources = ref None in
  let r_on_stack_failure = ref None in
  let r_root_change_set_id = ref None in
  let r_parent_change_set_id = ref None in
  let r_include_nested_stacks = ref None in
  let r_next_token = ref None in
  let r_changes = ref None in
  let r_tags = ref None in
  let r_capabilities = ref None in
  let r_rollback_configuration = ref None in
  let r_notification_ar_ns = ref None in
  let r_stack_drift_status = ref None in
  let r_status_reason = ref None in
  let r_status = ref None in
  let r_execution_status = ref None in
  let r_creation_time = ref None in
  let r_parameters = ref None in
  let r_description = ref None in
  let r_stack_name = ref None in
  let r_stack_id = ref None in
  let r_change_set_id = ref None in
  let r_change_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DeploymentConfig";
      "DeploymentMode";
      "ImportExistingResources";
      "OnStackFailure";
      "RootChangeSetId";
      "ParentChangeSetId";
      "IncludeNestedStacks";
      "NextToken";
      "Changes";
      "Tags";
      "Capabilities";
      "RollbackConfiguration";
      "NotificationARNs";
      "StackDriftStatus";
      "StatusReason";
      "Status";
      "ExecutionStatus";
      "CreationTime";
      "Parameters";
      "Description";
      "StackName";
      "StackId";
      "ChangeSetId";
      "ChangeSetName";
    ] (fun tag _ ->
      match tag with
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | "DeploymentMode" ->
          r_deployment_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentMode"
                 (fun i _ -> deployment_mode_of_xml i)
                 ())
      | "ImportExistingResources" ->
          r_import_existing_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImportExistingResources"
                 (fun i _ -> import_existing_resources_of_xml i)
                 ())
      | "OnStackFailure" ->
          r_on_stack_failure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnStackFailure"
                 (fun i _ -> on_stack_failure_of_xml i)
                 ())
      | "RootChangeSetId" ->
          r_root_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RootChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "ParentChangeSetId" ->
          r_parent_change_set_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParentChangeSetId"
                 (fun i _ -> change_set_id_of_xml i)
                 ())
      | "IncludeNestedStacks" ->
          r_include_nested_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeNestedStacks"
                 (fun i _ -> include_nested_stacks_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Changes" ->
          r_changes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Changes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> change_of_xml i) ())
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
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
      | "StackDriftStatus" ->
          r_stack_drift_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDriftStatus"
                 (fun i _ -> stack_drift_status_of_xml i)
                 ())
      | "StatusReason" ->
          r_status_reason :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StatusReason"
                 (fun i _ -> change_set_status_reason_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> change_set_status_of_xml i)
                 ())
      | "ExecutionStatus" ->
          r_execution_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionStatus"
                 (fun i _ -> execution_status_of_xml i)
                 ())
      | "CreationTime" ->
          r_creation_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreationTime"
                 (fun i _ -> creation_time_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deployment_config = ( ! ) r_deployment_config;
     deployment_mode = ( ! ) r_deployment_mode;
     import_existing_resources = ( ! ) r_import_existing_resources;
     on_stack_failure = ( ! ) r_on_stack_failure;
     root_change_set_id = ( ! ) r_root_change_set_id;
     parent_change_set_id = ( ! ) r_parent_change_set_id;
     include_nested_stacks = ( ! ) r_include_nested_stacks;
     next_token = ( ! ) r_next_token;
     changes = ( ! ) r_changes;
     tags = ( ! ) r_tags;
     capabilities = ( ! ) r_capabilities;
     rollback_configuration = ( ! ) r_rollback_configuration;
     notification_ar_ns = ( ! ) r_notification_ar_ns;
     stack_drift_status = ( ! ) r_stack_drift_status;
     status_reason = ( ! ) r_status_reason;
     status = ( ! ) r_status;
     execution_status = ( ! ) r_execution_status;
     creation_time = ( ! ) r_creation_time;
     parameters = ( ! ) r_parameters;
     description = ( ! ) r_description;
     stack_name = ( ! ) r_stack_name;
     stack_id = ( ! ) r_stack_id;
     change_set_id = ( ! ) r_change_set_id;
     change_set_name = ( ! ) r_change_set_name;
   }
    : describe_change_set_output)

let describe_change_set_input_of_xml i =
  let r_include_property_values = ref None in
  let r_next_token = ref None in
  let r_stack_name = ref None in
  let r_change_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "IncludePropertyValues"; "NextToken"; "StackName"; "ChangeSetName" ] (fun tag _ ->
      match tag with
      | "IncludePropertyValues" ->
          r_include_property_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludePropertyValues"
                 (fun i _ -> include_property_values_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     include_property_values = ( ! ) r_include_property_values;
     next_token = ( ! ) r_next_token;
     stack_name = ( ! ) r_stack_name;
     change_set_name = Smaws_Lib.Xml.Parse.required "ChangeSetName" (( ! ) r_change_set_name) i;
   }
    : describe_change_set_input)

let change_set_hook_resource_target_details_of_xml i =
  let r_resource_action = ref None in
  let r_resource_type = ref None in
  let r_logical_resource_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ResourceAction"; "ResourceType"; "LogicalResourceId" ] (fun tag _ ->
      match tag with
      | "ResourceAction" ->
          r_resource_action :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceAction"
                 (fun i _ -> change_action_of_xml i)
                 ())
      | "ResourceType" ->
          r_resource_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceType"
                 (fun i _ -> hook_target_type_name_of_xml i)
                 ())
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     resource_action = ( ! ) r_resource_action;
     resource_type = ( ! ) r_resource_type;
     logical_resource_id = ( ! ) r_logical_resource_id;
   }
    : change_set_hook_resource_target_details)

let change_set_hook_target_details_of_xml i =
  let r_resource_target_details = ref None in
  let r_target_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceTargetDetails"; "TargetType" ]
    (fun tag _ ->
      match tag with
      | "ResourceTargetDetails" ->
          r_resource_target_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTargetDetails"
                 (fun i _ -> change_set_hook_resource_target_details_of_xml i)
                 ())
      | "TargetType" ->
          r_target_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetType"
                 (fun i _ -> hook_target_type_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_target_details = ( ! ) r_resource_target_details; target_type = ( ! ) r_target_type }
    : change_set_hook_target_details)

let change_set_hook_of_xml i =
  let r_target_details = ref None in
  let r_type_configuration_version_id = ref None in
  let r_type_version_id = ref None in
  let r_type_name = ref None in
  let r_failure_mode = ref None in
  let r_invocation_point = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "TargetDetails";
      "TypeConfigurationVersionId";
      "TypeVersionId";
      "TypeName";
      "FailureMode";
      "InvocationPoint";
    ] (fun tag _ ->
      match tag with
      | "TargetDetails" ->
          r_target_details :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TargetDetails"
                 (fun i _ -> change_set_hook_target_details_of_xml i)
                 ())
      | "TypeConfigurationVersionId" ->
          r_type_configuration_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationVersionId"
                 (fun i _ -> hook_type_configuration_version_id_of_xml i)
                 ())
      | "TypeVersionId" ->
          r_type_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeVersionId"
                 (fun i _ -> hook_type_version_id_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName"
                 (fun i _ -> hook_type_name_of_xml i)
                 ())
      | "FailureMode" ->
          r_failure_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "FailureMode"
                 (fun i _ -> hook_failure_mode_of_xml i)
                 ())
      | "InvocationPoint" ->
          r_invocation_point :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InvocationPoint"
                 (fun i _ -> hook_invocation_point_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_details = ( ! ) r_target_details;
     type_configuration_version_id = ( ! ) r_type_configuration_version_id;
     type_version_id = ( ! ) r_type_version_id;
     type_name = ( ! ) r_type_name;
     failure_mode = ( ! ) r_failure_mode;
     invocation_point = ( ! ) r_invocation_point;
   }
    : change_set_hook)

let change_set_hooks_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> change_set_hook_of_xml i) ()

let change_set_hooks_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "UNAVAILABLE" -> UNAVAILABLE
   | "PLANNED" -> PLANNED
   | "PLANNING" -> PLANNING
   | _ -> failwith "unknown enum value"
    : change_set_hooks_status)

let describe_change_set_hooks_output_of_xml i =
  let r_stack_name = ref None in
  let r_stack_id = ref None in
  let r_next_token = ref None in
  let r_status = ref None in
  let r_hooks = ref None in
  let r_change_set_name = ref None in
  let r_change_set_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackName"; "StackId"; "NextToken"; "Status"; "Hooks"; "ChangeSetName"; "ChangeSetId" ]
    (fun tag _ ->
      match tag with
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> change_set_hooks_status_of_xml i)
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = ( ! ) r_stack_name;
     stack_id = ( ! ) r_stack_id;
     next_token = ( ! ) r_next_token;
     status = ( ! ) r_status;
     hooks = ( ! ) r_hooks;
     change_set_name = ( ! ) r_change_set_name;
     change_set_id = ( ! ) r_change_set_id;
   }
    : describe_change_set_hooks_output)

let describe_change_set_hooks_input_of_xml i =
  let r_logical_resource_id = ref None in
  let r_next_token = ref None in
  let r_stack_name = ref None in
  let r_change_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "LogicalResourceId"; "NextToken"; "StackName"; "ChangeSetName" ] (fun tag _ ->
      match tag with
      | "LogicalResourceId" ->
          r_logical_resource_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LogicalResourceId"
                 (fun i _ -> logical_resource_id_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     logical_resource_id = ( ! ) r_logical_resource_id;
     next_token = ( ! ) r_next_token;
     stack_name = ( ! ) r_stack_name;
     change_set_name = Smaws_Lib.Xml.Parse.required "ChangeSetName" (( ! ) r_change_set_name) i;
   }
    : describe_change_set_hooks_input)

let account_limit_of_xml i =
  let r_value = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Name" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> limit_value_of_xml i) ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> limit_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; name = ( ! ) r_name } : account_limit)

let account_limit_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_limit_of_xml i) ()

let describe_account_limits_output_of_xml i =
  let r_next_token = ref None in
  let r_account_limits = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "AccountLimits" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "AccountLimits" ->
          r_account_limits :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccountLimits"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> account_limit_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; account_limits = ( ! ) r_account_limits }
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
  let r_version_id = ref None in
  let r_type_name = ref None in
  let r_type_ = ref None in
  let r_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "VersionId"; "TypeName"; "Type"; "Arn" ]
    (fun tag _ ->
      match tag with
      | "VersionId" ->
          r_version_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionId"
                 (fun i _ -> type_version_id_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> registry_type_of_xml i) ())
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> private_type_arn_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     version_id = ( ! ) r_version_id;
     type_name = ( ! ) r_type_name;
     type_ = ( ! ) r_type_;
     arn = ( ! ) r_arn;
   }
    : deregister_type_input)

let delete_stack_set_output_of_xml i = ()

let delete_stack_set_input_of_xml i =
  let r_call_as = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CallAs"; "StackSetName" ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
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

let delete_stack_instances_input_of_xml i =
  let r_call_as = ref None in
  let r_operation_id = ref None in
  let r_retain_stacks = ref None in
  let r_operation_preferences = ref None in
  let r_regions = ref None in
  let r_deployment_targets = ref None in
  let r_accounts = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CallAs";
      "OperationId";
      "RetainStacks";
      "OperationPreferences";
      "Regions";
      "DeploymentTargets";
      "Accounts";
      "StackSetName";
    ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "RetainStacks" ->
          r_retain_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainStacks"
                 (fun i _ -> retain_stacks_of_xml i)
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "DeploymentTargets" ->
          r_deployment_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTargets"
                 (fun i _ -> deployment_targets_of_xml i)
                 ())
      | "Accounts" ->
          r_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Accounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ())
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     operation_id = ( ! ) r_operation_id;
     retain_stacks = Smaws_Lib.Xml.Parse.required "RetainStacks" (( ! ) r_retain_stacks) i;
     operation_preferences = ( ! ) r_operation_preferences;
     regions = Smaws_Lib.Xml.Parse.required "Regions" (( ! ) r_regions) i;
     deployment_targets = ( ! ) r_deployment_targets;
     accounts = ( ! ) r_accounts;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : delete_stack_instances_input)

let delete_stack_input_of_xml i =
  let r_deployment_config = ref None in
  let r_deletion_mode = ref None in
  let r_client_request_token = ref None in
  let r_role_ar_n = ref None in
  let r_retain_resources = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DeploymentConfig";
      "DeletionMode";
      "ClientRequestToken";
      "RoleARN";
      "RetainResources";
      "StackName";
    ] (fun tag _ ->
      match tag with
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | "DeletionMode" ->
          r_deletion_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeletionMode"
                 (fun i _ -> deletion_mode_of_xml i)
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "RetainResources" ->
          r_retain_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainResources"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> logical_resource_id_of_xml i)
                     ())
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     deployment_config = ( ! ) r_deployment_config;
     deletion_mode = ( ! ) r_deletion_mode;
     client_request_token = ( ! ) r_client_request_token;
     role_ar_n = ( ! ) r_role_ar_n;
     retain_resources = ( ! ) r_retain_resources;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : delete_stack_input)

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

let delete_change_set_output_of_xml i = ()

let delete_change_set_input_of_xml i =
  let r_stack_name = ref None in
  let r_change_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackName"; "ChangeSetName" ] (fun tag _ ->
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
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_name = ( ! ) r_stack_name;
     change_set_name = Smaws_Lib.Xml.Parse.required "ChangeSetName" (( ! ) r_change_set_name) i;
   }
    : delete_change_set_input)

let deactivate_type_output_of_xml i = ()

let deactivate_type_input_of_xml i =
  let r_arn = ref None in
  let r_type_ = ref None in
  let r_type_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Arn"; "Type"; "TypeName" ] (fun tag _ ->
      match tag with
      | "Arn" ->
          r_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Arn" (fun i _ -> private_type_arn_of_xml i) ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ arn = ( ! ) r_arn; type_ = ( ! ) r_type_; type_name = ( ! ) r_type_name }
    : deactivate_type_input)

let deactivate_organizations_access_output_of_xml i = ()
let deactivate_organizations_access_input_of_xml i = ()

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
  let r_managed_execution = ref None in
  let r_client_request_token = ref None in
  let r_call_as = ref None in
  let r_auto_deployment = ref None in
  let r_permission_model = ref None in
  let r_execution_role_name = ref None in
  let r_administration_role_ar_n = ref None in
  let r_tags = ref None in
  let r_capabilities = ref None in
  let r_parameters = ref None in
  let r_stack_id = ref None in
  let r_template_ur_l = ref None in
  let r_template_body = ref None in
  let r_description = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "ManagedExecution";
      "ClientRequestToken";
      "CallAs";
      "AutoDeployment";
      "PermissionModel";
      "ExecutionRoleName";
      "AdministrationRoleARN";
      "Tags";
      "Capabilities";
      "Parameters";
      "StackId";
      "TemplateURL";
      "TemplateBody";
      "Description";
      "StackSetName";
    ] (fun tag _ ->
      match tag with
      | "ManagedExecution" ->
          r_managed_execution :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ManagedExecution"
                 (fun i _ -> managed_execution_of_xml i)
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
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
      | "ExecutionRoleName" ->
          r_execution_role_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleName"
                 (fun i _ -> execution_role_name_of_xml i)
                 ())
      | "AdministrationRoleARN" ->
          r_administration_role_ar_n :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdministrationRoleARN"
                 (fun i _ -> role_ar_n_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     managed_execution = ( ! ) r_managed_execution;
     client_request_token = ( ! ) r_client_request_token;
     call_as = ( ! ) r_call_as;
     auto_deployment = ( ! ) r_auto_deployment;
     permission_model = ( ! ) r_permission_model;
     execution_role_name = ( ! ) r_execution_role_name;
     administration_role_ar_n = ( ! ) r_administration_role_ar_n;
     tags = ( ! ) r_tags;
     capabilities = ( ! ) r_capabilities;
     parameters = ( ! ) r_parameters;
     stack_id = ( ! ) r_stack_id;
     template_ur_l = ( ! ) r_template_ur_l;
     template_body = ( ! ) r_template_body;
     description = ( ! ) r_description;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
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

let create_stack_refactor_input_of_xml i =
  let r_stack_definitions = ref None in
  let r_resource_mappings = ref None in
  let r_enable_stack_creation = ref None in
  let r_description = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "StackDefinitions"; "ResourceMappings"; "EnableStackCreation"; "Description" ] (fun tag _ ->
      match tag with
      | "StackDefinitions" ->
          r_stack_definitions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackDefinitions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> stack_definition_of_xml i)
                     ())
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
      | "EnableStackCreation" ->
          r_enable_stack_creation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableStackCreation"
                 (fun i _ -> enable_stack_creation_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     stack_definitions =
       Smaws_Lib.Xml.Parse.required "StackDefinitions" (( ! ) r_stack_definitions) i;
     resource_mappings = ( ! ) r_resource_mappings;
     enable_stack_creation = ( ! ) r_enable_stack_creation;
     description = ( ! ) r_description;
   }
    : create_stack_refactor_input)

let create_stack_output_of_xml i =
  let r_operation_id = ref None in
  let r_stack_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OperationId"; "StackId" ] (fun tag _ ->
      match tag with
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> operation_id_of_xml i)
                 ())
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ operation_id = ( ! ) r_operation_id; stack_id = ( ! ) r_stack_id } : create_stack_output)

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
  let r_call_as = ref None in
  let r_operation_id = ref None in
  let r_operation_preferences = ref None in
  let r_parameter_overrides = ref None in
  let r_regions = ref None in
  let r_deployment_targets = ref None in
  let r_accounts = ref None in
  let r_stack_set_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "CallAs";
      "OperationId";
      "OperationPreferences";
      "ParameterOverrides";
      "Regions";
      "DeploymentTargets";
      "Accounts";
      "StackSetName";
    ] (fun tag _ ->
      match tag with
      | "CallAs" ->
          r_call_as :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "CallAs" (fun i _ -> call_as_of_xml i) ())
      | "OperationId" ->
          r_operation_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationId"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "OperationPreferences" ->
          r_operation_preferences :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OperationPreferences"
                 (fun i _ -> stack_set_operation_preferences_of_xml i)
                 ())
      | "ParameterOverrides" ->
          r_parameter_overrides :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ParameterOverrides"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "Regions" ->
          r_regions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Regions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> region_of_xml i) ())
                 ())
      | "DeploymentTargets" ->
          r_deployment_targets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentTargets"
                 (fun i _ -> deployment_targets_of_xml i)
                 ())
      | "Accounts" ->
          r_accounts :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Accounts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> account_of_xml i) ())
                 ())
      | "StackSetName" ->
          r_stack_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackSetName"
                 (fun i _ -> stack_set_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     call_as = ( ! ) r_call_as;
     operation_id = ( ! ) r_operation_id;
     operation_preferences = ( ! ) r_operation_preferences;
     parameter_overrides = ( ! ) r_parameter_overrides;
     regions = Smaws_Lib.Xml.Parse.required "Regions" (( ! ) r_regions) i;
     deployment_targets = ( ! ) r_deployment_targets;
     accounts = ( ! ) r_accounts;
     stack_set_name = Smaws_Lib.Xml.Parse.required "StackSetName" (( ! ) r_stack_set_name) i;
   }
    : create_stack_instances_input)

let create_stack_input_of_xml i =
  let r_disable_validation = ref None in
  let r_deployment_config = ref None in
  let r_retain_except_on_create = ref None in
  let r_enable_termination_protection = ref None in
  let r_client_request_token = ref None in
  let r_tags = ref None in
  let r_stack_policy_ur_l = ref None in
  let r_stack_policy_body = ref None in
  let r_on_failure = ref None in
  let r_role_ar_n = ref None in
  let r_resource_types = ref None in
  let r_capabilities = ref None in
  let r_notification_ar_ns = ref None in
  let r_timeout_in_minutes = ref None in
  let r_rollback_configuration = ref None in
  let r_disable_rollback = ref None in
  let r_parameters = ref None in
  let r_template_ur_l = ref None in
  let r_template_body = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DisableValidation";
      "DeploymentConfig";
      "RetainExceptOnCreate";
      "EnableTerminationProtection";
      "ClientRequestToken";
      "Tags";
      "StackPolicyURL";
      "StackPolicyBody";
      "OnFailure";
      "RoleARN";
      "ResourceTypes";
      "Capabilities";
      "NotificationARNs";
      "TimeoutInMinutes";
      "RollbackConfiguration";
      "DisableRollback";
      "Parameters";
      "TemplateURL";
      "TemplateBody";
      "StackName";
    ] (fun tag _ ->
      match tag with
      | "DisableValidation" ->
          r_disable_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableValidation"
                 (fun i _ -> disable_validation_of_xml i)
                 ())
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | "RetainExceptOnCreate" ->
          r_retain_except_on_create :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RetainExceptOnCreate"
                 (fun i _ -> retain_except_on_create_of_xml i)
                 ())
      | "EnableTerminationProtection" ->
          r_enable_termination_protection :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EnableTerminationProtection"
                 (fun i _ -> enable_termination_protection_of_xml i)
                 ())
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "StackPolicyURL" ->
          r_stack_policy_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyURL"
                 (fun i _ -> stack_policy_ur_l_of_xml i)
                 ())
      | "StackPolicyBody" ->
          r_stack_policy_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackPolicyBody"
                 (fun i _ -> stack_policy_body_of_xml i)
                 ())
      | "OnFailure" ->
          r_on_failure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnFailure" (fun i _ -> on_failure_of_xml i) ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "ResourceTypes" ->
          r_resource_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_type_of_xml i)
                     ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
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
      | "RollbackConfiguration" ->
          r_rollback_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RollbackConfiguration"
                 (fun i _ -> rollback_configuration_of_xml i)
                 ())
      | "DisableRollback" ->
          r_disable_rollback :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableRollback"
                 (fun i _ -> disable_rollback_of_xml i)
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     disable_validation = ( ! ) r_disable_validation;
     deployment_config = ( ! ) r_deployment_config;
     retain_except_on_create = ( ! ) r_retain_except_on_create;
     enable_termination_protection = ( ! ) r_enable_termination_protection;
     client_request_token = ( ! ) r_client_request_token;
     tags = ( ! ) r_tags;
     stack_policy_ur_l = ( ! ) r_stack_policy_ur_l;
     stack_policy_body = ( ! ) r_stack_policy_body;
     on_failure = ( ! ) r_on_failure;
     role_ar_n = ( ! ) r_role_ar_n;
     resource_types = ( ! ) r_resource_types;
     capabilities = ( ! ) r_capabilities;
     notification_ar_ns = ( ! ) r_notification_ar_ns;
     timeout_in_minutes = ( ! ) r_timeout_in_minutes;
     rollback_configuration = ( ! ) r_rollback_configuration;
     disable_rollback = ( ! ) r_disable_rollback;
     parameters = ( ! ) r_parameters;
     template_ur_l = ( ! ) r_template_ur_l;
     template_body = ( ! ) r_template_body;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
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
  let r_template_configuration = ref None in
  let r_stack_name = ref None in
  let r_generated_template_name = ref None in
  let r_resources = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TemplateConfiguration"; "StackName"; "GeneratedTemplateName"; "Resources" ] (fun tag _ ->
      match tag with
      | "TemplateConfiguration" ->
          r_template_configuration :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateConfiguration"
                 (fun i _ -> template_configuration_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
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
                     (fun i _ -> resource_definition_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     template_configuration = ( ! ) r_template_configuration;
     stack_name = ( ! ) r_stack_name;
     generated_template_name =
       Smaws_Lib.Xml.Parse.required "GeneratedTemplateName" (( ! ) r_generated_template_name) i;
     resources = ( ! ) r_resources;
   }
    : create_generated_template_input)

let create_change_set_output_of_xml i =
  let r_stack_id = ref None in
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "StackId"; "Id" ] (fun tag _ ->
      match tag with
      | "StackId" ->
          r_stack_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "StackId" (fun i _ -> stack_id_of_xml i) ())
      | "Id" ->
          r_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> change_set_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ stack_id = ( ! ) r_stack_id; id = ( ! ) r_id } : create_change_set_output)

let change_set_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "IMPORT" -> IMPORT
   | "UPDATE" -> UPDATE
   | "CREATE" -> CREATE
   | _ -> failwith "unknown enum value"
    : change_set_type)

let create_change_set_input_of_xml i =
  let r_disable_validation = ref None in
  let r_deployment_config = ref None in
  let r_deployment_mode = ref None in
  let r_import_existing_resources = ref None in
  let r_on_stack_failure = ref None in
  let r_include_nested_stacks = ref None in
  let r_resources_to_import = ref None in
  let r_change_set_type = ref None in
  let r_description = ref None in
  let r_client_token = ref None in
  let r_change_set_name = ref None in
  let r_tags = ref None in
  let r_notification_ar_ns = ref None in
  let r_rollback_configuration = ref None in
  let r_role_ar_n = ref None in
  let r_resource_types = ref None in
  let r_capabilities = ref None in
  let r_parameters = ref None in
  let r_use_previous_template = ref None in
  let r_template_ur_l = ref None in
  let r_template_body = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DisableValidation";
      "DeploymentConfig";
      "DeploymentMode";
      "ImportExistingResources";
      "OnStackFailure";
      "IncludeNestedStacks";
      "ResourcesToImport";
      "ChangeSetType";
      "Description";
      "ClientToken";
      "ChangeSetName";
      "Tags";
      "NotificationARNs";
      "RollbackConfiguration";
      "RoleARN";
      "ResourceTypes";
      "Capabilities";
      "Parameters";
      "UsePreviousTemplate";
      "TemplateURL";
      "TemplateBody";
      "StackName";
    ] (fun tag _ ->
      match tag with
      | "DisableValidation" ->
          r_disable_validation :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DisableValidation"
                 (fun i _ -> disable_validation_of_xml i)
                 ())
      | "DeploymentConfig" ->
          r_deployment_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentConfig"
                 (fun i _ -> deployment_config_of_xml i)
                 ())
      | "DeploymentMode" ->
          r_deployment_mode :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DeploymentMode"
                 (fun i _ -> deployment_mode_of_xml i)
                 ())
      | "ImportExistingResources" ->
          r_import_existing_resources :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ImportExistingResources"
                 (fun i _ -> import_existing_resources_of_xml i)
                 ())
      | "OnStackFailure" ->
          r_on_stack_failure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OnStackFailure"
                 (fun i _ -> on_stack_failure_of_xml i)
                 ())
      | "IncludeNestedStacks" ->
          r_include_nested_stacks :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IncludeNestedStacks"
                 (fun i _ -> include_nested_stacks_of_xml i)
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
      | "ChangeSetType" ->
          r_change_set_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetType"
                 (fun i _ -> change_set_type_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ClientToken" ->
          r_client_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientToken"
                 (fun i _ -> client_token_of_xml i)
                 ())
      | "ChangeSetName" ->
          r_change_set_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ChangeSetName"
                 (fun i _ -> change_set_name_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
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
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "ResourceTypes" ->
          r_resource_types :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceTypes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_type_of_xml i)
                     ())
                 ())
      | "Capabilities" ->
          r_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Capabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> capability_of_xml i) ())
                 ())
      | "Parameters" ->
          r_parameters :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Parameters"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> parameter_of_xml i) ())
                 ())
      | "UsePreviousTemplate" ->
          r_use_previous_template :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UsePreviousTemplate"
                 (fun i _ -> use_previous_template_of_xml i)
                 ())
      | "TemplateURL" ->
          r_template_ur_l :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateURL"
                 (fun i _ -> template_ur_l_of_xml i)
                 ())
      | "TemplateBody" ->
          r_template_body :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TemplateBody"
                 (fun i _ -> template_body_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     disable_validation = ( ! ) r_disable_validation;
     deployment_config = ( ! ) r_deployment_config;
     deployment_mode = ( ! ) r_deployment_mode;
     import_existing_resources = ( ! ) r_import_existing_resources;
     on_stack_failure = ( ! ) r_on_stack_failure;
     include_nested_stacks = ( ! ) r_include_nested_stacks;
     resources_to_import = ( ! ) r_resources_to_import;
     change_set_type = ( ! ) r_change_set_type;
     description = ( ! ) r_description;
     client_token = ( ! ) r_client_token;
     change_set_name = Smaws_Lib.Xml.Parse.required "ChangeSetName" (( ! ) r_change_set_name) i;
     tags = ( ! ) r_tags;
     notification_ar_ns = ( ! ) r_notification_ar_ns;
     rollback_configuration = ( ! ) r_rollback_configuration;
     role_ar_n = ( ! ) r_role_ar_n;
     resource_types = ( ! ) r_resource_types;
     capabilities = ( ! ) r_capabilities;
     parameters = ( ! ) r_parameters;
     use_previous_template = ( ! ) r_use_previous_template;
     template_ur_l = ( ! ) r_template_ur_l;
     template_body = ( ! ) r_template_body;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : create_change_set_input)

let continue_update_rollback_output_of_xml i = ()

let continue_update_rollback_input_of_xml i =
  let r_client_request_token = ref None in
  let r_resources_to_skip = ref None in
  let r_role_ar_n = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ClientRequestToken"; "ResourcesToSkip"; "RoleARN"; "StackName" ] (fun tag _ ->
      match tag with
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "ResourcesToSkip" ->
          r_resources_to_skip :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourcesToSkip"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> resource_to_skip_of_xml i)
                     ())
                 ())
      | "RoleARN" ->
          r_role_ar_n :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "RoleARN" (fun i _ -> role_ar_n_of_xml i) ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName"
                 (fun i _ -> stack_name_or_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     client_request_token = ( ! ) r_client_request_token;
     resources_to_skip = ( ! ) r_resources_to_skip;
     role_ar_n = ( ! ) r_role_ar_n;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : continue_update_rollback_input)

let cancel_update_stack_input_of_xml i =
  let r_client_request_token = ref None in
  let r_stack_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ClientRequestToken"; "StackName" ] (fun tag _ ->
      match tag with
      | "ClientRequestToken" ->
          r_client_request_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ClientRequestToken"
                 (fun i _ -> client_request_token_of_xml i)
                 ())
      | "StackName" ->
          r_stack_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StackName" (fun i _ -> stack_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     client_request_token = ( ! ) r_client_request_token;
     stack_name = Smaws_Lib.Xml.Parse.required "StackName" (( ! ) r_stack_name) i;
   }
    : cancel_update_stack_input)

let batch_describe_type_configurations_error_of_xml i =
  let r_type_configuration_identifier = ref None in
  let r_error_message = ref None in
  let r_error_code = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TypeConfigurationIdentifier"; "ErrorMessage"; "ErrorCode" ] (fun tag _ ->
      match tag with
      | "TypeConfigurationIdentifier" ->
          r_type_configuration_identifier :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurationIdentifier"
                 (fun i _ -> type_configuration_identifier_of_xml i)
                 ())
      | "ErrorMessage" ->
          r_error_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorMessage"
                 (fun i _ -> error_message_of_xml i)
                 ())
      | "ErrorCode" ->
          r_error_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ErrorCode" (fun i _ -> error_code_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_configuration_identifier = ( ! ) r_type_configuration_identifier;
     error_message = ( ! ) r_error_message;
     error_code = ( ! ) r_error_code;
   }
    : batch_describe_type_configurations_error)

let batch_describe_type_configurations_errors_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> batch_describe_type_configurations_error_of_xml i)
    ()

let batch_describe_type_configurations_output_of_xml i =
  let r_type_configurations = ref None in
  let r_unprocessed_type_configurations = ref None in
  let r_errors = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TypeConfigurations"; "UnprocessedTypeConfigurations"; "Errors" ] (fun tag _ ->
      match tag with
      | "TypeConfigurations" ->
          r_type_configurations :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeConfigurations"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> type_configuration_details_of_xml i)
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
      | "Errors" ->
          r_errors :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Errors"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> batch_describe_type_configurations_error_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     type_configurations = ( ! ) r_type_configurations;
     unprocessed_type_configurations = ( ! ) r_unprocessed_type_configurations;
     errors = ( ! ) r_errors;
   }
    : batch_describe_type_configurations_output)

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

let activate_type_input_of_xml i =
  let r_major_version = ref None in
  let r_version_bump = ref None in
  let r_execution_role_arn = ref None in
  let r_logging_config = ref None in
  let r_auto_update = ref None in
  let r_type_name_alias = ref None in
  let r_type_name = ref None in
  let r_publisher_id = ref None in
  let r_public_type_arn = ref None in
  let r_type_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MajorVersion";
      "VersionBump";
      "ExecutionRoleArn";
      "LoggingConfig";
      "AutoUpdate";
      "TypeNameAlias";
      "TypeName";
      "PublisherId";
      "PublicTypeArn";
      "Type";
    ] (fun tag _ ->
      match tag with
      | "MajorVersion" ->
          r_major_version :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MajorVersion"
                 (fun i _ -> major_version_of_xml i)
                 ())
      | "VersionBump" ->
          r_version_bump :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "VersionBump"
                 (fun i _ -> version_bump_of_xml i)
                 ())
      | "ExecutionRoleArn" ->
          r_execution_role_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ExecutionRoleArn"
                 (fun i _ -> role_ar_n2_of_xml i)
                 ())
      | "LoggingConfig" ->
          r_logging_config :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoggingConfig"
                 (fun i _ -> logging_config_of_xml i)
                 ())
      | "AutoUpdate" ->
          r_auto_update :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AutoUpdate"
                 (fun i _ -> auto_update_of_xml i)
                 ())
      | "TypeNameAlias" ->
          r_type_name_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TypeNameAlias"
                 (fun i _ -> type_name_of_xml i)
                 ())
      | "TypeName" ->
          r_type_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TypeName" (fun i _ -> type_name_of_xml i) ())
      | "PublisherId" ->
          r_publisher_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublisherId"
                 (fun i _ -> publisher_id_of_xml i)
                 ())
      | "PublicTypeArn" ->
          r_public_type_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublicTypeArn"
                 (fun i _ -> third_party_type_arn_of_xml i)
                 ())
      | "Type" ->
          r_type_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Type" (fun i _ -> third_party_type_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     major_version = ( ! ) r_major_version;
     version_bump = ( ! ) r_version_bump;
     execution_role_arn = ( ! ) r_execution_role_arn;
     logging_config = ( ! ) r_logging_config;
     auto_update = ( ! ) r_auto_update;
     type_name_alias = ( ! ) r_type_name_alias;
     type_name = ( ! ) r_type_name;
     publisher_id = ( ! ) r_publisher_id;
     public_type_arn = ( ! ) r_public_type_arn;
     type_ = ( ! ) r_type_;
   }
    : activate_type_input)

let activate_organizations_access_output_of_xml i = ()
let activate_organizations_access_input_of_xml i = ()
