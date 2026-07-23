open Smaws_Lib.Json.SerializeHelpers
open Types

let aws_account_number_to_yojson = string_to_yojson
let skip_app_resign_to_yojson = bool_to_yojson
let job_timeout_minutes_to_yojson = int_to_yojson
let integer_to_yojson = int_to_yojson
let string__to_yojson = string_to_yojson
let max_slot_map_to_yojson tree = map_to_yojson string__to_yojson integer_to_yojson tree
let double_to_yojson = double_to_yojson

let trial_minutes_to_yojson (x : trial_minutes) =
  assoc_to_yojson
    [
      ("total", option_to_yojson double_to_yojson x.total);
      ("remaining", option_to_yojson double_to_yojson x.remaining);
    ]

let device_platform_to_yojson (x : device_platform) =
  match x with ANDROID -> `String "ANDROID" | IOS -> `String "IOS"

let purchased_devices_map_to_yojson tree =
  map_to_yojson device_platform_to_yojson integer_to_yojson tree

let account_settings_to_yojson (x : account_settings) =
  assoc_to_yojson
    [
      ("awsAccountNumber", option_to_yojson aws_account_number_to_yojson x.aws_account_number);
      ("unmeteredDevices", option_to_yojson purchased_devices_map_to_yojson x.unmetered_devices);
      ( "unmeteredRemoteAccessDevices",
        option_to_yojson purchased_devices_map_to_yojson x.unmetered_remote_access_devices );
      ( "maxJobTimeoutMinutes",
        option_to_yojson job_timeout_minutes_to_yojson x.max_job_timeout_minutes );
      ("trialMinutes", option_to_yojson trial_minutes_to_yojson x.trial_minutes);
      ("maxSlots", option_to_yojson max_slot_map_to_yojson x.max_slots);
      ( "defaultJobTimeoutMinutes",
        option_to_yojson job_timeout_minutes_to_yojson x.default_job_timeout_minutes );
      ("skipAppResign", option_to_yojson skip_app_resign_to_yojson x.skip_app_resign);
    ]

let accounts_cleanup_to_yojson = bool_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let amazon_resource_names_to_yojson tree = list_to_yojson amazon_resource_name_to_yojson tree
let amazon_role_resource_name_to_yojson = string_to_yojson
let android_paths_to_yojson tree = list_to_yojson string__to_yojson tree
let app_packages_cleanup_to_yojson = bool_to_yojson
let message_to_yojson = string_to_yojson

let argument_exception_to_yojson (x : argument_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let ur_l_to_yojson = string_to_yojson

let artifact_type_to_yojson (x : artifact_type) =
  match x with
  | UNKNOWN -> `String "UNKNOWN"
  | SCREENSHOT -> `String "SCREENSHOT"
  | DEVICE_LOG -> `String "DEVICE_LOG"
  | MESSAGE_LOG -> `String "MESSAGE_LOG"
  | VIDEO_LOG -> `String "VIDEO_LOG"
  | RESULT_LOG -> `String "RESULT_LOG"
  | SERVICE_LOG -> `String "SERVICE_LOG"
  | WEBKIT_LOG -> `String "WEBKIT_LOG"
  | INSTRUMENTATION_OUTPUT -> `String "INSTRUMENTATION_OUTPUT"
  | EXERCISER_MONKEY_OUTPUT -> `String "EXERCISER_MONKEY_OUTPUT"
  | CALABASH_JSON_OUTPUT -> `String "CALABASH_JSON_OUTPUT"
  | CALABASH_PRETTY_OUTPUT -> `String "CALABASH_PRETTY_OUTPUT"
  | CALABASH_STANDARD_OUTPUT -> `String "CALABASH_STANDARD_OUTPUT"
  | CALABASH_JAVA_XML_OUTPUT -> `String "CALABASH_JAVA_XML_OUTPUT"
  | AUTOMATION_OUTPUT -> `String "AUTOMATION_OUTPUT"
  | APPIUM_SERVER_OUTPUT -> `String "APPIUM_SERVER_OUTPUT"
  | APPIUM_JAVA_OUTPUT -> `String "APPIUM_JAVA_OUTPUT"
  | APPIUM_JAVA_XML_OUTPUT -> `String "APPIUM_JAVA_XML_OUTPUT"
  | APPIUM_PYTHON_OUTPUT -> `String "APPIUM_PYTHON_OUTPUT"
  | APPIUM_PYTHON_XML_OUTPUT -> `String "APPIUM_PYTHON_XML_OUTPUT"
  | EXPLORER_EVENT_LOG -> `String "EXPLORER_EVENT_LOG"
  | EXPLORER_SUMMARY_LOG -> `String "EXPLORER_SUMMARY_LOG"
  | APPLICATION_CRASH_REPORT -> `String "APPLICATION_CRASH_REPORT"
  | XCTEST_LOG -> `String "XCTEST_LOG"
  | VIDEO -> `String "VIDEO"
  | CUSTOMER_ARTIFACT -> `String "CUSTOMER_ARTIFACT"
  | CUSTOMER_ARTIFACT_LOG -> `String "CUSTOMER_ARTIFACT_LOG"
  | TESTSPEC_OUTPUT -> `String "TESTSPEC_OUTPUT"

let name_to_yojson = string_to_yojson

let artifact_to_yojson (x : artifact) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("type", option_to_yojson artifact_type_to_yojson x.type_);
      ("extension", option_to_yojson string__to_yojson x.extension);
      ("url", option_to_yojson ur_l_to_yojson x.url);
    ]

let artifact_category_to_yojson (x : artifact_category) =
  match x with SCREENSHOT -> `String "SCREENSHOT" | FILE -> `String "FILE" | LOG -> `String "LOG"

let artifacts_to_yojson tree = list_to_yojson artifact_to_yojson tree
let auxiliary_app_arn_list_to_yojson tree = list_to_yojson amazon_resource_name_to_yojson tree

let billing_method_to_yojson (x : billing_method) =
  match x with METERED -> `String "METERED" | UNMETERED -> `String "UNMETERED"

let boolean__to_yojson = bool_to_yojson

let cp_u_to_yojson (x : cp_u) =
  assoc_to_yojson
    [
      ("frequency", option_to_yojson string__to_yojson x.frequency);
      ("architecture", option_to_yojson string__to_yojson x.architecture);
      ("clock", option_to_yojson double_to_yojson x.clock);
    ]

let cannot_delete_exception_to_yojson (x : cannot_delete_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let content_type_to_yojson = string_to_yojson

let counters_to_yojson (x : counters) =
  assoc_to_yojson
    [
      ("total", option_to_yojson integer_to_yojson x.total);
      ("passed", option_to_yojson integer_to_yojson x.passed);
      ("failed", option_to_yojson integer_to_yojson x.failed);
      ("warned", option_to_yojson integer_to_yojson x.warned);
      ("errored", option_to_yojson integer_to_yojson x.errored);
      ("stopped", option_to_yojson integer_to_yojson x.stopped);
      ("skipped", option_to_yojson integer_to_yojson x.skipped);
    ]

let service_account_exception_to_yojson (x : service_account_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let rule_operator_to_yojson (x : rule_operator) =
  match x with
  | EQUALS -> `String "EQUALS"
  | LESS_THAN -> `String "LESS_THAN"
  | LESS_THAN_OR_EQUALS -> `String "LESS_THAN_OR_EQUALS"
  | GREATER_THAN -> `String "GREATER_THAN"
  | GREATER_THAN_OR_EQUALS -> `String "GREATER_THAN_OR_EQUALS"
  | IN -> `String "IN"
  | NOT_IN -> `String "NOT_IN"
  | CONTAINS -> `String "CONTAINS"

let device_attribute_to_yojson (x : device_attribute) =
  match x with
  | ARN -> `String "ARN"
  | PLATFORM -> `String "PLATFORM"
  | FORM_FACTOR -> `String "FORM_FACTOR"
  | MANUFACTURER -> `String "MANUFACTURER"
  | REMOTE_ACCESS_ENABLED -> `String "REMOTE_ACCESS_ENABLED"
  | REMOTE_DEBUG_ENABLED -> `String "REMOTE_DEBUG_ENABLED"
  | APPIUM_VERSION -> `String "APPIUM_VERSION"
  | INSTANCE_ARN -> `String "INSTANCE_ARN"
  | INSTANCE_LABELS -> `String "INSTANCE_LABELS"
  | FLEET_TYPE -> `String "FLEET_TYPE"
  | OS_VERSION -> `String "OS_VERSION"
  | MODEL -> `String "MODEL"
  | AVAILABILITY -> `String "AVAILABILITY"

let rule_to_yojson (x : rule) =
  assoc_to_yojson
    [
      ("attribute", option_to_yojson device_attribute_to_yojson x.attribute);
      ("operator", option_to_yojson rule_operator_to_yojson x.operator);
      ("value", option_to_yojson string__to_yojson x.value);
    ]

let rules_to_yojson tree = list_to_yojson rule_to_yojson tree

let device_pool_type_to_yojson (x : device_pool_type) =
  match x with CURATED -> `String "CURATED" | PRIVATE -> `String "PRIVATE"

let device_pool_to_yojson (x : device_pool) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("description", option_to_yojson message_to_yojson x.description);
      ("type", option_to_yojson device_pool_type_to_yojson x.type_);
      ("rules", option_to_yojson rules_to_yojson x.rules);
      ("maxDevices", option_to_yojson integer_to_yojson x.max_devices);
    ]

let create_device_pool_result_to_yojson (x : create_device_pool_result) =
  assoc_to_yojson [ ("devicePool", option_to_yojson device_pool_to_yojson x.device_pool) ]

