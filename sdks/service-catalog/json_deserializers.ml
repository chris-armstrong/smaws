open Smaws_Lib.Json.DeserializeHelpers
open Types

let verbose_of_yojson = bool_of_yojson
let user_arn_session_of_yojson = string_of_yojson
let user_arn_of_yojson = string_of_yojson
let use_previous_value_of_yojson = bool_of_yojson
let instruction_type_of_yojson = string_of_yojson
let instruction_value_of_yojson = string_of_yojson

let usage_instruction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key instruction_value_of_yojson "Value") _list path;
     type_ = option_of_yojson (value_for_key instruction_type_of_yojson "Type") _list path;
   }
    : usage_instruction)

let usage_instructions_of_yojson tree path = list_of_yojson usage_instruction_of_yojson tree path
let updated_time_of_yojson = timestamp_epoch_seconds_of_yojson
let tag_option_key_of_yojson = string_of_yojson
let tag_option_value_of_yojson = string_of_yojson
let tag_option_active_of_yojson = bool_of_yojson
let tag_option_id_of_yojson = string_of_yojson
let owner_of_yojson = string_of_yojson

let tag_option_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner = option_of_yojson (value_for_key owner_of_yojson "Owner") _list path;
     id = option_of_yojson (value_for_key tag_option_id_of_yojson "Id") _list path;
     active = option_of_yojson (value_for_key tag_option_active_of_yojson "Active") _list path;
     value = option_of_yojson (value_for_key tag_option_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key tag_option_key_of_yojson "Key") _list path;
   }
    : tag_option_detail)

let update_tag_option_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_option_detail =
       option_of_yojson (value_for_key tag_option_detail_of_yojson "TagOptionDetail") _list path;
   }
    : update_tag_option_output)

let update_tag_option_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active = option_of_yojson (value_for_key tag_option_active_of_yojson "Active") _list path;
     value = option_of_yojson (value_for_key tag_option_value_of_yojson "Value") _list path;
     id = value_for_key tag_option_id_of_yojson "Id" _list path;
   }
    : update_tag_option_input)

let error_message_of_yojson = string_of_yojson

let tag_option_not_migrated_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : tag_option_not_migrated_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let invalid_parameters_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_parameters_exception)

let duplicate_resource_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : duplicate_resource_exception)

let id_of_yojson = string_of_yojson
let service_action_name_of_yojson = string_of_yojson
let service_action_description_of_yojson = string_of_yojson

let service_action_definition_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SSM_AUTOMATION" -> SsmAutomation
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ServiceActionDefinitionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceActionDefinitionType")
     : service_action_definition_type)
    : service_action_definition_type)

let service_action_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     definition_type =
       option_of_yojson
         (value_for_key service_action_definition_type_of_yojson "DefinitionType")
         _list path;
     description =
       option_of_yojson
         (value_for_key service_action_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key service_action_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
   }
    : service_action_summary)

let service_action_definition_value_of_yojson = string_of_yojson

let service_action_definition_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "Parameters" -> Parameters
    | `String "AssumeRole" -> AssumeRole
    | `String "Version" -> Version
    | `String "Name" -> Name
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ServiceActionDefinitionKey" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceActionDefinitionKey")
     : service_action_definition_key)
    : service_action_definition_key)

let service_action_definition_map_of_yojson tree path =
  map_of_yojson service_action_definition_key_of_yojson service_action_definition_value_of_yojson
    tree path

let service_action_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     definition =
       option_of_yojson
         (value_for_key service_action_definition_map_of_yojson "Definition")
         _list path;
     service_action_summary =
       option_of_yojson
         (value_for_key service_action_summary_of_yojson "ServiceActionSummary")
         _list path;
   }
    : service_action_detail)

let update_service_action_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_action_detail =
       option_of_yojson
         (value_for_key service_action_detail_of_yojson "ServiceActionDetail")
         _list path;
   }
    : update_service_action_output)

let accept_language_of_yojson = string_of_yojson

let update_service_action_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     description =
       option_of_yojson
         (value_for_key service_action_description_of_yojson "Description")
         _list path;
     definition =
       option_of_yojson
         (value_for_key service_action_definition_map_of_yojson "Definition")
         _list path;
     name = option_of_yojson (value_for_key service_action_name_of_yojson "Name") _list path;
     id = value_for_key id_of_yojson "Id" _list path;
   }
    : update_service_action_input)

let account_id_of_yojson = string_of_yojson
let stack_set_accounts_of_yojson tree path = list_of_yojson account_id_of_yojson tree path
let region_of_yojson = string_of_yojson
let stack_set_regions_of_yojson tree path = list_of_yojson region_of_yojson tree path
let stack_set_failure_tolerance_count_of_yojson = int_of_yojson
let stack_set_failure_tolerance_percentage_of_yojson = int_of_yojson
let stack_set_max_concurrency_count_of_yojson = int_of_yojson
let stack_set_max_concurrency_percentage_of_yojson = int_of_yojson

let stack_set_operation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETE" -> DELETE
    | `String "UPDATE" -> UPDATE
    | `String "CREATE" -> CREATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StackSetOperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "StackSetOperationType")
     : stack_set_operation_type)
    : stack_set_operation_type)

let update_provisioning_preferences_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stack_set_operation_type =
       option_of_yojson
         (value_for_key stack_set_operation_type_of_yojson "StackSetOperationType")
         _list path;
     stack_set_max_concurrency_percentage =
       option_of_yojson
         (value_for_key stack_set_max_concurrency_percentage_of_yojson
            "StackSetMaxConcurrencyPercentage")
         _list path;
     stack_set_max_concurrency_count =
       option_of_yojson
         (value_for_key stack_set_max_concurrency_count_of_yojson "StackSetMaxConcurrencyCount")
         _list path;
     stack_set_failure_tolerance_percentage =
       option_of_yojson
         (value_for_key stack_set_failure_tolerance_percentage_of_yojson
            "StackSetFailureTolerancePercentage")
         _list path;
     stack_set_failure_tolerance_count =
       option_of_yojson
         (value_for_key stack_set_failure_tolerance_count_of_yojson "StackSetFailureToleranceCount")
         _list path;
     stack_set_regions =
       option_of_yojson (value_for_key stack_set_regions_of_yojson "StackSetRegions") _list path;
     stack_set_accounts =
       option_of_yojson (value_for_key stack_set_accounts_of_yojson "StackSetAccounts") _list path;
   }
    : update_provisioning_preferences)

let parameter_key_of_yojson = string_of_yojson
let parameter_value_of_yojson = string_of_yojson

let update_provisioning_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     use_previous_value =
       option_of_yojson (value_for_key use_previous_value_of_yojson "UsePreviousValue") _list path;
     value = option_of_yojson (value_for_key parameter_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key parameter_key_of_yojson "Key") _list path;
   }
    : update_provisioning_parameter)

let update_provisioning_parameters_of_yojson tree path =
  list_of_yojson update_provisioning_parameter_of_yojson tree path

let provisioning_artifact_name_of_yojson = string_of_yojson

let provisioning_artifact_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXTERNAL" -> EXTERNAL
    | `String "TERRAFORM_CLOUD" -> TERRAFORM_CLOUD
    | `String "TERRAFORM_OPEN_SOURCE" -> TERRAFORM_OPEN_SOURCE
    | `String "MARKETPLACE_CAR" -> MARKETPLACE_CAR
    | `String "MARKETPLACE_AMI" -> MARKETPLACE_AMI
    | `String "CLOUD_FORMATION_TEMPLATE" -> CLOUD_FORMATION_TEMPLATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProvisioningArtifactType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisioningArtifactType")
     : provisioning_artifact_type)
    : provisioning_artifact_type)

let creation_time_of_yojson = timestamp_epoch_seconds_of_yojson
let provisioning_artifact_active_of_yojson = bool_of_yojson

