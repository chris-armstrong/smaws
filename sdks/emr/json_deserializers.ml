open Smaws_Lib.Json.DeserializeHelpers
open Types

let xml_string_max_len256_of_yojson = string_of_yojson

let xml_string_max_len256_list_of_yojson tree path =
  list_of_yojson xml_string_max_len256_of_yojson tree path

let xml_string_of_yojson = string_of_yojson
let xml_string_list_of_yojson tree path = list_of_yojson xml_string_of_yojson tree path
let whole_number_of_yojson = int_of_yojson
let string__of_yojson = string_of_yojson
let integer_of_yojson = int_of_yojson
let throughput_val_of_yojson = int_of_yojson

let volume_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     throughput = option_of_yojson (value_for_key throughput_val_of_yojson "Throughput") _list path;
     size_in_g_b = value_for_key integer_of_yojson "SizeInGB" _list path;
     iops = option_of_yojson (value_for_key integer_of_yojson "Iops") _list path;
     volume_type = value_for_key string__of_yojson "VolumeType" _list path;
   }
    : volume_specification)

let utilization_performance_index_integer_of_yojson = int_of_yojson

let username_password_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Password") _list path;
     username =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Username") _list path;
   }
    : username_password)

let uri_string_of_yojson = string_of_yojson

let identity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GROUP" -> GROUP
    | `String "USER" -> USER
    | `String value -> raise (deserialize_unknown_enum_value_error path "IdentityType" value)
    | _ -> raise (deserialize_wrong_type_error path "IdentityType")
     : identity_type)
    : identity_type)

let update_studio_session_mapping_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_policy_arn =
       value_for_key xml_string_max_len256_of_yojson "SessionPolicyArn" _list path;
     identity_type = value_for_key identity_type_of_yojson "IdentityType" _list path;
     identity_name =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityName") _list path;
     identity_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityId") _list path;
     studio_id = value_for_key xml_string_max_len256_of_yojson "StudioId" _list path;
   }
    : update_studio_session_mapping_input)

let error_code_of_yojson = string_of_yojson
let error_message_of_yojson = string_of_yojson

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
   }
    : invalid_request_exception)

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let subnet_id_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let update_studio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_key_arn =
       option_of_yojson (value_for_key xml_string_of_yojson "EncryptionKeyArn") _list path;
     default_s3_location =
       option_of_yojson (value_for_key xml_string_of_yojson "DefaultS3Location") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_id_list_of_yojson "SubnetIds") _list path;
     description =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Name") _list path;
     studio_id = value_for_key xml_string_max_len256_of_yojson "StudioId" _list path;
   }
    : update_studio_input)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_server_exception)

let unit__of_yojson (tree : t) path =
  ((match tree with
    | `String "COUNT_PER_SECOND" -> COUNT_PER_SECOND
    | `String "TERA_BITS_PER_SECOND" -> TERA_BITS_PER_SECOND
    | `String "GIGA_BITS_PER_SECOND" -> GIGA_BITS_PER_SECOND
    | `String "MEGA_BITS_PER_SECOND" -> MEGA_BITS_PER_SECOND
    | `String "KILO_BITS_PER_SECOND" -> KILO_BITS_PER_SECOND
    | `String "BITS_PER_SECOND" -> BITS_PER_SECOND
    | `String "TERA_BYTES_PER_SECOND" -> TERA_BYTES_PER_SECOND
    | `String "GIGA_BYTES_PER_SECOND" -> GIGA_BYTES_PER_SECOND
    | `String "MEGA_BYTES_PER_SECOND" -> MEGA_BYTES_PER_SECOND
    | `String "KILO_BYTES_PER_SECOND" -> KILO_BYTES_PER_SECOND
    | `String "BYTES_PER_SECOND" -> BYTES_PER_SECOND
    | `String "COUNT" -> COUNT
    | `String "PERCENT" -> PERCENT
    | `String "TERA_BITS" -> TERA_BITS
    | `String "GIGA_BITS" -> GIGA_BITS
    | `String "MEGA_BITS" -> MEGA_BITS
    | `String "KILO_BITS" -> KILO_BITS
    | `String "BITS" -> BITS
    | `String "TERA_BYTES" -> TERA_BYTES
    | `String "GIGA_BYTES" -> GIGA_BYTES
    | `String "MEGA_BYTES" -> MEGA_BYTES
    | `String "KILO_BYTES" -> KILO_BYTES
    | `String "BYTES" -> BYTES
    | `String "MILLI_SECONDS" -> MILLI_SECONDS
    | `String "MICRO_SECONDS" -> MICRO_SECONDS
    | `String "SECONDS" -> SECONDS
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Unit" value)
    | _ -> raise (deserialize_wrong_type_error path "Unit")
     : unit_)
    : unit_)

let cluster_id_of_yojson = string_of_yojson
let session_id_of_yojson = string_of_yojson

let session_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "TERMINATED" -> TERMINATED
    | `String "TERMINATING" -> TERMINATING
    | `String "BUSY" -> BUSY
    | `String "IDLE" -> IDLE
    | `String "STARTED" -> STARTED
    | `String "STARTING" -> STARTING
    | `String "SUBMITTED" -> SUBMITTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionState" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionState")
     : session_state)
    : session_state)

let terminate_session_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = value_for_key session_state_of_yojson "State" _list path;
     session_id = value_for_key session_id_of_yojson "SessionId" _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : terminate_session_output)

let terminate_session_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = value_for_key session_id_of_yojson "SessionId" _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : terminate_session_input)

let terminate_job_flows_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_flow_ids = value_for_key xml_string_list_of_yojson "JobFlowIds" _list path }
    : terminate_job_flows_input)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let supported_products_list_of_yojson tree path =
  list_of_yojson xml_string_max_len256_of_yojson tree path

let supported_product_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     args = option_of_yojson (value_for_key xml_string_list_of_yojson "Args") _list path;
     name = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Name") _list path;
   }
    : supported_product_config)

let float__of_yojson = float_of_yojson
let boolean__of_yojson = bool_of_yojson

let supported_instance_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     architecture = option_of_yojson (value_for_key string__of_yojson "Architecture") _list path;
     ebs_storage_only =
       option_of_yojson (value_for_key boolean__of_yojson "EbsStorageOnly") _list path;
     number_of_disks = option_of_yojson (value_for_key integer_of_yojson "NumberOfDisks") _list path;
     ebs_optimized_by_default =
       option_of_yojson (value_for_key boolean__of_yojson "EbsOptimizedByDefault") _list path;
     ebs_optimized_available =
       option_of_yojson (value_for_key boolean__of_yojson "EbsOptimizedAvailable") _list path;
     instance_family_id =
       option_of_yojson (value_for_key string__of_yojson "InstanceFamilyId") _list path;
     is64_bits_only = option_of_yojson (value_for_key boolean__of_yojson "Is64BitsOnly") _list path;
     vcp_u = option_of_yojson (value_for_key integer_of_yojson "VCPU") _list path;
     storage_g_b = option_of_yojson (value_for_key integer_of_yojson "StorageGB") _list path;
     memory_g_b = option_of_yojson (value_for_key float__of_yojson "MemoryGB") _list path;
     type_ = option_of_yojson (value_for_key string__of_yojson "Type") _list path;
   }
    : supported_instance_type)

let supported_instance_types_list_of_yojson tree path =
  list_of_yojson supported_instance_type_of_yojson tree path

let auth_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "IAM" -> IAM
    | `String "SSO" -> SSO
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuthMode" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthMode")
     : auth_mode)
    : auth_mode)

let date_of_yojson = timestamp_epoch_seconds_of_yojson

let studio_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     auth_mode = option_of_yojson (value_for_key auth_mode_of_yojson "AuthMode") _list path;
     url = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Url") _list path;
     description =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Description") _list path;
     vpc_id = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "VpcId") _list path;
     name = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Name") _list path;
     studio_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "StudioId") _list path;
   }
    : studio_summary)

let studio_summary_list_of_yojson tree path = list_of_yojson studio_summary_of_yojson tree path
let arn_type_of_yojson = string_of_yojson
let boolean_object_of_yojson = bool_of_yojson

let idc_user_assignment_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPTIONAL" -> OPTIONAL
    | `String "REQUIRED" -> REQUIRED
    | `String value -> raise (deserialize_unknown_enum_value_error path "IdcUserAssignment" value)
    | _ -> raise (deserialize_wrong_type_error path "IdcUserAssignment")
     : idc_user_assignment)
    : idc_user_assignment)

let studio_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_key_arn =
       option_of_yojson (value_for_key xml_string_of_yojson "EncryptionKeyArn") _list path;
     idc_user_assignment =
       option_of_yojson (value_for_key idc_user_assignment_of_yojson "IdcUserAssignment") _list path;
     trusted_identity_propagation_enabled =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "TrustedIdentityPropagationEnabled")
         _list path;
     idc_instance_arn =
       option_of_yojson (value_for_key arn_type_of_yojson "IdcInstanceArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     idp_relay_state_parameter_name =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "IdpRelayStateParameterName")
         _list path;
     idp_auth_url = option_of_yojson (value_for_key xml_string_of_yojson "IdpAuthUrl") _list path;
     default_s3_location =
       option_of_yojson (value_for_key xml_string_of_yojson "DefaultS3Location") _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     url = option_of_yojson (value_for_key xml_string_of_yojson "Url") _list path;
     engine_security_group_id =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "EngineSecurityGroupId")
         _list path;
     workspace_security_group_id =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "WorkspaceSecurityGroupId")
         _list path;
     user_role = option_of_yojson (value_for_key xml_string_of_yojson "UserRole") _list path;
     service_role = option_of_yojson (value_for_key xml_string_of_yojson "ServiceRole") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_id_list_of_yojson "SubnetIds") _list path;
     vpc_id = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "VpcId") _list path;
     auth_mode = option_of_yojson (value_for_key auth_mode_of_yojson "AuthMode") _list path;
     description =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Name") _list path;
     studio_arn =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "StudioArn") _list path;
     studio_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "StudioId") _list path;
   }
    : studio)

let string_map_of_yojson tree path = map_of_yojson string__of_yojson string__of_yojson tree path
let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let stop_notebook_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notebook_execution_id =
       value_for_key xml_string_max_len256_of_yojson "NotebookExecutionId" _list path;
   }
    : stop_notebook_execution_input)

let step_timeline_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_date_time = option_of_yojson (value_for_key date_of_yojson "EndDateTime") _list path;
     start_date_time = option_of_yojson (value_for_key date_of_yojson "StartDateTime") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationDateTime") _list path;
   }
    : step_timeline)

let step_id_of_yojson = string_of_yojson

let hadoop_step_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     args = option_of_yojson (value_for_key string_list_of_yojson "Args") _list path;
     main_class = option_of_yojson (value_for_key string__of_yojson "MainClass") _list path;
     properties = option_of_yojson (value_for_key string_map_of_yojson "Properties") _list path;
     jar = option_of_yojson (value_for_key string__of_yojson "Jar") _list path;
   }
    : hadoop_step_config)

let action_on_failure_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTINUE" -> CONTINUE
    | `String "CANCEL_AND_WAIT" -> CANCEL_AND_WAIT
    | `String "TERMINATE_CLUSTER" -> TERMINATE_CLUSTER
    | `String "TERMINATE_JOB_FLOW" -> TERMINATE_JOB_FLOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionOnFailure" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionOnFailure")
     : action_on_failure)
    : action_on_failure)

let step_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERRUPTED" -> INTERRUPTED
    | `String "FAILED" -> FAILED
    | `String "CANCELLED" -> CANCELLED
    | `String "COMPLETED" -> COMPLETED
    | `String "RUNNING" -> RUNNING
    | `String "CANCEL_PENDING" -> CANCEL_PENDING
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "StepState" value)
    | _ -> raise (deserialize_wrong_type_error path "StepState")
     : step_state)
    : step_state)

let step_state_change_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StepStateChangeReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "StepStateChangeReasonCode")
     : step_state_change_reason_code)
    : step_state_change_reason_code)

let step_state_change_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code =
       option_of_yojson (value_for_key step_state_change_reason_code_of_yojson "Code") _list path;
   }
    : step_state_change_reason)

let failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_file = option_of_yojson (value_for_key string__of_yojson "LogFile") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
   }
    : failure_details)

let step_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeline = option_of_yojson (value_for_key step_timeline_of_yojson "Timeline") _list path;
     failure_details =
       option_of_yojson (value_for_key failure_details_of_yojson "FailureDetails") _list path;
     state_change_reason =
       option_of_yojson
         (value_for_key step_state_change_reason_of_yojson "StateChangeReason")
         _list path;
     state = option_of_yojson (value_for_key step_state_of_yojson "State") _list path;
   }
    : step_status)

let step_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_key_arn =
       option_of_yojson (value_for_key string__of_yojson "EncryptionKeyArn") _list path;
     log_uri = option_of_yojson (value_for_key string__of_yojson "LogUri") _list path;
     status = option_of_yojson (value_for_key step_status_of_yojson "Status") _list path;
     action_on_failure =
       option_of_yojson (value_for_key action_on_failure_of_yojson "ActionOnFailure") _list path;
     config = option_of_yojson (value_for_key hadoop_step_config_of_yojson "Config") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key step_id_of_yojson "Id") _list path;
   }
    : step_summary)

let step_summary_list_of_yojson tree path = list_of_yojson step_summary_of_yojson tree path
let step_state_list_of_yojson tree path = list_of_yojson step_state_of_yojson tree path

let s3_monitoring_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_key_arn =
       option_of_yojson (value_for_key xml_string_of_yojson "EncryptionKeyArn") _list path;
     log_uri = option_of_yojson (value_for_key xml_string_of_yojson "LogUri") _list path;
   }
    : s3_monitoring_configuration)

let step_monitoring_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_monitoring_configuration =
       option_of_yojson
         (value_for_key s3_monitoring_configuration_of_yojson "S3MonitoringConfiguration")
         _list path;
   }
    : step_monitoring_configuration)

let step_ids_list_of_yojson tree path = list_of_yojson xml_string_max_len256_of_yojson tree path

let step_execution_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERRUPTED" -> INTERRUPTED
    | `String "FAILED" -> FAILED
    | `String "CANCELLED" -> CANCELLED
    | `String "COMPLETED" -> COMPLETED
    | `String "CONTINUE" -> CONTINUE
    | `String "RUNNING" -> RUNNING
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "StepExecutionState" value)
    | _ -> raise (deserialize_wrong_type_error path "StepExecutionState")
     : step_execution_state)
    : step_execution_state)

let step_execution_status_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_state_change_reason =
       option_of_yojson (value_for_key xml_string_of_yojson "LastStateChangeReason") _list path;
     end_date_time = option_of_yojson (value_for_key date_of_yojson "EndDateTime") _list path;
     start_date_time = option_of_yojson (value_for_key date_of_yojson "StartDateTime") _list path;
     creation_date_time = value_for_key date_of_yojson "CreationDateTime" _list path;
     state = value_for_key step_execution_state_of_yojson "State" _list path;
   }
    : step_execution_status_detail)

