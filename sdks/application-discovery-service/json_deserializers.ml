open Smaws_Lib.Json.DeserializeHelpers
open Types

let message_of_yojson = string_of_yojson

let server_internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : server_internal_error_exception)

let invalid_parameter_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_parameter_value_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_parameter_exception)

let home_region_not_set_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : home_region_not_set_exception)

let authorization_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : authorization_error_exception)

let update_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let application_wave_of_yojson = string_of_yojson
let application_description_of_yojson = string_of_yojson
let application_name_of_yojson = string_of_yojson
let application_id_of_yojson = string_of_yojson

let update_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_id = value_for_key application_id_of_yojson "configurationId" _list path;
     name = option_of_yojson (value_for_key application_name_of_yojson "name") _list path;
     description =
       option_of_yojson (value_for_key application_description_of_yojson "description") _list path;
     wave = option_of_yojson (value_for_key application_wave_of_yojson "wave") _list path;
   }
    : update_application_request)

let string__of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson

let agent_configuration_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agent_id = option_of_yojson (value_for_key string__of_yojson "agentId") _list path;
     operation_succeeded =
       option_of_yojson (value_for_key boolean__of_yojson "operationSucceeded") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
   }
    : agent_configuration_status)

let agent_configuration_status_list_of_yojson tree path =
  list_of_yojson agent_configuration_status_of_yojson tree path

let stop_data_collection_by_agent_ids_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agents_configuration_status =
       option_of_yojson
         (value_for_key agent_configuration_status_list_of_yojson "agentsConfigurationStatus")
         _list path;
   }
    : stop_data_collection_by_agent_ids_response)

let agent_id_of_yojson = string_of_yojson
let agent_ids_of_yojson tree path = list_of_yojson agent_id_of_yojson tree path

let stop_data_collection_by_agent_ids_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agent_ids = value_for_key agent_ids_of_yojson "agentIds" _list path }
    : stop_data_collection_by_agent_ids_request)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : resource_not_found_exception)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : resource_in_use_exception)

let operation_not_permitted_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : operation_not_permitted_exception)

let time_stamp_of_yojson = timestamp_epoch_seconds_of_yojson

let stop_continuous_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time = option_of_yojson (value_for_key time_stamp_of_yojson "startTime") _list path;
     stop_time = option_of_yojson (value_for_key time_stamp_of_yojson "stopTime") _list path;
   }
    : stop_continuous_export_response)

let configurations_export_id_of_yojson = string_of_yojson

let stop_continuous_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ export_id = value_for_key configurations_export_id_of_yojson "exportId" _list path }
    : stop_continuous_export_request)

let s3_presigned_url_of_yojson = string_of_yojson
let integer_of_yojson = int_of_yojson

let file_classification_of_yojson (tree : t) path =
  ((match tree with
    | `String "MODELIZEIT_EXPORT" -> MODELIZEIT_EXPORT
    | `String "RVTOOLS_EXPORT" -> RVTOOLS_EXPORT
    | `String "VMWARE_NSX_EXPORT" -> VMWARE_NSX_EXPORT
    | `String "IMPORT_TEMPLATE" -> IMPORT_TEMPLATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileClassification" value)
    | _ -> raise (deserialize_wrong_type_error path "FileClassification")
     : file_classification)
    : file_classification)

let import_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPORT_IN_PROGRESS" -> IMPORT_IN_PROGRESS
    | `String "IMPORT_COMPLETE" -> IMPORT_COMPLETE
    | `String "IMPORT_COMPLETE_WITH_ERRORS" -> IMPORT_COMPLETE_WITH_ERRORS
    | `String "IMPORT_FAILED" -> IMPORT_FAILED
    | `String "IMPORT_FAILED_SERVER_LIMIT_EXCEEDED" -> IMPORT_FAILED_SERVER_LIMIT_EXCEEDED
    | `String "IMPORT_FAILED_RECORD_LIMIT_EXCEEDED" -> IMPORT_FAILED_RECORD_LIMIT_EXCEEDED
    | `String "IMPORT_FAILED_UNSUPPORTED_FILE_TYPE" -> IMPORT_FAILED_UNSUPPORTED_FILE_TYPE
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETE_COMPLETE" -> DELETE_COMPLETE
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_FAILED_LIMIT_EXCEEDED" -> DELETE_FAILED_LIMIT_EXCEEDED
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportStatus")
     : import_status)
    : import_status)

let import_ur_l_of_yojson = string_of_yojson
let import_task_name_of_yojson = string_of_yojson
let client_request_token_of_yojson = string_of_yojson
let import_task_identifier_of_yojson = string_of_yojson