let provisioning_artifact_guidance_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEPRECATED" -> DEPRECATED
    | `String "DEFAULT" -> DEFAULT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProvisioningArtifactGuidance" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisioningArtifactGuidance")
     : provisioning_artifact_guidance)
    : provisioning_artifact_guidance)

let source_revision_of_yojson = string_of_yojson

let provisioning_artifact_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_revision =
       option_of_yojson (value_for_key source_revision_of_yojson "SourceRevision") _list path;
     guidance =
       option_of_yojson
         (value_for_key provisioning_artifact_guidance_of_yojson "Guidance")
         _list path;
     active =
       option_of_yojson (value_for_key provisioning_artifact_active_of_yojson "Active") _list path;
     created_time =
       option_of_yojson (value_for_key creation_time_of_yojson "CreatedTime") _list path;
     type_ = option_of_yojson (value_for_key provisioning_artifact_type_of_yojson "Type") _list path;
     description =
       option_of_yojson
         (value_for_key provisioning_artifact_name_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key provisioning_artifact_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
   }
    : provisioning_artifact_detail)

let provisioning_artifact_info_value_of_yojson = string_of_yojson
let provisioning_artifact_info_key_of_yojson = string_of_yojson

let provisioning_artifact_info_of_yojson tree path =
  map_of_yojson provisioning_artifact_info_key_of_yojson provisioning_artifact_info_value_of_yojson
    tree path

let status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "CREATING" -> CREATING
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Status" value)
    | _ -> raise (deserialize_wrong_type_error path "Status")
     : status)
    : status)

let update_provisioning_artifact_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     info = option_of_yojson (value_for_key provisioning_artifact_info_of_yojson "Info") _list path;
     provisioning_artifact_detail =
       option_of_yojson
         (value_for_key provisioning_artifact_detail_of_yojson "ProvisioningArtifactDetail")
         _list path;
   }
    : update_provisioning_artifact_output)

let provisioning_artifact_description_of_yojson = string_of_yojson

let update_provisioning_artifact_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     guidance =
       option_of_yojson
         (value_for_key provisioning_artifact_guidance_of_yojson "Guidance")
         _list path;
     active =
       option_of_yojson (value_for_key provisioning_artifact_active_of_yojson "Active") _list path;
     description =
       option_of_yojson
         (value_for_key provisioning_artifact_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key provisioning_artifact_name_of_yojson "Name") _list path;
     provisioning_artifact_id = value_for_key id_of_yojson "ProvisioningArtifactId" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : update_provisioning_artifact_input)

let property_value_of_yojson = string_of_yojson

let property_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "LAUNCH_ROLE" -> LaunchRole
    | `String "OWNER" -> Owner
    | `String value -> raise (deserialize_unknown_enum_value_error path "PropertyKey" value)
    | _ -> raise (deserialize_wrong_type_error path "PropertyKey")
     : property_key)
    : property_key)

let provisioned_product_properties_of_yojson tree path =
  map_of_yojson property_key_of_yojson property_value_of_yojson tree path

let record_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "IN_PROGRESS_IN_ERROR" -> IN_PROGRESS_IN_ERROR
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "CREATED" -> CREATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordStatus")
     : record_status)
    : record_status)

let update_provisioned_product_properties_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key record_status_of_yojson "Status") _list path;
     record_id = option_of_yojson (value_for_key id_of_yojson "RecordId") _list path;
     provisioned_product_properties =
       option_of_yojson
         (value_for_key provisioned_product_properties_of_yojson "ProvisionedProductProperties")
         _list path;
     provisioned_product_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisionedProductId") _list path;
   }
    : update_provisioned_product_properties_output)

let idempotency_token_of_yojson = string_of_yojson

let update_provisioned_product_properties_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     provisioned_product_properties =
       value_for_key provisioned_product_properties_of_yojson "ProvisionedProductProperties" _list
         path;
     provisioned_product_id = value_for_key id_of_yojson "ProvisionedProductId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : update_provisioned_product_properties_input)

let invalid_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_state_exception)

let provisioned_product_name_of_yojson = string_of_yojson
let created_time_of_yojson = timestamp_epoch_seconds_of_yojson
let provisioned_product_type_of_yojson = string_of_yojson
let record_type_of_yojson = string_of_yojson
let error_code_of_yojson = string_of_yojson
let error_description_of_yojson = string_of_yojson

let record_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key error_description_of_yojson "Description") _list path;
     code = option_of_yojson (value_for_key error_code_of_yojson "Code") _list path;
   }
    : record_error)

let record_errors_of_yojson tree path = list_of_yojson record_error_of_yojson tree path
let record_tag_key_of_yojson = string_of_yojson
let record_tag_value_of_yojson = string_of_yojson

let record_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key record_tag_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key record_tag_key_of_yojson "Key") _list path;
   }
    : record_tag)

let record_tags_of_yojson tree path = list_of_yojson record_tag_of_yojson tree path
let role_arn_of_yojson = string_of_yojson

let record_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     launch_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "LaunchRoleArn") _list path;
     record_tags = option_of_yojson (value_for_key record_tags_of_yojson "RecordTags") _list path;
     record_errors =
       option_of_yojson (value_for_key record_errors_of_yojson "RecordErrors") _list path;
     path_id = option_of_yojson (value_for_key id_of_yojson "PathId") _list path;
     provisioning_artifact_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisioningArtifactId") _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     provisioned_product_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisionedProductId") _list path;
     record_type = option_of_yojson (value_for_key record_type_of_yojson "RecordType") _list path;
     provisioned_product_type =
       option_of_yojson
         (value_for_key provisioned_product_type_of_yojson "ProvisionedProductType")
         _list path;
     updated_time = option_of_yojson (value_for_key updated_time_of_yojson "UpdatedTime") _list path;
     created_time = option_of_yojson (value_for_key created_time_of_yojson "CreatedTime") _list path;
     status = option_of_yojson (value_for_key record_status_of_yojson "Status") _list path;
     provisioned_product_name =
       option_of_yojson
         (value_for_key provisioned_product_name_of_yojson "ProvisionedProductName")
         _list path;
     record_id = option_of_yojson (value_for_key id_of_yojson "RecordId") _list path;
   }
    : record_detail)

let update_provisioned_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_detail =
       option_of_yojson (value_for_key record_detail_of_yojson "RecordDetail") _list path;
   }
    : update_provisioned_product_output)

let provisioned_product_name_or_arn_of_yojson = string_of_yojson
let product_view_name_of_yojson = string_of_yojson
let portfolio_display_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let update_provisioned_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = value_for_key idempotency_token_of_yojson "UpdateToken" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     provisioning_preferences =
       option_of_yojson
         (value_for_key update_provisioning_preferences_of_yojson "ProvisioningPreferences")
         _list path;
     provisioning_parameters =
       option_of_yojson
         (value_for_key update_provisioning_parameters_of_yojson "ProvisioningParameters")
         _list path;
     path_name =
       option_of_yojson (value_for_key portfolio_display_name_of_yojson "PathName") _list path;
     path_id = option_of_yojson (value_for_key id_of_yojson "PathId") _list path;
     provisioning_artifact_name =
       option_of_yojson
         (value_for_key provisioning_artifact_name_of_yojson "ProvisioningArtifactName")
         _list path;
     provisioning_artifact_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisioningArtifactId") _list path;
     product_name =
       option_of_yojson (value_for_key product_view_name_of_yojson "ProductName") _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     provisioned_product_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisionedProductId") _list path;
     provisioned_product_name =
       option_of_yojson
         (value_for_key provisioned_product_name_or_arn_of_yojson "ProvisionedProductName")
         _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : update_provisioned_product_input)

let product_view_owner_of_yojson = string_of_yojson
let product_view_short_description_of_yojson = string_of_yojson

let product_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXTERNAL" -> EXTERNAL
    | `String "TERRAFORM_CLOUD" -> TERRAFORM_CLOUD
    | `String "TERRAFORM_OPEN_SOURCE" -> TERRAFORM_OPEN_SOURCE
    | `String "MARKETPLACE" -> MARKETPLACE
    | `String "CLOUD_FORMATION_TEMPLATE" -> CLOUD_FORMATION_TEMPLATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProductType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProductType")
     : product_type)
    : product_type)

let product_view_distributor_of_yojson = string_of_yojson
let has_default_path_of_yojson = bool_of_yojson
let support_email_of_yojson = string_of_yojson
let support_description_of_yojson = string_of_yojson
let support_url_of_yojson = string_of_yojson

let product_view_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     support_url = option_of_yojson (value_for_key support_url_of_yojson "SupportUrl") _list path;
     support_description =
       option_of_yojson
         (value_for_key support_description_of_yojson "SupportDescription")
         _list path;
     support_email =
       option_of_yojson (value_for_key support_email_of_yojson "SupportEmail") _list path;
     has_default_path =
       option_of_yojson (value_for_key has_default_path_of_yojson "HasDefaultPath") _list path;
     distributor =
       option_of_yojson (value_for_key product_view_distributor_of_yojson "Distributor") _list path;
     type_ = option_of_yojson (value_for_key product_type_of_yojson "Type") _list path;
     short_description =
       option_of_yojson
         (value_for_key product_view_short_description_of_yojson "ShortDescription")
         _list path;
     owner = option_of_yojson (value_for_key product_view_owner_of_yojson "Owner") _list path;
     name = option_of_yojson (value_for_key product_view_name_of_yojson "Name") _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
   }
    : product_view_summary)

let resource_ar_n_of_yojson = string_of_yojson

let source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CODESTAR" -> CODESTAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "SourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceType")
     : source_type)
    : source_type)

let code_star_connection_arn_of_yojson = string_of_yojson
let repository_of_yojson = string_of_yojson
let repository_branch_of_yojson = string_of_yojson
let repository_artifact_path_of_yojson = string_of_yojson

let code_star_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     artifact_path = value_for_key repository_artifact_path_of_yojson "ArtifactPath" _list path;
     branch = value_for_key repository_branch_of_yojson "Branch" _list path;
     repository = value_for_key repository_of_yojson "Repository" _list path;
     connection_arn = value_for_key code_star_connection_arn_of_yojson "ConnectionArn" _list path;
   }
    : code_star_parameters)

let source_connection_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code_star =
       option_of_yojson (value_for_key code_star_parameters_of_yojson "CodeStar") _list path;
   }
    : source_connection_parameters)

let last_sync_time_of_yojson = timestamp_epoch_seconds_of_yojson

let last_sync_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "LastSyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LastSyncStatus")
     : last_sync_status)
    : last_sync_status)

let last_sync_status_message_of_yojson = string_of_yojson
let last_successful_sync_time_of_yojson = timestamp_epoch_seconds_of_yojson

let last_sync_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_successful_sync_provisioning_artifact_id =
       option_of_yojson
         (value_for_key id_of_yojson "LastSuccessfulSyncProvisioningArtifactId")
         _list path;
     last_successful_sync_time =
       option_of_yojson
         (value_for_key last_successful_sync_time_of_yojson "LastSuccessfulSyncTime")
         _list path;
     last_sync_status_message =
       option_of_yojson
         (value_for_key last_sync_status_message_of_yojson "LastSyncStatusMessage")
         _list path;
     last_sync_status =
       option_of_yojson (value_for_key last_sync_status_of_yojson "LastSyncStatus") _list path;
     last_sync_time =
       option_of_yojson (value_for_key last_sync_time_of_yojson "LastSyncTime") _list path;
   }
    : last_sync)

let source_connection_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_sync = option_of_yojson (value_for_key last_sync_of_yojson "LastSync") _list path;
     connection_parameters =
       option_of_yojson
         (value_for_key source_connection_parameters_of_yojson "ConnectionParameters")
         _list path;
     type_ = option_of_yojson (value_for_key source_type_of_yojson "Type") _list path;
   }
    : source_connection_detail)

let product_view_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_connection =
       option_of_yojson
         (value_for_key source_connection_detail_of_yojson "SourceConnection")
         _list path;
     created_time = option_of_yojson (value_for_key created_time_of_yojson "CreatedTime") _list path;
     product_ar_n = option_of_yojson (value_for_key resource_ar_n_of_yojson "ProductARN") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     product_view_summary =
       option_of_yojson
         (value_for_key product_view_summary_of_yojson "ProductViewSummary")
         _list path;
   }
    : product_view_detail)

let update_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     product_view_detail =
       option_of_yojson (value_for_key product_view_detail_of_yojson "ProductViewDetail") _list path;
   }
    : update_product_output)

let add_tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let source_connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_parameters =
       value_for_key source_connection_parameters_of_yojson "ConnectionParameters" _list path;
     type_ = option_of_yojson (value_for_key source_type_of_yojson "Type") _list path;
   }
    : source_connection)

let update_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_connection =
       option_of_yojson (value_for_key source_connection_of_yojson "SourceConnection") _list path;
     remove_tags = option_of_yojson (value_for_key tag_keys_of_yojson "RemoveTags") _list path;
     add_tags = option_of_yojson (value_for_key add_tags_of_yojson "AddTags") _list path;
     support_url = option_of_yojson (value_for_key support_url_of_yojson "SupportUrl") _list path;
     support_email =
       option_of_yojson (value_for_key support_email_of_yojson "SupportEmail") _list path;
     support_description =
       option_of_yojson
         (value_for_key support_description_of_yojson "SupportDescription")
         _list path;
     distributor =
       option_of_yojson (value_for_key product_view_owner_of_yojson "Distributor") _list path;
     description =
       option_of_yojson
         (value_for_key product_view_short_description_of_yojson "Description")
         _list path;
     owner = option_of_yojson (value_for_key product_view_owner_of_yojson "Owner") _list path;
     name = option_of_yojson (value_for_key product_view_name_of_yojson "Name") _list path;
     id = value_for_key id_of_yojson "Id" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : update_product_input)

let share_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "COMPLETED_WITH_ERRORS" -> COMPLETED_WITH_ERRORS
    | `String "COMPLETED" -> COMPLETED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "NOT_STARTED" -> NOT_STARTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShareStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ShareStatus")
     : share_status)
    : share_status)

let update_portfolio_share_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key share_status_of_yojson "Status") _list path;
     portfolio_share_token =
       option_of_yojson (value_for_key id_of_yojson "PortfolioShareToken") _list path;
   }
    : update_portfolio_share_output)