let key_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key xml_string_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key xml_string_of_yojson "Key") _list path;
   }
    : key_value)

let key_value_list_of_yojson tree path = list_of_yojson key_value_of_yojson tree path

let hadoop_jar_step_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     args = option_of_yojson (value_for_key xml_string_list_of_yojson "Args") _list path;
     main_class = option_of_yojson (value_for_key xml_string_of_yojson "MainClass") _list path;
     jar = value_for_key xml_string_of_yojson "Jar" _list path;
     properties = option_of_yojson (value_for_key key_value_list_of_yojson "Properties") _list path;
   }
    : hadoop_jar_step_config)

let step_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     step_monitoring_configuration =
       option_of_yojson
         (value_for_key step_monitoring_configuration_of_yojson "StepMonitoringConfiguration")
         _list path;
     hadoop_jar_step = value_for_key hadoop_jar_step_config_of_yojson "HadoopJarStep" _list path;
     action_on_failure =
       option_of_yojson (value_for_key action_on_failure_of_yojson "ActionOnFailure") _list path;
     name = value_for_key xml_string_max_len256_of_yojson "Name" _list path;
   }
    : step_config)

let step_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_status_detail =
       value_for_key step_execution_status_detail_of_yojson "ExecutionStatusDetail" _list path;
     step_config = value_for_key step_config_of_yojson "StepConfig" _list path;
   }
    : step_detail)

let step_detail_list_of_yojson tree path = list_of_yojson step_detail_of_yojson tree path
let step_config_list_of_yojson tree path = list_of_yojson step_config_of_yojson tree path

let step_cancellation_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "TERMINATE_PROCESS" -> TERMINATE_PROCESS
    | `String "SEND_INTERRUPT" -> SEND_INTERRUPT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StepCancellationOption" value)
    | _ -> raise (deserialize_wrong_type_error path "StepCancellationOption")
     : step_cancellation_option)
    : step_cancellation_option)

let optional_arn_type_of_yojson = string_of_yojson

let step_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_key_arn =
       option_of_yojson (value_for_key string__of_yojson "EncryptionKeyArn") _list path;
     log_uri = option_of_yojson (value_for_key string__of_yojson "LogUri") _list path;
     execution_role_arn =
       option_of_yojson (value_for_key optional_arn_type_of_yojson "ExecutionRoleArn") _list path;
     status = option_of_yojson (value_for_key step_status_of_yojson "Status") _list path;
     action_on_failure =
       option_of_yojson (value_for_key action_on_failure_of_yojson "ActionOnFailure") _list path;
     config = option_of_yojson (value_for_key hadoop_step_config_of_yojson "Config") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key step_id_of_yojson "Id") _list path;
   }
    : step)

let statistic_of_yojson (tree : t) path =
  ((match tree with
    | `String "MAXIMUM" -> MAXIMUM
    | `String "MINIMUM" -> MINIMUM
    | `String "SUM" -> SUM
    | `String "AVERAGE" -> AVERAGE
    | `String "SAMPLE_COUNT" -> SAMPLE_COUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "Statistic" value)
    | _ -> raise (deserialize_wrong_type_error path "Statistic")
     : statistic)
    : statistic)

let start_session_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key session_state_of_yojson "State") _list path;
     account_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "AccountId") _list path;
     arn = option_of_yojson (value_for_key arn_type_of_yojson "Arn") _list path;
     cluster_id = option_of_yojson (value_for_key cluster_id_of_yojson "ClusterId") _list path;
     id = value_for_key session_id_of_yojson "Id" _list path;
   }
    : start_session_output)

let iam_role_arn_of_yojson = string_of_yojson

let rec configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties = option_of_yojson (value_for_key string_map_of_yojson "Properties") _list path;
     configurations =
       option_of_yojson (value_for_key configuration_list_of_yojson "Configurations") _list path;
     classification = option_of_yojson (value_for_key string__of_yojson "Classification") _list path;
   }
    : configuration)

and configuration_list_of_yojson tree path = list_of_yojson configuration_of_yojson tree path

let log_types_map_of_yojson tree path =
  map_of_yojson xml_string_of_yojson xml_string_list_of_yojson tree path

let session_cloud_watch_logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_types = option_of_yojson (value_for_key log_types_map_of_yojson "LogTypes") _list path;
     encryption_key_arn =
       option_of_yojson (value_for_key xml_string_of_yojson "EncryptionKeyArn") _list path;
     log_stream_name_prefix =
       option_of_yojson (value_for_key xml_string_of_yojson "LogStreamNamePrefix") _list path;
     log_group = option_of_yojson (value_for_key xml_string_of_yojson "LogGroup") _list path;
     enabled = option_of_yojson (value_for_key boolean__of_yojson "Enabled") _list path;
   }
    : session_cloud_watch_logging_configuration)

let session_managed_logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_key_arn =
       option_of_yojson (value_for_key xml_string_of_yojson "EncryptionKeyArn") _list path;
     enabled = option_of_yojson (value_for_key boolean__of_yojson "Enabled") _list path;
   }
    : session_managed_logging_configuration)

let session_s3_logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_types = option_of_yojson (value_for_key log_types_map_of_yojson "LogTypes") _list path;
     encryption_key_arn =
       option_of_yojson (value_for_key xml_string_of_yojson "EncryptionKeyArn") _list path;
     log_uri = option_of_yojson (value_for_key xml_string_of_yojson "LogUri") _list path;
     enabled = option_of_yojson (value_for_key boolean__of_yojson "Enabled") _list path;
   }
    : session_s3_logging_configuration)

let session_monitoring_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_logging_configuration =
       option_of_yojson
         (value_for_key session_s3_logging_configuration_of_yojson "S3LoggingConfiguration")
         _list path;
     managed_logging_configuration =
       option_of_yojson
         (value_for_key session_managed_logging_configuration_of_yojson
            "ManagedLoggingConfiguration")
         _list path;
     cloud_watch_logging_configuration =
       option_of_yojson
         (value_for_key session_cloud_watch_logging_configuration_of_yojson
            "CloudWatchLoggingConfiguration")
         _list path;
   }
    : session_monitoring_configuration)

let long_of_yojson = long_of_yojson
let client_request_token_of_yojson = string_of_yojson

let start_session_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     session_idle_timeout_in_minutes =
       option_of_yojson (value_for_key long_of_yojson "SessionIdleTimeoutInMinutes") _list path;
     monitoring_configuration =
       option_of_yojson
         (value_for_key session_monitoring_configuration_of_yojson "MonitoringConfiguration")
         _list path;
     engine_configurations =
       option_of_yojson
         (value_for_key configuration_list_of_yojson "EngineConfigurations")
         _list path;
     execution_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "ExecutionRoleArn") _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
     name = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Name") _list path;
   }
    : start_session_input)

let start_notebook_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notebook_execution_id =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "NotebookExecutionId")
         _list path;
   }
    : start_notebook_execution_output)

let execution_engine_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EMR" -> EMR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionEngineType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionEngineType")
     : execution_engine_type)
    : execution_engine_type)

let execution_engine_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "ExecutionRoleArn") _list path;
     master_instance_security_group_id =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "MasterInstanceSecurityGroupId")
         _list path;
     type_ = option_of_yojson (value_for_key execution_engine_type_of_yojson "Type") _list path;
     id = value_for_key xml_string_max_len256_of_yojson "Id" _list path;
   }
    : execution_engine_config)

let notebook_s3_location_from_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key uri_string_of_yojson "Key") _list path;
     bucket = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Bucket") _list path;
   }
    : notebook_s3_location_from_input)

let output_notebook_s3_location_from_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key uri_string_of_yojson "Key") _list path;
     bucket = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Bucket") _list path;
   }
    : output_notebook_s3_location_from_input)

let output_notebook_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "HTML" -> HTML
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OutputNotebookFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "OutputNotebookFormat")
     : output_notebook_format)
    : output_notebook_format)

let environment_variables_map_of_yojson tree path =
  map_of_yojson xml_string_max_len256_of_yojson xml_string_of_yojson tree path

let start_notebook_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_variables =
       option_of_yojson
         (value_for_key environment_variables_map_of_yojson "EnvironmentVariables")
         _list path;
     output_notebook_format =
       option_of_yojson
         (value_for_key output_notebook_format_of_yojson "OutputNotebookFormat")
         _list path;
     output_notebook_s3_location =
       option_of_yojson
         (value_for_key output_notebook_s3_location_from_input_of_yojson "OutputNotebookS3Location")
         _list path;
     notebook_s3_location =
       option_of_yojson
         (value_for_key notebook_s3_location_from_input_of_yojson "NotebookS3Location")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     notebook_instance_security_group_id =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "NotebookInstanceSecurityGroupId")
         _list path;
     service_role = value_for_key xml_string_of_yojson "ServiceRole" _list path;
     execution_engine = value_for_key execution_engine_config_of_yojson "ExecutionEngine" _list path;
     notebook_params =
       option_of_yojson (value_for_key xml_string_of_yojson "NotebookParams") _list path;
     notebook_execution_name =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "NotebookExecutionName")
         _list path;
     relative_path = option_of_yojson (value_for_key xml_string_of_yojson "RelativePath") _list path;
     editor_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "EditorId") _list path;
   }
    : start_notebook_execution_input)

let spot_provisioning_allocation_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "capacity-optimized-prioritized" -> CAPACITY_OPTIMIZED_PRIORITIZED
    | `String "diversified" -> DIVERSIFIED
    | `String "lowest-price" -> LOWEST_PRICE
    | `String "price-capacity-optimized" -> PRICE_CAPACITY_OPTIMIZED
    | `String "capacity-optimized" -> CAPACITY_OPTIMIZED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SpotProvisioningAllocationStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "SpotProvisioningAllocationStrategy")
     : spot_provisioning_allocation_strategy)
    : spot_provisioning_allocation_strategy)

let spot_resizing_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allocation_strategy =
       option_of_yojson
         (value_for_key spot_provisioning_allocation_strategy_of_yojson "AllocationStrategy")
         _list path;
     timeout_duration_minutes =
       option_of_yojson (value_for_key whole_number_of_yojson "TimeoutDurationMinutes") _list path;
   }
    : spot_resizing_specification)

let spot_provisioning_timeout_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "TERMINATE_CLUSTER" -> TERMINATE_CLUSTER
    | `String "SWITCH_TO_ON_DEMAND" -> SWITCH_TO_ON_DEMAND
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SpotProvisioningTimeoutAction" value)
    | _ -> raise (deserialize_wrong_type_error path "SpotProvisioningTimeoutAction")
     : spot_provisioning_timeout_action)
    : spot_provisioning_timeout_action)

let spot_provisioning_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allocation_strategy =
       option_of_yojson
         (value_for_key spot_provisioning_allocation_strategy_of_yojson "AllocationStrategy")
         _list path;
     block_duration_minutes =
       option_of_yojson (value_for_key whole_number_of_yojson "BlockDurationMinutes") _list path;
     timeout_action =
       value_for_key spot_provisioning_timeout_action_of_yojson "TimeoutAction" _list path;
     timeout_duration_minutes =
       value_for_key whole_number_of_yojson "TimeoutDurationMinutes" _list path;
   }
    : spot_provisioning_specification)

let simplified_application_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : simplified_application)

let simplified_application_list_of_yojson tree path =
  list_of_yojson simplified_application_of_yojson tree path

let adjustment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXACT_CAPACITY" -> EXACT_CAPACITY
    | `String "PERCENT_CHANGE_IN_CAPACITY" -> PERCENT_CHANGE_IN_CAPACITY
    | `String "CHANGE_IN_CAPACITY" -> CHANGE_IN_CAPACITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "AdjustmentType" value)
    | _ -> raise (deserialize_wrong_type_error path "AdjustmentType")
     : adjustment_type)
    : adjustment_type)

let simple_scaling_policy_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cool_down = option_of_yojson (value_for_key integer_of_yojson "CoolDown") _list path;
     scaling_adjustment = value_for_key integer_of_yojson "ScalingAdjustment" _list path;
     adjustment_type =
       option_of_yojson (value_for_key adjustment_type_of_yojson "AdjustmentType") _list path;
   }
    : simple_scaling_policy_configuration)

let instance_id_of_yojson = string_of_yojson
let ec2_instance_ids_list_of_yojson tree path = list_of_yojson instance_id_of_yojson tree path

let instance_resize_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_termination_timeout =
       option_of_yojson (value_for_key integer_of_yojson "InstanceTerminationTimeout") _list path;
     instances_to_protect =
       option_of_yojson
         (value_for_key ec2_instance_ids_list_of_yojson "InstancesToProtect")
         _list path;
     instances_to_terminate =
       option_of_yojson
         (value_for_key ec2_instance_ids_list_of_yojson "InstancesToTerminate")
         _list path;
   }
    : instance_resize_policy)

let shrink_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_resize_policy =
       option_of_yojson
         (value_for_key instance_resize_policy_of_yojson "InstanceResizePolicy")
         _list path;
     decommission_timeout =
       option_of_yojson (value_for_key integer_of_yojson "DecommissionTimeout") _list path;
   }
    : shrink_policy)

let set_visible_to_all_users_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     visible_to_all_users = value_for_key boolean__of_yojson "VisibleToAllUsers" _list path;
     job_flow_ids = value_for_key xml_string_list_of_yojson "JobFlowIds" _list path;
   }
    : set_visible_to_all_users_input)

let set_unhealthy_node_replacement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unhealthy_node_replacement =
       value_for_key boolean_object_of_yojson "UnhealthyNodeReplacement" _list path;
     job_flow_ids = value_for_key xml_string_list_of_yojson "JobFlowIds" _list path;
   }
    : set_unhealthy_node_replacement_input)

let set_termination_protection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     termination_protected = value_for_key boolean__of_yojson "TerminationProtected" _list path;
     job_flow_ids = value_for_key xml_string_list_of_yojson "JobFlowIds" _list path;
   }
    : set_termination_protection_input)

let set_keep_job_flow_alive_when_no_steps_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     keep_job_flow_alive_when_no_steps =
       value_for_key boolean__of_yojson "KeepJobFlowAliveWhenNoSteps" _list path;
     job_flow_ids = value_for_key xml_string_list_of_yojson "JobFlowIds" _list path;
   }
    : set_keep_job_flow_alive_when_no_steps_input)

let session_state_list_of_yojson tree path = list_of_yojson session_state_of_yojson tree path

let session_mapping_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     session_policy_arn =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "SessionPolicyArn")
         _list path;
     identity_type =
       option_of_yojson (value_for_key identity_type_of_yojson "IdentityType") _list path;
     identity_name =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityName") _list path;
     identity_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityId") _list path;
     studio_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "StudioId") _list path;
   }
    : session_mapping_summary)

let session_mapping_summary_list_of_yojson tree path =
  list_of_yojson session_mapping_summary_of_yojson tree path

let session_mapping_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key date_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     session_policy_arn =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "SessionPolicyArn")
         _list path;
     identity_type =
       option_of_yojson (value_for_key identity_type_of_yojson "IdentityType") _list path;
     identity_name =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityName") _list path;
     identity_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityId") _list path;
     studio_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "StudioId") _list path;
   }
    : session_mapping_detail)

let certificate_authority_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_data =
       option_of_yojson (value_for_key xml_string_of_yojson "CertificateData") _list path;
     certificate_arn =
       option_of_yojson (value_for_key xml_string_of_yojson "CertificateArn") _list path;
   }
    : certificate_authority)

let session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     server_url = option_of_yojson (value_for_key xml_string_of_yojson "ServerUrl") _list path;
     certificate_authority =
       option_of_yojson
         (value_for_key certificate_authority_of_yojson "CertificateAuthority")
         _list path;
     session_idle_timeout_in_minutes =
       option_of_yojson (value_for_key long_of_yojson "SessionIdleTimeoutInMinutes") _list path;
     monitoring_configuration =
       option_of_yojson
         (value_for_key session_monitoring_configuration_of_yojson "MonitoringConfiguration")
         _list path;
     engine_configurations =
       option_of_yojson
         (value_for_key configuration_list_of_yojson "EngineConfigurations")
         _list path;
     idle_since = option_of_yojson (value_for_key date_of_yojson "IdleSince") _list path;
     ended_at = option_of_yojson (value_for_key date_of_yojson "EndedAt") _list path;
     started_at = option_of_yojson (value_for_key date_of_yojson "StartedAt") _list path;
     updated_at = option_of_yojson (value_for_key date_of_yojson "UpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key date_of_yojson "CreatedAt") _list path;
     account_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "AccountId") _list path;
     execution_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "ExecutionRoleArn") _list path;
     release_label =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "ReleaseLabel") _list path;
     state_change_reason =
       option_of_yojson (value_for_key xml_string_of_yojson "StateChangeReason") _list path;
     state = value_for_key session_state_of_yojson "State" _list path;
     arn = value_for_key arn_type_of_yojson "Arn" _list path;
     name = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Name") _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
     id = value_for_key session_id_of_yojson "Id" _list path;
   }
    : session)

let session_list_of_yojson tree path = list_of_yojson session_of_yojson tree path
let sensitive_string_of_yojson = string_of_yojson

let security_groups_list_of_yojson tree path =
  list_of_yojson xml_string_max_len256_of_yojson tree path

let security_configuration_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationDateTime") _list path;
     name = option_of_yojson (value_for_key xml_string_of_yojson "Name") _list path;
   }
    : security_configuration_summary)

let security_configuration_list_of_yojson tree path =
  list_of_yojson security_configuration_summary_of_yojson tree path

let script_bootstrap_action_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     args = option_of_yojson (value_for_key xml_string_list_of_yojson "Args") _list path;
     path = value_for_key xml_string_of_yojson "Path" _list path;
   }
    : script_bootstrap_action_config)

let comparison_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "LESS_THAN_OR_EQUAL" -> LESS_THAN_OR_EQUAL
    | `String "LESS_THAN" -> LESS_THAN
    | `String "GREATER_THAN" -> GREATER_THAN
    | `String "GREATER_THAN_OR_EQUAL" -> GREATER_THAN_OR_EQUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")
     : comparison_operator)
    : comparison_operator)

