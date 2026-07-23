open Smaws_Lib.Json.DeserializeHelpers
open Types

let aws_account_number_of_yojson = string_of_yojson
let skip_app_resign_of_yojson = bool_of_yojson
let job_timeout_minutes_of_yojson = int_of_yojson
let integer_of_yojson = int_of_yojson
let string__of_yojson = string_of_yojson
let max_slot_map_of_yojson tree path = map_of_yojson string__of_yojson integer_of_yojson tree path
let double_of_yojson = double_of_yojson

let trial_minutes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total = option_of_yojson (value_for_key double_of_yojson "total") _list path;
     remaining = option_of_yojson (value_for_key double_of_yojson "remaining") _list path;
   }
    : trial_minutes)

let device_platform_of_yojson (tree : t) path =
  ((match tree with
    | `String "ANDROID" -> ANDROID
    | `String "IOS" -> IOS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DevicePlatform" value)
    | _ -> raise (deserialize_wrong_type_error path "DevicePlatform")
     : device_platform)
    : device_platform)

let purchased_devices_map_of_yojson tree path =
  map_of_yojson device_platform_of_yojson integer_of_yojson tree path

let account_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_account_number =
       option_of_yojson (value_for_key aws_account_number_of_yojson "awsAccountNumber") _list path;
     unmetered_devices =
       option_of_yojson
         (value_for_key purchased_devices_map_of_yojson "unmeteredDevices")
         _list path;
     unmetered_remote_access_devices =
       option_of_yojson
         (value_for_key purchased_devices_map_of_yojson "unmeteredRemoteAccessDevices")
         _list path;
     max_job_timeout_minutes =
       option_of_yojson
         (value_for_key job_timeout_minutes_of_yojson "maxJobTimeoutMinutes")
         _list path;
     trial_minutes =
       option_of_yojson (value_for_key trial_minutes_of_yojson "trialMinutes") _list path;
     max_slots = option_of_yojson (value_for_key max_slot_map_of_yojson "maxSlots") _list path;
     default_job_timeout_minutes =
       option_of_yojson
         (value_for_key job_timeout_minutes_of_yojson "defaultJobTimeoutMinutes")
         _list path;
     skip_app_resign =
       option_of_yojson (value_for_key skip_app_resign_of_yojson "skipAppResign") _list path;
   }
    : account_settings)

let accounts_cleanup_of_yojson = bool_of_yojson
let amazon_resource_name_of_yojson = string_of_yojson

let amazon_resource_names_of_yojson tree path =
  list_of_yojson amazon_resource_name_of_yojson tree path

let amazon_role_resource_name_of_yojson = string_of_yojson
let android_paths_of_yojson tree path = list_of_yojson string__of_yojson tree path
let app_packages_cleanup_of_yojson = bool_of_yojson
let message_of_yojson = string_of_yojson

let argument_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : argument_exception)

let ur_l_of_yojson = string_of_yojson

let artifact_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNKNOWN" -> UNKNOWN
    | `String "SCREENSHOT" -> SCREENSHOT
    | `String "DEVICE_LOG" -> DEVICE_LOG
    | `String "MESSAGE_LOG" -> MESSAGE_LOG
    | `String "VIDEO_LOG" -> VIDEO_LOG
    | `String "RESULT_LOG" -> RESULT_LOG
    | `String "SERVICE_LOG" -> SERVICE_LOG
    | `String "WEBKIT_LOG" -> WEBKIT_LOG
    | `String "INSTRUMENTATION_OUTPUT" -> INSTRUMENTATION_OUTPUT
    | `String "EXERCISER_MONKEY_OUTPUT" -> EXERCISER_MONKEY_OUTPUT
    | `String "CALABASH_JSON_OUTPUT" -> CALABASH_JSON_OUTPUT
    | `String "CALABASH_PRETTY_OUTPUT" -> CALABASH_PRETTY_OUTPUT
    | `String "CALABASH_STANDARD_OUTPUT" -> CALABASH_STANDARD_OUTPUT
    | `String "CALABASH_JAVA_XML_OUTPUT" -> CALABASH_JAVA_XML_OUTPUT
    | `String "AUTOMATION_OUTPUT" -> AUTOMATION_OUTPUT
    | `String "APPIUM_SERVER_OUTPUT" -> APPIUM_SERVER_OUTPUT
    | `String "APPIUM_JAVA_OUTPUT" -> APPIUM_JAVA_OUTPUT
    | `String "APPIUM_JAVA_XML_OUTPUT" -> APPIUM_JAVA_XML_OUTPUT
    | `String "APPIUM_PYTHON_OUTPUT" -> APPIUM_PYTHON_OUTPUT
    | `String "APPIUM_PYTHON_XML_OUTPUT" -> APPIUM_PYTHON_XML_OUTPUT
    | `String "EXPLORER_EVENT_LOG" -> EXPLORER_EVENT_LOG
    | `String "EXPLORER_SUMMARY_LOG" -> EXPLORER_SUMMARY_LOG
    | `String "APPLICATION_CRASH_REPORT" -> APPLICATION_CRASH_REPORT
    | `String "XCTEST_LOG" -> XCTEST_LOG
    | `String "VIDEO" -> VIDEO
    | `String "CUSTOMER_ARTIFACT" -> CUSTOMER_ARTIFACT
    | `String "CUSTOMER_ARTIFACT_LOG" -> CUSTOMER_ARTIFACT_LOG
    | `String "TESTSPEC_OUTPUT" -> TESTSPEC_OUTPUT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ArtifactType" value)
    | _ -> raise (deserialize_wrong_type_error path "ArtifactType")
     : artifact_type)
    : artifact_type)

let name_of_yojson = string_of_yojson

let artifact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key artifact_type_of_yojson "type") _list path;
     extension = option_of_yojson (value_for_key string__of_yojson "extension") _list path;
     url = option_of_yojson (value_for_key ur_l_of_yojson "url") _list path;
   }
    : artifact)

let artifact_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "SCREENSHOT" -> SCREENSHOT
    | `String "FILE" -> FILE
    | `String "LOG" -> LOG
    | `String value -> raise (deserialize_unknown_enum_value_error path "ArtifactCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "ArtifactCategory")
     : artifact_category)
    : artifact_category)

let artifacts_of_yojson tree path = list_of_yojson artifact_of_yojson tree path

let auxiliary_app_arn_list_of_yojson tree path =
  list_of_yojson amazon_resource_name_of_yojson tree path

let billing_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "METERED" -> METERED
    | `String "UNMETERED" -> UNMETERED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillingMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingMethod")
     : billing_method)
    : billing_method)

let boolean__of_yojson = bool_of_yojson

let cp_u_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     frequency = option_of_yojson (value_for_key string__of_yojson "frequency") _list path;
     architecture = option_of_yojson (value_for_key string__of_yojson "architecture") _list path;
     clock = option_of_yojson (value_for_key double_of_yojson "clock") _list path;
   }
    : cp_u)

let cannot_delete_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : cannot_delete_exception)

let content_type_of_yojson = string_of_yojson

let counters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total = option_of_yojson (value_for_key integer_of_yojson "total") _list path;
     passed = option_of_yojson (value_for_key integer_of_yojson "passed") _list path;
     failed = option_of_yojson (value_for_key integer_of_yojson "failed") _list path;
     warned = option_of_yojson (value_for_key integer_of_yojson "warned") _list path;
     errored = option_of_yojson (value_for_key integer_of_yojson "errored") _list path;
     stopped = option_of_yojson (value_for_key integer_of_yojson "stopped") _list path;
     skipped = option_of_yojson (value_for_key integer_of_yojson "skipped") _list path;
   }
    : counters)

let service_account_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : service_account_exception)

let not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : not_found_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let rule_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String "LESS_THAN" -> LESS_THAN
    | `String "LESS_THAN_OR_EQUALS" -> LESS_THAN_OR_EQUALS
    | `String "GREATER_THAN" -> GREATER_THAN
    | `String "GREATER_THAN_OR_EQUALS" -> GREATER_THAN_OR_EQUALS
    | `String "IN" -> IN
    | `String "NOT_IN" -> NOT_IN
    | `String "CONTAINS" -> CONTAINS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleOperator")
     : rule_operator)
    : rule_operator)

let device_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "ARN" -> ARN
    | `String "PLATFORM" -> PLATFORM
    | `String "FORM_FACTOR" -> FORM_FACTOR
    | `String "MANUFACTURER" -> MANUFACTURER
    | `String "REMOTE_ACCESS_ENABLED" -> REMOTE_ACCESS_ENABLED
    | `String "REMOTE_DEBUG_ENABLED" -> REMOTE_DEBUG_ENABLED
    | `String "APPIUM_VERSION" -> APPIUM_VERSION
    | `String "INSTANCE_ARN" -> INSTANCE_ARN
    | `String "INSTANCE_LABELS" -> INSTANCE_LABELS
    | `String "FLEET_TYPE" -> FLEET_TYPE
    | `String "OS_VERSION" -> OS_VERSION
    | `String "MODEL" -> MODEL
    | `String "AVAILABILITY" -> AVAILABILITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeviceAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "DeviceAttribute")
     : device_attribute)
    : device_attribute)

let rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute = option_of_yojson (value_for_key device_attribute_of_yojson "attribute") _list path;
     operator = option_of_yojson (value_for_key rule_operator_of_yojson "operator") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "value") _list path;
   }
    : rule)

let rules_of_yojson tree path = list_of_yojson rule_of_yojson tree path

let device_pool_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CURATED" -> CURATED
    | `String "PRIVATE" -> PRIVATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DevicePoolType" value)
    | _ -> raise (deserialize_wrong_type_error path "DevicePoolType")
     : device_pool_type)
    : device_pool_type)