let organization_node_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String "ORGANIZATIONAL_UNIT" -> ORGANIZATIONAL_UNIT
    | `String "ORGANIZATION" -> ORGANIZATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OrganizationNodeType" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationNodeType")
     : organization_node_type)
    : organization_node_type)

let organization_node_value_of_yojson = string_of_yojson

let organization_node_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key organization_node_value_of_yojson "Value") _list path;
     type_ = option_of_yojson (value_for_key organization_node_type_of_yojson "Type") _list path;
   }
    : organization_node)

let nullable_boolean_of_yojson = bool_of_yojson

let update_portfolio_share_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     share_principals =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "SharePrincipals") _list path;
     share_tag_options =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "ShareTagOptions") _list path;
     organization_node =
       option_of_yojson (value_for_key organization_node_of_yojson "OrganizationNode") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : update_portfolio_share_input)

let operation_not_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : operation_not_supported_exception)

let portfolio_description_of_yojson = string_of_yojson
let provider_name_of_yojson = string_of_yojson

let portfolio_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provider_name =
       option_of_yojson (value_for_key provider_name_of_yojson "ProviderName") _list path;
     created_time =
       option_of_yojson (value_for_key creation_time_of_yojson "CreatedTime") _list path;
     description =
       option_of_yojson (value_for_key portfolio_description_of_yojson "Description") _list path;
     display_name =
       option_of_yojson (value_for_key portfolio_display_name_of_yojson "DisplayName") _list path;
     ar_n = option_of_yojson (value_for_key resource_ar_n_of_yojson "ARN") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
   }
    : portfolio_detail)

let update_portfolio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     portfolio_detail =
       option_of_yojson (value_for_key portfolio_detail_of_yojson "PortfolioDetail") _list path;
   }
    : update_portfolio_output)

let update_portfolio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remove_tags = option_of_yojson (value_for_key tag_keys_of_yojson "RemoveTags") _list path;
     add_tags = option_of_yojson (value_for_key add_tags_of_yojson "AddTags") _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_of_yojson "ProviderName") _list path;
     description =
       option_of_yojson (value_for_key portfolio_description_of_yojson "Description") _list path;
     display_name =
       option_of_yojson (value_for_key portfolio_display_name_of_yojson "DisplayName") _list path;
     id = value_for_key id_of_yojson "Id" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : update_portfolio_input)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let constraint_type_of_yojson = string_of_yojson
let constraint_description_of_yojson = string_of_yojson

let constraint_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     portfolio_id = option_of_yojson (value_for_key id_of_yojson "PortfolioId") _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     owner = option_of_yojson (value_for_key account_id_of_yojson "Owner") _list path;
     description =
       option_of_yojson (value_for_key constraint_description_of_yojson "Description") _list path;
     type_ = option_of_yojson (value_for_key constraint_type_of_yojson "Type") _list path;
     constraint_id = option_of_yojson (value_for_key id_of_yojson "ConstraintId") _list path;
   }
    : constraint_detail)

let constraint_parameters_of_yojson = string_of_yojson

let update_constraint_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     constraint_parameters =
       option_of_yojson
         (value_for_key constraint_parameters_of_yojson "ConstraintParameters")
         _list path;
     constraint_detail =
       option_of_yojson (value_for_key constraint_detail_of_yojson "ConstraintDetail") _list path;
   }
    : update_constraint_output)

let update_constraint_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters =
       option_of_yojson (value_for_key constraint_parameters_of_yojson "Parameters") _list path;
     description =
       option_of_yojson (value_for_key constraint_description_of_yojson "Description") _list path;
     id = value_for_key id_of_yojson "Id" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : update_constraint_input)

let unique_tag_value_of_yojson = string_of_yojson
let unique_tag_key_of_yojson = string_of_yojson

let unique_tag_resource_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key unique_tag_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key unique_tag_key_of_yojson "Key") _list path;
   }
    : unique_tag_resource_identifier)

let total_results_count_of_yojson = int_of_yojson

let terminate_provisioned_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_detail =
       option_of_yojson (value_for_key record_detail_of_yojson "RecordDetail") _list path;
   }
    : terminate_provisioned_product_output)

let ignore_errors_of_yojson = bool_of_yojson
let retain_physical_resources_of_yojson = bool_of_yojson

let terminate_provisioned_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retain_physical_resources =
       option_of_yojson
         (value_for_key retain_physical_resources_of_yojson "RetainPhysicalResources")
         _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     ignore_errors =
       option_of_yojson (value_for_key ignore_errors_of_yojson "IgnoreErrors") _list path;
     terminate_token = value_for_key idempotency_token_of_yojson "TerminateToken" _list path;
     provisioned_product_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisionedProductId") _list path;
     provisioned_product_name =
       option_of_yojson
         (value_for_key provisioned_product_name_or_arn_of_yojson "ProvisionedProductName")
         _list path;
   }
    : terminate_provisioned_product_input)

let tag_option_values_of_yojson tree path = list_of_yojson tag_option_value_of_yojson tree path

let tag_option_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = option_of_yojson (value_for_key tag_option_values_of_yojson "Values") _list path;
     key = option_of_yojson (value_for_key tag_option_key_of_yojson "Key") _list path;
   }
    : tag_option_summary)

let tag_option_summaries_of_yojson tree path = list_of_yojson tag_option_summary_of_yojson tree path
let tag_option_details_of_yojson tree path = list_of_yojson tag_option_detail_of_yojson tree path
let successful_shares_of_yojson tree path = list_of_yojson account_id_of_yojson tree path
let string__of_yojson = string_of_yojson
let status_message_of_yojson = string_of_yojson
let status_detail_of_yojson = string_of_yojson

let stack_instance_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "INOPERABLE" -> INOPERABLE
    | `String "OUTDATED" -> OUTDATED
    | `String "CURRENT" -> CURRENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "StackInstanceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StackInstanceStatus")
     : stack_instance_status)
    : stack_instance_status)

let stack_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stack_instance_status =
       option_of_yojson
         (value_for_key stack_instance_status_of_yojson "StackInstanceStatus")
         _list path;
     region = option_of_yojson (value_for_key region_of_yojson "Region") _list path;
     account = option_of_yojson (value_for_key account_id_of_yojson "Account") _list path;
   }
    : stack_instance)

let stack_instances_of_yojson tree path = list_of_yojson stack_instance_of_yojson tree path
let provisioning_artifact_property_value_of_yojson = string_of_yojson

let provisioning_artifact_property_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Id" -> Id
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProvisioningArtifactPropertyName" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisioningArtifactPropertyName")
     : provisioning_artifact_property_name)
    : provisioning_artifact_property_name)

let source_provisioning_artifact_properties_map_of_yojson tree path =
  map_of_yojson provisioning_artifact_property_name_of_yojson
    provisioning_artifact_property_value_of_yojson tree path

let source_provisioning_artifact_properties_of_yojson tree path =
  list_of_yojson source_provisioning_artifact_properties_map_of_yojson tree path

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "DESCENDING" -> DESCENDING
    | `String "ASCENDING" -> ASCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let sort_field_of_yojson = string_of_yojson
let namespaces_of_yojson tree path = list_of_yojson account_id_of_yojson tree path
let message_of_yojson = string_of_yojson
let error_of_yojson = string_of_yojson

let share_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key error_of_yojson "Error") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     accounts = option_of_yojson (value_for_key namespaces_of_yojson "Accounts") _list path;
   }
    : share_error)

let share_errors_of_yojson tree path = list_of_yojson share_error_of_yojson tree path

let share_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     share_errors = option_of_yojson (value_for_key share_errors_of_yojson "ShareErrors") _list path;
     successful_shares =
       option_of_yojson (value_for_key successful_shares_of_yojson "SuccessfulShares") _list path;
   }
    : share_details)

let service_action_summaries_of_yojson tree path =
  list_of_yojson service_action_summary_of_yojson tree path

let service_action_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning_artifact_id = value_for_key id_of_yojson "ProvisioningArtifactId" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     service_action_id = value_for_key id_of_yojson "ServiceActionId" _list path;
   }
    : service_action_association)

let service_action_associations_of_yojson tree path =
  list_of_yojson service_action_association_of_yojson tree path

let service_action_association_error_message_of_yojson = string_of_yojson

let service_action_association_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVALID_PARAMETER" -> InvalidParameterException
    | `String "THROTTLING" -> ThrottlingException
    | `String "RESOURCE_NOT_FOUND" -> ResourceNotFoundException
    | `String "LIMIT_EXCEEDED" -> LimitExceededException
    | `String "INTERNAL_FAILURE" -> InternalFailure
    | `String "DUPLICATE_RESOURCE" -> DuplicateResourceException
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ServiceActionAssociationErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceActionAssociationErrorCode")
     : service_action_association_error_code)
    : service_action_association_error_code)

let search_provisioned_products_page_size_of_yojson = int_of_yojson

let provisioned_product_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PLAN_IN_PROGRESS" -> PLAN_IN_PROGRESS
    | `String "ERROR" -> ERROR
    | `String "TAINTED" -> TAINTED
    | `String "UNDER_CHANGE" -> UNDER_CHANGE
    | `String "AVAILABLE" -> AVAILABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProvisionedProductStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisionedProductStatus")
     : provisioned_product_status)
    : provisioned_product_status)

let provisioned_product_status_message_of_yojson = string_of_yojson
let physical_id_of_yojson = string_of_yojson

let provisioned_product_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_arn_session =
       option_of_yojson (value_for_key user_arn_session_of_yojson "UserArnSession") _list path;
     user_arn = option_of_yojson (value_for_key user_arn_of_yojson "UserArn") _list path;
     provisioning_artifact_name =
       option_of_yojson
         (value_for_key provisioning_artifact_name_of_yojson "ProvisioningArtifactName")
         _list path;
     provisioning_artifact_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisioningArtifactId") _list path;
     product_name =
       option_of_yojson (value_for_key product_view_name_of_yojson "ProductName") _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     physical_id = option_of_yojson (value_for_key physical_id_of_yojson "PhysicalId") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     last_successful_provisioning_record_id =
       option_of_yojson (value_for_key id_of_yojson "LastSuccessfulProvisioningRecordId") _list path;
     last_provisioning_record_id =
       option_of_yojson (value_for_key id_of_yojson "LastProvisioningRecordId") _list path;
     last_record_id = option_of_yojson (value_for_key id_of_yojson "LastRecordId") _list path;
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     created_time = option_of_yojson (value_for_key created_time_of_yojson "CreatedTime") _list path;
     status_message =
       option_of_yojson
         (value_for_key provisioned_product_status_message_of_yojson "StatusMessage")
         _list path;
     status =
       option_of_yojson (value_for_key provisioned_product_status_of_yojson "Status") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
     type_ = option_of_yojson (value_for_key provisioned_product_type_of_yojson "Type") _list path;
     arn =
       option_of_yojson (value_for_key provisioned_product_name_or_arn_of_yojson "Arn") _list path;
     name =
       option_of_yojson (value_for_key provisioned_product_name_or_arn_of_yojson "Name") _list path;
   }
    : provisioned_product_attribute)

let provisioned_product_attributes_of_yojson tree path =
  list_of_yojson provisioned_product_attribute_of_yojson tree path

let page_token_of_yojson = string_of_yojson

let search_provisioned_products_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     total_results_count =
       option_of_yojson (value_for_key total_results_count_of_yojson "TotalResultsCount") _list path;
     provisioned_products =
       option_of_yojson
         (value_for_key provisioned_product_attributes_of_yojson "ProvisionedProducts")
         _list path;
   }
    : search_provisioned_products_output)

let access_level_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "User" -> USER
    | `String "Role" -> ROLE
    | `String "Account" -> ACCOUNT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccessLevelFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessLevelFilterKey")
     : access_level_filter_key)
    : access_level_filter_key)

let access_level_filter_value_of_yojson = string_of_yojson

let access_level_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key access_level_filter_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key access_level_filter_key_of_yojson "Key") _list path;
   }
    : access_level_filter)

let provisioned_product_view_filter_value_of_yojson = string_of_yojson

let provisioned_product_view_filter_values_of_yojson tree path =
  list_of_yojson provisioned_product_view_filter_value_of_yojson tree path

let provisioned_product_view_filter_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "SearchQuery" -> SearchQuery
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProvisionedProductViewFilterBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisionedProductViewFilterBy")
     : provisioned_product_view_filter_by)
    : provisioned_product_view_filter_by)

let provisioned_product_filters_of_yojson tree path =
  map_of_yojson provisioned_product_view_filter_by_of_yojson
    provisioned_product_view_filter_values_of_yojson tree path

let search_provisioned_products_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size =
       option_of_yojson
         (value_for_key search_provisioned_products_page_size_of_yojson "PageSize")
         _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     sort_by = option_of_yojson (value_for_key sort_field_of_yojson "SortBy") _list path;
     filters =
       option_of_yojson (value_for_key provisioned_product_filters_of_yojson "Filters") _list path;
     access_level_filter =
       option_of_yojson (value_for_key access_level_filter_of_yojson "AccessLevelFilter") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : search_provisioned_products_input)

let product_view_summaries_of_yojson tree path =
  list_of_yojson product_view_summary_of_yojson tree path

let attribute_value_of_yojson = string_of_yojson
let approximate_count_of_yojson = int_of_yojson

let product_view_aggregation_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approximate_count =
       option_of_yojson (value_for_key approximate_count_of_yojson "ApproximateCount") _list path;
     value = option_of_yojson (value_for_key attribute_value_of_yojson "Value") _list path;
   }
    : product_view_aggregation_value)

let product_view_aggregation_values_of_yojson tree path =
  list_of_yojson product_view_aggregation_value_of_yojson tree path

let product_view_aggregation_type_of_yojson = string_of_yojson

let product_view_aggregations_of_yojson tree path =
  map_of_yojson product_view_aggregation_type_of_yojson product_view_aggregation_values_of_yojson
    tree path

let search_products_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     product_view_aggregations =
       option_of_yojson
         (value_for_key product_view_aggregations_of_yojson "ProductViewAggregations")
         _list path;
     product_view_summaries =
       option_of_yojson
         (value_for_key product_view_summaries_of_yojson "ProductViewSummaries")
         _list path;
   }
    : search_products_output)

let product_view_filter_value_of_yojson = string_of_yojson

let product_view_filter_values_of_yojson tree path =
  list_of_yojson product_view_filter_value_of_yojson tree path

let product_view_filter_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "SourceProductId" -> SourceProductId
    | `String "ProductType" -> ProductType
    | `String "Owner" -> Owner
    | `String "FullTextSearch" -> FullTextSearch
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProductViewFilterBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ProductViewFilterBy")
     : product_view_filter_by)
    : product_view_filter_by)