let non_negative_double_of_yojson = double_of_yojson

let metric_dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
   }
    : metric_dimension)

let metric_dimension_list_of_yojson tree path = list_of_yojson metric_dimension_of_yojson tree path

let cloud_watch_alarm_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimensions =
       option_of_yojson (value_for_key metric_dimension_list_of_yojson "Dimensions") _list path;
     unit_ = option_of_yojson (value_for_key unit__of_yojson "Unit") _list path;
     threshold = value_for_key non_negative_double_of_yojson "Threshold" _list path;
     statistic = option_of_yojson (value_for_key statistic_of_yojson "Statistic") _list path;
     period = value_for_key integer_of_yojson "Period" _list path;
     namespace = option_of_yojson (value_for_key string__of_yojson "Namespace") _list path;
     metric_name = value_for_key string__of_yojson "MetricName" _list path;
     evaluation_periods =
       option_of_yojson (value_for_key integer_of_yojson "EvaluationPeriods") _list path;
     comparison_operator =
       value_for_key comparison_operator_of_yojson "ComparisonOperator" _list path;
   }
    : cloud_watch_alarm_definition)

let scaling_trigger_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_alarm_definition =
       value_for_key cloud_watch_alarm_definition_of_yojson "CloudWatchAlarmDefinition" _list path;
   }
    : scaling_trigger)

let scaling_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "ADVANCED" -> ADVANCED
    | `String "DEFAULT" -> DEFAULT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScalingStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalingStrategy")
     : scaling_strategy)
    : scaling_strategy)

let market_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SPOT" -> SPOT
    | `String "ON_DEMAND" -> ON_DEMAND
    | `String value -> raise (deserialize_unknown_enum_value_error path "MarketType" value)
    | _ -> raise (deserialize_wrong_type_error path "MarketType")
     : market_type)
    : market_type)

let scaling_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     simple_scaling_policy_configuration =
       value_for_key simple_scaling_policy_configuration_of_yojson
         "SimpleScalingPolicyConfiguration" _list path;
     market = option_of_yojson (value_for_key market_type_of_yojson "Market") _list path;
   }
    : scaling_action)

let scaling_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trigger = value_for_key scaling_trigger_of_yojson "Trigger" _list path;
     action = value_for_key scaling_action_of_yojson "Action" _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : scaling_rule)

let scaling_rule_list_of_yojson tree path = list_of_yojson scaling_rule_of_yojson tree path

let scaling_constraints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_capacity = value_for_key integer_of_yojson "MaxCapacity" _list path;
     min_capacity = value_for_key integer_of_yojson "MinCapacity" _list path;
   }
    : scaling_constraints)

let scale_down_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "TERMINATE_AT_TASK_COMPLETION" -> TERMINATE_AT_TASK_COMPLETION
    | `String "TERMINATE_AT_INSTANCE_HOUR" -> TERMINATE_AT_INSTANCE_HOUR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScaleDownBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "ScaleDownBehavior")
     : scale_down_behavior)
    : scale_down_behavior)

let log_upload_policy_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "disabled" -> DISABLED
    | `String "on-customer-s3only" -> ON_CUSTOMER_S3ONLY
    | `String "emr-managed" -> EMR_MANAGED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LogUploadPolicyValue" value)
    | _ -> raise (deserialize_wrong_type_error path "LogUploadPolicyValue")
     : log_upload_policy_value)
    : log_upload_policy_value)

let log_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "persistent-ui-logs" -> PERSISTENT_UI_LOGS
    | `String "application-logs" -> APPLICATION_LOGS
    | `String "system-logs" -> SYSTEM_LOGS
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogType" value)
    | _ -> raise (deserialize_wrong_type_error path "LogType")
     : log_type)
    : log_type)

let log_type_map_of_yojson tree path =
  map_of_yojson log_type_of_yojson log_upload_policy_value_of_yojson tree path

let s3_logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_type_upload_policy =
       option_of_yojson (value_for_key log_type_map_of_yojson "LogTypeUploadPolicy") _list path;
   }
    : s3_logging_configuration)

let run_job_flow_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_arn = option_of_yojson (value_for_key arn_type_of_yojson "ClusterArn") _list path;
     job_flow_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "JobFlowId") _list path;
   }
    : run_job_flow_output)

let instance_type_of_yojson = string_of_yojson

let instance_role_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TASK" -> TASK
    | `String "CORE" -> CORE
    | `String "MASTER" -> MASTER
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceRoleType" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceRoleType")
     : instance_role_type)
    : instance_role_type)

let ebs_block_device_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volumes_per_instance =
       option_of_yojson (value_for_key integer_of_yojson "VolumesPerInstance") _list path;
     volume_specification =
       value_for_key volume_specification_of_yojson "VolumeSpecification" _list path;
   }
    : ebs_block_device_config)

let ebs_block_device_config_list_of_yojson tree path =
  list_of_yojson ebs_block_device_config_of_yojson tree path

let ebs_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ebs_optimized =
       option_of_yojson (value_for_key boolean_object_of_yojson "EbsOptimized") _list path;
     ebs_block_device_configs =
       option_of_yojson
         (value_for_key ebs_block_device_config_list_of_yojson "EbsBlockDeviceConfigs")
         _list path;
   }
    : ebs_configuration)

let auto_scaling_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules = value_for_key scaling_rule_list_of_yojson "Rules" _list path;
     constraints = value_for_key scaling_constraints_of_yojson "Constraints" _list path;
   }
    : auto_scaling_policy)

let instance_group_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_ami_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "CustomAmiId") _list path;
     auto_scaling_policy =
       option_of_yojson (value_for_key auto_scaling_policy_of_yojson "AutoScalingPolicy") _list path;
     ebs_configuration =
       option_of_yojson (value_for_key ebs_configuration_of_yojson "EbsConfiguration") _list path;
     configurations =
       option_of_yojson (value_for_key configuration_list_of_yojson "Configurations") _list path;
     instance_count = value_for_key integer_of_yojson "InstanceCount" _list path;
     instance_type = value_for_key instance_type_of_yojson "InstanceType" _list path;
     bid_price =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "BidPrice") _list path;
     instance_role = value_for_key instance_role_type_of_yojson "InstanceRole" _list path;
     market = option_of_yojson (value_for_key market_type_of_yojson "Market") _list path;
     name = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Name") _list path;
   }
    : instance_group_config)

let instance_group_config_list_of_yojson tree path =
  list_of_yojson instance_group_config_of_yojson tree path

let instance_fleet_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TASK" -> TASK
    | `String "CORE" -> CORE
    | `String "MASTER" -> MASTER
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceFleetType" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceFleetType")
     : instance_fleet_type)
    : instance_fleet_type)

let instance_type_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     priority = option_of_yojson (value_for_key non_negative_double_of_yojson "Priority") _list path;
     custom_ami_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "CustomAmiId") _list path;
     configurations =
       option_of_yojson (value_for_key configuration_list_of_yojson "Configurations") _list path;
     ebs_configuration =
       option_of_yojson (value_for_key ebs_configuration_of_yojson "EbsConfiguration") _list path;
     bid_price_as_percentage_of_on_demand_price =
       option_of_yojson
         (value_for_key non_negative_double_of_yojson "BidPriceAsPercentageOfOnDemandPrice")
         _list path;
     bid_price =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "BidPrice") _list path;
     weighted_capacity =
       option_of_yojson (value_for_key whole_number_of_yojson "WeightedCapacity") _list path;
     instance_type = value_for_key instance_type_of_yojson "InstanceType" _list path;
   }
    : instance_type_config)

let instance_type_config_list_of_yojson tree path =
  list_of_yojson instance_type_config_of_yojson tree path

let on_demand_provisioning_allocation_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "prioritized" -> PRIORITIZED
    | `String "lowest-price" -> LOWEST_PRICE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "OnDemandProvisioningAllocationStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "OnDemandProvisioningAllocationStrategy")
     : on_demand_provisioning_allocation_strategy)
    : on_demand_provisioning_allocation_strategy)

let on_demand_capacity_reservation_usage_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "use-capacity-reservations-first" -> USE_CAPACITY_RESERVATIONS_FIRST
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "OnDemandCapacityReservationUsageStrategy"
             value)
    | _ -> raise (deserialize_wrong_type_error path "OnDemandCapacityReservationUsageStrategy")
     : on_demand_capacity_reservation_usage_strategy)
    : on_demand_capacity_reservation_usage_strategy)

let on_demand_capacity_reservation_preference_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> NONE
    | `String "open" -> OPEN
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "OnDemandCapacityReservationPreference" value)
    | _ -> raise (deserialize_wrong_type_error path "OnDemandCapacityReservationPreference")
     : on_demand_capacity_reservation_preference)
    : on_demand_capacity_reservation_preference)

let on_demand_capacity_reservation_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_reservation_resource_group_arn =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "CapacityReservationResourceGroupArn")
         _list path;
     capacity_reservation_preference =
       option_of_yojson
         (value_for_key on_demand_capacity_reservation_preference_of_yojson
            "CapacityReservationPreference")
         _list path;
     usage_strategy =
       option_of_yojson
         (value_for_key on_demand_capacity_reservation_usage_strategy_of_yojson "UsageStrategy")
         _list path;
   }
    : on_demand_capacity_reservation_options)

let on_demand_provisioning_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_reservation_options =
       option_of_yojson
         (value_for_key on_demand_capacity_reservation_options_of_yojson
            "CapacityReservationOptions")
         _list path;
     allocation_strategy =
       value_for_key on_demand_provisioning_allocation_strategy_of_yojson "AllocationStrategy" _list
         path;
   }
    : on_demand_provisioning_specification)

let instance_fleet_provisioning_specifications_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_demand_specification =
       option_of_yojson
         (value_for_key on_demand_provisioning_specification_of_yojson "OnDemandSpecification")
         _list path;
     spot_specification =
       option_of_yojson
         (value_for_key spot_provisioning_specification_of_yojson "SpotSpecification")
         _list path;
   }
    : instance_fleet_provisioning_specifications)

let on_demand_resizing_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_reservation_options =
       option_of_yojson
         (value_for_key on_demand_capacity_reservation_options_of_yojson
            "CapacityReservationOptions")
         _list path;
     allocation_strategy =
       option_of_yojson
         (value_for_key on_demand_provisioning_allocation_strategy_of_yojson "AllocationStrategy")
         _list path;
     timeout_duration_minutes =
       option_of_yojson (value_for_key whole_number_of_yojson "TimeoutDurationMinutes") _list path;
   }
    : on_demand_resizing_specification)

let instance_fleet_resizing_specifications_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_demand_resize_specification =
       option_of_yojson
         (value_for_key on_demand_resizing_specification_of_yojson "OnDemandResizeSpecification")
         _list path;
     spot_resize_specification =
       option_of_yojson
         (value_for_key spot_resizing_specification_of_yojson "SpotResizeSpecification")
         _list path;
   }
    : instance_fleet_resizing_specifications)