let device_pool_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     description = option_of_yojson (value_for_key message_of_yojson "description") _list path;
     type_ = option_of_yojson (value_for_key device_pool_type_of_yojson "type") _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "rules") _list path;
     max_devices = option_of_yojson (value_for_key integer_of_yojson "maxDevices") _list path;
   }
    : device_pool)

let create_device_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ device_pool = option_of_yojson (value_for_key device_pool_of_yojson "devicePool") _list path }
    : create_device_pool_result)

let create_device_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key amazon_resource_name_of_yojson "projectArn" _list path;
     name = value_for_key name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key message_of_yojson "description") _list path;
     rules = value_for_key rules_of_yojson "rules" _list path;
     max_devices = option_of_yojson (value_for_key integer_of_yojson "maxDevices") _list path;
   }
    : create_device_pool_request)

let package_ids_of_yojson tree path = list_of_yojson string__of_yojson tree path

let instance_profile_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     package_cleanup =
       option_of_yojson (value_for_key boolean__of_yojson "packageCleanup") _list path;
     exclude_app_packages_from_cleanup =
       option_of_yojson
         (value_for_key package_ids_of_yojson "excludeAppPackagesFromCleanup")
         _list path;
     reboot_after_use =
       option_of_yojson (value_for_key boolean__of_yojson "rebootAfterUse") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     description = option_of_yojson (value_for_key message_of_yojson "description") _list path;
   }
    : instance_profile)

let create_instance_profile_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_profile =
       option_of_yojson (value_for_key instance_profile_of_yojson "instanceProfile") _list path;
   }
    : create_instance_profile_result)

let create_instance_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key message_of_yojson "description") _list path;
     package_cleanup =
       option_of_yojson (value_for_key boolean__of_yojson "packageCleanup") _list path;
     exclude_app_packages_from_cleanup =
       option_of_yojson
         (value_for_key package_ids_of_yojson "excludeAppPackagesFromCleanup")
         _list path;
     reboot_after_use =
       option_of_yojson (value_for_key boolean__of_yojson "rebootAfterUse") _list path;
   }
    : create_instance_profile_request)

let percent_integer_of_yojson = int_of_yojson
let long_of_yojson = long_of_yojson

let network_profile_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CURATED" -> CURATED
    | `String "PRIVATE" -> PRIVATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "NetworkProfileType" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkProfileType")
     : network_profile_type)
    : network_profile_type)

let network_profile_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     description = option_of_yojson (value_for_key message_of_yojson "description") _list path;
     type_ = option_of_yojson (value_for_key network_profile_type_of_yojson "type") _list path;
     uplink_bandwidth_bits =
       option_of_yojson (value_for_key long_of_yojson "uplinkBandwidthBits") _list path;
     downlink_bandwidth_bits =
       option_of_yojson (value_for_key long_of_yojson "downlinkBandwidthBits") _list path;
     uplink_delay_ms = option_of_yojson (value_for_key long_of_yojson "uplinkDelayMs") _list path;
     downlink_delay_ms =
       option_of_yojson (value_for_key long_of_yojson "downlinkDelayMs") _list path;
     uplink_jitter_ms = option_of_yojson (value_for_key long_of_yojson "uplinkJitterMs") _list path;
     downlink_jitter_ms =
       option_of_yojson (value_for_key long_of_yojson "downlinkJitterMs") _list path;
     uplink_loss_percent =
       option_of_yojson (value_for_key percent_integer_of_yojson "uplinkLossPercent") _list path;
     downlink_loss_percent =
       option_of_yojson (value_for_key percent_integer_of_yojson "downlinkLossPercent") _list path;
   }
    : network_profile)

let create_network_profile_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_profile =
       option_of_yojson (value_for_key network_profile_of_yojson "networkProfile") _list path;
   }
    : create_network_profile_result)

let create_network_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key amazon_resource_name_of_yojson "projectArn" _list path;
     name = value_for_key name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key message_of_yojson "description") _list path;
     type_ = option_of_yojson (value_for_key network_profile_type_of_yojson "type") _list path;
     uplink_bandwidth_bits =
       option_of_yojson (value_for_key long_of_yojson "uplinkBandwidthBits") _list path;
     downlink_bandwidth_bits =
       option_of_yojson (value_for_key long_of_yojson "downlinkBandwidthBits") _list path;
     uplink_delay_ms = option_of_yojson (value_for_key long_of_yojson "uplinkDelayMs") _list path;
     downlink_delay_ms =
       option_of_yojson (value_for_key long_of_yojson "downlinkDelayMs") _list path;
     uplink_jitter_ms = option_of_yojson (value_for_key long_of_yojson "uplinkJitterMs") _list path;
     downlink_jitter_ms =
       option_of_yojson (value_for_key long_of_yojson "downlinkJitterMs") _list path;
     uplink_loss_percent =
       option_of_yojson (value_for_key percent_integer_of_yojson "uplinkLossPercent") _list path;
     downlink_loss_percent =
       option_of_yojson (value_for_key percent_integer_of_yojson "downlinkLossPercent") _list path;
   }
    : create_network_profile_request)

let exception_message_of_yojson = string_of_yojson

let tag_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     resource_name =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "resourceName") _list path;
   }
    : tag_operation_exception)

let environment_variable_value_of_yojson = string_of_yojson
let environment_variable_name_of_yojson = string_of_yojson

let environment_variable_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key environment_variable_name_of_yojson "name" _list path;
     value = value_for_key environment_variable_value_of_yojson "value" _list path;
   }
    : environment_variable)

let environment_variables_of_yojson tree path =
  list_of_yojson environment_variable_of_yojson tree path

let non_empty_string_of_yojson = string_of_yojson
let subnet_id_of_yojson = string_of_yojson
let vpc_subnet_ids_of_yojson tree path = list_of_yojson subnet_id_of_yojson tree path
let security_group_id_of_yojson = string_of_yojson

let vpc_security_group_ids_of_yojson tree path =
  list_of_yojson security_group_id_of_yojson tree path

let vpc_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_group_ids =
       value_for_key vpc_security_group_ids_of_yojson "securityGroupIds" _list path;
     subnet_ids = value_for_key vpc_subnet_ids_of_yojson "subnetIds" _list path;
     vpc_id = value_for_key non_empty_string_of_yojson "vpcId" _list path;
   }
    : vpc_config)

let date_time_of_yojson = timestamp_epoch_seconds_of_yojson

let project_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     default_job_timeout_minutes =
       option_of_yojson
         (value_for_key job_timeout_minutes_of_yojson "defaultJobTimeoutMinutes")
         _list path;
     created = option_of_yojson (value_for_key date_time_of_yojson "created") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     environment_variables =
       option_of_yojson
         (value_for_key environment_variables_of_yojson "environmentVariables")
         _list path;
     execution_role_arn =
       option_of_yojson
         (value_for_key amazon_role_resource_name_of_yojson "executionRoleArn")
         _list path;
   }
    : project)

let create_project_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ project = option_of_yojson (value_for_key project_of_yojson "project") _list path }
    : create_project_result)

let create_project_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     default_job_timeout_minutes =
       option_of_yojson
         (value_for_key job_timeout_minutes_of_yojson "defaultJobTimeoutMinutes")
         _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     environment_variables =
       option_of_yojson
         (value_for_key environment_variables_of_yojson "environmentVariables")
         _list path;
     execution_role_arn =
       option_of_yojson
         (value_for_key amazon_role_resource_name_of_yojson "executionRoleArn")
         _list path;
   }
    : create_project_request)

let sensitive_ur_l_of_yojson = string_of_yojson

let remote_access_endpoints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remote_driver_endpoint =
       option_of_yojson (value_for_key sensitive_ur_l_of_yojson "remoteDriverEndpoint") _list path;
     interactive_endpoint =
       option_of_yojson (value_for_key sensitive_ur_l_of_yojson "interactiveEndpoint") _list path;
   }
    : remote_access_endpoints)

let device_proxy_port_of_yojson = int_of_yojson
let device_proxy_host_of_yojson = string_of_yojson

let device_proxy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host = value_for_key device_proxy_host_of_yojson "host" _list path;
     port = value_for_key device_proxy_port_of_yojson "port" _list path;
   }
    : device_proxy)

let interaction_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERACTIVE" -> INTERACTIVE
    | `String "NO_VIDEO" -> NO_VIDEO
    | `String "VIDEO_ONLY" -> VIDEO_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "InteractionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "InteractionMode")
     : interaction_mode)
    : interaction_mode)

let device_minutes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total = option_of_yojson (value_for_key double_of_yojson "total") _list path;
     metered = option_of_yojson (value_for_key double_of_yojson "metered") _list path;
     unmetered = option_of_yojson (value_for_key double_of_yojson "unmetered") _list path;
   }
    : device_minutes)

let device_availability_of_yojson (tree : t) path =
  ((match tree with
    | `String "TEMPORARY_NOT_AVAILABLE" -> TEMPORARY_NOT_AVAILABLE
    | `String "BUSY" -> BUSY
    | `String "AVAILABLE" -> AVAILABLE
    | `String "HIGHLY_AVAILABLE" -> HIGHLY_AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeviceAvailability" value)
    | _ -> raise (deserialize_wrong_type_error path "DeviceAvailability")
     : device_availability)
    : device_availability)

let instance_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_USE" -> IN_USE
    | `String "PREPARING" -> PREPARING
    | `String "AVAILABLE" -> AVAILABLE
    | `String "NOT_AVAILABLE" -> NOT_AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceStatus")
     : instance_status)
    : instance_status)

let instance_labels_of_yojson tree path = list_of_yojson string__of_yojson tree path

let device_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     device_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "deviceArn") _list path;
     labels = option_of_yojson (value_for_key instance_labels_of_yojson "labels") _list path;
     status = option_of_yojson (value_for_key instance_status_of_yojson "status") _list path;
     udid = option_of_yojson (value_for_key string__of_yojson "udid") _list path;
     instance_profile =
       option_of_yojson (value_for_key instance_profile_of_yojson "instanceProfile") _list path;
   }
    : device_instance)