let product_view_filters_of_yojson tree path =
  map_of_yojson product_view_filter_by_of_yojson product_view_filter_values_of_yojson tree path

let page_size_max100_of_yojson = int_of_yojson

let product_view_sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreationDate" -> CreationDate
    | `String "VersionCount" -> VersionCount
    | `String "Title" -> Title
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProductViewSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ProductViewSortBy")
     : product_view_sort_by)
    : product_view_sort_by)

let search_products_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     sort_by = option_of_yojson (value_for_key product_view_sort_by_of_yojson "SortBy") _list path;
     page_size = option_of_yojson (value_for_key page_size_max100_of_yojson "PageSize") _list path;
     filters = option_of_yojson (value_for_key product_view_filters_of_yojson "Filters") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : search_products_input)

let product_view_details_of_yojson tree path =
  list_of_yojson product_view_detail_of_yojson tree path

let search_products_as_admin_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     product_view_details =
       option_of_yojson
         (value_for_key product_view_details_of_yojson "ProductViewDetails")
         _list path;
   }
    : search_products_as_admin_output)

let page_size_of_yojson = int_of_yojson

let product_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProductSource" value)
    | _ -> raise (deserialize_wrong_type_error path "ProductSource")
     : product_source)
    : product_source)

let search_products_as_admin_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     product_source =
       option_of_yojson (value_for_key product_source_of_yojson "ProductSource") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     sort_by = option_of_yojson (value_for_key product_view_sort_by_of_yojson "SortBy") _list path;
     filters = option_of_yojson (value_for_key product_view_filters_of_yojson "Filters") _list path;
     portfolio_id = option_of_yojson (value_for_key id_of_yojson "PortfolioId") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : search_products_as_admin_input)

let search_filter_value_of_yojson = string_of_yojson
let search_filter_key_of_yojson = string_of_yojson

let resource_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "TAGS" -> TAGS
    | `String "DELETIONPOLICY" -> DELETIONPOLICY
    | `String "UPDATEPOLICY" -> UPDATEPOLICY
    | `String "CREATIONPOLICY" -> CREATIONPOLICY
    | `String "METADATA" -> METADATA
    | `String "PROPERTIES" -> PROPERTIES
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceAttribute")
     : resource_attribute)
    : resource_attribute)

let scope_of_yojson tree path = list_of_yojson resource_attribute_of_yojson tree path
let provisioned_product_id_of_yojson = string_of_yojson
let last_request_id_of_yojson = string_of_yojson

let provisioned_product_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     launch_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "LaunchRoleArn") _list path;
     provisioning_artifact_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisioningArtifactId") _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     last_successful_provisioning_record_id =
       option_of_yojson (value_for_key id_of_yojson "LastSuccessfulProvisioningRecordId") _list path;
     last_provisioning_record_id =
       option_of_yojson (value_for_key id_of_yojson "LastProvisioningRecordId") _list path;
     last_record_id =
       option_of_yojson (value_for_key last_request_id_of_yojson "LastRecordId") _list path;
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     created_time = option_of_yojson (value_for_key created_time_of_yojson "CreatedTime") _list path;
     status_message =
       option_of_yojson
         (value_for_key provisioned_product_status_message_of_yojson "StatusMessage")
         _list path;
     status =
       option_of_yojson (value_for_key provisioned_product_status_of_yojson "Status") _list path;
     id = option_of_yojson (value_for_key provisioned_product_id_of_yojson "Id") _list path;
     type_ = option_of_yojson (value_for_key provisioned_product_type_of_yojson "Type") _list path;
     arn =
       option_of_yojson (value_for_key provisioned_product_name_or_arn_of_yojson "Arn") _list path;
     name =
       option_of_yojson (value_for_key provisioned_product_name_or_arn_of_yojson "Name") _list path;
   }
    : provisioned_product_detail)

let provisioned_product_details_of_yojson tree path =
  list_of_yojson provisioned_product_detail_of_yojson tree path

let scan_provisioned_products_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     provisioned_products =
       option_of_yojson
         (value_for_key provisioned_product_details_of_yojson "ProvisionedProducts")
         _list path;
   }
    : scan_provisioned_products_output)

let scan_provisioned_products_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     access_level_filter =
       option_of_yojson (value_for_key access_level_filter_of_yojson "AccessLevelFilter") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : scan_provisioned_products_input)

let resource_type_of_yojson = string_of_yojson
let property_name_of_yojson = string_of_yojson

let requires_recreation_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALWAYS" -> ALWAYS
    | `String "CONDITIONALLY" -> CONDITIONALLY
    | `String "NEVER" -> NEVER
    | `String value -> raise (deserialize_unknown_enum_value_error path "RequiresRecreation" value)
    | _ -> raise (deserialize_wrong_type_error path "RequiresRecreation")
     : requires_recreation)
    : requires_recreation)

let resource_target_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requires_recreation =
       option_of_yojson
         (value_for_key requires_recreation_of_yojson "RequiresRecreation")
         _list path;
     name = option_of_yojson (value_for_key property_name_of_yojson "Name") _list path;
     attribute =
       option_of_yojson (value_for_key resource_attribute_of_yojson "Attribute") _list path;
   }
    : resource_target_definition)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_in_use_exception)

let resource_id_of_yojson = string_of_yojson
let resource_detail_id_of_yojson = string_of_yojson
let resource_detail_ar_n_of_yojson = string_of_yojson
let resource_detail_name_of_yojson = string_of_yojson
let resource_detail_description_of_yojson = string_of_yojson
let resource_detail_created_time_of_yojson = timestamp_epoch_seconds_of_yojson

let resource_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_time =
       option_of_yojson
         (value_for_key resource_detail_created_time_of_yojson "CreatedTime")
         _list path;
     description =
       option_of_yojson
         (value_for_key resource_detail_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key resource_detail_name_of_yojson "Name") _list path;
     ar_n = option_of_yojson (value_for_key resource_detail_ar_n_of_yojson "ARN") _list path;
     id = option_of_yojson (value_for_key resource_detail_id_of_yojson "Id") _list path;
   }
    : resource_detail)

let resource_details_of_yojson tree path = list_of_yojson resource_detail_of_yojson tree path

let change_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "REMOVE" -> REMOVE
    | `String "MODIFY" -> MODIFY
    | `String "ADD" -> ADD
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChangeAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ChangeAction")
     : change_action)
    : change_action)

let logical_resource_id_of_yojson = string_of_yojson
let physical_resource_id_of_yojson = string_of_yojson
let plan_resource_type_of_yojson = string_of_yojson

let replacement_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONDITIONAL" -> CONDITIONAL
    | `String "FALSE" -> FALSE
    | `String "TRUE" -> TRUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Replacement" value)
    | _ -> raise (deserialize_wrong_type_error path "Replacement")
     : replacement)
    : replacement)