let instance_fleet_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Context") _list path;
     resize_specifications =
       option_of_yojson
         (value_for_key instance_fleet_resizing_specifications_of_yojson "ResizeSpecifications")
         _list path;
     launch_specifications =
       option_of_yojson
         (value_for_key instance_fleet_provisioning_specifications_of_yojson "LaunchSpecifications")
         _list path;
     instance_type_configs =
       option_of_yojson
         (value_for_key instance_type_config_list_of_yojson "InstanceTypeConfigs")
         _list path;
     target_spot_capacity =
       option_of_yojson (value_for_key whole_number_of_yojson "TargetSpotCapacity") _list path;
     target_on_demand_capacity =
       option_of_yojson (value_for_key whole_number_of_yojson "TargetOnDemandCapacity") _list path;
     instance_fleet_type =
       value_for_key instance_fleet_type_of_yojson "InstanceFleetType" _list path;
     name = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Name") _list path;
   }
    : instance_fleet_config)

let instance_fleet_config_list_of_yojson tree path =
  list_of_yojson instance_fleet_config_of_yojson tree path

let placement_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zones =
       option_of_yojson
         (value_for_key xml_string_max_len256_list_of_yojson "AvailabilityZones")
         _list path;
     availability_zone =
       option_of_yojson (value_for_key xml_string_of_yojson "AvailabilityZone") _list path;
   }
    : placement_type)

let job_flow_instances_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_slave_security_groups =
       option_of_yojson
         (value_for_key security_groups_list_of_yojson "AdditionalSlaveSecurityGroups")
         _list path;
     additional_master_security_groups =
       option_of_yojson
         (value_for_key security_groups_list_of_yojson "AdditionalMasterSecurityGroups")
         _list path;
     service_access_security_group =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "ServiceAccessSecurityGroup")
         _list path;
     emr_managed_slave_security_group =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "EmrManagedSlaveSecurityGroup")
         _list path;
     emr_managed_master_security_group =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "EmrManagedMasterSecurityGroup")
         _list path;
     ec2_subnet_ids =
       option_of_yojson
         (value_for_key xml_string_max_len256_list_of_yojson "Ec2SubnetIds")
         _list path;
     ec2_subnet_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Ec2SubnetId") _list path;
     hadoop_version =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "HadoopVersion") _list path;
     unhealthy_node_replacement =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "UnhealthyNodeReplacement")
         _list path;
     termination_protected =
       option_of_yojson (value_for_key boolean__of_yojson "TerminationProtected") _list path;
     keep_job_flow_alive_when_no_steps =
       option_of_yojson (value_for_key boolean__of_yojson "KeepJobFlowAliveWhenNoSteps") _list path;
     placement = option_of_yojson (value_for_key placement_type_of_yojson "Placement") _list path;
     ec2_key_name =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Ec2KeyName") _list path;
     instance_fleets =
       option_of_yojson
         (value_for_key instance_fleet_config_list_of_yojson "InstanceFleets")
         _list path;
     instance_groups =
       option_of_yojson
         (value_for_key instance_group_config_list_of_yojson "InstanceGroups")
         _list path;
     instance_count = option_of_yojson (value_for_key integer_of_yojson "InstanceCount") _list path;
     slave_instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "SlaveInstanceType") _list path;
     master_instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "MasterInstanceType") _list path;
   }
    : job_flow_instances_config)

let bootstrap_action_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     script_bootstrap_action =
       value_for_key script_bootstrap_action_config_of_yojson "ScriptBootstrapAction" _list path;
     name = value_for_key xml_string_max_len256_of_yojson "Name" _list path;
   }
    : bootstrap_action_config)

let bootstrap_action_config_list_of_yojson tree path =
  list_of_yojson bootstrap_action_config_of_yojson tree path

let new_supported_products_list_of_yojson tree path =
  list_of_yojson supported_product_config_of_yojson tree path

let application_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_info =
       option_of_yojson (value_for_key string_map_of_yojson "AdditionalInfo") _list path;
     args = option_of_yojson (value_for_key string_list_of_yojson "Args") _list path;
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : application)

let application_list_of_yojson tree path = list_of_yojson application_of_yojson tree path

let repo_upgrade_on_boot_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "SECURITY" -> SECURITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "RepoUpgradeOnBoot" value)
    | _ -> raise (deserialize_wrong_type_error path "RepoUpgradeOnBoot")
     : repo_upgrade_on_boot)
    : repo_upgrade_on_boot)

let kerberos_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ad_domain_join_password =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "ADDomainJoinPassword")
         _list path;
     ad_domain_join_user =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "ADDomainJoinUser")
         _list path;
     cross_realm_trust_principal_password =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "CrossRealmTrustPrincipalPassword")
         _list path;
     kdc_admin_password =
       value_for_key xml_string_max_len256_of_yojson "KdcAdminPassword" _list path;
     realm = value_for_key xml_string_max_len256_of_yojson "Realm" _list path;
   }
    : kerberos_attributes)

let compute_limits_unit_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VCPU" -> VCPU
    | `String "Instances" -> Instances
    | `String "InstanceFleetUnits" -> InstanceFleetUnits
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ComputeLimitsUnitType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComputeLimitsUnitType")
     : compute_limits_unit_type)
    : compute_limits_unit_type)

let compute_limits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maximum_core_capacity_units =
       option_of_yojson (value_for_key integer_of_yojson "MaximumCoreCapacityUnits") _list path;
     maximum_on_demand_capacity_units =
       option_of_yojson (value_for_key integer_of_yojson "MaximumOnDemandCapacityUnits") _list path;
     maximum_capacity_units = value_for_key integer_of_yojson "MaximumCapacityUnits" _list path;
     minimum_capacity_units = value_for_key integer_of_yojson "MinimumCapacityUnits" _list path;
     unit_type = value_for_key compute_limits_unit_type_of_yojson "UnitType" _list path;
   }
    : compute_limits)

let managed_scaling_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_strategy =
       option_of_yojson (value_for_key scaling_strategy_of_yojson "ScalingStrategy") _list path;
     utilization_performance_index =
       option_of_yojson
         (value_for_key utilization_performance_index_integer_of_yojson
            "UtilizationPerformanceIndex")
         _list path;
     compute_limits =
       option_of_yojson (value_for_key compute_limits_of_yojson "ComputeLimits") _list path;
   }
    : managed_scaling_policy)

let placement_group_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "CLUSTER" -> CLUSTER
    | `String "PARTITION" -> PARTITION
    | `String "SPREAD" -> SPREAD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PlacementGroupStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "PlacementGroupStrategy")
     : placement_group_strategy)
    : placement_group_strategy)

let placement_group_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     placement_strategy =
       option_of_yojson
         (value_for_key placement_group_strategy_of_yojson "PlacementStrategy")
         _list path;
     instance_role = value_for_key instance_role_type_of_yojson "InstanceRole" _list path;
   }
    : placement_group_config)

let placement_group_config_list_of_yojson tree path =
  list_of_yojson placement_group_config_of_yojson tree path

let auto_termination_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ idle_timeout = option_of_yojson (value_for_key long_of_yojson "IdleTimeout") _list path }
    : auto_termination_policy)

let cloud_watch_log_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_types = option_of_yojson (value_for_key log_types_map_of_yojson "LogTypes") _list path;
     encryption_key_arn =
       option_of_yojson (value_for_key xml_string_of_yojson "EncryptionKeyArn") _list path;
     log_stream_name_prefix =
       option_of_yojson (value_for_key xml_string_of_yojson "LogStreamNamePrefix") _list path;
     log_group_name =
       option_of_yojson (value_for_key xml_string_of_yojson "LogGroupName") _list path;
     enabled = value_for_key boolean__of_yojson "Enabled" _list path;
   }
    : cloud_watch_log_configuration)

let monitoring_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_logging_configuration =
       option_of_yojson
         (value_for_key s3_logging_configuration_of_yojson "S3LoggingConfiguration")
         _list path;
     cloud_watch_log_configuration =
       option_of_yojson
         (value_for_key cloud_watch_log_configuration_of_yojson "CloudWatchLogConfiguration")
         _list path;
   }
    : monitoring_configuration)

let run_job_flow_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_enabled =
       option_of_yojson (value_for_key boolean_object_of_yojson "SessionEnabled") _list path;
     monitoring_configuration =
       option_of_yojson
         (value_for_key monitoring_configuration_of_yojson "MonitoringConfiguration")
         _list path;
     extended_support =
       option_of_yojson (value_for_key boolean_object_of_yojson "ExtendedSupport") _list path;
     ebs_root_volume_throughput =
       option_of_yojson (value_for_key integer_of_yojson "EbsRootVolumeThroughput") _list path;
     ebs_root_volume_iops =
       option_of_yojson (value_for_key integer_of_yojson "EbsRootVolumeIops") _list path;
     os_release_label =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "OSReleaseLabel") _list path;
     auto_termination_policy =
       option_of_yojson
         (value_for_key auto_termination_policy_of_yojson "AutoTerminationPolicy")
         _list path;
     placement_group_configs =
       option_of_yojson
         (value_for_key placement_group_config_list_of_yojson "PlacementGroupConfigs")
         _list path;
     managed_scaling_policy =
       option_of_yojson
         (value_for_key managed_scaling_policy_of_yojson "ManagedScalingPolicy")
         _list path;
     step_concurrency_level =
       option_of_yojson (value_for_key integer_of_yojson "StepConcurrencyLevel") _list path;
     kerberos_attributes =
       option_of_yojson
         (value_for_key kerberos_attributes_of_yojson "KerberosAttributes")
         _list path;
     repo_upgrade_on_boot =
       option_of_yojson
         (value_for_key repo_upgrade_on_boot_of_yojson "RepoUpgradeOnBoot")
         _list path;
     ebs_root_volume_size =
       option_of_yojson (value_for_key integer_of_yojson "EbsRootVolumeSize") _list path;
     custom_ami_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "CustomAmiId") _list path;
     scale_down_behavior =
       option_of_yojson (value_for_key scale_down_behavior_of_yojson "ScaleDownBehavior") _list path;
     auto_scaling_role =
       option_of_yojson (value_for_key xml_string_of_yojson "AutoScalingRole") _list path;
     security_configuration =
       option_of_yojson (value_for_key xml_string_of_yojson "SecurityConfiguration") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     service_role = option_of_yojson (value_for_key xml_string_of_yojson "ServiceRole") _list path;
     job_flow_role = option_of_yojson (value_for_key xml_string_of_yojson "JobFlowRole") _list path;
     visible_to_all_users =
       option_of_yojson (value_for_key boolean__of_yojson "VisibleToAllUsers") _list path;
     configurations =
       option_of_yojson (value_for_key configuration_list_of_yojson "Configurations") _list path;
     applications =
       option_of_yojson (value_for_key application_list_of_yojson "Applications") _list path;
     new_supported_products =
       option_of_yojson
         (value_for_key new_supported_products_list_of_yojson "NewSupportedProducts")
         _list path;
     supported_products =
       option_of_yojson
         (value_for_key supported_products_list_of_yojson "SupportedProducts")
         _list path;
     bootstrap_actions =
       option_of_yojson
         (value_for_key bootstrap_action_config_list_of_yojson "BootstrapActions")
         _list path;
     step_execution_role_arn =
       option_of_yojson (value_for_key arn_type_of_yojson "StepExecutionRoleArn") _list path;
     steps = option_of_yojson (value_for_key step_config_list_of_yojson "Steps") _list path;
     instances = value_for_key job_flow_instances_config_of_yojson "Instances" _list path;
     release_label =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "ReleaseLabel") _list path;
     ami_version =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "AmiVersion") _list path;
     additional_info =
       option_of_yojson (value_for_key xml_string_of_yojson "AdditionalInfo") _list path;
     log_encryption_kms_key_id =
       option_of_yojson (value_for_key xml_string_of_yojson "LogEncryptionKmsKeyId") _list path;
     log_uri = option_of_yojson (value_for_key xml_string_of_yojson "LogUri") _list path;
     name = value_for_key xml_string_max_len256_of_yojson "Name" _list path;
   }
    : run_job_flow_input)

let resource_id_of_yojson = string_of_yojson

let remove_tags_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let remove_tags_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_id = option_of_yojson (value_for_key cluster_id_of_yojson "ClusterId") _list path;
     tag_keys = value_for_key string_list_of_yojson "TagKeys" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
   }
    : remove_tags_input)

let remove_managed_scaling_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let remove_managed_scaling_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path }
    : remove_managed_scaling_policy_input)

let remove_auto_termination_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let remove_auto_termination_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path }
    : remove_auto_termination_policy_input)

let remove_auto_scaling_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let instance_group_id_of_yojson = string_of_yojson

let remove_auto_scaling_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_group_id = value_for_key instance_group_id_of_yojson "InstanceGroupId" _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : remove_auto_scaling_policy_input)

let release_label_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application = option_of_yojson (value_for_key string__of_yojson "Application") _list path;
     prefix = option_of_yojson (value_for_key string__of_yojson "Prefix") _list path;
   }
    : release_label_filter)

let reconfiguration_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MERGE" -> MERGE
    | `String "OVERWRITE" -> OVERWRITE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReconfigurationType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReconfigurationType")
     : reconfiguration_type)
    : reconfiguration_type)

let put_managed_scaling_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_managed_scaling_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_scaling_policy =
       value_for_key managed_scaling_policy_of_yojson "ManagedScalingPolicy" _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : put_managed_scaling_policy_input)

let put_block_public_access_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let port_of_yojson = int_of_yojson

let port_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_range = option_of_yojson (value_for_key port_of_yojson "MaxRange") _list path;
     min_range = value_for_key port_of_yojson "MinRange" _list path;
   }
    : port_range)

let port_ranges_of_yojson tree path = list_of_yojson port_range_of_yojson tree path

let block_public_access_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties = option_of_yojson (value_for_key string_map_of_yojson "Properties") _list path;
     configurations =
       option_of_yojson (value_for_key configuration_list_of_yojson "Configurations") _list path;
     classification = option_of_yojson (value_for_key string__of_yojson "Classification") _list path;
     permitted_public_security_group_rule_ranges =
       option_of_yojson
         (value_for_key port_ranges_of_yojson "PermittedPublicSecurityGroupRuleRanges")
         _list path;
     block_public_security_group_rules =
       value_for_key boolean__of_yojson "BlockPublicSecurityGroupRules" _list path;
   }
    : block_public_access_configuration)

let put_block_public_access_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     block_public_access_configuration =
       value_for_key block_public_access_configuration_of_yojson "BlockPublicAccessConfiguration"
         _list path;
   }
    : put_block_public_access_configuration_input)

let put_auto_termination_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_auto_termination_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_termination_policy =
       option_of_yojson
         (value_for_key auto_termination_policy_of_yojson "AutoTerminationPolicy")
         _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : put_auto_termination_policy_input)

let auto_scaling_policy_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "DETACHED" -> DETACHED
    | `String "DETACHING" -> DETACHING
    | `String "ATTACHED" -> ATTACHED
    | `String "ATTACHING" -> ATTACHING
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutoScalingPolicyState" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoScalingPolicyState")
     : auto_scaling_policy_state)
    : auto_scaling_policy_state)