let create_device_pool_request_to_yojson (x : create_device_pool_request) =
  assoc_to_yojson
    [
      ("projectArn", Some (amazon_resource_name_to_yojson x.project_arn));
      ("name", Some (name_to_yojson x.name));
      ("description", option_to_yojson message_to_yojson x.description);
      ("rules", Some (rules_to_yojson x.rules));
      ("maxDevices", option_to_yojson integer_to_yojson x.max_devices);
    ]

let package_ids_to_yojson tree = list_to_yojson string__to_yojson tree

let instance_profile_to_yojson (x : instance_profile) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("packageCleanup", option_to_yojson boolean__to_yojson x.package_cleanup);
      ( "excludeAppPackagesFromCleanup",
        option_to_yojson package_ids_to_yojson x.exclude_app_packages_from_cleanup );
      ("rebootAfterUse", option_to_yojson boolean__to_yojson x.reboot_after_use);
      ("name", option_to_yojson name_to_yojson x.name);
      ("description", option_to_yojson message_to_yojson x.description);
    ]

let create_instance_profile_result_to_yojson (x : create_instance_profile_result) =
  assoc_to_yojson
    [ ("instanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile) ]

let create_instance_profile_request_to_yojson (x : create_instance_profile_request) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("description", option_to_yojson message_to_yojson x.description);
      ("packageCleanup", option_to_yojson boolean__to_yojson x.package_cleanup);
      ( "excludeAppPackagesFromCleanup",
        option_to_yojson package_ids_to_yojson x.exclude_app_packages_from_cleanup );
      ("rebootAfterUse", option_to_yojson boolean__to_yojson x.reboot_after_use);
    ]

let percent_integer_to_yojson = int_to_yojson
let long_to_yojson = long_to_yojson

let network_profile_type_to_yojson (x : network_profile_type) =
  match x with CURATED -> `String "CURATED" | PRIVATE -> `String "PRIVATE"

let network_profile_to_yojson (x : network_profile) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("description", option_to_yojson message_to_yojson x.description);
      ("type", option_to_yojson network_profile_type_to_yojson x.type_);
      ("uplinkBandwidthBits", option_to_yojson long_to_yojson x.uplink_bandwidth_bits);
      ("downlinkBandwidthBits", option_to_yojson long_to_yojson x.downlink_bandwidth_bits);
      ("uplinkDelayMs", option_to_yojson long_to_yojson x.uplink_delay_ms);
      ("downlinkDelayMs", option_to_yojson long_to_yojson x.downlink_delay_ms);
      ("uplinkJitterMs", option_to_yojson long_to_yojson x.uplink_jitter_ms);
      ("downlinkJitterMs", option_to_yojson long_to_yojson x.downlink_jitter_ms);
      ("uplinkLossPercent", option_to_yojson percent_integer_to_yojson x.uplink_loss_percent);
      ("downlinkLossPercent", option_to_yojson percent_integer_to_yojson x.downlink_loss_percent);
    ]

let create_network_profile_result_to_yojson (x : create_network_profile_result) =
  assoc_to_yojson
    [ ("networkProfile", option_to_yojson network_profile_to_yojson x.network_profile) ]

let create_network_profile_request_to_yojson (x : create_network_profile_request) =
  assoc_to_yojson
    [
      ("projectArn", Some (amazon_resource_name_to_yojson x.project_arn));
      ("name", Some (name_to_yojson x.name));
      ("description", option_to_yojson message_to_yojson x.description);
      ("type", option_to_yojson network_profile_type_to_yojson x.type_);
      ("uplinkBandwidthBits", option_to_yojson long_to_yojson x.uplink_bandwidth_bits);
      ("downlinkBandwidthBits", option_to_yojson long_to_yojson x.downlink_bandwidth_bits);
      ("uplinkDelayMs", option_to_yojson long_to_yojson x.uplink_delay_ms);
      ("downlinkDelayMs", option_to_yojson long_to_yojson x.downlink_delay_ms);
      ("uplinkJitterMs", option_to_yojson long_to_yojson x.uplink_jitter_ms);
      ("downlinkJitterMs", option_to_yojson long_to_yojson x.downlink_jitter_ms);
      ("uplinkLossPercent", option_to_yojson percent_integer_to_yojson x.uplink_loss_percent);
      ("downlinkLossPercent", option_to_yojson percent_integer_to_yojson x.downlink_loss_percent);
    ]

let exception_message_to_yojson = string_to_yojson

let tag_operation_exception_to_yojson (x : tag_operation_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let environment_variable_value_to_yojson = string_to_yojson
let environment_variable_name_to_yojson = string_to_yojson

let environment_variable_to_yojson (x : environment_variable) =
  assoc_to_yojson
    [
      ("name", Some (environment_variable_name_to_yojson x.name));
      ("value", Some (environment_variable_value_to_yojson x.value));
    ]

let environment_variables_to_yojson tree = list_to_yojson environment_variable_to_yojson tree
let non_empty_string_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson
let vpc_subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let security_group_id_to_yojson = string_to_yojson
let vpc_security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let vpc_config_to_yojson (x : vpc_config) =
  assoc_to_yojson
    [
      ("securityGroupIds", Some (vpc_security_group_ids_to_yojson x.security_group_ids));
      ("subnetIds", Some (vpc_subnet_ids_to_yojson x.subnet_ids));
      ("vpcId", Some (non_empty_string_to_yojson x.vpc_id));
    ]

let date_time_to_yojson = timestamp_epoch_seconds_to_yojson

let project_to_yojson (x : project) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ( "defaultJobTimeoutMinutes",
        option_to_yojson job_timeout_minutes_to_yojson x.default_job_timeout_minutes );
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
      ("executionRoleArn", option_to_yojson amazon_role_resource_name_to_yojson x.execution_role_arn);
    ]

let create_project_result_to_yojson (x : create_project_result) =
  assoc_to_yojson [ ("project", option_to_yojson project_to_yojson x.project) ]

let create_project_request_to_yojson (x : create_project_request) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ( "defaultJobTimeoutMinutes",
        option_to_yojson job_timeout_minutes_to_yojson x.default_job_timeout_minutes );
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
      ("executionRoleArn", option_to_yojson amazon_role_resource_name_to_yojson x.execution_role_arn);
    ]

let sensitive_ur_l_to_yojson = string_to_yojson

let remote_access_endpoints_to_yojson (x : remote_access_endpoints) =
  assoc_to_yojson
    [
      ("remoteDriverEndpoint", option_to_yojson sensitive_ur_l_to_yojson x.remote_driver_endpoint);
      ("interactiveEndpoint", option_to_yojson sensitive_ur_l_to_yojson x.interactive_endpoint);
    ]

let device_proxy_port_to_yojson = int_to_yojson
let device_proxy_host_to_yojson = string_to_yojson

let device_proxy_to_yojson (x : device_proxy) =
  assoc_to_yojson
    [
      ("host", Some (device_proxy_host_to_yojson x.host));
      ("port", Some (device_proxy_port_to_yojson x.port));
    ]

let interaction_mode_to_yojson (x : interaction_mode) =
  match x with
  | INTERACTIVE -> `String "INTERACTIVE"
  | NO_VIDEO -> `String "NO_VIDEO"
  | VIDEO_ONLY -> `String "VIDEO_ONLY"

let device_minutes_to_yojson (x : device_minutes) =
  assoc_to_yojson
    [
      ("total", option_to_yojson double_to_yojson x.total);
      ("metered", option_to_yojson double_to_yojson x.metered);
      ("unmetered", option_to_yojson double_to_yojson x.unmetered);
    ]

let device_availability_to_yojson (x : device_availability) =
  match x with
  | TEMPORARY_NOT_AVAILABLE -> `String "TEMPORARY_NOT_AVAILABLE"
  | BUSY -> `String "BUSY"
  | AVAILABLE -> `String "AVAILABLE"
  | HIGHLY_AVAILABLE -> `String "HIGHLY_AVAILABLE"

let instance_status_to_yojson (x : instance_status) =
  match x with
  | IN_USE -> `String "IN_USE"
  | PREPARING -> `String "PREPARING"
  | AVAILABLE -> `String "AVAILABLE"
  | NOT_AVAILABLE -> `String "NOT_AVAILABLE"

let instance_labels_to_yojson tree = list_to_yojson string__to_yojson tree

let device_instance_to_yojson (x : device_instance) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("deviceArn", option_to_yojson amazon_resource_name_to_yojson x.device_arn);
      ("labels", option_to_yojson instance_labels_to_yojson x.labels);
      ("status", option_to_yojson instance_status_to_yojson x.status);
      ("udid", option_to_yojson string__to_yojson x.udid);
      ("instanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile);
    ]

let device_instances_to_yojson tree = list_to_yojson device_instance_to_yojson tree

let resolution_to_yojson (x : resolution) =
  assoc_to_yojson
    [
      ("width", option_to_yojson integer_to_yojson x.width);
      ("height", option_to_yojson integer_to_yojson x.height);
    ]

let device_form_factor_to_yojson (x : device_form_factor) =
  match x with PHONE -> `String "PHONE" | TABLET -> `String "TABLET"

let device_to_yojson (x : device) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("manufacturer", option_to_yojson string__to_yojson x.manufacturer);
      ("model", option_to_yojson string__to_yojson x.model);
      ("modelId", option_to_yojson string__to_yojson x.model_id);
      ("formFactor", option_to_yojson device_form_factor_to_yojson x.form_factor);
      ("platform", option_to_yojson device_platform_to_yojson x.platform);
      ("os", option_to_yojson string__to_yojson x.os);
      ("cpu", option_to_yojson cp_u_to_yojson x.cpu);
      ("resolution", option_to_yojson resolution_to_yojson x.resolution);
      ("heapSize", option_to_yojson long_to_yojson x.heap_size);
      ("memory", option_to_yojson long_to_yojson x.memory);
      ("image", option_to_yojson string__to_yojson x.image);
      ("carrier", option_to_yojson string__to_yojson x.carrier);
      ("radio", option_to_yojson string__to_yojson x.radio);
      ("remoteAccessEnabled", option_to_yojson boolean__to_yojson x.remote_access_enabled);
      ("remoteDebugEnabled", option_to_yojson boolean__to_yojson x.remote_debug_enabled);
      ("fleetType", option_to_yojson string__to_yojson x.fleet_type);
      ("fleetName", option_to_yojson string__to_yojson x.fleet_name);
      ("instances", option_to_yojson device_instances_to_yojson x.instances);
      ("availability", option_to_yojson device_availability_to_yojson x.availability);
    ]

let execution_result_to_yojson (x : execution_result) =
  match x with
  | PENDING -> `String "PENDING"
  | PASSED -> `String "PASSED"
  | WARNED -> `String "WARNED"
  | FAILED -> `String "FAILED"
  | SKIPPED -> `String "SKIPPED"
  | ERRORED -> `String "ERRORED"
  | STOPPED -> `String "STOPPED"

