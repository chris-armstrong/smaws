open Smaws_Lib.Json.SerializeHelpers
open Types

let xml_string_max_len256_to_yojson = string_to_yojson
let xml_string_max_len256_list_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree
let xml_string_to_yojson = string_to_yojson
let xml_string_list_to_yojson tree = list_to_yojson xml_string_to_yojson tree
let whole_number_to_yojson = int_to_yojson
let string__to_yojson = string_to_yojson
let integer_to_yojson = int_to_yojson
let throughput_val_to_yojson = int_to_yojson

let volume_specification_to_yojson (x : volume_specification) =
  assoc_to_yojson
    [
      ("Throughput", option_to_yojson throughput_val_to_yojson x.throughput);
      ("SizeInGB", Some (integer_to_yojson x.size_in_g_b));
      ("Iops", option_to_yojson integer_to_yojson x.iops);
      ("VolumeType", Some (string__to_yojson x.volume_type));
    ]

let utilization_performance_index_integer_to_yojson = int_to_yojson

let username_password_to_yojson (x : username_password) =
  assoc_to_yojson
    [
      ("Password", option_to_yojson xml_string_max_len256_to_yojson x.password);
      ("Username", option_to_yojson xml_string_max_len256_to_yojson x.username);
    ]

let uri_string_to_yojson = string_to_yojson

let identity_type_to_yojson (x : identity_type) =
  match x with GROUP -> `String "GROUP" | USER -> `String "USER"

let update_studio_session_mapping_input_to_yojson (x : update_studio_session_mapping_input) =
  assoc_to_yojson
    [
      ("SessionPolicyArn", Some (xml_string_max_len256_to_yojson x.session_policy_arn));
      ("IdentityType", Some (identity_type_to_yojson x.identity_type));
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id));
    ]

let error_code_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
    ]

let internal_server_error_to_yojson = unit_to_yojson
let subnet_id_list_to_yojson tree = list_to_yojson string__to_yojson tree

let update_studio_input_to_yojson (x : update_studio_input) =
  assoc_to_yojson
    [
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
      ("DefaultS3Location", option_to_yojson xml_string_to_yojson x.default_s3_location);
      ("SubnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("Description", option_to_yojson xml_string_max_len256_to_yojson x.description);
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let unit__to_yojson (x : unit_) =
  match x with
  | COUNT_PER_SECOND -> `String "COUNT_PER_SECOND"
  | TERA_BITS_PER_SECOND -> `String "TERA_BITS_PER_SECOND"
  | GIGA_BITS_PER_SECOND -> `String "GIGA_BITS_PER_SECOND"
  | MEGA_BITS_PER_SECOND -> `String "MEGA_BITS_PER_SECOND"
  | KILO_BITS_PER_SECOND -> `String "KILO_BITS_PER_SECOND"
  | BITS_PER_SECOND -> `String "BITS_PER_SECOND"
  | TERA_BYTES_PER_SECOND -> `String "TERA_BYTES_PER_SECOND"
  | GIGA_BYTES_PER_SECOND -> `String "GIGA_BYTES_PER_SECOND"
  | MEGA_BYTES_PER_SECOND -> `String "MEGA_BYTES_PER_SECOND"
  | KILO_BYTES_PER_SECOND -> `String "KILO_BYTES_PER_SECOND"
  | BYTES_PER_SECOND -> `String "BYTES_PER_SECOND"
  | COUNT -> `String "COUNT"
  | PERCENT -> `String "PERCENT"
  | TERA_BITS -> `String "TERA_BITS"
  | GIGA_BITS -> `String "GIGA_BITS"
  | MEGA_BITS -> `String "MEGA_BITS"
  | KILO_BITS -> `String "KILO_BITS"
  | BITS -> `String "BITS"
  | TERA_BYTES -> `String "TERA_BYTES"
  | GIGA_BYTES -> `String "GIGA_BYTES"
  | MEGA_BYTES -> `String "MEGA_BYTES"
  | KILO_BYTES -> `String "KILO_BYTES"
  | BYTES -> `String "BYTES"
  | MILLI_SECONDS -> `String "MILLI_SECONDS"
  | MICRO_SECONDS -> `String "MICRO_SECONDS"
  | SECONDS -> `String "SECONDS"
  | NONE -> `String "NONE"

let cluster_id_to_yojson = string_to_yojson
let session_id_to_yojson = string_to_yojson

let session_state_to_yojson (x : session_state) =
  match x with
  | FAILED -> `String "FAILED"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | BUSY -> `String "BUSY"
  | IDLE -> `String "IDLE"
  | STARTED -> `String "STARTED"
  | STARTING -> `String "STARTING"
  | SUBMITTED -> `String "SUBMITTED"

let terminate_session_output_to_yojson (x : terminate_session_output) =
  assoc_to_yojson
    [
      ("State", Some (session_state_to_yojson x.state));
      ("SessionId", Some (session_id_to_yojson x.session_id));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let terminate_session_input_to_yojson (x : terminate_session_input) =
  assoc_to_yojson
    [
      ("SessionId", Some (session_id_to_yojson x.session_id));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let terminate_job_flows_input_to_yojson (x : terminate_job_flows_input) =
  assoc_to_yojson [ ("JobFlowIds", Some (xml_string_list_to_yojson x.job_flow_ids)) ]

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Key", option_to_yojson string__to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let supported_products_list_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree

let supported_product_config_to_yojson (x : supported_product_config) =
  assoc_to_yojson
    [
      ("Args", option_to_yojson xml_string_list_to_yojson x.args);
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
    ]

let float__to_yojson = float_to_yojson
let boolean__to_yojson = bool_to_yojson

let supported_instance_type_to_yojson (x : supported_instance_type) =
  assoc_to_yojson
    [
      ("Architecture", option_to_yojson string__to_yojson x.architecture);
      ("EbsStorageOnly", option_to_yojson boolean__to_yojson x.ebs_storage_only);
      ("NumberOfDisks", option_to_yojson integer_to_yojson x.number_of_disks);
      ("EbsOptimizedByDefault", option_to_yojson boolean__to_yojson x.ebs_optimized_by_default);
      ("EbsOptimizedAvailable", option_to_yojson boolean__to_yojson x.ebs_optimized_available);
      ("InstanceFamilyId", option_to_yojson string__to_yojson x.instance_family_id);
      ("Is64BitsOnly", option_to_yojson boolean__to_yojson x.is64_bits_only);
      ("VCPU", option_to_yojson integer_to_yojson x.vcp_u);
      ("StorageGB", option_to_yojson integer_to_yojson x.storage_g_b);
      ("MemoryGB", option_to_yojson float__to_yojson x.memory_g_b);
      ("Type", option_to_yojson string__to_yojson x.type_);
    ]

let supported_instance_types_list_to_yojson tree =
  list_to_yojson supported_instance_type_to_yojson tree

let auth_mode_to_yojson (x : auth_mode) = match x with IAM -> `String "IAM" | SSO -> `String "SSO"
let date_to_yojson = timestamp_epoch_seconds_to_yojson

let studio_summary_to_yojson (x : studio_summary) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("AuthMode", option_to_yojson auth_mode_to_yojson x.auth_mode);
      ("Url", option_to_yojson xml_string_max_len256_to_yojson x.url);
      ("Description", option_to_yojson xml_string_max_len256_to_yojson x.description);
      ("VpcId", option_to_yojson xml_string_max_len256_to_yojson x.vpc_id);
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
    ]

let studio_summary_list_to_yojson tree = list_to_yojson studio_summary_to_yojson tree
let arn_type_to_yojson = string_to_yojson
let boolean_object_to_yojson = bool_to_yojson

let idc_user_assignment_to_yojson (x : idc_user_assignment) =
  match x with OPTIONAL -> `String "OPTIONAL" | REQUIRED -> `String "REQUIRED"

let studio_to_yojson (x : studio) =
  assoc_to_yojson
    [
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
      ("IdcUserAssignment", option_to_yojson idc_user_assignment_to_yojson x.idc_user_assignment);
      ( "TrustedIdentityPropagationEnabled",
        option_to_yojson boolean_object_to_yojson x.trusted_identity_propagation_enabled );
      ("IdcInstanceArn", option_to_yojson arn_type_to_yojson x.idc_instance_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "IdpRelayStateParameterName",
        option_to_yojson xml_string_max_len256_to_yojson x.idp_relay_state_parameter_name );
      ("IdpAuthUrl", option_to_yojson xml_string_to_yojson x.idp_auth_url);
      ("DefaultS3Location", option_to_yojson xml_string_to_yojson x.default_s3_location);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("Url", option_to_yojson xml_string_to_yojson x.url);
      ( "EngineSecurityGroupId",
        option_to_yojson xml_string_max_len256_to_yojson x.engine_security_group_id );
      ( "WorkspaceSecurityGroupId",
        option_to_yojson xml_string_max_len256_to_yojson x.workspace_security_group_id );
      ("UserRole", option_to_yojson xml_string_to_yojson x.user_role);
      ("ServiceRole", option_to_yojson xml_string_to_yojson x.service_role);
      ("SubnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("VpcId", option_to_yojson xml_string_max_len256_to_yojson x.vpc_id);
      ("AuthMode", option_to_yojson auth_mode_to_yojson x.auth_mode);
      ("Description", option_to_yojson xml_string_max_len256_to_yojson x.description);
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("StudioArn", option_to_yojson xml_string_max_len256_to_yojson x.studio_arn);
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
    ]

let string_map_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let stop_notebook_execution_input_to_yojson (x : stop_notebook_execution_input) =
  assoc_to_yojson
    [ ("NotebookExecutionId", Some (xml_string_max_len256_to_yojson x.notebook_execution_id)) ]

let step_timeline_to_yojson (x : step_timeline) =
  assoc_to_yojson
    [
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("StartDateTime", option_to_yojson date_to_yojson x.start_date_time);
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
    ]

let step_id_to_yojson = string_to_yojson

let hadoop_step_config_to_yojson (x : hadoop_step_config) =
  assoc_to_yojson
    [
      ("Args", option_to_yojson string_list_to_yojson x.args);
      ("MainClass", option_to_yojson string__to_yojson x.main_class);
      ("Properties", option_to_yojson string_map_to_yojson x.properties);
      ("Jar", option_to_yojson string__to_yojson x.jar);
    ]

let action_on_failure_to_yojson (x : action_on_failure) =
  match x with
  | CONTINUE -> `String "CONTINUE"
  | CANCEL_AND_WAIT -> `String "CANCEL_AND_WAIT"
  | TERMINATE_CLUSTER -> `String "TERMINATE_CLUSTER"
  | TERMINATE_JOB_FLOW -> `String "TERMINATE_JOB_FLOW"

let step_state_to_yojson (x : step_state) =
  match x with
  | INTERRUPTED -> `String "INTERRUPTED"
  | FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"
  | COMPLETED -> `String "COMPLETED"
  | RUNNING -> `String "RUNNING"
  | CANCEL_PENDING -> `String "CANCEL_PENDING"
  | PENDING -> `String "PENDING"

let step_state_change_reason_code_to_yojson (x : step_state_change_reason_code) =
  match x with NONE -> `String "NONE"

let step_state_change_reason_to_yojson (x : step_state_change_reason) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson step_state_change_reason_code_to_yojson x.code);
    ]

let failure_details_to_yojson (x : failure_details) =
  assoc_to_yojson
    [
      ("LogFile", option_to_yojson string__to_yojson x.log_file);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Reason", option_to_yojson string__to_yojson x.reason);
    ]

let step_status_to_yojson (x : step_status) =
  assoc_to_yojson
    [
      ("Timeline", option_to_yojson step_timeline_to_yojson x.timeline);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ( "StateChangeReason",
        option_to_yojson step_state_change_reason_to_yojson x.state_change_reason );
      ("State", option_to_yojson step_state_to_yojson x.state);
    ]

let step_summary_to_yojson (x : step_summary) =
  assoc_to_yojson
    [
      ("EncryptionKeyArn", option_to_yojson string__to_yojson x.encryption_key_arn);
      ("LogUri", option_to_yojson string__to_yojson x.log_uri);
      ("Status", option_to_yojson step_status_to_yojson x.status);
      ("ActionOnFailure", option_to_yojson action_on_failure_to_yojson x.action_on_failure);
      ("Config", option_to_yojson hadoop_step_config_to_yojson x.config);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Id", option_to_yojson step_id_to_yojson x.id);
    ]

let step_summary_list_to_yojson tree = list_to_yojson step_summary_to_yojson tree
let step_state_list_to_yojson tree = list_to_yojson step_state_to_yojson tree

let s3_monitoring_configuration_to_yojson (x : s3_monitoring_configuration) =
  assoc_to_yojson
    [
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
      ("LogUri", option_to_yojson xml_string_to_yojson x.log_uri);
    ]

let step_monitoring_configuration_to_yojson (x : step_monitoring_configuration) =
  assoc_to_yojson
    [
      ( "S3MonitoringConfiguration",
        option_to_yojson s3_monitoring_configuration_to_yojson x.s3_monitoring_configuration );
    ]

let step_ids_list_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree

let step_execution_state_to_yojson (x : step_execution_state) =
  match x with
  | INTERRUPTED -> `String "INTERRUPTED"
  | FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"
  | COMPLETED -> `String "COMPLETED"
  | CONTINUE -> `String "CONTINUE"
  | RUNNING -> `String "RUNNING"
  | PENDING -> `String "PENDING"

let step_execution_status_detail_to_yojson (x : step_execution_status_detail) =
  assoc_to_yojson
    [
      ("LastStateChangeReason", option_to_yojson xml_string_to_yojson x.last_state_change_reason);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("StartDateTime", option_to_yojson date_to_yojson x.start_date_time);
      ("CreationDateTime", Some (date_to_yojson x.creation_date_time));
      ("State", Some (step_execution_state_to_yojson x.state));
    ]

let key_value_to_yojson (x : key_value) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson xml_string_to_yojson x.value);
      ("Key", option_to_yojson xml_string_to_yojson x.key);
    ]

let key_value_list_to_yojson tree = list_to_yojson key_value_to_yojson tree

