open Types

module BatchGetNamedQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_named_query_input ->
    ( batch_get_named_query_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_named_query_input ->
    ( batch_get_named_query_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the details of a single named query or a list of up to 50 queries, which you provide as \
   an array of query ID strings. Requires you to have access to the workgroup in which the queries \
   were saved. Use [ListNamedQueriesInput] to get the list of named query IDs in the specified \
   workgroup. If information could not be retrieved for a submitted query ID, information about \
   the query ID submitted is listed under [UnprocessedNamedQueryId]. Named queries differ from \
   executed queries. Use [BatchGetQueryExecutionInput] to get details about each unique query \
   execution, and [ListQueryExecutionsInput] to get a list of query execution IDs.\n"]

module BatchGetPreparedStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_prepared_statement_input ->
    ( batch_get_prepared_statement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_prepared_statement_input ->
    ( batch_get_prepared_statement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the details of a single prepared statement or a list of up to 256 prepared statements \
   for the array of prepared statement names that you provide. Requires you to have access to the \
   workgroup to which the prepared statements belong. If a prepared statement cannot be retrieved \
   for the name specified, the statement is listed in [UnprocessedPreparedStatementNames].\n"]

module BatchGetQueryExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_query_execution_input ->
    ( batch_get_query_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_query_execution_input ->
    ( batch_get_query_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the details of a single query execution or a list of up to 50 query executions, which \
   you provide as an array of query execution ID strings. Requires you to have access to the \
   workgroup in which the queries ran. To get a list of query execution IDs, use \
   [ListQueryExecutionsInput$WorkGroup]. Query executions differ from named (saved) queries. Use \
   [BatchGetNamedQueryInput] to get details about named queries.\n"]

module CancelCapacityReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_capacity_reservation_input ->
    ( cancel_capacity_reservation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_capacity_reservation_input ->
    ( cancel_capacity_reservation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels the capacity reservation with the specified name. Cancelled reservations remain in your \
   account and will be deleted 45 days after cancellation. During the 45 days, you cannot \
   re-purpose or reuse a reservation that has been cancelled, but you can refer to its tags and \
   view it for historical reference. \n"]

module CreateCapacityReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_capacity_reservation_input ->
    ( create_capacity_reservation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_capacity_reservation_input ->
    ( create_capacity_reservation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a capacity reservation with the specified name and number of requested data processing \
   units.\n"]

module CreateDataCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_catalog_input ->
    ( create_data_catalog_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_catalog_input ->
    ( create_data_catalog_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates (registers) a data catalog with the specified name and properties. Catalogs created are \
   visible to all users of the same Amazon Web Services account.\n\n\
  \ For a [FEDERATED] catalog, this API operation creates the following resources.\n\
  \ \n\
  \  {ul\n\
  \        {-  CFN Stack Name with a maximum length of 128 characters and prefix \
   [athenafederatedcatalog-CATALOG_NAME_SANITIZED] with length 23 characters.\n\
  \            \n\
  \             }\n\
  \        {-  Lambda Function Name with a maximum length of 64 characters and prefix \
   [athenafederatedcatalog_CATALOG_NAME_SANITIZED] with length 23 characters.\n\
  \            \n\
  \             }\n\
  \        {-  Glue Connection Name with a maximum length of 255 characters and a prefix \
   [athenafederatedcatalog_CATALOG_NAME_SANITIZED] with length 23 characters. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module CreateNamedQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_named_query_input ->
    ( create_named_query_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_named_query_input ->
    ( create_named_query_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a named query in the specified workgroup. Requires that you have access to the workgroup.\n"]

module CreateNotebook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_notebook_input ->
    ( create_notebook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_notebook_input ->
    ( create_notebook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an empty [ipynb] file in the specified Apache Spark enabled workgroup. Throws an error \
   if a file in the workgroup with the same name already exists.\n"]

module CreatePreparedStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_prepared_statement_input ->
    ( create_prepared_statement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_prepared_statement_input ->
    ( create_prepared_statement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a prepared statement for use with SQL queries in Athena.\n"]

module CreatePresignedNotebookUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_presigned_notebook_url_request ->
    ( create_presigned_notebook_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_presigned_notebook_url_request ->
    ( create_presigned_notebook_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets an authentication token and the URL at which the notebook can be accessed. During \
   programmatic access, [CreatePresignedNotebookUrl] must be called every 10 minutes to refresh \
   the authentication token. For information about granting programmatic access, see \
   {{:https://docs.aws.amazon.com/athena/latest/ug/setting-up.html#setting-up-grant-programmatic-access}Grant \
   programmatic access}.\n"]

module CreateWorkGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_work_group_input ->
    ( create_work_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_work_group_input ->
    ( create_work_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a workgroup with the specified name. A workgroup can be an Apache Spark enabled \
   workgroup or an Athena SQL workgroup.\n"]

module DeleteCapacityReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_capacity_reservation_input ->
    ( delete_capacity_reservation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_capacity_reservation_input ->
    ( delete_capacity_reservation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a cancelled capacity reservation. A reservation must be cancelled before it can be \
   deleted. A deleted reservation is immediately removed from your account and can no longer be \
   referenced, including by its ARN. A deleted reservation cannot be called by \
   [GetCapacityReservation], and deleted reservations do not appear in the output of \
   [ListCapacityReservations].\n"]

module DeleteDataCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_data_catalog_input ->
    ( delete_data_catalog_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_data_catalog_input ->
    ( delete_data_catalog_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a data catalog.\n"]

module DeleteNamedQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_named_query_input ->
    ( delete_named_query_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_named_query_input ->
    ( delete_named_query_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the named query if you have access to the workgroup in which the query was saved.\n"]

module DeleteNotebook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_notebook_input ->
    ( delete_notebook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_notebook_input ->
    ( delete_notebook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified notebook.\n"]

module DeletePreparedStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_prepared_statement_input ->
    ( delete_prepared_statement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_prepared_statement_input ->
    ( delete_prepared_statement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the prepared statement with the specified name from the specified workgroup.\n"]

module DeleteWorkGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_work_group_input ->
    ( delete_work_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_work_group_input ->
    ( delete_work_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the workgroup with the specified name. The primary workgroup cannot be deleted.\n"]

module ExportNotebook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_notebook_input ->
    ( export_notebook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_notebook_input ->
    ( export_notebook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Exports the specified notebook and its metadata.\n"]

module GetCalculationExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_calculation_execution_request ->
    ( get_calculation_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_calculation_execution_request ->
    ( get_calculation_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a previously submitted calculation execution.\n"]

module GetCalculationExecutionCode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_calculation_execution_code_request ->
    ( get_calculation_execution_code_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_calculation_execution_code_request ->
    ( get_calculation_execution_code_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the unencrypted code that was executed for the calculation.\n"]

module GetCalculationExecutionStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_calculation_execution_status_request ->
    ( get_calculation_execution_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_calculation_execution_status_request ->
    ( get_calculation_execution_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the status of a current calculation.\n"]

module GetCapacityAssignmentConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_capacity_assignment_configuration_input ->
    ( get_capacity_assignment_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_capacity_assignment_configuration_input ->
    ( get_capacity_assignment_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the capacity assignment configuration for a capacity reservation, if one exists.\n"]

module GetCapacityReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_capacity_reservation_input ->
    ( get_capacity_reservation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_capacity_reservation_input ->
    ( get_capacity_reservation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the capacity reservation with the specified name.\n"]

module GetDataCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_catalog_input ->
    ( get_data_catalog_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_catalog_input ->
    ( get_data_catalog_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the specified data catalog.\n"]

module GetDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `MetadataException of metadata_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_database_input ->
    ( get_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `MetadataException of metadata_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_database_input ->
    ( get_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `MetadataException of metadata_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a database object for the specified database and data catalog.\n"]

module GetNamedQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_named_query_input ->
    ( get_named_query_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_named_query_input ->
    ( get_named_query_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a single query. Requires that you have access to the workgroup in \
   which the query was saved.\n"]

module GetNotebookMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_notebook_metadata_input ->
    ( get_notebook_metadata_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_notebook_metadata_input ->
    ( get_notebook_metadata_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves notebook metadata for the specified notebook ID.\n"]

module GetPreparedStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_prepared_statement_input ->
    ( get_prepared_statement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_prepared_statement_input ->
    ( get_prepared_statement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the prepared statement with the specified name from the specified workgroup.\n"]

module GetQueryExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_query_execution_input ->
    ( get_query_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_query_execution_input ->
    ( get_query_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a single execution of a query if you have access to the workgroup in \
   which the query ran. Each time a query executes, information about the query execution is saved \
   with a unique ID.\n"]

module GetQueryResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_query_results_input ->
    ( get_query_results_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_query_results_input ->
    ( get_query_results_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Streams the results of a single query execution specified by [QueryExecutionId] from the Athena \
   query results location in Amazon S3. For more information, see \
   {{:https://docs.aws.amazon.com/athena/latest/ug/querying.html}Working with query results, \
   recent queries, and output files} in the {i Amazon Athena User Guide}. This request does not \
   execute the query but returns results. Use [StartQueryExecution] to run a query.\n\n\
  \ To stream query results successfully, the IAM principal with permission to call \
   [GetQueryResults] also must have permissions to the Amazon S3 [GetObject] action for the Athena \
   query results location.\n\
  \ \n\
  \   IAM principals with permission to the Amazon S3 [GetObject] action for the query results \
   location are able to retrieve query results from Amazon S3 even if permission to the \
   [GetQueryResults] action is denied. To restrict user or role access, ensure that Amazon S3 \
   permissions to the Athena query location are denied.\n\
  \   \n\
  \    "]

module GetQueryRuntimeStatistics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_query_runtime_statistics_input ->
    ( get_query_runtime_statistics_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_query_runtime_statistics_input ->
    ( get_query_runtime_statistics_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns query execution runtime statistics related to a single execution of a query if you have \
   access to the workgroup in which the query ran. Statistics from the [Timeline] section of the \
   response object are available as soon as [QueryExecutionStatus$State] is in a SUCCEEDED or \
   FAILED state. The remaining non-timeline statistics in the response (like stage-level input and \
   output row count and data size) are updated asynchronously and may not be available immediately \
   after a query completes or, in some cases, may not be returned. The non-timeline statistics are \
   also not included when a query has row-level filters defined in Lake Formation.\n"]

module GetResourceDashboard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_dashboard_request ->
    ( get_resource_dashboard_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_dashboard_request ->
    ( get_resource_dashboard_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the Live UI/Persistence UI for a session.\n"]

module GetSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_request ->
    ( get_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_session_request ->
    ( get_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the full details of a previously created session, including the session status and \
   configuration.\n"]

module GetSessionEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_endpoint_request ->
    ( get_session_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_session_endpoint_request ->
    ( get_session_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a connection endpoint and authentication token for a given session Id.\n"]

module GetSessionStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_status_request ->
    ( get_session_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_session_status_request ->
    ( get_session_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the current status of a session.\n"]

module GetTableMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `MetadataException of metadata_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_metadata_input ->
    ( get_table_metadata_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `MetadataException of metadata_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_metadata_input ->
    ( get_table_metadata_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `MetadataException of metadata_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns table metadata for the specified catalog, database, and table.\n"]

module GetWorkGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_work_group_input ->
    ( get_work_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_work_group_input ->
    ( get_work_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the workgroup with the specified name.\n"]

module ImportNotebook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_notebook_input ->
    ( import_notebook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_notebook_input ->
    ( import_notebook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Imports a single [ipynb] file to a Spark enabled workgroup. To import the notebook, the request \
   must specify a value for either [Payload] or [NoteBookS3LocationUri]. If neither is specified \
   or both are specified, an [InvalidRequestException] occurs. The maximum file size that can be \
   imported is 10 megabytes. If an [ipynb] file with the same name already exists in the \
   workgroup, throws an error.\n"]

module ListApplicationDPUSizes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_dpu_sizes_input ->
    ( list_application_dpu_sizes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_application_dpu_sizes_input ->
    ( list_application_dpu_sizes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the supported DPU sizes for the supported application runtimes (for example, [Athena \
   notebook version 1]). \n"]

module ListCalculationExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_calculation_executions_request ->
    ( list_calculation_executions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_calculation_executions_request ->
    ( list_calculation_executions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the calculations that have been submitted to a session in descending order. Newer \
   calculations are listed first; older calculations are listed later.\n"]

module ListCapacityReservations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_capacity_reservations_input ->
    ( list_capacity_reservations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_capacity_reservations_input ->
    ( list_capacity_reservations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the capacity reservations for the current account.\n"]

module ListDataCatalogs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_catalogs_input ->
    ( list_data_catalogs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_catalogs_input ->
    ( list_data_catalogs_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the data catalogs in the current Amazon Web Services account.\n\n\
  \  In the Athena console, data catalogs are listed as \"data sources\" on the {b Data sources} \
   page under the {b Data source name} column.\n\
  \  \n\
  \   "]

module ListDatabases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `MetadataException of metadata_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_databases_input ->
    ( list_databases_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `MetadataException of metadata_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_databases_input ->
    ( list_databases_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `MetadataException of metadata_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the databases in the specified data catalog.\n"]

module ListEngineVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_engine_versions_input ->
    ( list_engine_versions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_engine_versions_input ->
    ( list_engine_versions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of engine versions that are available to choose from, including the Auto option.\n"]

module ListExecutors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_executors_request ->
    ( list_executors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_executors_request ->
    ( list_executors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists, in descending order, the executors that joined a session. Newer executors are listed \
   first; older executors are listed later. The result can be optionally filtered by state.\n"]

module ListNamedQueries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_named_queries_input ->
    ( list_named_queries_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_named_queries_input ->
    ( list_named_queries_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of available query IDs only for queries saved in the specified workgroup. \
   Requires that you have access to the specified workgroup. If a workgroup is not specified, \
   lists the saved queries for the primary workgroup.\n"]

module ListNotebookMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_metadata_input ->
    ( list_notebook_metadata_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_metadata_input ->
    ( list_notebook_metadata_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Displays the notebook files for the specified workgroup in paginated format.\n"]

module ListNotebookSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_sessions_request ->
    ( list_notebook_sessions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_sessions_request ->
    ( list_notebook_sessions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists, in descending order, the sessions that have been created in a notebook that are in an \
   active state like [CREATING], [CREATED], [IDLE] or [BUSY]. Newer sessions are listed first; \
   older sessions are listed later.\n"]

module ListPreparedStatements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_prepared_statements_input ->
    ( list_prepared_statements_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_prepared_statements_input ->
    ( list_prepared_statements_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the prepared statements in the specified workgroup.\n"]

module ListQueryExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_query_executions_input ->
    ( list_query_executions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_query_executions_input ->
    ( list_query_executions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of available query execution IDs for the queries in the specified workgroup. \
   Athena keeps a query history for 45 days. If a workgroup is not specified, returns a list of \
   query execution IDs for the primary workgroup. Requires you to have access to the workgroup in \
   which the queries ran.\n"]

module ListSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_sessions_request ->
    ( list_sessions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sessions_request ->
    ( list_sessions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the sessions in a workgroup that are in an active state like [CREATING], [CREATED], \
   [IDLE], or [BUSY]. Newer sessions are listed first; older sessions are listed later.\n"]

module ListTableMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `MetadataException of metadata_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_table_metadata_input ->
    ( list_table_metadata_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `MetadataException of metadata_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_table_metadata_input ->
    ( list_table_metadata_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `MetadataException of metadata_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the metadata for the tables in the specified data catalog database.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the tags associated with an Athena resource.\n"]

module ListWorkGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_work_groups_input ->
    ( list_work_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_work_groups_input ->
    ( list_work_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists available workgroups for the account.\n"]

module PutCapacityAssignmentConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_capacity_assignment_configuration_input ->
    ( put_capacity_assignment_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_capacity_assignment_configuration_input ->
    ( put_capacity_assignment_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Puts a new capacity assignment configuration for a specified capacity reservation. If a \
   capacity assignment configuration already exists for the capacity reservation, replaces the \
   existing capacity assignment configuration.\n"]

module StartCalculationExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_calculation_execution_request ->
    ( start_calculation_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_calculation_execution_request ->
    ( start_calculation_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Submits calculations for execution within a session. You can supply the code to run as an \
   inline code block within the request.\n\n\
  \  The request syntax requires the [StartCalculationExecutionRequest$CodeBlock] parameter or the \
   [CalculationConfiguration$CodeBlock] parameter, but not both. Because \
   [CalculationConfiguration$CodeBlock] is deprecated, use the \
   [StartCalculationExecutionRequest$CodeBlock] parameter instead.\n\
  \  \n\
  \   "]

module StartQueryExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_query_execution_input ->
    ( start_query_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_query_execution_input ->
    ( start_query_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Runs the SQL query statements contained in the [Query]. Requires you to have access to the \
   workgroup in which the query ran. Running queries against an external catalog requires \
   [GetDataCatalog] permission to the catalog. For code samples using the Amazon Web Services SDK \
   for Java, see {{:http://docs.aws.amazon.com/athena/latest/ug/code-samples.html}Examples and \
   Code Samples} in the {i Amazon Athena User Guide}.\n"]

module StartSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `SessionAlreadyExistsException of session_already_exists_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_session_request ->
    ( start_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SessionAlreadyExistsException of session_already_exists_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_session_request ->
    ( start_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SessionAlreadyExistsException of session_already_exists_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a session for running calculations within a workgroup. The session is ready when it \
   reaches an [IDLE] state.\n"]

module StopCalculationExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_calculation_execution_request ->
    ( stop_calculation_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_calculation_execution_request ->
    ( stop_calculation_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Requests the cancellation of a calculation. A [StopCalculationExecution] call on a calculation \
   that is already in a terminal state (for example, [STOPPED], [FAILED], or [COMPLETED]) succeeds \
   but has no effect.\n\n\
  \  Cancelling a calculation is done on a best effort basis. If a calculation cannot be \
   cancelled, you can be charged for its completion. If you are concerned about being charged for \
   a calculation that cannot be cancelled, consider terminating the session in which the \
   calculation is running.\n\
  \  \n\
  \   "]

module StopQueryExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_query_execution_input ->
    ( stop_query_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_query_execution_input ->
    ( stop_query_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a query execution. Requires you to have access to the workgroup in which the query ran.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an Athena resource. A tag is a label that you assign to a resource. \
   Each tag consists of a key and an optional value, both of which you define. For example, you \
   can use tags to categorize Athena workgroups, data catalogs, or capacity reservations by \
   purpose, owner, or environment. Use a consistent set of tag keys to make it easier to search \
   and filter the resources in your account. For best practices, see \
   {{:https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html}Tagging \
   Best Practices}. Tag keys can be from 1 to 128 UTF-8 Unicode characters, and tag values can be \
   from 0 to 256 UTF-8 Unicode characters. Tags can use letters and numbers representable in \
   UTF-8, and the following characters: + - = . _ : / \\@. Tag keys and values are case-sensitive. \
   Tag keys must be unique per resource. If you specify more than one tag, separate them by commas.\n"]

module TerminateSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_session_request ->
    ( terminate_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_session_request ->
    ( terminate_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Terminates an active session. A [TerminateSession] call on a session that is already inactive \
   (for example, in a [FAILED], [TERMINATED] or [TERMINATING] state) succeeds but has no effect. \
   Calculations running in the session when [TerminateSession] is called are forcefully stopped, \
   but may display as [FAILED] instead of [STOPPED].\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes one or more tags from an Athena resource.\n"]

module UpdateCapacityReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_capacity_reservation_input ->
    ( update_capacity_reservation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_capacity_reservation_input ->
    ( update_capacity_reservation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the number of requested data processing units for the capacity reservation with the \
   specified name.\n"]

module UpdateDataCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_data_catalog_input ->
    ( update_data_catalog_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_data_catalog_input ->
    ( update_data_catalog_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the data catalog that has the specified name.\n"]

module UpdateNamedQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_named_query_input ->
    ( update_named_query_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_named_query_input ->
    ( update_named_query_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a [NamedQuery] object. The database or workgroup cannot be updated.\n"]

module UpdateNotebook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_notebook_input ->
    ( update_notebook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_notebook_input ->
    ( update_notebook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the contents of a Spark notebook.\n"]

module UpdateNotebookMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_notebook_metadata_input ->
    ( update_notebook_metadata_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_notebook_metadata_input ->
    ( update_notebook_metadata_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the metadata for a notebook.\n"]

module UpdatePreparedStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_prepared_statement_input ->
    ( update_prepared_statement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_prepared_statement_input ->
    ( update_prepared_statement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a prepared statement.\n"]

module UpdateWorkGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_work_group_input ->
    ( update_work_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_work_group_input ->
    ( update_work_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the workgroup with the specified name. The workgroup's name cannot be changed. Only \
   [ConfigurationUpdates] can be specified.\n"]