let evaluation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DYNAMIC" -> DYNAMIC
    | `String "STATIC" -> STATIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "EvaluationType" value)
    | _ -> raise (deserialize_wrong_type_error path "EvaluationType")
     : evaluation_type)
    : evaluation_type)

let causing_entity_of_yojson = string_of_yojson

let resource_change_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     causing_entity =
       option_of_yojson (value_for_key causing_entity_of_yojson "CausingEntity") _list path;
     evaluation = option_of_yojson (value_for_key evaluation_type_of_yojson "Evaluation") _list path;
     target =
       option_of_yojson (value_for_key resource_target_definition_of_yojson "Target") _list path;
   }
    : resource_change_detail)

let resource_change_details_of_yojson tree path =
  list_of_yojson resource_change_detail_of_yojson tree path

let resource_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     details =
       option_of_yojson (value_for_key resource_change_details_of_yojson "Details") _list path;
     scope = option_of_yojson (value_for_key scope_of_yojson "Scope") _list path;
     replacement = option_of_yojson (value_for_key replacement_of_yojson "Replacement") _list path;
     resource_type =
       option_of_yojson (value_for_key plan_resource_type_of_yojson "ResourceType") _list path;
     physical_resource_id =
       option_of_yojson
         (value_for_key physical_resource_id_of_yojson "PhysicalResourceId")
         _list path;
     logical_resource_id =
       option_of_yojson (value_for_key logical_resource_id_of_yojson "LogicalResourceId") _list path;
     action = option_of_yojson (value_for_key change_action_of_yojson "Action") _list path;
   }
    : resource_change)

let resource_changes_of_yojson tree path = list_of_yojson resource_change_of_yojson tree path

let reject_portfolio_share_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let portfolio_share_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_ORGANIZATIONS" -> AWS_ORGANIZATIONS
    | `String "AWS_SERVICECATALOG" -> AWS_SERVICECATALOG
    | `String "IMPORTED" -> IMPORTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "PortfolioShareType" value)
    | _ -> raise (deserialize_wrong_type_error path "PortfolioShareType")
     : portfolio_share_type)
    : portfolio_share_type)

let reject_portfolio_share_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     portfolio_share_type =
       option_of_yojson
         (value_for_key portfolio_share_type_of_yojson "PortfolioShareType")
         _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : reject_portfolio_share_input)

let output_key_of_yojson = string_of_yojson
let output_value_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson

let record_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     output_value = option_of_yojson (value_for_key output_value_of_yojson "OutputValue") _list path;
     output_key = option_of_yojson (value_for_key output_key_of_yojson "OutputKey") _list path;
   }
    : record_output)

let record_outputs_of_yojson tree path = list_of_yojson record_output_of_yojson tree path
let record_details_of_yojson tree path = list_of_yojson record_detail_of_yojson tree path

let provisioning_preferences_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stack_set_max_concurrency_percentage =
       option_of_yojson
         (value_for_key stack_set_max_concurrency_percentage_of_yojson
            "StackSetMaxConcurrencyPercentage")
         _list path;
     stack_set_max_concurrency_count =
       option_of_yojson
         (value_for_key stack_set_max_concurrency_count_of_yojson "StackSetMaxConcurrencyCount")
         _list path;
     stack_set_failure_tolerance_percentage =
       option_of_yojson
         (value_for_key stack_set_failure_tolerance_percentage_of_yojson
            "StackSetFailureTolerancePercentage")
         _list path;
     stack_set_failure_tolerance_count =
       option_of_yojson
         (value_for_key stack_set_failure_tolerance_count_of_yojson "StackSetFailureToleranceCount")
         _list path;
     stack_set_regions =
       option_of_yojson (value_for_key stack_set_regions_of_yojson "StackSetRegions") _list path;
     stack_set_accounts =
       option_of_yojson (value_for_key stack_set_accounts_of_yojson "StackSetAccounts") _list path;
   }
    : provisioning_preferences)

let provisioning_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key parameter_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key parameter_key_of_yojson "Key") _list path;
   }
    : provisioning_parameter)

let provisioning_parameters_of_yojson tree path =
  list_of_yojson provisioning_parameter_of_yojson tree path

let provisioning_artifact_created_time_of_yojson = timestamp_epoch_seconds_of_yojson

let provisioning_artifact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     guidance =
       option_of_yojson
         (value_for_key provisioning_artifact_guidance_of_yojson "Guidance")
         _list path;
     created_time =
       option_of_yojson
         (value_for_key provisioning_artifact_created_time_of_yojson "CreatedTime")
         _list path;
     description =
       option_of_yojson
         (value_for_key provisioning_artifact_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key provisioning_artifact_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
   }
    : provisioning_artifact)

let provisioning_artifacts_of_yojson tree path =
  list_of_yojson provisioning_artifact_of_yojson tree path

let provisioning_artifact_view_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning_artifact =
       option_of_yojson
         (value_for_key provisioning_artifact_of_yojson "ProvisioningArtifact")
         _list path;
     product_view_summary =
       option_of_yojson
         (value_for_key product_view_summary_of_yojson "ProductViewSummary")
         _list path;
   }
    : provisioning_artifact_view)

let provisioning_artifact_views_of_yojson tree path =
  list_of_yojson provisioning_artifact_view_of_yojson tree path

let provisioning_artifact_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning_artifact_metadata =
       option_of_yojson
         (value_for_key provisioning_artifact_info_of_yojson "ProvisioningArtifactMetadata")
         _list path;
     created_time =
       option_of_yojson
         (value_for_key provisioning_artifact_created_time_of_yojson "CreatedTime")
         _list path;
     description =
       option_of_yojson
         (value_for_key provisioning_artifact_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key provisioning_artifact_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
   }
    : provisioning_artifact_summary)

let provisioning_artifact_summaries_of_yojson tree path =
  list_of_yojson provisioning_artifact_summary_of_yojson tree path

let disable_template_validation_of_yojson = bool_of_yojson

let provisioning_artifact_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_template_validation =
       option_of_yojson
         (value_for_key disable_template_validation_of_yojson "DisableTemplateValidation")
         _list path;
     type_ = option_of_yojson (value_for_key provisioning_artifact_type_of_yojson "Type") _list path;
     info = option_of_yojson (value_for_key provisioning_artifact_info_of_yojson "Info") _list path;
     description =
       option_of_yojson
         (value_for_key provisioning_artifact_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key provisioning_artifact_name_of_yojson "Name") _list path;
   }
    : provisioning_artifact_properties)

let provisioning_artifact_preferences_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stack_set_regions =
       option_of_yojson (value_for_key stack_set_regions_of_yojson "StackSetRegions") _list path;
     stack_set_accounts =
       option_of_yojson (value_for_key stack_set_accounts_of_yojson "StackSetAccounts") _list path;
   }
    : provisioning_artifact_preferences)

let default_value_of_yojson = string_of_yojson
let parameter_type_of_yojson = string_of_yojson
let no_echo_of_yojson = bool_of_yojson
let allowed_values_of_yojson tree path = list_of_yojson string__of_yojson tree path

let parameter_constraints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_value = option_of_yojson (value_for_key string__of_yojson "MinValue") _list path;
     max_value = option_of_yojson (value_for_key string__of_yojson "MaxValue") _list path;
     min_length = option_of_yojson (value_for_key string__of_yojson "MinLength") _list path;
     max_length = option_of_yojson (value_for_key string__of_yojson "MaxLength") _list path;
     constraint_description =
       option_of_yojson (value_for_key string__of_yojson "ConstraintDescription") _list path;
     allowed_pattern =
       option_of_yojson (value_for_key string__of_yojson "AllowedPattern") _list path;
     allowed_values =
       option_of_yojson (value_for_key allowed_values_of_yojson "AllowedValues") _list path;
   }
    : parameter_constraints)

let provisioning_artifact_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_constraints =
       option_of_yojson
         (value_for_key parameter_constraints_of_yojson "ParameterConstraints")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     is_no_echo = option_of_yojson (value_for_key no_echo_of_yojson "IsNoEcho") _list path;
     parameter_type =
       option_of_yojson (value_for_key parameter_type_of_yojson "ParameterType") _list path;
     default_value =
       option_of_yojson (value_for_key default_value_of_yojson "DefaultValue") _list path;
     parameter_key =
       option_of_yojson (value_for_key parameter_key_of_yojson "ParameterKey") _list path;
   }
    : provisioning_artifact_parameter)

let provisioning_artifact_parameters_of_yojson tree path =
  list_of_yojson provisioning_artifact_parameter_of_yojson tree path

let provisioning_artifact_output_key_of_yojson = string_of_yojson
let output_description_of_yojson = string_of_yojson

let provisioning_artifact_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key output_description_of_yojson "Description") _list path;
     key =
       option_of_yojson (value_for_key provisioning_artifact_output_key_of_yojson "Key") _list path;
   }
    : provisioning_artifact_output)

let provisioning_artifact_outputs_of_yojson tree path =
  list_of_yojson provisioning_artifact_output_of_yojson tree path

let provisioning_artifact_details_of_yojson tree path =
  list_of_yojson provisioning_artifact_detail_of_yojson tree path

let provisioned_product_plan_name_of_yojson = string_of_yojson

let provisioned_product_plan_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLOUDFORMATION" -> CLOUDFORMATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProvisionedProductPlanType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisionedProductPlanType")
     : provisioned_product_plan_type)
    : provisioned_product_plan_type)

let provisioned_product_plan_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning_artifact_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisioningArtifactId") _list path;
     plan_type =
       option_of_yojson
         (value_for_key provisioned_product_plan_type_of_yojson "PlanType")
         _list path;
     provision_product_name =
       option_of_yojson
         (value_for_key provisioned_product_name_of_yojson "ProvisionProductName")
         _list path;
     provision_product_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisionProductId") _list path;
     plan_id = option_of_yojson (value_for_key id_of_yojson "PlanId") _list path;
     plan_name =
       option_of_yojson
         (value_for_key provisioned_product_plan_name_of_yojson "PlanName")
         _list path;
   }
    : provisioned_product_plan_summary)

let provisioned_product_plans_of_yojson tree path =
  list_of_yojson provisioned_product_plan_summary_of_yojson tree path

let provisioned_product_plan_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXECUTE_FAILED" -> EXECUTE_FAILED
    | `String "EXECUTE_SUCCESS" -> EXECUTE_SUCCESS
    | `String "EXECUTE_IN_PROGRESS" -> EXECUTE_IN_PROGRESS
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "CREATE_SUCCESS" -> CREATE_SUCCESS
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProvisionedProductPlanStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisionedProductPlanStatus")
     : provisioned_product_plan_status)
    : provisioned_product_plan_status)

let notification_arn_of_yojson = string_of_yojson
let notification_arns_of_yojson tree path = list_of_yojson notification_arn_of_yojson tree path

let provisioned_product_plan_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     provisioning_parameters =
       option_of_yojson
         (value_for_key update_provisioning_parameters_of_yojson "ProvisioningParameters")
         _list path;
     notification_arns =
       option_of_yojson (value_for_key notification_arns_of_yojson "NotificationArns") _list path;
     updated_time = option_of_yojson (value_for_key updated_time_of_yojson "UpdatedTime") _list path;
     status =
       option_of_yojson
         (value_for_key provisioned_product_plan_status_of_yojson "Status")
         _list path;
     provisioning_artifact_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisioningArtifactId") _list path;
     plan_type =
       option_of_yojson
         (value_for_key provisioned_product_plan_type_of_yojson "PlanType")
         _list path;
     provision_product_name =
       option_of_yojson
         (value_for_key provisioned_product_name_of_yojson "ProvisionProductName")
         _list path;
     provision_product_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisionProductId") _list path;
     plan_id = option_of_yojson (value_for_key id_of_yojson "PlanId") _list path;
     plan_name =
       option_of_yojson
         (value_for_key provisioned_product_plan_name_of_yojson "PlanName")
         _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     path_id = option_of_yojson (value_for_key id_of_yojson "PathId") _list path;
     created_time = option_of_yojson (value_for_key created_time_of_yojson "CreatedTime") _list path;
   }
    : provisioned_product_plan_details)

let provision_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_detail =
       option_of_yojson (value_for_key record_detail_of_yojson "RecordDetail") _list path;
   }
    : provision_product_output)

let provision_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provision_token = value_for_key idempotency_token_of_yojson "ProvisionToken" _list path;
     notification_arns =
       option_of_yojson (value_for_key notification_arns_of_yojson "NotificationArns") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     provisioning_preferences =
       option_of_yojson
         (value_for_key provisioning_preferences_of_yojson "ProvisioningPreferences")
         _list path;
     provisioning_parameters =
       option_of_yojson
         (value_for_key provisioning_parameters_of_yojson "ProvisioningParameters")
         _list path;
     provisioned_product_name =
       value_for_key provisioned_product_name_of_yojson "ProvisionedProductName" _list path;
     path_name =
       option_of_yojson (value_for_key portfolio_display_name_of_yojson "PathName") _list path;
     path_id = option_of_yojson (value_for_key id_of_yojson "PathId") _list path;
     provisioning_artifact_name =
       option_of_yojson
         (value_for_key provisioning_artifact_name_of_yojson "ProvisioningArtifactName")
         _list path;
     provisioning_artifact_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisioningArtifactId") _list path;
     product_name =
       option_of_yojson (value_for_key product_view_name_of_yojson "ProductName") _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : provision_product_input)

let product_arn_of_yojson = string_of_yojson
let principal_ar_n_of_yojson = string_of_yojson

let principal_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IAM_PATTERN" -> IAM_PATTERN
    | `String "IAM" -> IAM
    | `String value -> raise (deserialize_unknown_enum_value_error path "PrincipalType" value)
    | _ -> raise (deserialize_wrong_type_error path "PrincipalType")
     : principal_type)
    : principal_type)

let principal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_type =
       option_of_yojson (value_for_key principal_type_of_yojson "PrincipalType") _list path;
     principal_ar_n =
       option_of_yojson (value_for_key principal_ar_n_of_yojson "PrincipalARN") _list path;
   }
    : principal)

let principals_of_yojson tree path = list_of_yojson principal_of_yojson tree path

let describe_portfolio_share_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ORGANIZATION_MEMBER_ACCOUNT" -> ORGANIZATION_MEMBER_ACCOUNT
    | `String "ORGANIZATIONAL_UNIT" -> ORGANIZATIONAL_UNIT
    | `String "ORGANIZATION" -> ORGANIZATION
    | `String "ACCOUNT" -> ACCOUNT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DescribePortfolioShareType" value)
    | _ -> raise (deserialize_wrong_type_error path "DescribePortfolioShareType")
     : describe_portfolio_share_type)
    : describe_portfolio_share_type)

let boolean__of_yojson = bool_of_yojson

let portfolio_share_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     share_principals =
       option_of_yojson (value_for_key boolean__of_yojson "SharePrincipals") _list path;
     share_tag_options =
       option_of_yojson (value_for_key boolean__of_yojson "ShareTagOptions") _list path;
     accepted = option_of_yojson (value_for_key boolean__of_yojson "Accepted") _list path;
     type_ =
       option_of_yojson (value_for_key describe_portfolio_share_type_of_yojson "Type") _list path;
     principal_id = option_of_yojson (value_for_key id_of_yojson "PrincipalId") _list path;
   }
    : portfolio_share_detail)

let portfolio_share_details_of_yojson tree path =
  list_of_yojson portfolio_share_detail_of_yojson tree path

let portfolio_name_of_yojson = string_of_yojson
let portfolio_details_of_yojson tree path = list_of_yojson portfolio_detail_of_yojson tree path
let output_keys_of_yojson tree path = list_of_yojson output_key_of_yojson tree path
let organization_nodes_of_yojson tree path = list_of_yojson organization_node_of_yojson tree path

let notify_update_provisioned_product_engine_workflow_result_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let engine_workflow_token_of_yojson = string_of_yojson

let engine_workflow_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EngineWorkflowStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EngineWorkflowStatus")
     : engine_workflow_status)
    : engine_workflow_status)

let engine_workflow_failure_reason_of_yojson = string_of_yojson

let notify_update_provisioned_product_engine_workflow_result_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     outputs = option_of_yojson (value_for_key record_outputs_of_yojson "Outputs") _list path;
     failure_reason =
       option_of_yojson
         (value_for_key engine_workflow_failure_reason_of_yojson "FailureReason")
         _list path;
     status = value_for_key engine_workflow_status_of_yojson "Status" _list path;
     record_id = value_for_key id_of_yojson "RecordId" _list path;
     workflow_token = value_for_key engine_workflow_token_of_yojson "WorkflowToken" _list path;
   }
    : notify_update_provisioned_product_engine_workflow_result_input)