let auto_scaling_policy_state_change_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLEANUP_FAILURE" -> CLEANUP_FAILURE
    | `String "PROVISION_FAILURE" -> PROVISION_FAILURE
    | `String "USER_REQUEST" -> USER_REQUEST
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AutoScalingPolicyStateChangeReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoScalingPolicyStateChangeReasonCode")
     : auto_scaling_policy_state_change_reason_code)
    : auto_scaling_policy_state_change_reason_code)

let auto_scaling_policy_state_change_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code =
       option_of_yojson
         (value_for_key auto_scaling_policy_state_change_reason_code_of_yojson "Code")
         _list path;
   }
    : auto_scaling_policy_state_change_reason)

let auto_scaling_policy_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_change_reason =
       option_of_yojson
         (value_for_key auto_scaling_policy_state_change_reason_of_yojson "StateChangeReason")
         _list path;
     state = option_of_yojson (value_for_key auto_scaling_policy_state_of_yojson "State") _list path;
   }
    : auto_scaling_policy_status)

let auto_scaling_policy_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules = option_of_yojson (value_for_key scaling_rule_list_of_yojson "Rules") _list path;
     constraints =
       option_of_yojson (value_for_key scaling_constraints_of_yojson "Constraints") _list path;
     status =
       option_of_yojson (value_for_key auto_scaling_policy_status_of_yojson "Status") _list path;
   }
    : auto_scaling_policy_description)

let put_auto_scaling_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_arn = option_of_yojson (value_for_key arn_type_of_yojson "ClusterArn") _list path;
     auto_scaling_policy =
       option_of_yojson
         (value_for_key auto_scaling_policy_description_of_yojson "AutoScalingPolicy")
         _list path;
     instance_group_id =
       option_of_yojson (value_for_key instance_group_id_of_yojson "InstanceGroupId") _list path;
     cluster_id = option_of_yojson (value_for_key cluster_id_of_yojson "ClusterId") _list path;
   }
    : put_auto_scaling_policy_output)

let put_auto_scaling_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_scaling_policy =
       value_for_key auto_scaling_policy_of_yojson "AutoScalingPolicy" _list path;
     instance_group_id = value_for_key instance_group_id_of_yojson "InstanceGroupId" _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : put_auto_scaling_policy_input)

let profiler_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "YTS" -> YTS
    | `String "TEZUI" -> TEZUI
    | `String "SHS" -> SHS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProfilerType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProfilerType")
     : profiler_type)
    : profiler_type)

let persistent_app_ui_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "YTS" -> YTS
    | `String "TEZ" -> TEZ
    | `String "SHS" -> SHS
    | `String value -> raise (deserialize_unknown_enum_value_error path "PersistentAppUIType" value)
    | _ -> raise (deserialize_wrong_type_error path "PersistentAppUIType")
     : persistent_app_ui_type)
    : persistent_app_ui_type)

let persistent_app_ui_type_list_of_yojson tree path =
  list_of_yojson persistent_app_ui_type_of_yojson tree path

let persistent_app_u_i_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     last_state_change_reason =
       option_of_yojson (value_for_key xml_string_of_yojson "LastStateChangeReason") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     author_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "AuthorId") _list path;
     persistent_app_ui_status =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "PersistentAppUIStatus")
         _list path;
     persistent_app_ui_type_list =
       option_of_yojson
         (value_for_key persistent_app_ui_type_list_of_yojson "PersistentAppUITypeList")
         _list path;
     persistent_app_ui_id =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "PersistentAppUIId")
         _list path;
   }
    : persistent_app_u_i)

let output_notebook_s3_location_for_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key uri_string_of_yojson "Key") _list path;
     bucket = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Bucket") _list path;
   }
    : output_notebook_s3_location_for_output)

let on_cluster_app_ui_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ResourceManager" -> ResourceManager
    | `String "JobHistoryServer" -> JobHistoryServer
    | `String "ApplicationMaster" -> ApplicationMaster
    | `String "TezUI" -> TezUI
    | `String "YarnTimelineService" -> YarnTimelineService
    | `String "SparkHistoryServer" -> SparkHistoryServer
    | `String value -> raise (deserialize_unknown_enum_value_error path "OnClusterAppUIType" value)
    | _ -> raise (deserialize_wrong_type_error path "OnClusterAppUIType")
     : on_cluster_app_ui_type)
    : on_cluster_app_ui_type)

let os_release_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ label = option_of_yojson (value_for_key string__of_yojson "Label") _list path } : os_release)

let os_release_list_of_yojson tree path = list_of_yojson os_release_of_yojson tree path

let notebook_s3_location_for_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key uri_string_of_yojson "Key") _list path;
     bucket = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Bucket") _list path;
   }
    : notebook_s3_location_for_output)

let notebook_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "STOP_PENDING" -> STOP_PENDING
    | `String "FAILED" -> FAILED
    | `String "FAILING" -> FAILING
    | `String "FINISHED" -> FINISHED
    | `String "FINISHING" -> FINISHING
    | `String "RUNNING" -> RUNNING
    | `String "STARTING" -> STARTING
    | `String "START_PENDING" -> START_PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NotebookExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "NotebookExecutionStatus")
     : notebook_execution_status)
    : notebook_execution_status)

let notebook_execution_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_engine_id =
       option_of_yojson (value_for_key xml_string_of_yojson "ExecutionEngineId") _list path;
     notebook_s3_location =
       option_of_yojson
         (value_for_key notebook_s3_location_for_output_of_yojson "NotebookS3Location")
         _list path;
     end_time = option_of_yojson (value_for_key date_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key date_of_yojson "StartTime") _list path;
     status =
       option_of_yojson (value_for_key notebook_execution_status_of_yojson "Status") _list path;
     notebook_execution_name =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "NotebookExecutionName")
         _list path;
     editor_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "EditorId") _list path;
     notebook_execution_id =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "NotebookExecutionId")
         _list path;
   }
    : notebook_execution_summary)

let notebook_execution_summary_list_of_yojson tree path =
  list_of_yojson notebook_execution_summary_of_yojson tree path

let notebook_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_variables =
       option_of_yojson
         (value_for_key environment_variables_map_of_yojson "EnvironmentVariables")
         _list path;
     output_notebook_format =
       option_of_yojson
         (value_for_key output_notebook_format_of_yojson "OutputNotebookFormat")
         _list path;
     output_notebook_s3_location =
       option_of_yojson
         (value_for_key output_notebook_s3_location_for_output_of_yojson "OutputNotebookS3Location")
         _list path;
     notebook_s3_location =
       option_of_yojson
         (value_for_key notebook_s3_location_for_output_of_yojson "NotebookS3Location")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     notebook_instance_security_group_id =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "NotebookInstanceSecurityGroupId")
         _list path;
     last_state_change_reason =
       option_of_yojson (value_for_key xml_string_of_yojson "LastStateChangeReason") _list path;
     output_notebook_ur_i =
       option_of_yojson (value_for_key xml_string_of_yojson "OutputNotebookURI") _list path;
     arn = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Arn") _list path;
     end_time = option_of_yojson (value_for_key date_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key date_of_yojson "StartTime") _list path;
     status =
       option_of_yojson (value_for_key notebook_execution_status_of_yojson "Status") _list path;
     notebook_params =
       option_of_yojson (value_for_key xml_string_of_yojson "NotebookParams") _list path;
     notebook_execution_name =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "NotebookExecutionName")
         _list path;
     execution_engine =
       option_of_yojson
         (value_for_key execution_engine_config_of_yojson "ExecutionEngine")
         _list path;
     editor_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "EditorId") _list path;
     notebook_execution_id =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "NotebookExecutionId")
         _list path;
   }
    : notebook_execution)

let ec2_instance_ids_to_terminate_list_of_yojson tree path =
  list_of_yojson instance_id_of_yojson tree path

let instance_group_modify_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configurations =
       option_of_yojson (value_for_key configuration_list_of_yojson "Configurations") _list path;
     reconfiguration_type =
       option_of_yojson
         (value_for_key reconfiguration_type_of_yojson "ReconfigurationType")
         _list path;
     shrink_policy =
       option_of_yojson (value_for_key shrink_policy_of_yojson "ShrinkPolicy") _list path;
     ec2_instance_ids_to_terminate =
       option_of_yojson
         (value_for_key ec2_instance_ids_to_terminate_list_of_yojson "EC2InstanceIdsToTerminate")
         _list path;
     instance_count = option_of_yojson (value_for_key integer_of_yojson "InstanceCount") _list path;
     instance_group_id = value_for_key xml_string_max_len256_of_yojson "InstanceGroupId" _list path;
   }
    : instance_group_modify_config)

let instance_group_modify_config_list_of_yojson tree path =
  list_of_yojson instance_group_modify_config_of_yojson tree path

let modify_instance_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_groups =
       option_of_yojson
         (value_for_key instance_group_modify_config_list_of_yojson "InstanceGroups")
         _list path;
     cluster_id = option_of_yojson (value_for_key cluster_id_of_yojson "ClusterId") _list path;
   }
    : modify_instance_groups_input)

let instance_fleet_id_of_yojson = string_of_yojson

let instance_fleet_modify_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Context") _list path;
     instance_type_configs =
       option_of_yojson
         (value_for_key instance_type_config_list_of_yojson "InstanceTypeConfigs")
         _list path;
     resize_specifications =
       option_of_yojson
         (value_for_key instance_fleet_resizing_specifications_of_yojson "ResizeSpecifications")
         _list path;
     target_spot_capacity =
       option_of_yojson (value_for_key whole_number_of_yojson "TargetSpotCapacity") _list path;
     target_on_demand_capacity =
       option_of_yojson (value_for_key whole_number_of_yojson "TargetOnDemandCapacity") _list path;
     instance_fleet_id = value_for_key instance_fleet_id_of_yojson "InstanceFleetId" _list path;
   }
    : instance_fleet_modify_config)

let modify_instance_fleet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_fleet =
       value_for_key instance_fleet_modify_config_of_yojson "InstanceFleet" _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : modify_instance_fleet_input)

let modify_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     extended_support =
       option_of_yojson (value_for_key boolean_object_of_yojson "ExtendedSupport") _list path;
     step_concurrency_level =
       option_of_yojson (value_for_key integer_of_yojson "StepConcurrencyLevel") _list path;
   }
    : modify_cluster_output)

let modify_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     extended_support =
       option_of_yojson (value_for_key boolean_object_of_yojson "ExtendedSupport") _list path;
     step_concurrency_level =
       option_of_yojson (value_for_key integer_of_yojson "StepConcurrencyLevel") _list path;
     cluster_id = value_for_key string__of_yojson "ClusterId" _list path;
   }
    : modify_cluster_input)

let max_results_number_of_yojson = int_of_yojson
let marker_of_yojson = string_of_yojson

let list_supported_instance_types_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     supported_instance_types =
       option_of_yojson
         (value_for_key supported_instance_types_list_of_yojson "SupportedInstanceTypes")
         _list path;
   }
    : list_supported_instance_types_output)

let list_supported_instance_types_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     release_label = value_for_key string__of_yojson "ReleaseLabel" _list path;
   }
    : list_supported_instance_types_input)

let list_studios_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     studios = option_of_yojson (value_for_key studio_summary_list_of_yojson "Studios") _list path;
   }
    : list_studios_output)

let list_studios_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path }
    : list_studios_input)

let list_studio_session_mappings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     session_mappings =
       option_of_yojson
         (value_for_key session_mapping_summary_list_of_yojson "SessionMappings")
         _list path;
   }
    : list_studio_session_mappings_output)

let list_studio_session_mappings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     identity_type =
       option_of_yojson (value_for_key identity_type_of_yojson "IdentityType") _list path;
     studio_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "StudioId") _list path;
   }
    : list_studio_session_mappings_input)

let list_steps_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     steps = option_of_yojson (value_for_key step_summary_list_of_yojson "Steps") _list path;
   }
    : list_steps_output)

let list_steps_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     step_ids = option_of_yojson (value_for_key xml_string_list_of_yojson "StepIds") _list path;
     step_states =
       option_of_yojson (value_for_key step_state_list_of_yojson "StepStates") _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : list_steps_input)

let list_sessions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     sessions = option_of_yojson (value_for_key session_list_of_yojson "Sessions") _list path;
   }
    : list_sessions_output)

let list_sessions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_results_number_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     session_states =
       option_of_yojson (value_for_key session_state_list_of_yojson "SessionStates") _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : list_sessions_input)

let list_security_configurations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     security_configurations =
       option_of_yojson
         (value_for_key security_configuration_list_of_yojson "SecurityConfigurations")
         _list path;
   }
    : list_security_configurations_output)

let list_security_configurations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path }
    : list_security_configurations_input)

let list_release_labels_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     release_labels =
       option_of_yojson (value_for_key string_list_of_yojson "ReleaseLabels") _list path;
   }
    : list_release_labels_output)

let list_release_labels_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_results_number_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key release_label_filter_of_yojson "Filters") _list path;
   }
    : list_release_labels_input)

let list_notebook_executions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     notebook_executions =
       option_of_yojson
         (value_for_key notebook_execution_summary_list_of_yojson "NotebookExecutions")
         _list path;
   }
    : list_notebook_executions_output)

let list_notebook_executions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_engine_id =
       option_of_yojson (value_for_key xml_string_of_yojson "ExecutionEngineId") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     to_ = option_of_yojson (value_for_key date_of_yojson "To") _list path;
     from_ = option_of_yojson (value_for_key date_of_yojson "From") _list path;
     status =
       option_of_yojson (value_for_key notebook_execution_status_of_yojson "Status") _list path;
     editor_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "EditorId") _list path;
   }
    : list_notebook_executions_input)

let instance_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "TERMINATED" -> TERMINATED
    | `String "RUNNING" -> RUNNING
    | `String "BOOTSTRAPPING" -> BOOTSTRAPPING
    | `String "PROVISIONING" -> PROVISIONING
    | `String "AWAITING_FULFILLMENT" -> AWAITING_FULFILLMENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceState" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceState")
     : instance_state)
    : instance_state)