let execution_status_to_yojson (x : execution_status) =
  match x with
  | PENDING -> `String "PENDING"
  | PENDING_CONCURRNECY -> `String "PENDING_CONCURRENCY"
  | PENDING_DEVICE -> `String "PENDING_DEVICE"
  | PROCESSING -> `String "PROCESSING"
  | SCHEDULING -> `String "SCHEDULING"
  | PREPARING -> `String "PREPARING"
  | RUNNING -> `String "RUNNING"
  | COMPLETED -> `String "COMPLETED"
  | STOPPING -> `String "STOPPING"

let remote_access_session_to_yojson (x : remote_access_session) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("status", option_to_yojson execution_status_to_yojson x.status);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("message", option_to_yojson message_to_yojson x.message);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("stopped", option_to_yojson date_time_to_yojson x.stopped);
      ("device", option_to_yojson device_to_yojson x.device);
      ("instanceArn", option_to_yojson amazon_resource_name_to_yojson x.instance_arn);
      ("billingMethod", option_to_yojson billing_method_to_yojson x.billing_method);
      ("deviceMinutes", option_to_yojson device_minutes_to_yojson x.device_minutes);
      ("endpoint", option_to_yojson string__to_yojson x.endpoint);
      ("deviceUdid", option_to_yojson string__to_yojson x.device_udid);
      ("interactionMode", option_to_yojson interaction_mode_to_yojson x.interaction_mode);
      ("skipAppResign", option_to_yojson skip_app_resign_to_yojson x.skip_app_resign);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("deviceProxy", option_to_yojson device_proxy_to_yojson x.device_proxy);
      ("appUpload", option_to_yojson amazon_resource_name_to_yojson x.app_upload);
      ("endpoints", option_to_yojson remote_access_endpoints_to_yojson x.endpoints);
    ]

let create_remote_access_session_result_to_yojson (x : create_remote_access_session_result) =
  assoc_to_yojson
    [
      ( "remoteAccessSession",
        option_to_yojson remote_access_session_to_yojson x.remote_access_session );
    ]

let create_remote_access_session_configuration_to_yojson
    (x : create_remote_access_session_configuration) =
  assoc_to_yojson
    [
      ("auxiliaryApps", option_to_yojson auxiliary_app_arn_list_to_yojson x.auxiliary_apps);
      ("billingMethod", option_to_yojson billing_method_to_yojson x.billing_method);
      ( "vpceConfigurationArns",
        option_to_yojson amazon_resource_names_to_yojson x.vpce_configuration_arns );
      ("deviceProxy", option_to_yojson device_proxy_to_yojson x.device_proxy);
    ]

let create_remote_access_session_request_to_yojson (x : create_remote_access_session_request) =
  assoc_to_yojson
    [
      ("projectArn", Some (amazon_resource_name_to_yojson x.project_arn));
      ("deviceArn", Some (amazon_resource_name_to_yojson x.device_arn));
      ("appArn", option_to_yojson amazon_resource_name_to_yojson x.app_arn);
      ("instanceArn", option_to_yojson amazon_resource_name_to_yojson x.instance_arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ( "configuration",
        option_to_yojson create_remote_access_session_configuration_to_yojson x.configuration );
      ("interactionMode", option_to_yojson interaction_mode_to_yojson x.interaction_mode);
      ("skipAppResign", option_to_yojson boolean__to_yojson x.skip_app_resign);
    ]

let internal_service_exception_to_yojson (x : internal_service_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let subnet_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree
let security_group_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let test_grid_vpc_config_to_yojson (x : test_grid_vpc_config) =
  assoc_to_yojson
    [
      ("securityGroupIds", Some (security_group_ids_to_yojson x.security_group_ids));
      ("subnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ("vpcId", Some (non_empty_string_to_yojson x.vpc_id));
    ]

let device_farm_arn_to_yojson = string_to_yojson

let test_grid_project_to_yojson (x : test_grid_project) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson device_farm_arn_to_yojson x.arn);
      ("name", option_to_yojson string__to_yojson x.name);
      ("description", option_to_yojson string__to_yojson x.description);
      ("vpcConfig", option_to_yojson test_grid_vpc_config_to_yojson x.vpc_config);
      ("created", option_to_yojson date_time_to_yojson x.created);
    ]

let create_test_grid_project_result_to_yojson (x : create_test_grid_project_result) =
  assoc_to_yojson
    [ ("testGridProject", option_to_yojson test_grid_project_to_yojson x.test_grid_project) ]

let resource_description_to_yojson = string_to_yojson
let resource_name_to_yojson = string_to_yojson

let create_test_grid_project_request_to_yojson (x : create_test_grid_project_request) =
  assoc_to_yojson
    [
      ("name", Some (resource_name_to_yojson x.name));
      ("description", option_to_yojson resource_description_to_yojson x.description);
      ("vpcConfig", option_to_yojson test_grid_vpc_config_to_yojson x.vpc_config);
    ]

let sensitive_string_to_yojson = string_to_yojson

let create_test_grid_url_result_to_yojson (x : create_test_grid_url_result) =
  assoc_to_yojson
    [
      ("url", option_to_yojson sensitive_string_to_yojson x.url);
      ("expires", option_to_yojson date_time_to_yojson x.expires);
    ]

let test_grid_url_expires_in_seconds_input_to_yojson = int_to_yojson

let create_test_grid_url_request_to_yojson (x : create_test_grid_url_request) =
  assoc_to_yojson
    [
      ("projectArn", Some (device_farm_arn_to_yojson x.project_arn));
      ( "expiresInSeconds",
        Some (test_grid_url_expires_in_seconds_input_to_yojson x.expires_in_seconds) );
    ]

let upload_category_to_yojson (x : upload_category) =
  match x with CURATED -> `String "CURATED" | PRIVATE -> `String "PRIVATE"

let metadata_to_yojson = string_to_yojson

let upload_status_to_yojson (x : upload_status) =
  match x with
  | INITIALIZED -> `String "INITIALIZED"
  | PROCESSING -> `String "PROCESSING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let upload_type_to_yojson (x : upload_type) =
  match x with
  | ANDROID_APP -> `String "ANDROID_APP"
  | IOS_APP -> `String "IOS_APP"
  | WEB_APP -> `String "WEB_APP"
  | EXTERNAL_DATA -> `String "EXTERNAL_DATA"
  | APPIUM_JAVA_JUNIT_TEST_PACKAGE -> `String "APPIUM_JAVA_JUNIT_TEST_PACKAGE"
  | APPIUM_JAVA_TESTNG_TEST_PACKAGE -> `String "APPIUM_JAVA_TESTNG_TEST_PACKAGE"
  | APPIUM_PYTHON_TEST_PACKAGE -> `String "APPIUM_PYTHON_TEST_PACKAGE"
  | APPIUM_NODE_TEST_PACKAGE -> `String "APPIUM_NODE_TEST_PACKAGE"
  | APPIUM_RUBY_TEST_PACKAGE -> `String "APPIUM_RUBY_TEST_PACKAGE"
  | APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE -> `String "APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE"
  | APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE -> `String "APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE"
  | APPIUM_WEB_PYTHON_TEST_PACKAGE -> `String "APPIUM_WEB_PYTHON_TEST_PACKAGE"
  | APPIUM_WEB_NODE_TEST_PACKAGE -> `String "APPIUM_WEB_NODE_TEST_PACKAGE"
  | APPIUM_WEB_RUBY_TEST_PACKAGE -> `String "APPIUM_WEB_RUBY_TEST_PACKAGE"
  | CALABASH_TEST_PACKAGE -> `String "CALABASH_TEST_PACKAGE"
  | INSTRUMENTATION_TEST_PACKAGE -> `String "INSTRUMENTATION_TEST_PACKAGE"
  | UIAUTOMATION_TEST_PACKAGE -> `String "UIAUTOMATION_TEST_PACKAGE"
  | UIAUTOMATOR_TEST_PACKAGE -> `String "UIAUTOMATOR_TEST_PACKAGE"
  | XCTEST_TEST_PACKAGE -> `String "XCTEST_TEST_PACKAGE"
  | XCTEST_UI_TEST_PACKAGE -> `String "XCTEST_UI_TEST_PACKAGE"
  | APPIUM_JAVA_JUNIT_TEST_SPEC -> `String "APPIUM_JAVA_JUNIT_TEST_SPEC"
  | APPIUM_JAVA_TESTNG_TEST_SPEC -> `String "APPIUM_JAVA_TESTNG_TEST_SPEC"
  | APPIUM_PYTHON_TEST_SPEC -> `String "APPIUM_PYTHON_TEST_SPEC"
  | APPIUM_NODE_TEST_SPEC -> `String "APPIUM_NODE_TEST_SPEC"
  | APPIUM_RUBY_TEST_SPEC -> `String "APPIUM_RUBY_TEST_SPEC"
  | APPIUM_WEB_JAVA_JUNIT_TEST_SPEC -> `String "APPIUM_WEB_JAVA_JUNIT_TEST_SPEC"
  | APPIUM_WEB_JAVA_TESTNG_TEST_SPEC -> `String "APPIUM_WEB_JAVA_TESTNG_TEST_SPEC"
  | APPIUM_WEB_PYTHON_TEST_SPEC -> `String "APPIUM_WEB_PYTHON_TEST_SPEC"
  | APPIUM_WEB_NODE_TEST_SPEC -> `String "APPIUM_WEB_NODE_TEST_SPEC"
  | APPIUM_WEB_RUBY_TEST_SPEC -> `String "APPIUM_WEB_RUBY_TEST_SPEC"
  | INSTRUMENTATION_TEST_SPEC -> `String "INSTRUMENTATION_TEST_SPEC"
  | XCTEST_UI_TEST_SPEC -> `String "XCTEST_UI_TEST_SPEC"

let upload_to_yojson (x : upload) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("type", option_to_yojson upload_type_to_yojson x.type_);
      ("status", option_to_yojson upload_status_to_yojson x.status);
      ("url", option_to_yojson sensitive_ur_l_to_yojson x.url);
      ("metadata", option_to_yojson metadata_to_yojson x.metadata);
      ("contentType", option_to_yojson content_type_to_yojson x.content_type);
      ("message", option_to_yojson message_to_yojson x.message);
      ("category", option_to_yojson upload_category_to_yojson x.category);
    ]

let create_upload_result_to_yojson (x : create_upload_result) =
  assoc_to_yojson [ ("upload", option_to_yojson upload_to_yojson x.upload) ]

let create_upload_request_to_yojson (x : create_upload_request) =
  assoc_to_yojson
    [
      ("projectArn", Some (amazon_resource_name_to_yojson x.project_arn));
      ("name", Some (name_to_yojson x.name));
      ("type", Some (upload_type_to_yojson x.type_));
      ("contentType", option_to_yojson content_type_to_yojson x.content_type);
    ]

let vpce_configuration_description_to_yojson = string_to_yojson
let service_dns_name_to_yojson = string_to_yojson
let vpce_service_name_to_yojson = string_to_yojson
let vpce_configuration_name_to_yojson = string_to_yojson

let vpce_configuration_to_yojson (x : vpce_configuration) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ( "vpceConfigurationName",
        option_to_yojson vpce_configuration_name_to_yojson x.vpce_configuration_name );
      ("vpceServiceName", option_to_yojson vpce_service_name_to_yojson x.vpce_service_name);
      ("serviceDnsName", option_to_yojson service_dns_name_to_yojson x.service_dns_name);
      ( "vpceConfigurationDescription",
        option_to_yojson vpce_configuration_description_to_yojson x.vpce_configuration_description
      );
    ]

let create_vpce_configuration_result_to_yojson (x : create_vpce_configuration_result) =
  assoc_to_yojson
    [ ("vpceConfiguration", option_to_yojson vpce_configuration_to_yojson x.vpce_configuration) ]

let create_vpce_configuration_request_to_yojson (x : create_vpce_configuration_request) =
  assoc_to_yojson
    [
      ("vpceConfigurationName", Some (vpce_configuration_name_to_yojson x.vpce_configuration_name));
      ("vpceServiceName", Some (vpce_service_name_to_yojson x.vpce_service_name));
      ("serviceDnsName", Some (service_dns_name_to_yojson x.service_dns_name));
      ( "vpceConfigurationDescription",
        option_to_yojson vpce_configuration_description_to_yojson x.vpce_configuration_description
      );
    ]

let currency_code_to_yojson (x : currency_code) = match x with USD -> `String "USD"
let device_host_paths_to_yojson tree = list_to_yojson string__to_yojson tree
let ios_paths_to_yojson tree = list_to_yojson string__to_yojson tree