let notify_terminate_provisioned_product_engine_workflow_result_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let notify_terminate_provisioned_product_engine_workflow_result_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     failure_reason =
       option_of_yojson
         (value_for_key engine_workflow_failure_reason_of_yojson "FailureReason")
         _list path;
     status = value_for_key engine_workflow_status_of_yojson "Status" _list path;
     record_id = value_for_key id_of_yojson "RecordId" _list path;
     workflow_token = value_for_key engine_workflow_token_of_yojson "WorkflowToken" _list path;
   }
    : notify_terminate_provisioned_product_engine_workflow_result_input)

let notify_provision_product_engine_workflow_result_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let engine_workflow_resource_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unique_tag =
       option_of_yojson
         (value_for_key unique_tag_resource_identifier_of_yojson "UniqueTag")
         _list path;
   }
    : engine_workflow_resource_identifier)

let notify_provision_product_engine_workflow_result_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     outputs = option_of_yojson (value_for_key record_outputs_of_yojson "Outputs") _list path;
     resource_identifier =
       option_of_yojson
         (value_for_key engine_workflow_resource_identifier_of_yojson "ResourceIdentifier")
         _list path;
     failure_reason =
       option_of_yojson
         (value_for_key engine_workflow_failure_reason_of_yojson "FailureReason")
         _list path;
     status = value_for_key engine_workflow_status_of_yojson "Status" _list path;
     record_id = value_for_key id_of_yojson "RecordId" _list path;
     workflow_token = value_for_key engine_workflow_token_of_yojson "WorkflowToken" _list path;
   }
    : notify_provision_product_engine_workflow_result_input)

let list_tag_options_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     tag_option_details =
       option_of_yojson (value_for_key tag_option_details_of_yojson "TagOptionDetails") _list path;
   }
    : list_tag_options_output)

let list_tag_options_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active = option_of_yojson (value_for_key tag_option_active_of_yojson "Active") _list path;
     value = option_of_yojson (value_for_key tag_option_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key tag_option_key_of_yojson "Key") _list path;
   }
    : list_tag_options_filters)

let list_tag_options_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     filters =
       option_of_yojson (value_for_key list_tag_options_filters_of_yojson "Filters") _list path;
   }
    : list_tag_options_input)

let list_stack_instances_for_provisioned_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     stack_instances =
       option_of_yojson (value_for_key stack_instances_of_yojson "StackInstances") _list path;
   }
    : list_stack_instances_for_provisioned_product_output)

let list_stack_instances_for_provisioned_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     provisioned_product_id = value_for_key id_of_yojson "ProvisionedProductId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_stack_instances_for_provisioned_product_input)

let list_service_actions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     service_action_summaries =
       option_of_yojson
         (value_for_key service_action_summaries_of_yojson "ServiceActionSummaries")
         _list path;
   }
    : list_service_actions_output)

let list_service_actions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_service_actions_input)

let list_service_actions_for_provisioning_artifact_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     service_action_summaries =
       option_of_yojson
         (value_for_key service_action_summaries_of_yojson "ServiceActionSummaries")
         _list path;
   }
    : list_service_actions_for_provisioning_artifact_output)

let list_service_actions_for_provisioning_artifact_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     provisioning_artifact_id = value_for_key id_of_yojson "ProvisioningArtifactId" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
   }
    : list_service_actions_for_provisioning_artifact_input)

let list_resources_for_tag_option_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     resource_details =
       option_of_yojson (value_for_key resource_details_of_yojson "ResourceDetails") _list path;
   }
    : list_resources_for_tag_option_output)

let list_resources_for_tag_option_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     tag_option_id = value_for_key tag_option_id_of_yojson "TagOptionId" _list path;
   }
    : list_resources_for_tag_option_input)

let list_record_history_search_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key search_filter_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key search_filter_key_of_yojson "Key") _list path;
   }
    : list_record_history_search_filter)

let list_record_history_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     record_details =
       option_of_yojson (value_for_key record_details_of_yojson "RecordDetails") _list path;
   }
    : list_record_history_output)

let list_record_history_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     search_filter =
       option_of_yojson
         (value_for_key list_record_history_search_filter_of_yojson "SearchFilter")
         _list path;
     access_level_filter =
       option_of_yojson (value_for_key access_level_filter_of_yojson "AccessLevelFilter") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_record_history_input)

let list_provisioning_artifacts_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     provisioning_artifact_details =
       option_of_yojson
         (value_for_key provisioning_artifact_details_of_yojson "ProvisioningArtifactDetails")
         _list path;
   }
    : list_provisioning_artifacts_output)

let list_provisioning_artifacts_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_provisioning_artifacts_input)

let list_provisioning_artifacts_for_service_action_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     provisioning_artifact_views =
       option_of_yojson
         (value_for_key provisioning_artifact_views_of_yojson "ProvisioningArtifactViews")
         _list path;
   }
    : list_provisioning_artifacts_for_service_action_output)

let list_provisioning_artifacts_for_service_action_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     service_action_id = value_for_key id_of_yojson "ServiceActionId" _list path;
   }
    : list_provisioning_artifacts_for_service_action_input)

let list_provisioned_product_plans_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     provisioned_product_plans =
       option_of_yojson
         (value_for_key provisioned_product_plans_of_yojson "ProvisionedProductPlans")
         _list path;
   }
    : list_provisioned_product_plans_output)

let list_provisioned_product_plans_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_level_filter =
       option_of_yojson (value_for_key access_level_filter_of_yojson "AccessLevelFilter") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     provision_product_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisionProductId") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_provisioned_product_plans_input)

let list_principals_for_portfolio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     principals = option_of_yojson (value_for_key principals_of_yojson "Principals") _list path;
   }
    : list_principals_for_portfolio_output)

let list_principals_for_portfolio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_principals_for_portfolio_input)

let list_portfolios_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     portfolio_details =
       option_of_yojson (value_for_key portfolio_details_of_yojson "PortfolioDetails") _list path;
   }
    : list_portfolios_output)

let list_portfolios_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_size = option_of_yojson (value_for_key page_size_max100_of_yojson "PageSize") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_portfolios_input)

let list_portfolios_for_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     portfolio_details =
       option_of_yojson (value_for_key portfolio_details_of_yojson "PortfolioDetails") _list path;
   }
    : list_portfolios_for_product_output)

let list_portfolios_for_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_size = option_of_yojson (value_for_key page_size_max100_of_yojson "PageSize") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_portfolios_for_product_input)

let account_ids_of_yojson tree path = list_of_yojson account_id_of_yojson tree path

let list_portfolio_access_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     account_ids = option_of_yojson (value_for_key account_ids_of_yojson "AccountIds") _list path;
   }
    : list_portfolio_access_output)

let list_portfolio_access_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_size = option_of_yojson (value_for_key page_size_max100_of_yojson "PageSize") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     organization_parent_id =
       option_of_yojson (value_for_key id_of_yojson "OrganizationParentId") _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_portfolio_access_input)

let list_organization_portfolio_access_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     organization_nodes =
       option_of_yojson (value_for_key organization_nodes_of_yojson "OrganizationNodes") _list path;
   }
    : list_organization_portfolio_access_output)

let list_organization_portfolio_access_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     organization_node_type =
       value_for_key organization_node_type_of_yojson "OrganizationNodeType" _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_organization_portfolio_access_input)

let constraint_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key constraint_description_of_yojson "Description") _list path;
     type_ = option_of_yojson (value_for_key constraint_type_of_yojson "Type") _list path;
   }
    : constraint_summary)

let constraint_summaries_of_yojson tree path = list_of_yojson constraint_summary_of_yojson tree path

let launch_path_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key portfolio_name_of_yojson "Name") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     constraint_summaries =
       option_of_yojson
         (value_for_key constraint_summaries_of_yojson "ConstraintSummaries")
         _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
   }
    : launch_path_summary)

let launch_path_summaries_of_yojson tree path =
  list_of_yojson launch_path_summary_of_yojson tree path

let list_launch_paths_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     launch_path_summaries =
       option_of_yojson
         (value_for_key launch_path_summaries_of_yojson "LaunchPathSummaries")
         _list path;
   }
    : list_launch_paths_output)

let list_launch_paths_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_launch_paths_input)

let constraint_details_of_yojson tree path = list_of_yojson constraint_detail_of_yojson tree path

let list_constraints_for_portfolio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     constraint_details =
       option_of_yojson (value_for_key constraint_details_of_yojson "ConstraintDetails") _list path;
   }
    : list_constraints_for_portfolio_output)

let list_constraints_for_portfolio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_constraints_for_portfolio_input)

let budget_name_of_yojson = string_of_yojson

let budget_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ budget_name = option_of_yojson (value_for_key budget_name_of_yojson "BudgetName") _list path }
    : budget_detail)

let budgets_of_yojson tree path = list_of_yojson budget_detail_of_yojson tree path

let list_budgets_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     budgets = option_of_yojson (value_for_key budgets_of_yojson "Budgets") _list path;
   }
    : list_budgets_for_resource_output)

let list_budgets_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     resource_id = value_for_key id_of_yojson "ResourceId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_budgets_for_resource_input)

let list_accepted_portfolio_shares_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     portfolio_details =
       option_of_yojson (value_for_key portfolio_details_of_yojson "PortfolioDetails") _list path;
   }
    : list_accepted_portfolio_shares_output)

let list_accepted_portfolio_shares_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     portfolio_share_type =
       option_of_yojson
         (value_for_key portfolio_share_type_of_yojson "PortfolioShareType")
         _list path;
     page_size = option_of_yojson (value_for_key page_size_max100_of_yojson "PageSize") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : list_accepted_portfolio_shares_input)

let launch_path_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key portfolio_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
   }
    : launch_path)

let launch_paths_of_yojson tree path = list_of_yojson launch_path_of_yojson tree path

let import_as_provisioned_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_detail =
       option_of_yojson (value_for_key record_detail_of_yojson "RecordDetail") _list path;
   }
    : import_as_provisioned_product_output)

let import_as_provisioned_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     physical_id = value_for_key physical_id_of_yojson "PhysicalId" _list path;
     provisioned_product_name =
       value_for_key provisioned_product_name_of_yojson "ProvisionedProductName" _list path;
     provisioning_artifact_id = value_for_key id_of_yojson "ProvisioningArtifactId" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : import_as_provisioned_product_input)

let get_provisioned_product_outputs_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     outputs = option_of_yojson (value_for_key record_outputs_of_yojson "Outputs") _list path;
   }
    : get_provisioned_product_outputs_output)

let get_provisioned_product_outputs_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     output_keys = option_of_yojson (value_for_key output_keys_of_yojson "OutputKeys") _list path;
     provisioned_product_name =
       option_of_yojson
         (value_for_key provisioned_product_name_of_yojson "ProvisionedProductName")
         _list path;
     provisioned_product_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisionedProductId") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : get_provisioned_product_outputs_input)

let access_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "UNDER_CHANGE" -> UNDER_CHANGE
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessStatus")
     : access_status)
    : access_status)

let get_aws_organizations_access_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_status =
       option_of_yojson (value_for_key access_status_of_yojson "AccessStatus") _list path;
   }
    : get_aws_organizations_access_status_output)

let get_aws_organizations_access_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let failed_service_action_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson
         (value_for_key service_action_association_error_message_of_yojson "ErrorMessage")
         _list path;
     error_code =
       option_of_yojson
         (value_for_key service_action_association_error_code_of_yojson "ErrorCode")
         _list path;
     provisioning_artifact_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisioningArtifactId") _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     service_action_id = option_of_yojson (value_for_key id_of_yojson "ServiceActionId") _list path;
   }
    : failed_service_action_association)

let failed_service_action_associations_of_yojson tree path =
  list_of_yojson failed_service_action_association_of_yojson tree path

let execution_parameter_key_of_yojson = string_of_yojson
let execution_parameter_type_of_yojson = string_of_yojson
let execution_parameter_value_of_yojson = string_of_yojson

let execution_parameter_value_list_of_yojson tree path =
  list_of_yojson execution_parameter_value_of_yojson tree path

let execution_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_values =
       option_of_yojson
         (value_for_key execution_parameter_value_list_of_yojson "DefaultValues")
         _list path;
     type_ = option_of_yojson (value_for_key execution_parameter_type_of_yojson "Type") _list path;
     name = option_of_yojson (value_for_key execution_parameter_key_of_yojson "Name") _list path;
   }
    : execution_parameter)