let hadoop_jar_step_config_to_yojson (x : hadoop_jar_step_config) =
  assoc_to_yojson
    [
      ("Args", option_to_yojson xml_string_list_to_yojson x.args);
      ("MainClass", option_to_yojson xml_string_to_yojson x.main_class);
      ("Jar", Some (xml_string_to_yojson x.jar));
      ("Properties", option_to_yojson key_value_list_to_yojson x.properties);
    ]

let step_config_to_yojson (x : step_config) =
  assoc_to_yojson
    [
      ( "StepMonitoringConfiguration",
        option_to_yojson step_monitoring_configuration_to_yojson x.step_monitoring_configuration );
      ("HadoopJarStep", Some (hadoop_jar_step_config_to_yojson x.hadoop_jar_step));
      ("ActionOnFailure", option_to_yojson action_on_failure_to_yojson x.action_on_failure);
      ("Name", Some (xml_string_max_len256_to_yojson x.name));
    ]

let step_detail_to_yojson (x : step_detail) =
  assoc_to_yojson
    [
      ( "ExecutionStatusDetail",
        Some (step_execution_status_detail_to_yojson x.execution_status_detail) );
      ("StepConfig", Some (step_config_to_yojson x.step_config));
    ]

let step_detail_list_to_yojson tree = list_to_yojson step_detail_to_yojson tree
let step_config_list_to_yojson tree = list_to_yojson step_config_to_yojson tree

let step_cancellation_option_to_yojson (x : step_cancellation_option) =
  match x with
  | TERMINATE_PROCESS -> `String "TERMINATE_PROCESS"
  | SEND_INTERRUPT -> `String "SEND_INTERRUPT"

let optional_arn_type_to_yojson = string_to_yojson

let step_to_yojson (x : step) =
  assoc_to_yojson
    [
      ("EncryptionKeyArn", option_to_yojson string__to_yojson x.encryption_key_arn);
      ("LogUri", option_to_yojson string__to_yojson x.log_uri);
      ("ExecutionRoleArn", option_to_yojson optional_arn_type_to_yojson x.execution_role_arn);
      ("Status", option_to_yojson step_status_to_yojson x.status);
      ("ActionOnFailure", option_to_yojson action_on_failure_to_yojson x.action_on_failure);
      ("Config", option_to_yojson hadoop_step_config_to_yojson x.config);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Id", option_to_yojson step_id_to_yojson x.id);
    ]

let statistic_to_yojson (x : statistic) =
  match x with
  | MAXIMUM -> `String "MAXIMUM"
  | MINIMUM -> `String "MINIMUM"
  | SUM -> `String "SUM"
  | AVERAGE -> `String "AVERAGE"
  | SAMPLE_COUNT -> `String "SAMPLE_COUNT"

let start_session_output_to_yojson (x : start_session_output) =
  assoc_to_yojson
    [
      ("State", option_to_yojson session_state_to_yojson x.state);
      ("AccountId", option_to_yojson xml_string_max_len256_to_yojson x.account_id);
      ("Arn", option_to_yojson arn_type_to_yojson x.arn);
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("Id", Some (session_id_to_yojson x.id));
    ]

let iam_role_arn_to_yojson = string_to_yojson

let rec configuration_to_yojson (x : configuration) =
  assoc_to_yojson
    [
      ("Properties", option_to_yojson string_map_to_yojson x.properties);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("Classification", option_to_yojson string__to_yojson x.classification);
    ]

and configuration_list_to_yojson tree = list_to_yojson configuration_to_yojson tree

let log_types_map_to_yojson tree = map_to_yojson xml_string_to_yojson xml_string_list_to_yojson tree

let session_cloud_watch_logging_configuration_to_yojson
    (x : session_cloud_watch_logging_configuration) =
  assoc_to_yojson
    [
      ("LogTypes", option_to_yojson log_types_map_to_yojson x.log_types);
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
      ("LogStreamNamePrefix", option_to_yojson xml_string_to_yojson x.log_stream_name_prefix);
      ("LogGroup", option_to_yojson xml_string_to_yojson x.log_group);
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
    ]

let session_managed_logging_configuration_to_yojson (x : session_managed_logging_configuration) =
  assoc_to_yojson
    [
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
    ]

let session_s3_logging_configuration_to_yojson (x : session_s3_logging_configuration) =
  assoc_to_yojson
    [
      ("LogTypes", option_to_yojson log_types_map_to_yojson x.log_types);
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
      ("LogUri", option_to_yojson xml_string_to_yojson x.log_uri);
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
    ]

let session_monitoring_configuration_to_yojson (x : session_monitoring_configuration) =
  assoc_to_yojson
    [
      ( "S3LoggingConfiguration",
        option_to_yojson session_s3_logging_configuration_to_yojson x.s3_logging_configuration );
      ( "ManagedLoggingConfiguration",
        option_to_yojson session_managed_logging_configuration_to_yojson
          x.managed_logging_configuration );
      ( "CloudWatchLoggingConfiguration",
        option_to_yojson session_cloud_watch_logging_configuration_to_yojson
          x.cloud_watch_logging_configuration );
    ]

let long_to_yojson = long_to_yojson
let client_request_token_to_yojson = string_to_yojson

let start_session_input_to_yojson (x : start_session_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ( "SessionIdleTimeoutInMinutes",
        option_to_yojson long_to_yojson x.session_idle_timeout_in_minutes );
      ( "MonitoringConfiguration",
        option_to_yojson session_monitoring_configuration_to_yojson x.monitoring_configuration );
      ("EngineConfigurations", option_to_yojson configuration_list_to_yojson x.engine_configurations);
      ("ExecutionRoleArn", option_to_yojson iam_role_arn_to_yojson x.execution_role_arn);
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
    ]

let start_notebook_execution_output_to_yojson (x : start_notebook_execution_output) =
  assoc_to_yojson
    [
      ( "NotebookExecutionId",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_id );
    ]

let execution_engine_type_to_yojson (x : execution_engine_type) =
  match x with EMR -> `String "EMR"

let execution_engine_config_to_yojson (x : execution_engine_config) =
  assoc_to_yojson
    [
      ("ExecutionRoleArn", option_to_yojson iam_role_arn_to_yojson x.execution_role_arn);
      ( "MasterInstanceSecurityGroupId",
        option_to_yojson xml_string_max_len256_to_yojson x.master_instance_security_group_id );
      ("Type", option_to_yojson execution_engine_type_to_yojson x.type_);
      ("Id", Some (xml_string_max_len256_to_yojson x.id));
    ]

let notebook_s3_location_from_input_to_yojson (x : notebook_s3_location_from_input) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson uri_string_to_yojson x.key);
      ("Bucket", option_to_yojson xml_string_max_len256_to_yojson x.bucket);
    ]

let output_notebook_s3_location_from_input_to_yojson (x : output_notebook_s3_location_from_input) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson uri_string_to_yojson x.key);
      ("Bucket", option_to_yojson xml_string_max_len256_to_yojson x.bucket);
    ]

let output_notebook_format_to_yojson (x : output_notebook_format) =
  match x with HTML -> `String "HTML"

let environment_variables_map_to_yojson tree =
  map_to_yojson xml_string_max_len256_to_yojson xml_string_to_yojson tree

let start_notebook_execution_input_to_yojson (x : start_notebook_execution_input) =
  assoc_to_yojson
    [
      ( "EnvironmentVariables",
        option_to_yojson environment_variables_map_to_yojson x.environment_variables );
      ( "OutputNotebookFormat",
        option_to_yojson output_notebook_format_to_yojson x.output_notebook_format );
      ( "OutputNotebookS3Location",
        option_to_yojson output_notebook_s3_location_from_input_to_yojson
          x.output_notebook_s3_location );
      ( "NotebookS3Location",
        option_to_yojson notebook_s3_location_from_input_to_yojson x.notebook_s3_location );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "NotebookInstanceSecurityGroupId",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_instance_security_group_id );
      ("ServiceRole", Some (xml_string_to_yojson x.service_role));
      ("ExecutionEngine", Some (execution_engine_config_to_yojson x.execution_engine));
      ("NotebookParams", option_to_yojson xml_string_to_yojson x.notebook_params);
      ( "NotebookExecutionName",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_name );
      ("RelativePath", option_to_yojson xml_string_to_yojson x.relative_path);
      ("EditorId", option_to_yojson xml_string_max_len256_to_yojson x.editor_id);
    ]

let spot_provisioning_allocation_strategy_to_yojson (x : spot_provisioning_allocation_strategy) =
  match x with
  | CAPACITY_OPTIMIZED_PRIORITIZED -> `String "capacity-optimized-prioritized"
  | DIVERSIFIED -> `String "diversified"
  | LOWEST_PRICE -> `String "lowest-price"
  | PRICE_CAPACITY_OPTIMIZED -> `String "price-capacity-optimized"
  | CAPACITY_OPTIMIZED -> `String "capacity-optimized"

let spot_resizing_specification_to_yojson (x : spot_resizing_specification) =
  assoc_to_yojson
    [
      ( "AllocationStrategy",
        option_to_yojson spot_provisioning_allocation_strategy_to_yojson x.allocation_strategy );
      ("TimeoutDurationMinutes", option_to_yojson whole_number_to_yojson x.timeout_duration_minutes);
    ]

let spot_provisioning_timeout_action_to_yojson (x : spot_provisioning_timeout_action) =
  match x with
  | TERMINATE_CLUSTER -> `String "TERMINATE_CLUSTER"
  | SWITCH_TO_ON_DEMAND -> `String "SWITCH_TO_ON_DEMAND"

let spot_provisioning_specification_to_yojson (x : spot_provisioning_specification) =
  assoc_to_yojson
    [
      ( "AllocationStrategy",
        option_to_yojson spot_provisioning_allocation_strategy_to_yojson x.allocation_strategy );
      ("BlockDurationMinutes", option_to_yojson whole_number_to_yojson x.block_duration_minutes);
      ("TimeoutAction", Some (spot_provisioning_timeout_action_to_yojson x.timeout_action));
      ("TimeoutDurationMinutes", Some (whole_number_to_yojson x.timeout_duration_minutes));
    ]

let simplified_application_to_yojson (x : simplified_application) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let simplified_application_list_to_yojson tree =
  list_to_yojson simplified_application_to_yojson tree

let adjustment_type_to_yojson (x : adjustment_type) =
  match x with
  | EXACT_CAPACITY -> `String "EXACT_CAPACITY"
  | PERCENT_CHANGE_IN_CAPACITY -> `String "PERCENT_CHANGE_IN_CAPACITY"
  | CHANGE_IN_CAPACITY -> `String "CHANGE_IN_CAPACITY"

let simple_scaling_policy_configuration_to_yojson (x : simple_scaling_policy_configuration) =
  assoc_to_yojson
    [
      ("CoolDown", option_to_yojson integer_to_yojson x.cool_down);
      ("ScalingAdjustment", Some (integer_to_yojson x.scaling_adjustment));
      ("AdjustmentType", option_to_yojson adjustment_type_to_yojson x.adjustment_type);
    ]

let instance_id_to_yojson = string_to_yojson
let ec2_instance_ids_list_to_yojson tree = list_to_yojson instance_id_to_yojson tree

let instance_resize_policy_to_yojson (x : instance_resize_policy) =
  assoc_to_yojson
    [
      ( "InstanceTerminationTimeout",
        option_to_yojson integer_to_yojson x.instance_termination_timeout );
      ("InstancesToProtect", option_to_yojson ec2_instance_ids_list_to_yojson x.instances_to_protect);
      ( "InstancesToTerminate",
        option_to_yojson ec2_instance_ids_list_to_yojson x.instances_to_terminate );
    ]

let shrink_policy_to_yojson (x : shrink_policy) =
  assoc_to_yojson
    [
      ( "InstanceResizePolicy",
        option_to_yojson instance_resize_policy_to_yojson x.instance_resize_policy );
      ("DecommissionTimeout", option_to_yojson integer_to_yojson x.decommission_timeout);
    ]

let set_visible_to_all_users_input_to_yojson (x : set_visible_to_all_users_input) =
  assoc_to_yojson
    [
      ("VisibleToAllUsers", Some (boolean__to_yojson x.visible_to_all_users));
      ("JobFlowIds", Some (xml_string_list_to_yojson x.job_flow_ids));
    ]

let set_unhealthy_node_replacement_input_to_yojson (x : set_unhealthy_node_replacement_input) =
  assoc_to_yojson
    [
      ("UnhealthyNodeReplacement", Some (boolean_object_to_yojson x.unhealthy_node_replacement));
      ("JobFlowIds", Some (xml_string_list_to_yojson x.job_flow_ids));
    ]

let set_termination_protection_input_to_yojson (x : set_termination_protection_input) =
  assoc_to_yojson
    [
      ("TerminationProtected", Some (boolean__to_yojson x.termination_protected));
      ("JobFlowIds", Some (xml_string_list_to_yojson x.job_flow_ids));
    ]

let set_keep_job_flow_alive_when_no_steps_input_to_yojson
    (x : set_keep_job_flow_alive_when_no_steps_input) =
  assoc_to_yojson
    [
      ("KeepJobFlowAliveWhenNoSteps", Some (boolean__to_yojson x.keep_job_flow_alive_when_no_steps));
      ("JobFlowIds", Some (xml_string_list_to_yojson x.job_flow_ids));
    ]

let session_state_list_to_yojson tree = list_to_yojson session_state_to_yojson tree

let session_mapping_summary_to_yojson (x : session_mapping_summary) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("SessionPolicyArn", option_to_yojson xml_string_max_len256_to_yojson x.session_policy_arn);
      ("IdentityType", option_to_yojson identity_type_to_yojson x.identity_type);
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
    ]

let session_mapping_summary_list_to_yojson tree =
  list_to_yojson session_mapping_summary_to_yojson tree

let session_mapping_detail_to_yojson (x : session_mapping_detail) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson date_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("SessionPolicyArn", option_to_yojson xml_string_max_len256_to_yojson x.session_policy_arn);
      ("IdentityType", option_to_yojson identity_type_to_yojson x.identity_type);
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
    ]

let certificate_authority_to_yojson (x : certificate_authority) =
  assoc_to_yojson
    [
      ("CertificateData", option_to_yojson xml_string_to_yojson x.certificate_data);
      ("CertificateArn", option_to_yojson xml_string_to_yojson x.certificate_arn);
    ]

let session_to_yojson (x : session) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ServerUrl", option_to_yojson xml_string_to_yojson x.server_url);
      ( "CertificateAuthority",
        option_to_yojson certificate_authority_to_yojson x.certificate_authority );
      ( "SessionIdleTimeoutInMinutes",
        option_to_yojson long_to_yojson x.session_idle_timeout_in_minutes );
      ( "MonitoringConfiguration",
        option_to_yojson session_monitoring_configuration_to_yojson x.monitoring_configuration );
      ("EngineConfigurations", option_to_yojson configuration_list_to_yojson x.engine_configurations);
      ("IdleSince", option_to_yojson date_to_yojson x.idle_since);
      ("EndedAt", option_to_yojson date_to_yojson x.ended_at);
      ("StartedAt", option_to_yojson date_to_yojson x.started_at);
      ("UpdatedAt", option_to_yojson date_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson date_to_yojson x.created_at);
      ("AccountId", option_to_yojson xml_string_max_len256_to_yojson x.account_id);
      ("ExecutionRoleArn", option_to_yojson iam_role_arn_to_yojson x.execution_role_arn);
      ("ReleaseLabel", option_to_yojson xml_string_max_len256_to_yojson x.release_label);
      ("StateChangeReason", option_to_yojson xml_string_to_yojson x.state_change_reason);
      ("State", Some (session_state_to_yojson x.state));
      ("Arn", Some (arn_type_to_yojson x.arn));
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("Id", Some (session_id_to_yojson x.id));
    ]

let session_list_to_yojson tree = list_to_yojson session_to_yojson tree
let sensitive_string_to_yojson = string_to_yojson
let security_groups_list_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree

let security_configuration_summary_to_yojson (x : security_configuration_summary) =
  assoc_to_yojson
    [
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("Name", option_to_yojson xml_string_to_yojson x.name);
    ]

let security_configuration_list_to_yojson tree =
  list_to_yojson security_configuration_summary_to_yojson tree

let script_bootstrap_action_config_to_yojson (x : script_bootstrap_action_config) =
  assoc_to_yojson
    [
      ("Args", option_to_yojson xml_string_list_to_yojson x.args);
      ("Path", Some (xml_string_to_yojson x.path));
    ]

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with
  | LESS_THAN_OR_EQUAL -> `String "LESS_THAN_OR_EQUAL"
  | LESS_THAN -> `String "LESS_THAN"
  | GREATER_THAN -> `String "GREATER_THAN"
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"