let instance_state_change_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLUSTER_TERMINATED" -> CLUSTER_TERMINATED
    | `String "BOOTSTRAP_FAILURE" -> BOOTSTRAP_FAILURE
    | `String "INSTANCE_FAILURE" -> INSTANCE_FAILURE
    | `String "VALIDATION_ERROR" -> VALIDATION_ERROR
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceStateChangeReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceStateChangeReasonCode")
     : instance_state_change_reason_code)
    : instance_state_change_reason_code)

let instance_state_change_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code =
       option_of_yojson
         (value_for_key instance_state_change_reason_code_of_yojson "Code")
         _list path;
   }
    : instance_state_change_reason)

let instance_timeline_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_date_time = option_of_yojson (value_for_key date_of_yojson "EndDateTime") _list path;
     ready_date_time = option_of_yojson (value_for_key date_of_yojson "ReadyDateTime") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationDateTime") _list path;
   }
    : instance_timeline)

let instance_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeline = option_of_yojson (value_for_key instance_timeline_of_yojson "Timeline") _list path;
     state_change_reason =
       option_of_yojson
         (value_for_key instance_state_change_reason_of_yojson "StateChangeReason")
         _list path;
     state = option_of_yojson (value_for_key instance_state_of_yojson "State") _list path;
   }
    : instance_status)

let ebs_volume_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_id = option_of_yojson (value_for_key string__of_yojson "VolumeId") _list path;
     device = option_of_yojson (value_for_key string__of_yojson "Device") _list path;
   }
    : ebs_volume)

let ebs_volume_list_of_yojson tree path = list_of_yojson ebs_volume_of_yojson tree path

let instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ebs_volumes =
       option_of_yojson (value_for_key ebs_volume_list_of_yojson "EbsVolumes") _list path;
     instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "InstanceType") _list path;
     market = option_of_yojson (value_for_key market_type_of_yojson "Market") _list path;
     instance_fleet_id =
       option_of_yojson (value_for_key instance_fleet_id_of_yojson "InstanceFleetId") _list path;
     instance_group_id =
       option_of_yojson (value_for_key string__of_yojson "InstanceGroupId") _list path;
     status = option_of_yojson (value_for_key instance_status_of_yojson "Status") _list path;
     private_ip_address =
       option_of_yojson (value_for_key string__of_yojson "PrivateIpAddress") _list path;
     private_dns_name =
       option_of_yojson (value_for_key string__of_yojson "PrivateDnsName") _list path;
     public_ip_address =
       option_of_yojson (value_for_key string__of_yojson "PublicIpAddress") _list path;
     public_dns_name = option_of_yojson (value_for_key string__of_yojson "PublicDnsName") _list path;
     ec2_instance_id =
       option_of_yojson (value_for_key instance_id_of_yojson "Ec2InstanceId") _list path;
     id = option_of_yojson (value_for_key instance_id_of_yojson "Id") _list path;
   }
    : instance)

let instance_list_of_yojson tree path = list_of_yojson instance_of_yojson tree path

let list_instances_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     instances = option_of_yojson (value_for_key instance_list_of_yojson "Instances") _list path;
   }
    : list_instances_output)

let instance_group_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TASK" -> TASK
    | `String "CORE" -> CORE
    | `String "MASTER" -> MASTER
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceGroupType" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceGroupType")
     : instance_group_type)
    : instance_group_type)

let instance_group_type_list_of_yojson tree path =
  list_of_yojson instance_group_type_of_yojson tree path

let instance_state_list_of_yojson tree path = list_of_yojson instance_state_of_yojson tree path

let list_instances_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     instance_states =
       option_of_yojson (value_for_key instance_state_list_of_yojson "InstanceStates") _list path;
     instance_fleet_type =
       option_of_yojson (value_for_key instance_fleet_type_of_yojson "InstanceFleetType") _list path;
     instance_fleet_id =
       option_of_yojson (value_for_key instance_fleet_id_of_yojson "InstanceFleetId") _list path;
     instance_group_types =
       option_of_yojson
         (value_for_key instance_group_type_list_of_yojson "InstanceGroupTypes")
         _list path;
     instance_group_id =
       option_of_yojson (value_for_key instance_group_id_of_yojson "InstanceGroupId") _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : list_instances_input)

let instance_group_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENDED" -> ENDED
    | `String "SHUTTING_DOWN" -> SHUTTING_DOWN
    | `String "ARRESTED" -> ARRESTED
    | `String "TERMINATED" -> TERMINATED
    | `String "TERMINATING" -> TERMINATING
    | `String "SUSPENDED" -> SUSPENDED
    | `String "RESIZING" -> RESIZING
    | `String "RECONFIGURING" -> RECONFIGURING
    | `String "RUNNING" -> RUNNING
    | `String "BOOTSTRAPPING" -> BOOTSTRAPPING
    | `String "PROVISIONING" -> PROVISIONING
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceGroupState" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceGroupState")
     : instance_group_state)
    : instance_group_state)

let instance_group_state_change_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLUSTER_TERMINATED" -> CLUSTER_TERMINATED
    | `String "INSTANCE_FAILURE" -> INSTANCE_FAILURE
    | `String "VALIDATION_ERROR" -> VALIDATION_ERROR
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceGroupStateChangeReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceGroupStateChangeReasonCode")
     : instance_group_state_change_reason_code)
    : instance_group_state_change_reason_code)

let instance_group_state_change_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code =
       option_of_yojson
         (value_for_key instance_group_state_change_reason_code_of_yojson "Code")
         _list path;
   }
    : instance_group_state_change_reason)

let instance_group_timeline_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_date_time = option_of_yojson (value_for_key date_of_yojson "EndDateTime") _list path;
     ready_date_time = option_of_yojson (value_for_key date_of_yojson "ReadyDateTime") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationDateTime") _list path;
   }
    : instance_group_timeline)

let instance_group_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeline =
       option_of_yojson (value_for_key instance_group_timeline_of_yojson "Timeline") _list path;
     state_change_reason =
       option_of_yojson
         (value_for_key instance_group_state_change_reason_of_yojson "StateChangeReason")
         _list path;
     state = option_of_yojson (value_for_key instance_group_state_of_yojson "State") _list path;
   }
    : instance_group_status)

let ebs_block_device_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device = option_of_yojson (value_for_key string__of_yojson "Device") _list path;
     volume_specification =
       option_of_yojson
         (value_for_key volume_specification_of_yojson "VolumeSpecification")
         _list path;
   }
    : ebs_block_device)

let ebs_block_device_list_of_yojson tree path = list_of_yojson ebs_block_device_of_yojson tree path

let instance_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_ami_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "CustomAmiId") _list path;
     auto_scaling_policy =
       option_of_yojson
         (value_for_key auto_scaling_policy_description_of_yojson "AutoScalingPolicy")
         _list path;
     shrink_policy =
       option_of_yojson (value_for_key shrink_policy_of_yojson "ShrinkPolicy") _list path;
     ebs_optimized =
       option_of_yojson (value_for_key boolean_object_of_yojson "EbsOptimized") _list path;
     ebs_block_devices =
       option_of_yojson (value_for_key ebs_block_device_list_of_yojson "EbsBlockDevices") _list path;
     last_successfully_applied_configurations_version =
       option_of_yojson
         (value_for_key long_of_yojson "LastSuccessfullyAppliedConfigurationsVersion")
         _list path;
     last_successfully_applied_configurations =
       option_of_yojson
         (value_for_key configuration_list_of_yojson "LastSuccessfullyAppliedConfigurations")
         _list path;
     configurations_version =
       option_of_yojson (value_for_key long_of_yojson "ConfigurationsVersion") _list path;
     configurations =
       option_of_yojson (value_for_key configuration_list_of_yojson "Configurations") _list path;
     status = option_of_yojson (value_for_key instance_group_status_of_yojson "Status") _list path;
     running_instance_count =
       option_of_yojson (value_for_key integer_of_yojson "RunningInstanceCount") _list path;
     requested_instance_count =
       option_of_yojson (value_for_key integer_of_yojson "RequestedInstanceCount") _list path;
     instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "InstanceType") _list path;
     bid_price = option_of_yojson (value_for_key string__of_yojson "BidPrice") _list path;
     instance_group_type =
       option_of_yojson (value_for_key instance_group_type_of_yojson "InstanceGroupType") _list path;
     market = option_of_yojson (value_for_key market_type_of_yojson "Market") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key instance_group_id_of_yojson "Id") _list path;
   }
    : instance_group)

let instance_group_list_of_yojson tree path = list_of_yojson instance_group_of_yojson tree path

let list_instance_groups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     instance_groups =
       option_of_yojson (value_for_key instance_group_list_of_yojson "InstanceGroups") _list path;
   }
    : list_instance_groups_output)

let list_instance_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : list_instance_groups_input)

let instance_fleet_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "TERMINATED" -> TERMINATED
    | `String "TERMINATING" -> TERMINATING
    | `String "SUSPENDED" -> SUSPENDED
    | `String "RECONFIGURING" -> RECONFIGURING
    | `String "RESIZING" -> RESIZING
    | `String "RUNNING" -> RUNNING
    | `String "BOOTSTRAPPING" -> BOOTSTRAPPING
    | `String "PROVISIONING" -> PROVISIONING
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceFleetState" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceFleetState")
     : instance_fleet_state)
    : instance_fleet_state)

let instance_fleet_state_change_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLUSTER_TERMINATED" -> CLUSTER_TERMINATED
    | `String "INSTANCE_FAILURE" -> INSTANCE_FAILURE
    | `String "VALIDATION_ERROR" -> VALIDATION_ERROR
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceFleetStateChangeReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceFleetStateChangeReasonCode")
     : instance_fleet_state_change_reason_code)
    : instance_fleet_state_change_reason_code)

let instance_fleet_state_change_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code =
       option_of_yojson
         (value_for_key instance_fleet_state_change_reason_code_of_yojson "Code")
         _list path;
   }
    : instance_fleet_state_change_reason)

let instance_fleet_timeline_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_date_time = option_of_yojson (value_for_key date_of_yojson "EndDateTime") _list path;
     ready_date_time = option_of_yojson (value_for_key date_of_yojson "ReadyDateTime") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationDateTime") _list path;
   }
    : instance_fleet_timeline)

let instance_fleet_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeline =
       option_of_yojson (value_for_key instance_fleet_timeline_of_yojson "Timeline") _list path;
     state_change_reason =
       option_of_yojson
         (value_for_key instance_fleet_state_change_reason_of_yojson "StateChangeReason")
         _list path;
     state = option_of_yojson (value_for_key instance_fleet_state_of_yojson "State") _list path;
   }
    : instance_fleet_status)

let instance_type_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     priority = option_of_yojson (value_for_key non_negative_double_of_yojson "Priority") _list path;
     custom_ami_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "CustomAmiId") _list path;
     ebs_optimized =
       option_of_yojson (value_for_key boolean_object_of_yojson "EbsOptimized") _list path;
     ebs_block_devices =
       option_of_yojson (value_for_key ebs_block_device_list_of_yojson "EbsBlockDevices") _list path;
     configurations =
       option_of_yojson (value_for_key configuration_list_of_yojson "Configurations") _list path;
     bid_price_as_percentage_of_on_demand_price =
       option_of_yojson
         (value_for_key non_negative_double_of_yojson "BidPriceAsPercentageOfOnDemandPrice")
         _list path;
     bid_price =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "BidPrice") _list path;
     weighted_capacity =
       option_of_yojson (value_for_key whole_number_of_yojson "WeightedCapacity") _list path;
     instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "InstanceType") _list path;
   }
    : instance_type_specification)

let instance_type_specification_list_of_yojson tree path =
  list_of_yojson instance_type_specification_of_yojson tree path

let instance_fleet_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Context") _list path;
     resize_specifications =
       option_of_yojson
         (value_for_key instance_fleet_resizing_specifications_of_yojson "ResizeSpecifications")
         _list path;
     launch_specifications =
       option_of_yojson
         (value_for_key instance_fleet_provisioning_specifications_of_yojson "LaunchSpecifications")
         _list path;
     instance_type_specifications =
       option_of_yojson
         (value_for_key instance_type_specification_list_of_yojson "InstanceTypeSpecifications")
         _list path;
     provisioned_spot_capacity =
       option_of_yojson (value_for_key whole_number_of_yojson "ProvisionedSpotCapacity") _list path;
     provisioned_on_demand_capacity =
       option_of_yojson
         (value_for_key whole_number_of_yojson "ProvisionedOnDemandCapacity")
         _list path;
     target_spot_capacity =
       option_of_yojson (value_for_key whole_number_of_yojson "TargetSpotCapacity") _list path;
     target_on_demand_capacity =
       option_of_yojson (value_for_key whole_number_of_yojson "TargetOnDemandCapacity") _list path;
     instance_fleet_type =
       option_of_yojson (value_for_key instance_fleet_type_of_yojson "InstanceFleetType") _list path;
     status = option_of_yojson (value_for_key instance_fleet_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key instance_fleet_id_of_yojson "Id") _list path;
   }
    : instance_fleet)

let instance_fleet_list_of_yojson tree path = list_of_yojson instance_fleet_of_yojson tree path

let list_instance_fleets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     instance_fleets =
       option_of_yojson (value_for_key instance_fleet_list_of_yojson "InstanceFleets") _list path;
   }
    : list_instance_fleets_output)

let list_instance_fleets_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : list_instance_fleets_input)

let cluster_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "TERMINATED_WITH_ERRORS" -> TERMINATED_WITH_ERRORS
    | `String "TERMINATED" -> TERMINATED
    | `String "TERMINATING" -> TERMINATING
    | `String "WAITING" -> WAITING
    | `String "RUNNING" -> RUNNING
    | `String "BOOTSTRAPPING" -> BOOTSTRAPPING
    | `String "STARTING" -> STARTING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClusterState" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterState")
     : cluster_state)
    : cluster_state)

let cluster_state_change_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL_STEPS_COMPLETED" -> ALL_STEPS_COMPLETED
    | `String "STEP_FAILURE" -> STEP_FAILURE
    | `String "USER_REQUEST" -> USER_REQUEST
    | `String "BOOTSTRAP_FAILURE" -> BOOTSTRAP_FAILURE
    | `String "INSTANCE_FLEET_TIMEOUT" -> INSTANCE_FLEET_TIMEOUT
    | `String "INSTANCE_FAILURE" -> INSTANCE_FAILURE
    | `String "VALIDATION_ERROR" -> VALIDATION_ERROR
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ClusterStateChangeReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterStateChangeReasonCode")
     : cluster_state_change_reason_code)
    : cluster_state_change_reason_code)

let cluster_state_change_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code =
       option_of_yojson (value_for_key cluster_state_change_reason_code_of_yojson "Code") _list path;
   }
    : cluster_state_change_reason)

let cluster_timeline_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_date_time = option_of_yojson (value_for_key date_of_yojson "EndDateTime") _list path;
     ready_date_time = option_of_yojson (value_for_key date_of_yojson "ReadyDateTime") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationDateTime") _list path;
   }
    : cluster_timeline)

let error_data_of_yojson tree path = list_of_yojson string_map_of_yojson tree path

let error_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     error_data = option_of_yojson (value_for_key error_data_of_yojson "ErrorData") _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
   }
    : error_detail)

let error_detail_list_of_yojson tree path = list_of_yojson error_detail_of_yojson tree path

let cluster_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_details =
       option_of_yojson (value_for_key error_detail_list_of_yojson "ErrorDetails") _list path;
     timeline = option_of_yojson (value_for_key cluster_timeline_of_yojson "Timeline") _list path;
     state_change_reason =
       option_of_yojson
         (value_for_key cluster_state_change_reason_of_yojson "StateChangeReason")
         _list path;
     state = option_of_yojson (value_for_key cluster_state_of_yojson "State") _list path;
   }
    : cluster_status)