let execution_parameters_of_yojson tree path =
  list_of_yojson execution_parameter_of_yojson tree path

let execution_parameter_map_of_yojson tree path =
  map_of_yojson execution_parameter_key_of_yojson execution_parameter_value_list_of_yojson tree path

let execute_provisioned_product_service_action_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_detail =
       option_of_yojson (value_for_key record_detail_of_yojson "RecordDetail") _list path;
   }
    : execute_provisioned_product_service_action_output)

let execute_provisioned_product_service_action_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters =
       option_of_yojson (value_for_key execution_parameter_map_of_yojson "Parameters") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     execute_token = value_for_key idempotency_token_of_yojson "ExecuteToken" _list path;
     service_action_id = value_for_key id_of_yojson "ServiceActionId" _list path;
     provisioned_product_id = value_for_key id_of_yojson "ProvisionedProductId" _list path;
   }
    : execute_provisioned_product_service_action_input)

let execute_provisioned_product_plan_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_detail =
       option_of_yojson (value_for_key record_detail_of_yojson "RecordDetail") _list path;
   }
    : execute_provisioned_product_plan_output)

let execute_provisioned_product_plan_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     plan_id = value_for_key id_of_yojson "PlanId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : execute_provisioned_product_plan_input)

let enable_aws_organizations_access_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_aws_organizations_access_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_tag_option_from_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_tag_option_from_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_option_id = value_for_key tag_option_id_of_yojson "TagOptionId" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
   }
    : disassociate_tag_option_from_resource_input)

let disassociate_service_action_from_provisioning_artifact_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_service_action_from_provisioning_artifact_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     service_action_id = value_for_key id_of_yojson "ServiceActionId" _list path;
     provisioning_artifact_id = value_for_key id_of_yojson "ProvisioningArtifactId" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
   }
    : disassociate_service_action_from_provisioning_artifact_input)

let disassociate_product_from_portfolio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_product_from_portfolio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : disassociate_product_from_portfolio_input)

let disassociate_principal_from_portfolio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_principal_from_portfolio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_type =
       option_of_yojson (value_for_key principal_type_of_yojson "PrincipalType") _list path;
     principal_ar_n = value_for_key principal_ar_n_of_yojson "PrincipalARN" _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : disassociate_principal_from_portfolio_input)

let disassociate_budget_from_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_budget_from_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key id_of_yojson "ResourceId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
   }
    : disassociate_budget_from_resource_input)

let disable_aws_organizations_access_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_aws_organizations_access_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let describe_tag_option_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_option_detail =
       option_of_yojson (value_for_key tag_option_detail_of_yojson "TagOptionDetail") _list path;
   }
    : describe_tag_option_output)

let describe_tag_option_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key tag_option_id_of_yojson "Id" _list path } : describe_tag_option_input)

let describe_service_action_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_action_detail =
       option_of_yojson
         (value_for_key service_action_detail_of_yojson "ServiceActionDetail")
         _list path;
   }
    : describe_service_action_output)

let describe_service_action_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     id = value_for_key id_of_yojson "Id" _list path;
   }
    : describe_service_action_input)

let describe_service_action_execution_parameters_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_action_parameters =
       option_of_yojson
         (value_for_key execution_parameters_of_yojson "ServiceActionParameters")
         _list path;
   }
    : describe_service_action_execution_parameters_output)

let describe_service_action_execution_parameters_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     service_action_id = value_for_key id_of_yojson "ServiceActionId" _list path;
     provisioned_product_id = value_for_key id_of_yojson "ProvisionedProductId" _list path;
   }
    : describe_service_action_execution_parameters_input)

let describe_record_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     record_outputs =
       option_of_yojson (value_for_key record_outputs_of_yojson "RecordOutputs") _list path;
     record_detail =
       option_of_yojson (value_for_key record_detail_of_yojson "RecordDetail") _list path;
   }
    : describe_record_output)

let describe_record_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     id = value_for_key id_of_yojson "Id" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : describe_record_input)

let describe_provisioning_parameters_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning_artifact_output_keys =
       option_of_yojson
         (value_for_key provisioning_artifact_outputs_of_yojson "ProvisioningArtifactOutputKeys")
         _list path;
     provisioning_artifact_outputs =
       option_of_yojson
         (value_for_key provisioning_artifact_outputs_of_yojson "ProvisioningArtifactOutputs")
         _list path;
     provisioning_artifact_preferences =
       option_of_yojson
         (value_for_key provisioning_artifact_preferences_of_yojson
            "ProvisioningArtifactPreferences")
         _list path;
     tag_options =
       option_of_yojson (value_for_key tag_option_summaries_of_yojson "TagOptions") _list path;
     usage_instructions =
       option_of_yojson (value_for_key usage_instructions_of_yojson "UsageInstructions") _list path;
     constraint_summaries =
       option_of_yojson
         (value_for_key constraint_summaries_of_yojson "ConstraintSummaries")
         _list path;
     provisioning_artifact_parameters =
       option_of_yojson
         (value_for_key provisioning_artifact_parameters_of_yojson "ProvisioningArtifactParameters")
         _list path;
   }
    : describe_provisioning_parameters_output)

let describe_provisioning_parameters_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     path_name =
       option_of_yojson (value_for_key portfolio_display_name_of_yojson "PathName") _list path;
     path_id = option_of_yojson (value_for_key id_of_yojson "PathId") _list path;
     provisioning_artifact_name =
       option_of_yojson
         (value_for_key provisioning_artifact_name_of_yojson "ProvisioningArtifactName")
         _list path;
     provisioning_artifact_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisioningArtifactId") _list path;
     product_name =
       option_of_yojson (value_for_key product_view_name_of_yojson "ProductName") _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : describe_provisioning_parameters_input)

let describe_provisioning_artifact_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning_artifact_parameters =
       option_of_yojson
         (value_for_key provisioning_artifact_parameters_of_yojson "ProvisioningArtifactParameters")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     info = option_of_yojson (value_for_key provisioning_artifact_info_of_yojson "Info") _list path;
     provisioning_artifact_detail =
       option_of_yojson
         (value_for_key provisioning_artifact_detail_of_yojson "ProvisioningArtifactDetail")
         _list path;
   }
    : describe_provisioning_artifact_output)

let describe_provisioning_artifact_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_provisioning_artifact_parameters =
       option_of_yojson
         (value_for_key boolean__of_yojson "IncludeProvisioningArtifactParameters")
         _list path;
     verbose = option_of_yojson (value_for_key verbose_of_yojson "Verbose") _list path;
     product_name =
       option_of_yojson (value_for_key product_view_name_of_yojson "ProductName") _list path;
     provisioning_artifact_name =
       option_of_yojson
         (value_for_key provisioning_artifact_name_of_yojson "ProvisioningArtifactName")
         _list path;
     product_id = option_of_yojson (value_for_key id_of_yojson "ProductId") _list path;
     provisioning_artifact_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisioningArtifactId") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : describe_provisioning_artifact_input)

let describe_provisioned_product_plan_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
     resource_changes =
       option_of_yojson (value_for_key resource_changes_of_yojson "ResourceChanges") _list path;
     provisioned_product_plan_details =
       option_of_yojson
         (value_for_key provisioned_product_plan_details_of_yojson "ProvisionedProductPlanDetails")
         _list path;
   }
    : describe_provisioned_product_plan_output)

let describe_provisioned_product_plan_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     page_size = option_of_yojson (value_for_key page_size_of_yojson "PageSize") _list path;
     plan_id = value_for_key id_of_yojson "PlanId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : describe_provisioned_product_plan_input)

let cloud_watch_dashboard_name_of_yojson = string_of_yojson

let cloud_watch_dashboard_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key cloud_watch_dashboard_name_of_yojson "Name") _list path;
   }
    : cloud_watch_dashboard)

let cloud_watch_dashboards_of_yojson tree path =
  list_of_yojson cloud_watch_dashboard_of_yojson tree path

let describe_provisioned_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_dashboards =
       option_of_yojson
         (value_for_key cloud_watch_dashboards_of_yojson "CloudWatchDashboards")
         _list path;
     provisioned_product_detail =
       option_of_yojson
         (value_for_key provisioned_product_detail_of_yojson "ProvisionedProductDetail")
         _list path;
   }
    : describe_provisioned_product_output)

let describe_provisioned_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key provisioned_product_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : describe_provisioned_product_input)

let describe_product_view_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning_artifacts =
       option_of_yojson
         (value_for_key provisioning_artifacts_of_yojson "ProvisioningArtifacts")
         _list path;
     product_view_summary =
       option_of_yojson
         (value_for_key product_view_summary_of_yojson "ProductViewSummary")
         _list path;
   }
    : describe_product_view_output)

let describe_product_view_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key id_of_yojson "Id" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : describe_product_view_input)

let describe_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     launch_paths = option_of_yojson (value_for_key launch_paths_of_yojson "LaunchPaths") _list path;
     budgets = option_of_yojson (value_for_key budgets_of_yojson "Budgets") _list path;
     provisioning_artifacts =
       option_of_yojson
         (value_for_key provisioning_artifacts_of_yojson "ProvisioningArtifacts")
         _list path;
     product_view_summary =
       option_of_yojson
         (value_for_key product_view_summary_of_yojson "ProductViewSummary")
         _list path;
   }
    : describe_product_output)

let describe_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key product_view_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : describe_product_input)

let describe_product_as_admin_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     budgets = option_of_yojson (value_for_key budgets_of_yojson "Budgets") _list path;
     tag_options =
       option_of_yojson (value_for_key tag_option_details_of_yojson "TagOptions") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     provisioning_artifact_summaries =
       option_of_yojson
         (value_for_key provisioning_artifact_summaries_of_yojson "ProvisioningArtifactSummaries")
         _list path;
     product_view_detail =
       option_of_yojson (value_for_key product_view_detail_of_yojson "ProductViewDetail") _list path;
   }
    : describe_product_as_admin_output)

let describe_product_as_admin_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_portfolio_id =
       option_of_yojson (value_for_key id_of_yojson "SourcePortfolioId") _list path;
     name = option_of_yojson (value_for_key product_view_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key id_of_yojson "Id") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : describe_product_as_admin_input)

let describe_portfolio_shares_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     portfolio_share_details =
       option_of_yojson
         (value_for_key portfolio_share_details_of_yojson "PortfolioShareDetails")
         _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "NextPageToken") _list path;
   }
    : describe_portfolio_shares_output)

let describe_portfolio_shares_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_size = option_of_yojson (value_for_key page_size_max100_of_yojson "PageSize") _list path;
     page_token = option_of_yojson (value_for_key page_token_of_yojson "PageToken") _list path;
     type_ = value_for_key describe_portfolio_share_type_of_yojson "Type" _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
   }
    : describe_portfolio_shares_input)

let describe_portfolio_share_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     share_details =
       option_of_yojson (value_for_key share_details_of_yojson "ShareDetails") _list path;
     status = option_of_yojson (value_for_key share_status_of_yojson "Status") _list path;
     organization_node_value =
       option_of_yojson
         (value_for_key organization_node_value_of_yojson "OrganizationNodeValue")
         _list path;
     portfolio_id = option_of_yojson (value_for_key id_of_yojson "PortfolioId") _list path;
     portfolio_share_token =
       option_of_yojson (value_for_key id_of_yojson "PortfolioShareToken") _list path;
   }
    : describe_portfolio_share_status_output)

let describe_portfolio_share_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ portfolio_share_token = value_for_key id_of_yojson "PortfolioShareToken" _list path }
    : describe_portfolio_share_status_input)

let describe_portfolio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     budgets = option_of_yojson (value_for_key budgets_of_yojson "Budgets") _list path;
     tag_options =
       option_of_yojson (value_for_key tag_option_details_of_yojson "TagOptions") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     portfolio_detail =
       option_of_yojson (value_for_key portfolio_detail_of_yojson "PortfolioDetail") _list path;
   }
    : describe_portfolio_output)

let describe_portfolio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key id_of_yojson "Id" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : describe_portfolio_input)