let non_negative_double_to_yojson = double_to_yojson

let metric_dimension_to_yojson (x : metric_dimension) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Key", option_to_yojson string__to_yojson x.key);
    ]

let metric_dimension_list_to_yojson tree = list_to_yojson metric_dimension_to_yojson tree

let cloud_watch_alarm_definition_to_yojson (x : cloud_watch_alarm_definition) =
  assoc_to_yojson
    [
      ("Dimensions", option_to_yojson metric_dimension_list_to_yojson x.dimensions);
      ("Unit", option_to_yojson unit__to_yojson x.unit_);
      ("Threshold", Some (non_negative_double_to_yojson x.threshold));
      ("Statistic", option_to_yojson statistic_to_yojson x.statistic);
      ("Period", Some (integer_to_yojson x.period));
      ("Namespace", option_to_yojson string__to_yojson x.namespace);
      ("MetricName", Some (string__to_yojson x.metric_name));
      ("EvaluationPeriods", option_to_yojson integer_to_yojson x.evaluation_periods);
      ("ComparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
    ]

let scaling_trigger_to_yojson (x : scaling_trigger) =
  assoc_to_yojson
    [
      ( "CloudWatchAlarmDefinition",
        Some (cloud_watch_alarm_definition_to_yojson x.cloud_watch_alarm_definition) );
    ]

let scaling_strategy_to_yojson (x : scaling_strategy) =
  match x with ADVANCED -> `String "ADVANCED" | DEFAULT -> `String "DEFAULT"

let market_type_to_yojson (x : market_type) =
  match x with SPOT -> `String "SPOT" | ON_DEMAND -> `String "ON_DEMAND"

let scaling_action_to_yojson (x : scaling_action) =
  assoc_to_yojson
    [
      ( "SimpleScalingPolicyConfiguration",
        Some (simple_scaling_policy_configuration_to_yojson x.simple_scaling_policy_configuration)
      );
      ("Market", option_to_yojson market_type_to_yojson x.market);
    ]

let scaling_rule_to_yojson (x : scaling_rule) =
  assoc_to_yojson
    [
      ("Trigger", Some (scaling_trigger_to_yojson x.trigger));
      ("Action", Some (scaling_action_to_yojson x.action));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", Some (string__to_yojson x.name));
    ]

let scaling_rule_list_to_yojson tree = list_to_yojson scaling_rule_to_yojson tree

let scaling_constraints_to_yojson (x : scaling_constraints) =
  assoc_to_yojson
    [
      ("MaxCapacity", Some (integer_to_yojson x.max_capacity));
      ("MinCapacity", Some (integer_to_yojson x.min_capacity));
    ]

let scale_down_behavior_to_yojson (x : scale_down_behavior) =
  match x with
  | TERMINATE_AT_TASK_COMPLETION -> `String "TERMINATE_AT_TASK_COMPLETION"
  | TERMINATE_AT_INSTANCE_HOUR -> `String "TERMINATE_AT_INSTANCE_HOUR"

let log_upload_policy_value_to_yojson (x : log_upload_policy_value) =
  match x with
  | DISABLED -> `String "disabled"
  | ON_CUSTOMER_S3ONLY -> `String "on-customer-s3only"
  | EMR_MANAGED -> `String "emr-managed"

let log_type_to_yojson (x : log_type) =
  match x with
  | PERSISTENT_UI_LOGS -> `String "persistent-ui-logs"
  | APPLICATION_LOGS -> `String "application-logs"
  | SYSTEM_LOGS -> `String "system-logs"

let log_type_map_to_yojson tree =
  map_to_yojson log_type_to_yojson log_upload_policy_value_to_yojson tree

let s3_logging_configuration_to_yojson (x : s3_logging_configuration) =
  assoc_to_yojson
    [ ("LogTypeUploadPolicy", option_to_yojson log_type_map_to_yojson x.log_type_upload_policy) ]

let run_job_flow_output_to_yojson (x : run_job_flow_output) =
  assoc_to_yojson
    [
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
      ("JobFlowId", option_to_yojson xml_string_max_len256_to_yojson x.job_flow_id);
    ]

let instance_type_to_yojson = string_to_yojson

let instance_role_type_to_yojson (x : instance_role_type) =
  match x with TASK -> `String "TASK" | CORE -> `String "CORE" | MASTER -> `String "MASTER"

let ebs_block_device_config_to_yojson (x : ebs_block_device_config) =
  assoc_to_yojson
    [
      ("VolumesPerInstance", option_to_yojson integer_to_yojson x.volumes_per_instance);
      ("VolumeSpecification", Some (volume_specification_to_yojson x.volume_specification));
    ]

let ebs_block_device_config_list_to_yojson tree =
  list_to_yojson ebs_block_device_config_to_yojson tree

let ebs_configuration_to_yojson (x : ebs_configuration) =
  assoc_to_yojson
    [
      ("EbsOptimized", option_to_yojson boolean_object_to_yojson x.ebs_optimized);
      ( "EbsBlockDeviceConfigs",
        option_to_yojson ebs_block_device_config_list_to_yojson x.ebs_block_device_configs );
    ]

let auto_scaling_policy_to_yojson (x : auto_scaling_policy) =
  assoc_to_yojson
    [
      ("Rules", Some (scaling_rule_list_to_yojson x.rules));
      ("Constraints", Some (scaling_constraints_to_yojson x.constraints));
    ]

let instance_group_config_to_yojson (x : instance_group_config) =
  assoc_to_yojson
    [
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
      ("AutoScalingPolicy", option_to_yojson auto_scaling_policy_to_yojson x.auto_scaling_policy);
      ("EbsConfiguration", option_to_yojson ebs_configuration_to_yojson x.ebs_configuration);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("InstanceCount", Some (integer_to_yojson x.instance_count));
      ("InstanceType", Some (instance_type_to_yojson x.instance_type));
      ("BidPrice", option_to_yojson xml_string_max_len256_to_yojson x.bid_price);
      ("InstanceRole", Some (instance_role_type_to_yojson x.instance_role));
      ("Market", option_to_yojson market_type_to_yojson x.market);
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
    ]

let instance_group_config_list_to_yojson tree = list_to_yojson instance_group_config_to_yojson tree

let instance_fleet_type_to_yojson (x : instance_fleet_type) =
  match x with TASK -> `String "TASK" | CORE -> `String "CORE" | MASTER -> `String "MASTER"

let instance_type_config_to_yojson (x : instance_type_config) =
  assoc_to_yojson
    [
      ("Priority", option_to_yojson non_negative_double_to_yojson x.priority);
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("EbsConfiguration", option_to_yojson ebs_configuration_to_yojson x.ebs_configuration);
      ( "BidPriceAsPercentageOfOnDemandPrice",
        option_to_yojson non_negative_double_to_yojson x.bid_price_as_percentage_of_on_demand_price
      );
      ("BidPrice", option_to_yojson xml_string_max_len256_to_yojson x.bid_price);
      ("WeightedCapacity", option_to_yojson whole_number_to_yojson x.weighted_capacity);
      ("InstanceType", Some (instance_type_to_yojson x.instance_type));
    ]

let instance_type_config_list_to_yojson tree = list_to_yojson instance_type_config_to_yojson tree

let on_demand_provisioning_allocation_strategy_to_yojson
    (x : on_demand_provisioning_allocation_strategy) =
  match x with PRIORITIZED -> `String "prioritized" | LOWEST_PRICE -> `String "lowest-price"

let on_demand_capacity_reservation_usage_strategy_to_yojson
    (x : on_demand_capacity_reservation_usage_strategy) =
  match x with USE_CAPACITY_RESERVATIONS_FIRST -> `String "use-capacity-reservations-first"

let on_demand_capacity_reservation_preference_to_yojson
    (x : on_demand_capacity_reservation_preference) =
  match x with NONE -> `String "none" | OPEN -> `String "open"

let on_demand_capacity_reservation_options_to_yojson (x : on_demand_capacity_reservation_options) =
  assoc_to_yojson
    [
      ( "CapacityReservationResourceGroupArn",
        option_to_yojson xml_string_max_len256_to_yojson x.capacity_reservation_resource_group_arn
      );
      ( "CapacityReservationPreference",
        option_to_yojson on_demand_capacity_reservation_preference_to_yojson
          x.capacity_reservation_preference );
      ( "UsageStrategy",
        option_to_yojson on_demand_capacity_reservation_usage_strategy_to_yojson x.usage_strategy );
    ]

let on_demand_provisioning_specification_to_yojson (x : on_demand_provisioning_specification) =
  assoc_to_yojson
    [
      ( "CapacityReservationOptions",
        option_to_yojson on_demand_capacity_reservation_options_to_yojson
          x.capacity_reservation_options );
      ( "AllocationStrategy",
        Some (on_demand_provisioning_allocation_strategy_to_yojson x.allocation_strategy) );
    ]

let instance_fleet_provisioning_specifications_to_yojson
    (x : instance_fleet_provisioning_specifications) =
  assoc_to_yojson
    [
      ( "OnDemandSpecification",
        option_to_yojson on_demand_provisioning_specification_to_yojson x.on_demand_specification );
      ( "SpotSpecification",
        option_to_yojson spot_provisioning_specification_to_yojson x.spot_specification );
    ]

let on_demand_resizing_specification_to_yojson (x : on_demand_resizing_specification) =
  assoc_to_yojson
    [
      ( "CapacityReservationOptions",
        option_to_yojson on_demand_capacity_reservation_options_to_yojson
          x.capacity_reservation_options );
      ( "AllocationStrategy",
        option_to_yojson on_demand_provisioning_allocation_strategy_to_yojson x.allocation_strategy
      );
      ("TimeoutDurationMinutes", option_to_yojson whole_number_to_yojson x.timeout_duration_minutes);
    ]

let instance_fleet_resizing_specifications_to_yojson (x : instance_fleet_resizing_specifications) =
  assoc_to_yojson
    [
      ( "OnDemandResizeSpecification",
        option_to_yojson on_demand_resizing_specification_to_yojson x.on_demand_resize_specification
      );
      ( "SpotResizeSpecification",
        option_to_yojson spot_resizing_specification_to_yojson x.spot_resize_specification );
    ]

let instance_fleet_config_to_yojson (x : instance_fleet_config) =
  assoc_to_yojson
    [
      ("Context", option_to_yojson xml_string_max_len256_to_yojson x.context);
      ( "ResizeSpecifications",
        option_to_yojson instance_fleet_resizing_specifications_to_yojson x.resize_specifications );
      ( "LaunchSpecifications",
        option_to_yojson instance_fleet_provisioning_specifications_to_yojson
          x.launch_specifications );
      ( "InstanceTypeConfigs",
        option_to_yojson instance_type_config_list_to_yojson x.instance_type_configs );
      ("TargetSpotCapacity", option_to_yojson whole_number_to_yojson x.target_spot_capacity);
      ("TargetOnDemandCapacity", option_to_yojson whole_number_to_yojson x.target_on_demand_capacity);
      ("InstanceFleetType", Some (instance_fleet_type_to_yojson x.instance_fleet_type));
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
    ]

let instance_fleet_config_list_to_yojson tree = list_to_yojson instance_fleet_config_to_yojson tree

let placement_type_to_yojson (x : placement_type) =
  assoc_to_yojson
    [
      ( "AvailabilityZones",
        option_to_yojson xml_string_max_len256_list_to_yojson x.availability_zones );
      ("AvailabilityZone", option_to_yojson xml_string_to_yojson x.availability_zone);
    ]

let job_flow_instances_config_to_yojson (x : job_flow_instances_config) =
  assoc_to_yojson
    [
      ( "AdditionalSlaveSecurityGroups",
        option_to_yojson security_groups_list_to_yojson x.additional_slave_security_groups );
      ( "AdditionalMasterSecurityGroups",
        option_to_yojson security_groups_list_to_yojson x.additional_master_security_groups );
      ( "ServiceAccessSecurityGroup",
        option_to_yojson xml_string_max_len256_to_yojson x.service_access_security_group );
      ( "EmrManagedSlaveSecurityGroup",
        option_to_yojson xml_string_max_len256_to_yojson x.emr_managed_slave_security_group );
      ( "EmrManagedMasterSecurityGroup",
        option_to_yojson xml_string_max_len256_to_yojson x.emr_managed_master_security_group );
      ("Ec2SubnetIds", option_to_yojson xml_string_max_len256_list_to_yojson x.ec2_subnet_ids);
      ("Ec2SubnetId", option_to_yojson xml_string_max_len256_to_yojson x.ec2_subnet_id);
      ("HadoopVersion", option_to_yojson xml_string_max_len256_to_yojson x.hadoop_version);
      ( "UnhealthyNodeReplacement",
        option_to_yojson boolean_object_to_yojson x.unhealthy_node_replacement );
      ("TerminationProtected", option_to_yojson boolean__to_yojson x.termination_protected);
      ( "KeepJobFlowAliveWhenNoSteps",
        option_to_yojson boolean__to_yojson x.keep_job_flow_alive_when_no_steps );
      ("Placement", option_to_yojson placement_type_to_yojson x.placement);
      ("Ec2KeyName", option_to_yojson xml_string_max_len256_to_yojson x.ec2_key_name);
      ("InstanceFleets", option_to_yojson instance_fleet_config_list_to_yojson x.instance_fleets);
      ("InstanceGroups", option_to_yojson instance_group_config_list_to_yojson x.instance_groups);
      ("InstanceCount", option_to_yojson integer_to_yojson x.instance_count);
      ("SlaveInstanceType", option_to_yojson instance_type_to_yojson x.slave_instance_type);
      ("MasterInstanceType", option_to_yojson instance_type_to_yojson x.master_instance_type);
    ]

let bootstrap_action_config_to_yojson (x : bootstrap_action_config) =
  assoc_to_yojson
    [
      ( "ScriptBootstrapAction",
        Some (script_bootstrap_action_config_to_yojson x.script_bootstrap_action) );
      ("Name", Some (xml_string_max_len256_to_yojson x.name));
    ]

let bootstrap_action_config_list_to_yojson tree =
  list_to_yojson bootstrap_action_config_to_yojson tree

let new_supported_products_list_to_yojson tree =
  list_to_yojson supported_product_config_to_yojson tree

let application_to_yojson (x : application) =
  assoc_to_yojson
    [
      ("AdditionalInfo", option_to_yojson string_map_to_yojson x.additional_info);
      ("Args", option_to_yojson string_list_to_yojson x.args);
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let application_list_to_yojson tree = list_to_yojson application_to_yojson tree

let repo_upgrade_on_boot_to_yojson (x : repo_upgrade_on_boot) =
  match x with NONE -> `String "NONE" | SECURITY -> `String "SECURITY"

let kerberos_attributes_to_yojson (x : kerberos_attributes) =
  assoc_to_yojson
    [
      ( "ADDomainJoinPassword",
        option_to_yojson xml_string_max_len256_to_yojson x.ad_domain_join_password );
      ("ADDomainJoinUser", option_to_yojson xml_string_max_len256_to_yojson x.ad_domain_join_user);
      ( "CrossRealmTrustPrincipalPassword",
        option_to_yojson xml_string_max_len256_to_yojson x.cross_realm_trust_principal_password );
      ("KdcAdminPassword", Some (xml_string_max_len256_to_yojson x.kdc_admin_password));
      ("Realm", Some (xml_string_max_len256_to_yojson x.realm));
    ]

let compute_limits_unit_type_to_yojson (x : compute_limits_unit_type) =
  match x with
  | VCPU -> `String "VCPU"
  | Instances -> `String "Instances"
  | InstanceFleetUnits -> `String "InstanceFleetUnits"

let compute_limits_to_yojson (x : compute_limits) =
  assoc_to_yojson
    [
      ("MaximumCoreCapacityUnits", option_to_yojson integer_to_yojson x.maximum_core_capacity_units);
      ( "MaximumOnDemandCapacityUnits",
        option_to_yojson integer_to_yojson x.maximum_on_demand_capacity_units );
      ("MaximumCapacityUnits", Some (integer_to_yojson x.maximum_capacity_units));
      ("MinimumCapacityUnits", Some (integer_to_yojson x.minimum_capacity_units));
      ("UnitType", Some (compute_limits_unit_type_to_yojson x.unit_type));
    ]

let managed_scaling_policy_to_yojson (x : managed_scaling_policy) =
  assoc_to_yojson
    [
      ("ScalingStrategy", option_to_yojson scaling_strategy_to_yojson x.scaling_strategy);
      ( "UtilizationPerformanceIndex",
        option_to_yojson utilization_performance_index_integer_to_yojson
          x.utilization_performance_index );
      ("ComputeLimits", option_to_yojson compute_limits_to_yojson x.compute_limits);
    ]

let placement_group_strategy_to_yojson (x : placement_group_strategy) =
  match x with
  | NONE -> `String "NONE"
  | CLUSTER -> `String "CLUSTER"
  | PARTITION -> `String "PARTITION"
  | SPREAD -> `String "SPREAD"

let placement_group_config_to_yojson (x : placement_group_config) =
  assoc_to_yojson
    [
      ("PlacementStrategy", option_to_yojson placement_group_strategy_to_yojson x.placement_strategy);
      ("InstanceRole", Some (instance_role_type_to_yojson x.instance_role));
    ]

let placement_group_config_list_to_yojson tree =
  list_to_yojson placement_group_config_to_yojson tree

let auto_termination_policy_to_yojson (x : auto_termination_policy) =
  assoc_to_yojson [ ("IdleTimeout", option_to_yojson long_to_yojson x.idle_timeout) ]

let cloud_watch_log_configuration_to_yojson (x : cloud_watch_log_configuration) =
  assoc_to_yojson
    [
      ("LogTypes", option_to_yojson log_types_map_to_yojson x.log_types);
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
      ("LogStreamNamePrefix", option_to_yojson xml_string_to_yojson x.log_stream_name_prefix);
      ("LogGroupName", option_to_yojson xml_string_to_yojson x.log_group_name);
      ("Enabled", Some (boolean__to_yojson x.enabled));
    ]

let monitoring_configuration_to_yojson (x : monitoring_configuration) =
  assoc_to_yojson
    [
      ( "S3LoggingConfiguration",
        option_to_yojson s3_logging_configuration_to_yojson x.s3_logging_configuration );
      ( "CloudWatchLogConfiguration",
        option_to_yojson cloud_watch_log_configuration_to_yojson x.cloud_watch_log_configuration );
    ]

let run_job_flow_input_to_yojson (x : run_job_flow_input) =
  assoc_to_yojson
    [
      ("SessionEnabled", option_to_yojson boolean_object_to_yojson x.session_enabled);
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ("ExtendedSupport", option_to_yojson boolean_object_to_yojson x.extended_support);
      ("EbsRootVolumeThroughput", option_to_yojson integer_to_yojson x.ebs_root_volume_throughput);
      ("EbsRootVolumeIops", option_to_yojson integer_to_yojson x.ebs_root_volume_iops);
      ("OSReleaseLabel", option_to_yojson xml_string_max_len256_to_yojson x.os_release_label);
      ( "AutoTerminationPolicy",
        option_to_yojson auto_termination_policy_to_yojson x.auto_termination_policy );
      ( "PlacementGroupConfigs",
        option_to_yojson placement_group_config_list_to_yojson x.placement_group_configs );
      ( "ManagedScalingPolicy",
        option_to_yojson managed_scaling_policy_to_yojson x.managed_scaling_policy );
      ("StepConcurrencyLevel", option_to_yojson integer_to_yojson x.step_concurrency_level);
      ("KerberosAttributes", option_to_yojson kerberos_attributes_to_yojson x.kerberos_attributes);
      ("RepoUpgradeOnBoot", option_to_yojson repo_upgrade_on_boot_to_yojson x.repo_upgrade_on_boot);
      ("EbsRootVolumeSize", option_to_yojson integer_to_yojson x.ebs_root_volume_size);
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
      ("ScaleDownBehavior", option_to_yojson scale_down_behavior_to_yojson x.scale_down_behavior);
      ("AutoScalingRole", option_to_yojson xml_string_to_yojson x.auto_scaling_role);
      ("SecurityConfiguration", option_to_yojson xml_string_to_yojson x.security_configuration);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ServiceRole", option_to_yojson xml_string_to_yojson x.service_role);
      ("JobFlowRole", option_to_yojson xml_string_to_yojson x.job_flow_role);
      ("VisibleToAllUsers", option_to_yojson boolean__to_yojson x.visible_to_all_users);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("Applications", option_to_yojson application_list_to_yojson x.applications);
      ( "NewSupportedProducts",
        option_to_yojson new_supported_products_list_to_yojson x.new_supported_products );
      ("SupportedProducts", option_to_yojson supported_products_list_to_yojson x.supported_products);
      ( "BootstrapActions",
        option_to_yojson bootstrap_action_config_list_to_yojson x.bootstrap_actions );
      ("StepExecutionRoleArn", option_to_yojson arn_type_to_yojson x.step_execution_role_arn);
      ("Steps", option_to_yojson step_config_list_to_yojson x.steps);
      ("Instances", Some (job_flow_instances_config_to_yojson x.instances));
      ("ReleaseLabel", option_to_yojson xml_string_max_len256_to_yojson x.release_label);
      ("AmiVersion", option_to_yojson xml_string_max_len256_to_yojson x.ami_version);
      ("AdditionalInfo", option_to_yojson xml_string_to_yojson x.additional_info);
      ("LogEncryptionKmsKeyId", option_to_yojson xml_string_to_yojson x.log_encryption_kms_key_id);
      ("LogUri", option_to_yojson xml_string_to_yojson x.log_uri);
      ("Name", Some (xml_string_max_len256_to_yojson x.name));
    ]

let resource_id_to_yojson = string_to_yojson
let remove_tags_output_to_yojson = unit_to_yojson

let remove_tags_input_to_yojson (x : remove_tags_input) =
  assoc_to_yojson
    [
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("TagKeys", Some (string_list_to_yojson x.tag_keys));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let remove_managed_scaling_policy_output_to_yojson = unit_to_yojson

let remove_managed_scaling_policy_input_to_yojson (x : remove_managed_scaling_policy_input) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]

let remove_auto_termination_policy_output_to_yojson = unit_to_yojson

let remove_auto_termination_policy_input_to_yojson (x : remove_auto_termination_policy_input) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]