let cluster_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outpost_arn =
       option_of_yojson (value_for_key optional_arn_type_of_yojson "OutpostArn") _list path;
     cluster_arn = option_of_yojson (value_for_key arn_type_of_yojson "ClusterArn") _list path;
     normalized_instance_hours =
       option_of_yojson (value_for_key integer_of_yojson "NormalizedInstanceHours") _list path;
     status = option_of_yojson (value_for_key cluster_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key cluster_id_of_yojson "Id") _list path;
   }
    : cluster_summary)

let cluster_summary_list_of_yojson tree path = list_of_yojson cluster_summary_of_yojson tree path

let list_clusters_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     clusters =
       option_of_yojson (value_for_key cluster_summary_list_of_yojson "Clusters") _list path;
   }
    : list_clusters_output)

let cluster_state_list_of_yojson tree path = list_of_yojson cluster_state_of_yojson tree path

let list_clusters_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     cluster_states =
       option_of_yojson (value_for_key cluster_state_list_of_yojson "ClusterStates") _list path;
     created_before = option_of_yojson (value_for_key date_of_yojson "CreatedBefore") _list path;
     created_after = option_of_yojson (value_for_key date_of_yojson "CreatedAfter") _list path;
   }
    : list_clusters_input)

let command_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     args = option_of_yojson (value_for_key string_list_of_yojson "Args") _list path;
     script_path = option_of_yojson (value_for_key string__of_yojson "ScriptPath") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : command)

let command_list_of_yojson tree path = list_of_yojson command_of_yojson tree path

let list_bootstrap_actions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     bootstrap_actions =
       option_of_yojson (value_for_key command_list_of_yojson "BootstrapActions") _list path;
   }
    : list_bootstrap_actions_output)

let list_bootstrap_actions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : list_bootstrap_actions_input)

let instance_group_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_ami_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "CustomAmiId") _list path;
     end_date_time = option_of_yojson (value_for_key date_of_yojson "EndDateTime") _list path;
     ready_date_time = option_of_yojson (value_for_key date_of_yojson "ReadyDateTime") _list path;
     start_date_time = option_of_yojson (value_for_key date_of_yojson "StartDateTime") _list path;
     creation_date_time = value_for_key date_of_yojson "CreationDateTime" _list path;
     last_state_change_reason =
       option_of_yojson (value_for_key xml_string_of_yojson "LastStateChangeReason") _list path;
     state = value_for_key instance_group_state_of_yojson "State" _list path;
     instance_running_count = value_for_key integer_of_yojson "InstanceRunningCount" _list path;
     instance_request_count = value_for_key integer_of_yojson "InstanceRequestCount" _list path;
     instance_type = value_for_key instance_type_of_yojson "InstanceType" _list path;
     bid_price =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "BidPrice") _list path;
     instance_role = value_for_key instance_role_type_of_yojson "InstanceRole" _list path;
     market = value_for_key market_type_of_yojson "Market" _list path;
     name = option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Name") _list path;
     instance_group_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "InstanceGroupId") _list path;
   }
    : instance_group_detail)

let instance_group_detail_list_of_yojson tree path =
  list_of_yojson instance_group_detail_of_yojson tree path

let job_flow_instances_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hadoop_version =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "HadoopVersion") _list path;
     unhealthy_node_replacement =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "UnhealthyNodeReplacement")
         _list path;
     termination_protected =
       option_of_yojson (value_for_key boolean__of_yojson "TerminationProtected") _list path;
     keep_job_flow_alive_when_no_steps =
       option_of_yojson (value_for_key boolean__of_yojson "KeepJobFlowAliveWhenNoSteps") _list path;
     placement = option_of_yojson (value_for_key placement_type_of_yojson "Placement") _list path;
     ec2_subnet_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Ec2SubnetId") _list path;
     ec2_key_name =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Ec2KeyName") _list path;
     normalized_instance_hours =
       option_of_yojson (value_for_key integer_of_yojson "NormalizedInstanceHours") _list path;
     instance_groups =
       option_of_yojson
         (value_for_key instance_group_detail_list_of_yojson "InstanceGroups")
         _list path;
     instance_count = value_for_key integer_of_yojson "InstanceCount" _list path;
     slave_instance_type = value_for_key instance_type_of_yojson "SlaveInstanceType" _list path;
     master_instance_id =
       option_of_yojson (value_for_key xml_string_of_yojson "MasterInstanceId") _list path;
     master_public_dns_name =
       option_of_yojson (value_for_key xml_string_of_yojson "MasterPublicDnsName") _list path;
     master_instance_type = value_for_key instance_type_of_yojson "MasterInstanceType" _list path;
   }
    : job_flow_instances_detail)

let job_flow_execution_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "TERMINATED" -> TERMINATED
    | `String "SHUTTING_DOWN" -> SHUTTING_DOWN
    | `String "WAITING" -> WAITING
    | `String "RUNNING" -> RUNNING
    | `String "BOOTSTRAPPING" -> BOOTSTRAPPING
    | `String "STARTING" -> STARTING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "JobFlowExecutionState" value)
    | _ -> raise (deserialize_wrong_type_error path "JobFlowExecutionState")
     : job_flow_execution_state)
    : job_flow_execution_state)

let job_flow_execution_status_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_state_change_reason =
       option_of_yojson (value_for_key xml_string_of_yojson "LastStateChangeReason") _list path;
     end_date_time = option_of_yojson (value_for_key date_of_yojson "EndDateTime") _list path;
     ready_date_time = option_of_yojson (value_for_key date_of_yojson "ReadyDateTime") _list path;
     start_date_time = option_of_yojson (value_for_key date_of_yojson "StartDateTime") _list path;
     creation_date_time = value_for_key date_of_yojson "CreationDateTime" _list path;
     state = value_for_key job_flow_execution_state_of_yojson "State" _list path;
   }
    : job_flow_execution_status_detail)

let job_flow_execution_state_list_of_yojson tree path =
  list_of_yojson job_flow_execution_state_of_yojson tree path

let bootstrap_action_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bootstrap_action_config =
       option_of_yojson
         (value_for_key bootstrap_action_config_of_yojson "BootstrapActionConfig")
         _list path;
   }
    : bootstrap_action_detail)

let bootstrap_action_detail_list_of_yojson tree path =
  list_of_yojson bootstrap_action_detail_of_yojson tree path

let job_flow_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scale_down_behavior =
       option_of_yojson (value_for_key scale_down_behavior_of_yojson "ScaleDownBehavior") _list path;
     auto_scaling_role =
       option_of_yojson (value_for_key xml_string_of_yojson "AutoScalingRole") _list path;
     service_role = option_of_yojson (value_for_key xml_string_of_yojson "ServiceRole") _list path;
     job_flow_role = option_of_yojson (value_for_key xml_string_of_yojson "JobFlowRole") _list path;
     visible_to_all_users =
       option_of_yojson (value_for_key boolean__of_yojson "VisibleToAllUsers") _list path;
     supported_products =
       option_of_yojson
         (value_for_key supported_products_list_of_yojson "SupportedProducts")
         _list path;
     bootstrap_actions =
       option_of_yojson
         (value_for_key bootstrap_action_detail_list_of_yojson "BootstrapActions")
         _list path;
     steps = option_of_yojson (value_for_key step_detail_list_of_yojson "Steps") _list path;
     instances = value_for_key job_flow_instances_detail_of_yojson "Instances" _list path;
     execution_status_detail =
       value_for_key job_flow_execution_status_detail_of_yojson "ExecutionStatusDetail" _list path;
     ami_version =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "AmiVersion") _list path;
     log_encryption_kms_key_id =
       option_of_yojson (value_for_key xml_string_of_yojson "LogEncryptionKmsKeyId") _list path;
     log_uri = option_of_yojson (value_for_key xml_string_of_yojson "LogUri") _list path;
     name = value_for_key xml_string_max_len256_of_yojson "Name" _list path;
     job_flow_id = value_for_key xml_string_max_len256_of_yojson "JobFlowId" _list path;
   }
    : job_flow_detail)

let job_flow_detail_list_of_yojson tree path = list_of_yojson job_flow_detail_of_yojson tree path

let instance_group_ids_list_of_yojson tree path =
  list_of_yojson xml_string_max_len256_of_yojson tree path

let instance_collection_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSTANCE_GROUP" -> INSTANCE_GROUP
    | `String "INSTANCE_FLEET" -> INSTANCE_FLEET
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceCollectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceCollectionType")
     : instance_collection_type)
    : instance_collection_type)

let get_studio_session_mapping_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_mapping =
       option_of_yojson (value_for_key session_mapping_detail_of_yojson "SessionMapping") _list path;
   }
    : get_studio_session_mapping_output)

let get_studio_session_mapping_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_type = value_for_key identity_type_of_yojson "IdentityType" _list path;
     identity_name =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityName") _list path;
     identity_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityId") _list path;
     studio_id = value_for_key xml_string_max_len256_of_yojson "StudioId" _list path;
   }
    : get_studio_session_mapping_input)

let get_session_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session = value_for_key session_of_yojson "Session" _list path } : get_session_output)

let get_session_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = value_for_key session_id_of_yojson "SessionId" _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : get_session_input)

let credentials_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "UsernamePassword" -> UsernamePassword (username_password_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Credentials" unknown)
    : credentials)

let get_session_endpoint_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credentials = option_of_yojson (value_for_key credentials_of_yojson "Credentials") _list path;
     auth_token_expiration_time =
       option_of_yojson (value_for_key date_of_yojson "AuthTokenExpirationTime") _list path;
     auth_token = option_of_yojson (value_for_key sensitive_string_of_yojson "AuthToken") _list path;
     endpoint = value_for_key xml_string_of_yojson "Endpoint" _list path;
   }
    : get_session_endpoint_output)

let get_session_endpoint_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = value_for_key session_id_of_yojson "SessionId" _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : get_session_endpoint_input)

let get_persistent_app_ui_presigned_url_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     presigned_ur_l =
       option_of_yojson (value_for_key xml_string_of_yojson "PresignedURL") _list path;
     presigned_url_ready =
       option_of_yojson (value_for_key boolean__of_yojson "PresignedURLReady") _list path;
   }
    : get_persistent_app_ui_presigned_url_output)

let get_persistent_app_ui_presigned_url_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_role_arn =
       option_of_yojson (value_for_key arn_type_of_yojson "ExecutionRoleArn") _list path;
     auth_proxy_call =
       option_of_yojson (value_for_key boolean_object_of_yojson "AuthProxyCall") _list path;
     application_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "ApplicationId") _list path;
     persistent_app_ui_type =
       option_of_yojson
         (value_for_key persistent_app_ui_type_of_yojson "PersistentAppUIType")
         _list path;
     persistent_app_ui_id =
       value_for_key xml_string_max_len256_of_yojson "PersistentAppUIId" _list path;
   }
    : get_persistent_app_ui_presigned_url_input)

let get_on_cluster_app_ui_presigned_url_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     presigned_ur_l =
       option_of_yojson (value_for_key xml_string_of_yojson "PresignedURL") _list path;
     presigned_url_ready =
       option_of_yojson (value_for_key boolean__of_yojson "PresignedURLReady") _list path;
   }
    : get_on_cluster_app_ui_presigned_url_output)

let get_on_cluster_app_ui_presigned_url_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_role_arn =
       option_of_yojson (value_for_key arn_type_of_yojson "ExecutionRoleArn") _list path;
     dry_run = option_of_yojson (value_for_key boolean_object_of_yojson "DryRun") _list path;
     application_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "ApplicationId") _list path;
     on_cluster_app_ui_type =
       option_of_yojson
         (value_for_key on_cluster_app_ui_type_of_yojson "OnClusterAppUIType")
         _list path;
     cluster_id = value_for_key xml_string_max_len256_of_yojson "ClusterId" _list path;
   }
    : get_on_cluster_app_ui_presigned_url_input)

let get_managed_scaling_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_scaling_policy =
       option_of_yojson
         (value_for_key managed_scaling_policy_of_yojson "ManagedScalingPolicy")
         _list path;
   }
    : get_managed_scaling_policy_output)

let get_managed_scaling_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path }
    : get_managed_scaling_policy_input)

let get_cluster_session_credentials_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expires_at = option_of_yojson (value_for_key date_of_yojson "ExpiresAt") _list path;
     credentials = option_of_yojson (value_for_key credentials_of_yojson "Credentials") _list path;
   }
    : get_cluster_session_credentials_output)

let get_cluster_session_credentials_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_role_arn =
       option_of_yojson (value_for_key arn_type_of_yojson "ExecutionRoleArn") _list path;
     cluster_id = value_for_key xml_string_max_len256_of_yojson "ClusterId" _list path;
   }
    : get_cluster_session_credentials_input)

let block_public_access_configuration_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_by_arn = value_for_key arn_type_of_yojson "CreatedByArn" _list path;
     creation_date_time = value_for_key date_of_yojson "CreationDateTime" _list path;
   }
    : block_public_access_configuration_metadata)

let get_block_public_access_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     block_public_access_configuration_metadata =
       value_for_key block_public_access_configuration_metadata_of_yojson
         "BlockPublicAccessConfigurationMetadata" _list path;
     block_public_access_configuration =
       value_for_key block_public_access_configuration_of_yojson "BlockPublicAccessConfiguration"
         _list path;
   }
    : get_block_public_access_configuration_output)

let get_block_public_access_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_auto_termination_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_termination_policy =
       option_of_yojson
         (value_for_key auto_termination_policy_of_yojson "AutoTerminationPolicy")
         _list path;
   }
    : get_auto_termination_policy_output)

let get_auto_termination_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path }
    : get_auto_termination_policy_input)

let describe_studio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ studio = option_of_yojson (value_for_key studio_of_yojson "Studio") _list path }
    : describe_studio_output)

let describe_studio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ studio_id = value_for_key xml_string_max_len256_of_yojson "StudioId" _list path }
    : describe_studio_input)

let describe_step_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ step = option_of_yojson (value_for_key step_of_yojson "Step") _list path }
    : describe_step_output)

let describe_step_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     step_id = value_for_key step_id_of_yojson "StepId" _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : describe_step_input)

let describe_security_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationDateTime") _list path;
     security_configuration =
       option_of_yojson (value_for_key string__of_yojson "SecurityConfiguration") _list path;
     name = option_of_yojson (value_for_key xml_string_of_yojson "Name") _list path;
   }
    : describe_security_configuration_output)

let describe_security_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key xml_string_of_yojson "Name" _list path }
    : describe_security_configuration_input)

let describe_release_label_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     available_os_releases =
       option_of_yojson (value_for_key os_release_list_of_yojson "AvailableOSReleases") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     applications =
       option_of_yojson
         (value_for_key simplified_application_list_of_yojson "Applications")
         _list path;
     release_label = option_of_yojson (value_for_key string__of_yojson "ReleaseLabel") _list path;
   }
    : describe_release_label_output)