let import_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_task_id =
       option_of_yojson (value_for_key import_task_identifier_of_yojson "importTaskId") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "clientRequestToken")
         _list path;
     name = option_of_yojson (value_for_key import_task_name_of_yojson "name") _list path;
     import_url = option_of_yojson (value_for_key import_ur_l_of_yojson "importUrl") _list path;
     status = option_of_yojson (value_for_key import_status_of_yojson "status") _list path;
     import_request_time =
       option_of_yojson (value_for_key time_stamp_of_yojson "importRequestTime") _list path;
     import_completion_time =
       option_of_yojson (value_for_key time_stamp_of_yojson "importCompletionTime") _list path;
     import_deleted_time =
       option_of_yojson (value_for_key time_stamp_of_yojson "importDeletedTime") _list path;
     file_classification =
       option_of_yojson
         (value_for_key file_classification_of_yojson "fileClassification")
         _list path;
     server_import_success =
       option_of_yojson (value_for_key integer_of_yojson "serverImportSuccess") _list path;
     server_import_failure =
       option_of_yojson (value_for_key integer_of_yojson "serverImportFailure") _list path;
     application_import_success =
       option_of_yojson (value_for_key integer_of_yojson "applicationImportSuccess") _list path;
     application_import_failure =
       option_of_yojson (value_for_key integer_of_yojson "applicationImportFailure") _list path;
     errors_and_failed_entries_zip =
       option_of_yojson
         (value_for_key s3_presigned_url_of_yojson "errorsAndFailedEntriesZip")
         _list path;
   }
    : import_task)

let start_import_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task = option_of_yojson (value_for_key import_task_of_yojson "task") _list path }
    : start_import_task_response)

let start_import_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "clientRequestToken")
         _list path;
     name = value_for_key import_task_name_of_yojson "name" _list path;
     import_url = value_for_key import_ur_l_of_yojson "importUrl" _list path;
   }
    : start_import_task_request)

let start_export_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_id =
       option_of_yojson (value_for_key configurations_export_id_of_yojson "exportId") _list path;
   }
    : start_export_task_response)

let term_length_of_yojson (tree : t) path =
  ((match tree with
    | `String "ONE_YEAR" -> ONE_YEAR
    | `String "THREE_YEAR" -> THREE_YEAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "TermLength" value)
    | _ -> raise (deserialize_wrong_type_error path "TermLength")
     : term_length)
    : term_length)

let offering_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD" -> STANDARD
    | `String "CONVERTIBLE" -> CONVERTIBLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OfferingClass" value)
    | _ -> raise (deserialize_wrong_type_error path "OfferingClass")
     : offering_class)
    : offering_class)

let purchasing_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL_UPFRONT" -> ALL_UPFRONT
    | `String "PARTIAL_UPFRONT" -> PARTIAL_UPFRONT
    | `String "NO_UPFRONT" -> NO_UPFRONT
    | `String value -> raise (deserialize_unknown_enum_value_error path "PurchasingOption" value)
    | _ -> raise (deserialize_wrong_type_error path "PurchasingOption")
     : purchasing_option)
    : purchasing_option)

let reserved_instance_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     purchasing_option = value_for_key purchasing_option_of_yojson "purchasingOption" _list path;
     offering_class = value_for_key offering_class_of_yojson "offeringClass" _list path;
     term_length = value_for_key term_length_of_yojson "termLength" _list path;
   }
    : reserved_instance_options)

let user_preferred_region_of_yojson = string_of_yojson
let ec2_instance_type_of_yojson = string_of_yojson

let excluded_instance_types_of_yojson tree path =
  list_of_yojson ec2_instance_type_of_yojson tree path