let remove_auto_scaling_policy_output_to_yojson = unit_to_yojson
let instance_group_id_to_yojson = string_to_yojson

let remove_auto_scaling_policy_input_to_yojson (x : remove_auto_scaling_policy_input) =
  assoc_to_yojson
    [
      ("InstanceGroupId", Some (instance_group_id_to_yojson x.instance_group_id));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let release_label_filter_to_yojson (x : release_label_filter) =
  assoc_to_yojson
    [
      ("Application", option_to_yojson string__to_yojson x.application);
      ("Prefix", option_to_yojson string__to_yojson x.prefix);
    ]

let reconfiguration_type_to_yojson (x : reconfiguration_type) =
  match x with MERGE -> `String "MERGE" | OVERWRITE -> `String "OVERWRITE"

let put_managed_scaling_policy_output_to_yojson = unit_to_yojson

let put_managed_scaling_policy_input_to_yojson (x : put_managed_scaling_policy_input) =
  assoc_to_yojson
    [
      ("ManagedScalingPolicy", Some (managed_scaling_policy_to_yojson x.managed_scaling_policy));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let put_block_public_access_configuration_output_to_yojson = unit_to_yojson
let port_to_yojson = int_to_yojson

let port_range_to_yojson (x : port_range) =
  assoc_to_yojson
    [
      ("MaxRange", option_to_yojson port_to_yojson x.max_range);
      ("MinRange", Some (port_to_yojson x.min_range));
    ]

let port_ranges_to_yojson tree = list_to_yojson port_range_to_yojson tree

let block_public_access_configuration_to_yojson (x : block_public_access_configuration) =
  assoc_to_yojson
    [
      ("Properties", option_to_yojson string_map_to_yojson x.properties);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("Classification", option_to_yojson string__to_yojson x.classification);
      ( "PermittedPublicSecurityGroupRuleRanges",
        option_to_yojson port_ranges_to_yojson x.permitted_public_security_group_rule_ranges );
      ( "BlockPublicSecurityGroupRules",
        Some (boolean__to_yojson x.block_public_security_group_rules) );
    ]

let put_block_public_access_configuration_input_to_yojson
    (x : put_block_public_access_configuration_input) =
  assoc_to_yojson
    [
      ( "BlockPublicAccessConfiguration",
        Some (block_public_access_configuration_to_yojson x.block_public_access_configuration) );
    ]

let put_auto_termination_policy_output_to_yojson = unit_to_yojson

let put_auto_termination_policy_input_to_yojson (x : put_auto_termination_policy_input) =
  assoc_to_yojson
    [
      ( "AutoTerminationPolicy",
        option_to_yojson auto_termination_policy_to_yojson x.auto_termination_policy );
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let auto_scaling_policy_state_to_yojson (x : auto_scaling_policy_state) =
  match x with
  | FAILED -> `String "FAILED"
  | DETACHED -> `String "DETACHED"
  | DETACHING -> `String "DETACHING"
  | ATTACHED -> `String "ATTACHED"
  | ATTACHING -> `String "ATTACHING"
  | PENDING -> `String "PENDING"

let auto_scaling_policy_state_change_reason_code_to_yojson
    (x : auto_scaling_policy_state_change_reason_code) =
  match x with
  | CLEANUP_FAILURE -> `String "CLEANUP_FAILURE"
  | PROVISION_FAILURE -> `String "PROVISION_FAILURE"
  | USER_REQUEST -> `String "USER_REQUEST"

let auto_scaling_policy_state_change_reason_to_yojson (x : auto_scaling_policy_state_change_reason)
    =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson auto_scaling_policy_state_change_reason_code_to_yojson x.code);
    ]

let auto_scaling_policy_status_to_yojson (x : auto_scaling_policy_status) =
  assoc_to_yojson
    [
      ( "StateChangeReason",
        option_to_yojson auto_scaling_policy_state_change_reason_to_yojson x.state_change_reason );
      ("State", option_to_yojson auto_scaling_policy_state_to_yojson x.state);
    ]

let auto_scaling_policy_description_to_yojson (x : auto_scaling_policy_description) =
  assoc_to_yojson
    [
      ("Rules", option_to_yojson scaling_rule_list_to_yojson x.rules);
      ("Constraints", option_to_yojson scaling_constraints_to_yojson x.constraints);
      ("Status", option_to_yojson auto_scaling_policy_status_to_yojson x.status);
    ]

let put_auto_scaling_policy_output_to_yojson (x : put_auto_scaling_policy_output) =
  assoc_to_yojson
    [
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
      ( "AutoScalingPolicy",
        option_to_yojson auto_scaling_policy_description_to_yojson x.auto_scaling_policy );
      ("InstanceGroupId", option_to_yojson instance_group_id_to_yojson x.instance_group_id);
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
    ]

let put_auto_scaling_policy_input_to_yojson (x : put_auto_scaling_policy_input) =
  assoc_to_yojson
    [
      ("AutoScalingPolicy", Some (auto_scaling_policy_to_yojson x.auto_scaling_policy));
      ("InstanceGroupId", Some (instance_group_id_to_yojson x.instance_group_id));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let profiler_type_to_yojson (x : profiler_type) =
  match x with YTS -> `String "YTS" | TEZUI -> `String "TEZUI" | SHS -> `String "SHS"

let persistent_app_ui_type_to_yojson (x : persistent_app_ui_type) =
  match x with YTS -> `String "YTS" | TEZ -> `String "TEZ" | SHS -> `String "SHS"

let persistent_app_ui_type_list_to_yojson tree =
  list_to_yojson persistent_app_ui_type_to_yojson tree

let persistent_app_u_i_to_yojson (x : persistent_app_u_i) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("LastStateChangeReason", option_to_yojson xml_string_to_yojson x.last_state_change_reason);
      ("LastModifiedTime", option_to_yojson date_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("AuthorId", option_to_yojson xml_string_max_len256_to_yojson x.author_id);
      ( "PersistentAppUIStatus",
        option_to_yojson xml_string_max_len256_to_yojson x.persistent_app_ui_status );
      ( "PersistentAppUITypeList",
        option_to_yojson persistent_app_ui_type_list_to_yojson x.persistent_app_ui_type_list );
      ("PersistentAppUIId", option_to_yojson xml_string_max_len256_to_yojson x.persistent_app_ui_id);
    ]

let output_notebook_s3_location_for_output_to_yojson (x : output_notebook_s3_location_for_output) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson uri_string_to_yojson x.key);
      ("Bucket", option_to_yojson xml_string_max_len256_to_yojson x.bucket);
    ]

let on_cluster_app_ui_type_to_yojson (x : on_cluster_app_ui_type) =
  match x with
  | ResourceManager -> `String "ResourceManager"
  | JobHistoryServer -> `String "JobHistoryServer"
  | ApplicationMaster -> `String "ApplicationMaster"
  | TezUI -> `String "TezUI"
  | YarnTimelineService -> `String "YarnTimelineService"
  | SparkHistoryServer -> `String "SparkHistoryServer"

let os_release_to_yojson (x : os_release) =
  assoc_to_yojson [ ("Label", option_to_yojson string__to_yojson x.label) ]

let os_release_list_to_yojson tree = list_to_yojson os_release_to_yojson tree

let notebook_s3_location_for_output_to_yojson (x : notebook_s3_location_for_output) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson uri_string_to_yojson x.key);
      ("Bucket", option_to_yojson xml_string_max_len256_to_yojson x.bucket);
    ]

let notebook_execution_status_to_yojson (x : notebook_execution_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | STOP_PENDING -> `String "STOP_PENDING"
  | FAILED -> `String "FAILED"
  | FAILING -> `String "FAILING"
  | FINISHED -> `String "FINISHED"
  | FINISHING -> `String "FINISHING"
  | RUNNING -> `String "RUNNING"
  | STARTING -> `String "STARTING"
  | START_PENDING -> `String "START_PENDING"

let notebook_execution_summary_to_yojson (x : notebook_execution_summary) =
  assoc_to_yojson
    [
      ("ExecutionEngineId", option_to_yojson xml_string_to_yojson x.execution_engine_id);
      ( "NotebookS3Location",
        option_to_yojson notebook_s3_location_for_output_to_yojson x.notebook_s3_location );
      ("EndTime", option_to_yojson date_to_yojson x.end_time);
      ("StartTime", option_to_yojson date_to_yojson x.start_time);
      ("Status", option_to_yojson notebook_execution_status_to_yojson x.status);
      ( "NotebookExecutionName",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_name );
      ("EditorId", option_to_yojson xml_string_max_len256_to_yojson x.editor_id);
      ( "NotebookExecutionId",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_id );
    ]

let notebook_execution_summary_list_to_yojson tree =
  list_to_yojson notebook_execution_summary_to_yojson tree

let notebook_execution_to_yojson (x : notebook_execution) =
  assoc_to_yojson
    [
      ( "EnvironmentVariables",
        option_to_yojson environment_variables_map_to_yojson x.environment_variables );
      ( "OutputNotebookFormat",
        option_to_yojson output_notebook_format_to_yojson x.output_notebook_format );
      ( "OutputNotebookS3Location",
        option_to_yojson output_notebook_s3_location_for_output_to_yojson
          x.output_notebook_s3_location );
      ( "NotebookS3Location",
        option_to_yojson notebook_s3_location_for_output_to_yojson x.notebook_s3_location );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "NotebookInstanceSecurityGroupId",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_instance_security_group_id );
      ("LastStateChangeReason", option_to_yojson xml_string_to_yojson x.last_state_change_reason);
      ("OutputNotebookURI", option_to_yojson xml_string_to_yojson x.output_notebook_ur_i);
      ("Arn", option_to_yojson xml_string_max_len256_to_yojson x.arn);
      ("EndTime", option_to_yojson date_to_yojson x.end_time);
      ("StartTime", option_to_yojson date_to_yojson x.start_time);
      ("Status", option_to_yojson notebook_execution_status_to_yojson x.status);
      ("NotebookParams", option_to_yojson xml_string_to_yojson x.notebook_params);
      ( "NotebookExecutionName",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_name );
      ("ExecutionEngine", option_to_yojson execution_engine_config_to_yojson x.execution_engine);
      ("EditorId", option_to_yojson xml_string_max_len256_to_yojson x.editor_id);
      ( "NotebookExecutionId",
        option_to_yojson xml_string_max_len256_to_yojson x.notebook_execution_id );
    ]

let ec2_instance_ids_to_terminate_list_to_yojson tree = list_to_yojson instance_id_to_yojson tree

let instance_group_modify_config_to_yojson (x : instance_group_modify_config) =
  assoc_to_yojson
    [
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("ReconfigurationType", option_to_yojson reconfiguration_type_to_yojson x.reconfiguration_type);
      ("ShrinkPolicy", option_to_yojson shrink_policy_to_yojson x.shrink_policy);
      ( "EC2InstanceIdsToTerminate",
        option_to_yojson ec2_instance_ids_to_terminate_list_to_yojson
          x.ec2_instance_ids_to_terminate );
      ("InstanceCount", option_to_yojson integer_to_yojson x.instance_count);
      ("InstanceGroupId", Some (xml_string_max_len256_to_yojson x.instance_group_id));
    ]

let instance_group_modify_config_list_to_yojson tree =
  list_to_yojson instance_group_modify_config_to_yojson tree

let modify_instance_groups_input_to_yojson (x : modify_instance_groups_input) =
  assoc_to_yojson
    [
      ( "InstanceGroups",
        option_to_yojson instance_group_modify_config_list_to_yojson x.instance_groups );
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
    ]

let instance_fleet_id_to_yojson = string_to_yojson

let instance_fleet_modify_config_to_yojson (x : instance_fleet_modify_config) =
  assoc_to_yojson
    [
      ("Context", option_to_yojson xml_string_max_len256_to_yojson x.context);
      ( "InstanceTypeConfigs",
        option_to_yojson instance_type_config_list_to_yojson x.instance_type_configs );
      ( "ResizeSpecifications",
        option_to_yojson instance_fleet_resizing_specifications_to_yojson x.resize_specifications );
      ("TargetSpotCapacity", option_to_yojson whole_number_to_yojson x.target_spot_capacity);
      ("TargetOnDemandCapacity", option_to_yojson whole_number_to_yojson x.target_on_demand_capacity);
      ("InstanceFleetId", Some (instance_fleet_id_to_yojson x.instance_fleet_id));
    ]

let modify_instance_fleet_input_to_yojson (x : modify_instance_fleet_input) =
  assoc_to_yojson
    [
      ("InstanceFleet", Some (instance_fleet_modify_config_to_yojson x.instance_fleet));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let modify_cluster_output_to_yojson (x : modify_cluster_output) =
  assoc_to_yojson
    [
      ("ExtendedSupport", option_to_yojson boolean_object_to_yojson x.extended_support);
      ("StepConcurrencyLevel", option_to_yojson integer_to_yojson x.step_concurrency_level);
    ]

let modify_cluster_input_to_yojson (x : modify_cluster_input) =
  assoc_to_yojson
    [
      ("ExtendedSupport", option_to_yojson boolean_object_to_yojson x.extended_support);
      ("StepConcurrencyLevel", option_to_yojson integer_to_yojson x.step_concurrency_level);
      ("ClusterId", Some (string__to_yojson x.cluster_id));
    ]

let max_results_number_to_yojson = int_to_yojson
let marker_to_yojson = string_to_yojson

let list_supported_instance_types_output_to_yojson (x : list_supported_instance_types_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "SupportedInstanceTypes",
        option_to_yojson supported_instance_types_list_to_yojson x.supported_instance_types );
    ]

let list_supported_instance_types_input_to_yojson (x : list_supported_instance_types_input) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("ReleaseLabel", Some (string__to_yojson x.release_label));
    ]

let list_studios_output_to_yojson (x : list_studios_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Studios", option_to_yojson studio_summary_list_to_yojson x.studios);
    ]

let list_studios_input_to_yojson (x : list_studios_input) =
  assoc_to_yojson [ ("Marker", option_to_yojson marker_to_yojson x.marker) ]

let list_studio_session_mappings_output_to_yojson (x : list_studio_session_mappings_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("SessionMappings", option_to_yojson session_mapping_summary_list_to_yojson x.session_mappings);
    ]

let list_studio_session_mappings_input_to_yojson (x : list_studio_session_mappings_input) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("IdentityType", option_to_yojson identity_type_to_yojson x.identity_type);
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
    ]

let list_steps_output_to_yojson (x : list_steps_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Steps", option_to_yojson step_summary_list_to_yojson x.steps);
    ]

let list_steps_input_to_yojson (x : list_steps_input) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("StepIds", option_to_yojson xml_string_list_to_yojson x.step_ids);
      ("StepStates", option_to_yojson step_state_list_to_yojson x.step_states);
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let list_sessions_output_to_yojson (x : list_sessions_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Sessions", option_to_yojson session_list_to_yojson x.sessions);
    ]

let list_sessions_input_to_yojson (x : list_sessions_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("SessionStates", option_to_yojson session_state_list_to_yojson x.session_states);
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let list_security_configurations_output_to_yojson (x : list_security_configurations_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ( "SecurityConfigurations",
        option_to_yojson security_configuration_list_to_yojson x.security_configurations );
    ]

let list_security_configurations_input_to_yojson (x : list_security_configurations_input) =
  assoc_to_yojson [ ("Marker", option_to_yojson marker_to_yojson x.marker) ]

let list_release_labels_output_to_yojson (x : list_release_labels_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ReleaseLabels", option_to_yojson string_list_to_yojson x.release_labels);
    ]

let list_release_labels_input_to_yojson (x : list_release_labels_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson release_label_filter_to_yojson x.filters);
    ]

let list_notebook_executions_output_to_yojson (x : list_notebook_executions_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ( "NotebookExecutions",
        option_to_yojson notebook_execution_summary_list_to_yojson x.notebook_executions );
    ]

let list_notebook_executions_input_to_yojson (x : list_notebook_executions_input) =
  assoc_to_yojson
    [
      ("ExecutionEngineId", option_to_yojson xml_string_to_yojson x.execution_engine_id);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("To", option_to_yojson date_to_yojson x.to_);
      ("From", option_to_yojson date_to_yojson x.from_);
      ("Status", option_to_yojson notebook_execution_status_to_yojson x.status);
      ("EditorId", option_to_yojson xml_string_max_len256_to_yojson x.editor_id);
    ]

let instance_state_to_yojson (x : instance_state) =
  match x with
  | TERMINATED -> `String "TERMINATED"
  | RUNNING -> `String "RUNNING"
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"
  | PROVISIONING -> `String "PROVISIONING"
  | AWAITING_FULFILLMENT -> `String "AWAITING_FULFILLMENT"

let instance_state_change_reason_code_to_yojson (x : instance_state_change_reason_code) =
  match x with
  | CLUSTER_TERMINATED -> `String "CLUSTER_TERMINATED"
  | BOOTSTRAP_FAILURE -> `String "BOOTSTRAP_FAILURE"
  | INSTANCE_FAILURE -> `String "INSTANCE_FAILURE"
  | VALIDATION_ERROR -> `String "VALIDATION_ERROR"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let instance_state_change_reason_to_yojson (x : instance_state_change_reason) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson instance_state_change_reason_code_to_yojson x.code);
    ]

let instance_timeline_to_yojson (x : instance_timeline) =
  assoc_to_yojson
    [
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
    ]

let instance_status_to_yojson (x : instance_status) =
  assoc_to_yojson
    [
      ("Timeline", option_to_yojson instance_timeline_to_yojson x.timeline);
      ( "StateChangeReason",
        option_to_yojson instance_state_change_reason_to_yojson x.state_change_reason );
      ("State", option_to_yojson instance_state_to_yojson x.state);
    ]

let ebs_volume_to_yojson (x : ebs_volume) =
  assoc_to_yojson
    [
      ("VolumeId", option_to_yojson string__to_yojson x.volume_id);
      ("Device", option_to_yojson string__to_yojson x.device);
    ]

let ebs_volume_list_to_yojson tree = list_to_yojson ebs_volume_to_yojson tree

let instance_to_yojson (x : instance) =
  assoc_to_yojson
    [
      ("EbsVolumes", option_to_yojson ebs_volume_list_to_yojson x.ebs_volumes);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("Market", option_to_yojson market_type_to_yojson x.market);
      ("InstanceFleetId", option_to_yojson instance_fleet_id_to_yojson x.instance_fleet_id);
      ("InstanceGroupId", option_to_yojson string__to_yojson x.instance_group_id);
      ("Status", option_to_yojson instance_status_to_yojson x.status);
      ("PrivateIpAddress", option_to_yojson string__to_yojson x.private_ip_address);
      ("PrivateDnsName", option_to_yojson string__to_yojson x.private_dns_name);
      ("PublicIpAddress", option_to_yojson string__to_yojson x.public_ip_address);
      ("PublicDnsName", option_to_yojson string__to_yojson x.public_dns_name);
      ("Ec2InstanceId", option_to_yojson instance_id_to_yojson x.ec2_instance_id);
      ("Id", option_to_yojson instance_id_to_yojson x.id);
    ]

let instance_list_to_yojson tree = list_to_yojson instance_to_yojson tree

let list_instances_output_to_yojson (x : list_instances_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Instances", option_to_yojson instance_list_to_yojson x.instances);
    ]

let instance_group_type_to_yojson (x : instance_group_type) =
  match x with TASK -> `String "TASK" | CORE -> `String "CORE" | MASTER -> `String "MASTER"

let instance_group_type_list_to_yojson tree = list_to_yojson instance_group_type_to_yojson tree
let instance_state_list_to_yojson tree = list_to_yojson instance_state_to_yojson tree

let list_instances_input_to_yojson (x : list_instances_input) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("InstanceStates", option_to_yojson instance_state_list_to_yojson x.instance_states);
      ("InstanceFleetType", option_to_yojson instance_fleet_type_to_yojson x.instance_fleet_type);
      ("InstanceFleetId", option_to_yojson instance_fleet_id_to_yojson x.instance_fleet_id);
      ( "InstanceGroupTypes",
        option_to_yojson instance_group_type_list_to_yojson x.instance_group_types );
      ("InstanceGroupId", option_to_yojson instance_group_id_to_yojson x.instance_group_id);
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let instance_group_state_to_yojson (x : instance_group_state) =
  match x with
  | ENDED -> `String "ENDED"
  | SHUTTING_DOWN -> `String "SHUTTING_DOWN"
  | ARRESTED -> `String "ARRESTED"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | SUSPENDED -> `String "SUSPENDED"
  | RESIZING -> `String "RESIZING"
  | RECONFIGURING -> `String "RECONFIGURING"
  | RUNNING -> `String "RUNNING"
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"
  | PROVISIONING -> `String "PROVISIONING"

let instance_group_state_change_reason_code_to_yojson (x : instance_group_state_change_reason_code)
    =
  match x with
  | CLUSTER_TERMINATED -> `String "CLUSTER_TERMINATED"
  | INSTANCE_FAILURE -> `String "INSTANCE_FAILURE"
  | VALIDATION_ERROR -> `String "VALIDATION_ERROR"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let instance_group_state_change_reason_to_yojson (x : instance_group_state_change_reason) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson instance_group_state_change_reason_code_to_yojson x.code);
    ]

let instance_group_timeline_to_yojson (x : instance_group_timeline) =
  assoc_to_yojson
    [
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
    ]

let instance_group_status_to_yojson (x : instance_group_status) =
  assoc_to_yojson
    [
      ("Timeline", option_to_yojson instance_group_timeline_to_yojson x.timeline);
      ( "StateChangeReason",
        option_to_yojson instance_group_state_change_reason_to_yojson x.state_change_reason );
      ("State", option_to_yojson instance_group_state_to_yojson x.state);
    ]

let ebs_block_device_to_yojson (x : ebs_block_device) =
  assoc_to_yojson
    [
      ("Device", option_to_yojson string__to_yojson x.device);
      ("VolumeSpecification", option_to_yojson volume_specification_to_yojson x.volume_specification);
    ]

let ebs_block_device_list_to_yojson tree = list_to_yojson ebs_block_device_to_yojson tree

let instance_group_to_yojson (x : instance_group) =
  assoc_to_yojson
    [
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
      ( "AutoScalingPolicy",
        option_to_yojson auto_scaling_policy_description_to_yojson x.auto_scaling_policy );
      ("ShrinkPolicy", option_to_yojson shrink_policy_to_yojson x.shrink_policy);
      ("EbsOptimized", option_to_yojson boolean_object_to_yojson x.ebs_optimized);
      ("EbsBlockDevices", option_to_yojson ebs_block_device_list_to_yojson x.ebs_block_devices);
      ( "LastSuccessfullyAppliedConfigurationsVersion",
        option_to_yojson long_to_yojson x.last_successfully_applied_configurations_version );
      ( "LastSuccessfullyAppliedConfigurations",
        option_to_yojson configuration_list_to_yojson x.last_successfully_applied_configurations );
      ("ConfigurationsVersion", option_to_yojson long_to_yojson x.configurations_version);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("Status", option_to_yojson instance_group_status_to_yojson x.status);
      ("RunningInstanceCount", option_to_yojson integer_to_yojson x.running_instance_count);
      ("RequestedInstanceCount", option_to_yojson integer_to_yojson x.requested_instance_count);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("BidPrice", option_to_yojson string__to_yojson x.bid_price);
      ("InstanceGroupType", option_to_yojson instance_group_type_to_yojson x.instance_group_type);
      ("Market", option_to_yojson market_type_to_yojson x.market);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Id", option_to_yojson instance_group_id_to_yojson x.id);
    ]

let instance_group_list_to_yojson tree = list_to_yojson instance_group_to_yojson tree

let list_instance_groups_output_to_yojson (x : list_instance_groups_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("InstanceGroups", option_to_yojson instance_group_list_to_yojson x.instance_groups);
    ]

let list_instance_groups_input_to_yojson (x : list_instance_groups_input) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let instance_fleet_state_to_yojson (x : instance_fleet_state) =
  match x with
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | SUSPENDED -> `String "SUSPENDED"
  | RECONFIGURING -> `String "RECONFIGURING"
  | RESIZING -> `String "RESIZING"
  | RUNNING -> `String "RUNNING"
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"
  | PROVISIONING -> `String "PROVISIONING"

let instance_fleet_state_change_reason_code_to_yojson (x : instance_fleet_state_change_reason_code)
    =
  match x with
  | CLUSTER_TERMINATED -> `String "CLUSTER_TERMINATED"
  | INSTANCE_FAILURE -> `String "INSTANCE_FAILURE"
  | VALIDATION_ERROR -> `String "VALIDATION_ERROR"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let instance_fleet_state_change_reason_to_yojson (x : instance_fleet_state_change_reason) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson instance_fleet_state_change_reason_code_to_yojson x.code);
    ]

let instance_fleet_timeline_to_yojson (x : instance_fleet_timeline) =
  assoc_to_yojson
    [
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
    ]

let instance_fleet_status_to_yojson (x : instance_fleet_status) =
  assoc_to_yojson
    [
      ("Timeline", option_to_yojson instance_fleet_timeline_to_yojson x.timeline);
      ( "StateChangeReason",
        option_to_yojson instance_fleet_state_change_reason_to_yojson x.state_change_reason );
      ("State", option_to_yojson instance_fleet_state_to_yojson x.state);
    ]

let instance_type_specification_to_yojson (x : instance_type_specification) =
  assoc_to_yojson
    [
      ("Priority", option_to_yojson non_negative_double_to_yojson x.priority);
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
      ("EbsOptimized", option_to_yojson boolean_object_to_yojson x.ebs_optimized);
      ("EbsBlockDevices", option_to_yojson ebs_block_device_list_to_yojson x.ebs_block_devices);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ( "BidPriceAsPercentageOfOnDemandPrice",
        option_to_yojson non_negative_double_to_yojson x.bid_price_as_percentage_of_on_demand_price
      );
      ("BidPrice", option_to_yojson xml_string_max_len256_to_yojson x.bid_price);
      ("WeightedCapacity", option_to_yojson whole_number_to_yojson x.weighted_capacity);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
    ]

let instance_type_specification_list_to_yojson tree =
  list_to_yojson instance_type_specification_to_yojson tree

let instance_fleet_to_yojson (x : instance_fleet) =
  assoc_to_yojson
    [
      ("Context", option_to_yojson xml_string_max_len256_to_yojson x.context);
      ( "ResizeSpecifications",
        option_to_yojson instance_fleet_resizing_specifications_to_yojson x.resize_specifications );
      ( "LaunchSpecifications",
        option_to_yojson instance_fleet_provisioning_specifications_to_yojson
          x.launch_specifications );
      ( "InstanceTypeSpecifications",
        option_to_yojson instance_type_specification_list_to_yojson x.instance_type_specifications
      );
      ( "ProvisionedSpotCapacity",
        option_to_yojson whole_number_to_yojson x.provisioned_spot_capacity );
      ( "ProvisionedOnDemandCapacity",
        option_to_yojson whole_number_to_yojson x.provisioned_on_demand_capacity );
      ("TargetSpotCapacity", option_to_yojson whole_number_to_yojson x.target_spot_capacity);
      ("TargetOnDemandCapacity", option_to_yojson whole_number_to_yojson x.target_on_demand_capacity);
      ("InstanceFleetType", option_to_yojson instance_fleet_type_to_yojson x.instance_fleet_type);
      ("Status", option_to_yojson instance_fleet_status_to_yojson x.status);
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("Id", option_to_yojson instance_fleet_id_to_yojson x.id);
    ]

let instance_fleet_list_to_yojson tree = list_to_yojson instance_fleet_to_yojson tree

let list_instance_fleets_output_to_yojson (x : list_instance_fleets_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("InstanceFleets", option_to_yojson instance_fleet_list_to_yojson x.instance_fleets);
    ]

let list_instance_fleets_input_to_yojson (x : list_instance_fleets_input) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let cluster_state_to_yojson (x : cluster_state) =
  match x with
  | TERMINATED_WITH_ERRORS -> `String "TERMINATED_WITH_ERRORS"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | WAITING -> `String "WAITING"
  | RUNNING -> `String "RUNNING"
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"
  | STARTING -> `String "STARTING"

let cluster_state_change_reason_code_to_yojson (x : cluster_state_change_reason_code) =
  match x with
  | ALL_STEPS_COMPLETED -> `String "ALL_STEPS_COMPLETED"
  | STEP_FAILURE -> `String "STEP_FAILURE"
  | USER_REQUEST -> `String "USER_REQUEST"
  | BOOTSTRAP_FAILURE -> `String "BOOTSTRAP_FAILURE"
  | INSTANCE_FLEET_TIMEOUT -> `String "INSTANCE_FLEET_TIMEOUT"
  | INSTANCE_FAILURE -> `String "INSTANCE_FAILURE"
  | VALIDATION_ERROR -> `String "VALIDATION_ERROR"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let cluster_state_change_reason_to_yojson (x : cluster_state_change_reason) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson cluster_state_change_reason_code_to_yojson x.code);
    ]

let cluster_timeline_to_yojson (x : cluster_timeline) =
  assoc_to_yojson
    [
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
    ]

let error_data_to_yojson tree = list_to_yojson string_map_to_yojson tree

let error_detail_to_yojson (x : error_detail) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ErrorData", option_to_yojson error_data_to_yojson x.error_data);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
    ]