let describe_release_label_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_results_number_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     release_label = option_of_yojson (value_for_key string__of_yojson "ReleaseLabel") _list path;
   }
    : describe_release_label_input)

let describe_persistent_app_ui_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     persistent_app_u_i =
       option_of_yojson (value_for_key persistent_app_u_i_of_yojson "PersistentAppUI") _list path;
   }
    : describe_persistent_app_ui_output)

let describe_persistent_app_ui_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     persistent_app_ui_id =
       value_for_key xml_string_max_len256_of_yojson "PersistentAppUIId" _list path;
   }
    : describe_persistent_app_ui_input)

let describe_notebook_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notebook_execution =
       option_of_yojson (value_for_key notebook_execution_of_yojson "NotebookExecution") _list path;
   }
    : describe_notebook_execution_output)

let describe_notebook_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notebook_execution_id =
       value_for_key xml_string_max_len256_of_yojson "NotebookExecutionId" _list path;
   }
    : describe_notebook_execution_input)

let describe_job_flows_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_flows =
       option_of_yojson (value_for_key job_flow_detail_list_of_yojson "JobFlows") _list path;
   }
    : describe_job_flows_output)

let describe_job_flows_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_flow_states =
       option_of_yojson
         (value_for_key job_flow_execution_state_list_of_yojson "JobFlowStates")
         _list path;
     job_flow_ids =
       option_of_yojson (value_for_key xml_string_list_of_yojson "JobFlowIds") _list path;
     created_before = option_of_yojson (value_for_key date_of_yojson "CreatedBefore") _list path;
     created_after = option_of_yojson (value_for_key date_of_yojson "CreatedAfter") _list path;
   }
    : describe_job_flows_input)

let ec2_instance_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_slave_security_groups =
       option_of_yojson
         (value_for_key string_list_of_yojson "AdditionalSlaveSecurityGroups")
         _list path;
     additional_master_security_groups =
       option_of_yojson
         (value_for_key string_list_of_yojson "AdditionalMasterSecurityGroups")
         _list path;
     service_access_security_group =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessSecurityGroup") _list path;
     emr_managed_slave_security_group =
       option_of_yojson (value_for_key string__of_yojson "EmrManagedSlaveSecurityGroup") _list path;
     emr_managed_master_security_group =
       option_of_yojson (value_for_key string__of_yojson "EmrManagedMasterSecurityGroup") _list path;
     iam_instance_profile =
       option_of_yojson (value_for_key string__of_yojson "IamInstanceProfile") _list path;
     requested_ec2_availability_zones =
       option_of_yojson
         (value_for_key xml_string_max_len256_list_of_yojson "RequestedEc2AvailabilityZones")
         _list path;
     ec2_availability_zone =
       option_of_yojson (value_for_key string__of_yojson "Ec2AvailabilityZone") _list path;
     requested_ec2_subnet_ids =
       option_of_yojson
         (value_for_key xml_string_max_len256_list_of_yojson "RequestedEc2SubnetIds")
         _list path;
     ec2_subnet_id = option_of_yojson (value_for_key string__of_yojson "Ec2SubnetId") _list path;
     ec2_key_name = option_of_yojson (value_for_key string__of_yojson "Ec2KeyName") _list path;
   }
    : ec2_instance_attributes)

let cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_enabled =
       option_of_yojson (value_for_key boolean_object_of_yojson "SessionEnabled") _list path;
     monitoring_configuration =
       option_of_yojson
         (value_for_key monitoring_configuration_of_yojson "MonitoringConfiguration")
         _list path;
     extended_support =
       option_of_yojson (value_for_key boolean_object_of_yojson "ExtendedSupport") _list path;
     ebs_root_volume_throughput =
       option_of_yojson (value_for_key integer_of_yojson "EbsRootVolumeThroughput") _list path;
     ebs_root_volume_iops =
       option_of_yojson (value_for_key integer_of_yojson "EbsRootVolumeIops") _list path;
     os_release_label =
       option_of_yojson (value_for_key string__of_yojson "OSReleaseLabel") _list path;
     placement_groups =
       option_of_yojson
         (value_for_key placement_group_config_list_of_yojson "PlacementGroups")
         _list path;
     step_concurrency_level =
       option_of_yojson (value_for_key integer_of_yojson "StepConcurrencyLevel") _list path;
     outpost_arn =
       option_of_yojson (value_for_key optional_arn_type_of_yojson "OutpostArn") _list path;
     cluster_arn = option_of_yojson (value_for_key arn_type_of_yojson "ClusterArn") _list path;
     kerberos_attributes =
       option_of_yojson
         (value_for_key kerberos_attributes_of_yojson "KerberosAttributes")
         _list path;
     repo_upgrade_on_boot =
       option_of_yojson
         (value_for_key repo_upgrade_on_boot_of_yojson "RepoUpgradeOnBoot")
         _list path;
     ebs_root_volume_size =
       option_of_yojson (value_for_key integer_of_yojson "EbsRootVolumeSize") _list path;
     custom_ami_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "CustomAmiId") _list path;
     scale_down_behavior =
       option_of_yojson (value_for_key scale_down_behavior_of_yojson "ScaleDownBehavior") _list path;
     auto_scaling_role =
       option_of_yojson (value_for_key xml_string_of_yojson "AutoScalingRole") _list path;
     security_configuration =
       option_of_yojson (value_for_key xml_string_of_yojson "SecurityConfiguration") _list path;
     configurations =
       option_of_yojson (value_for_key configuration_list_of_yojson "Configurations") _list path;
     master_public_dns_name =
       option_of_yojson (value_for_key string__of_yojson "MasterPublicDnsName") _list path;
     normalized_instance_hours =
       option_of_yojson (value_for_key integer_of_yojson "NormalizedInstanceHours") _list path;
     service_role = option_of_yojson (value_for_key string__of_yojson "ServiceRole") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     applications =
       option_of_yojson (value_for_key application_list_of_yojson "Applications") _list path;
     visible_to_all_users =
       option_of_yojson (value_for_key boolean__of_yojson "VisibleToAllUsers") _list path;
     unhealthy_node_replacement =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "UnhealthyNodeReplacement")
         _list path;
     termination_protected =
       option_of_yojson (value_for_key boolean__of_yojson "TerminationProtected") _list path;
     auto_terminate = option_of_yojson (value_for_key boolean__of_yojson "AutoTerminate") _list path;
     release_label = option_of_yojson (value_for_key string__of_yojson "ReleaseLabel") _list path;
     running_ami_version =
       option_of_yojson (value_for_key string__of_yojson "RunningAmiVersion") _list path;
     requested_ami_version =
       option_of_yojson (value_for_key string__of_yojson "RequestedAmiVersion") _list path;
     log_encryption_kms_key_id =
       option_of_yojson (value_for_key string__of_yojson "LogEncryptionKmsKeyId") _list path;
     log_uri = option_of_yojson (value_for_key string__of_yojson "LogUri") _list path;
     instance_collection_type =
       option_of_yojson
         (value_for_key instance_collection_type_of_yojson "InstanceCollectionType")
         _list path;
     ec2_instance_attributes =
       option_of_yojson
         (value_for_key ec2_instance_attributes_of_yojson "Ec2InstanceAttributes")
         _list path;
     status = option_of_yojson (value_for_key cluster_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key cluster_id_of_yojson "Id") _list path;
   }
    : cluster)

let describe_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : describe_cluster_output)

let describe_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path }
    : describe_cluster_input)

let delete_studio_session_mapping_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_type = value_for_key identity_type_of_yojson "IdentityType" _list path;
     identity_name =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityName") _list path;
     identity_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityId") _list path;
     studio_id = value_for_key xml_string_max_len256_of_yojson "StudioId" _list path;
   }
    : delete_studio_session_mapping_input)

let delete_studio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ studio_id = value_for_key xml_string_max_len256_of_yojson "StudioId" _list path }
    : delete_studio_input)

let delete_security_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_security_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key xml_string_of_yojson "Name" _list path }
    : delete_security_configuration_input)

let create_studio_session_mapping_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_policy_arn =
       value_for_key xml_string_max_len256_of_yojson "SessionPolicyArn" _list path;
     identity_type = value_for_key identity_type_of_yojson "IdentityType" _list path;
     identity_name =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityName") _list path;
     identity_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "IdentityId") _list path;
     studio_id = value_for_key xml_string_max_len256_of_yojson "StudioId" _list path;
   }
    : create_studio_session_mapping_input)

let create_studio_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     url = option_of_yojson (value_for_key xml_string_of_yojson "Url") _list path;
     studio_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "StudioId") _list path;
   }
    : create_studio_output)

let create_studio_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_key_arn =
       option_of_yojson (value_for_key xml_string_of_yojson "EncryptionKeyArn") _list path;
     idc_instance_arn =
       option_of_yojson (value_for_key arn_type_of_yojson "IdcInstanceArn") _list path;
     idc_user_assignment =
       option_of_yojson (value_for_key idc_user_assignment_of_yojson "IdcUserAssignment") _list path;
     trusted_identity_propagation_enabled =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "TrustedIdentityPropagationEnabled")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     idp_relay_state_parameter_name =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "IdpRelayStateParameterName")
         _list path;
     idp_auth_url = option_of_yojson (value_for_key xml_string_of_yojson "IdpAuthUrl") _list path;
     default_s3_location = value_for_key xml_string_of_yojson "DefaultS3Location" _list path;
     engine_security_group_id =
       value_for_key xml_string_max_len256_of_yojson "EngineSecurityGroupId" _list path;
     workspace_security_group_id =
       value_for_key xml_string_max_len256_of_yojson "WorkspaceSecurityGroupId" _list path;
     user_role = option_of_yojson (value_for_key xml_string_of_yojson "UserRole") _list path;
     service_role = value_for_key xml_string_of_yojson "ServiceRole" _list path;
     subnet_ids = value_for_key subnet_id_list_of_yojson "SubnetIds" _list path;
     vpc_id = value_for_key xml_string_max_len256_of_yojson "VpcId" _list path;
     auth_mode = value_for_key auth_mode_of_yojson "AuthMode" _list path;
     description =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "Description") _list path;
     name = value_for_key xml_string_max_len256_of_yojson "Name" _list path;
   }
    : create_studio_input)

let create_security_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date_time = value_for_key date_of_yojson "CreationDateTime" _list path;
     name = value_for_key xml_string_of_yojson "Name" _list path;
   }
    : create_security_configuration_output)

let create_security_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_configuration = value_for_key string__of_yojson "SecurityConfiguration" _list path;
     name = value_for_key xml_string_of_yojson "Name" _list path;
   }
    : create_security_configuration_input)

let create_persistent_app_ui_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     runtime_role_enabled_cluster =
       option_of_yojson (value_for_key boolean__of_yojson "RuntimeRoleEnabledCluster") _list path;
     persistent_app_ui_id =
       option_of_yojson
         (value_for_key xml_string_max_len256_of_yojson "PersistentAppUIId")
         _list path;
   }
    : create_persistent_app_ui_output)

let emr_containers_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_run_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "JobRunId") _list path;
   }
    : emr_containers_config)

let create_persistent_app_ui_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profiler_type =
       option_of_yojson (value_for_key profiler_type_of_yojson "ProfilerType") _list path;
     x_referer = option_of_yojson (value_for_key string__of_yojson "XReferer") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     emr_containers_config =
       option_of_yojson
         (value_for_key emr_containers_config_of_yojson "EMRContainersConfig")
         _list path;
     target_resource_arn = value_for_key arn_type_of_yojson "TargetResourceArn" _list path;
   }
    : create_persistent_app_ui_input)

let cancel_steps_request_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUBMITTED" -> SUBMITTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CancelStepsRequestStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CancelStepsRequestStatus")
     : cancel_steps_request_status)
    : cancel_steps_request_status)

let cancel_steps_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key string__of_yojson "Reason") _list path;
     status =
       option_of_yojson (value_for_key cancel_steps_request_status_of_yojson "Status") _list path;
     step_id = option_of_yojson (value_for_key step_id_of_yojson "StepId") _list path;
   }
    : cancel_steps_info)

let cancel_steps_info_list_of_yojson tree path =
  list_of_yojson cancel_steps_info_of_yojson tree path

let cancel_steps_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cancel_steps_info_list =
       option_of_yojson
         (value_for_key cancel_steps_info_list_of_yojson "CancelStepsInfoList")
         _list path;
   }
    : cancel_steps_output)

let cancel_steps_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     step_cancellation_option =
       option_of_yojson
         (value_for_key step_cancellation_option_of_yojson "StepCancellationOption")
         _list path;
     step_ids = value_for_key step_ids_list_of_yojson "StepIds" _list path;
     cluster_id = value_for_key xml_string_max_len256_of_yojson "ClusterId" _list path;
   }
    : cancel_steps_input)

let add_tags_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let add_tags_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_id = option_of_yojson (value_for_key cluster_id_of_yojson "ClusterId") _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
   }
    : add_tags_input)

let add_job_flow_steps_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ step_ids = option_of_yojson (value_for_key step_ids_list_of_yojson "StepIds") _list path }
    : add_job_flow_steps_output)

let add_job_flow_steps_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_role_arn =
       option_of_yojson (value_for_key arn_type_of_yojson "ExecutionRoleArn") _list path;
     steps = value_for_key step_config_list_of_yojson "Steps" _list path;
     job_flow_id = value_for_key xml_string_max_len256_of_yojson "JobFlowId" _list path;
   }
    : add_job_flow_steps_input)

let add_instance_groups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_arn = option_of_yojson (value_for_key arn_type_of_yojson "ClusterArn") _list path;
     instance_group_ids =
       option_of_yojson
         (value_for_key instance_group_ids_list_of_yojson "InstanceGroupIds")
         _list path;
     job_flow_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "JobFlowId") _list path;
   }
    : add_instance_groups_output)

let add_instance_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_flow_id = value_for_key xml_string_max_len256_of_yojson "JobFlowId" _list path;
     instance_groups =
       value_for_key instance_group_config_list_of_yojson "InstanceGroups" _list path;
   }
    : add_instance_groups_input)

let add_instance_fleet_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_arn = option_of_yojson (value_for_key arn_type_of_yojson "ClusterArn") _list path;
     instance_fleet_id =
       option_of_yojson (value_for_key instance_fleet_id_of_yojson "InstanceFleetId") _list path;
     cluster_id =
       option_of_yojson (value_for_key xml_string_max_len256_of_yojson "ClusterId") _list path;
   }
    : add_instance_fleet_output)

let add_instance_fleet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_fleet = value_for_key instance_fleet_config_of_yojson "InstanceFleet" _list path;
     cluster_id = value_for_key xml_string_max_len256_of_yojson "ClusterId" _list path;
   }
    : add_instance_fleet_input)