let tenancy_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEDICATED" -> DEDICATED
    | `String "SHARED" -> SHARED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Tenancy" value)
    | _ -> raise (deserialize_wrong_type_error path "Tenancy")
     : tenancy)
    : tenancy)

let usage_metric_percentage_adjust_of_yojson = double_of_yojson
let usage_metric_basis_name_of_yojson = string_of_yojson

let usage_metric_basis_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key usage_metric_basis_name_of_yojson "name") _list path;
     percentage_adjust =
       option_of_yojson
         (value_for_key usage_metric_percentage_adjust_of_yojson "percentageAdjust")
         _list path;
   }
    : usage_metric_basis)

let export_enabled_of_yojson = bool_of_yojson

let ec2_recommendations_export_preferences_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = option_of_yojson (value_for_key export_enabled_of_yojson "enabled") _list path;
     cpu_performance_metric_basis =
       option_of_yojson
         (value_for_key usage_metric_basis_of_yojson "cpuPerformanceMetricBasis")
         _list path;
     ram_performance_metric_basis =
       option_of_yojson
         (value_for_key usage_metric_basis_of_yojson "ramPerformanceMetricBasis")
         _list path;
     tenancy = option_of_yojson (value_for_key tenancy_of_yojson "tenancy") _list path;
     excluded_instance_types =
       option_of_yojson
         (value_for_key excluded_instance_types_of_yojson "excludedInstanceTypes")
         _list path;
     preferred_region =
       option_of_yojson (value_for_key user_preferred_region_of_yojson "preferredRegion") _list path;
     reserved_instance_options =
       option_of_yojson
         (value_for_key reserved_instance_options_of_yojson "reservedInstanceOptions")
         _list path;
   }
    : ec2_recommendations_export_preferences)

let export_preferences_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "ec2RecommendationsPreferences" ->
       Ec2RecommendationsPreferences (ec2_recommendations_export_preferences_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ExportPreferences" unknown)
    : export_preferences)

let condition_of_yojson = string_of_yojson
let filter_value_of_yojson = string_of_yojson
let filter_values_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path
let filter_name_of_yojson = string_of_yojson

let export_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key filter_name_of_yojson "name" _list path;
     values = value_for_key filter_values_of_yojson "values" _list path;
     condition = value_for_key condition_of_yojson "condition" _list path;
   }
    : export_filter)

let export_filters_of_yojson tree path = list_of_yojson export_filter_of_yojson tree path

let export_data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "CSV" -> CSV
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportDataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportDataFormat")
     : export_data_format)
    : export_data_format)

let export_data_formats_of_yojson tree path = list_of_yojson export_data_format_of_yojson tree path

let start_export_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_data_format =
       option_of_yojson (value_for_key export_data_formats_of_yojson "exportDataFormat") _list path;
     filters = option_of_yojson (value_for_key export_filters_of_yojson "filters") _list path;
     start_time = option_of_yojson (value_for_key time_stamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key time_stamp_of_yojson "endTime") _list path;
     preferences =
       option_of_yojson (value_for_key export_preferences_of_yojson "preferences") _list path;
   }
    : start_export_task_request)

let start_data_collection_by_agent_ids_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agents_configuration_status =
       option_of_yojson
         (value_for_key agent_configuration_status_list_of_yojson "agentsConfigurationStatus")
         _list path;
   }
    : start_data_collection_by_agent_ids_response)

let start_data_collection_by_agent_ids_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agent_ids = value_for_key agent_ids_of_yojson "agentIds" _list path }
    : start_data_collection_by_agent_ids_request)

let conflict_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : conflict_error_exception)

let database_name_of_yojson = string_of_yojson

let schema_storage_config_of_yojson tree path =
  map_of_yojson database_name_of_yojson string__of_yojson tree path

let data_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "AGENT" -> AGENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataSource" value)
    | _ -> raise (deserialize_wrong_type_error path "DataSource")
     : data_source)
    : data_source)

let s3_bucket_of_yojson = string_of_yojson

let start_continuous_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_id =
       option_of_yojson (value_for_key configurations_export_id_of_yojson "exportId") _list path;
     s3_bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "s3Bucket") _list path;
     start_time = option_of_yojson (value_for_key time_stamp_of_yojson "startTime") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "dataSource") _list path;
     schema_storage_config =
       option_of_yojson
         (value_for_key schema_storage_config_of_yojson "schemaStorageConfig")
         _list path;
   }
    : start_continuous_export_response)

let start_continuous_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let uui_d_of_yojson = string_of_yojson

let start_batch_delete_configuration_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_id = option_of_yojson (value_for_key uui_d_of_yojson "taskId") _list path }
    : start_batch_delete_configuration_task_response)

let configuration_id_of_yojson = string_of_yojson
let configuration_id_list_of_yojson tree path = list_of_yojson configuration_id_of_yojson tree path

let deletion_configuration_item_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVER" -> SERVER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeletionConfigurationItemType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeletionConfigurationItemType")
     : deletion_configuration_item_type)
    : deletion_configuration_item_type)

let start_batch_delete_configuration_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_type =
       value_for_key deletion_configuration_item_type_of_yojson "configurationType" _list path;
     configuration_ids = value_for_key configuration_id_list_of_yojson "configurationIds" _list path;
   }
    : start_batch_delete_configuration_task_request)

let long_of_yojson = long_of_yojson
let boxed_integer_of_yojson = int_of_yojson

let neighbor_connection_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_server_id = value_for_key configuration_id_of_yojson "sourceServerId" _list path;
     destination_server_id =
       value_for_key configuration_id_of_yojson "destinationServerId" _list path;
     destination_port =
       option_of_yojson (value_for_key boxed_integer_of_yojson "destinationPort") _list path;
     transport_protocol =
       option_of_yojson (value_for_key string__of_yojson "transportProtocol") _list path;
     connections_count = value_for_key long_of_yojson "connectionsCount" _list path;
   }
    : neighbor_connection_detail)

let neighbor_details_list_of_yojson tree path =
  list_of_yojson neighbor_connection_detail_of_yojson tree path

let list_server_neighbors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     neighbors = value_for_key neighbor_details_list_of_yojson "neighbors" _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     known_dependency_count =
       option_of_yojson (value_for_key long_of_yojson "knownDependencyCount") _list path;
   }
    : list_server_neighbors_response)

let list_server_neighbors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_id = value_for_key configuration_id_of_yojson "configurationId" _list path;
     port_information_needed =
       option_of_yojson (value_for_key boolean__of_yojson "portInformationNeeded") _list path;
     neighbor_configuration_ids =
       option_of_yojson
         (value_for_key configuration_id_list_of_yojson "neighborConfigurationIds")
         _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_server_neighbors_request)

let next_token_of_yojson = string_of_yojson
let configuration_of_yojson tree path = map_of_yojson string__of_yojson string__of_yojson tree path
let configurations_of_yojson tree path = list_of_yojson configuration_of_yojson tree path

let list_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configurations =
       option_of_yojson (value_for_key configurations_of_yojson "configurations") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_configurations_response)

let order_string_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASC" -> ASC
    | `String "DESC" -> DESC
    | `String value -> raise (deserialize_unknown_enum_value_error path "orderString" value)
    | _ -> raise (deserialize_wrong_type_error path "orderString")
     : order_string)
    : order_string)

let order_by_element_field_name_of_yojson = string_of_yojson

let order_by_element_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_name = value_for_key order_by_element_field_name_of_yojson "fieldName" _list path;
     sort_order = option_of_yojson (value_for_key order_string_of_yojson "sortOrder") _list path;
   }
    : order_by_element)

let order_by_list_of_yojson tree path = list_of_yojson order_by_element_of_yojson tree path

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "name" _list path;
     values = value_for_key filter_values_of_yojson "values" _list path;
     condition = value_for_key condition_of_yojson "condition" _list path;
   }
    : filter)

let filters_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let configuration_item_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVER" -> SERVER
    | `String "PROCESS" -> PROCESS
    | `String "CONNECTION" -> CONNECTIONS
    | `String "APPLICATION" -> APPLICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConfigurationItemType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigurationItemType")
     : configuration_item_type)
    : configuration_item_type)