let error_detail_list_to_yojson tree = list_to_yojson error_detail_to_yojson tree

let cluster_status_to_yojson (x : cluster_status) =
  assoc_to_yojson
    [
      ("ErrorDetails", option_to_yojson error_detail_list_to_yojson x.error_details);
      ("Timeline", option_to_yojson cluster_timeline_to_yojson x.timeline);
      ( "StateChangeReason",
        option_to_yojson cluster_state_change_reason_to_yojson x.state_change_reason );
      ("State", option_to_yojson cluster_state_to_yojson x.state);
    ]

let cluster_summary_to_yojson (x : cluster_summary) =
  assoc_to_yojson
    [
      ("OutpostArn", option_to_yojson optional_arn_type_to_yojson x.outpost_arn);
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
      ("NormalizedInstanceHours", option_to_yojson integer_to_yojson x.normalized_instance_hours);
      ("Status", option_to_yojson cluster_status_to_yojson x.status);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Id", option_to_yojson cluster_id_to_yojson x.id);
    ]

let cluster_summary_list_to_yojson tree = list_to_yojson cluster_summary_to_yojson tree

let list_clusters_output_to_yojson (x : list_clusters_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Clusters", option_to_yojson cluster_summary_list_to_yojson x.clusters);
    ]

let cluster_state_list_to_yojson tree = list_to_yojson cluster_state_to_yojson tree

