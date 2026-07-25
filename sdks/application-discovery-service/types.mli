type nonrec message = string [@@ocaml.doc ""]

type nonrec server_internal_error_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The server experienced an internal error. Try again.\n"]

type nonrec invalid_parameter_value_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The value of one or more parameters are either invalid or out of range. Verify the parameter \
   values and try again.\n"]

type nonrec invalid_parameter_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "One or more parameters are not valid. Verify the parameters and try again.\n"]

type nonrec home_region_not_set_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The home Region is not set. Set the home Region to continue.\n"]

type nonrec authorization_error_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The user does not have permission to perform the action. Check the IAM policy associated with \
   this user.\n"]

type nonrec update_application_response = unit [@@ocaml.doc ""]

type nonrec application_wave = string [@@ocaml.doc ""]

type nonrec application_description = string [@@ocaml.doc ""]

type nonrec application_name = string [@@ocaml.doc ""]

type nonrec application_id = string [@@ocaml.doc ""]

type nonrec update_application_request = {
  configuration_id : application_id;
      [@ocaml.doc "Configuration ID of the application to be updated.\n"]
  name : application_name option; [@ocaml.doc "New name of the application to be updated.\n"]
  description : application_description option;
      [@ocaml.doc "New description of the application to be updated.\n"]
  wave : application_wave option;
      [@ocaml.doc "The new migration wave of the application that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec agent_configuration_status = {
  agent_id : string_ option; [@ocaml.doc "The agent ID.\n"]
  operation_succeeded : boolean_ option;
      [@ocaml.doc
        "Information about the status of the [StartDataCollection] and [StopDataCollection] \
         operations. The system has recorded the data collection operation. The agent receives \
         this command the next time it polls for a new command. \n"]
  description : string_ option; [@ocaml.doc "A description of the operation performed.\n"]
}
[@@ocaml.doc
  "Information about agents that were instructed to start collecting data. Information includes \
   the agent ID, a description of the operation, and whether the agent configuration was updated.\n"]

type nonrec agent_configuration_status_list = agent_configuration_status list [@@ocaml.doc ""]

type nonrec stop_data_collection_by_agent_ids_response = {
  agents_configuration_status : agent_configuration_status_list option;
      [@ocaml.doc
        "Information about the agents that were instructed to stop collecting data. Information \
         includes the agent ID, a description of the operation performed, and whether the agent \
         configuration was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec agent_id = string [@@ocaml.doc ""]

type nonrec agent_ids = agent_id list [@@ocaml.doc ""]

type nonrec stop_data_collection_by_agent_ids_request = {
  agent_ids : agent_ids; [@ocaml.doc "The IDs of the agents from which to stop collecting data.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified configuration ID was not located. Verify the configuration ID and try again.\n"]

type nonrec resource_in_use_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "This issue occurs when the same [clientRequestToken] is used with the [StartImportTask] action, \
   but with different parameters. For example, you use the same request token but have two \
   different import URLs, you can encounter this issue. If the import tasks are meant to be \
   different, use a different [clientRequestToken], and try again.\n"]

type nonrec operation_not_permitted_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "This operation is not permitted.\n"]

type nonrec time_stamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec stop_continuous_export_response = {
  start_time : time_stamp option;
      [@ocaml.doc
        "Timestamp that represents when this continuous export started collecting data.\n"]
  stop_time : time_stamp option;
      [@ocaml.doc "Timestamp that represents when this continuous export was stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec configurations_export_id = string [@@ocaml.doc ""]

type nonrec stop_continuous_export_request = {
  export_id : configurations_export_id; [@ocaml.doc "The unique ID assigned to this export.\n"]
}
[@@ocaml.doc ""]

type nonrec s3_presigned_url = string [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec file_classification =
  | MODELIZEIT_EXPORT [@ocaml.doc ""]
  | RVTOOLS_EXPORT [@ocaml.doc ""]
  | VMWARE_NSX_EXPORT [@ocaml.doc ""]
  | IMPORT_TEMPLATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec import_status =
  | IMPORT_IN_PROGRESS [@ocaml.doc ""]
  | IMPORT_COMPLETE [@ocaml.doc ""]
  | IMPORT_COMPLETE_WITH_ERRORS [@ocaml.doc ""]
  | IMPORT_FAILED [@ocaml.doc ""]
  | IMPORT_FAILED_SERVER_LIMIT_EXCEEDED [@ocaml.doc ""]
  | IMPORT_FAILED_RECORD_LIMIT_EXCEEDED [@ocaml.doc ""]
  | IMPORT_FAILED_UNSUPPORTED_FILE_TYPE [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_COMPLETE [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_FAILED_LIMIT_EXCEEDED [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec import_ur_l = string [@@ocaml.doc ""]

type nonrec import_task_name = string [@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec import_task_identifier = string [@@ocaml.doc ""]

type nonrec import_task = {
  import_task_id : import_task_identifier option;
      [@ocaml.doc
        "The unique ID for a specific import task. These IDs aren't globally unique, but they are \
         unique within an Amazon Web Services account.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique token used to prevent the same import request from occurring more than once. If \
         you didn't provide a token, a token was automatically generated when the import task \
         request was sent.\n"]
  name : import_task_name option;
      [@ocaml.doc
        "A descriptive name for an import task. You can use this name to filter future requests \
         related to this import task, such as identifying applications and servers that were \
         included in this import task. We recommend that you use a meaningful name for each import \
         task.\n"]
  import_url : import_ur_l option;
      [@ocaml.doc "The URL for your import file that you've uploaded to Amazon S3.\n"]
  status : import_status option;
      [@ocaml.doc
        "The status of the import task. An import can have the status of [IMPORT_COMPLETE] and \
         still have some records fail to import from the overall request. More information can be \
         found in the downloadable archive defined in the [errorsAndFailedEntriesZip] field, or in \
         the Migration Hub management console.\n"]
  import_request_time : time_stamp option;
      [@ocaml.doc
        "The time that the import task request was made, presented in the Unix time stamp format.\n"]
  import_completion_time : time_stamp option;
      [@ocaml.doc
        "The time that the import task request finished, presented in the Unix time stamp format.\n"]
  import_deleted_time : time_stamp option;
      [@ocaml.doc
        "The time that the import task request was deleted, presented in the Unix time stamp format.\n"]
  file_classification : file_classification option;
      [@ocaml.doc "The type of file detected by the import task.\n"]
  server_import_success : integer option;
      [@ocaml.doc
        "The total number of server records in the import file that were successfully imported.\n"]
  server_import_failure : integer option;
      [@ocaml.doc
        "The total number of server records in the import file that failed to be imported.\n"]
  application_import_success : integer option;
      [@ocaml.doc
        "The total number of application records in the import file that were successfully imported.\n"]
  application_import_failure : integer option;
      [@ocaml.doc
        "The total number of application records in the import file that failed to be imported.\n"]
  errors_and_failed_entries_zip : s3_presigned_url option;
      [@ocaml.doc
        "A link to a compressed archive folder (in the ZIP format) that contains an error log and \
         a file of failed records. You can use these two files to quickly identify records that \
         failed, why they failed, and correct those records. Afterward, you can upload the \
         corrected file to your Amazon S3 bucket and create another import task request.\n\n\
        \ This field also includes authorization information so you can confirm the authenticity \
         of the compressed archive before you download it.\n\
        \ \n\
        \  If some records failed to be imported we recommend that you correct the records in the \
         failed entries file and then imports that failed entries file. This prevents you from \
         having to correct and update the larger original file and attempt importing it again.\n\
        \  "]
}
[@@ocaml.doc
  "An array of information related to the import task request that includes status information, \
   times, IDs, the Amazon S3 Object URL for the import file, and more.\n"]

type nonrec start_import_task_response = {
  task : import_task option;
      [@ocaml.doc
        "An array of information related to the import task request including status information, \
         times, IDs, the Amazon S3 Object URL for the import file, and more. \n"]
}
[@@ocaml.doc ""]

type nonrec start_import_task_request = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Optional. A unique token that you can provide to prevent the same import request from \
         occurring more than once. If you don't provide a token, a token is automatically \
         generated.\n\n\
        \ Sending more than one [StartImportTask] request with the same client request token will \
         return information about the original import task with that client request token.\n\
        \ "]
  name : import_task_name;
      [@ocaml.doc
        "A descriptive name for this request. You can use this name to filter future requests \
         related to this import task, such as identifying applications and servers that were \
         included in this import task. We recommend that you use a meaningful name for each import \
         task.\n"]
  import_url : import_ur_l;
      [@ocaml.doc
        "The URL for your import file that you've uploaded to Amazon S3.\n\n\
        \  If you're using the Amazon Web Services CLI, this URL is structured as follows: \
         [s3://BucketName/ImportFileName.CSV] \n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec start_export_task_response = {
  export_id : configurations_export_id option;
      [@ocaml.doc "A unique identifier used to query the status of an export request.\n"]
}
[@@ocaml.doc ""]

type nonrec term_length = ONE_YEAR [@ocaml.doc ""] | THREE_YEAR [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec offering_class = STANDARD [@ocaml.doc ""] | CONVERTIBLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec purchasing_option =
  | ALL_UPFRONT [@ocaml.doc ""]
  | PARTIAL_UPFRONT [@ocaml.doc ""]
  | NO_UPFRONT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reserved_instance_options = {
  purchasing_option : purchasing_option;
      [@ocaml.doc " The payment plan to use for your Reserved Instance. \n"]
  offering_class : offering_class;
      [@ocaml.doc
        " The flexibility to change the instance types needed for your Reserved Instance. \n"]
  term_length : term_length; [@ocaml.doc " The preferred duration of the Reserved Instance term. \n"]
}
[@@ocaml.doc " Used to provide Reserved Instance preferences for the recommendation. \n"]

type nonrec user_preferred_region = string [@@ocaml.doc ""]

type nonrec ec2_instance_type = string [@@ocaml.doc ""]

type nonrec excluded_instance_types = ec2_instance_type list [@@ocaml.doc ""]

type nonrec tenancy = DEDICATED [@ocaml.doc ""] | SHARED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec usage_metric_percentage_adjust = float [@@ocaml.doc ""]

type nonrec usage_metric_basis_name = string [@@ocaml.doc ""]

type nonrec usage_metric_basis = {
  name : usage_metric_basis_name option;
      [@ocaml.doc " A utilization metric that is used by the recommendations. \n"]
  percentage_adjust : usage_metric_percentage_adjust option;
      [@ocaml.doc
        " Specifies the percentage of the specified utilization metric that is used by the \
         recommendations. \n"]
}
[@@ocaml.doc
  " Specifies the performance metrics to use for the server that is used for recommendations. \n"]

type nonrec export_enabled = bool [@@ocaml.doc ""]

type nonrec ec2_recommendations_export_preferences = {
  enabled : export_enabled option;
      [@ocaml.doc
        " If set to true, the export \
         {{:https://docs.aws.amazon.com/application-discovery/latest/APIReference/API_StartExportTask.html#API_StartExportTask_RequestSyntax}preferences} \
         is set to [Ec2RecommendationsExportPreferences]. \n"]
  cpu_performance_metric_basis : usage_metric_basis option;
      [@ocaml.doc
        " The recommended EC2 instance type that matches the CPU usage metric of server \
         performance data. \n"]
  ram_performance_metric_basis : usage_metric_basis option;
      [@ocaml.doc
        " The recommended EC2 instance type that matches the Memory usage metric of server \
         performance data. \n"]
  tenancy : tenancy option;
      [@ocaml.doc " The target tenancy to use for your recommended EC2 instances. \n"]
  excluded_instance_types : excluded_instance_types option;
      [@ocaml.doc " An array of instance types to exclude from recommendations. \n"]
  preferred_region : user_preferred_region option;
      [@ocaml.doc
        " The target Amazon Web Services Region for the recommendations. You can use any of the \
         Region codes available for the chosen service, as listed in \
         {{:https://docs.aws.amazon.com/general/latest/gr/rande.html}Amazon Web Services service \
         endpoints} in the {i Amazon Web Services General Reference}. \n"]
  reserved_instance_options : reserved_instance_options option;
      [@ocaml.doc
        " The contract type for a reserved instance. If blank, we assume an On-Demand instance is \
         preferred. \n"]
}
[@@ocaml.doc
  " Indicates that the exported data must include EC2 instance type matches for on-premises \
   servers that are discovered through Amazon Web Services Application Discovery Service. \n"]

type nonrec export_preferences =
  | Ec2RecommendationsPreferences of ec2_recommendations_export_preferences
      [@ocaml.doc
        " If enabled, exported data includes EC2 instance type matches for on-premises servers \
         discovered through Amazon Web Services Application Discovery Service. \n"]
[@@ocaml.doc
  " Indicates the type of data that is being exported. Only one [ExportPreferences] can be enabled \
   for a \
   {{:https://docs.aws.amazon.com/application-discovery/latest/APIReference/API_StartExportTask.html}StartExportTask} \
   action. \n"]

type nonrec condition = string [@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_values = filter_value list [@@ocaml.doc ""]

type nonrec filter_name = string [@@ocaml.doc ""]

type nonrec export_filter = {
  name : filter_name; [@ocaml.doc "A single [ExportFilter] name. Supported filters: [agentIds].\n"]
  values : filter_values;
      [@ocaml.doc
        "A single agent ID for a Discovery Agent. An agent ID can be found using the \
         {{:http://docs.aws.amazon.com/application-discovery/latest/APIReference/API_DescribeAgents.html}DescribeAgents} \
         action. Typically an ADS agent ID is in the form [o-0123456789abcdef0].\n"]
  condition : condition; [@ocaml.doc "Supported condition: [EQUALS] \n"]
}
[@@ocaml.doc
  "Used to select which agent's data is to be exported. A single agent ID may be selected for \
   export using the \
   {{:http://docs.aws.amazon.com/application-discovery/latest/APIReference/API_StartExportTask.html}StartExportTask} \
   action.\n"]

type nonrec export_filters = export_filter list [@@ocaml.doc ""]

type nonrec export_data_format = CSV [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec export_data_formats = export_data_format list [@@ocaml.doc ""]

type nonrec start_export_task_request = {
  export_data_format : export_data_formats option;
      [@ocaml.doc
        "The file format for the returned export data. Default value is [CSV]. {b Note:} {i The} \
         [GRAPHML] {i option has been deprecated.} \n"]
  filters : export_filters option;
      [@ocaml.doc
        "If a filter is present, it selects the single [agentId] of the Application Discovery \
         Agent for which data is exported. The [agentId] can be found in the results of the \
         [DescribeAgents] API or CLI. If no filter is present, [startTime] and [endTime] are \
         ignored and exported data includes both Amazon Web Services Application Discovery Service \
         Agentless Collector collectors data and summary data from Application Discovery Agent \
         agents. \n"]
  start_time : time_stamp option;
      [@ocaml.doc
        "The start timestamp for exported data from the single Application Discovery Agent \
         selected in the filters. If no value is specified, data is exported starting from the \
         first data collected by the agent.\n"]
  end_time : time_stamp option;
      [@ocaml.doc
        "The end timestamp for exported data from the single Application Discovery Agent selected \
         in the filters. If no value is specified, exported data includes the most recent data \
         collected by the agent.\n"]
  preferences : export_preferences option;
      [@ocaml.doc
        " Indicates the type of data that needs to be exported. Only one \
         {{:https://docs.aws.amazon.com/application-discovery/latest/APIReference/API_ExportPreferences.html}ExportPreferences} \
         can be enabled at any time. \n"]
}
[@@ocaml.doc ""]

type nonrec start_data_collection_by_agent_ids_response = {
  agents_configuration_status : agent_configuration_status_list option;
      [@ocaml.doc
        "Information about agents that were instructed to start collecting data. Information \
         includes the agent ID, a description of the operation performed, and whether the agent \
         configuration was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec start_data_collection_by_agent_ids_request = {
  agent_ids : agent_ids;
      [@ocaml.doc
        "The IDs of the agents from which to start collecting data. If you send a request to an \
         agent ID that you do not have permission to contact, according to your Amazon Web \
         Services account, the service does not throw an exception. Instead, it returns the error \
         in the {i Description} field. If you send a request to multiple agents and you do not \
         have permission to contact some of those agents, the system does not throw an exception. \
         Instead, the system shows [Failed] in the {i Description} field.\n"]
}
[@@ocaml.doc ""]

type nonrec conflict_error_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "Conflict error.\n"]

type nonrec database_name = string [@@ocaml.doc ""]

type nonrec schema_storage_config = (database_name * string_) list [@@ocaml.doc ""]

type nonrec data_source = AGENT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec start_continuous_export_response = {
  export_id : configurations_export_id option;
      [@ocaml.doc "The unique ID assigned to this export.\n"]
  s3_bucket : s3_bucket option;
      [@ocaml.doc "The name of the s3 bucket where the export data parquet files are stored.\n"]
  start_time : time_stamp option;
      [@ocaml.doc "The timestamp representing when the continuous export was started.\n"]
  data_source : data_source option;
      [@ocaml.doc
        "The type of data collector used to gather this data (currently only offered for AGENT).\n"]
  schema_storage_config : schema_storage_config option;
      [@ocaml.doc
        "A dictionary which describes how the data is stored.\n\n\
        \ {ul\n\
        \       {-   [databaseName] - the name of the Glue database used to store the schema.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec start_continuous_export_request = unit [@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc " The limit of 200 configuration IDs per request has been exceeded. \n"]

type nonrec uui_d = string [@@ocaml.doc ""]

type nonrec start_batch_delete_configuration_task_response = {
  task_id : uui_d option;
      [@ocaml.doc " The unique identifier associated with the newly started deletion task. \n"]
}
[@@ocaml.doc ""]

type nonrec configuration_id = string [@@ocaml.doc ""]

type nonrec configuration_id_list = configuration_id list [@@ocaml.doc ""]

type nonrec deletion_configuration_item_type = SERVER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec start_batch_delete_configuration_task_request = {
  configuration_type : deletion_configuration_item_type;
      [@ocaml.doc " The type of configuration item to delete. Supported types are: SERVER. \n"]
  configuration_ids : configuration_id_list;
      [@ocaml.doc " The list of configuration IDs that will be deleted by the task. \n"]
}
[@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec boxed_integer = int [@@ocaml.doc ""]

type nonrec neighbor_connection_detail = {
  source_server_id : configuration_id;
      [@ocaml.doc "The ID of the server that opened the network connection.\n"]
  destination_server_id : configuration_id;
      [@ocaml.doc "The ID of the server that accepted the network connection.\n"]
  destination_port : boxed_integer option;
      [@ocaml.doc "The destination network port for the connection.\n"]
  transport_protocol : string_ option;
      [@ocaml.doc "The network protocol used for the connection.\n"]
  connections_count : long;
      [@ocaml.doc "The number of open network connections with the neighboring server.\n"]
}
[@@ocaml.doc "Details about neighboring servers.\n"]

type nonrec neighbor_details_list = neighbor_connection_detail list [@@ocaml.doc ""]

type nonrec list_server_neighbors_response = {
  neighbors : neighbor_details_list;
      [@ocaml.doc "List of distinct servers that are one hop away from the given server.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "Token to retrieve the next set of results. For example, if you specified 100 IDs for \
         [ListServerNeighborsRequest$neighborConfigurationIds] but set \
         [ListServerNeighborsRequest$maxResults] to 10, you received a set of 10 results along \
         with this token. Use this token in the next query to retrieve the next set of 10.\n"]
  known_dependency_count : long option;
      [@ocaml.doc "Count of distinct servers that are one hop away from the given server.\n"]
}
[@@ocaml.doc ""]

type nonrec list_server_neighbors_request = {
  configuration_id : configuration_id;
      [@ocaml.doc "Configuration ID of the server for which neighbors are being listed.\n"]
  port_information_needed : boolean_ option;
      [@ocaml.doc
        "Flag to indicate if port and protocol information is needed as part of the response.\n"]
  neighbor_configuration_ids : configuration_id_list option;
      [@ocaml.doc "List of configuration IDs to test for one-hop-away.\n"]
  max_results : integer option;
      [@ocaml.doc "Maximum number of results to return in a single page of output.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "Token to retrieve the next set of results. For example, if you previously specified 100 \
         IDs for [ListServerNeighborsRequest$neighborConfigurationIds] but set \
         [ListServerNeighborsRequest$maxResults] to 10, you received a set of 10 results along \
         with a token. Use that token in this query to get the next set of 10.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec configuration = (string_ * string_) list [@@ocaml.doc ""]

type nonrec configurations = configuration list [@@ocaml.doc ""]

type nonrec list_configurations_response = {
  configurations : configurations option;
      [@ocaml.doc
        "Returns configuration details, including the configuration ID, attribute names, and \
         attribute values.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Token to retrieve the next set of results. For example, if your call to \
         ListConfigurations returned 100 items, but you set [ListConfigurationsRequest$maxResults] \
         to 10, you received a set of 10 results along with this token. Use this token in the next \
         query to retrieve the next set of 10.\n"]
}
[@@ocaml.doc ""]

type nonrec order_string = ASC [@ocaml.doc ""] | DESC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec order_by_element_field_name = string [@@ocaml.doc ""]

type nonrec order_by_element = {
  field_name : order_by_element_field_name; [@ocaml.doc "The field on which to order.\n"]
  sort_order : order_string option; [@ocaml.doc "Ordering direction.\n"]
}
[@@ocaml.doc "A field and direction for ordered output.\n"]

type nonrec order_by_list = order_by_element list [@@ocaml.doc ""]

type nonrec filter = {
  name : string_; [@ocaml.doc "The name of the filter.\n"]
  values : filter_values;
      [@ocaml.doc
        "A string value on which to filter. For example, if you choose the \
         [destinationServer.osVersion] filter name, you could specify [Ubuntu] for the value.\n"]
  condition : condition;
      [@ocaml.doc
        "A conditional operator. The following operators are valid: EQUALS, NOT_EQUALS, CONTAINS, \
         NOT_CONTAINS. If you specify multiple filters, the system utilizes all filters as though \
         concatenated by {i AND}. If you specify multiple values for a particular filter, the \
         system differentiates the values using {i OR}. Calling either {i DescribeConfigurations} \
         or {i ListConfigurations} returns attributes of matching configuration items.\n"]
}
[@@ocaml.doc
  "A filter that can use conditional operators.\n\n\
  \ For more information about filters, see \
   {{:https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html}Querying \
   Discovered Configuration Items} in the {i Amazon Web Services Application Discovery Service \
   User Guide}. \n\
  \ "]

type nonrec filters = filter list [@@ocaml.doc ""]

type nonrec configuration_item_type =
  | SERVER [@ocaml.doc ""]
  | PROCESS [@ocaml.doc ""]
  | CONNECTIONS [@ocaml.doc ""]
  | APPLICATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_configurations_request = {
  configuration_type : configuration_item_type;
      [@ocaml.doc "A valid configuration identified by Application Discovery Service. \n"]
  filters : filters option;
      [@ocaml.doc
        "You can filter the request using various logical operators and a {i key}-{i value} \
         format. For example: \n\n\
        \  [{\"key\": \"serverType\", \"value\": \"webServer\"}] \n\
        \ \n\
        \  For a complete list of filter options and guidance about using them with this action, \
         see \
         {{:https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#ListConfigurations}Using \
         the ListConfigurations Action} in the {i Amazon Web Services Application Discovery \
         Service User Guide}.\n\
        \  "]
  max_results : integer option;
      [@ocaml.doc "The total number of items to return. The maximum value is 100.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Token to retrieve the next set of results. For example, if a previous call to \
         ListConfigurations returned 100 items, but you set [ListConfigurationsRequest$maxResults] \
         to 10, you received a set of 10 results along with a token. Use that token in this query \
         to get the next set of 10.\n"]
  order_by : order_by_list option;
      [@ocaml.doc
        "Certain filter criteria return output that can be sorted in ascending or descending \
         order. For a list of output characteristics for each filter, see \
         {{:https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#ListConfigurations}Using \
         the ListConfigurations Action} in the {i Amazon Web Services Application Discovery \
         Service User Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec customer_agentless_collector_info = {
  active_agentless_collectors : integer;
      [@ocaml.doc "The number of active Agentless Collector collectors. \n"]
  healthy_agentless_collectors : integer;
      [@ocaml.doc "The number of healthy Agentless Collector collectors. \n"]
  deny_listed_agentless_collectors : integer;
      [@ocaml.doc "The number of deny-listed Agentless Collector collectors. \n"]
  shutdown_agentless_collectors : integer;
      [@ocaml.doc "The number of Agentless Collector collectors with [SHUTDOWN] status. \n"]
  unhealthy_agentless_collectors : integer;
      [@ocaml.doc " The number of unhealthy Agentless Collector collectors. \n"]
  total_agentless_collectors : integer;
      [@ocaml.doc " The total number of Agentless Collector collectors. \n"]
  unknown_agentless_collectors : integer;
      [@ocaml.doc " The number of unknown Agentless Collector collectors. \n"]
}
[@@ocaml.doc "The inventory data for installed Agentless Collector collectors. \n"]

type nonrec customer_me_collector_info = {
  active_me_collectors : integer;
      [@ocaml.doc " The number of active Migration Evaluator collectors. \n"]
  healthy_me_collectors : integer;
      [@ocaml.doc " The number of healthy Migration Evaluator collectors. \n"]
  deny_listed_me_collectors : integer;
      [@ocaml.doc " The number of deny-listed Migration Evaluator collectors. \n"]
  shutdown_me_collectors : integer;
      [@ocaml.doc " The number of Migration Evaluator collectors with [SHUTDOWN] status. \n"]
  unhealthy_me_collectors : integer;
      [@ocaml.doc " The number of unhealthy Migration Evaluator collectors. \n"]
  total_me_collectors : integer;
      [@ocaml.doc " The total number of Migration Evaluator collectors. \n"]
  unknown_me_collectors : integer;
      [@ocaml.doc " The number of unknown Migration Evaluator collectors. \n"]
}
[@@ocaml.doc " The inventory data for installed Migration Evaluator collectors. \n"]

type nonrec customer_connector_info = {
  active_connectors : integer; [@ocaml.doc "Number of active discovery connectors.\n"]
  healthy_connectors : integer; [@ocaml.doc "Number of healthy discovery connectors.\n"]
  black_listed_connectors : integer; [@ocaml.doc "Number of blacklisted discovery connectors.\n"]
  shutdown_connectors : integer;
      [@ocaml.doc "Number of discovery connectors with status SHUTDOWN,\n"]
  unhealthy_connectors : integer; [@ocaml.doc "Number of unhealthy discovery connectors.\n"]
  total_connectors : integer; [@ocaml.doc "Total number of discovery connectors.\n"]
  unknown_connectors : integer; [@ocaml.doc "Number of unknown discovery connectors.\n"]
}
[@@ocaml.doc "Inventory data for installed discovery connectors.\n"]

type nonrec customer_agent_info = {
  active_agents : integer; [@ocaml.doc "Number of active discovery agents.\n"]
  healthy_agents : integer; [@ocaml.doc "Number of healthy discovery agents\n"]
  black_listed_agents : integer; [@ocaml.doc "Number of blacklisted discovery agents.\n"]
  shutdown_agents : integer; [@ocaml.doc "Number of discovery agents with status SHUTDOWN.\n"]
  unhealthy_agents : integer; [@ocaml.doc "Number of unhealthy discovery agents.\n"]
  total_agents : integer; [@ocaml.doc "Total number of discovery agents.\n"]
  unknown_agents : integer; [@ocaml.doc "Number of unknown discovery agents.\n"]
}
[@@ocaml.doc "Inventory data for installed discovery agents.\n"]

type nonrec get_discovery_summary_response = {
  servers : long option; [@ocaml.doc "The number of servers discovered.\n"]
  applications : long option; [@ocaml.doc "The number of applications discovered.\n"]
  servers_mapped_to_applications : long option;
      [@ocaml.doc "The number of servers mapped to applications.\n"]
  servers_mappedto_tags : long option; [@ocaml.doc "The number of servers mapped to tags.\n"]
  agent_summary : customer_agent_info option;
      [@ocaml.doc "Details about discovered agents, including agent status and health.\n"]
  connector_summary : customer_connector_info option;
      [@ocaml.doc "Details about discovered connectors, including connector status and health.\n"]
  me_collector_summary : customer_me_collector_info option;
      [@ocaml.doc
        " Details about Migration Evaluator collectors, including collector status and health. \n"]
  agentless_collector_summary : customer_agentless_collector_info option;
      [@ocaml.doc " Details about Agentless Collector collectors, including status. \n"]
}
[@@ocaml.doc ""]

type nonrec get_discovery_summary_request = unit [@@ocaml.doc ""]

type nonrec export_configurations_response = {
  export_id : configurations_export_id option;
      [@ocaml.doc "A unique identifier that you can use to query the export status.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_configuration_items_from_application_response = unit [@@ocaml.doc ""]

type nonrec disassociate_configuration_items_from_application_request = {
  application_configuration_id : application_id;
      [@ocaml.doc "Configuration ID of an application from which each item is disassociated.\n"]
  configuration_ids : configuration_id_list;
      [@ocaml.doc "Configuration ID of each item to be disassociated from an application.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec configuration_tag = {
  configuration_type : configuration_item_type option; [@ocaml.doc "A type of IT asset to tag.\n"]
  configuration_id : configuration_id option;
      [@ocaml.doc
        "The configuration ID for the item to tag. You can specify a list of keys and values.\n"]
  key : tag_key option;
      [@ocaml.doc "A type of tag on which to filter. For example, {i serverType}.\n"]
  value : tag_value option;
      [@ocaml.doc
        "A value on which to filter. For example {i key = serverType} and {i value = web server}.\n"]
  time_of_creation : time_stamp option;
      [@ocaml.doc
        "The time the configuration tag was created in Coordinated Universal Time (UTC).\n"]
}
[@@ocaml.doc
  "Tags for a configuration item. Tags are metadata that help you categorize IT assets.\n"]

type nonrec configuration_tag_set = configuration_tag list [@@ocaml.doc ""]

type nonrec describe_tags_response = {
  tags : configuration_tag_set option;
      [@ocaml.doc
        "Depending on the input, this is a list of configuration items tagged with a specific tag, \
         or a list of tags for a specific configuration item.\n"]
  next_token : next_token option;
      [@ocaml.doc "The call returns a token. Use this token to get the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_filter = {
  name : filter_name; [@ocaml.doc "A name of the tag filter.\n"]
  values : filter_values; [@ocaml.doc "Values for the tag filter.\n"]
}
[@@ocaml.doc "The tag filter. Valid names are: [tagKey], [tagValue], [configurationId].\n"]

type nonrec tag_filters = tag_filter list [@@ocaml.doc ""]

type nonrec describe_tags_request = {
  filters : tag_filters option;
      [@ocaml.doc
        "You can filter the list using a {i key}-{i value} format. You can separate these items by \
         using logical operators. Allowed filters include [tagKey], [tagValue], and \
         [configurationId]. \n"]
  max_results : integer option;
      [@ocaml.doc
        "The total number of items to return in a single page of output. The maximum value is 100.\n"]
  next_token : next_token option;
      [@ocaml.doc "A token to start the list. Use this token to get the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec import_task_list = import_task list [@@ocaml.doc ""]

type nonrec describe_import_tasks_response = {
  next_token : next_token option; [@ocaml.doc "The token to request the next page of results.\n"]
  tasks : import_task_list option;
      [@ocaml.doc
        "A returned array of import tasks that match any applied filters, up to the specified \
         number of maximum results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_import_tasks_max_results = int [@@ocaml.doc ""]

type nonrec import_task_filter_value = string [@@ocaml.doc ""]

type nonrec import_task_filter_value_list = import_task_filter_value list [@@ocaml.doc ""]

type nonrec import_task_filter_name =
  | IMPORT_TASK_ID [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | FILE_CLASSIFICATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec import_task_filter = {
  name : import_task_filter_name option;
      [@ocaml.doc "The name, status, or import task ID for a specific import task.\n"]
  values : import_task_filter_value_list option;
      [@ocaml.doc
        "An array of strings that you can provide to match against a specific name, status, or \
         import task ID to filter the results for your import task queries.\n"]
}
[@@ocaml.doc
  "A name-values pair of elements you can use to filter the results when querying your import \
   tasks. Currently, wildcards are not supported for filters.\n\n\
  \  When filtering by import status, all other filter values are ignored.\n\
  \  \n\
  \   "]

type nonrec describe_import_tasks_filter_list = import_task_filter list [@@ocaml.doc ""]

type nonrec describe_import_tasks_request = {
  filters : describe_import_tasks_filter_list option;
      [@ocaml.doc
        "An array of name-value pairs that you provide to filter the results for the \
         [DescribeImportTask] request to a specific subset of results. Currently, wildcard values \
         aren't supported for filters.\n"]
  max_results : describe_import_tasks_max_results option;
      [@ocaml.doc
        "The maximum number of results that you want this request to return, up to 100.\n"]
  next_token : next_token option; [@ocaml.doc "The token to request a specific page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec export_request_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec configurations_download_url = string [@@ocaml.doc ""]

type nonrec export_status_message = string [@@ocaml.doc ""]

type nonrec export_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec export_info = {
  export_id : configurations_export_id;
      [@ocaml.doc "A unique identifier used to query an export.\n"]
  export_status : export_status; [@ocaml.doc "The status of the data export job.\n"]
  status_message : export_status_message;
      [@ocaml.doc "A status message provided for API callers.\n"]
  configurations_download_url : configurations_download_url option;
      [@ocaml.doc
        "A URL for an Amazon S3 bucket where you can review the exported data. The URL is \
         displayed only if the export succeeded.\n"]
  export_request_time : export_request_time;
      [@ocaml.doc "The time that the data export was initiated.\n"]
  is_truncated : boolean_ option;
      [@ocaml.doc
        "If true, the export of agent information exceeded the size limit for a single export and \
         the exported data is incomplete for the requested time range. To address this, select a \
         smaller time range for the export by using [startDate] and [endDate].\n"]
  requested_start_time : time_stamp option;
      [@ocaml.doc
        "The value of [startTime] parameter in the [StartExportTask] request. If no [startTime] \
         was requested, this result does not appear in [ExportInfo].\n"]
  requested_end_time : time_stamp option;
      [@ocaml.doc
        "The [endTime] used in the [StartExportTask] request. If no [endTime] was requested, this \
         result does not appear in [ExportInfo].\n"]
}
[@@ocaml.doc
  "Information regarding the export status of discovered data. The value is an array of objects.\n"]

type nonrec exports_info = export_info list [@@ocaml.doc ""]

type nonrec describe_export_tasks_response = {
  exports_info : exports_info option;
      [@ocaml.doc
        "Contains one or more sets of export request details. When the status of a request is \
         [SUCCEEDED], the response includes a URL for an Amazon S3 bucket where you can view the \
         data in a CSV file.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [DescribeExportTasks] request. When the \
         results of a [DescribeExportTasks] request exceed [maxResults], this value can be used to \
         retrieve the next page of results. This value is null when there are no more results to \
         return.\n"]
}
[@@ocaml.doc ""]

type nonrec export_ids = configurations_export_id list [@@ocaml.doc ""]

type nonrec describe_export_tasks_request = {
  export_ids : export_ids option;
      [@ocaml.doc "One or more unique identifiers used to query the status of an export request.\n"]
  filters : export_filters option;
      [@ocaml.doc
        "One or more filters.\n\n\
        \ {ul\n\
        \       {-   [AgentId] - ID of the agent whose collected data will be exported\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  max_results : integer option;
      [@ocaml.doc
        "The maximum number of volume results returned by [DescribeExportTasks] in paginated \
         output. When this parameter is used, [DescribeExportTasks] only returns [maxResults] \
         results in a single page along with a [nextToken] response element.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous paginated [DescribeExportTasks] request \
         where [maxResults] was used and the results exceeded the value of that parameter. \
         Pagination continues from the end of the previous results that returned the [nextToken] \
         value. This value is null when there are no more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_export_configurations_response = {
  exports_info : exports_info option; [@ocaml.doc "\n"]
  next_token : next_token option;
      [@ocaml.doc "The token from the previous call to describe-export-tasks.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_export_configurations_request = {
  export_ids : export_ids option; [@ocaml.doc "A list of continuous export IDs to search for.\n"]
  max_results : integer option;
      [@ocaml.doc
        "A number between 1 and 100 specifying the maximum number of continuous export \
         descriptions returned.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token from the previous call to describe-export-tasks.\n"]
}
[@@ocaml.doc ""]

type nonrec string_max255 = string [@@ocaml.doc ""]

type nonrec continuous_export_status =
  | START_IN_PROGRESS [@ocaml.doc ""]
  | START_FAILED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | STOP_IN_PROGRESS [@ocaml.doc ""]
  | STOP_FAILED [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec continuous_export_description = {
  export_id : configurations_export_id option;
      [@ocaml.doc "The unique ID assigned to this export.\n"]
  status : continuous_export_status option;
      [@ocaml.doc
        "Describes the status of the export. Can be one of the following values:\n\n\
        \ {ul\n\
        \       {-  START_IN_PROGRESS - setting up resources to start continuous export.\n\
        \           \n\
        \            }\n\
        \       {-  START_FAILED - an error occurred setting up continuous export. To recover, \
         call start-continuous-export again.\n\
        \           \n\
        \            }\n\
        \       {-  ACTIVE - data is being exported to the customer bucket.\n\
        \           \n\
        \            }\n\
        \       {-  ERROR - an error occurred during export. To fix the issue, call \
         stop-continuous-export and start-continuous-export.\n\
        \           \n\
        \            }\n\
        \       {-  STOP_IN_PROGRESS - stopping the export.\n\
        \           \n\
        \            }\n\
        \       {-  STOP_FAILED - an error occurred stopping the export. To recover, call \
         stop-continuous-export again.\n\
        \           \n\
        \            }\n\
        \       {-  INACTIVE - the continuous export has been stopped. Data is no longer being \
         exported to the customer bucket.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status_detail : string_max255 option;
      [@ocaml.doc
        "Contains information about any errors that have occurred. This data type can have the \
         following values:\n\n\
        \ {ul\n\
        \       {-  ACCESS_DENIED - You don\226\128\153t have permission to start Data Exploration \
         in Amazon Athena. Contact your Amazon Web Services administrator for help. For more \
         information, see \
         {{:http://docs.aws.amazon.com/application-discovery/latest/userguide/setting-up.html}Setting \
         Up Amazon Web Services Application Discovery Service} in the Application Discovery \
         Service User Guide.\n\
        \           \n\
        \            }\n\
        \       {-  DELIVERY_STREAM_LIMIT_FAILURE - You reached the limit for Amazon Kinesis Data \
         Firehose delivery streams. Reduce the number of streams or request a limit increase and \
         try again. For more information, see \
         {{:http://docs.aws.amazon.com/streams/latest/dev/service-sizes-and-limits.html}Kinesis \
         Data Streams Limits} in the Amazon Kinesis Data Streams Developer Guide.\n\
        \           \n\
        \            }\n\
        \       {-  FIREHOSE_ROLE_MISSING - The Data Exploration feature is in an error state \
         because your user is missing the Amazon Web ServicesApplicationDiscoveryServiceFirehose \
         role. Turn on Data Exploration in Amazon Athena and try again. For more information, see \
         {{:https://docs.aws.amazon.com/application-discovery/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-create-firehose-role}Creating \
         the Amazon Web ServicesApplicationDiscoveryServiceFirehose Role} in the Application \
         Discovery Service User Guide.\n\
        \           \n\
        \            }\n\
        \       {-  FIREHOSE_STREAM_DOES_NOT_EXIST - The Data Exploration feature is in an error \
         state because your user is missing one or more of the Kinesis data delivery streams.\n\
        \           \n\
        \            }\n\
        \       {-  INTERNAL_FAILURE - The Data Exploration feature is in an error state because \
         of an internal failure. Try again later. If this problem persists, contact Amazon Web \
         Services Support.\n\
        \           \n\
        \            }\n\
        \       {-  LAKE_FORMATION_ACCESS_DENIED - You don't have sufficient lake formation \
         permissions to start continuous export. For more information, see \
         {{:http://docs.aws.amazon.com/lake-formation/latest/dg/upgrade-glue-lake-formation.html} \
         Upgrading Amazon Web Services Glue Data Permissions to the Amazon Web Services Lake \
         Formation Model } in the Amazon Web Services {i Lake Formation Developer Guide}. \n\
        \           \n\
        \            You can use one of the following two ways to resolve this issue.\n\
        \            \n\
        \             {ol\n\
        \                   {-  If you don\226\128\153t want to use the Lake Formation permission \
         model, you can change the default Data Catalog settings to use only Amazon Web Services \
         Identity and Access Management (IAM) access control for new databases. For more \
         information, see \
         {{:https://docs.aws.amazon.com/lake-formation/latest/dg/getting-started-setup.html#setup-change-cat-settings}Change \
         Data Catalog Settings} in the {i Lake Formation Developer Guide}.\n\
        \                       \n\
        \                        }\n\
        \                   {-  You can give the service-linked IAM roles \
         AWSServiceRoleForApplicationDiscoveryServiceContinuousExport and \
         AWSApplicationDiscoveryServiceFirehose the required Lake Formation permissions. For more \
         information, see \
         {{:https://docs.aws.amazon.com/lake-formation/latest/dg/granting-database-permissions.html} \
         Granting Database Permissions} in the {i Lake Formation Developer Guide}. \n\
        \                       \n\
        \                        {ol\n\
        \                              {-  \
         AWSServiceRoleForApplicationDiscoveryServiceContinuousExport - Grant database creator \
         permissions, which gives the role database creation ability and implicit permissions for \
         any created tables. For more information, see \
         {{:https://docs.aws.amazon.com/lake-formation/latest/dg/implicit-permissions.html} \
         Implicit Lake Formation Permissions } in the {i Lake Formation Developer Guide}.\n\
        \                                  \n\
        \                                   }\n\
        \                              {-  AWSApplicationDiscoveryServiceFirehose - Grant describe \
         permissions for all tables in the database.\n\
        \                                  \n\
        \                                   }\n\
        \                              \n\
        \                    }\n\
        \                     }\n\
        \                   \n\
        \        }\n\
        \         }\n\
        \       {-  S3_BUCKET_LIMIT_FAILURE - You reached the limit for Amazon S3 buckets. Reduce \
         the number of S3 buckets or request a limit increase and try again. For more information, \
         see {{:http://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html}Bucket \
         Restrictions and Limitations} in the Amazon Simple Storage Service Developer Guide.\n\
        \           \n\
        \            }\n\
        \       {-  S3_NOT_SIGNED_UP - Your account is not signed up for the Amazon S3 service. \
         You must sign up before you can use Amazon S3. You can sign up at the following URL: \
         {{:https://aws.amazon.com/s3}https://aws.amazon.com/s3}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  s3_bucket : s3_bucket option;
      [@ocaml.doc "The name of the s3 bucket where the export data parquet files are stored.\n"]
  start_time : time_stamp option;
      [@ocaml.doc "The timestamp representing when the continuous export was started.\n"]
  stop_time : time_stamp option;
      [@ocaml.doc "The timestamp that represents when this continuous export was stopped.\n"]
  data_source : data_source option;
      [@ocaml.doc
        "The type of data collector used to gather this data (currently only offered for AGENT).\n"]
  schema_storage_config : schema_storage_config option;
      [@ocaml.doc
        "An object which describes how the data is stored.\n\n\
        \ {ul\n\
        \       {-   [databaseName] - the name of the Glue database used to store the schema.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "A list of continuous export descriptions.\n"]

type nonrec continuous_export_descriptions = continuous_export_description list [@@ocaml.doc ""]

type nonrec describe_continuous_exports_response = {
  descriptions : continuous_export_descriptions option;
      [@ocaml.doc "A list of continuous export descriptions.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token from the previous call to [DescribeExportTasks].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_continuous_exports_max_results = int [@@ocaml.doc ""]

type nonrec continuous_export_ids = configurations_export_id list [@@ocaml.doc ""]

type nonrec describe_continuous_exports_request = {
  export_ids : continuous_export_ids option;
      [@ocaml.doc "The unique IDs assigned to the exports.\n"]
  max_results : describe_continuous_exports_max_results option;
      [@ocaml.doc
        "A number between 1 and 100 specifying the maximum number of continuous export \
         descriptions returned.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token from the previous call to [DescribeExportTasks].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_configurations_attribute = (string_ * string_) list [@@ocaml.doc ""]

type nonrec describe_configurations_attributes = describe_configurations_attribute list
[@@ocaml.doc ""]

type nonrec describe_configurations_response = {
  configurations : describe_configurations_attributes option;
      [@ocaml.doc "A key in the response map. The value is an array of data.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_configurations_request = {
  configuration_ids : configuration_id_list; [@ocaml.doc "One or more configuration IDs.\n"]
}
[@@ocaml.doc ""]

type nonrec warning_text = string [@@ocaml.doc ""]

type nonrec warning_code = int [@@ocaml.doc ""]

type nonrec deletion_warning = {
  configuration_id : configuration_id option;
      [@ocaml.doc " The unique identifier of the configuration that produced a warning. \n"]
  warning_code : warning_code option;
      [@ocaml.doc " The integer warning code associated with the warning message. \n"]
  warning_text : warning_text option;
      [@ocaml.doc
        " A descriptive message of the warning the associated configuration ID produced. \n"]
}
[@@ocaml.doc " A configuration ID paired with a warning message. \n"]

type nonrec deletion_warnings_list = deletion_warning list [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec error_status_code = int [@@ocaml.doc ""]

type nonrec failed_configuration = {
  configuration_id : configuration_id option;
      [@ocaml.doc " The unique identifier of the configuration the failed to delete. \n"]
  error_status_code : error_status_code option;
      [@ocaml.doc " The integer error code associated with the error message. \n"]
  error_message : error_message option;
      [@ocaml.doc
        " A descriptive message indicating why the associated configuration failed to delete. \n"]
}
[@@ocaml.doc " A configuration ID paired with an error message. \n"]

type nonrec failed_configuration_list = failed_configuration list [@@ocaml.doc ""]

type nonrec batch_delete_configuration_task_status =
  | INITIALIZING [@ocaml.doc ""]
  | VALIDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_delete_configuration_task = {
  task_id : uui_d option; [@ocaml.doc " The deletion task's unique identifier. \n"]
  status : batch_delete_configuration_task_status option;
      [@ocaml.doc
        " The current execution status of the deletion task. Valid status are: INITIALIZING | \
         VALIDATING | DELETING | COMPLETED | FAILED. \n"]
  start_time : time_stamp option;
      [@ocaml.doc " An epoch seconds timestamp (UTC) of when the deletion task was started. \n"]
  end_time : time_stamp option;
      [@ocaml.doc
        " An epoch seconds timestamp (UTC) of when the deletion task was completed or failed. \n"]
  configuration_type : deletion_configuration_item_type option;
      [@ocaml.doc " The type of configuration item to delete. Supported types are: SERVER. \n"]
  requested_configurations : configuration_id_list option;
      [@ocaml.doc
        " The list of configuration IDs that were originally requested to be deleted by the \
         deletion task. \n"]
  deleted_configurations : configuration_id_list option;
      [@ocaml.doc
        " The list of configuration IDs that were successfully deleted by the deletion task. \n"]
  failed_configurations : failed_configuration_list option;
      [@ocaml.doc
        " A list of configuration IDs that failed to delete during the deletion task, each paired \
         with an error message. \n"]
  deletion_warnings : deletion_warnings_list option;
      [@ocaml.doc
        " A list of configuration IDs that produced warnings regarding their deletion, paired with \
         a warning message. \n"]
}
[@@ocaml.doc " A metadata object that represents the deletion task being executed. \n"]

type nonrec describe_batch_delete_configuration_task_response = {
  task : batch_delete_configuration_task option;
      [@ocaml.doc
        " The [BatchDeleteConfigurationTask] that represents the deletion task being executed. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_batch_delete_configuration_task_request = {
  task_id : uui_d; [@ocaml.doc " The ID of the task to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec agent_status =
  | HEALTHY [@ocaml.doc ""]
  | UNHEALTHY [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
  | BLACKLISTED [@ocaml.doc ""]
  | SHUTDOWN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec agent_network_info = {
  ip_address : string_ option;
      [@ocaml.doc "The IP address for the host where the agent/collector resides.\n"]
  mac_address : string_ option;
      [@ocaml.doc "The MAC address for the host where the agent/collector resides.\n"]
}
[@@ocaml.doc "Network details about the host where the agent/collector resides.\n"]

type nonrec agent_network_info_list = agent_network_info list [@@ocaml.doc ""]

type nonrec agent_info = {
  agent_id : agent_id option; [@ocaml.doc "The agent or collector ID.\n"]
  host_name : string_ option;
      [@ocaml.doc
        "The name of the host where the agent or collector resides. The host can be a server or \
         virtual machine.\n"]
  agent_network_info_list : agent_network_info_list option;
      [@ocaml.doc "Network details about the host where the agent or collector resides.\n"]
  connector_id : string_ option; [@ocaml.doc "The ID of the connector.\n"]
  version : string_ option; [@ocaml.doc "The agent or collector version.\n"]
  health : agent_status option; [@ocaml.doc "The health of the agent.\n"]
  last_health_ping_time : string_ option; [@ocaml.doc "Time since agent health was reported.\n"]
  collection_status : string_ option;
      [@ocaml.doc "Status of the collection process for an agent.\n"]
  agent_type : string_ option; [@ocaml.doc "Type of agent.\n"]
  registered_time : string_ option; [@ocaml.doc "Agent's first registration timestamp in UTC.\n"]
}
[@@ocaml.doc
  "Information about agents associated with the user\226\128\153s Amazon Web Services account. \
   Information includes agent IDs, IP addresses, media access control (MAC) addresses, agent or \
   collector status, hostname where the agent resides, and agent version for each agent.\n"]

type nonrec agents_info = agent_info list [@@ocaml.doc ""]

type nonrec describe_agents_response = {
  agents_info : agents_info option;
      [@ocaml.doc
        "Lists agents or the collector by ID or lists all agents/collectors associated with your \
         user, if you did not specify an agent/collector ID. The output includes agent/collector \
         IDs, IP addresses, media access control (MAC) addresses, agent/collector health, host \
         name where the agent/collector resides, and the version number of each agent/collector.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Token to retrieve the next set of results. For example, if you specified 100 IDs for \
         [DescribeAgentsRequest$agentIds] but set [DescribeAgentsRequest$maxResults] to 10, you \
         received a set of 10 results along with this token. Use this token in the next query to \
         retrieve the next set of 10.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_agents_request = {
  agent_ids : agent_ids option;
      [@ocaml.doc
        "The agent or the collector IDs for which you want information. If you specify no IDs, the \
         system returns information about all agents/collectors associated with your user.\n"]
  filters : filters option;
      [@ocaml.doc
        "You can filter the request using various logical operators and a {i key}-{i value} \
         format. For example: \n\n\
        \  [{\"key\": \"collectionStatus\", \"value\": \"STARTED\"}] \n\
        \ "]
  max_results : integer option;
      [@ocaml.doc
        "The total number of agents/collectors to return in a single page of output. The maximum \
         value is 100.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Token to retrieve the next set of results. For example, if you previously specified 100 \
         IDs for [DescribeAgentsRequest$agentIds] but set [DescribeAgentsRequest$maxResults] to \
         10, you received a set of 10 results along with a token. Use that token in this query to \
         get the next set of 10.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_tags_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The type of tag on which to filter.\n"]
  value : tag_value; [@ocaml.doc "A value for a tag key on which to filter.\n"]
}
[@@ocaml.doc
  "Metadata that help you categorize IT assets.\n\n\
  \  Do not store sensitive information (like personal data) in tags.\n\
  \  \n\
  \   "]

type nonrec tag_set = tag list [@@ocaml.doc ""]

type nonrec delete_tags_request = {
  configuration_ids : configuration_id_list;
      [@ocaml.doc "A list of configuration items with tags that you want to delete.\n"]
  tags : tag_set option;
      [@ocaml.doc
        "Tags that you want to delete from one or more configuration items. Specify the tags that \
         you want to delete in a {i key}-{i value} format. For example:\n\n\
        \  [{\"key\": \"serverType\", \"value\": \"webServer\"}] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_applications_response = unit [@@ocaml.doc ""]

type nonrec application_ids_list = application_id list [@@ocaml.doc ""]

type nonrec delete_applications_request = {
  configuration_ids : application_ids_list;
      [@ocaml.doc "Configuration ID of an application to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec create_tags_response = unit [@@ocaml.doc ""]

type nonrec create_tags_request = {
  configuration_ids : configuration_id_list;
      [@ocaml.doc "A list of configuration items that you want to tag.\n"]
  tags : tag_set;
      [@ocaml.doc
        "Tags that you want to associate with one or more configuration items. Specify the tags \
         that you want to create in a {i key}-{i value} format. For example:\n\n\
        \  [{\"key\": \"serverType\", \"value\": \"webServer\"}] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_application_response = {
  configuration_id : string_ option;
      [@ocaml.doc "The configuration ID of an application to be created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_application_request = {
  name : application_name; [@ocaml.doc "The name of the application to be created.\n"]
  description : application_description option;
      [@ocaml.doc "The description of the application to be created.\n"]
  wave : application_wave option;
      [@ocaml.doc "The name of the migration wave of the application to be created.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_import_data_error_description = string [@@ocaml.doc ""]

type nonrec batch_delete_import_data_error_code =
  | NOT_FOUND [@ocaml.doc ""]
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | OVER_LIMIT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_delete_import_data_error = {
  import_task_id : import_task_identifier option;
      [@ocaml.doc "The unique import ID associated with the error that occurred.\n"]
  error_code : batch_delete_import_data_error_code option;
      [@ocaml.doc "The type of error that occurred for a specific import task.\n"]
  error_description : batch_delete_import_data_error_description option;
      [@ocaml.doc "The description of the error that occurred for a specific import task.\n"]
}
[@@ocaml.doc
  "Error messages returned for each import task that you deleted as a response for this command.\n"]

type nonrec batch_delete_import_data_error_list = batch_delete_import_data_error list
[@@ocaml.doc ""]

type nonrec batch_delete_import_data_response = {
  errors : batch_delete_import_data_error_list option;
      [@ocaml.doc
        "Error messages returned for each import task that you deleted as a response for this \
         command.\n"]
}
[@@ocaml.doc ""]

type nonrec to_delete_identifier_list = import_task_identifier list [@@ocaml.doc ""]

type nonrec batch_delete_import_data_request = {
  import_task_ids : to_delete_identifier_list;
      [@ocaml.doc "The IDs for the import tasks that you want to delete.\n"]
  delete_history : boolean_ option;
      [@ocaml.doc " Set to [true] to remove the deleted import task from [DescribeImportTasks]. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_agent_error_code =
  | NOT_FOUND [@ocaml.doc ""]
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | AGENT_IN_USE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_delete_agent_error = {
  agent_id : agent_id; [@ocaml.doc " The ID of the agent or data collector to delete. \n"]
  error_message : string_;
      [@ocaml.doc " The description of the error that occurred for the delete failed agent. \n"]
  error_code : delete_agent_error_code;
      [@ocaml.doc
        " The type of error that occurred for the delete failed agent. Valid status are: \
         AGENT_IN_USE | NOT_FOUND | INTERNAL_SERVER_ERROR. \n"]
}
[@@ocaml.doc
  " An object representing the agent or data collector that failed to delete, each containing \
   agentId, errorMessage, and errorCode. \n"]

type nonrec batch_delete_agent_errors = batch_delete_agent_error list [@@ocaml.doc ""]

type nonrec batch_delete_agents_response = {
  errors : batch_delete_agent_errors option;
      [@ocaml.doc
        " A list of agent IDs that failed to delete during the deletion task, each paired with an \
         error message. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_agent = {
  agent_id : agent_id; [@ocaml.doc " The ID of the agent or data collector to delete. \n"]
  force : boolean_ option;
      [@ocaml.doc
        " Optional flag used to force delete an agent or data collector. It is needed to delete \
         any agent in HEALTHY/UNHEALTHY/RUNNING status. Note that deleting an agent that is \
         actively reporting health causes it to be re-registered with a different agent ID after \
         data collector re-connects with Amazon Web Services. \n"]
}
[@@ocaml.doc
  " An object representing the agent or data collector to be deleted along with the optional \
   configurations for error handling. \n"]

type nonrec delete_agents = delete_agent list [@@ocaml.doc ""]

type nonrec batch_delete_agents_request = {
  delete_agents : delete_agents; [@ocaml.doc " The list of agents to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec associate_configuration_items_to_application_response = unit [@@ocaml.doc ""]

type nonrec associate_configuration_items_to_application_request = {
  application_configuration_id : application_id;
      [@ocaml.doc "The configuration ID of an application with which items are to be associated.\n"]
  configuration_ids : configuration_id_list;
      [@ocaml.doc "The ID of each configuration item to be associated with an application.\n"]
}
[@@ocaml.doc ""]