let device_instances_of_yojson tree path = list_of_yojson device_instance_of_yojson tree path

let resolution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     width = option_of_yojson (value_for_key integer_of_yojson "width") _list path;
     height = option_of_yojson (value_for_key integer_of_yojson "height") _list path;
   }
    : resolution)

let device_form_factor_of_yojson (tree : t) path =
  ((match tree with
    | `String "PHONE" -> PHONE
    | `String "TABLET" -> TABLET
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeviceFormFactor" value)
    | _ -> raise (deserialize_wrong_type_error path "DeviceFormFactor")
     : device_form_factor)
    : device_form_factor)

let device_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     manufacturer = option_of_yojson (value_for_key string__of_yojson "manufacturer") _list path;
     model = option_of_yojson (value_for_key string__of_yojson "model") _list path;
     model_id = option_of_yojson (value_for_key string__of_yojson "modelId") _list path;
     form_factor =
       option_of_yojson (value_for_key device_form_factor_of_yojson "formFactor") _list path;
     platform = option_of_yojson (value_for_key device_platform_of_yojson "platform") _list path;
     os = option_of_yojson (value_for_key string__of_yojson "os") _list path;
     cpu = option_of_yojson (value_for_key cp_u_of_yojson "cpu") _list path;
     resolution = option_of_yojson (value_for_key resolution_of_yojson "resolution") _list path;
     heap_size = option_of_yojson (value_for_key long_of_yojson "heapSize") _list path;
     memory = option_of_yojson (value_for_key long_of_yojson "memory") _list path;
     image = option_of_yojson (value_for_key string__of_yojson "image") _list path;
     carrier = option_of_yojson (value_for_key string__of_yojson "carrier") _list path;
     radio = option_of_yojson (value_for_key string__of_yojson "radio") _list path;
     remote_access_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "remoteAccessEnabled") _list path;
     remote_debug_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "remoteDebugEnabled") _list path;
     fleet_type = option_of_yojson (value_for_key string__of_yojson "fleetType") _list path;
     fleet_name = option_of_yojson (value_for_key string__of_yojson "fleetName") _list path;
     instances = option_of_yojson (value_for_key device_instances_of_yojson "instances") _list path;
     availability =
       option_of_yojson (value_for_key device_availability_of_yojson "availability") _list path;
   }
    : device)

let execution_result_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "PASSED" -> PASSED
    | `String "WARNED" -> WARNED
    | `String "FAILED" -> FAILED
    | `String "SKIPPED" -> SKIPPED
    | `String "ERRORED" -> ERRORED
    | `String "STOPPED" -> STOPPED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionResult" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionResult")
     : execution_result)
    : execution_result)

let execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "PENDING_CONCURRENCY" -> PENDING_CONCURRNECY
    | `String "PENDING_DEVICE" -> PENDING_DEVICE
    | `String "PROCESSING" -> PROCESSING
    | `String "SCHEDULING" -> SCHEDULING
    | `String "PREPARING" -> PREPARING
    | `String "RUNNING" -> RUNNING
    | `String "COMPLETED" -> COMPLETED
    | `String "STOPPING" -> STOPPING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionStatus")
     : execution_status)
    : execution_status)

let remote_access_session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     created = option_of_yojson (value_for_key date_time_of_yojson "created") _list path;
     status = option_of_yojson (value_for_key execution_status_of_yojson "status") _list path;
     result_ = option_of_yojson (value_for_key execution_result_of_yojson "result") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     started = option_of_yojson (value_for_key date_time_of_yojson "started") _list path;
     stopped = option_of_yojson (value_for_key date_time_of_yojson "stopped") _list path;
     device = option_of_yojson (value_for_key device_of_yojson "device") _list path;
     instance_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "instanceArn") _list path;
     billing_method =
       option_of_yojson (value_for_key billing_method_of_yojson "billingMethod") _list path;
     device_minutes =
       option_of_yojson (value_for_key device_minutes_of_yojson "deviceMinutes") _list path;
     endpoint = option_of_yojson (value_for_key string__of_yojson "endpoint") _list path;
     device_udid = option_of_yojson (value_for_key string__of_yojson "deviceUdid") _list path;
     interaction_mode =
       option_of_yojson (value_for_key interaction_mode_of_yojson "interactionMode") _list path;
     skip_app_resign =
       option_of_yojson (value_for_key skip_app_resign_of_yojson "skipAppResign") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     device_proxy = option_of_yojson (value_for_key device_proxy_of_yojson "deviceProxy") _list path;
     app_upload =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "appUpload") _list path;
     endpoints =
       option_of_yojson (value_for_key remote_access_endpoints_of_yojson "endpoints") _list path;
   }
    : remote_access_session)

let create_remote_access_session_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remote_access_session =
       option_of_yojson
         (value_for_key remote_access_session_of_yojson "remoteAccessSession")
         _list path;
   }
    : create_remote_access_session_result)

let create_remote_access_session_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auxiliary_apps =
       option_of_yojson (value_for_key auxiliary_app_arn_list_of_yojson "auxiliaryApps") _list path;
     billing_method =
       option_of_yojson (value_for_key billing_method_of_yojson "billingMethod") _list path;
     vpce_configuration_arns =
       option_of_yojson
         (value_for_key amazon_resource_names_of_yojson "vpceConfigurationArns")
         _list path;
     device_proxy = option_of_yojson (value_for_key device_proxy_of_yojson "deviceProxy") _list path;
   }
    : create_remote_access_session_configuration)

let create_remote_access_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key amazon_resource_name_of_yojson "projectArn" _list path;
     device_arn = value_for_key amazon_resource_name_of_yojson "deviceArn" _list path;
     app_arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "appArn") _list path;
     instance_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "instanceArn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     configuration =
       option_of_yojson
         (value_for_key create_remote_access_session_configuration_of_yojson "configuration")
         _list path;
     interaction_mode =
       option_of_yojson (value_for_key interaction_mode_of_yojson "interactionMode") _list path;
     skip_app_resign =
       option_of_yojson (value_for_key boolean__of_yojson "skipAppResign") _list path;
   }
    : create_remote_access_session_request)

let internal_service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : internal_service_exception)

let subnet_ids_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path
let security_group_ids_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let test_grid_vpc_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_group_ids = value_for_key security_group_ids_of_yojson "securityGroupIds" _list path;
     subnet_ids = value_for_key subnet_ids_of_yojson "subnetIds" _list path;
     vpc_id = value_for_key non_empty_string_of_yojson "vpcId" _list path;
   }
    : test_grid_vpc_config)

let device_farm_arn_of_yojson = string_of_yojson

let test_grid_project_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key device_farm_arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     vpc_config =
       option_of_yojson (value_for_key test_grid_vpc_config_of_yojson "vpcConfig") _list path;
     created = option_of_yojson (value_for_key date_time_of_yojson "created") _list path;
   }
    : test_grid_project)

let create_test_grid_project_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_grid_project =
       option_of_yojson (value_for_key test_grid_project_of_yojson "testGridProject") _list path;
   }
    : create_test_grid_project_result)

let resource_description_of_yojson = string_of_yojson
let resource_name_of_yojson = string_of_yojson

let create_test_grid_project_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "name" _list path;
     description =
       option_of_yojson (value_for_key resource_description_of_yojson "description") _list path;
     vpc_config =
       option_of_yojson (value_for_key test_grid_vpc_config_of_yojson "vpcConfig") _list path;
   }
    : create_test_grid_project_request)

let sensitive_string_of_yojson = string_of_yojson

let create_test_grid_url_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     url = option_of_yojson (value_for_key sensitive_string_of_yojson "url") _list path;
     expires = option_of_yojson (value_for_key date_time_of_yojson "expires") _list path;
   }
    : create_test_grid_url_result)

let test_grid_url_expires_in_seconds_input_of_yojson = int_of_yojson

let create_test_grid_url_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key device_farm_arn_of_yojson "projectArn" _list path;
     expires_in_seconds =
       value_for_key test_grid_url_expires_in_seconds_input_of_yojson "expiresInSeconds" _list path;
   }
    : create_test_grid_url_request)

let upload_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "CURATED" -> CURATED
    | `String "PRIVATE" -> PRIVATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "UploadCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "UploadCategory")
     : upload_category)
    : upload_category)

let metadata_of_yojson = string_of_yojson

let upload_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "INITIALIZED" -> INITIALIZED
    | `String "PROCESSING" -> PROCESSING
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UploadStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "UploadStatus")
     : upload_status)
    : upload_status)