let list_clusters_input_to_yojson (x : list_clusters_input) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("ClusterStates", option_to_yojson cluster_state_list_to_yojson x.cluster_states);
      ("CreatedBefore", option_to_yojson date_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson date_to_yojson x.created_after);
    ]

let command_to_yojson (x : command) =
  assoc_to_yojson
    [
      ("Args", option_to_yojson string_list_to_yojson x.args);
      ("ScriptPath", option_to_yojson string__to_yojson x.script_path);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let command_list_to_yojson tree = list_to_yojson command_to_yojson tree

let list_bootstrap_actions_output_to_yojson (x : list_bootstrap_actions_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("BootstrapActions", option_to_yojson command_list_to_yojson x.bootstrap_actions);
    ]

let list_bootstrap_actions_input_to_yojson (x : list_bootstrap_actions_input) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let instance_group_detail_to_yojson (x : instance_group_detail) =
  assoc_to_yojson
    [
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("StartDateTime", option_to_yojson date_to_yojson x.start_date_time);
      ("CreationDateTime", Some (date_to_yojson x.creation_date_time));
      ("LastStateChangeReason", option_to_yojson xml_string_to_yojson x.last_state_change_reason);
      ("State", Some (instance_group_state_to_yojson x.state));
      ("InstanceRunningCount", Some (integer_to_yojson x.instance_running_count));
      ("InstanceRequestCount", Some (integer_to_yojson x.instance_request_count));
      ("InstanceType", Some (instance_type_to_yojson x.instance_type));
      ("BidPrice", option_to_yojson xml_string_max_len256_to_yojson x.bid_price);
      ("InstanceRole", Some (instance_role_type_to_yojson x.instance_role));
      ("Market", Some (market_type_to_yojson x.market));
      ("Name", option_to_yojson xml_string_max_len256_to_yojson x.name);
      ("InstanceGroupId", option_to_yojson xml_string_max_len256_to_yojson x.instance_group_id);
    ]

let instance_group_detail_list_to_yojson tree = list_to_yojson instance_group_detail_to_yojson tree

let job_flow_instances_detail_to_yojson (x : job_flow_instances_detail) =
  assoc_to_yojson
    [
      ("HadoopVersion", option_to_yojson xml_string_max_len256_to_yojson x.hadoop_version);
      ( "UnhealthyNodeReplacement",
        option_to_yojson boolean_object_to_yojson x.unhealthy_node_replacement );
      ("TerminationProtected", option_to_yojson boolean__to_yojson x.termination_protected);
      ( "KeepJobFlowAliveWhenNoSteps",
        option_to_yojson boolean__to_yojson x.keep_job_flow_alive_when_no_steps );
      ("Placement", option_to_yojson placement_type_to_yojson x.placement);
      ("Ec2SubnetId", option_to_yojson xml_string_max_len256_to_yojson x.ec2_subnet_id);
      ("Ec2KeyName", option_to_yojson xml_string_max_len256_to_yojson x.ec2_key_name);
      ("NormalizedInstanceHours", option_to_yojson integer_to_yojson x.normalized_instance_hours);
      ("InstanceGroups", option_to_yojson instance_group_detail_list_to_yojson x.instance_groups);
      ("InstanceCount", Some (integer_to_yojson x.instance_count));
      ("SlaveInstanceType", Some (instance_type_to_yojson x.slave_instance_type));
      ("MasterInstanceId", option_to_yojson xml_string_to_yojson x.master_instance_id);
      ("MasterPublicDnsName", option_to_yojson xml_string_to_yojson x.master_public_dns_name);
      ("MasterInstanceType", Some (instance_type_to_yojson x.master_instance_type));
    ]

let job_flow_execution_state_to_yojson (x : job_flow_execution_state) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | TERMINATED -> `String "TERMINATED"
  | SHUTTING_DOWN -> `String "SHUTTING_DOWN"
  | WAITING -> `String "WAITING"
  | RUNNING -> `String "RUNNING"
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"
  | STARTING -> `String "STARTING"

let job_flow_execution_status_detail_to_yojson (x : job_flow_execution_status_detail) =
  assoc_to_yojson
    [
      ("LastStateChangeReason", option_to_yojson xml_string_to_yojson x.last_state_change_reason);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("ReadyDateTime", option_to_yojson date_to_yojson x.ready_date_time);
      ("StartDateTime", option_to_yojson date_to_yojson x.start_date_time);
      ("CreationDateTime", Some (date_to_yojson x.creation_date_time));
      ("State", Some (job_flow_execution_state_to_yojson x.state));
    ]

let job_flow_execution_state_list_to_yojson tree =
  list_to_yojson job_flow_execution_state_to_yojson tree

let bootstrap_action_detail_to_yojson (x : bootstrap_action_detail) =
  assoc_to_yojson
    [
      ( "BootstrapActionConfig",
        option_to_yojson bootstrap_action_config_to_yojson x.bootstrap_action_config );
    ]

let bootstrap_action_detail_list_to_yojson tree =
  list_to_yojson bootstrap_action_detail_to_yojson tree

let job_flow_detail_to_yojson (x : job_flow_detail) =
  assoc_to_yojson
    [
      ("ScaleDownBehavior", option_to_yojson scale_down_behavior_to_yojson x.scale_down_behavior);
      ("AutoScalingRole", option_to_yojson xml_string_to_yojson x.auto_scaling_role);
      ("ServiceRole", option_to_yojson xml_string_to_yojson x.service_role);
      ("JobFlowRole", option_to_yojson xml_string_to_yojson x.job_flow_role);
      ("VisibleToAllUsers", option_to_yojson boolean__to_yojson x.visible_to_all_users);
      ("SupportedProducts", option_to_yojson supported_products_list_to_yojson x.supported_products);
      ( "BootstrapActions",
        option_to_yojson bootstrap_action_detail_list_to_yojson x.bootstrap_actions );
      ("Steps", option_to_yojson step_detail_list_to_yojson x.steps);
      ("Instances", Some (job_flow_instances_detail_to_yojson x.instances));
      ( "ExecutionStatusDetail",
        Some (job_flow_execution_status_detail_to_yojson x.execution_status_detail) );
      ("AmiVersion", option_to_yojson xml_string_max_len256_to_yojson x.ami_version);
      ("LogEncryptionKmsKeyId", option_to_yojson xml_string_to_yojson x.log_encryption_kms_key_id);
      ("LogUri", option_to_yojson xml_string_to_yojson x.log_uri);
      ("Name", Some (xml_string_max_len256_to_yojson x.name));
      ("JobFlowId", Some (xml_string_max_len256_to_yojson x.job_flow_id));
    ]

let job_flow_detail_list_to_yojson tree = list_to_yojson job_flow_detail_to_yojson tree
let instance_group_ids_list_to_yojson tree = list_to_yojson xml_string_max_len256_to_yojson tree

let instance_collection_type_to_yojson (x : instance_collection_type) =
  match x with
  | INSTANCE_GROUP -> `String "INSTANCE_GROUP"
  | INSTANCE_FLEET -> `String "INSTANCE_FLEET"

let get_studio_session_mapping_output_to_yojson (x : get_studio_session_mapping_output) =
  assoc_to_yojson
    [ ("SessionMapping", option_to_yojson session_mapping_detail_to_yojson x.session_mapping) ]

let get_studio_session_mapping_input_to_yojson (x : get_studio_session_mapping_input) =
  assoc_to_yojson
    [
      ("IdentityType", Some (identity_type_to_yojson x.identity_type));
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id));
    ]

let get_session_output_to_yojson (x : get_session_output) =
  assoc_to_yojson [ ("Session", Some (session_to_yojson x.session)) ]

let get_session_input_to_yojson (x : get_session_input) =
  assoc_to_yojson
    [
      ("SessionId", Some (session_id_to_yojson x.session_id));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let credentials_to_yojson (x : credentials) =
  match x with
  | UsernamePassword arg ->
      assoc_to_yojson [ ("UsernamePassword", Some (username_password_to_yojson arg)) ]

let get_session_endpoint_output_to_yojson (x : get_session_endpoint_output) =
  assoc_to_yojson
    [
      ("Credentials", option_to_yojson credentials_to_yojson x.credentials);
      ("AuthTokenExpirationTime", option_to_yojson date_to_yojson x.auth_token_expiration_time);
      ("AuthToken", option_to_yojson sensitive_string_to_yojson x.auth_token);
      ("Endpoint", Some (xml_string_to_yojson x.endpoint));
    ]

let get_session_endpoint_input_to_yojson (x : get_session_endpoint_input) =
  assoc_to_yojson
    [
      ("SessionId", Some (session_id_to_yojson x.session_id));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let get_persistent_app_ui_presigned_url_output_to_yojson
    (x : get_persistent_app_ui_presigned_url_output) =
  assoc_to_yojson
    [
      ("PresignedURL", option_to_yojson xml_string_to_yojson x.presigned_ur_l);
      ("PresignedURLReady", option_to_yojson boolean__to_yojson x.presigned_url_ready);
    ]

let get_persistent_app_ui_presigned_url_input_to_yojson
    (x : get_persistent_app_ui_presigned_url_input) =
  assoc_to_yojson
    [
      ("ExecutionRoleArn", option_to_yojson arn_type_to_yojson x.execution_role_arn);
      ("AuthProxyCall", option_to_yojson boolean_object_to_yojson x.auth_proxy_call);
      ("ApplicationId", option_to_yojson xml_string_max_len256_to_yojson x.application_id);
      ( "PersistentAppUIType",
        option_to_yojson persistent_app_ui_type_to_yojson x.persistent_app_ui_type );
      ("PersistentAppUIId", Some (xml_string_max_len256_to_yojson x.persistent_app_ui_id));
    ]

let get_on_cluster_app_ui_presigned_url_output_to_yojson
    (x : get_on_cluster_app_ui_presigned_url_output) =
  assoc_to_yojson
    [
      ("PresignedURL", option_to_yojson xml_string_to_yojson x.presigned_ur_l);
      ("PresignedURLReady", option_to_yojson boolean__to_yojson x.presigned_url_ready);
    ]

let get_on_cluster_app_ui_presigned_url_input_to_yojson
    (x : get_on_cluster_app_ui_presigned_url_input) =
  assoc_to_yojson
    [
      ("ExecutionRoleArn", option_to_yojson arn_type_to_yojson x.execution_role_arn);
      ("DryRun", option_to_yojson boolean_object_to_yojson x.dry_run);
      ("ApplicationId", option_to_yojson xml_string_max_len256_to_yojson x.application_id);
      ( "OnClusterAppUIType",
        option_to_yojson on_cluster_app_ui_type_to_yojson x.on_cluster_app_ui_type );
      ("ClusterId", Some (xml_string_max_len256_to_yojson x.cluster_id));
    ]

let get_managed_scaling_policy_output_to_yojson (x : get_managed_scaling_policy_output) =
  assoc_to_yojson
    [
      ( "ManagedScalingPolicy",
        option_to_yojson managed_scaling_policy_to_yojson x.managed_scaling_policy );
    ]

let get_managed_scaling_policy_input_to_yojson (x : get_managed_scaling_policy_input) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]

let get_cluster_session_credentials_output_to_yojson (x : get_cluster_session_credentials_output) =
  assoc_to_yojson
    [
      ("ExpiresAt", option_to_yojson date_to_yojson x.expires_at);
      ("Credentials", option_to_yojson credentials_to_yojson x.credentials);
    ]

let get_cluster_session_credentials_input_to_yojson (x : get_cluster_session_credentials_input) =
  assoc_to_yojson
    [
      ("ExecutionRoleArn", option_to_yojson arn_type_to_yojson x.execution_role_arn);
      ("ClusterId", Some (xml_string_max_len256_to_yojson x.cluster_id));
    ]

let block_public_access_configuration_metadata_to_yojson
    (x : block_public_access_configuration_metadata) =
  assoc_to_yojson
    [
      ("CreatedByArn", Some (arn_type_to_yojson x.created_by_arn));
      ("CreationDateTime", Some (date_to_yojson x.creation_date_time));
    ]

let get_block_public_access_configuration_output_to_yojson
    (x : get_block_public_access_configuration_output) =
  assoc_to_yojson
    [
      ( "BlockPublicAccessConfigurationMetadata",
        Some
          (block_public_access_configuration_metadata_to_yojson
             x.block_public_access_configuration_metadata) );
      ( "BlockPublicAccessConfiguration",
        Some (block_public_access_configuration_to_yojson x.block_public_access_configuration) );
    ]

let get_block_public_access_configuration_input_to_yojson = unit_to_yojson

let get_auto_termination_policy_output_to_yojson (x : get_auto_termination_policy_output) =
  assoc_to_yojson
    [
      ( "AutoTerminationPolicy",
        option_to_yojson auto_termination_policy_to_yojson x.auto_termination_policy );
    ]

let get_auto_termination_policy_input_to_yojson (x : get_auto_termination_policy_input) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]

let describe_studio_output_to_yojson (x : describe_studio_output) =
  assoc_to_yojson [ ("Studio", option_to_yojson studio_to_yojson x.studio) ]

let describe_studio_input_to_yojson (x : describe_studio_input) =
  assoc_to_yojson [ ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id)) ]

let describe_step_output_to_yojson (x : describe_step_output) =
  assoc_to_yojson [ ("Step", option_to_yojson step_to_yojson x.step) ]

let describe_step_input_to_yojson (x : describe_step_input) =
  assoc_to_yojson
    [
      ("StepId", Some (step_id_to_yojson x.step_id));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let describe_security_configuration_output_to_yojson (x : describe_security_configuration_output) =
  assoc_to_yojson
    [
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("SecurityConfiguration", option_to_yojson string__to_yojson x.security_configuration);
      ("Name", option_to_yojson xml_string_to_yojson x.name);
    ]

let describe_security_configuration_input_to_yojson (x : describe_security_configuration_input) =
  assoc_to_yojson [ ("Name", Some (xml_string_to_yojson x.name)) ]

let describe_release_label_output_to_yojson (x : describe_release_label_output) =
  assoc_to_yojson
    [
      ("AvailableOSReleases", option_to_yojson os_release_list_to_yojson x.available_os_releases);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Applications", option_to_yojson simplified_application_list_to_yojson x.applications);
      ("ReleaseLabel", option_to_yojson string__to_yojson x.release_label);
    ]

let describe_release_label_input_to_yojson (x : describe_release_label_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ReleaseLabel", option_to_yojson string__to_yojson x.release_label);
    ]

let describe_persistent_app_ui_output_to_yojson (x : describe_persistent_app_ui_output) =
  assoc_to_yojson
    [ ("PersistentAppUI", option_to_yojson persistent_app_u_i_to_yojson x.persistent_app_u_i) ]

let describe_persistent_app_ui_input_to_yojson (x : describe_persistent_app_ui_input) =
  assoc_to_yojson
    [ ("PersistentAppUIId", Some (xml_string_max_len256_to_yojson x.persistent_app_ui_id)) ]

let describe_notebook_execution_output_to_yojson (x : describe_notebook_execution_output) =
  assoc_to_yojson
    [ ("NotebookExecution", option_to_yojson notebook_execution_to_yojson x.notebook_execution) ]

let describe_notebook_execution_input_to_yojson (x : describe_notebook_execution_input) =
  assoc_to_yojson
    [ ("NotebookExecutionId", Some (xml_string_max_len256_to_yojson x.notebook_execution_id)) ]

let describe_job_flows_output_to_yojson (x : describe_job_flows_output) =
  assoc_to_yojson [ ("JobFlows", option_to_yojson job_flow_detail_list_to_yojson x.job_flows) ]

let describe_job_flows_input_to_yojson (x : describe_job_flows_input) =
  assoc_to_yojson
    [
      ("JobFlowStates", option_to_yojson job_flow_execution_state_list_to_yojson x.job_flow_states);
      ("JobFlowIds", option_to_yojson xml_string_list_to_yojson x.job_flow_ids);
      ("CreatedBefore", option_to_yojson date_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson date_to_yojson x.created_after);
    ]

let ec2_instance_attributes_to_yojson (x : ec2_instance_attributes) =
  assoc_to_yojson
    [
      ( "AdditionalSlaveSecurityGroups",
        option_to_yojson string_list_to_yojson x.additional_slave_security_groups );
      ( "AdditionalMasterSecurityGroups",
        option_to_yojson string_list_to_yojson x.additional_master_security_groups );
      ( "ServiceAccessSecurityGroup",
        option_to_yojson string__to_yojson x.service_access_security_group );
      ( "EmrManagedSlaveSecurityGroup",
        option_to_yojson string__to_yojson x.emr_managed_slave_security_group );
      ( "EmrManagedMasterSecurityGroup",
        option_to_yojson string__to_yojson x.emr_managed_master_security_group );
      ("IamInstanceProfile", option_to_yojson string__to_yojson x.iam_instance_profile);
      ( "RequestedEc2AvailabilityZones",
        option_to_yojson xml_string_max_len256_list_to_yojson x.requested_ec2_availability_zones );
      ("Ec2AvailabilityZone", option_to_yojson string__to_yojson x.ec2_availability_zone);
      ( "RequestedEc2SubnetIds",
        option_to_yojson xml_string_max_len256_list_to_yojson x.requested_ec2_subnet_ids );
      ("Ec2SubnetId", option_to_yojson string__to_yojson x.ec2_subnet_id);
      ("Ec2KeyName", option_to_yojson string__to_yojson x.ec2_key_name);
    ]

let cluster_to_yojson (x : cluster) =
  assoc_to_yojson
    [
      ("SessionEnabled", option_to_yojson boolean_object_to_yojson x.session_enabled);
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ("ExtendedSupport", option_to_yojson boolean_object_to_yojson x.extended_support);
      ("EbsRootVolumeThroughput", option_to_yojson integer_to_yojson x.ebs_root_volume_throughput);
      ("EbsRootVolumeIops", option_to_yojson integer_to_yojson x.ebs_root_volume_iops);
      ("OSReleaseLabel", option_to_yojson string__to_yojson x.os_release_label);
      ("PlacementGroups", option_to_yojson placement_group_config_list_to_yojson x.placement_groups);
      ("StepConcurrencyLevel", option_to_yojson integer_to_yojson x.step_concurrency_level);
      ("OutpostArn", option_to_yojson optional_arn_type_to_yojson x.outpost_arn);
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
      ("KerberosAttributes", option_to_yojson kerberos_attributes_to_yojson x.kerberos_attributes);
      ("RepoUpgradeOnBoot", option_to_yojson repo_upgrade_on_boot_to_yojson x.repo_upgrade_on_boot);
      ("EbsRootVolumeSize", option_to_yojson integer_to_yojson x.ebs_root_volume_size);
      ("CustomAmiId", option_to_yojson xml_string_max_len256_to_yojson x.custom_ami_id);
      ("ScaleDownBehavior", option_to_yojson scale_down_behavior_to_yojson x.scale_down_behavior);
      ("AutoScalingRole", option_to_yojson xml_string_to_yojson x.auto_scaling_role);
      ("SecurityConfiguration", option_to_yojson xml_string_to_yojson x.security_configuration);
      ("Configurations", option_to_yojson configuration_list_to_yojson x.configurations);
      ("MasterPublicDnsName", option_to_yojson string__to_yojson x.master_public_dns_name);
      ("NormalizedInstanceHours", option_to_yojson integer_to_yojson x.normalized_instance_hours);
      ("ServiceRole", option_to_yojson string__to_yojson x.service_role);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Applications", option_to_yojson application_list_to_yojson x.applications);
      ("VisibleToAllUsers", option_to_yojson boolean__to_yojson x.visible_to_all_users);
      ( "UnhealthyNodeReplacement",
        option_to_yojson boolean_object_to_yojson x.unhealthy_node_replacement );
      ("TerminationProtected", option_to_yojson boolean__to_yojson x.termination_protected);
      ("AutoTerminate", option_to_yojson boolean__to_yojson x.auto_terminate);
      ("ReleaseLabel", option_to_yojson string__to_yojson x.release_label);
      ("RunningAmiVersion", option_to_yojson string__to_yojson x.running_ami_version);
      ("RequestedAmiVersion", option_to_yojson string__to_yojson x.requested_ami_version);
      ("LogEncryptionKmsKeyId", option_to_yojson string__to_yojson x.log_encryption_kms_key_id);
      ("LogUri", option_to_yojson string__to_yojson x.log_uri);
      ( "InstanceCollectionType",
        option_to_yojson instance_collection_type_to_yojson x.instance_collection_type );
      ( "Ec2InstanceAttributes",
        option_to_yojson ec2_instance_attributes_to_yojson x.ec2_instance_attributes );
      ("Status", option_to_yojson cluster_status_to_yojson x.status);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Id", option_to_yojson cluster_id_to_yojson x.id);
    ]

let describe_cluster_output_to_yojson (x : describe_cluster_output) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let describe_cluster_input_to_yojson (x : describe_cluster_input) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]

let delete_studio_session_mapping_input_to_yojson (x : delete_studio_session_mapping_input) =
  assoc_to_yojson
    [
      ("IdentityType", Some (identity_type_to_yojson x.identity_type));
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id));
    ]

let delete_studio_input_to_yojson (x : delete_studio_input) =
  assoc_to_yojson [ ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id)) ]

let delete_security_configuration_output_to_yojson = unit_to_yojson

let delete_security_configuration_input_to_yojson (x : delete_security_configuration_input) =
  assoc_to_yojson [ ("Name", Some (xml_string_to_yojson x.name)) ]

let create_studio_session_mapping_input_to_yojson (x : create_studio_session_mapping_input) =
  assoc_to_yojson
    [
      ("SessionPolicyArn", Some (xml_string_max_len256_to_yojson x.session_policy_arn));
      ("IdentityType", Some (identity_type_to_yojson x.identity_type));
      ("IdentityName", option_to_yojson xml_string_max_len256_to_yojson x.identity_name);
      ("IdentityId", option_to_yojson xml_string_max_len256_to_yojson x.identity_id);
      ("StudioId", Some (xml_string_max_len256_to_yojson x.studio_id));
    ]

let create_studio_output_to_yojson (x : create_studio_output) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson xml_string_to_yojson x.url);
      ("StudioId", option_to_yojson xml_string_max_len256_to_yojson x.studio_id);
    ]

let create_studio_input_to_yojson (x : create_studio_input) =
  assoc_to_yojson
    [
      ("EncryptionKeyArn", option_to_yojson xml_string_to_yojson x.encryption_key_arn);
      ("IdcInstanceArn", option_to_yojson arn_type_to_yojson x.idc_instance_arn);
      ("IdcUserAssignment", option_to_yojson idc_user_assignment_to_yojson x.idc_user_assignment);
      ( "TrustedIdentityPropagationEnabled",
        option_to_yojson boolean_object_to_yojson x.trusted_identity_propagation_enabled );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "IdpRelayStateParameterName",
        option_to_yojson xml_string_max_len256_to_yojson x.idp_relay_state_parameter_name );
      ("IdpAuthUrl", option_to_yojson xml_string_to_yojson x.idp_auth_url);
      ("DefaultS3Location", Some (xml_string_to_yojson x.default_s3_location));
      ("EngineSecurityGroupId", Some (xml_string_max_len256_to_yojson x.engine_security_group_id));
      ( "WorkspaceSecurityGroupId",
        Some (xml_string_max_len256_to_yojson x.workspace_security_group_id) );
      ("UserRole", option_to_yojson xml_string_to_yojson x.user_role);
      ("ServiceRole", Some (xml_string_to_yojson x.service_role));
      ("SubnetIds", Some (subnet_id_list_to_yojson x.subnet_ids));
      ("VpcId", Some (xml_string_max_len256_to_yojson x.vpc_id));
      ("AuthMode", Some (auth_mode_to_yojson x.auth_mode));
      ("Description", option_to_yojson xml_string_max_len256_to_yojson x.description);
      ("Name", Some (xml_string_max_len256_to_yojson x.name));
    ]

let create_security_configuration_output_to_yojson (x : create_security_configuration_output) =
  assoc_to_yojson
    [
      ("CreationDateTime", Some (date_to_yojson x.creation_date_time));
      ("Name", Some (xml_string_to_yojson x.name));
    ]

let create_security_configuration_input_to_yojson (x : create_security_configuration_input) =
  assoc_to_yojson
    [
      ("SecurityConfiguration", Some (string__to_yojson x.security_configuration));
      ("Name", Some (xml_string_to_yojson x.name));
    ]

let create_persistent_app_ui_output_to_yojson (x : create_persistent_app_ui_output) =
  assoc_to_yojson
    [
      ( "RuntimeRoleEnabledCluster",
        option_to_yojson boolean__to_yojson x.runtime_role_enabled_cluster );
      ("PersistentAppUIId", option_to_yojson xml_string_max_len256_to_yojson x.persistent_app_ui_id);
    ]

let emr_containers_config_to_yojson (x : emr_containers_config) =
  assoc_to_yojson [ ("JobRunId", option_to_yojson xml_string_max_len256_to_yojson x.job_run_id) ]

let create_persistent_app_ui_input_to_yojson (x : create_persistent_app_ui_input) =
  assoc_to_yojson
    [
      ("ProfilerType", option_to_yojson profiler_type_to_yojson x.profiler_type);
      ("XReferer", option_to_yojson string__to_yojson x.x_referer);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "EMRContainersConfig",
        option_to_yojson emr_containers_config_to_yojson x.emr_containers_config );
      ("TargetResourceArn", Some (arn_type_to_yojson x.target_resource_arn));
    ]

let cancel_steps_request_status_to_yojson (x : cancel_steps_request_status) =
  match x with FAILED -> `String "FAILED" | SUBMITTED -> `String "SUBMITTED"

let cancel_steps_info_to_yojson (x : cancel_steps_info) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson string__to_yojson x.reason);
      ("Status", option_to_yojson cancel_steps_request_status_to_yojson x.status);
      ("StepId", option_to_yojson step_id_to_yojson x.step_id);
    ]

let cancel_steps_info_list_to_yojson tree = list_to_yojson cancel_steps_info_to_yojson tree

let cancel_steps_output_to_yojson (x : cancel_steps_output) =
  assoc_to_yojson
    [
      ( "CancelStepsInfoList",
        option_to_yojson cancel_steps_info_list_to_yojson x.cancel_steps_info_list );
    ]

let cancel_steps_input_to_yojson (x : cancel_steps_input) =
  assoc_to_yojson
    [
      ( "StepCancellationOption",
        option_to_yojson step_cancellation_option_to_yojson x.step_cancellation_option );
      ("StepIds", Some (step_ids_list_to_yojson x.step_ids));
      ("ClusterId", Some (xml_string_max_len256_to_yojson x.cluster_id));
    ]

let add_tags_output_to_yojson = unit_to_yojson

let add_tags_input_to_yojson (x : add_tags_input) =
  assoc_to_yojson
    [
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let add_job_flow_steps_output_to_yojson (x : add_job_flow_steps_output) =
  assoc_to_yojson [ ("StepIds", option_to_yojson step_ids_list_to_yojson x.step_ids) ]

let add_job_flow_steps_input_to_yojson (x : add_job_flow_steps_input) =
  assoc_to_yojson
    [
      ("ExecutionRoleArn", option_to_yojson arn_type_to_yojson x.execution_role_arn);
      ("Steps", Some (step_config_list_to_yojson x.steps));
      ("JobFlowId", Some (xml_string_max_len256_to_yojson x.job_flow_id));
    ]

let add_instance_groups_output_to_yojson (x : add_instance_groups_output) =
  assoc_to_yojson
    [
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
      ("InstanceGroupIds", option_to_yojson instance_group_ids_list_to_yojson x.instance_group_ids);
      ("JobFlowId", option_to_yojson xml_string_max_len256_to_yojson x.job_flow_id);
    ]

let add_instance_groups_input_to_yojson (x : add_instance_groups_input) =
  assoc_to_yojson
    [
      ("JobFlowId", Some (xml_string_max_len256_to_yojson x.job_flow_id));
      ("InstanceGroups", Some (instance_group_config_list_to_yojson x.instance_groups));
    ]

let add_instance_fleet_output_to_yojson (x : add_instance_fleet_output) =
  assoc_to_yojson
    [
      ("ClusterArn", option_to_yojson arn_type_to_yojson x.cluster_arn);
      ("InstanceFleetId", option_to_yojson instance_fleet_id_to_yojson x.instance_fleet_id);
      ("ClusterId", option_to_yojson xml_string_max_len256_to_yojson x.cluster_id);
    ]

let add_instance_fleet_input_to_yojson (x : add_instance_fleet_input) =
  assoc_to_yojson
    [
      ("InstanceFleet", Some (instance_fleet_config_to_yojson x.instance_fleet));
      ("ClusterId", Some (xml_string_max_len256_to_yojson x.cluster_id));
    ]