let customer_artifact_paths_to_yojson (x : customer_artifact_paths) =
  assoc_to_yojson
    [
      ("iosPaths", option_to_yojson ios_paths_to_yojson x.ios_paths);
      ("androidPaths", option_to_yojson android_paths_to_yojson x.android_paths);
      ("deviceHostPaths", option_to_yojson device_host_paths_to_yojson x.device_host_paths);
    ]

let delete_device_pool_result_to_yojson = unit_to_yojson

let delete_device_pool_request_to_yojson (x : delete_device_pool_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_instance_profile_result_to_yojson = unit_to_yojson

let delete_instance_profile_request_to_yojson (x : delete_instance_profile_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_network_profile_result_to_yojson = unit_to_yojson

let delete_network_profile_request_to_yojson (x : delete_network_profile_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_project_result_to_yojson = unit_to_yojson

let delete_project_request_to_yojson (x : delete_project_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_remote_access_session_result_to_yojson = unit_to_yojson

let delete_remote_access_session_request_to_yojson (x : delete_remote_access_session_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_run_result_to_yojson = unit_to_yojson

let delete_run_request_to_yojson (x : delete_run_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_test_grid_project_result_to_yojson = unit_to_yojson

let delete_test_grid_project_request_to_yojson (x : delete_test_grid_project_request) =
  assoc_to_yojson [ ("projectArn", Some (device_farm_arn_to_yojson x.project_arn)) ]

let delete_upload_result_to_yojson = unit_to_yojson

let delete_upload_request_to_yojson (x : delete_upload_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let invalid_operation_exception_to_yojson (x : invalid_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let delete_vpce_configuration_result_to_yojson = unit_to_yojson

let delete_vpce_configuration_request_to_yojson (x : delete_vpce_configuration_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let update_vpce_configuration_result_to_yojson (x : update_vpce_configuration_result) =
  assoc_to_yojson
    [ ("vpceConfiguration", option_to_yojson vpce_configuration_to_yojson x.vpce_configuration) ]

let update_vpce_configuration_request_to_yojson (x : update_vpce_configuration_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ( "vpceConfigurationName",
        option_to_yojson vpce_configuration_name_to_yojson x.vpce_configuration_name );
      ("vpceServiceName", option_to_yojson vpce_service_name_to_yojson x.vpce_service_name);
      ("serviceDnsName", option_to_yojson service_dns_name_to_yojson x.service_dns_name);
      ( "vpceConfigurationDescription",
        option_to_yojson vpce_configuration_description_to_yojson x.vpce_configuration_description
      );
    ]

let update_upload_result_to_yojson (x : update_upload_result) =
  assoc_to_yojson [ ("upload", option_to_yojson upload_to_yojson x.upload) ]

let update_upload_request_to_yojson (x : update_upload_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("name", option_to_yojson name_to_yojson x.name);
      ("contentType", option_to_yojson content_type_to_yojson x.content_type);
      ("editContent", option_to_yojson boolean__to_yojson x.edit_content);
    ]

let update_test_grid_project_result_to_yojson (x : update_test_grid_project_result) =
  assoc_to_yojson
    [ ("testGridProject", option_to_yojson test_grid_project_to_yojson x.test_grid_project) ]

let update_test_grid_project_request_to_yojson (x : update_test_grid_project_request) =
  assoc_to_yojson
    [
      ("projectArn", Some (device_farm_arn_to_yojson x.project_arn));
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("description", option_to_yojson resource_description_to_yojson x.description);
      ("vpcConfig", option_to_yojson test_grid_vpc_config_to_yojson x.vpc_config);
    ]

let update_project_result_to_yojson (x : update_project_result) =
  assoc_to_yojson [ ("project", option_to_yojson project_to_yojson x.project) ]

let update_project_request_to_yojson (x : update_project_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("name", option_to_yojson name_to_yojson x.name);
      ( "defaultJobTimeoutMinutes",
        option_to_yojson job_timeout_minutes_to_yojson x.default_job_timeout_minutes );
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
      ("executionRoleArn", option_to_yojson amazon_role_resource_name_to_yojson x.execution_role_arn);
    ]

let update_network_profile_result_to_yojson (x : update_network_profile_result) =
  assoc_to_yojson
    [ ("networkProfile", option_to_yojson network_profile_to_yojson x.network_profile) ]

let update_network_profile_request_to_yojson (x : update_network_profile_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("name", option_to_yojson name_to_yojson x.name);
      ("description", option_to_yojson message_to_yojson x.description);
      ("type", option_to_yojson network_profile_type_to_yojson x.type_);
      ("uplinkBandwidthBits", option_to_yojson long_to_yojson x.uplink_bandwidth_bits);
      ("downlinkBandwidthBits", option_to_yojson long_to_yojson x.downlink_bandwidth_bits);
      ("uplinkDelayMs", option_to_yojson long_to_yojson x.uplink_delay_ms);
      ("downlinkDelayMs", option_to_yojson long_to_yojson x.downlink_delay_ms);
      ("uplinkJitterMs", option_to_yojson long_to_yojson x.uplink_jitter_ms);
      ("downlinkJitterMs", option_to_yojson long_to_yojson x.downlink_jitter_ms);
      ("uplinkLossPercent", option_to_yojson percent_integer_to_yojson x.uplink_loss_percent);
      ("downlinkLossPercent", option_to_yojson percent_integer_to_yojson x.downlink_loss_percent);
    ]

let update_instance_profile_result_to_yojson (x : update_instance_profile_result) =
  assoc_to_yojson
    [ ("instanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile) ]

let update_instance_profile_request_to_yojson (x : update_instance_profile_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("name", option_to_yojson name_to_yojson x.name);
      ("description", option_to_yojson message_to_yojson x.description);
      ("packageCleanup", option_to_yojson boolean__to_yojson x.package_cleanup);
      ( "excludeAppPackagesFromCleanup",
        option_to_yojson package_ids_to_yojson x.exclude_app_packages_from_cleanup );
      ("rebootAfterUse", option_to_yojson boolean__to_yojson x.reboot_after_use);
    ]

let update_device_pool_result_to_yojson (x : update_device_pool_result) =
  assoc_to_yojson [ ("devicePool", option_to_yojson device_pool_to_yojson x.device_pool) ]

let update_device_pool_request_to_yojson (x : update_device_pool_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("name", option_to_yojson name_to_yojson x.name);
      ("description", option_to_yojson message_to_yojson x.description);
      ("rules", option_to_yojson rules_to_yojson x.rules);
      ("maxDevices", option_to_yojson integer_to_yojson x.max_devices);
      ("clearMaxDevices", option_to_yojson boolean__to_yojson x.clear_max_devices);
    ]

let update_device_instance_result_to_yojson (x : update_device_instance_result) =
  assoc_to_yojson
    [ ("deviceInstance", option_to_yojson device_instance_to_yojson x.device_instance) ]

let update_device_instance_request_to_yojson (x : update_device_instance_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("profileArn", option_to_yojson amazon_resource_name_to_yojson x.profile_arn);
      ("labels", option_to_yojson instance_labels_to_yojson x.labels);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (device_farm_arn_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let tag_policy_exception_to_yojson (x : tag_policy_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (device_farm_arn_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let device_filter_values_to_yojson tree = list_to_yojson string__to_yojson tree

let device_filter_attribute_to_yojson (x : device_filter_attribute) =
  match x with
  | ARN -> `String "ARN"
  | PLATFORM -> `String "PLATFORM"
  | OS_VERSION -> `String "OS_VERSION"
  | MODEL -> `String "MODEL"
  | AVAILABILITY -> `String "AVAILABILITY"
  | FORM_FACTOR -> `String "FORM_FACTOR"
  | MANUFACTURER -> `String "MANUFACTURER"
  | REMOTE_ACCESS_ENABLED -> `String "REMOTE_ACCESS_ENABLED"
  | REMOTE_DEBUG_ENABLED -> `String "REMOTE_DEBUG_ENABLED"
  | INSTANCE_ARN -> `String "INSTANCE_ARN"
  | INSTANCE_LABELS -> `String "INSTANCE_LABELS"
  | FLEET_TYPE -> `String "FLEET_TYPE"

let device_filter_to_yojson (x : device_filter) =
  assoc_to_yojson
    [
      ("attribute", Some (device_filter_attribute_to_yojson x.attribute));
      ("operator", Some (rule_operator_to_yojson x.operator));
      ("values", Some (device_filter_values_to_yojson x.values));
    ]

let device_filters_to_yojson tree = list_to_yojson device_filter_to_yojson tree

let device_selection_result_to_yojson (x : device_selection_result) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson device_filters_to_yojson x.filters);
      ("matchedDevicesCount", option_to_yojson integer_to_yojson x.matched_devices_count);
      ("maxDevices", option_to_yojson integer_to_yojson x.max_devices);
    ]

let location_to_yojson (x : location) =
  assoc_to_yojson
    [
      ("latitude", Some (double_to_yojson x.latitude));
      ("longitude", Some (double_to_yojson x.longitude));
    ]

let radios_to_yojson (x : radios) =
  assoc_to_yojson
    [
      ("wifi", option_to_yojson boolean__to_yojson x.wifi);
      ("bluetooth", option_to_yojson boolean__to_yojson x.bluetooth);
      ("nfc", option_to_yojson boolean__to_yojson x.nfc);
      ("gps", option_to_yojson boolean__to_yojson x.gps);
    ]

let execution_result_code_to_yojson (x : execution_result_code) =
  match x with
  | PARSING_FAILED -> `String "PARSING_FAILED"
  | VPC_ENDPOINT_SETUP_FAILED -> `String "VPC_ENDPOINT_SETUP_FAILED"

let test_type_to_yojson (x : test_type) =
  match x with
  | BUILTIN_FUZZ -> `String "BUILTIN_FUZZ"
  | APPIUM_JAVA_JUNIT -> `String "APPIUM_JAVA_JUNIT"
  | APPIUM_JAVA_TESTNG -> `String "APPIUM_JAVA_TESTNG"
  | APPIUM_PYTHON -> `String "APPIUM_PYTHON"
  | APPIUM_NODE -> `String "APPIUM_NODE"
  | APPIUM_RUBY -> `String "APPIUM_RUBY"
  | APPIUM_WEB_JAVA_JUNIT -> `String "APPIUM_WEB_JAVA_JUNIT"
  | APPIUM_WEB_JAVA_TESTNG -> `String "APPIUM_WEB_JAVA_TESTNG"
  | APPIUM_WEB_PYTHON -> `String "APPIUM_WEB_PYTHON"
  | APPIUM_WEB_NODE -> `String "APPIUM_WEB_NODE"
  | APPIUM_WEB_RUBY -> `String "APPIUM_WEB_RUBY"
  | INSTRUMENTATION -> `String "INSTRUMENTATION"
  | XCTEST -> `String "XCTEST"
  | XCTEST_UI -> `String "XCTEST_UI"

let run_to_yojson (x : run) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("type", option_to_yojson test_type_to_yojson x.type_);
      ("platform", option_to_yojson device_platform_to_yojson x.platform);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("status", option_to_yojson execution_status_to_yojson x.status);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("stopped", option_to_yojson date_time_to_yojson x.stopped);
      ("counters", option_to_yojson counters_to_yojson x.counters);
      ("message", option_to_yojson message_to_yojson x.message);
      ("totalJobs", option_to_yojson integer_to_yojson x.total_jobs);
      ("completedJobs", option_to_yojson integer_to_yojson x.completed_jobs);
      ("billingMethod", option_to_yojson billing_method_to_yojson x.billing_method);
      ("deviceMinutes", option_to_yojson device_minutes_to_yojson x.device_minutes);
      ("networkProfile", option_to_yojson network_profile_to_yojson x.network_profile);
      ("deviceProxy", option_to_yojson device_proxy_to_yojson x.device_proxy);
      ("parsingResultUrl", option_to_yojson string__to_yojson x.parsing_result_url);
      ("resultCode", option_to_yojson execution_result_code_to_yojson x.result_code);
      ("seed", option_to_yojson integer_to_yojson x.seed);
      ("appUpload", option_to_yojson amazon_resource_name_to_yojson x.app_upload);
      ("eventCount", option_to_yojson integer_to_yojson x.event_count);
      ("jobTimeoutMinutes", option_to_yojson job_timeout_minutes_to_yojson x.job_timeout_minutes);
      ("devicePoolArn", option_to_yojson amazon_resource_name_to_yojson x.device_pool_arn);
      ("locale", option_to_yojson string__to_yojson x.locale);
      ("radios", option_to_yojson radios_to_yojson x.radios);
      ("location", option_to_yojson location_to_yojson x.location);
      ( "customerArtifactPaths",
        option_to_yojson customer_artifact_paths_to_yojson x.customer_artifact_paths );
      ("webUrl", option_to_yojson string__to_yojson x.web_url);
      ("skipAppResign", option_to_yojson skip_app_resign_to_yojson x.skip_app_resign);
      ("testSpecArn", option_to_yojson amazon_resource_name_to_yojson x.test_spec_arn);
      ( "deviceSelectionResult",
        option_to_yojson device_selection_result_to_yojson x.device_selection_result );
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("executionRoleArn", option_to_yojson amazon_role_resource_name_to_yojson x.execution_role_arn);
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
    ]

let stop_run_result_to_yojson (x : stop_run_result) =
  assoc_to_yojson [ ("run", option_to_yojson run_to_yojson x.run) ]

let stop_run_request_to_yojson (x : stop_run_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let stop_remote_access_session_result_to_yojson (x : stop_remote_access_session_result) =
  assoc_to_yojson
    [
      ( "remoteAccessSession",
        option_to_yojson remote_access_session_to_yojson x.remote_access_session );
    ]

let stop_remote_access_session_request_to_yojson (x : stop_remote_access_session_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let video_capture_to_yojson = bool_to_yojson

let job_to_yojson (x : job) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("type", option_to_yojson test_type_to_yojson x.type_);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("status", option_to_yojson execution_status_to_yojson x.status);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("stopped", option_to_yojson date_time_to_yojson x.stopped);
      ("counters", option_to_yojson counters_to_yojson x.counters);
      ("message", option_to_yojson message_to_yojson x.message);
      ("device", option_to_yojson device_to_yojson x.device);
      ("instanceArn", option_to_yojson amazon_resource_name_to_yojson x.instance_arn);
      ("deviceMinutes", option_to_yojson device_minutes_to_yojson x.device_minutes);
      ("videoEndpoint", option_to_yojson string__to_yojson x.video_endpoint);
      ("videoCapture", option_to_yojson video_capture_to_yojson x.video_capture);
    ]

let stop_job_result_to_yojson (x : stop_job_result) =
  assoc_to_yojson [ ("job", option_to_yojson job_to_yojson x.job) ]

let stop_job_request_to_yojson (x : stop_job_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let idempotency_exception_to_yojson (x : idempotency_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let schedule_run_result_to_yojson (x : schedule_run_result) =
  assoc_to_yojson [ ("run", option_to_yojson run_to_yojson x.run) ]

let execution_configuration_to_yojson (x : execution_configuration) =
  assoc_to_yojson
    [
      ("jobTimeoutMinutes", option_to_yojson job_timeout_minutes_to_yojson x.job_timeout_minutes);
      ("accountsCleanup", option_to_yojson accounts_cleanup_to_yojson x.accounts_cleanup);
      ("appPackagesCleanup", option_to_yojson app_packages_cleanup_to_yojson x.app_packages_cleanup);
      ("videoCapture", option_to_yojson video_capture_to_yojson x.video_capture);
      ("skipAppResign", option_to_yojson skip_app_resign_to_yojson x.skip_app_resign);
    ]

let schedule_run_configuration_to_yojson (x : schedule_run_configuration) =
  assoc_to_yojson
    [
      ( "extraDataPackageArn",
        option_to_yojson amazon_resource_name_to_yojson x.extra_data_package_arn );
      ("networkProfileArn", option_to_yojson amazon_resource_name_to_yojson x.network_profile_arn);
      ("locale", option_to_yojson string__to_yojson x.locale);
      ("location", option_to_yojson location_to_yojson x.location);
      ( "vpceConfigurationArns",
        option_to_yojson amazon_resource_names_to_yojson x.vpce_configuration_arns );
      ("deviceProxy", option_to_yojson device_proxy_to_yojson x.device_proxy);
      ( "customerArtifactPaths",
        option_to_yojson customer_artifact_paths_to_yojson x.customer_artifact_paths );
      ("radios", option_to_yojson radios_to_yojson x.radios);
      ("auxiliaryApps", option_to_yojson amazon_resource_names_to_yojson x.auxiliary_apps);
      ("billingMethod", option_to_yojson billing_method_to_yojson x.billing_method);
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
      ("executionRoleArn", option_to_yojson amazon_role_resource_name_to_yojson x.execution_role_arn);
    ]

let test_parameters_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let filter_to_yojson = string_to_yojson

let schedule_run_test_to_yojson (x : schedule_run_test) =
  assoc_to_yojson
    [
      ("type", Some (test_type_to_yojson x.type_));
      ("testPackageArn", option_to_yojson amazon_resource_name_to_yojson x.test_package_arn);
      ("testSpecArn", option_to_yojson amazon_resource_name_to_yojson x.test_spec_arn);
      ("filter", option_to_yojson filter_to_yojson x.filter);
      ("parameters", option_to_yojson test_parameters_to_yojson x.parameters);
    ]

let device_selection_configuration_to_yojson (x : device_selection_configuration) =
  assoc_to_yojson
    [
      ("filters", Some (device_filters_to_yojson x.filters));
      ("maxDevices", Some (integer_to_yojson x.max_devices));
    ]

let schedule_run_request_to_yojson (x : schedule_run_request) =
  assoc_to_yojson
    [
      ("projectArn", Some (amazon_resource_name_to_yojson x.project_arn));
      ("appArn", option_to_yojson amazon_resource_name_to_yojson x.app_arn);
      ("devicePoolArn", option_to_yojson amazon_resource_name_to_yojson x.device_pool_arn);
      ( "deviceSelectionConfiguration",
        option_to_yojson device_selection_configuration_to_yojson x.device_selection_configuration
      );
      ("name", option_to_yojson name_to_yojson x.name);
      ("test", Some (schedule_run_test_to_yojson x.test));
      ("configuration", option_to_yojson schedule_run_configuration_to_yojson x.configuration);
      ( "executionConfiguration",
        option_to_yojson execution_configuration_to_yojson x.execution_configuration );
    ]

let not_eligible_exception_to_yojson (x : not_eligible_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let monetary_amount_to_yojson (x : monetary_amount) =
  assoc_to_yojson
    [
      ("amount", option_to_yojson double_to_yojson x.amount);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
    ]

let offering_promotion_identifier_to_yojson = string_to_yojson
let transaction_identifier_to_yojson = string_to_yojson

let recurring_charge_frequency_to_yojson (x : recurring_charge_frequency) =
  match x with MONTHLY -> `String "MONTHLY"

let recurring_charge_to_yojson (x : recurring_charge) =
  assoc_to_yojson
    [
      ("cost", option_to_yojson monetary_amount_to_yojson x.cost);
      ("frequency", option_to_yojson recurring_charge_frequency_to_yojson x.frequency);
    ]

let recurring_charges_to_yojson tree = list_to_yojson recurring_charge_to_yojson tree
let offering_type_to_yojson (x : offering_type) = match x with RECURRING -> `String "RECURRING"
let offering_identifier_to_yojson = string_to_yojson

let offering_to_yojson (x : offering) =
  assoc_to_yojson
    [
      ("id", option_to_yojson offering_identifier_to_yojson x.id);
      ("description", option_to_yojson message_to_yojson x.description);
      ("type", option_to_yojson offering_type_to_yojson x.type_);
      ("platform", option_to_yojson device_platform_to_yojson x.platform);
      ("recurringCharges", option_to_yojson recurring_charges_to_yojson x.recurring_charges);
    ]

let offering_transaction_type_to_yojson (x : offering_transaction_type) =
  match x with
  | PURCHASE -> `String "PURCHASE"
  | RENEW -> `String "RENEW"
  | SYSTEM -> `String "SYSTEM"

let offering_status_to_yojson (x : offering_status) =
  assoc_to_yojson
    [
      ("type", option_to_yojson offering_transaction_type_to_yojson x.type_);
      ("offering", option_to_yojson offering_to_yojson x.offering);
      ("quantity", option_to_yojson integer_to_yojson x.quantity);
      ("effectiveOn", option_to_yojson date_time_to_yojson x.effective_on);
    ]

let offering_transaction_to_yojson (x : offering_transaction) =
  assoc_to_yojson
    [
      ("offeringStatus", option_to_yojson offering_status_to_yojson x.offering_status);
      ("transactionId", option_to_yojson transaction_identifier_to_yojson x.transaction_id);
      ( "offeringPromotionId",
        option_to_yojson offering_promotion_identifier_to_yojson x.offering_promotion_id );
      ("createdOn", option_to_yojson date_time_to_yojson x.created_on);
      ("cost", option_to_yojson monetary_amount_to_yojson x.cost);
    ]

let renew_offering_result_to_yojson (x : renew_offering_result) =
  assoc_to_yojson
    [
      ("offeringTransaction", option_to_yojson offering_transaction_to_yojson x.offering_transaction);
    ]

let renew_offering_request_to_yojson (x : renew_offering_request) =
  assoc_to_yojson
    [
      ("offeringId", Some (offering_identifier_to_yojson x.offering_id));
      ("quantity", Some (integer_to_yojson x.quantity));
    ]

let purchase_offering_result_to_yojson (x : purchase_offering_result) =
  assoc_to_yojson
    [
      ("offeringTransaction", option_to_yojson offering_transaction_to_yojson x.offering_transaction);
    ]

let purchase_offering_request_to_yojson (x : purchase_offering_request) =
  assoc_to_yojson
    [
      ("offeringId", Some (offering_identifier_to_yojson x.offering_id));
      ("quantity", Some (integer_to_yojson x.quantity));
      ( "offeringPromotionId",
        option_to_yojson offering_promotion_identifier_to_yojson x.offering_promotion_id );
    ]

let pagination_token_to_yojson = string_to_yojson
let vpce_configurations_to_yojson tree = list_to_yojson vpce_configuration_to_yojson tree

let list_vpce_configurations_result_to_yojson (x : list_vpce_configurations_result) =
  assoc_to_yojson
    [
      ("vpceConfigurations", option_to_yojson vpce_configurations_to_yojson x.vpce_configurations);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_vpce_configurations_request_to_yojson (x : list_vpce_configurations_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let uploads_to_yojson tree = list_to_yojson upload_to_yojson tree

let list_uploads_result_to_yojson (x : list_uploads_result) =
  assoc_to_yojson
    [
      ("uploads", option_to_yojson uploads_to_yojson x.uploads);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_uploads_request_to_yojson (x : list_uploads_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("type", option_to_yojson upload_type_to_yojson x.type_);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let problem_detail_to_yojson (x : problem_detail) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let problem_to_yojson (x : problem) =
  assoc_to_yojson
    [
      ("run", option_to_yojson problem_detail_to_yojson x.run);
      ("job", option_to_yojson problem_detail_to_yojson x.job);
      ("suite", option_to_yojson problem_detail_to_yojson x.suite);
      ("test", option_to_yojson problem_detail_to_yojson x.test);
      ("device", option_to_yojson device_to_yojson x.device);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let problems_to_yojson tree = list_to_yojson problem_to_yojson tree

let unique_problem_to_yojson (x : unique_problem) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("problems", option_to_yojson problems_to_yojson x.problems);
    ]

let unique_problems_to_yojson tree = list_to_yojson unique_problem_to_yojson tree

let unique_problems_by_execution_result_map_to_yojson tree =
  map_to_yojson execution_result_to_yojson unique_problems_to_yojson tree

let list_unique_problems_result_to_yojson (x : list_unique_problems_result) =
  assoc_to_yojson
    [
      ( "uniqueProblems",
        option_to_yojson unique_problems_by_execution_result_map_to_yojson x.unique_problems );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_unique_problems_request_to_yojson (x : list_unique_problems_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let test_to_yojson (x : test) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("type", option_to_yojson test_type_to_yojson x.type_);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("status", option_to_yojson execution_status_to_yojson x.status);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("stopped", option_to_yojson date_time_to_yojson x.stopped);
      ("counters", option_to_yojson counters_to_yojson x.counters);
      ("message", option_to_yojson message_to_yojson x.message);
      ("deviceMinutes", option_to_yojson device_minutes_to_yojson x.device_minutes);
    ]

let tests_to_yojson tree = list_to_yojson test_to_yojson tree

let list_tests_result_to_yojson (x : list_tests_result) =
  assoc_to_yojson
    [
      ("tests", option_to_yojson tests_to_yojson x.tests);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_tests_request_to_yojson (x : list_tests_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let test_grid_session_status_to_yojson (x : test_grid_session_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | CLOSED -> `String "CLOSED"
  | ERRORED -> `String "ERRORED"

let test_grid_session_to_yojson (x : test_grid_session) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson device_farm_arn_to_yojson x.arn);
      ("status", option_to_yojson test_grid_session_status_to_yojson x.status);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("ended", option_to_yojson date_time_to_yojson x.ended);
      ("billingMinutes", option_to_yojson double_to_yojson x.billing_minutes);
      ("seleniumProperties", option_to_yojson string__to_yojson x.selenium_properties);
    ]

let test_grid_sessions_to_yojson tree = list_to_yojson test_grid_session_to_yojson tree

let list_test_grid_sessions_result_to_yojson (x : list_test_grid_sessions_result) =
  assoc_to_yojson
    [
      ("testGridSessions", option_to_yojson test_grid_sessions_to_yojson x.test_grid_sessions);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let max_page_size_to_yojson = int_to_yojson

let list_test_grid_sessions_request_to_yojson (x : list_test_grid_sessions_request) =
  assoc_to_yojson
    [
      ("projectArn", Some (device_farm_arn_to_yojson x.project_arn));
      ("status", option_to_yojson test_grid_session_status_to_yojson x.status);
      ("creationTimeAfter", option_to_yojson date_time_to_yojson x.creation_time_after);
      ("creationTimeBefore", option_to_yojson date_time_to_yojson x.creation_time_before);
      ("endTimeAfter", option_to_yojson date_time_to_yojson x.end_time_after);
      ("endTimeBefore", option_to_yojson date_time_to_yojson x.end_time_before);
      ("maxResult", option_to_yojson max_page_size_to_yojson x.max_result);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let test_grid_session_artifact_type_to_yojson (x : test_grid_session_artifact_type) =
  match x with
  | UNKNOWN -> `String "UNKNOWN"
  | VIDEO -> `String "VIDEO"
  | SELENIUM_LOG -> `String "SELENIUM_LOG"

let test_grid_session_artifact_to_yojson (x : test_grid_session_artifact) =
  assoc_to_yojson
    [
      ("filename", option_to_yojson string__to_yojson x.filename);
      ("type", option_to_yojson test_grid_session_artifact_type_to_yojson x.type_);
      ("url", option_to_yojson sensitive_string_to_yojson x.url);
    ]

let test_grid_session_artifacts_to_yojson tree =
  list_to_yojson test_grid_session_artifact_to_yojson tree

let list_test_grid_session_artifacts_result_to_yojson (x : list_test_grid_session_artifacts_result)
    =
  assoc_to_yojson
    [
      ("artifacts", option_to_yojson test_grid_session_artifacts_to_yojson x.artifacts);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let test_grid_session_artifact_category_to_yojson (x : test_grid_session_artifact_category) =
  match x with VIDEO -> `String "VIDEO" | LOG -> `String "LOG"

let list_test_grid_session_artifacts_request_to_yojson
    (x : list_test_grid_session_artifacts_request) =
  assoc_to_yojson
    [
      ("sessionArn", Some (device_farm_arn_to_yojson x.session_arn));
      ("type", option_to_yojson test_grid_session_artifact_category_to_yojson x.type_);
      ("maxResult", option_to_yojson max_page_size_to_yojson x.max_result);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let test_grid_session_action_to_yojson (x : test_grid_session_action) =
  assoc_to_yojson
    [
      ("action", option_to_yojson string__to_yojson x.action);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("duration", option_to_yojson long_to_yojson x.duration);
      ("statusCode", option_to_yojson string__to_yojson x.status_code);
      ("requestMethod", option_to_yojson string__to_yojson x.request_method);
    ]

let test_grid_session_actions_to_yojson tree =
  list_to_yojson test_grid_session_action_to_yojson tree

let list_test_grid_session_actions_result_to_yojson (x : list_test_grid_session_actions_result) =
  assoc_to_yojson
    [
      ("actions", option_to_yojson test_grid_session_actions_to_yojson x.actions);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_test_grid_session_actions_request_to_yojson (x : list_test_grid_session_actions_request) =
  assoc_to_yojson
    [
      ("sessionArn", Some (device_farm_arn_to_yojson x.session_arn));
      ("maxResult", option_to_yojson max_page_size_to_yojson x.max_result);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let test_grid_projects_to_yojson tree = list_to_yojson test_grid_project_to_yojson tree

let list_test_grid_projects_result_to_yojson (x : list_test_grid_projects_result) =
  assoc_to_yojson
    [
      ("testGridProjects", option_to_yojson test_grid_projects_to_yojson x.test_grid_projects);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_test_grid_projects_request_to_yojson (x : list_test_grid_projects_request) =
  assoc_to_yojson
    [
      ("maxResult", option_to_yojson max_page_size_to_yojson x.max_result);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (device_farm_arn_to_yojson x.resource_ar_n)) ]

let suite_to_yojson (x : suite) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("type", option_to_yojson test_type_to_yojson x.type_);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("status", option_to_yojson execution_status_to_yojson x.status);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("stopped", option_to_yojson date_time_to_yojson x.stopped);
      ("counters", option_to_yojson counters_to_yojson x.counters);
      ("message", option_to_yojson message_to_yojson x.message);
      ("deviceMinutes", option_to_yojson device_minutes_to_yojson x.device_minutes);
    ]

let suites_to_yojson tree = list_to_yojson suite_to_yojson tree

let list_suites_result_to_yojson (x : list_suites_result) =
  assoc_to_yojson
    [
      ("suites", option_to_yojson suites_to_yojson x.suites);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_suites_request_to_yojson (x : list_suites_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let sample_type_to_yojson (x : sample_type) =
  match x with
  | CPU -> `String "CPU"
  | MEMORY -> `String "MEMORY"
  | THREADS -> `String "THREADS"
  | RX_RATE -> `String "RX_RATE"
  | TX_RATE -> `String "TX_RATE"
  | RX -> `String "RX"
  | TX -> `String "TX"
  | NATIVE_FRAMES -> `String "NATIVE_FRAMES"
  | NATIVE_FPS -> `String "NATIVE_FPS"
  | NATIVE_MIN_DRAWTIME -> `String "NATIVE_MIN_DRAWTIME"
  | NATIVE_AVG_DRAWTIME -> `String "NATIVE_AVG_DRAWTIME"
  | NATIVE_MAX_DRAWTIME -> `String "NATIVE_MAX_DRAWTIME"
  | OPENGL_FRAMES -> `String "OPENGL_FRAMES"
  | OPENGL_FPS -> `String "OPENGL_FPS"
  | OPENGL_MIN_DRAWTIME -> `String "OPENGL_MIN_DRAWTIME"
  | OPENGL_AVG_DRAWTIME -> `String "OPENGL_AVG_DRAWTIME"
  | OPENGL_MAX_DRAWTIME -> `String "OPENGL_MAX_DRAWTIME"

let sample_to_yojson (x : sample) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("type", option_to_yojson sample_type_to_yojson x.type_);
      ("url", option_to_yojson ur_l_to_yojson x.url);
    ]

let samples_to_yojson tree = list_to_yojson sample_to_yojson tree

let list_samples_result_to_yojson (x : list_samples_result) =
  assoc_to_yojson
    [
      ("samples", option_to_yojson samples_to_yojson x.samples);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_samples_request_to_yojson (x : list_samples_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let runs_to_yojson tree = list_to_yojson run_to_yojson tree

let list_runs_result_to_yojson (x : list_runs_result) =
  assoc_to_yojson
    [
      ("runs", option_to_yojson runs_to_yojson x.runs);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_runs_request_to_yojson (x : list_runs_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let remote_access_sessions_to_yojson tree = list_to_yojson remote_access_session_to_yojson tree

let list_remote_access_sessions_result_to_yojson (x : list_remote_access_sessions_result) =
  assoc_to_yojson
    [
      ( "remoteAccessSessions",
        option_to_yojson remote_access_sessions_to_yojson x.remote_access_sessions );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_remote_access_sessions_request_to_yojson (x : list_remote_access_sessions_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let projects_to_yojson tree = list_to_yojson project_to_yojson tree

let list_projects_result_to_yojson (x : list_projects_result) =
  assoc_to_yojson
    [
      ("projects", option_to_yojson projects_to_yojson x.projects);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_projects_request_to_yojson (x : list_projects_request) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let offering_transactions_to_yojson tree = list_to_yojson offering_transaction_to_yojson tree

let list_offering_transactions_result_to_yojson (x : list_offering_transactions_result) =
  assoc_to_yojson
    [
      ( "offeringTransactions",
        option_to_yojson offering_transactions_to_yojson x.offering_transactions );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_offering_transactions_request_to_yojson (x : list_offering_transactions_request) =
  assoc_to_yojson [ ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let offerings_to_yojson tree = list_to_yojson offering_to_yojson tree

let list_offerings_result_to_yojson (x : list_offerings_result) =
  assoc_to_yojson
    [
      ("offerings", option_to_yojson offerings_to_yojson x.offerings);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_offerings_request_to_yojson (x : list_offerings_request) =
  assoc_to_yojson [ ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let offering_promotion_to_yojson (x : offering_promotion) =
  assoc_to_yojson
    [
      ("id", option_to_yojson offering_promotion_identifier_to_yojson x.id);
      ("description", option_to_yojson message_to_yojson x.description);
    ]

let offering_promotions_to_yojson tree = list_to_yojson offering_promotion_to_yojson tree

let list_offering_promotions_result_to_yojson (x : list_offering_promotions_result) =
  assoc_to_yojson
    [
      ("offeringPromotions", option_to_yojson offering_promotions_to_yojson x.offering_promotions);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_offering_promotions_request_to_yojson (x : list_offering_promotions_request) =
  assoc_to_yojson [ ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let network_profiles_to_yojson tree = list_to_yojson network_profile_to_yojson tree

let list_network_profiles_result_to_yojson (x : list_network_profiles_result) =
  assoc_to_yojson
    [
      ("networkProfiles", option_to_yojson network_profiles_to_yojson x.network_profiles);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_network_profiles_request_to_yojson (x : list_network_profiles_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("type", option_to_yojson network_profile_type_to_yojson x.type_);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let jobs_to_yojson tree = list_to_yojson job_to_yojson tree

let list_jobs_result_to_yojson (x : list_jobs_result) =
  assoc_to_yojson
    [
      ("jobs", option_to_yojson jobs_to_yojson x.jobs);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_jobs_request_to_yojson (x : list_jobs_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let instance_profiles_to_yojson tree = list_to_yojson instance_profile_to_yojson tree

let list_instance_profiles_result_to_yojson (x : list_instance_profiles_result) =
  assoc_to_yojson
    [
      ("instanceProfiles", option_to_yojson instance_profiles_to_yojson x.instance_profiles);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_instance_profiles_request_to_yojson (x : list_instance_profiles_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let devices_to_yojson tree = list_to_yojson device_to_yojson tree

let list_devices_result_to_yojson (x : list_devices_result) =
  assoc_to_yojson
    [
      ("devices", option_to_yojson devices_to_yojson x.devices);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_devices_request_to_yojson (x : list_devices_request) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("filters", option_to_yojson device_filters_to_yojson x.filters);
    ]

let device_pools_to_yojson tree = list_to_yojson device_pool_to_yojson tree

let list_device_pools_result_to_yojson (x : list_device_pools_result) =
  assoc_to_yojson
    [
      ("devicePools", option_to_yojson device_pools_to_yojson x.device_pools);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_device_pools_request_to_yojson (x : list_device_pools_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("type", option_to_yojson device_pool_type_to_yojson x.type_);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_device_instances_result_to_yojson (x : list_device_instances_result) =
  assoc_to_yojson
    [
      ("deviceInstances", option_to_yojson device_instances_to_yojson x.device_instances);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_device_instances_request_to_yojson (x : list_device_instances_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_artifacts_result_to_yojson (x : list_artifacts_result) =
  assoc_to_yojson
    [
      ("artifacts", option_to_yojson artifacts_to_yojson x.artifacts);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_artifacts_request_to_yojson (x : list_artifacts_request) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("type", Some (artifact_category_to_yojson x.type_));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let install_to_remote_access_session_result_to_yojson (x : install_to_remote_access_session_result)
    =
  assoc_to_yojson [ ("appUpload", option_to_yojson upload_to_yojson x.app_upload) ]

let install_to_remote_access_session_request_to_yojson
    (x : install_to_remote_access_session_request) =
  assoc_to_yojson
    [
      ("remoteAccessSessionArn", Some (amazon_resource_name_to_yojson x.remote_access_session_arn));
      ("appArn", Some (amazon_resource_name_to_yojson x.app_arn));
    ]

let get_vpce_configuration_result_to_yojson (x : get_vpce_configuration_result) =
  assoc_to_yojson
    [ ("vpceConfiguration", option_to_yojson vpce_configuration_to_yojson x.vpce_configuration) ]

let get_vpce_configuration_request_to_yojson (x : get_vpce_configuration_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_upload_result_to_yojson (x : get_upload_result) =
  assoc_to_yojson [ ("upload", option_to_yojson upload_to_yojson x.upload) ]

let get_upload_request_to_yojson (x : get_upload_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_test_grid_session_result_to_yojson (x : get_test_grid_session_result) =
  assoc_to_yojson
    [ ("testGridSession", option_to_yojson test_grid_session_to_yojson x.test_grid_session) ]

let resource_id_to_yojson = string_to_yojson

let get_test_grid_session_request_to_yojson (x : get_test_grid_session_request) =
  assoc_to_yojson
    [
      ("projectArn", option_to_yojson device_farm_arn_to_yojson x.project_arn);
      ("sessionId", option_to_yojson resource_id_to_yojson x.session_id);
      ("sessionArn", option_to_yojson device_farm_arn_to_yojson x.session_arn);
    ]

let get_test_grid_project_result_to_yojson (x : get_test_grid_project_result) =
  assoc_to_yojson
    [ ("testGridProject", option_to_yojson test_grid_project_to_yojson x.test_grid_project) ]

let get_test_grid_project_request_to_yojson (x : get_test_grid_project_request) =
  assoc_to_yojson [ ("projectArn", Some (device_farm_arn_to_yojson x.project_arn)) ]

let get_test_result_to_yojson (x : get_test_result) =
  assoc_to_yojson [ ("test", option_to_yojson test_to_yojson x.test) ]

let get_test_request_to_yojson (x : get_test_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_suite_result_to_yojson (x : get_suite_result) =
  assoc_to_yojson [ ("suite", option_to_yojson suite_to_yojson x.suite) ]

let get_suite_request_to_yojson (x : get_suite_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_run_result_to_yojson (x : get_run_result) =
  assoc_to_yojson [ ("run", option_to_yojson run_to_yojson x.run) ]

let get_run_request_to_yojson (x : get_run_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_remote_access_session_result_to_yojson (x : get_remote_access_session_result) =
  assoc_to_yojson
    [
      ( "remoteAccessSession",
        option_to_yojson remote_access_session_to_yojson x.remote_access_session );
    ]

let get_remote_access_session_request_to_yojson (x : get_remote_access_session_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_project_result_to_yojson (x : get_project_result) =
  assoc_to_yojson [ ("project", option_to_yojson project_to_yojson x.project) ]

let get_project_request_to_yojson (x : get_project_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let offering_status_map_to_yojson tree =
  map_to_yojson offering_identifier_to_yojson offering_status_to_yojson tree

let get_offering_status_result_to_yojson (x : get_offering_status_result) =
  assoc_to_yojson
    [
      ("current", option_to_yojson offering_status_map_to_yojson x.current);
      ("nextPeriod", option_to_yojson offering_status_map_to_yojson x.next_period);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let get_offering_status_request_to_yojson (x : get_offering_status_request) =
  assoc_to_yojson [ ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let get_network_profile_result_to_yojson (x : get_network_profile_result) =
  assoc_to_yojson
    [ ("networkProfile", option_to_yojson network_profile_to_yojson x.network_profile) ]

let get_network_profile_request_to_yojson (x : get_network_profile_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_job_result_to_yojson (x : get_job_result) =
  assoc_to_yojson [ ("job", option_to_yojson job_to_yojson x.job) ]

let get_job_request_to_yojson (x : get_job_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_instance_profile_result_to_yojson (x : get_instance_profile_result) =
  assoc_to_yojson
    [ ("instanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile) ]

let get_instance_profile_request_to_yojson (x : get_instance_profile_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let incompatibility_message_to_yojson (x : incompatibility_message) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("type", option_to_yojson device_attribute_to_yojson x.type_);
    ]

let incompatibility_messages_to_yojson tree = list_to_yojson incompatibility_message_to_yojson tree

let device_pool_compatibility_result_to_yojson (x : device_pool_compatibility_result) =
  assoc_to_yojson
    [
      ("device", option_to_yojson device_to_yojson x.device);
      ("compatible", option_to_yojson boolean__to_yojson x.compatible);
      ( "incompatibilityMessages",
        option_to_yojson incompatibility_messages_to_yojson x.incompatibility_messages );
    ]

let device_pool_compatibility_results_to_yojson tree =
  list_to_yojson device_pool_compatibility_result_to_yojson tree

let get_device_pool_compatibility_result_to_yojson (x : get_device_pool_compatibility_result) =
  assoc_to_yojson
    [
      ( "compatibleDevices",
        option_to_yojson device_pool_compatibility_results_to_yojson x.compatible_devices );
      ( "incompatibleDevices",
        option_to_yojson device_pool_compatibility_results_to_yojson x.incompatible_devices );
    ]

let get_device_pool_compatibility_request_to_yojson (x : get_device_pool_compatibility_request) =
  assoc_to_yojson
    [
      ("devicePoolArn", Some (amazon_resource_name_to_yojson x.device_pool_arn));
      ("appArn", option_to_yojson amazon_resource_name_to_yojson x.app_arn);
      ("testType", option_to_yojson test_type_to_yojson x.test_type);
      ("test", option_to_yojson schedule_run_test_to_yojson x.test);
      ("configuration", option_to_yojson schedule_run_configuration_to_yojson x.configuration);
      ("projectArn", option_to_yojson amazon_resource_name_to_yojson x.project_arn);
    ]

let get_device_pool_result_to_yojson (x : get_device_pool_result) =
  assoc_to_yojson [ ("devicePool", option_to_yojson device_pool_to_yojson x.device_pool) ]

let get_device_pool_request_to_yojson (x : get_device_pool_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_device_instance_result_to_yojson (x : get_device_instance_result) =
  assoc_to_yojson
    [ ("deviceInstance", option_to_yojson device_instance_to_yojson x.device_instance) ]

let get_device_instance_request_to_yojson (x : get_device_instance_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_device_result_to_yojson (x : get_device_result) =
  assoc_to_yojson [ ("device", option_to_yojson device_to_yojson x.device) ]

let get_device_request_to_yojson (x : get_device_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_account_settings_result_to_yojson (x : get_account_settings_result) =
  assoc_to_yojson
    [ ("accountSettings", option_to_yojson account_settings_to_yojson x.account_settings) ]

let get_account_settings_request_to_yojson = unit_to_yojson
