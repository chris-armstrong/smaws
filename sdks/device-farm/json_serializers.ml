open Smaws_Lib.Json.SerializeHelpers
open Types

let subnet_id_to_yojson = string_to_yojson
let vpc_subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let security_group_id_to_yojson = string_to_yojson
let vpc_security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree
let non_empty_string_to_yojson = string_to_yojson

let vpc_config_to_yojson (x : vpc_config) =
  assoc_to_yojson
    [
      ("vpcId", Some (non_empty_string_to_yojson x.vpc_id));
      ("subnetIds", Some (vpc_subnet_ids_to_yojson x.subnet_ids));
      ("securityGroupIds", Some (vpc_security_group_ids_to_yojson x.security_group_ids));
    ]

let video_capture_to_yojson = bool_to_yojson
let vpce_service_name_to_yojson = string_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let vpce_configuration_name_to_yojson = string_to_yojson
let service_dns_name_to_yojson = string_to_yojson
let vpce_configuration_description_to_yojson = string_to_yojson

let vpce_configuration_to_yojson (x : vpce_configuration) =
  assoc_to_yojson
    [
      ( "vpceConfigurationDescription",
        option_to_yojson vpce_configuration_description_to_yojson x.vpce_configuration_description
      );
      ("serviceDnsName", option_to_yojson service_dns_name_to_yojson x.service_dns_name);
      ("vpceServiceName", option_to_yojson vpce_service_name_to_yojson x.vpce_service_name);
      ( "vpceConfigurationName",
        option_to_yojson vpce_configuration_name_to_yojson x.vpce_configuration_name );
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let vpce_configurations_to_yojson tree = list_to_yojson vpce_configuration_to_yojson tree
let name_to_yojson = string_to_yojson
let date_time_to_yojson = timestamp_epoch_seconds_to_yojson

let upload_type_to_yojson (x : upload_type) =
  match x with
  | XCTEST_UI_TEST_SPEC -> `String "XCTEST_UI_TEST_SPEC"
  | INSTRUMENTATION_TEST_SPEC -> `String "INSTRUMENTATION_TEST_SPEC"
  | APPIUM_WEB_RUBY_TEST_SPEC -> `String "APPIUM_WEB_RUBY_TEST_SPEC"
  | APPIUM_WEB_NODE_TEST_SPEC -> `String "APPIUM_WEB_NODE_TEST_SPEC"
  | APPIUM_WEB_PYTHON_TEST_SPEC -> `String "APPIUM_WEB_PYTHON_TEST_SPEC"
  | APPIUM_WEB_JAVA_TESTNG_TEST_SPEC -> `String "APPIUM_WEB_JAVA_TESTNG_TEST_SPEC"
  | APPIUM_WEB_JAVA_JUNIT_TEST_SPEC -> `String "APPIUM_WEB_JAVA_JUNIT_TEST_SPEC"
  | APPIUM_RUBY_TEST_SPEC -> `String "APPIUM_RUBY_TEST_SPEC"
  | APPIUM_NODE_TEST_SPEC -> `String "APPIUM_NODE_TEST_SPEC"
  | APPIUM_PYTHON_TEST_SPEC -> `String "APPIUM_PYTHON_TEST_SPEC"
  | APPIUM_JAVA_TESTNG_TEST_SPEC -> `String "APPIUM_JAVA_TESTNG_TEST_SPEC"
  | APPIUM_JAVA_JUNIT_TEST_SPEC -> `String "APPIUM_JAVA_JUNIT_TEST_SPEC"
  | XCTEST_UI_TEST_PACKAGE -> `String "XCTEST_UI_TEST_PACKAGE"
  | XCTEST_TEST_PACKAGE -> `String "XCTEST_TEST_PACKAGE"
  | UIAUTOMATOR_TEST_PACKAGE -> `String "UIAUTOMATOR_TEST_PACKAGE"
  | UIAUTOMATION_TEST_PACKAGE -> `String "UIAUTOMATION_TEST_PACKAGE"
  | INSTRUMENTATION_TEST_PACKAGE -> `String "INSTRUMENTATION_TEST_PACKAGE"
  | CALABASH_TEST_PACKAGE -> `String "CALABASH_TEST_PACKAGE"
  | APPIUM_WEB_RUBY_TEST_PACKAGE -> `String "APPIUM_WEB_RUBY_TEST_PACKAGE"
  | APPIUM_WEB_NODE_TEST_PACKAGE -> `String "APPIUM_WEB_NODE_TEST_PACKAGE"
  | APPIUM_WEB_PYTHON_TEST_PACKAGE -> `String "APPIUM_WEB_PYTHON_TEST_PACKAGE"
  | APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE -> `String "APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE"
  | APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE -> `String "APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE"
  | APPIUM_RUBY_TEST_PACKAGE -> `String "APPIUM_RUBY_TEST_PACKAGE"
  | APPIUM_NODE_TEST_PACKAGE -> `String "APPIUM_NODE_TEST_PACKAGE"
  | APPIUM_PYTHON_TEST_PACKAGE -> `String "APPIUM_PYTHON_TEST_PACKAGE"
  | APPIUM_JAVA_TESTNG_TEST_PACKAGE -> `String "APPIUM_JAVA_TESTNG_TEST_PACKAGE"
  | APPIUM_JAVA_JUNIT_TEST_PACKAGE -> `String "APPIUM_JAVA_JUNIT_TEST_PACKAGE"
  | EXTERNAL_DATA -> `String "EXTERNAL_DATA"
  | WEB_APP -> `String "WEB_APP"
  | IOS_APP -> `String "IOS_APP"
  | ANDROID_APP -> `String "ANDROID_APP"

let upload_status_to_yojson (x : upload_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | PROCESSING -> `String "PROCESSING"
  | INITIALIZED -> `String "INITIALIZED"

let sensitive_ur_l_to_yojson = string_to_yojson
let metadata_to_yojson = string_to_yojson
let content_type_to_yojson = string_to_yojson
let message_to_yojson = string_to_yojson

let upload_category_to_yojson (x : upload_category) =
  match x with PRIVATE -> `String "PRIVATE" | CURATED -> `String "CURATED"

let upload_to_yojson (x : upload) =
  assoc_to_yojson
    [
      ("category", option_to_yojson upload_category_to_yojson x.category);
      ("message", option_to_yojson message_to_yojson x.message);
      ("contentType", option_to_yojson content_type_to_yojson x.content_type);
      ("metadata", option_to_yojson metadata_to_yojson x.metadata);
      ("url", option_to_yojson sensitive_ur_l_to_yojson x.url);
      ("status", option_to_yojson upload_status_to_yojson x.status);
      ("type", option_to_yojson upload_type_to_yojson x.type_);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let uploads_to_yojson tree = list_to_yojson upload_to_yojson tree

let update_vpce_configuration_result_to_yojson (x : update_vpce_configuration_result) =
  assoc_to_yojson
    [ ("vpceConfiguration", option_to_yojson vpce_configuration_to_yojson x.vpce_configuration) ]

let update_vpce_configuration_request_to_yojson (x : update_vpce_configuration_request) =
  assoc_to_yojson
    [
      ( "vpceConfigurationDescription",
        option_to_yojson vpce_configuration_description_to_yojson x.vpce_configuration_description
      );
      ("serviceDnsName", option_to_yojson service_dns_name_to_yojson x.service_dns_name);
      ("vpceServiceName", option_to_yojson vpce_service_name_to_yojson x.vpce_service_name);
      ( "vpceConfigurationName",
        option_to_yojson vpce_configuration_name_to_yojson x.vpce_configuration_name );
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let service_account_exception_to_yojson (x : service_account_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_operation_exception_to_yojson (x : invalid_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let argument_exception_to_yojson (x : argument_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_upload_result_to_yojson (x : update_upload_result) =
  assoc_to_yojson [ ("upload", option_to_yojson upload_to_yojson x.upload) ]

let boolean__to_yojson = bool_to_yojson

let update_upload_request_to_yojson (x : update_upload_request) =
  assoc_to_yojson
    [
      ("editContent", option_to_yojson boolean__to_yojson x.edit_content);
      ("contentType", option_to_yojson content_type_to_yojson x.content_type);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let device_farm_arn_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree
let subnet_ids_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let test_grid_vpc_config_to_yojson (x : test_grid_vpc_config) =
  assoc_to_yojson
    [
      ("vpcId", Some (non_empty_string_to_yojson x.vpc_id));
      ("subnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ("securityGroupIds", Some (security_group_ids_to_yojson x.security_group_ids));
    ]

let test_grid_project_to_yojson (x : test_grid_project) =
  assoc_to_yojson
    [
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("vpcConfig", option_to_yojson test_grid_vpc_config_to_yojson x.vpc_config);
      ("description", option_to_yojson string__to_yojson x.description);
      ("name", option_to_yojson string__to_yojson x.name);
      ("arn", option_to_yojson device_farm_arn_to_yojson x.arn);
    ]

let update_test_grid_project_result_to_yojson (x : update_test_grid_project_result) =
  assoc_to_yojson
    [ ("testGridProject", option_to_yojson test_grid_project_to_yojson x.test_grid_project) ]

let resource_name_to_yojson = string_to_yojson
let resource_description_to_yojson = string_to_yojson

let update_test_grid_project_request_to_yojson (x : update_test_grid_project_request) =
  assoc_to_yojson
    [
      ("vpcConfig", option_to_yojson test_grid_vpc_config_to_yojson x.vpc_config);
      ("description", option_to_yojson resource_description_to_yojson x.description);
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("projectArn", Some (device_farm_arn_to_yojson x.project_arn));
    ]

let internal_service_exception_to_yojson (x : internal_service_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let job_timeout_minutes_to_yojson = int_to_yojson
let environment_variable_name_to_yojson = string_to_yojson
let environment_variable_value_to_yojson = string_to_yojson

let environment_variable_to_yojson (x : environment_variable) =
  assoc_to_yojson
    [
      ("value", Some (environment_variable_value_to_yojson x.value));
      ("name", Some (environment_variable_name_to_yojson x.name));
    ]

let environment_variables_to_yojson tree = list_to_yojson environment_variable_to_yojson tree
let amazon_role_resource_name_to_yojson = string_to_yojson

let project_to_yojson (x : project) =
  assoc_to_yojson
    [
      ("executionRoleArn", option_to_yojson amazon_role_resource_name_to_yojson x.execution_role_arn);
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ( "defaultJobTimeoutMinutes",
        option_to_yojson job_timeout_minutes_to_yojson x.default_job_timeout_minutes );
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let update_project_result_to_yojson (x : update_project_result) =
  assoc_to_yojson [ ("project", option_to_yojson project_to_yojson x.project) ]

let update_project_request_to_yojson (x : update_project_request) =
  assoc_to_yojson
    [
      ("executionRoleArn", option_to_yojson amazon_role_resource_name_to_yojson x.execution_role_arn);
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ( "defaultJobTimeoutMinutes",
        option_to_yojson job_timeout_minutes_to_yojson x.default_job_timeout_minutes );
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let network_profile_type_to_yojson (x : network_profile_type) =
  match x with PRIVATE -> `String "PRIVATE" | CURATED -> `String "CURATED"

let long_to_yojson = long_to_yojson
let percent_integer_to_yojson = int_to_yojson

let network_profile_to_yojson (x : network_profile) =
  assoc_to_yojson
    [
      ("downlinkLossPercent", option_to_yojson percent_integer_to_yojson x.downlink_loss_percent);
      ("uplinkLossPercent", option_to_yojson percent_integer_to_yojson x.uplink_loss_percent);
      ("downlinkJitterMs", option_to_yojson long_to_yojson x.downlink_jitter_ms);
      ("uplinkJitterMs", option_to_yojson long_to_yojson x.uplink_jitter_ms);
      ("downlinkDelayMs", option_to_yojson long_to_yojson x.downlink_delay_ms);
      ("uplinkDelayMs", option_to_yojson long_to_yojson x.uplink_delay_ms);
      ("downlinkBandwidthBits", option_to_yojson long_to_yojson x.downlink_bandwidth_bits);
      ("uplinkBandwidthBits", option_to_yojson long_to_yojson x.uplink_bandwidth_bits);
      ("type", option_to_yojson network_profile_type_to_yojson x.type_);
      ("description", option_to_yojson message_to_yojson x.description);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let update_network_profile_result_to_yojson (x : update_network_profile_result) =
  assoc_to_yojson
    [ ("networkProfile", option_to_yojson network_profile_to_yojson x.network_profile) ]

let update_network_profile_request_to_yojson (x : update_network_profile_request) =
  assoc_to_yojson
    [
      ("downlinkLossPercent", option_to_yojson percent_integer_to_yojson x.downlink_loss_percent);
      ("uplinkLossPercent", option_to_yojson percent_integer_to_yojson x.uplink_loss_percent);
      ("downlinkJitterMs", option_to_yojson long_to_yojson x.downlink_jitter_ms);
      ("uplinkJitterMs", option_to_yojson long_to_yojson x.uplink_jitter_ms);
      ("downlinkDelayMs", option_to_yojson long_to_yojson x.downlink_delay_ms);
      ("uplinkDelayMs", option_to_yojson long_to_yojson x.uplink_delay_ms);
      ("downlinkBandwidthBits", option_to_yojson long_to_yojson x.downlink_bandwidth_bits);
      ("uplinkBandwidthBits", option_to_yojson long_to_yojson x.uplink_bandwidth_bits);
      ("type", option_to_yojson network_profile_type_to_yojson x.type_);
      ("description", option_to_yojson message_to_yojson x.description);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let package_ids_to_yojson tree = list_to_yojson string__to_yojson tree

let instance_profile_to_yojson (x : instance_profile) =
  assoc_to_yojson
    [
      ("description", option_to_yojson message_to_yojson x.description);
      ("name", option_to_yojson name_to_yojson x.name);
      ("rebootAfterUse", option_to_yojson boolean__to_yojson x.reboot_after_use);
      ( "excludeAppPackagesFromCleanup",
        option_to_yojson package_ids_to_yojson x.exclude_app_packages_from_cleanup );
      ("packageCleanup", option_to_yojson boolean__to_yojson x.package_cleanup);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let update_instance_profile_result_to_yojson (x : update_instance_profile_result) =
  assoc_to_yojson
    [ ("instanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile) ]

let update_instance_profile_request_to_yojson (x : update_instance_profile_request) =
  assoc_to_yojson
    [
      ("rebootAfterUse", option_to_yojson boolean__to_yojson x.reboot_after_use);
      ( "excludeAppPackagesFromCleanup",
        option_to_yojson package_ids_to_yojson x.exclude_app_packages_from_cleanup );
      ("packageCleanup", option_to_yojson boolean__to_yojson x.package_cleanup);
      ("description", option_to_yojson message_to_yojson x.description);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let device_pool_type_to_yojson (x : device_pool_type) =
  match x with PRIVATE -> `String "PRIVATE" | CURATED -> `String "CURATED"

let device_attribute_to_yojson (x : device_attribute) =
  match x with
  | AVAILABILITY -> `String "AVAILABILITY"
  | MODEL -> `String "MODEL"
  | OS_VERSION -> `String "OS_VERSION"
  | FLEET_TYPE -> `String "FLEET_TYPE"
  | INSTANCE_LABELS -> `String "INSTANCE_LABELS"
  | INSTANCE_ARN -> `String "INSTANCE_ARN"
  | APPIUM_VERSION -> `String "APPIUM_VERSION"
  | REMOTE_DEBUG_ENABLED -> `String "REMOTE_DEBUG_ENABLED"
  | REMOTE_ACCESS_ENABLED -> `String "REMOTE_ACCESS_ENABLED"
  | MANUFACTURER -> `String "MANUFACTURER"
  | FORM_FACTOR -> `String "FORM_FACTOR"
  | PLATFORM -> `String "PLATFORM"
  | ARN -> `String "ARN"

let rule_operator_to_yojson (x : rule_operator) =
  match x with
  | CONTAINS -> `String "CONTAINS"
  | NOT_IN -> `String "NOT_IN"
  | IN -> `String "IN"
  | GREATER_THAN_OR_EQUALS -> `String "GREATER_THAN_OR_EQUALS"
  | GREATER_THAN -> `String "GREATER_THAN"
  | LESS_THAN_OR_EQUALS -> `String "LESS_THAN_OR_EQUALS"
  | LESS_THAN -> `String "LESS_THAN"
  | EQUALS -> `String "EQUALS"

let rule_to_yojson (x : rule) =
  assoc_to_yojson
    [
      ("value", option_to_yojson string__to_yojson x.value);
      ("operator", option_to_yojson rule_operator_to_yojson x.operator);
      ("attribute", option_to_yojson device_attribute_to_yojson x.attribute);
    ]

let rules_to_yojson tree = list_to_yojson rule_to_yojson tree
let integer_to_yojson = int_to_yojson

let device_pool_to_yojson (x : device_pool) =
  assoc_to_yojson
    [
      ("maxDevices", option_to_yojson integer_to_yojson x.max_devices);
      ("rules", option_to_yojson rules_to_yojson x.rules);
      ("type", option_to_yojson device_pool_type_to_yojson x.type_);
      ("description", option_to_yojson message_to_yojson x.description);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let update_device_pool_result_to_yojson (x : update_device_pool_result) =
  assoc_to_yojson [ ("devicePool", option_to_yojson device_pool_to_yojson x.device_pool) ]

let update_device_pool_request_to_yojson (x : update_device_pool_request) =
  assoc_to_yojson
    [
      ("clearMaxDevices", option_to_yojson boolean__to_yojson x.clear_max_devices);
      ("maxDevices", option_to_yojson integer_to_yojson x.max_devices);
      ("rules", option_to_yojson rules_to_yojson x.rules);
      ("description", option_to_yojson message_to_yojson x.description);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let instance_labels_to_yojson tree = list_to_yojson string__to_yojson tree

let instance_status_to_yojson (x : instance_status) =
  match x with
  | NOT_AVAILABLE -> `String "NOT_AVAILABLE"
  | AVAILABLE -> `String "AVAILABLE"
  | PREPARING -> `String "PREPARING"
  | IN_USE -> `String "IN_USE"

let device_instance_to_yojson (x : device_instance) =
  assoc_to_yojson
    [
      ("instanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile);
      ("udid", option_to_yojson string__to_yojson x.udid);
      ("status", option_to_yojson instance_status_to_yojson x.status);
      ("labels", option_to_yojson instance_labels_to_yojson x.labels);
      ("deviceArn", option_to_yojson amazon_resource_name_to_yojson x.device_arn);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let update_device_instance_result_to_yojson (x : update_device_instance_result) =
  assoc_to_yojson
    [ ("deviceInstance", option_to_yojson device_instance_to_yojson x.device_instance) ]

let update_device_instance_request_to_yojson (x : update_device_instance_request) =
  assoc_to_yojson
    [
      ("labels", option_to_yojson instance_labels_to_yojson x.labels);
      ("profileArn", option_to_yojson amazon_resource_name_to_yojson x.profile_arn);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (device_farm_arn_to_yojson x.resource_ar_n));
    ]

let exception_message_to_yojson = string_to_yojson

let tag_operation_exception_to_yojson (x : tag_operation_exception) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
      ("message", option_to_yojson exception_message_to_yojson x.message);
    ]

let problem_detail_to_yojson (x : problem_detail) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let device_form_factor_to_yojson (x : device_form_factor) =
  match x with TABLET -> `String "TABLET" | PHONE -> `String "PHONE"

let device_platform_to_yojson (x : device_platform) =
  match x with IOS -> `String "IOS" | ANDROID -> `String "ANDROID"

let double_to_yojson = double_to_yojson

let cp_u_to_yojson (x : cp_u) =
  assoc_to_yojson
    [
      ("clock", option_to_yojson double_to_yojson x.clock);
      ("architecture", option_to_yojson string__to_yojson x.architecture);
      ("frequency", option_to_yojson string__to_yojson x.frequency);
    ]

let resolution_to_yojson (x : resolution) =
  assoc_to_yojson
    [
      ("height", option_to_yojson integer_to_yojson x.height);
      ("width", option_to_yojson integer_to_yojson x.width);
    ]

let device_instances_to_yojson tree = list_to_yojson device_instance_to_yojson tree

let device_availability_to_yojson (x : device_availability) =
  match x with
  | HIGHLY_AVAILABLE -> `String "HIGHLY_AVAILABLE"
  | AVAILABLE -> `String "AVAILABLE"
  | BUSY -> `String "BUSY"
  | TEMPORARY_NOT_AVAILABLE -> `String "TEMPORARY_NOT_AVAILABLE"

let device_to_yojson (x : device) =
  assoc_to_yojson
    [
      ("availability", option_to_yojson device_availability_to_yojson x.availability);
      ("instances", option_to_yojson device_instances_to_yojson x.instances);
      ("fleetName", option_to_yojson string__to_yojson x.fleet_name);
      ("fleetType", option_to_yojson string__to_yojson x.fleet_type);
      ("remoteDebugEnabled", option_to_yojson boolean__to_yojson x.remote_debug_enabled);
      ("remoteAccessEnabled", option_to_yojson boolean__to_yojson x.remote_access_enabled);
      ("radio", option_to_yojson string__to_yojson x.radio);
      ("carrier", option_to_yojson string__to_yojson x.carrier);
      ("image", option_to_yojson string__to_yojson x.image);
      ("memory", option_to_yojson long_to_yojson x.memory);
      ("heapSize", option_to_yojson long_to_yojson x.heap_size);
      ("resolution", option_to_yojson resolution_to_yojson x.resolution);
      ("cpu", option_to_yojson cp_u_to_yojson x.cpu);
      ("os", option_to_yojson string__to_yojson x.os);
      ("platform", option_to_yojson device_platform_to_yojson x.platform);
      ("formFactor", option_to_yojson device_form_factor_to_yojson x.form_factor);
      ("modelId", option_to_yojson string__to_yojson x.model_id);
      ("model", option_to_yojson string__to_yojson x.model);
      ("manufacturer", option_to_yojson string__to_yojson x.manufacturer);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let execution_result_to_yojson (x : execution_result) =
  match x with
  | STOPPED -> `String "STOPPED"
  | ERRORED -> `String "ERRORED"
  | SKIPPED -> `String "SKIPPED"
  | FAILED -> `String "FAILED"
  | WARNED -> `String "WARNED"
  | PASSED -> `String "PASSED"
  | PENDING -> `String "PENDING"

let problem_to_yojson (x : problem) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("device", option_to_yojson device_to_yojson x.device);
      ("test", option_to_yojson problem_detail_to_yojson x.test);
      ("suite", option_to_yojson problem_detail_to_yojson x.suite);
      ("job", option_to_yojson problem_detail_to_yojson x.job);
      ("run", option_to_yojson problem_detail_to_yojson x.run);
    ]

let problems_to_yojson tree = list_to_yojson problem_to_yojson tree

let unique_problem_to_yojson (x : unique_problem) =
  assoc_to_yojson
    [
      ("problems", option_to_yojson problems_to_yojson x.problems);
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let unique_problems_to_yojson tree = list_to_yojson unique_problem_to_yojson tree

let unique_problems_by_execution_result_map_to_yojson tree =
  map_to_yojson execution_result_to_yojson unique_problems_to_yojson tree

let ur_l_to_yojson = string_to_yojson

let trial_minutes_to_yojson (x : trial_minutes) =
  assoc_to_yojson
    [
      ("remaining", option_to_yojson double_to_yojson x.remaining);
      ("total", option_to_yojson double_to_yojson x.total);
    ]

let transaction_identifier_to_yojson = string_to_yojson

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
      ("message", option_to_yojson exception_message_to_yojson x.message);
    ]

let test_type_to_yojson (x : test_type) =
  match x with
  | XCTEST_UI -> `String "XCTEST_UI"
  | XCTEST -> `String "XCTEST"
  | INSTRUMENTATION -> `String "INSTRUMENTATION"
  | APPIUM_WEB_RUBY -> `String "APPIUM_WEB_RUBY"
  | APPIUM_WEB_NODE -> `String "APPIUM_WEB_NODE"
  | APPIUM_WEB_PYTHON -> `String "APPIUM_WEB_PYTHON"
  | APPIUM_WEB_JAVA_TESTNG -> `String "APPIUM_WEB_JAVA_TESTNG"
  | APPIUM_WEB_JAVA_JUNIT -> `String "APPIUM_WEB_JAVA_JUNIT"
  | APPIUM_RUBY -> `String "APPIUM_RUBY"
  | APPIUM_NODE -> `String "APPIUM_NODE"
  | APPIUM_PYTHON -> `String "APPIUM_PYTHON"
  | APPIUM_JAVA_TESTNG -> `String "APPIUM_JAVA_TESTNG"
  | APPIUM_JAVA_JUNIT -> `String "APPIUM_JAVA_JUNIT"
  | BUILTIN_FUZZ -> `String "BUILTIN_FUZZ"

let execution_status_to_yojson (x : execution_status) =
  match x with
  | STOPPING -> `String "STOPPING"
  | COMPLETED -> `String "COMPLETED"
  | RUNNING -> `String "RUNNING"
  | PREPARING -> `String "PREPARING"
  | SCHEDULING -> `String "SCHEDULING"
  | PROCESSING -> `String "PROCESSING"
  | PENDING_DEVICE -> `String "PENDING_DEVICE"
  | PENDING_CONCURRNECY -> `String "PENDING_CONCURRENCY"
  | PENDING -> `String "PENDING"

let counters_to_yojson (x : counters) =
  assoc_to_yojson
    [
      ("skipped", option_to_yojson integer_to_yojson x.skipped);
      ("stopped", option_to_yojson integer_to_yojson x.stopped);
      ("errored", option_to_yojson integer_to_yojson x.errored);
      ("warned", option_to_yojson integer_to_yojson x.warned);
      ("failed", option_to_yojson integer_to_yojson x.failed);
      ("passed", option_to_yojson integer_to_yojson x.passed);
      ("total", option_to_yojson integer_to_yojson x.total);
    ]

let device_minutes_to_yojson (x : device_minutes) =
  assoc_to_yojson
    [
      ("unmetered", option_to_yojson double_to_yojson x.unmetered);
      ("metered", option_to_yojson double_to_yojson x.metered);
      ("total", option_to_yojson double_to_yojson x.total);
    ]

let test_to_yojson (x : test) =
  assoc_to_yojson
    [
      ("deviceMinutes", option_to_yojson device_minutes_to_yojson x.device_minutes);
      ("message", option_to_yojson message_to_yojson x.message);
      ("counters", option_to_yojson counters_to_yojson x.counters);
      ("stopped", option_to_yojson date_time_to_yojson x.stopped);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("status", option_to_yojson execution_status_to_yojson x.status);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("type", option_to_yojson test_type_to_yojson x.type_);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let tests_to_yojson tree = list_to_yojson test_to_yojson tree
let test_parameters_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let test_grid_url_expires_in_seconds_input_to_yojson = int_to_yojson

let test_grid_session_status_to_yojson (x : test_grid_session_status) =
  match x with
  | ERRORED -> `String "ERRORED"
  | CLOSED -> `String "CLOSED"
  | ACTIVE -> `String "ACTIVE"

let test_grid_session_to_yojson (x : test_grid_session) =
  assoc_to_yojson
    [
      ("seleniumProperties", option_to_yojson string__to_yojson x.selenium_properties);
      ("billingMinutes", option_to_yojson double_to_yojson x.billing_minutes);
      ("ended", option_to_yojson date_time_to_yojson x.ended);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("status", option_to_yojson test_grid_session_status_to_yojson x.status);
      ("arn", option_to_yojson device_farm_arn_to_yojson x.arn);
    ]

let test_grid_sessions_to_yojson tree = list_to_yojson test_grid_session_to_yojson tree

let test_grid_session_artifact_type_to_yojson (x : test_grid_session_artifact_type) =
  match x with
  | SELENIUM_LOG -> `String "SELENIUM_LOG"
  | VIDEO -> `String "VIDEO"
  | UNKNOWN -> `String "UNKNOWN"

let sensitive_string_to_yojson = string_to_yojson

let test_grid_session_artifact_to_yojson (x : test_grid_session_artifact) =
  assoc_to_yojson
    [
      ("url", option_to_yojson sensitive_string_to_yojson x.url);
      ("type", option_to_yojson test_grid_session_artifact_type_to_yojson x.type_);
      ("filename", option_to_yojson string__to_yojson x.filename);
    ]

let test_grid_session_artifacts_to_yojson tree =
  list_to_yojson test_grid_session_artifact_to_yojson tree

let test_grid_session_artifact_category_to_yojson (x : test_grid_session_artifact_category) =
  match x with LOG -> `String "LOG" | VIDEO -> `String "VIDEO"

let test_grid_session_action_to_yojson (x : test_grid_session_action) =
  assoc_to_yojson
    [
      ("requestMethod", option_to_yojson string__to_yojson x.request_method);
      ("statusCode", option_to_yojson string__to_yojson x.status_code);
      ("duration", option_to_yojson long_to_yojson x.duration);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("action", option_to_yojson string__to_yojson x.action);
    ]

let test_grid_session_actions_to_yojson tree =
  list_to_yojson test_grid_session_action_to_yojson tree

let test_grid_projects_to_yojson tree = list_to_yojson test_grid_project_to_yojson tree
let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceARN", Some (device_farm_arn_to_yojson x.resource_ar_n));
    ]

let tag_policy_exception_to_yojson (x : tag_policy_exception) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
      ("message", option_to_yojson exception_message_to_yojson x.message);
    ]

let suite_to_yojson (x : suite) =
  assoc_to_yojson
    [
      ("deviceMinutes", option_to_yojson device_minutes_to_yojson x.device_minutes);
      ("message", option_to_yojson message_to_yojson x.message);
      ("counters", option_to_yojson counters_to_yojson x.counters);
      ("stopped", option_to_yojson date_time_to_yojson x.stopped);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("status", option_to_yojson execution_status_to_yojson x.status);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("type", option_to_yojson test_type_to_yojson x.type_);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let suites_to_yojson tree = list_to_yojson suite_to_yojson tree

let billing_method_to_yojson (x : billing_method) =
  match x with UNMETERED -> `String "UNMETERED" | METERED -> `String "METERED"

let device_proxy_host_to_yojson = string_to_yojson
let device_proxy_port_to_yojson = int_to_yojson

let device_proxy_to_yojson (x : device_proxy) =
  assoc_to_yojson
    [
      ("port", Some (device_proxy_port_to_yojson x.port));
      ("host", Some (device_proxy_host_to_yojson x.host));
    ]

let execution_result_code_to_yojson (x : execution_result_code) =
  match x with
  | VPC_ENDPOINT_SETUP_FAILED -> `String "VPC_ENDPOINT_SETUP_FAILED"
  | PARSING_FAILED -> `String "PARSING_FAILED"

let radios_to_yojson (x : radios) =
  assoc_to_yojson
    [
      ("gps", option_to_yojson boolean__to_yojson x.gps);
      ("nfc", option_to_yojson boolean__to_yojson x.nfc);
      ("bluetooth", option_to_yojson boolean__to_yojson x.bluetooth);
      ("wifi", option_to_yojson boolean__to_yojson x.wifi);
    ]

let location_to_yojson (x : location) =
  assoc_to_yojson
    [
      ("longitude", Some (double_to_yojson x.longitude));
      ("latitude", Some (double_to_yojson x.latitude));
    ]

let ios_paths_to_yojson tree = list_to_yojson string__to_yojson tree
let android_paths_to_yojson tree = list_to_yojson string__to_yojson tree
let device_host_paths_to_yojson tree = list_to_yojson string__to_yojson tree

let customer_artifact_paths_to_yojson (x : customer_artifact_paths) =
  assoc_to_yojson
    [
      ("deviceHostPaths", option_to_yojson device_host_paths_to_yojson x.device_host_paths);
      ("androidPaths", option_to_yojson android_paths_to_yojson x.android_paths);
      ("iosPaths", option_to_yojson ios_paths_to_yojson x.ios_paths);
    ]

let skip_app_resign_to_yojson = bool_to_yojson

let device_filter_attribute_to_yojson (x : device_filter_attribute) =
  match x with
  | FLEET_TYPE -> `String "FLEET_TYPE"
  | INSTANCE_LABELS -> `String "INSTANCE_LABELS"
  | INSTANCE_ARN -> `String "INSTANCE_ARN"
  | REMOTE_DEBUG_ENABLED -> `String "REMOTE_DEBUG_ENABLED"
  | REMOTE_ACCESS_ENABLED -> `String "REMOTE_ACCESS_ENABLED"
  | MANUFACTURER -> `String "MANUFACTURER"
  | FORM_FACTOR -> `String "FORM_FACTOR"
  | AVAILABILITY -> `String "AVAILABILITY"
  | MODEL -> `String "MODEL"
  | OS_VERSION -> `String "OS_VERSION"
  | PLATFORM -> `String "PLATFORM"
  | ARN -> `String "ARN"

let device_filter_values_to_yojson tree = list_to_yojson string__to_yojson tree

let device_filter_to_yojson (x : device_filter) =
  assoc_to_yojson
    [
      ("values", Some (device_filter_values_to_yojson x.values));
      ("operator", Some (rule_operator_to_yojson x.operator));
      ("attribute", Some (device_filter_attribute_to_yojson x.attribute));
    ]

let device_filters_to_yojson tree = list_to_yojson device_filter_to_yojson tree

let device_selection_result_to_yojson (x : device_selection_result) =
  assoc_to_yojson
    [
      ("maxDevices", option_to_yojson integer_to_yojson x.max_devices);
      ("matchedDevicesCount", option_to_yojson integer_to_yojson x.matched_devices_count);
      ("filters", option_to_yojson device_filters_to_yojson x.filters);
    ]

let run_to_yojson (x : run) =
  assoc_to_yojson
    [
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
      ("executionRoleArn", option_to_yojson amazon_role_resource_name_to_yojson x.execution_role_arn);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ( "deviceSelectionResult",
        option_to_yojson device_selection_result_to_yojson x.device_selection_result );
      ("testSpecArn", option_to_yojson amazon_resource_name_to_yojson x.test_spec_arn);
      ("skipAppResign", option_to_yojson skip_app_resign_to_yojson x.skip_app_resign);
      ("webUrl", option_to_yojson string__to_yojson x.web_url);
      ( "customerArtifactPaths",
        option_to_yojson customer_artifact_paths_to_yojson x.customer_artifact_paths );
      ("location", option_to_yojson location_to_yojson x.location);
      ("radios", option_to_yojson radios_to_yojson x.radios);
      ("locale", option_to_yojson string__to_yojson x.locale);
      ("devicePoolArn", option_to_yojson amazon_resource_name_to_yojson x.device_pool_arn);
      ("jobTimeoutMinutes", option_to_yojson job_timeout_minutes_to_yojson x.job_timeout_minutes);
      ("eventCount", option_to_yojson integer_to_yojson x.event_count);
      ("appUpload", option_to_yojson amazon_resource_name_to_yojson x.app_upload);
      ("seed", option_to_yojson integer_to_yojson x.seed);
      ("resultCode", option_to_yojson execution_result_code_to_yojson x.result_code);
      ("parsingResultUrl", option_to_yojson string__to_yojson x.parsing_result_url);
      ("deviceProxy", option_to_yojson device_proxy_to_yojson x.device_proxy);
      ("networkProfile", option_to_yojson network_profile_to_yojson x.network_profile);
      ("deviceMinutes", option_to_yojson device_minutes_to_yojson x.device_minutes);
      ("billingMethod", option_to_yojson billing_method_to_yojson x.billing_method);
      ("completedJobs", option_to_yojson integer_to_yojson x.completed_jobs);
      ("totalJobs", option_to_yojson integer_to_yojson x.total_jobs);
      ("message", option_to_yojson message_to_yojson x.message);
      ("counters", option_to_yojson counters_to_yojson x.counters);
      ("stopped", option_to_yojson date_time_to_yojson x.stopped);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("status", option_to_yojson execution_status_to_yojson x.status);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("platform", option_to_yojson device_platform_to_yojson x.platform);
      ("type", option_to_yojson test_type_to_yojson x.type_);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let stop_run_result_to_yojson (x : stop_run_result) =
  assoc_to_yojson [ ("run", option_to_yojson run_to_yojson x.run) ]

let stop_run_request_to_yojson (x : stop_run_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let interaction_mode_to_yojson (x : interaction_mode) =
  match x with
  | VIDEO_ONLY -> `String "VIDEO_ONLY"
  | NO_VIDEO -> `String "NO_VIDEO"
  | INTERACTIVE -> `String "INTERACTIVE"

let remote_access_endpoints_to_yojson (x : remote_access_endpoints) =
  assoc_to_yojson
    [
      ("interactiveEndpoint", option_to_yojson sensitive_ur_l_to_yojson x.interactive_endpoint);
      ("remoteDriverEndpoint", option_to_yojson sensitive_ur_l_to_yojson x.remote_driver_endpoint);
    ]

let remote_access_session_to_yojson (x : remote_access_session) =
  assoc_to_yojson
    [
      ("endpoints", option_to_yojson remote_access_endpoints_to_yojson x.endpoints);
      ("appUpload", option_to_yojson amazon_resource_name_to_yojson x.app_upload);
      ("deviceProxy", option_to_yojson device_proxy_to_yojson x.device_proxy);
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("skipAppResign", option_to_yojson skip_app_resign_to_yojson x.skip_app_resign);
      ("interactionMode", option_to_yojson interaction_mode_to_yojson x.interaction_mode);
      ("deviceUdid", option_to_yojson string__to_yojson x.device_udid);
      ("endpoint", option_to_yojson string__to_yojson x.endpoint);
      ("deviceMinutes", option_to_yojson device_minutes_to_yojson x.device_minutes);
      ("billingMethod", option_to_yojson billing_method_to_yojson x.billing_method);
      ("instanceArn", option_to_yojson amazon_resource_name_to_yojson x.instance_arn);
      ("device", option_to_yojson device_to_yojson x.device);
      ("stopped", option_to_yojson date_time_to_yojson x.stopped);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("message", option_to_yojson message_to_yojson x.message);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("status", option_to_yojson execution_status_to_yojson x.status);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let stop_remote_access_session_result_to_yojson (x : stop_remote_access_session_result) =
  assoc_to_yojson
    [
      ( "remoteAccessSession",
        option_to_yojson remote_access_session_to_yojson x.remote_access_session );
    ]

let stop_remote_access_session_request_to_yojson (x : stop_remote_access_session_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let job_to_yojson (x : job) =
  assoc_to_yojson
    [
      ("videoCapture", option_to_yojson video_capture_to_yojson x.video_capture);
      ("videoEndpoint", option_to_yojson string__to_yojson x.video_endpoint);
      ("deviceMinutes", option_to_yojson device_minutes_to_yojson x.device_minutes);
      ("instanceArn", option_to_yojson amazon_resource_name_to_yojson x.instance_arn);
      ("device", option_to_yojson device_to_yojson x.device);
      ("message", option_to_yojson message_to_yojson x.message);
      ("counters", option_to_yojson counters_to_yojson x.counters);
      ("stopped", option_to_yojson date_time_to_yojson x.stopped);
      ("started", option_to_yojson date_time_to_yojson x.started);
      ("result", option_to_yojson execution_result_to_yojson x.result_);
      ("status", option_to_yojson execution_status_to_yojson x.status);
      ("created", option_to_yojson date_time_to_yojson x.created);
      ("type", option_to_yojson test_type_to_yojson x.type_);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let stop_job_result_to_yojson (x : stop_job_result) =
  assoc_to_yojson [ ("job", option_to_yojson job_to_yojson x.job) ]

let stop_job_request_to_yojson (x : stop_job_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let filter_to_yojson = string_to_yojson

let schedule_run_test_to_yojson (x : schedule_run_test) =
  assoc_to_yojson
    [
      ("parameters", option_to_yojson test_parameters_to_yojson x.parameters);
      ("filter", option_to_yojson filter_to_yojson x.filter);
      ("testSpecArn", option_to_yojson amazon_resource_name_to_yojson x.test_spec_arn);
      ("testPackageArn", option_to_yojson amazon_resource_name_to_yojson x.test_package_arn);
      ("type", Some (test_type_to_yojson x.type_));
    ]

let schedule_run_result_to_yojson (x : schedule_run_result) =
  assoc_to_yojson [ ("run", option_to_yojson run_to_yojson x.run) ]

let device_selection_configuration_to_yojson (x : device_selection_configuration) =
  assoc_to_yojson
    [
      ("maxDevices", Some (integer_to_yojson x.max_devices));
      ("filters", Some (device_filters_to_yojson x.filters));
    ]

let amazon_resource_names_to_yojson tree = list_to_yojson amazon_resource_name_to_yojson tree

let schedule_run_configuration_to_yojson (x : schedule_run_configuration) =
  assoc_to_yojson
    [
      ("executionRoleArn", option_to_yojson amazon_role_resource_name_to_yojson x.execution_role_arn);
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
      ("billingMethod", option_to_yojson billing_method_to_yojson x.billing_method);
      ("auxiliaryApps", option_to_yojson amazon_resource_names_to_yojson x.auxiliary_apps);
      ("radios", option_to_yojson radios_to_yojson x.radios);
      ( "customerArtifactPaths",
        option_to_yojson customer_artifact_paths_to_yojson x.customer_artifact_paths );
      ("deviceProxy", option_to_yojson device_proxy_to_yojson x.device_proxy);
      ( "vpceConfigurationArns",
        option_to_yojson amazon_resource_names_to_yojson x.vpce_configuration_arns );
      ("location", option_to_yojson location_to_yojson x.location);
      ("locale", option_to_yojson string__to_yojson x.locale);
      ("networkProfileArn", option_to_yojson amazon_resource_name_to_yojson x.network_profile_arn);
      ( "extraDataPackageArn",
        option_to_yojson amazon_resource_name_to_yojson x.extra_data_package_arn );
    ]

let accounts_cleanup_to_yojson = bool_to_yojson
let app_packages_cleanup_to_yojson = bool_to_yojson

let execution_configuration_to_yojson (x : execution_configuration) =
  assoc_to_yojson
    [
      ("skipAppResign", option_to_yojson skip_app_resign_to_yojson x.skip_app_resign);
      ("videoCapture", option_to_yojson video_capture_to_yojson x.video_capture);
      ("appPackagesCleanup", option_to_yojson app_packages_cleanup_to_yojson x.app_packages_cleanup);
      ("accountsCleanup", option_to_yojson accounts_cleanup_to_yojson x.accounts_cleanup);
      ("jobTimeoutMinutes", option_to_yojson job_timeout_minutes_to_yojson x.job_timeout_minutes);
    ]

let schedule_run_request_to_yojson (x : schedule_run_request) =
  assoc_to_yojson
    [
      ( "executionConfiguration",
        option_to_yojson execution_configuration_to_yojson x.execution_configuration );
      ("configuration", option_to_yojson schedule_run_configuration_to_yojson x.configuration);
      ("test", Some (schedule_run_test_to_yojson x.test));
      ("name", option_to_yojson name_to_yojson x.name);
      ( "deviceSelectionConfiguration",
        option_to_yojson device_selection_configuration_to_yojson x.device_selection_configuration
      );
      ("devicePoolArn", option_to_yojson amazon_resource_name_to_yojson x.device_pool_arn);
      ("appArn", option_to_yojson amazon_resource_name_to_yojson x.app_arn);
      ("projectArn", Some (amazon_resource_name_to_yojson x.project_arn));
    ]

let idempotency_exception_to_yojson (x : idempotency_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let sample_type_to_yojson (x : sample_type) =
  match x with
  | OPENGL_MAX_DRAWTIME -> `String "OPENGL_MAX_DRAWTIME"
  | OPENGL_AVG_DRAWTIME -> `String "OPENGL_AVG_DRAWTIME"
  | OPENGL_MIN_DRAWTIME -> `String "OPENGL_MIN_DRAWTIME"
  | OPENGL_FPS -> `String "OPENGL_FPS"
  | OPENGL_FRAMES -> `String "OPENGL_FRAMES"
  | NATIVE_MAX_DRAWTIME -> `String "NATIVE_MAX_DRAWTIME"
  | NATIVE_AVG_DRAWTIME -> `String "NATIVE_AVG_DRAWTIME"
  | NATIVE_MIN_DRAWTIME -> `String "NATIVE_MIN_DRAWTIME"
  | NATIVE_FPS -> `String "NATIVE_FPS"
  | NATIVE_FRAMES -> `String "NATIVE_FRAMES"
  | TX -> `String "TX"
  | RX -> `String "RX"
  | TX_RATE -> `String "TX_RATE"
  | RX_RATE -> `String "RX_RATE"
  | THREADS -> `String "THREADS"
  | MEMORY -> `String "MEMORY"
  | CPU -> `String "CPU"

let sample_to_yojson (x : sample) =
  assoc_to_yojson
    [
      ("url", option_to_yojson ur_l_to_yojson x.url);
      ("type", option_to_yojson sample_type_to_yojson x.type_);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let samples_to_yojson tree = list_to_yojson sample_to_yojson tree
let runs_to_yojson tree = list_to_yojson run_to_yojson tree
let resource_id_to_yojson = string_to_yojson

let offering_transaction_type_to_yojson (x : offering_transaction_type) =
  match x with
  | SYSTEM -> `String "SYSTEM"
  | RENEW -> `String "RENEW"
  | PURCHASE -> `String "PURCHASE"

let offering_identifier_to_yojson = string_to_yojson
let offering_type_to_yojson (x : offering_type) = match x with RECURRING -> `String "RECURRING"
let currency_code_to_yojson (x : currency_code) = match x with USD -> `String "USD"

let monetary_amount_to_yojson (x : monetary_amount) =
  assoc_to_yojson
    [
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("amount", option_to_yojson double_to_yojson x.amount);
    ]

let recurring_charge_frequency_to_yojson (x : recurring_charge_frequency) =
  match x with MONTHLY -> `String "MONTHLY"

let recurring_charge_to_yojson (x : recurring_charge) =
  assoc_to_yojson
    [
      ("frequency", option_to_yojson recurring_charge_frequency_to_yojson x.frequency);
      ("cost", option_to_yojson monetary_amount_to_yojson x.cost);
    ]

let recurring_charges_to_yojson tree = list_to_yojson recurring_charge_to_yojson tree

let offering_to_yojson (x : offering) =
  assoc_to_yojson
    [
      ("recurringCharges", option_to_yojson recurring_charges_to_yojson x.recurring_charges);
      ("platform", option_to_yojson device_platform_to_yojson x.platform);
      ("type", option_to_yojson offering_type_to_yojson x.type_);
      ("description", option_to_yojson message_to_yojson x.description);
      ("id", option_to_yojson offering_identifier_to_yojson x.id);
    ]

let offering_status_to_yojson (x : offering_status) =
  assoc_to_yojson
    [
      ("effectiveOn", option_to_yojson date_time_to_yojson x.effective_on);
      ("quantity", option_to_yojson integer_to_yojson x.quantity);
      ("offering", option_to_yojson offering_to_yojson x.offering);
      ("type", option_to_yojson offering_transaction_type_to_yojson x.type_);
    ]

let offering_promotion_identifier_to_yojson = string_to_yojson

let offering_transaction_to_yojson (x : offering_transaction) =
  assoc_to_yojson
    [
      ("cost", option_to_yojson monetary_amount_to_yojson x.cost);
      ("createdOn", option_to_yojson date_time_to_yojson x.created_on);
      ( "offeringPromotionId",
        option_to_yojson offering_promotion_identifier_to_yojson x.offering_promotion_id );
      ("transactionId", option_to_yojson transaction_identifier_to_yojson x.transaction_id);
      ("offeringStatus", option_to_yojson offering_status_to_yojson x.offering_status);
    ]

let renew_offering_result_to_yojson (x : renew_offering_result) =
  assoc_to_yojson
    [
      ("offeringTransaction", option_to_yojson offering_transaction_to_yojson x.offering_transaction);
    ]

let renew_offering_request_to_yojson (x : renew_offering_request) =
  assoc_to_yojson
    [
      ("quantity", Some (integer_to_yojson x.quantity));
      ("offeringId", Some (offering_identifier_to_yojson x.offering_id));
    ]

let not_eligible_exception_to_yojson (x : not_eligible_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let remote_access_sessions_to_yojson tree = list_to_yojson remote_access_session_to_yojson tree

let purchased_devices_map_to_yojson tree =
  map_to_yojson device_platform_to_yojson integer_to_yojson tree

let purchase_offering_result_to_yojson (x : purchase_offering_result) =
  assoc_to_yojson
    [
      ("offeringTransaction", option_to_yojson offering_transaction_to_yojson x.offering_transaction);
    ]

let purchase_offering_request_to_yojson (x : purchase_offering_request) =
  assoc_to_yojson
    [
      ( "offeringPromotionId",
        option_to_yojson offering_promotion_identifier_to_yojson x.offering_promotion_id );
      ("quantity", Some (integer_to_yojson x.quantity));
      ("offeringId", Some (offering_identifier_to_yojson x.offering_id));
    ]

let projects_to_yojson tree = list_to_yojson project_to_yojson tree
let pagination_token_to_yojson = string_to_yojson
let offerings_to_yojson tree = list_to_yojson offering_to_yojson tree
let offering_transactions_to_yojson tree = list_to_yojson offering_transaction_to_yojson tree

let offering_status_map_to_yojson tree =
  map_to_yojson offering_identifier_to_yojson offering_status_to_yojson tree

let offering_promotion_to_yojson (x : offering_promotion) =
  assoc_to_yojson
    [
      ("description", option_to_yojson message_to_yojson x.description);
      ("id", option_to_yojson offering_promotion_identifier_to_yojson x.id);
    ]

let offering_promotions_to_yojson tree = list_to_yojson offering_promotion_to_yojson tree
let network_profiles_to_yojson tree = list_to_yojson network_profile_to_yojson tree
let max_slot_map_to_yojson tree = map_to_yojson string__to_yojson integer_to_yojson tree
let max_page_size_to_yojson = int_to_yojson

let list_vpce_configurations_result_to_yojson (x : list_vpce_configurations_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("vpceConfigurations", option_to_yojson vpce_configurations_to_yojson x.vpce_configurations);
    ]

let list_vpce_configurations_request_to_yojson (x : list_vpce_configurations_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
    ]

let list_uploads_result_to_yojson (x : list_uploads_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("uploads", option_to_yojson uploads_to_yojson x.uploads);
    ]

let list_uploads_request_to_yojson (x : list_uploads_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("type", option_to_yojson upload_type_to_yojson x.type_);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let list_unique_problems_result_to_yojson (x : list_unique_problems_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "uniqueProblems",
        option_to_yojson unique_problems_by_execution_result_map_to_yojson x.unique_problems );
    ]

let list_unique_problems_request_to_yojson (x : list_unique_problems_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let list_tests_result_to_yojson (x : list_tests_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("tests", option_to_yojson tests_to_yojson x.tests);
    ]

let list_tests_request_to_yojson (x : list_tests_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let list_test_grid_sessions_result_to_yojson (x : list_test_grid_sessions_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("testGridSessions", option_to_yojson test_grid_sessions_to_yojson x.test_grid_sessions);
    ]

let list_test_grid_sessions_request_to_yojson (x : list_test_grid_sessions_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResult", option_to_yojson max_page_size_to_yojson x.max_result);
      ("endTimeBefore", option_to_yojson date_time_to_yojson x.end_time_before);
      ("endTimeAfter", option_to_yojson date_time_to_yojson x.end_time_after);
      ("creationTimeBefore", option_to_yojson date_time_to_yojson x.creation_time_before);
      ("creationTimeAfter", option_to_yojson date_time_to_yojson x.creation_time_after);
      ("status", option_to_yojson test_grid_session_status_to_yojson x.status);
      ("projectArn", Some (device_farm_arn_to_yojson x.project_arn));
    ]

let list_test_grid_session_artifacts_result_to_yojson (x : list_test_grid_session_artifacts_result)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("artifacts", option_to_yojson test_grid_session_artifacts_to_yojson x.artifacts);
    ]

let list_test_grid_session_artifacts_request_to_yojson
    (x : list_test_grid_session_artifacts_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResult", option_to_yojson max_page_size_to_yojson x.max_result);
      ("type", option_to_yojson test_grid_session_artifact_category_to_yojson x.type_);
      ("sessionArn", Some (device_farm_arn_to_yojson x.session_arn));
    ]

let list_test_grid_session_actions_result_to_yojson (x : list_test_grid_session_actions_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("actions", option_to_yojson test_grid_session_actions_to_yojson x.actions);
    ]

let list_test_grid_session_actions_request_to_yojson (x : list_test_grid_session_actions_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResult", option_to_yojson max_page_size_to_yojson x.max_result);
      ("sessionArn", Some (device_farm_arn_to_yojson x.session_arn));
    ]

let list_test_grid_projects_result_to_yojson (x : list_test_grid_projects_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("testGridProjects", option_to_yojson test_grid_projects_to_yojson x.test_grid_projects);
    ]

let list_test_grid_projects_request_to_yojson (x : list_test_grid_projects_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResult", option_to_yojson max_page_size_to_yojson x.max_result);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (device_farm_arn_to_yojson x.resource_ar_n)) ]

let list_suites_result_to_yojson (x : list_suites_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("suites", option_to_yojson suites_to_yojson x.suites);
    ]

let list_suites_request_to_yojson (x : list_suites_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let list_samples_result_to_yojson (x : list_samples_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("samples", option_to_yojson samples_to_yojson x.samples);
    ]

let list_samples_request_to_yojson (x : list_samples_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let list_runs_result_to_yojson (x : list_runs_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("runs", option_to_yojson runs_to_yojson x.runs);
    ]

let list_runs_request_to_yojson (x : list_runs_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let list_remote_access_sessions_result_to_yojson (x : list_remote_access_sessions_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "remoteAccessSessions",
        option_to_yojson remote_access_sessions_to_yojson x.remote_access_sessions );
    ]

let list_remote_access_sessions_request_to_yojson (x : list_remote_access_sessions_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let list_projects_result_to_yojson (x : list_projects_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("projects", option_to_yojson projects_to_yojson x.projects);
    ]

let list_projects_request_to_yojson (x : list_projects_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let list_offerings_result_to_yojson (x : list_offerings_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("offerings", option_to_yojson offerings_to_yojson x.offerings);
    ]

let list_offerings_request_to_yojson (x : list_offerings_request) =
  assoc_to_yojson [ ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let list_offering_transactions_result_to_yojson (x : list_offering_transactions_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "offeringTransactions",
        option_to_yojson offering_transactions_to_yojson x.offering_transactions );
    ]

let list_offering_transactions_request_to_yojson (x : list_offering_transactions_request) =
  assoc_to_yojson [ ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let list_offering_promotions_result_to_yojson (x : list_offering_promotions_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("offeringPromotions", option_to_yojson offering_promotions_to_yojson x.offering_promotions);
    ]

let list_offering_promotions_request_to_yojson (x : list_offering_promotions_request) =
  assoc_to_yojson [ ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let list_network_profiles_result_to_yojson (x : list_network_profiles_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("networkProfiles", option_to_yojson network_profiles_to_yojson x.network_profiles);
    ]

let list_network_profiles_request_to_yojson (x : list_network_profiles_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("type", option_to_yojson network_profile_type_to_yojson x.type_);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let jobs_to_yojson tree = list_to_yojson job_to_yojson tree

let list_jobs_result_to_yojson (x : list_jobs_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("jobs", option_to_yojson jobs_to_yojson x.jobs);
    ]

let list_jobs_request_to_yojson (x : list_jobs_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let instance_profiles_to_yojson tree = list_to_yojson instance_profile_to_yojson tree

let list_instance_profiles_result_to_yojson (x : list_instance_profiles_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("instanceProfiles", option_to_yojson instance_profiles_to_yojson x.instance_profiles);
    ]

let list_instance_profiles_request_to_yojson (x : list_instance_profiles_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
    ]

let devices_to_yojson tree = list_to_yojson device_to_yojson tree

let list_devices_result_to_yojson (x : list_devices_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("devices", option_to_yojson devices_to_yojson x.devices);
    ]

let list_devices_request_to_yojson (x : list_devices_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson device_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let device_pools_to_yojson tree = list_to_yojson device_pool_to_yojson tree

let list_device_pools_result_to_yojson (x : list_device_pools_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("devicePools", option_to_yojson device_pools_to_yojson x.device_pools);
    ]

let list_device_pools_request_to_yojson (x : list_device_pools_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("type", option_to_yojson device_pool_type_to_yojson x.type_);
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let list_device_instances_result_to_yojson (x : list_device_instances_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("deviceInstances", option_to_yojson device_instances_to_yojson x.device_instances);
    ]

let list_device_instances_request_to_yojson (x : list_device_instances_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
    ]

let artifact_type_to_yojson (x : artifact_type) =
  match x with
  | TESTSPEC_OUTPUT -> `String "TESTSPEC_OUTPUT"
  | CUSTOMER_ARTIFACT_LOG -> `String "CUSTOMER_ARTIFACT_LOG"
  | CUSTOMER_ARTIFACT -> `String "CUSTOMER_ARTIFACT"
  | VIDEO -> `String "VIDEO"
  | XCTEST_LOG -> `String "XCTEST_LOG"
  | APPLICATION_CRASH_REPORT -> `String "APPLICATION_CRASH_REPORT"
  | EXPLORER_SUMMARY_LOG -> `String "EXPLORER_SUMMARY_LOG"
  | EXPLORER_EVENT_LOG -> `String "EXPLORER_EVENT_LOG"
  | APPIUM_PYTHON_XML_OUTPUT -> `String "APPIUM_PYTHON_XML_OUTPUT"
  | APPIUM_PYTHON_OUTPUT -> `String "APPIUM_PYTHON_OUTPUT"
  | APPIUM_JAVA_XML_OUTPUT -> `String "APPIUM_JAVA_XML_OUTPUT"
  | APPIUM_JAVA_OUTPUT -> `String "APPIUM_JAVA_OUTPUT"
  | APPIUM_SERVER_OUTPUT -> `String "APPIUM_SERVER_OUTPUT"
  | AUTOMATION_OUTPUT -> `String "AUTOMATION_OUTPUT"
  | CALABASH_JAVA_XML_OUTPUT -> `String "CALABASH_JAVA_XML_OUTPUT"
  | CALABASH_STANDARD_OUTPUT -> `String "CALABASH_STANDARD_OUTPUT"
  | CALABASH_PRETTY_OUTPUT -> `String "CALABASH_PRETTY_OUTPUT"
  | CALABASH_JSON_OUTPUT -> `String "CALABASH_JSON_OUTPUT"
  | EXERCISER_MONKEY_OUTPUT -> `String "EXERCISER_MONKEY_OUTPUT"
  | INSTRUMENTATION_OUTPUT -> `String "INSTRUMENTATION_OUTPUT"
  | WEBKIT_LOG -> `String "WEBKIT_LOG"
  | SERVICE_LOG -> `String "SERVICE_LOG"
  | RESULT_LOG -> `String "RESULT_LOG"
  | VIDEO_LOG -> `String "VIDEO_LOG"
  | MESSAGE_LOG -> `String "MESSAGE_LOG"
  | DEVICE_LOG -> `String "DEVICE_LOG"
  | SCREENSHOT -> `String "SCREENSHOT"
  | UNKNOWN -> `String "UNKNOWN"

let artifact_to_yojson (x : artifact) =
  assoc_to_yojson
    [
      ("url", option_to_yojson ur_l_to_yojson x.url);
      ("extension", option_to_yojson string__to_yojson x.extension);
      ("type", option_to_yojson artifact_type_to_yojson x.type_);
      ("name", option_to_yojson name_to_yojson x.name);
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let artifacts_to_yojson tree = list_to_yojson artifact_to_yojson tree

let list_artifacts_result_to_yojson (x : list_artifacts_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("artifacts", option_to_yojson artifacts_to_yojson x.artifacts);
    ]

let artifact_category_to_yojson (x : artifact_category) =
  match x with LOG -> `String "LOG" | FILE -> `String "FILE" | SCREENSHOT -> `String "SCREENSHOT"

let list_artifacts_request_to_yojson (x : list_artifacts_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("type", Some (artifact_category_to_yojson x.type_));
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let install_to_remote_access_session_result_to_yojson (x : install_to_remote_access_session_result)
    =
  assoc_to_yojson [ ("appUpload", option_to_yojson upload_to_yojson x.app_upload) ]

let install_to_remote_access_session_request_to_yojson
    (x : install_to_remote_access_session_request) =
  assoc_to_yojson
    [
      ("appArn", Some (amazon_resource_name_to_yojson x.app_arn));
      ("remoteAccessSessionArn", Some (amazon_resource_name_to_yojson x.remote_access_session_arn));
    ]

let incompatibility_message_to_yojson (x : incompatibility_message) =
  assoc_to_yojson
    [
      ("type", option_to_yojson device_attribute_to_yojson x.type_);
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let incompatibility_messages_to_yojson tree = list_to_yojson incompatibility_message_to_yojson tree

let get_vpce_configuration_result_to_yojson (x : get_vpce_configuration_result) =
  assoc_to_yojson
    [ ("vpceConfiguration", option_to_yojson vpce_configuration_to_yojson x.vpce_configuration) ]

let get_vpce_configuration_request_to_yojson (x : get_vpce_configuration_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_upload_result_to_yojson (x : get_upload_result) =
  assoc_to_yojson [ ("upload", option_to_yojson upload_to_yojson x.upload) ]

let get_upload_request_to_yojson (x : get_upload_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_test_result_to_yojson (x : get_test_result) =
  assoc_to_yojson [ ("test", option_to_yojson test_to_yojson x.test) ]

let get_test_request_to_yojson (x : get_test_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_test_grid_session_result_to_yojson (x : get_test_grid_session_result) =
  assoc_to_yojson
    [ ("testGridSession", option_to_yojson test_grid_session_to_yojson x.test_grid_session) ]

let get_test_grid_session_request_to_yojson (x : get_test_grid_session_request) =
  assoc_to_yojson
    [
      ("sessionArn", option_to_yojson device_farm_arn_to_yojson x.session_arn);
      ("sessionId", option_to_yojson resource_id_to_yojson x.session_id);
      ("projectArn", option_to_yojson device_farm_arn_to_yojson x.project_arn);
    ]

let get_test_grid_project_result_to_yojson (x : get_test_grid_project_result) =
  assoc_to_yojson
    [ ("testGridProject", option_to_yojson test_grid_project_to_yojson x.test_grid_project) ]

let get_test_grid_project_request_to_yojson (x : get_test_grid_project_request) =
  assoc_to_yojson [ ("projectArn", Some (device_farm_arn_to_yojson x.project_arn)) ]

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

let get_offering_status_result_to_yojson (x : get_offering_status_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("nextPeriod", option_to_yojson offering_status_map_to_yojson x.next_period);
      ("current", option_to_yojson offering_status_map_to_yojson x.current);
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

let get_device_result_to_yojson (x : get_device_result) =
  assoc_to_yojson [ ("device", option_to_yojson device_to_yojson x.device) ]

let get_device_request_to_yojson (x : get_device_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let get_device_pool_result_to_yojson (x : get_device_pool_result) =
  assoc_to_yojson [ ("devicePool", option_to_yojson device_pool_to_yojson x.device_pool) ]

let get_device_pool_request_to_yojson (x : get_device_pool_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let device_pool_compatibility_result_to_yojson (x : device_pool_compatibility_result) =
  assoc_to_yojson
    [
      ( "incompatibilityMessages",
        option_to_yojson incompatibility_messages_to_yojson x.incompatibility_messages );
      ("compatible", option_to_yojson boolean__to_yojson x.compatible);
      ("device", option_to_yojson device_to_yojson x.device);
    ]

let device_pool_compatibility_results_to_yojson tree =
  list_to_yojson device_pool_compatibility_result_to_yojson tree

let get_device_pool_compatibility_result_to_yojson (x : get_device_pool_compatibility_result) =
  assoc_to_yojson
    [
      ( "incompatibleDevices",
        option_to_yojson device_pool_compatibility_results_to_yojson x.incompatible_devices );
      ( "compatibleDevices",
        option_to_yojson device_pool_compatibility_results_to_yojson x.compatible_devices );
    ]

let get_device_pool_compatibility_request_to_yojson (x : get_device_pool_compatibility_request) =
  assoc_to_yojson
    [
      ("projectArn", option_to_yojson amazon_resource_name_to_yojson x.project_arn);
      ("configuration", option_to_yojson schedule_run_configuration_to_yojson x.configuration);
      ("test", option_to_yojson schedule_run_test_to_yojson x.test);
      ("testType", option_to_yojson test_type_to_yojson x.test_type);
      ("appArn", option_to_yojson amazon_resource_name_to_yojson x.app_arn);
      ("devicePoolArn", Some (amazon_resource_name_to_yojson x.device_pool_arn));
    ]

let get_device_instance_result_to_yojson (x : get_device_instance_result) =
  assoc_to_yojson
    [ ("deviceInstance", option_to_yojson device_instance_to_yojson x.device_instance) ]

let get_device_instance_request_to_yojson (x : get_device_instance_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let aws_account_number_to_yojson = string_to_yojson

let account_settings_to_yojson (x : account_settings) =
  assoc_to_yojson
    [
      ("skipAppResign", option_to_yojson skip_app_resign_to_yojson x.skip_app_resign);
      ( "defaultJobTimeoutMinutes",
        option_to_yojson job_timeout_minutes_to_yojson x.default_job_timeout_minutes );
      ("maxSlots", option_to_yojson max_slot_map_to_yojson x.max_slots);
      ("trialMinutes", option_to_yojson trial_minutes_to_yojson x.trial_minutes);
      ( "maxJobTimeoutMinutes",
        option_to_yojson job_timeout_minutes_to_yojson x.max_job_timeout_minutes );
      ( "unmeteredRemoteAccessDevices",
        option_to_yojson purchased_devices_map_to_yojson x.unmetered_remote_access_devices );
      ("unmeteredDevices", option_to_yojson purchased_devices_map_to_yojson x.unmetered_devices);
      ("awsAccountNumber", option_to_yojson aws_account_number_to_yojson x.aws_account_number);
    ]

let get_account_settings_result_to_yojson (x : get_account_settings_result) =
  assoc_to_yojson
    [ ("accountSettings", option_to_yojson account_settings_to_yojson x.account_settings) ]

let get_account_settings_request_to_yojson = unit_to_yojson
let delete_vpce_configuration_result_to_yojson = unit_to_yojson

let delete_vpce_configuration_request_to_yojson (x : delete_vpce_configuration_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_upload_result_to_yojson = unit_to_yojson

let delete_upload_request_to_yojson (x : delete_upload_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let cannot_delete_exception_to_yojson (x : cannot_delete_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let delete_test_grid_project_result_to_yojson = unit_to_yojson

let delete_test_grid_project_request_to_yojson (x : delete_test_grid_project_request) =
  assoc_to_yojson [ ("projectArn", Some (device_farm_arn_to_yojson x.project_arn)) ]

let delete_run_result_to_yojson = unit_to_yojson

let delete_run_request_to_yojson (x : delete_run_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_remote_access_session_result_to_yojson = unit_to_yojson

let delete_remote_access_session_request_to_yojson (x : delete_remote_access_session_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_project_result_to_yojson = unit_to_yojson

let delete_project_request_to_yojson (x : delete_project_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_network_profile_result_to_yojson = unit_to_yojson

let delete_network_profile_request_to_yojson (x : delete_network_profile_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_instance_profile_result_to_yojson = unit_to_yojson

let delete_instance_profile_request_to_yojson (x : delete_instance_profile_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let delete_device_pool_result_to_yojson = unit_to_yojson

let delete_device_pool_request_to_yojson (x : delete_device_pool_request) =
  assoc_to_yojson [ ("arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let create_vpce_configuration_result_to_yojson (x : create_vpce_configuration_result) =
  assoc_to_yojson
    [ ("vpceConfiguration", option_to_yojson vpce_configuration_to_yojson x.vpce_configuration) ]

let create_vpce_configuration_request_to_yojson (x : create_vpce_configuration_request) =
  assoc_to_yojson
    [
      ( "vpceConfigurationDescription",
        option_to_yojson vpce_configuration_description_to_yojson x.vpce_configuration_description
      );
      ("serviceDnsName", Some (service_dns_name_to_yojson x.service_dns_name));
      ("vpceServiceName", Some (vpce_service_name_to_yojson x.vpce_service_name));
      ("vpceConfigurationName", Some (vpce_configuration_name_to_yojson x.vpce_configuration_name));
    ]

let create_upload_result_to_yojson (x : create_upload_result) =
  assoc_to_yojson [ ("upload", option_to_yojson upload_to_yojson x.upload) ]

let create_upload_request_to_yojson (x : create_upload_request) =
  assoc_to_yojson
    [
      ("contentType", option_to_yojson content_type_to_yojson x.content_type);
      ("type", Some (upload_type_to_yojson x.type_));
      ("name", Some (name_to_yojson x.name));
      ("projectArn", Some (amazon_resource_name_to_yojson x.project_arn));
    ]

let create_test_grid_url_result_to_yojson (x : create_test_grid_url_result) =
  assoc_to_yojson
    [
      ("expires", option_to_yojson date_time_to_yojson x.expires);
      ("url", option_to_yojson sensitive_string_to_yojson x.url);
    ]

let create_test_grid_url_request_to_yojson (x : create_test_grid_url_request) =
  assoc_to_yojson
    [
      ( "expiresInSeconds",
        Some (test_grid_url_expires_in_seconds_input_to_yojson x.expires_in_seconds) );
      ("projectArn", Some (device_farm_arn_to_yojson x.project_arn));
    ]

let create_test_grid_project_result_to_yojson (x : create_test_grid_project_result) =
  assoc_to_yojson
    [ ("testGridProject", option_to_yojson test_grid_project_to_yojson x.test_grid_project) ]

let create_test_grid_project_request_to_yojson (x : create_test_grid_project_request) =
  assoc_to_yojson
    [
      ("vpcConfig", option_to_yojson test_grid_vpc_config_to_yojson x.vpc_config);
      ("description", option_to_yojson resource_description_to_yojson x.description);
      ("name", Some (resource_name_to_yojson x.name));
    ]

let create_remote_access_session_result_to_yojson (x : create_remote_access_session_result) =
  assoc_to_yojson
    [
      ( "remoteAccessSession",
        option_to_yojson remote_access_session_to_yojson x.remote_access_session );
    ]

let auxiliary_app_arn_list_to_yojson tree = list_to_yojson amazon_resource_name_to_yojson tree

let create_remote_access_session_configuration_to_yojson
    (x : create_remote_access_session_configuration) =
  assoc_to_yojson
    [
      ("deviceProxy", option_to_yojson device_proxy_to_yojson x.device_proxy);
      ( "vpceConfigurationArns",
        option_to_yojson amazon_resource_names_to_yojson x.vpce_configuration_arns );
      ("billingMethod", option_to_yojson billing_method_to_yojson x.billing_method);
      ("auxiliaryApps", option_to_yojson auxiliary_app_arn_list_to_yojson x.auxiliary_apps);
    ]

let create_remote_access_session_request_to_yojson (x : create_remote_access_session_request) =
  assoc_to_yojson
    [
      ("skipAppResign", option_to_yojson boolean__to_yojson x.skip_app_resign);
      ("interactionMode", option_to_yojson interaction_mode_to_yojson x.interaction_mode);
      ( "configuration",
        option_to_yojson create_remote_access_session_configuration_to_yojson x.configuration );
      ("name", option_to_yojson name_to_yojson x.name);
      ("instanceArn", option_to_yojson amazon_resource_name_to_yojson x.instance_arn);
      ("appArn", option_to_yojson amazon_resource_name_to_yojson x.app_arn);
      ("deviceArn", Some (amazon_resource_name_to_yojson x.device_arn));
      ("projectArn", Some (amazon_resource_name_to_yojson x.project_arn));
    ]

let create_project_result_to_yojson (x : create_project_result) =
  assoc_to_yojson [ ("project", option_to_yojson project_to_yojson x.project) ]

let create_project_request_to_yojson (x : create_project_request) =
  assoc_to_yojson
    [
      ("executionRoleArn", option_to_yojson amazon_role_resource_name_to_yojson x.execution_role_arn);
      ( "environmentVariables",
        option_to_yojson environment_variables_to_yojson x.environment_variables );
      ("vpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ( "defaultJobTimeoutMinutes",
        option_to_yojson job_timeout_minutes_to_yojson x.default_job_timeout_minutes );
      ("name", Some (name_to_yojson x.name));
    ]

let create_network_profile_result_to_yojson (x : create_network_profile_result) =
  assoc_to_yojson
    [ ("networkProfile", option_to_yojson network_profile_to_yojson x.network_profile) ]

let create_network_profile_request_to_yojson (x : create_network_profile_request) =
  assoc_to_yojson
    [
      ("downlinkLossPercent", option_to_yojson percent_integer_to_yojson x.downlink_loss_percent);
      ("uplinkLossPercent", option_to_yojson percent_integer_to_yojson x.uplink_loss_percent);
      ("downlinkJitterMs", option_to_yojson long_to_yojson x.downlink_jitter_ms);
      ("uplinkJitterMs", option_to_yojson long_to_yojson x.uplink_jitter_ms);
      ("downlinkDelayMs", option_to_yojson long_to_yojson x.downlink_delay_ms);
      ("uplinkDelayMs", option_to_yojson long_to_yojson x.uplink_delay_ms);
      ("downlinkBandwidthBits", option_to_yojson long_to_yojson x.downlink_bandwidth_bits);
      ("uplinkBandwidthBits", option_to_yojson long_to_yojson x.uplink_bandwidth_bits);
      ("type", option_to_yojson network_profile_type_to_yojson x.type_);
      ("description", option_to_yojson message_to_yojson x.description);
      ("name", Some (name_to_yojson x.name));
      ("projectArn", Some (amazon_resource_name_to_yojson x.project_arn));
    ]

let create_instance_profile_result_to_yojson (x : create_instance_profile_result) =
  assoc_to_yojson
    [ ("instanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile) ]

let create_instance_profile_request_to_yojson (x : create_instance_profile_request) =
  assoc_to_yojson
    [
      ("rebootAfterUse", option_to_yojson boolean__to_yojson x.reboot_after_use);
      ( "excludeAppPackagesFromCleanup",
        option_to_yojson package_ids_to_yojson x.exclude_app_packages_from_cleanup );
      ("packageCleanup", option_to_yojson boolean__to_yojson x.package_cleanup);
      ("description", option_to_yojson message_to_yojson x.description);
      ("name", Some (name_to_yojson x.name));
    ]

let create_device_pool_result_to_yojson (x : create_device_pool_result) =
  assoc_to_yojson [ ("devicePool", option_to_yojson device_pool_to_yojson x.device_pool) ]

let create_device_pool_request_to_yojson (x : create_device_pool_request) =
  assoc_to_yojson
    [
      ("maxDevices", option_to_yojson integer_to_yojson x.max_devices);
      ("rules", Some (rules_to_yojson x.rules));
      ("description", option_to_yojson message_to_yojson x.description);
      ("name", Some (name_to_yojson x.name));
      ("projectArn", Some (amazon_resource_name_to_yojson x.project_arn));
    ]