let upload_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ANDROID_APP" -> ANDROID_APP
    | `String "IOS_APP" -> IOS_APP
    | `String "WEB_APP" -> WEB_APP
    | `String "EXTERNAL_DATA" -> EXTERNAL_DATA
    | `String "APPIUM_JAVA_JUNIT_TEST_PACKAGE" -> APPIUM_JAVA_JUNIT_TEST_PACKAGE
    | `String "APPIUM_JAVA_TESTNG_TEST_PACKAGE" -> APPIUM_JAVA_TESTNG_TEST_PACKAGE
    | `String "APPIUM_PYTHON_TEST_PACKAGE" -> APPIUM_PYTHON_TEST_PACKAGE
    | `String "APPIUM_NODE_TEST_PACKAGE" -> APPIUM_NODE_TEST_PACKAGE
    | `String "APPIUM_RUBY_TEST_PACKAGE" -> APPIUM_RUBY_TEST_PACKAGE
    | `String "APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE" -> APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE
    | `String "APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE" -> APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE
    | `String "APPIUM_WEB_PYTHON_TEST_PACKAGE" -> APPIUM_WEB_PYTHON_TEST_PACKAGE
    | `String "APPIUM_WEB_NODE_TEST_PACKAGE" -> APPIUM_WEB_NODE_TEST_PACKAGE
    | `String "APPIUM_WEB_RUBY_TEST_PACKAGE" -> APPIUM_WEB_RUBY_TEST_PACKAGE
    | `String "CALABASH_TEST_PACKAGE" -> CALABASH_TEST_PACKAGE
    | `String "INSTRUMENTATION_TEST_PACKAGE" -> INSTRUMENTATION_TEST_PACKAGE
    | `String "UIAUTOMATION_TEST_PACKAGE" -> UIAUTOMATION_TEST_PACKAGE
    | `String "UIAUTOMATOR_TEST_PACKAGE" -> UIAUTOMATOR_TEST_PACKAGE
    | `String "XCTEST_TEST_PACKAGE" -> XCTEST_TEST_PACKAGE
    | `String "XCTEST_UI_TEST_PACKAGE" -> XCTEST_UI_TEST_PACKAGE
    | `String "APPIUM_JAVA_JUNIT_TEST_SPEC" -> APPIUM_JAVA_JUNIT_TEST_SPEC
    | `String "APPIUM_JAVA_TESTNG_TEST_SPEC" -> APPIUM_JAVA_TESTNG_TEST_SPEC
    | `String "APPIUM_PYTHON_TEST_SPEC" -> APPIUM_PYTHON_TEST_SPEC
    | `String "APPIUM_NODE_TEST_SPEC" -> APPIUM_NODE_TEST_SPEC
    | `String "APPIUM_RUBY_TEST_SPEC" -> APPIUM_RUBY_TEST_SPEC
    | `String "APPIUM_WEB_JAVA_JUNIT_TEST_SPEC" -> APPIUM_WEB_JAVA_JUNIT_TEST_SPEC
    | `String "APPIUM_WEB_JAVA_TESTNG_TEST_SPEC" -> APPIUM_WEB_JAVA_TESTNG_TEST_SPEC
    | `String "APPIUM_WEB_PYTHON_TEST_SPEC" -> APPIUM_WEB_PYTHON_TEST_SPEC
    | `String "APPIUM_WEB_NODE_TEST_SPEC" -> APPIUM_WEB_NODE_TEST_SPEC
    | `String "APPIUM_WEB_RUBY_TEST_SPEC" -> APPIUM_WEB_RUBY_TEST_SPEC
    | `String "INSTRUMENTATION_TEST_SPEC" -> INSTRUMENTATION_TEST_SPEC
    | `String "XCTEST_UI_TEST_SPEC" -> XCTEST_UI_TEST_SPEC
    | `String value -> raise (deserialize_unknown_enum_value_error path "UploadType" value)
    | _ -> raise (deserialize_wrong_type_error path "UploadType")
     : upload_type)
    : upload_type)

let upload_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     created = option_of_yojson (value_for_key date_time_of_yojson "created") _list path;
     type_ = option_of_yojson (value_for_key upload_type_of_yojson "type") _list path;
     status = option_of_yojson (value_for_key upload_status_of_yojson "status") _list path;
     url = option_of_yojson (value_for_key sensitive_ur_l_of_yojson "url") _list path;
     metadata = option_of_yojson (value_for_key metadata_of_yojson "metadata") _list path;
     content_type = option_of_yojson (value_for_key content_type_of_yojson "contentType") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     category = option_of_yojson (value_for_key upload_category_of_yojson "category") _list path;
   }
    : upload)

let create_upload_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ upload = option_of_yojson (value_for_key upload_of_yojson "upload") _list path }
    : create_upload_result)

let create_upload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key amazon_resource_name_of_yojson "projectArn" _list path;
     name = value_for_key name_of_yojson "name" _list path;
     type_ = value_for_key upload_type_of_yojson "type" _list path;
     content_type = option_of_yojson (value_for_key content_type_of_yojson "contentType") _list path;
   }
    : create_upload_request)

let vpce_configuration_description_of_yojson = string_of_yojson
let service_dns_name_of_yojson = string_of_yojson
let vpce_service_name_of_yojson = string_of_yojson
let vpce_configuration_name_of_yojson = string_of_yojson

let vpce_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     vpce_configuration_name =
       option_of_yojson
         (value_for_key vpce_configuration_name_of_yojson "vpceConfigurationName")
         _list path;
     vpce_service_name =
       option_of_yojson (value_for_key vpce_service_name_of_yojson "vpceServiceName") _list path;
     service_dns_name =
       option_of_yojson (value_for_key service_dns_name_of_yojson "serviceDnsName") _list path;
     vpce_configuration_description =
       option_of_yojson
         (value_for_key vpce_configuration_description_of_yojson "vpceConfigurationDescription")
         _list path;
   }
    : vpce_configuration)

let create_vpce_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpce_configuration =
       option_of_yojson (value_for_key vpce_configuration_of_yojson "vpceConfiguration") _list path;
   }
    : create_vpce_configuration_result)

let create_vpce_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpce_configuration_name =
       value_for_key vpce_configuration_name_of_yojson "vpceConfigurationName" _list path;
     vpce_service_name = value_for_key vpce_service_name_of_yojson "vpceServiceName" _list path;
     service_dns_name = value_for_key service_dns_name_of_yojson "serviceDnsName" _list path;
     vpce_configuration_description =
       option_of_yojson
         (value_for_key vpce_configuration_description_of_yojson "vpceConfigurationDescription")
         _list path;
   }
    : create_vpce_configuration_request)

let currency_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "USD" -> USD
    | `String value -> raise (deserialize_unknown_enum_value_error path "CurrencyCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CurrencyCode")
     : currency_code)
    : currency_code)

let device_host_paths_of_yojson tree path = list_of_yojson string__of_yojson tree path
let ios_paths_of_yojson tree path = list_of_yojson string__of_yojson tree path

let customer_artifact_paths_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ios_paths = option_of_yojson (value_for_key ios_paths_of_yojson "iosPaths") _list path;
     android_paths =
       option_of_yojson (value_for_key android_paths_of_yojson "androidPaths") _list path;
     device_host_paths =
       option_of_yojson (value_for_key device_host_paths_of_yojson "deviceHostPaths") _list path;
   }
    : customer_artifact_paths)

let delete_device_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_device_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : delete_device_pool_request)

let delete_instance_profile_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_instance_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : delete_instance_profile_request)

let delete_network_profile_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_network_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : delete_network_profile_request)

let delete_project_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_project_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : delete_project_request)

let delete_remote_access_session_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_remote_access_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : delete_remote_access_session_request)

let delete_run_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : delete_run_request)

let delete_test_grid_project_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_test_grid_project_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ project_arn = value_for_key device_farm_arn_of_yojson "projectArn" _list path }
    : delete_test_grid_project_request)

let delete_upload_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_upload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : delete_upload_request)

let invalid_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_operation_exception)

let delete_vpce_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_vpce_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : delete_vpce_configuration_request)

let update_vpce_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpce_configuration =
       option_of_yojson (value_for_key vpce_configuration_of_yojson "vpceConfiguration") _list path;
   }
    : update_vpce_configuration_result)

let update_vpce_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     vpce_configuration_name =
       option_of_yojson
         (value_for_key vpce_configuration_name_of_yojson "vpceConfigurationName")
         _list path;
     vpce_service_name =
       option_of_yojson (value_for_key vpce_service_name_of_yojson "vpceServiceName") _list path;
     service_dns_name =
       option_of_yojson (value_for_key service_dns_name_of_yojson "serviceDnsName") _list path;
     vpce_configuration_description =
       option_of_yojson
         (value_for_key vpce_configuration_description_of_yojson "vpceConfigurationDescription")
         _list path;
   }
    : update_vpce_configuration_request)

let update_upload_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ upload = option_of_yojson (value_for_key upload_of_yojson "upload") _list path }
    : update_upload_result)

let update_upload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     content_type = option_of_yojson (value_for_key content_type_of_yojson "contentType") _list path;
     edit_content = option_of_yojson (value_for_key boolean__of_yojson "editContent") _list path;
   }
    : update_upload_request)

let update_test_grid_project_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_grid_project =
       option_of_yojson (value_for_key test_grid_project_of_yojson "testGridProject") _list path;
   }
    : update_test_grid_project_result)

let update_test_grid_project_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key device_farm_arn_of_yojson "projectArn" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     description =
       option_of_yojson (value_for_key resource_description_of_yojson "description") _list path;
     vpc_config =
       option_of_yojson (value_for_key test_grid_vpc_config_of_yojson "vpcConfig") _list path;
   }
    : update_test_grid_project_request)

let update_project_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ project = option_of_yojson (value_for_key project_of_yojson "project") _list path }
    : update_project_result)

let update_project_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     default_job_timeout_minutes =
       option_of_yojson
         (value_for_key job_timeout_minutes_of_yojson "defaultJobTimeoutMinutes")
         _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     environment_variables =
       option_of_yojson
         (value_for_key environment_variables_of_yojson "environmentVariables")
         _list path;
     execution_role_arn =
       option_of_yojson
         (value_for_key amazon_role_resource_name_of_yojson "executionRoleArn")
         _list path;
   }
    : update_project_request)

let update_network_profile_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_profile =
       option_of_yojson (value_for_key network_profile_of_yojson "networkProfile") _list path;
   }
    : update_network_profile_result)

let update_network_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     description = option_of_yojson (value_for_key message_of_yojson "description") _list path;
     type_ = option_of_yojson (value_for_key network_profile_type_of_yojson "type") _list path;
     uplink_bandwidth_bits =
       option_of_yojson (value_for_key long_of_yojson "uplinkBandwidthBits") _list path;
     downlink_bandwidth_bits =
       option_of_yojson (value_for_key long_of_yojson "downlinkBandwidthBits") _list path;
     uplink_delay_ms = option_of_yojson (value_for_key long_of_yojson "uplinkDelayMs") _list path;
     downlink_delay_ms =
       option_of_yojson (value_for_key long_of_yojson "downlinkDelayMs") _list path;
     uplink_jitter_ms = option_of_yojson (value_for_key long_of_yojson "uplinkJitterMs") _list path;
     downlink_jitter_ms =
       option_of_yojson (value_for_key long_of_yojson "downlinkJitterMs") _list path;
     uplink_loss_percent =
       option_of_yojson (value_for_key percent_integer_of_yojson "uplinkLossPercent") _list path;
     downlink_loss_percent =
       option_of_yojson (value_for_key percent_integer_of_yojson "downlinkLossPercent") _list path;
   }
    : update_network_profile_request)

let update_instance_profile_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_profile =
       option_of_yojson (value_for_key instance_profile_of_yojson "instanceProfile") _list path;
   }
    : update_instance_profile_result)

let update_instance_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     description = option_of_yojson (value_for_key message_of_yojson "description") _list path;
     package_cleanup =
       option_of_yojson (value_for_key boolean__of_yojson "packageCleanup") _list path;
     exclude_app_packages_from_cleanup =
       option_of_yojson
         (value_for_key package_ids_of_yojson "excludeAppPackagesFromCleanup")
         _list path;
     reboot_after_use =
       option_of_yojson (value_for_key boolean__of_yojson "rebootAfterUse") _list path;
   }
    : update_instance_profile_request)

let update_device_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ device_pool = option_of_yojson (value_for_key device_pool_of_yojson "devicePool") _list path }
    : update_device_pool_result)

let update_device_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     description = option_of_yojson (value_for_key message_of_yojson "description") _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "rules") _list path;
     max_devices = option_of_yojson (value_for_key integer_of_yojson "maxDevices") _list path;
     clear_max_devices =
       option_of_yojson (value_for_key boolean__of_yojson "clearMaxDevices") _list path;
   }
    : update_device_pool_request)

let update_device_instance_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_instance =
       option_of_yojson (value_for_key device_instance_of_yojson "deviceInstance") _list path;
   }
    : update_device_instance_result)

let update_device_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     profile_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "profileArn") _list path;
     labels = option_of_yojson (value_for_key instance_labels_of_yojson "labels") _list path;
   }
    : update_device_instance_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key device_farm_arn_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     resource_name =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "resourceName") _list path;
   }
    : too_many_tags_exception)

let tag_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     resource_name =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "resourceName") _list path;
   }
    : tag_policy_exception)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key device_farm_arn_of_yojson "ResourceARN" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let device_filter_values_of_yojson tree path = list_of_yojson string__of_yojson tree path

let device_filter_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "ARN" -> ARN
    | `String "PLATFORM" -> PLATFORM
    | `String "OS_VERSION" -> OS_VERSION
    | `String "MODEL" -> MODEL
    | `String "AVAILABILITY" -> AVAILABILITY
    | `String "FORM_FACTOR" -> FORM_FACTOR
    | `String "MANUFACTURER" -> MANUFACTURER
    | `String "REMOTE_ACCESS_ENABLED" -> REMOTE_ACCESS_ENABLED
    | `String "REMOTE_DEBUG_ENABLED" -> REMOTE_DEBUG_ENABLED
    | `String "INSTANCE_ARN" -> INSTANCE_ARN
    | `String "INSTANCE_LABELS" -> INSTANCE_LABELS
    | `String "FLEET_TYPE" -> FLEET_TYPE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeviceFilterAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "DeviceFilterAttribute")
     : device_filter_attribute)
    : device_filter_attribute)