let list_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_type =
       value_for_key configuration_item_type_of_yojson "configurationType" _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "filters") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     order_by = option_of_yojson (value_for_key order_by_list_of_yojson "orderBy") _list path;
   }
    : list_configurations_request)

let customer_agentless_collector_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_agentless_collectors =
       value_for_key integer_of_yojson "activeAgentlessCollectors" _list path;
     healthy_agentless_collectors =
       value_for_key integer_of_yojson "healthyAgentlessCollectors" _list path;
     deny_listed_agentless_collectors =
       value_for_key integer_of_yojson "denyListedAgentlessCollectors" _list path;
     shutdown_agentless_collectors =
       value_for_key integer_of_yojson "shutdownAgentlessCollectors" _list path;
     unhealthy_agentless_collectors =
       value_for_key integer_of_yojson "unhealthyAgentlessCollectors" _list path;
     total_agentless_collectors =
       value_for_key integer_of_yojson "totalAgentlessCollectors" _list path;
     unknown_agentless_collectors =
       value_for_key integer_of_yojson "unknownAgentlessCollectors" _list path;
   }
    : customer_agentless_collector_info)

let customer_me_collector_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_me_collectors = value_for_key integer_of_yojson "activeMeCollectors" _list path;
     healthy_me_collectors = value_for_key integer_of_yojson "healthyMeCollectors" _list path;
     deny_listed_me_collectors = value_for_key integer_of_yojson "denyListedMeCollectors" _list path;
     shutdown_me_collectors = value_for_key integer_of_yojson "shutdownMeCollectors" _list path;
     unhealthy_me_collectors = value_for_key integer_of_yojson "unhealthyMeCollectors" _list path;
     total_me_collectors = value_for_key integer_of_yojson "totalMeCollectors" _list path;
     unknown_me_collectors = value_for_key integer_of_yojson "unknownMeCollectors" _list path;
   }
    : customer_me_collector_info)

