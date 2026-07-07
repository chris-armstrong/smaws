open Types

module AssociateConfigurationItemsToApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_configuration_items_to_application_request ->
    ( associate_configuration_items_to_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_configuration_items_to_application_request ->
    ( associate_configuration_items_to_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates one or more configuration items with an application.\n"]

module BatchDeleteAgents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_agents_request ->
    ( batch_delete_agents_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_agents_request ->
    ( batch_delete_agents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deletes one or more agents or collectors as specified by ID. Deleting an agent or collector \
   does not delete the previously discovered data. To delete the data collected, use \
   [StartBatchDeleteConfigurationTask]. \n"]

module BatchDeleteImportData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_import_data_request ->
    ( batch_delete_import_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_import_data_request ->
    ( batch_delete_import_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes one or more import tasks, each identified by their import ID. Each import task has a \
   number of records that can identify servers or applications. \n\n\
  \ Amazon Web Services Application Discovery Service has built-in matching logic that will \
   identify when discovered servers match existing entries that you've previously discovered, the \
   information for the already-existing discovered server is updated. When you delete an import \
   task that contains records that were used to match, the information in those matched records \
   that comes from the deleted records will also be deleted.\n\
  \ "]

module CreateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an application with the given name and description.\n"]

module CreateTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tags_request ->
    ( create_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tags_request ->
    ( create_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates one or more tags for configuration items. Tags are metadata that help you categorize IT \
   assets. This API accepts a list of multiple configuration items.\n\n\
  \  Do not store sensitive information (like personal data) in tags.\n\
  \  \n\
  \   "]

module DeleteApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_applications_request ->
    ( delete_applications_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_applications_request ->
    ( delete_applications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a list of applications and their associations with configuration items.\n"]

module DeleteTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_request ->
    ( delete_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_request ->
    ( delete_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the association between configuration items and one or more tags. This API accepts a \
   list of multiple configuration items.\n"]

module DescribeAgents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_agents_request ->
    ( describe_agents_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_agents_request ->
    ( describe_agents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists agents or collectors as specified by ID or other filters. All agents/collectors \
   associated with your user can be listed if you call [DescribeAgents] as is without passing any \
   parameters.\n"]

module DescribeBatchDeleteConfigurationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_delete_configuration_task_request ->
    ( describe_batch_delete_configuration_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_delete_configuration_task_request ->
    ( describe_batch_delete_configuration_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Takes a unique deletion task identifier as input and returns metadata about a configuration \
   deletion task.\n"]

module DescribeConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_configurations_request ->
    ( describe_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_configurations_request ->
    ( describe_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves attributes for a list of configuration item IDs.\n\n\
  \  All of the supplied IDs must be for the same asset type from one of the following:\n\
  \  \n\
  \   {ul\n\
  \         {-  server\n\
  \             \n\
  \              }\n\
  \         {-  application\n\
  \             \n\
  \              }\n\
  \         {-  process\n\
  \             \n\
  \              }\n\
  \         {-  connection\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Output fields are specific to the asset type specified. For example, the output for a {i \
   server} configuration item includes a list of attributes about the server, such as host name, \
   operating system, number of network cards, etc.\n\
  \   \n\
  \    For a complete list of outputs for each asset type, see \
   {{:https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#DescribeConfigurations}Using \
   the DescribeConfigurations Action} in the {i Amazon Web Services Application Discovery Service \
   User Guide}.\n\
  \    \n\
  \     "]

module DescribeContinuousExports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_continuous_exports_request ->
    ( describe_continuous_exports_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_continuous_exports_request ->
    ( describe_continuous_exports_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists exports as specified by ID. All continuous exports associated with your user can be \
   listed if you call [DescribeContinuousExports] as is without passing any parameters.\n"]

module DescribeExportConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_export_configurations_request ->
    ( describe_export_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_export_configurations_request ->
    ( describe_export_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " [DescribeExportConfigurations] is deprecated. Use \
   {{:https://docs.aws.amazon.com/application-discovery/latest/APIReference/API_DescribeExportTasks.html}DescribeExportTasks}, \
   instead.\n"]

module DescribeExportTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_export_tasks_request ->
    ( describe_export_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_export_tasks_request ->
    ( describe_export_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve status of one or more export tasks. You can retrieve the status of up to 100 export \
   tasks.\n"]

module DescribeImportTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_import_tasks_request ->
    ( describe_import_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_import_tasks_request ->
    ( describe_import_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an array of import tasks for your account, including status information, times, IDs, \
   the Amazon S3 Object URL for the import file, and more.\n"]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_request ->
    ( describe_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_request ->
    ( describe_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of configuration items that have tags as specified by the key-value pairs, \
   name and value, passed to the optional parameter [filters].\n\n\
  \ There are three valid tag filter names:\n\
  \ \n\
  \  {ul\n\
  \        {-  tagKey\n\
  \            \n\
  \             }\n\
  \        {-  tagValue\n\
  \            \n\
  \             }\n\
  \        {-  configurationId\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Also, all configuration items associated with your user that have tags can be listed if you \
   call [DescribeTags] as is without passing any parameters.\n\
  \   "]

module DisassociateConfigurationItemsFromApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_configuration_items_from_application_request ->
    ( disassociate_configuration_items_from_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_configuration_items_from_application_request ->
    ( disassociate_configuration_items_from_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates one or more configuration items from an application.\n"]

module ExportConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( export_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( export_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deprecated. Use [StartExportTask] instead.\n\n\
  \ Exports all discovered configuration data to an Amazon S3 bucket or an application that \
   enables you to view and evaluate the data. Data includes tags and tag associations, processes, \
   connections, servers, and system performance. This API returns an export ID that you can query \
   using the {i DescribeExportConfigurations} API. The system imposes a limit of two configuration \
   exports in six hours.\n\
  \ "]

module GetDiscoverySummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_discovery_summary_request ->
    ( get_discovery_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_discovery_summary_request ->
    ( get_discovery_summary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a short summary of discovered assets.\n\n\
  \ This API operation takes no request parameters and is called as is at the command prompt as \
   shown in the example.\n\
  \ "]

module ListConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_configurations_request ->
    ( list_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_configurations_request ->
    ( list_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of configuration items as specified by the value passed to the required \
   parameter [configurationType]. Optional filtering may be applied to refine search results.\n"]

module ListServerNeighbors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_server_neighbors_request ->
    ( list_server_neighbors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_server_neighbors_request ->
    ( list_server_neighbors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of servers that are one network hop away from a specified server.\n"]

module StartBatchDeleteConfigurationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_batch_delete_configuration_task_request ->
    ( start_batch_delete_configuration_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_batch_delete_configuration_task_request ->
    ( start_batch_delete_configuration_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Takes a list of configurationId as input and starts an asynchronous deletion task to remove \
   the configurationItems. Returns a unique deletion task identifier. \n"]

module StartContinuousExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `ConflictErrorException of conflict_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_continuous_export_request ->
    ( start_continuous_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConflictErrorException of conflict_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_continuous_export_request ->
    ( start_continuous_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConflictErrorException of conflict_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Start the continuous flow of agent's discovered data into Amazon Athena.\n"]

module StartDataCollectionByAgentIds : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_data_collection_by_agent_ids_request ->
    ( start_data_collection_by_agent_ids_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_data_collection_by_agent_ids_request ->
    ( start_data_collection_by_agent_ids_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Instructs the specified agents to start collecting data.\n"]

module StartExportTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_export_task_request ->
    ( start_export_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_export_task_request ->
    ( start_export_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Begins the export of a discovered data report to an Amazon S3 bucket managed by Amazon Web \
   Services.\n\n\
  \  Exports might provide an estimate of fees and savings based on certain information that you \
   provide. Fee estimates do not include any taxes that might apply. Your actual fees and savings \
   depend on a variety of factors, including your actual usage of Amazon Web Services services, \
   which might vary from the estimates provided in this report.\n\
  \  \n\
  \    If you do not specify [preferences] or [agentIds] in the filter, a summary of all servers, \
   applications, tags, and performance is generated. This data is an aggregation of all server \
   data collected through on-premises tooling, file import, application grouping and applying tags.\n\
  \    \n\
  \     If you specify [agentIds] in a filter, the task exports up to 72 hours of detailed data \
   collected by the identified Application Discovery Agent, including network, process, and \
   performance details. A time range for exported agent data may be set by using [startTime] and \
   [endTime]. Export of detailed agent data is limited to five concurrently running exports. \
   Export of detailed agent data is limited to two exports per day.\n\
  \     \n\
  \      If you enable [ec2RecommendationsPreferences] in [preferences] , an Amazon EC2 instance \
   matching the characteristics of each server in Application Discovery Service is generated. \
   Changing the attributes of the [ec2RecommendationsPreferences] changes the criteria of the \
   recommendation.\n\
  \      "]

module StartImportTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_import_task_request ->
    ( start_import_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_import_task_request ->
    ( start_import_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an import task, which allows you to import details of your on-premises environment \
   directly into Amazon Web Services Migration Hub without having to use the Amazon Web Services \
   Application Discovery Service (Application Discovery Service) tools such as the Amazon Web \
   Services Application Discovery Service Agentless Collector or Application Discovery Agent. This \
   gives you the option to perform migration assessment and planning directly from your imported \
   data, including the ability to group your devices as applications and track their migration \
   status.\n\n\
  \ To start an import request, do this:\n\
  \ \n\
  \  {ol\n\
  \        {-  Download the specially formatted comma separated value (CSV) import template, which \
   you can find here: \
   {{:https://s3.us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_template.csv}https://s3.us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_template.csv}.\n\
  \            \n\
  \             }\n\
  \        {-  Fill out the template with your server and application data.\n\
  \            \n\
  \             }\n\
  \        {-  Upload your import file to an Amazon S3 bucket, and make a note of it's Object URL. \
   Your import file must be in the CSV format.\n\
  \            \n\
  \             }\n\
  \        {-  Use the console or the [StartImportTask] command with the Amazon Web Services CLI \
   or one of the Amazon Web Services SDKs to import the records from your file.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information, including step-by-step procedures, see \
   {{:https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-import.html}Migration \
   Hub Import} in the {i Amazon Web Services Application Discovery Service User Guide}.\n\
  \   \n\
  \     There are limits to the number of import tasks you can create (and delete) in an Amazon \
   Web Services account. For more information, see \
   {{:https://docs.aws.amazon.com/application-discovery/latest/userguide/ads_service_limits.html}Amazon \
   Web Services Application Discovery Service Limits} in the {i Amazon Web Services Application \
   Discovery Service User Guide}.\n\
  \     \n\
  \      "]

module StopContinuousExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_continuous_export_request ->
    ( stop_continuous_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_continuous_export_request ->
    ( stop_continuous_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stop the continuous flow of agent's discovered data into Amazon Athena.\n"]

module StopDataCollectionByAgentIds : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_data_collection_by_agent_ids_request ->
    ( stop_data_collection_by_agent_ids_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_data_collection_by_agent_ids_request ->
    ( stop_data_collection_by_agent_ids_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Instructs the specified agents to stop collecting data.\n"]

module UpdateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorizationErrorException of authorization_error_exception
    | `HomeRegionNotSetException of home_region_not_set_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerInternalErrorException of server_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorizationErrorException of authorization_error_exception
      | `HomeRegionNotSetException of home_region_not_set_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerInternalErrorException of server_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates metadata about an application.\n"]