let device_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute = value_for_key device_filter_attribute_of_yojson "attribute" _list path;
     operator = value_for_key rule_operator_of_yojson "operator" _list path;
     values = value_for_key device_filter_values_of_yojson "values" _list path;
   }
    : device_filter)

let device_filters_of_yojson tree path = list_of_yojson device_filter_of_yojson tree path

let device_selection_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key device_filters_of_yojson "filters") _list path;
     matched_devices_count =
       option_of_yojson (value_for_key integer_of_yojson "matchedDevicesCount") _list path;
     max_devices = option_of_yojson (value_for_key integer_of_yojson "maxDevices") _list path;
   }
    : device_selection_result)

let location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latitude = value_for_key double_of_yojson "latitude" _list path;
     longitude = value_for_key double_of_yojson "longitude" _list path;
   }
    : location)

let radios_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     wifi = option_of_yojson (value_for_key boolean__of_yojson "wifi") _list path;
     bluetooth = option_of_yojson (value_for_key boolean__of_yojson "bluetooth") _list path;
     nfc = option_of_yojson (value_for_key boolean__of_yojson "nfc") _list path;
     gps = option_of_yojson (value_for_key boolean__of_yojson "gps") _list path;
   }
    : radios)

let execution_result_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "PARSING_FAILED" -> PARSING_FAILED
    | `String "VPC_ENDPOINT_SETUP_FAILED" -> VPC_ENDPOINT_SETUP_FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionResultCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionResultCode")
     : execution_result_code)
    : execution_result_code)

let test_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BUILTIN_FUZZ" -> BUILTIN_FUZZ
    | `String "APPIUM_JAVA_JUNIT" -> APPIUM_JAVA_JUNIT
    | `String "APPIUM_JAVA_TESTNG" -> APPIUM_JAVA_TESTNG
    | `String "APPIUM_PYTHON" -> APPIUM_PYTHON
    | `String "APPIUM_NODE" -> APPIUM_NODE
    | `String "APPIUM_RUBY" -> APPIUM_RUBY
    | `String "APPIUM_WEB_JAVA_JUNIT" -> APPIUM_WEB_JAVA_JUNIT
    | `String "APPIUM_WEB_JAVA_TESTNG" -> APPIUM_WEB_JAVA_TESTNG
    | `String "APPIUM_WEB_PYTHON" -> APPIUM_WEB_PYTHON
    | `String "APPIUM_WEB_NODE" -> APPIUM_WEB_NODE
    | `String "APPIUM_WEB_RUBY" -> APPIUM_WEB_RUBY
    | `String "INSTRUMENTATION" -> INSTRUMENTATION
    | `String "XCTEST" -> XCTEST
    | `String "XCTEST_UI" -> XCTEST_UI
    | `String value -> raise (deserialize_unknown_enum_value_error path "TestType" value)
    | _ -> raise (deserialize_wrong_type_error path "TestType")
     : test_type)
    : test_type)

let run_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key test_type_of_yojson "type") _list path;
     platform = option_of_yojson (value_for_key device_platform_of_yojson "platform") _list path;
     created = option_of_yojson (value_for_key date_time_of_yojson "created") _list path;
     status = option_of_yojson (value_for_key execution_status_of_yojson "status") _list path;
     result_ = option_of_yojson (value_for_key execution_result_of_yojson "result") _list path;
     started = option_of_yojson (value_for_key date_time_of_yojson "started") _list path;
     stopped = option_of_yojson (value_for_key date_time_of_yojson "stopped") _list path;
     counters = option_of_yojson (value_for_key counters_of_yojson "counters") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     total_jobs = option_of_yojson (value_for_key integer_of_yojson "totalJobs") _list path;
     completed_jobs = option_of_yojson (value_for_key integer_of_yojson "completedJobs") _list path;
     billing_method =
       option_of_yojson (value_for_key billing_method_of_yojson "billingMethod") _list path;
     device_minutes =
       option_of_yojson (value_for_key device_minutes_of_yojson "deviceMinutes") _list path;
     network_profile =
       option_of_yojson (value_for_key network_profile_of_yojson "networkProfile") _list path;
     device_proxy = option_of_yojson (value_for_key device_proxy_of_yojson "deviceProxy") _list path;
     parsing_result_url =
       option_of_yojson (value_for_key string__of_yojson "parsingResultUrl") _list path;
     result_code =
       option_of_yojson (value_for_key execution_result_code_of_yojson "resultCode") _list path;
     seed = option_of_yojson (value_for_key integer_of_yojson "seed") _list path;
     app_upload =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "appUpload") _list path;
     event_count = option_of_yojson (value_for_key integer_of_yojson "eventCount") _list path;
     job_timeout_minutes =
       option_of_yojson (value_for_key job_timeout_minutes_of_yojson "jobTimeoutMinutes") _list path;
     device_pool_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "devicePoolArn") _list path;
     locale = option_of_yojson (value_for_key string__of_yojson "locale") _list path;
     radios = option_of_yojson (value_for_key radios_of_yojson "radios") _list path;
     location = option_of_yojson (value_for_key location_of_yojson "location") _list path;
     customer_artifact_paths =
       option_of_yojson
         (value_for_key customer_artifact_paths_of_yojson "customerArtifactPaths")
         _list path;
     web_url = option_of_yojson (value_for_key string__of_yojson "webUrl") _list path;
     skip_app_resign =
       option_of_yojson (value_for_key skip_app_resign_of_yojson "skipAppResign") _list path;
     test_spec_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "testSpecArn") _list path;
     device_selection_result =
       option_of_yojson
         (value_for_key device_selection_result_of_yojson "deviceSelectionResult")
         _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "vpcConfig") _list path;
     execution_role_arn =
       option_of_yojson
         (value_for_key amazon_role_resource_name_of_yojson "executionRoleArn")
         _list path;
     environment_variables =
       option_of_yojson
         (value_for_key environment_variables_of_yojson "environmentVariables")
         _list path;
   }
    : run)

let stop_run_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run = option_of_yojson (value_for_key run_of_yojson "run") _list path } : stop_run_result)

let stop_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : stop_run_request)

let stop_remote_access_session_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remote_access_session =
       option_of_yojson
         (value_for_key remote_access_session_of_yojson "remoteAccessSession")
         _list path;
   }
    : stop_remote_access_session_result)

let stop_remote_access_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : stop_remote_access_session_request)

let video_capture_of_yojson = bool_of_yojson

let job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key test_type_of_yojson "type") _list path;
     created = option_of_yojson (value_for_key date_time_of_yojson "created") _list path;
     status = option_of_yojson (value_for_key execution_status_of_yojson "status") _list path;
     result_ = option_of_yojson (value_for_key execution_result_of_yojson "result") _list path;
     started = option_of_yojson (value_for_key date_time_of_yojson "started") _list path;
     stopped = option_of_yojson (value_for_key date_time_of_yojson "stopped") _list path;
     counters = option_of_yojson (value_for_key counters_of_yojson "counters") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     device = option_of_yojson (value_for_key device_of_yojson "device") _list path;
     instance_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "instanceArn") _list path;
     device_minutes =
       option_of_yojson (value_for_key device_minutes_of_yojson "deviceMinutes") _list path;
     video_endpoint = option_of_yojson (value_for_key string__of_yojson "videoEndpoint") _list path;
     video_capture =
       option_of_yojson (value_for_key video_capture_of_yojson "videoCapture") _list path;
   }
    : job)

let stop_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job = option_of_yojson (value_for_key job_of_yojson "job") _list path } : stop_job_result)

let stop_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : stop_job_request)

let idempotency_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : idempotency_exception)

let schedule_run_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run = option_of_yojson (value_for_key run_of_yojson "run") _list path } : schedule_run_result)

let execution_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_timeout_minutes =
       option_of_yojson (value_for_key job_timeout_minutes_of_yojson "jobTimeoutMinutes") _list path;
     accounts_cleanup =
       option_of_yojson (value_for_key accounts_cleanup_of_yojson "accountsCleanup") _list path;
     app_packages_cleanup =
       option_of_yojson
         (value_for_key app_packages_cleanup_of_yojson "appPackagesCleanup")
         _list path;
     video_capture =
       option_of_yojson (value_for_key video_capture_of_yojson "videoCapture") _list path;
     skip_app_resign =
       option_of_yojson (value_for_key skip_app_resign_of_yojson "skipAppResign") _list path;
   }
    : execution_configuration)

let schedule_run_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     extra_data_package_arn =
       option_of_yojson
         (value_for_key amazon_resource_name_of_yojson "extraDataPackageArn")
         _list path;
     network_profile_arn =
       option_of_yojson
         (value_for_key amazon_resource_name_of_yojson "networkProfileArn")
         _list path;
     locale = option_of_yojson (value_for_key string__of_yojson "locale") _list path;
     location = option_of_yojson (value_for_key location_of_yojson "location") _list path;
     vpce_configuration_arns =
       option_of_yojson
         (value_for_key amazon_resource_names_of_yojson "vpceConfigurationArns")
         _list path;
     device_proxy = option_of_yojson (value_for_key device_proxy_of_yojson "deviceProxy") _list path;
     customer_artifact_paths =
       option_of_yojson
         (value_for_key customer_artifact_paths_of_yojson "customerArtifactPaths")
         _list path;
     radios = option_of_yojson (value_for_key radios_of_yojson "radios") _list path;
     auxiliary_apps =
       option_of_yojson (value_for_key amazon_resource_names_of_yojson "auxiliaryApps") _list path;
     billing_method =
       option_of_yojson (value_for_key billing_method_of_yojson "billingMethod") _list path;
     environment_variables =
       option_of_yojson
         (value_for_key environment_variables_of_yojson "environmentVariables")
         _list path;
     execution_role_arn =
       option_of_yojson
         (value_for_key amazon_role_resource_name_of_yojson "executionRoleArn")
         _list path;
   }
    : schedule_run_configuration)

let test_parameters_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let filter_of_yojson = string_of_yojson

let schedule_run_test_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key test_type_of_yojson "type" _list path;
     test_package_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "testPackageArn") _list path;
     test_spec_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "testSpecArn") _list path;
     filter = option_of_yojson (value_for_key filter_of_yojson "filter") _list path;
     parameters = option_of_yojson (value_for_key test_parameters_of_yojson "parameters") _list path;
   }
    : schedule_run_test)

let device_selection_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = value_for_key device_filters_of_yojson "filters" _list path;
     max_devices = value_for_key integer_of_yojson "maxDevices" _list path;
   }
    : device_selection_configuration)

let schedule_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key amazon_resource_name_of_yojson "projectArn" _list path;
     app_arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "appArn") _list path;
     device_pool_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "devicePoolArn") _list path;
     device_selection_configuration =
       option_of_yojson
         (value_for_key device_selection_configuration_of_yojson "deviceSelectionConfiguration")
         _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     test = value_for_key schedule_run_test_of_yojson "test" _list path;
     configuration =
       option_of_yojson
         (value_for_key schedule_run_configuration_of_yojson "configuration")
         _list path;
     execution_configuration =
       option_of_yojson
         (value_for_key execution_configuration_of_yojson "executionConfiguration")
         _list path;
   }
    : schedule_run_request)

let not_eligible_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : not_eligible_exception)

let monetary_amount_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount = option_of_yojson (value_for_key double_of_yojson "amount") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
   }
    : monetary_amount)

let offering_promotion_identifier_of_yojson = string_of_yojson
let transaction_identifier_of_yojson = string_of_yojson

let recurring_charge_frequency_of_yojson (tree : t) path =
  ((match tree with
    | `String "MONTHLY" -> MONTHLY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RecurringChargeFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "RecurringChargeFrequency")
     : recurring_charge_frequency)
    : recurring_charge_frequency)