let customer_connector_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_connectors = value_for_key integer_of_yojson "activeConnectors" _list path;
     healthy_connectors = value_for_key integer_of_yojson "healthyConnectors" _list path;
     black_listed_connectors = value_for_key integer_of_yojson "blackListedConnectors" _list path;
     shutdown_connectors = value_for_key integer_of_yojson "shutdownConnectors" _list path;
     unhealthy_connectors = value_for_key integer_of_yojson "unhealthyConnectors" _list path;
     total_connectors = value_for_key integer_of_yojson "totalConnectors" _list path;
     unknown_connectors = value_for_key integer_of_yojson "unknownConnectors" _list path;
   }
    : customer_connector_info)

let customer_agent_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_agents = value_for_key integer_of_yojson "activeAgents" _list path;
     healthy_agents = value_for_key integer_of_yojson "healthyAgents" _list path;
     black_listed_agents = value_for_key integer_of_yojson "blackListedAgents" _list path;
     shutdown_agents = value_for_key integer_of_yojson "shutdownAgents" _list path;
     unhealthy_agents = value_for_key integer_of_yojson "unhealthyAgents" _list path;
     total_agents = value_for_key integer_of_yojson "totalAgents" _list path;
     unknown_agents = value_for_key integer_of_yojson "unknownAgents" _list path;
   }
    : customer_agent_info)

let get_discovery_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     servers = option_of_yojson (value_for_key long_of_yojson "servers") _list path;
     applications = option_of_yojson (value_for_key long_of_yojson "applications") _list path;
     servers_mapped_to_applications =
       option_of_yojson (value_for_key long_of_yojson "serversMappedToApplications") _list path;
     servers_mappedto_tags =
       option_of_yojson (value_for_key long_of_yojson "serversMappedtoTags") _list path;
     agent_summary =
       option_of_yojson (value_for_key customer_agent_info_of_yojson "agentSummary") _list path;
     connector_summary =
       option_of_yojson
         (value_for_key customer_connector_info_of_yojson "connectorSummary")
         _list path;
     me_collector_summary =
       option_of_yojson
         (value_for_key customer_me_collector_info_of_yojson "meCollectorSummary")
         _list path;
     agentless_collector_summary =
       option_of_yojson
         (value_for_key customer_agentless_collector_info_of_yojson "agentlessCollectorSummary")
         _list path;
   }
    : get_discovery_summary_response)

let get_discovery_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let export_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_id =
       option_of_yojson (value_for_key configurations_export_id_of_yojson "exportId") _list path;
   }
    : export_configurations_response)

let disassociate_configuration_items_from_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_configuration_items_from_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_configuration_id =
       value_for_key application_id_of_yojson "applicationConfigurationId" _list path;
     configuration_ids = value_for_key configuration_id_list_of_yojson "configurationIds" _list path;
   }
    : disassociate_configuration_items_from_application_request)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let configuration_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_type =
       option_of_yojson
         (value_for_key configuration_item_type_of_yojson "configurationType")
         _list path;
     configuration_id =
       option_of_yojson (value_for_key configuration_id_of_yojson "configurationId") _list path;
     key = option_of_yojson (value_for_key tag_key_of_yojson "key") _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "value") _list path;
     time_of_creation =
       option_of_yojson (value_for_key time_stamp_of_yojson "timeOfCreation") _list path;
   }
    : configuration_tag)

let configuration_tag_set_of_yojson tree path = list_of_yojson configuration_tag_of_yojson tree path

let describe_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key configuration_tag_set_of_yojson "tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_tags_response)

let tag_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key filter_name_of_yojson "name" _list path;
     values = value_for_key filter_values_of_yojson "values" _list path;
   }
    : tag_filter)

let tag_filters_of_yojson tree path = list_of_yojson tag_filter_of_yojson tree path

let describe_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key tag_filters_of_yojson "filters") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_tags_request)

let import_task_list_of_yojson tree path = list_of_yojson import_task_of_yojson tree path

let describe_import_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     tasks = option_of_yojson (value_for_key import_task_list_of_yojson "tasks") _list path;
   }
    : describe_import_tasks_response)

let describe_import_tasks_max_results_of_yojson = int_of_yojson
let import_task_filter_value_of_yojson = string_of_yojson

let import_task_filter_value_list_of_yojson tree path =
  list_of_yojson import_task_filter_value_of_yojson tree path