let copy_product_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CopyProductStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CopyProductStatus")
     : copy_product_status)
    : copy_product_status)

let describe_copy_product_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_detail =
       option_of_yojson (value_for_key status_detail_of_yojson "StatusDetail") _list path;
     target_product_id = option_of_yojson (value_for_key id_of_yojson "TargetProductId") _list path;
     copy_product_status =
       option_of_yojson (value_for_key copy_product_status_of_yojson "CopyProductStatus") _list path;
   }
    : describe_copy_product_status_output)

let describe_copy_product_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     copy_product_token = value_for_key id_of_yojson "CopyProductToken" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : describe_copy_product_status_input)

let describe_constraint_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     constraint_parameters =
       option_of_yojson
         (value_for_key constraint_parameters_of_yojson "ConstraintParameters")
         _list path;
     constraint_detail =
       option_of_yojson (value_for_key constraint_detail_of_yojson "ConstraintDetail") _list path;
   }
    : describe_constraint_output)

let describe_constraint_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key id_of_yojson "Id" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : describe_constraint_input)

let delete_tag_option_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_tag_option_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key tag_option_id_of_yojson "Id" _list path } : delete_tag_option_input)

let delete_service_action_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_service_action_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     id = value_for_key id_of_yojson "Id" _list path;
   }
    : delete_service_action_input)

let delete_provisioning_artifact_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_provisioning_artifact_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning_artifact_id = value_for_key id_of_yojson "ProvisioningArtifactId" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : delete_provisioning_artifact_input)

let delete_provisioned_product_plan_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_provisioned_product_plan_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ignore_errors =
       option_of_yojson (value_for_key ignore_errors_of_yojson "IgnoreErrors") _list path;
     plan_id = value_for_key id_of_yojson "PlanId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : delete_provisioned_product_plan_input)

let delete_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key id_of_yojson "Id" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : delete_product_input)

let delete_portfolio_share_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     portfolio_share_token =
       option_of_yojson (value_for_key id_of_yojson "PortfolioShareToken") _list path;
   }
    : delete_portfolio_share_output)

let delete_portfolio_share_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_node =
       option_of_yojson (value_for_key organization_node_of_yojson "OrganizationNode") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : delete_portfolio_share_input)

let delete_portfolio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_portfolio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key id_of_yojson "Id" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : delete_portfolio_input)

let delete_constraint_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_constraint_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key id_of_yojson "Id" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : delete_constraint_input)

let create_tag_option_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_option_detail =
       option_of_yojson (value_for_key tag_option_detail_of_yojson "TagOptionDetail") _list path;
   }
    : create_tag_option_output)

let create_tag_option_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_option_value_of_yojson "Value" _list path;
     key = value_for_key tag_option_key_of_yojson "Key" _list path;
   }
    : create_tag_option_input)

let create_service_action_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_action_detail =
       option_of_yojson
         (value_for_key service_action_detail_of_yojson "ServiceActionDetail")
         _list path;
   }
    : create_service_action_output)

let create_service_action_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     description =
       option_of_yojson
         (value_for_key service_action_description_of_yojson "Description")
         _list path;
     definition = value_for_key service_action_definition_map_of_yojson "Definition" _list path;
     definition_type =
       value_for_key service_action_definition_type_of_yojson "DefinitionType" _list path;
     name = value_for_key service_action_name_of_yojson "Name" _list path;
   }
    : create_service_action_input)

let create_provisioning_artifact_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     info = option_of_yojson (value_for_key provisioning_artifact_info_of_yojson "Info") _list path;
     provisioning_artifact_detail =
       option_of_yojson
         (value_for_key provisioning_artifact_detail_of_yojson "ProvisioningArtifactDetail")
         _list path;
   }
    : create_provisioning_artifact_output)

let create_provisioning_artifact_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     parameters = value_for_key provisioning_artifact_properties_of_yojson "Parameters" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : create_provisioning_artifact_input)

let create_provisioned_product_plan_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioning_artifact_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisioningArtifactId") _list path;
     provisioned_product_name =
       option_of_yojson
         (value_for_key provisioned_product_name_of_yojson "ProvisionedProductName")
         _list path;
     provision_product_id =
       option_of_yojson (value_for_key id_of_yojson "ProvisionProductId") _list path;
     plan_id = option_of_yojson (value_for_key id_of_yojson "PlanId") _list path;
     plan_name =
       option_of_yojson
         (value_for_key provisioned_product_plan_name_of_yojson "PlanName")
         _list path;
   }
    : create_provisioned_product_plan_output)

let create_provisioned_product_plan_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     provisioning_parameters =
       option_of_yojson
         (value_for_key update_provisioning_parameters_of_yojson "ProvisioningParameters")
         _list path;
     provisioning_artifact_id = value_for_key id_of_yojson "ProvisioningArtifactId" _list path;
     provisioned_product_name =
       value_for_key provisioned_product_name_of_yojson "ProvisionedProductName" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     path_id = option_of_yojson (value_for_key id_of_yojson "PathId") _list path;
     notification_arns =
       option_of_yojson (value_for_key notification_arns_of_yojson "NotificationArns") _list path;
     plan_type = value_for_key provisioned_product_plan_type_of_yojson "PlanType" _list path;
     plan_name = value_for_key provisioned_product_plan_name_of_yojson "PlanName" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : create_provisioned_product_plan_input)

let create_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     provisioning_artifact_detail =
       option_of_yojson
         (value_for_key provisioning_artifact_detail_of_yojson "ProvisioningArtifactDetail")
         _list path;
     product_view_detail =
       option_of_yojson (value_for_key product_view_detail_of_yojson "ProductViewDetail") _list path;
   }
    : create_product_output)

let create_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_connection =
       option_of_yojson (value_for_key source_connection_of_yojson "SourceConnection") _list path;
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     provisioning_artifact_parameters =
       option_of_yojson
         (value_for_key provisioning_artifact_properties_of_yojson "ProvisioningArtifactParameters")
         _list path;
     tags = option_of_yojson (value_for_key add_tags_of_yojson "Tags") _list path;
     product_type = value_for_key product_type_of_yojson "ProductType" _list path;
     support_url = option_of_yojson (value_for_key support_url_of_yojson "SupportUrl") _list path;
     support_email =
       option_of_yojson (value_for_key support_email_of_yojson "SupportEmail") _list path;
     support_description =
       option_of_yojson
         (value_for_key support_description_of_yojson "SupportDescription")
         _list path;
     distributor =
       option_of_yojson (value_for_key product_view_owner_of_yojson "Distributor") _list path;
     description =
       option_of_yojson
         (value_for_key product_view_short_description_of_yojson "Description")
         _list path;
     owner = value_for_key product_view_owner_of_yojson "Owner" _list path;
     name = value_for_key product_view_name_of_yojson "Name" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : create_product_input)

let create_portfolio_share_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     portfolio_share_token =
       option_of_yojson (value_for_key id_of_yojson "PortfolioShareToken") _list path;
   }
    : create_portfolio_share_output)

let create_portfolio_share_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     share_principals =
       option_of_yojson (value_for_key boolean__of_yojson "SharePrincipals") _list path;
     share_tag_options =
       option_of_yojson (value_for_key boolean__of_yojson "ShareTagOptions") _list path;
     organization_node =
       option_of_yojson (value_for_key organization_node_of_yojson "OrganizationNode") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : create_portfolio_share_input)

let create_portfolio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     portfolio_detail =
       option_of_yojson (value_for_key portfolio_detail_of_yojson "PortfolioDetail") _list path;
   }
    : create_portfolio_output)

let create_portfolio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     tags = option_of_yojson (value_for_key add_tags_of_yojson "Tags") _list path;
     provider_name = value_for_key provider_name_of_yojson "ProviderName" _list path;
     description =
       option_of_yojson (value_for_key portfolio_description_of_yojson "Description") _list path;
     display_name = value_for_key portfolio_display_name_of_yojson "DisplayName" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : create_portfolio_input)

let create_constraint_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     constraint_parameters =
       option_of_yojson
         (value_for_key constraint_parameters_of_yojson "ConstraintParameters")
         _list path;
     constraint_detail =
       option_of_yojson (value_for_key constraint_detail_of_yojson "ConstraintDetail") _list path;
   }
    : create_constraint_output)

let create_constraint_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     description =
       option_of_yojson (value_for_key constraint_description_of_yojson "Description") _list path;
     type_ = value_for_key constraint_type_of_yojson "Type" _list path;
     parameters = value_for_key constraint_parameters_of_yojson "Parameters" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : create_constraint_input)

let copy_product_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     copy_product_token =
       option_of_yojson (value_for_key id_of_yojson "CopyProductToken") _list path;
   }
    : copy_product_output)

let copy_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "CopyTags" -> CopyTags
    | `String value -> raise (deserialize_unknown_enum_value_error path "CopyOption" value)
    | _ -> raise (deserialize_wrong_type_error path "CopyOption")
     : copy_option)
    : copy_option)

let copy_options_of_yojson tree path = list_of_yojson copy_option_of_yojson tree path

let copy_product_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     copy_options = option_of_yojson (value_for_key copy_options_of_yojson "CopyOptions") _list path;
     source_provisioning_artifact_identifiers =
       option_of_yojson
         (value_for_key source_provisioning_artifact_properties_of_yojson
            "SourceProvisioningArtifactIdentifiers")
         _list path;
     target_product_name =
       option_of_yojson (value_for_key product_view_name_of_yojson "TargetProductName") _list path;
     target_product_id = option_of_yojson (value_for_key id_of_yojson "TargetProductId") _list path;
     source_product_arn = value_for_key product_arn_of_yojson "SourceProductArn" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : copy_product_input)

let batch_disassociate_service_action_from_provisioning_artifact_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_service_action_associations =
       option_of_yojson
         (value_for_key failed_service_action_associations_of_yojson
            "FailedServiceActionAssociations")
         _list path;
   }
    : batch_disassociate_service_action_from_provisioning_artifact_output)

let batch_disassociate_service_action_from_provisioning_artifact_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     service_action_associations =
       value_for_key service_action_associations_of_yojson "ServiceActionAssociations" _list path;
   }
    : batch_disassociate_service_action_from_provisioning_artifact_input)

let batch_associate_service_action_with_provisioning_artifact_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_service_action_associations =
       option_of_yojson
         (value_for_key failed_service_action_associations_of_yojson
            "FailedServiceActionAssociations")
         _list path;
   }
    : batch_associate_service_action_with_provisioning_artifact_output)

let batch_associate_service_action_with_provisioning_artifact_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     service_action_associations =
       value_for_key service_action_associations_of_yojson "ServiceActionAssociations" _list path;
   }
    : batch_associate_service_action_with_provisioning_artifact_input)

let associate_tag_option_with_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_tag_option_with_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_option_id = value_for_key tag_option_id_of_yojson "TagOptionId" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
   }
    : associate_tag_option_with_resource_input)

let associate_service_action_with_provisioning_artifact_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_service_action_with_provisioning_artifact_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
     service_action_id = value_for_key id_of_yojson "ServiceActionId" _list path;
     provisioning_artifact_id = value_for_key id_of_yojson "ProvisioningArtifactId" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
   }
    : associate_service_action_with_provisioning_artifact_input)

let associate_product_with_portfolio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_product_with_portfolio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_portfolio_id =
       option_of_yojson (value_for_key id_of_yojson "SourcePortfolioId") _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     product_id = value_for_key id_of_yojson "ProductId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : associate_product_with_portfolio_input)

let associate_principal_with_portfolio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_principal_with_portfolio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_type = value_for_key principal_type_of_yojson "PrincipalType" _list path;
     principal_ar_n = value_for_key principal_ar_n_of_yojson "PrincipalARN" _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : associate_principal_with_portfolio_input)

let associate_budget_with_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_budget_with_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key id_of_yojson "ResourceId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
   }
    : associate_budget_with_resource_input)

let accept_portfolio_share_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let accept_portfolio_share_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     portfolio_share_type =
       option_of_yojson
         (value_for_key portfolio_share_type_of_yojson "PortfolioShareType")
         _list path;
     portfolio_id = value_for_key id_of_yojson "PortfolioId" _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : accept_portfolio_share_input)