let recurring_charge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost = option_of_yojson (value_for_key monetary_amount_of_yojson "cost") _list path;
     frequency =
       option_of_yojson (value_for_key recurring_charge_frequency_of_yojson "frequency") _list path;
   }
    : recurring_charge)

let recurring_charges_of_yojson tree path = list_of_yojson recurring_charge_of_yojson tree path

let offering_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RECURRING" -> RECURRING
    | `String value -> raise (deserialize_unknown_enum_value_error path "OfferingType" value)
    | _ -> raise (deserialize_wrong_type_error path "OfferingType")
     : offering_type)
    : offering_type)

let offering_identifier_of_yojson = string_of_yojson

let offering_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key offering_identifier_of_yojson "id") _list path;
     description = option_of_yojson (value_for_key message_of_yojson "description") _list path;
     type_ = option_of_yojson (value_for_key offering_type_of_yojson "type") _list path;
     platform = option_of_yojson (value_for_key device_platform_of_yojson "platform") _list path;
     recurring_charges =
       option_of_yojson (value_for_key recurring_charges_of_yojson "recurringCharges") _list path;
   }
    : offering)

let offering_transaction_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PURCHASE" -> PURCHASE
    | `String "RENEW" -> RENEW
    | `String "SYSTEM" -> SYSTEM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OfferingTransactionType" value)
    | _ -> raise (deserialize_wrong_type_error path "OfferingTransactionType")
     : offering_transaction_type)
    : offering_transaction_type)

let offering_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key offering_transaction_type_of_yojson "type") _list path;
     offering = option_of_yojson (value_for_key offering_of_yojson "offering") _list path;
     quantity = option_of_yojson (value_for_key integer_of_yojson "quantity") _list path;
     effective_on = option_of_yojson (value_for_key date_time_of_yojson "effectiveOn") _list path;
   }
    : offering_status)

let offering_transaction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offering_status =
       option_of_yojson (value_for_key offering_status_of_yojson "offeringStatus") _list path;
     transaction_id =
       option_of_yojson (value_for_key transaction_identifier_of_yojson "transactionId") _list path;
     offering_promotion_id =
       option_of_yojson
         (value_for_key offering_promotion_identifier_of_yojson "offeringPromotionId")
         _list path;
     created_on = option_of_yojson (value_for_key date_time_of_yojson "createdOn") _list path;
     cost = option_of_yojson (value_for_key monetary_amount_of_yojson "cost") _list path;
   }
    : offering_transaction)

let renew_offering_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offering_transaction =
       option_of_yojson
         (value_for_key offering_transaction_of_yojson "offeringTransaction")
         _list path;
   }
    : renew_offering_result)

let renew_offering_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offering_id = value_for_key offering_identifier_of_yojson "offeringId" _list path;
     quantity = value_for_key integer_of_yojson "quantity" _list path;
   }
    : renew_offering_request)

let purchase_offering_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offering_transaction =
       option_of_yojson
         (value_for_key offering_transaction_of_yojson "offeringTransaction")
         _list path;
   }
    : purchase_offering_result)

let purchase_offering_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offering_id = value_for_key offering_identifier_of_yojson "offeringId" _list path;
     quantity = value_for_key integer_of_yojson "quantity" _list path;
     offering_promotion_id =
       option_of_yojson
         (value_for_key offering_promotion_identifier_of_yojson "offeringPromotionId")
         _list path;
   }
    : purchase_offering_request)

let pagination_token_of_yojson = string_of_yojson
let vpce_configurations_of_yojson tree path = list_of_yojson vpce_configuration_of_yojson tree path

let list_vpce_configurations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpce_configurations =
       option_of_yojson
         (value_for_key vpce_configurations_of_yojson "vpceConfigurations")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_vpce_configurations_result)

let list_vpce_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_vpce_configurations_request)

let uploads_of_yojson tree path = list_of_yojson upload_of_yojson tree path

let list_uploads_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     uploads = option_of_yojson (value_for_key uploads_of_yojson "uploads") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_uploads_result)

let list_uploads_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     type_ = option_of_yojson (value_for_key upload_type_of_yojson "type") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_uploads_request)

let problem_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
   }
    : problem_detail)

let problem_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run = option_of_yojson (value_for_key problem_detail_of_yojson "run") _list path;
     job = option_of_yojson (value_for_key problem_detail_of_yojson "job") _list path;
     suite = option_of_yojson (value_for_key problem_detail_of_yojson "suite") _list path;
     test = option_of_yojson (value_for_key problem_detail_of_yojson "test") _list path;
     device = option_of_yojson (value_for_key device_of_yojson "device") _list path;
     result_ = option_of_yojson (value_for_key execution_result_of_yojson "result") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
   }
    : problem)

let problems_of_yojson tree path = list_of_yojson problem_of_yojson tree path

let unique_problem_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     problems = option_of_yojson (value_for_key problems_of_yojson "problems") _list path;
   }
    : unique_problem)

let unique_problems_of_yojson tree path = list_of_yojson unique_problem_of_yojson tree path

let unique_problems_by_execution_result_map_of_yojson tree path =
  map_of_yojson execution_result_of_yojson unique_problems_of_yojson tree path

let list_unique_problems_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unique_problems =
       option_of_yojson
         (value_for_key unique_problems_by_execution_result_map_of_yojson "uniqueProblems")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_unique_problems_result)

let list_unique_problems_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_unique_problems_request)

let test_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key test_type_of_yojson "type") _list path;
     created = option_of_yojson (value_for_key date_time_of_yojson "created") _list path;
     status = option_of_yojson (value_for_key execution_status_of_yojson "status") _list path;
     result_ = option_of_yojson (value_for_key execution_result_of_yojson "result") _list path;
     started = option_of_yojson (value_for_key date_time_of_yojson "started") _list path;
     stopped = option_of_yojson (value_for_key date_time_of_yojson "stopped") _list path;
     counters = option_of_yojson (value_for_key counters_of_yojson "counters") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     device_minutes =
       option_of_yojson (value_for_key device_minutes_of_yojson "deviceMinutes") _list path;
   }
    : test)

let tests_of_yojson tree path = list_of_yojson test_of_yojson tree path

let list_tests_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tests = option_of_yojson (value_for_key tests_of_yojson "tests") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_tests_result)

let list_tests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_tests_request)

let test_grid_session_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "CLOSED" -> CLOSED
    | `String "ERRORED" -> ERRORED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TestGridSessionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TestGridSessionStatus")
     : test_grid_session_status)
    : test_grid_session_status)