let import_task_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPORT_TASK_ID" -> IMPORT_TASK_ID
    | `String "STATUS" -> STATUS
    | `String "NAME" -> NAME
    | `String "FILE_CLASSIFICATION" -> FILE_CLASSIFICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ImportTaskFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportTaskFilterName")
     : import_task_filter_name)
    : import_task_filter_name)

let import_task_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key import_task_filter_name_of_yojson "name") _list path;
     values =
       option_of_yojson (value_for_key import_task_filter_value_list_of_yojson "values") _list path;
   }
    : import_task_filter)

let describe_import_tasks_filter_list_of_yojson tree path =
  list_of_yojson import_task_filter_of_yojson tree path

let describe_import_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson
         (value_for_key describe_import_tasks_filter_list_of_yojson "filters")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key describe_import_tasks_max_results_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_import_tasks_request)

let export_request_time_of_yojson = timestamp_epoch_seconds_of_yojson
let configurations_download_url_of_yojson = string_of_yojson
let export_status_message_of_yojson = string_of_yojson

let export_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportStatus")
     : export_status)
    : export_status)

let export_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_id = value_for_key configurations_export_id_of_yojson "exportId" _list path;
     export_status = value_for_key export_status_of_yojson "exportStatus" _list path;
     status_message = value_for_key export_status_message_of_yojson "statusMessage" _list path;
     configurations_download_url =
       option_of_yojson
         (value_for_key configurations_download_url_of_yojson "configurationsDownloadUrl")
         _list path;
     export_request_time =
       value_for_key export_request_time_of_yojson "exportRequestTime" _list path;
     is_truncated = option_of_yojson (value_for_key boolean__of_yojson "isTruncated") _list path;
     requested_start_time =
       option_of_yojson (value_for_key time_stamp_of_yojson "requestedStartTime") _list path;
     requested_end_time =
       option_of_yojson (value_for_key time_stamp_of_yojson "requestedEndTime") _list path;
   }
    : export_info)

let exports_info_of_yojson tree path = list_of_yojson export_info_of_yojson tree path

let describe_export_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exports_info = option_of_yojson (value_for_key exports_info_of_yojson "exportsInfo") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_export_tasks_response)

let export_ids_of_yojson tree path = list_of_yojson configurations_export_id_of_yojson tree path

let describe_export_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_ids = option_of_yojson (value_for_key export_ids_of_yojson "exportIds") _list path;
     filters = option_of_yojson (value_for_key export_filters_of_yojson "filters") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_export_tasks_request)

let describe_export_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exports_info = option_of_yojson (value_for_key exports_info_of_yojson "exportsInfo") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_export_configurations_response)

let describe_export_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_ids = option_of_yojson (value_for_key export_ids_of_yojson "exportIds") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_export_configurations_request)

let string_max255_of_yojson = string_of_yojson

let continuous_export_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "START_IN_PROGRESS" -> START_IN_PROGRESS
    | `String "START_FAILED" -> START_FAILED
    | `String "ACTIVE" -> ACTIVE
    | `String "ERROR" -> ERROR
    | `String "STOP_IN_PROGRESS" -> STOP_IN_PROGRESS
    | `String "STOP_FAILED" -> STOP_FAILED
    | `String "INACTIVE" -> INACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContinuousExportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContinuousExportStatus")
     : continuous_export_status)
    : continuous_export_status)

let continuous_export_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_id =
       option_of_yojson (value_for_key configurations_export_id_of_yojson "exportId") _list path;
     status =
       option_of_yojson (value_for_key continuous_export_status_of_yojson "status") _list path;
     status_detail =
       option_of_yojson (value_for_key string_max255_of_yojson "statusDetail") _list path;
     s3_bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "s3Bucket") _list path;
     start_time = option_of_yojson (value_for_key time_stamp_of_yojson "startTime") _list path;
     stop_time = option_of_yojson (value_for_key time_stamp_of_yojson "stopTime") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "dataSource") _list path;
     schema_storage_config =
       option_of_yojson
         (value_for_key schema_storage_config_of_yojson "schemaStorageConfig")
         _list path;
   }
    : continuous_export_description)

let continuous_export_descriptions_of_yojson tree path =
  list_of_yojson continuous_export_description_of_yojson tree path

let describe_continuous_exports_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     descriptions =
       option_of_yojson
         (value_for_key continuous_export_descriptions_of_yojson "descriptions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_continuous_exports_response)

let describe_continuous_exports_max_results_of_yojson = int_of_yojson

let continuous_export_ids_of_yojson tree path =
  list_of_yojson configurations_export_id_of_yojson tree path

let describe_continuous_exports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_ids =
       option_of_yojson (value_for_key continuous_export_ids_of_yojson "exportIds") _list path;
     max_results =
       option_of_yojson
         (value_for_key describe_continuous_exports_max_results_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_continuous_exports_request)

let describe_configurations_attribute_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let describe_configurations_attributes_of_yojson tree path =
  list_of_yojson describe_configurations_attribute_of_yojson tree path

let describe_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configurations =
       option_of_yojson
         (value_for_key describe_configurations_attributes_of_yojson "configurations")
         _list path;
   }
    : describe_configurations_response)

let describe_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_ids = value_for_key configuration_id_list_of_yojson "configurationIds" _list path;
   }
    : describe_configurations_request)

let warning_text_of_yojson = string_of_yojson
let warning_code_of_yojson = int_of_yojson

let deletion_warning_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_id =
       option_of_yojson (value_for_key configuration_id_of_yojson "configurationId") _list path;
     warning_code = option_of_yojson (value_for_key warning_code_of_yojson "warningCode") _list path;
     warning_text = option_of_yojson (value_for_key warning_text_of_yojson "warningText") _list path;
   }
    : deletion_warning)

let deletion_warnings_list_of_yojson tree path = list_of_yojson deletion_warning_of_yojson tree path
let error_message_of_yojson = string_of_yojson
let error_status_code_of_yojson = int_of_yojson

let failed_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_id =
       option_of_yojson (value_for_key configuration_id_of_yojson "configurationId") _list path;
     error_status_code =
       option_of_yojson (value_for_key error_status_code_of_yojson "errorStatusCode") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
   }
    : failed_configuration)

let failed_configuration_list_of_yojson tree path =
  list_of_yojson failed_configuration_of_yojson tree path

let batch_delete_configuration_task_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "INITIALIZING" -> INITIALIZING
    | `String "VALIDATING" -> VALIDATING
    | `String "DELETING" -> DELETING
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BatchDeleteConfigurationTaskStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchDeleteConfigurationTaskStatus")
     : batch_delete_configuration_task_status)
    : batch_delete_configuration_task_status)

let batch_delete_configuration_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_id = option_of_yojson (value_for_key uui_d_of_yojson "taskId") _list path;
     status =
       option_of_yojson
         (value_for_key batch_delete_configuration_task_status_of_yojson "status")
         _list path;
     start_time = option_of_yojson (value_for_key time_stamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key time_stamp_of_yojson "endTime") _list path;
     configuration_type =
       option_of_yojson
         (value_for_key deletion_configuration_item_type_of_yojson "configurationType")
         _list path;
     requested_configurations =
       option_of_yojson
         (value_for_key configuration_id_list_of_yojson "requestedConfigurations")
         _list path;
     deleted_configurations =
       option_of_yojson
         (value_for_key configuration_id_list_of_yojson "deletedConfigurations")
         _list path;
     failed_configurations =
       option_of_yojson
         (value_for_key failed_configuration_list_of_yojson "failedConfigurations")
         _list path;
     deletion_warnings =
       option_of_yojson
         (value_for_key deletion_warnings_list_of_yojson "deletionWarnings")
         _list path;
   }
    : batch_delete_configuration_task)

let describe_batch_delete_configuration_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task =
       option_of_yojson (value_for_key batch_delete_configuration_task_of_yojson "task") _list path;
   }
    : describe_batch_delete_configuration_task_response)

let describe_batch_delete_configuration_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_id = value_for_key uui_d_of_yojson "taskId" _list path }
    : describe_batch_delete_configuration_task_request)

let agent_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "HEALTHY" -> HEALTHY
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "RUNNING" -> RUNNING
    | `String "UNKNOWN" -> UNKNOWN
    | `String "BLACKLISTED" -> BLACKLISTED
    | `String "SHUTDOWN" -> SHUTDOWN
    | `String value -> raise (deserialize_unknown_enum_value_error path "AgentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AgentStatus")
     : agent_status)
    : agent_status)

let agent_network_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address = option_of_yojson (value_for_key string__of_yojson "ipAddress") _list path;
     mac_address = option_of_yojson (value_for_key string__of_yojson "macAddress") _list path;
   }
    : agent_network_info)

let agent_network_info_list_of_yojson tree path =
  list_of_yojson agent_network_info_of_yojson tree path

let agent_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agent_id = option_of_yojson (value_for_key agent_id_of_yojson "agentId") _list path;
     host_name = option_of_yojson (value_for_key string__of_yojson "hostName") _list path;
     agent_network_info_list =
       option_of_yojson
         (value_for_key agent_network_info_list_of_yojson "agentNetworkInfoList")
         _list path;
     connector_id = option_of_yojson (value_for_key string__of_yojson "connectorId") _list path;
     version = option_of_yojson (value_for_key string__of_yojson "version") _list path;
     health = option_of_yojson (value_for_key agent_status_of_yojson "health") _list path;
     last_health_ping_time =
       option_of_yojson (value_for_key string__of_yojson "lastHealthPingTime") _list path;
     collection_status =
       option_of_yojson (value_for_key string__of_yojson "collectionStatus") _list path;
     agent_type = option_of_yojson (value_for_key string__of_yojson "agentType") _list path;
     registered_time =
       option_of_yojson (value_for_key string__of_yojson "registeredTime") _list path;
   }
    : agent_info)

let agents_info_of_yojson tree path = list_of_yojson agent_info_of_yojson tree path

let describe_agents_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agents_info = option_of_yojson (value_for_key agents_info_of_yojson "agentsInfo") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_agents_response)

let describe_agents_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agent_ids = option_of_yojson (value_for_key agent_ids_of_yojson "agentIds") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "filters") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_agents_request)

let delete_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "key" _list path;
     value = value_for_key tag_value_of_yojson "value" _list path;
   }
    : tag)

let tag_set_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let delete_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_ids = value_for_key configuration_id_list_of_yojson "configurationIds" _list path;
     tags = option_of_yojson (value_for_key tag_set_of_yojson "tags") _list path;
   }
    : delete_tags_request)

let delete_applications_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let application_ids_list_of_yojson tree path = list_of_yojson application_id_of_yojson tree path

let delete_applications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_ids = value_for_key application_ids_list_of_yojson "configurationIds" _list path;
   }
    : delete_applications_request)

let create_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_ids = value_for_key configuration_id_list_of_yojson "configurationIds" _list path;
     tags = value_for_key tag_set_of_yojson "tags" _list path;
   }
    : create_tags_request)

let create_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_id =
       option_of_yojson (value_for_key string__of_yojson "configurationId") _list path;
   }
    : create_application_response)

let create_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key application_name_of_yojson "name" _list path;
     description =
       option_of_yojson (value_for_key application_description_of_yojson "description") _list path;
     wave = option_of_yojson (value_for_key application_wave_of_yojson "wave") _list path;
   }
    : create_application_request)

let batch_delete_import_data_error_description_of_yojson = string_of_yojson

let batch_delete_import_data_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_FOUND" -> NOT_FOUND
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String "OVER_LIMIT" -> OVER_LIMIT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BatchDeleteImportDataErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchDeleteImportDataErrorCode")
     : batch_delete_import_data_error_code)
    : batch_delete_import_data_error_code)

let batch_delete_import_data_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_task_id =
       option_of_yojson (value_for_key import_task_identifier_of_yojson "importTaskId") _list path;
     error_code =
       option_of_yojson
         (value_for_key batch_delete_import_data_error_code_of_yojson "errorCode")
         _list path;
     error_description =
       option_of_yojson
         (value_for_key batch_delete_import_data_error_description_of_yojson "errorDescription")
         _list path;
   }
    : batch_delete_import_data_error)

let batch_delete_import_data_error_list_of_yojson tree path =
  list_of_yojson batch_delete_import_data_error_of_yojson tree path

let batch_delete_import_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_delete_import_data_error_list_of_yojson "errors")
         _list path;
   }
    : batch_delete_import_data_response)

let to_delete_identifier_list_of_yojson tree path =
  list_of_yojson import_task_identifier_of_yojson tree path

let batch_delete_import_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_task_ids = value_for_key to_delete_identifier_list_of_yojson "importTaskIds" _list path;
     delete_history = option_of_yojson (value_for_key boolean__of_yojson "deleteHistory") _list path;
   }
    : batch_delete_import_data_request)

let delete_agent_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_FOUND" -> NOT_FOUND
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String "AGENT_IN_USE" -> AGENT_IN_USE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeleteAgentErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "DeleteAgentErrorCode")
     : delete_agent_error_code)
    : delete_agent_error_code)

let batch_delete_agent_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agent_id = value_for_key agent_id_of_yojson "agentId" _list path;
     error_message = value_for_key string__of_yojson "errorMessage" _list path;
     error_code = value_for_key delete_agent_error_code_of_yojson "errorCode" _list path;
   }
    : batch_delete_agent_error)

let batch_delete_agent_errors_of_yojson tree path =
  list_of_yojson batch_delete_agent_error_of_yojson tree path

let batch_delete_agents_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson (value_for_key batch_delete_agent_errors_of_yojson "errors") _list path;
   }
    : batch_delete_agents_response)

let delete_agent_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agent_id = value_for_key agent_id_of_yojson "agentId" _list path;
     force = option_of_yojson (value_for_key boolean__of_yojson "force") _list path;
   }
    : delete_agent)

let delete_agents_of_yojson tree path = list_of_yojson delete_agent_of_yojson tree path

let batch_delete_agents_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ delete_agents = value_for_key delete_agents_of_yojson "deleteAgents" _list path }
    : batch_delete_agents_request)

let associate_configuration_items_to_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_configuration_items_to_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_configuration_id =
       value_for_key application_id_of_yojson "applicationConfigurationId" _list path;
     configuration_ids = value_for_key configuration_id_list_of_yojson "configurationIds" _list path;
   }
    : associate_configuration_items_to_application_request)