let test_grid_session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key device_farm_arn_of_yojson "arn") _list path;
     status =
       option_of_yojson (value_for_key test_grid_session_status_of_yojson "status") _list path;
     created = option_of_yojson (value_for_key date_time_of_yojson "created") _list path;
     ended = option_of_yojson (value_for_key date_time_of_yojson "ended") _list path;
     billing_minutes = option_of_yojson (value_for_key double_of_yojson "billingMinutes") _list path;
     selenium_properties =
       option_of_yojson (value_for_key string__of_yojson "seleniumProperties") _list path;
   }
    : test_grid_session)

let test_grid_sessions_of_yojson tree path = list_of_yojson test_grid_session_of_yojson tree path

let list_test_grid_sessions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_grid_sessions =
       option_of_yojson (value_for_key test_grid_sessions_of_yojson "testGridSessions") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_test_grid_sessions_result)

let max_page_size_of_yojson = int_of_yojson

let list_test_grid_sessions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key device_farm_arn_of_yojson "projectArn" _list path;
     status =
       option_of_yojson (value_for_key test_grid_session_status_of_yojson "status") _list path;
     creation_time_after =
       option_of_yojson (value_for_key date_time_of_yojson "creationTimeAfter") _list path;
     creation_time_before =
       option_of_yojson (value_for_key date_time_of_yojson "creationTimeBefore") _list path;
     end_time_after = option_of_yojson (value_for_key date_time_of_yojson "endTimeAfter") _list path;
     end_time_before =
       option_of_yojson (value_for_key date_time_of_yojson "endTimeBefore") _list path;
     max_result = option_of_yojson (value_for_key max_page_size_of_yojson "maxResult") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_test_grid_sessions_request)

let test_grid_session_artifact_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNKNOWN" -> UNKNOWN
    | `String "VIDEO" -> VIDEO
    | `String "SELENIUM_LOG" -> SELENIUM_LOG
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TestGridSessionArtifactType" value)
    | _ -> raise (deserialize_wrong_type_error path "TestGridSessionArtifactType")
     : test_grid_session_artifact_type)
    : test_grid_session_artifact_type)

let test_grid_session_artifact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filename = option_of_yojson (value_for_key string__of_yojson "filename") _list path;
     type_ =
       option_of_yojson (value_for_key test_grid_session_artifact_type_of_yojson "type") _list path;
     url = option_of_yojson (value_for_key sensitive_string_of_yojson "url") _list path;
   }
    : test_grid_session_artifact)

let test_grid_session_artifacts_of_yojson tree path =
  list_of_yojson test_grid_session_artifact_of_yojson tree path

let list_test_grid_session_artifacts_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     artifacts =
       option_of_yojson (value_for_key test_grid_session_artifacts_of_yojson "artifacts") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_test_grid_session_artifacts_result)

let test_grid_session_artifact_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "VIDEO" -> VIDEO
    | `String "LOG" -> LOG
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TestGridSessionArtifactCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "TestGridSessionArtifactCategory")
     : test_grid_session_artifact_category)
    : test_grid_session_artifact_category)

let list_test_grid_session_artifacts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_arn = value_for_key device_farm_arn_of_yojson "sessionArn" _list path;
     type_ =
       option_of_yojson
         (value_for_key test_grid_session_artifact_category_of_yojson "type")
         _list path;
     max_result = option_of_yojson (value_for_key max_page_size_of_yojson "maxResult") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_test_grid_session_artifacts_request)

let test_grid_session_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = option_of_yojson (value_for_key string__of_yojson "action") _list path;
     started = option_of_yojson (value_for_key date_time_of_yojson "started") _list path;
     duration = option_of_yojson (value_for_key long_of_yojson "duration") _list path;
     status_code = option_of_yojson (value_for_key string__of_yojson "statusCode") _list path;
     request_method = option_of_yojson (value_for_key string__of_yojson "requestMethod") _list path;
   }
    : test_grid_session_action)

let test_grid_session_actions_of_yojson tree path =
  list_of_yojson test_grid_session_action_of_yojson tree path

let list_test_grid_session_actions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions =
       option_of_yojson (value_for_key test_grid_session_actions_of_yojson "actions") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_test_grid_session_actions_result)

let list_test_grid_session_actions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_arn = value_for_key device_farm_arn_of_yojson "sessionArn" _list path;
     max_result = option_of_yojson (value_for_key max_page_size_of_yojson "maxResult") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_test_grid_session_actions_request)

let test_grid_projects_of_yojson tree path = list_of_yojson test_grid_project_of_yojson tree path

let list_test_grid_projects_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_grid_projects =
       option_of_yojson (value_for_key test_grid_projects_of_yojson "testGridProjects") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_test_grid_projects_result)

let list_test_grid_projects_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_result = option_of_yojson (value_for_key max_page_size_of_yojson "maxResult") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_test_grid_projects_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key device_farm_arn_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let suite_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key test_type_of_yojson "type") _list path;
     created = option_of_yojson (value_for_key date_time_of_yojson "created") _list path;
     status = option_of_yojson (value_for_key execution_status_of_yojson "status") _list path;
     result_ = option_of_yojson (value_for_key execution_result_of_yojson "result") _list path;
     started = option_of_yojson (value_for_key date_time_of_yojson "started") _list path;
     stopped = option_of_yojson (value_for_key date_time_of_yojson "stopped") _list path;
     counters = option_of_yojson (value_for_key counters_of_yojson "counters") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     device_minutes =
       option_of_yojson (value_for_key device_minutes_of_yojson "deviceMinutes") _list path;
   }
    : suite)

let suites_of_yojson tree path = list_of_yojson suite_of_yojson tree path

let list_suites_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     suites = option_of_yojson (value_for_key suites_of_yojson "suites") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_suites_result)

let list_suites_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_suites_request)

let sample_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CPU" -> CPU
    | `String "MEMORY" -> MEMORY
    | `String "THREADS" -> THREADS
    | `String "RX_RATE" -> RX_RATE
    | `String "TX_RATE" -> TX_RATE
    | `String "RX" -> RX
    | `String "TX" -> TX
    | `String "NATIVE_FRAMES" -> NATIVE_FRAMES
    | `String "NATIVE_FPS" -> NATIVE_FPS
    | `String "NATIVE_MIN_DRAWTIME" -> NATIVE_MIN_DRAWTIME
    | `String "NATIVE_AVG_DRAWTIME" -> NATIVE_AVG_DRAWTIME
    | `String "NATIVE_MAX_DRAWTIME" -> NATIVE_MAX_DRAWTIME
    | `String "OPENGL_FRAMES" -> OPENGL_FRAMES
    | `String "OPENGL_FPS" -> OPENGL_FPS
    | `String "OPENGL_MIN_DRAWTIME" -> OPENGL_MIN_DRAWTIME
    | `String "OPENGL_AVG_DRAWTIME" -> OPENGL_AVG_DRAWTIME
    | `String "OPENGL_MAX_DRAWTIME" -> OPENGL_MAX_DRAWTIME
    | `String value -> raise (deserialize_unknown_enum_value_error path "SampleType" value)
    | _ -> raise (deserialize_wrong_type_error path "SampleType")
     : sample_type)
    : sample_type)

let sample_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     type_ = option_of_yojson (value_for_key sample_type_of_yojson "type") _list path;
     url = option_of_yojson (value_for_key ur_l_of_yojson "url") _list path;
   }
    : sample)

let samples_of_yojson tree path = list_of_yojson sample_of_yojson tree path

let list_samples_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     samples = option_of_yojson (value_for_key samples_of_yojson "samples") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_samples_result)

let list_samples_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_samples_request)

let runs_of_yojson tree path = list_of_yojson run_of_yojson tree path

let list_runs_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     runs = option_of_yojson (value_for_key runs_of_yojson "runs") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_runs_result)

let list_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_runs_request)

let remote_access_sessions_of_yojson tree path =
  list_of_yojson remote_access_session_of_yojson tree path

let list_remote_access_sessions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remote_access_sessions =
       option_of_yojson
         (value_for_key remote_access_sessions_of_yojson "remoteAccessSessions")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_remote_access_sessions_result)

let list_remote_access_sessions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_remote_access_sessions_request)

let projects_of_yojson tree path = list_of_yojson project_of_yojson tree path

let list_projects_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     projects = option_of_yojson (value_for_key projects_of_yojson "projects") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_projects_result)

let list_projects_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_projects_request)

let offering_transactions_of_yojson tree path =
  list_of_yojson offering_transaction_of_yojson tree path

let list_offering_transactions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offering_transactions =
       option_of_yojson
         (value_for_key offering_transactions_of_yojson "offeringTransactions")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_offering_transactions_result)

let list_offering_transactions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_offering_transactions_request)

let offerings_of_yojson tree path = list_of_yojson offering_of_yojson tree path

let list_offerings_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offerings = option_of_yojson (value_for_key offerings_of_yojson "offerings") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_offerings_result)

let list_offerings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_offerings_request)

let offering_promotion_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key offering_promotion_identifier_of_yojson "id") _list path;
     description = option_of_yojson (value_for_key message_of_yojson "description") _list path;
   }
    : offering_promotion)

let offering_promotions_of_yojson tree path = list_of_yojson offering_promotion_of_yojson tree path

let list_offering_promotions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offering_promotions =
       option_of_yojson
         (value_for_key offering_promotions_of_yojson "offeringPromotions")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_offering_promotions_result)

let list_offering_promotions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_offering_promotions_request)

let network_profiles_of_yojson tree path = list_of_yojson network_profile_of_yojson tree path

let list_network_profiles_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_profiles =
       option_of_yojson (value_for_key network_profiles_of_yojson "networkProfiles") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_network_profiles_result)

let list_network_profiles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     type_ = option_of_yojson (value_for_key network_profile_type_of_yojson "type") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_network_profiles_request)

let jobs_of_yojson tree path = list_of_yojson job_of_yojson tree path

let list_jobs_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     jobs = option_of_yojson (value_for_key jobs_of_yojson "jobs") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_jobs_result)

let list_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_jobs_request)

let instance_profiles_of_yojson tree path = list_of_yojson instance_profile_of_yojson tree path

let list_instance_profiles_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_profiles =
       option_of_yojson (value_for_key instance_profiles_of_yojson "instanceProfiles") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_instance_profiles_result)

let list_instance_profiles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_instance_profiles_request)

let devices_of_yojson tree path = list_of_yojson device_of_yojson tree path

let list_devices_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     devices = option_of_yojson (value_for_key devices_of_yojson "devices") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_devices_result)

let list_devices_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     filters = option_of_yojson (value_for_key device_filters_of_yojson "filters") _list path;
   }
    : list_devices_request)

let device_pools_of_yojson tree path = list_of_yojson device_pool_of_yojson tree path

let list_device_pools_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_pools = option_of_yojson (value_for_key device_pools_of_yojson "devicePools") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_device_pools_result)

let list_device_pools_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     type_ = option_of_yojson (value_for_key device_pool_type_of_yojson "type") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_device_pools_request)

let list_device_instances_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_instances =
       option_of_yojson (value_for_key device_instances_of_yojson "deviceInstances") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_device_instances_result)

let list_device_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_device_instances_request)

let list_artifacts_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     artifacts = option_of_yojson (value_for_key artifacts_of_yojson "artifacts") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_artifacts_result)

let list_artifacts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     type_ = value_for_key artifact_category_of_yojson "type" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_artifacts_request)

let install_to_remote_access_session_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ app_upload = option_of_yojson (value_for_key upload_of_yojson "appUpload") _list path }
    : install_to_remote_access_session_result)

let install_to_remote_access_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remote_access_session_arn =
       value_for_key amazon_resource_name_of_yojson "remoteAccessSessionArn" _list path;
     app_arn = value_for_key amazon_resource_name_of_yojson "appArn" _list path;
   }
    : install_to_remote_access_session_request)

let get_vpce_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpce_configuration =
       option_of_yojson (value_for_key vpce_configuration_of_yojson "vpceConfiguration") _list path;
   }
    : get_vpce_configuration_result)

let get_vpce_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : get_vpce_configuration_request)

let get_upload_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ upload = option_of_yojson (value_for_key upload_of_yojson "upload") _list path }
    : get_upload_result)

let get_upload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : get_upload_request)

let get_test_grid_session_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_grid_session =
       option_of_yojson (value_for_key test_grid_session_of_yojson "testGridSession") _list path;
   }
    : get_test_grid_session_result)

let resource_id_of_yojson = string_of_yojson

let get_test_grid_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn =
       option_of_yojson (value_for_key device_farm_arn_of_yojson "projectArn") _list path;
     session_id = option_of_yojson (value_for_key resource_id_of_yojson "sessionId") _list path;
     session_arn =
       option_of_yojson (value_for_key device_farm_arn_of_yojson "sessionArn") _list path;
   }
    : get_test_grid_session_request)

let get_test_grid_project_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_grid_project =
       option_of_yojson (value_for_key test_grid_project_of_yojson "testGridProject") _list path;
   }
    : get_test_grid_project_result)

let get_test_grid_project_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ project_arn = value_for_key device_farm_arn_of_yojson "projectArn" _list path }
    : get_test_grid_project_request)

let get_test_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ test = option_of_yojson (value_for_key test_of_yojson "test") _list path } : get_test_result)

let get_test_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : get_test_request)

let get_suite_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ suite = option_of_yojson (value_for_key suite_of_yojson "suite") _list path }
    : get_suite_result)

let get_suite_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : get_suite_request)

let get_run_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run = option_of_yojson (value_for_key run_of_yojson "run") _list path } : get_run_result)

let get_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : get_run_request)

let get_remote_access_session_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remote_access_session =
       option_of_yojson
         (value_for_key remote_access_session_of_yojson "remoteAccessSession")
         _list path;
   }
    : get_remote_access_session_result)

let get_remote_access_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : get_remote_access_session_request)

let get_project_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ project = option_of_yojson (value_for_key project_of_yojson "project") _list path }
    : get_project_result)

let get_project_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : get_project_request)

let offering_status_map_of_yojson tree path =
  map_of_yojson offering_identifier_of_yojson offering_status_of_yojson tree path

let get_offering_status_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     current = option_of_yojson (value_for_key offering_status_map_of_yojson "current") _list path;
     next_period =
       option_of_yojson (value_for_key offering_status_map_of_yojson "nextPeriod") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : get_offering_status_result)

let get_offering_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : get_offering_status_request)

let get_network_profile_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_profile =
       option_of_yojson (value_for_key network_profile_of_yojson "networkProfile") _list path;
   }
    : get_network_profile_result)

let get_network_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : get_network_profile_request)

let get_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job = option_of_yojson (value_for_key job_of_yojson "job") _list path } : get_job_result)

let get_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : get_job_request)

let get_instance_profile_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_profile =
       option_of_yojson (value_for_key instance_profile_of_yojson "instanceProfile") _list path;
   }
    : get_instance_profile_result)

let get_instance_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : get_instance_profile_request)

let incompatibility_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     type_ = option_of_yojson (value_for_key device_attribute_of_yojson "type") _list path;
   }
    : incompatibility_message)

let incompatibility_messages_of_yojson tree path =
  list_of_yojson incompatibility_message_of_yojson tree path

let device_pool_compatibility_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device = option_of_yojson (value_for_key device_of_yojson "device") _list path;
     compatible = option_of_yojson (value_for_key boolean__of_yojson "compatible") _list path;
     incompatibility_messages =
       option_of_yojson
         (value_for_key incompatibility_messages_of_yojson "incompatibilityMessages")
         _list path;
   }
    : device_pool_compatibility_result)

let device_pool_compatibility_results_of_yojson tree path =
  list_of_yojson device_pool_compatibility_result_of_yojson tree path

let get_device_pool_compatibility_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compatible_devices =
       option_of_yojson
         (value_for_key device_pool_compatibility_results_of_yojson "compatibleDevices")
         _list path;
     incompatible_devices =
       option_of_yojson
         (value_for_key device_pool_compatibility_results_of_yojson "incompatibleDevices")
         _list path;
   }
    : get_device_pool_compatibility_result)

let get_device_pool_compatibility_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_pool_arn = value_for_key amazon_resource_name_of_yojson "devicePoolArn" _list path;
     app_arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "appArn") _list path;
     test_type = option_of_yojson (value_for_key test_type_of_yojson "testType") _list path;
     test = option_of_yojson (value_for_key schedule_run_test_of_yojson "test") _list path;
     configuration =
       option_of_yojson
         (value_for_key schedule_run_configuration_of_yojson "configuration")
         _list path;
     project_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "projectArn") _list path;
   }
    : get_device_pool_compatibility_request)

let get_device_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ device_pool = option_of_yojson (value_for_key device_pool_of_yojson "devicePool") _list path }
    : get_device_pool_result)

let get_device_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : get_device_pool_request)

let get_device_instance_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_instance =
       option_of_yojson (value_for_key device_instance_of_yojson "deviceInstance") _list path;
   }
    : get_device_instance_result)

let get_device_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path }
    : get_device_instance_request)

let get_device_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ device = option_of_yojson (value_for_key device_of_yojson "device") _list path }
    : get_device_result)

let get_device_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "arn" _list path } : get_device_request)

let get_account_settings_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_settings =
       option_of_yojson (value_for_key account_settings_of_yojson "accountSettings") _list path;
   }
    : get_account_settings_result)

let get_account_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)
