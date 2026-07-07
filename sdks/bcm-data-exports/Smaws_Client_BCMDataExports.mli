(** BCM Data Exports client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validation_exception_field :
  message:generic_string -> name:generic_string -> unit -> validation_exception_field

val make_update_export_response : ?export_arn:arn -> unit -> update_export_response

val make_data_query :
  ?table_configurations:table_configurations ->
  query_statement:query_statement ->
  unit ->
  data_query

val make_s3_output_configurations :
  overwrite:overwrite_option ->
  compression:compression_option ->
  format:format_option ->
  output_type:s3_output_type ->
  unit ->
  s3_output_configurations

val make_s3_destination :
  ?s3_bucket_owner:account_id ->
  s3_output_configurations:s3_output_configurations ->
  s3_region:generic_string ->
  s3_prefix:generic_string ->
  s3_bucket:generic_string ->
  unit ->
  s3_destination

val make_destination_configurations :
  s3_destination:s3_destination -> unit -> destination_configurations

val make_refresh_cadence : frequency:frequency_option -> unit -> refresh_cadence

val make_export_ :
  ?description:generic_string ->
  ?export_arn:arn ->
  refresh_cadence:refresh_cadence ->
  destination_configurations:destination_configurations ->
  data_query:data_query ->
  name:export_name ->
  unit ->
  export_

val make_update_export_request : export_:export_ -> export_arn:arn -> unit -> update_export_request
val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_tag_keys:resource_tag_key_list -> resource_arn:arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag

val make_tag_resource_request :
  resource_tags:resource_tag_list -> resource_arn:arn -> unit -> tag_resource_request

val make_table_property_description :
  ?description:generic_string ->
  ?default_value:generic_string ->
  ?valid_values:generic_string_list ->
  ?name:generic_string ->
  unit ->
  table_property_description

val make_table :
  ?table_properties:table_property_description_list ->
  ?description:generic_string ->
  ?table_name:table_name ->
  unit ->
  table

val make_list_tags_for_resource_response :
  ?next_token:next_page_token ->
  ?resource_tags:resource_tag_list ->
  unit ->
  list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  resource_arn:arn ->
  unit ->
  list_tags_for_resource_request

val make_list_tables_response :
  ?next_token:next_page_token -> ?tables:table_list -> unit -> list_tables_response

val make_list_tables_request :
  ?max_results:max_results -> ?next_token:next_page_token -> unit -> list_tables_request

val make_export_status :
  ?last_refreshed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status_reason:execution_status_reason ->
  ?status_code:export_status_code ->
  unit ->
  export_status

val make_export_reference :
  export_status:export_status ->
  export_name:export_name ->
  export_arn:arn ->
  unit ->
  export_reference

val make_list_exports_response :
  ?next_token:next_page_token -> ?exports:export_reference_list -> unit -> list_exports_response

val make_list_exports_request :
  ?next_token:next_page_token -> ?max_results:max_results -> unit -> list_exports_request

val make_execution_status :
  ?last_updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?completed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status_reason:execution_status_reason ->
  ?status_code:execution_status_code ->
  unit ->
  execution_status

val make_execution_reference :
  execution_status:execution_status -> execution_id:generic_string -> unit -> execution_reference

val make_list_executions_response :
  ?next_token:next_page_token ->
  ?executions:execution_reference_list ->
  unit ->
  list_executions_response

val make_list_executions_request :
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  export_arn:arn ->
  unit ->
  list_executions_request

val make_column :
  ?description:generic_string -> ?type_:generic_string -> ?name:generic_string -> unit -> column

val make_get_table_response :
  ?schema:column_list ->
  ?table_properties:table_properties ->
  ?description:generic_string ->
  ?table_name:table_name ->
  unit ->
  get_table_response

val make_get_table_request :
  ?table_properties:table_properties -> table_name:table_name -> unit -> get_table_request

val make_get_export_response :
  ?export_status:export_status -> ?export_:export_ -> unit -> get_export_response

val make_get_export_request : export_arn:arn -> unit -> get_export_request

val make_get_execution_response :
  ?execution_status:execution_status ->
  ?export_:export_ ->
  ?execution_id:generic_string ->
  unit ->
  get_execution_response

val make_get_execution_request :
  execution_id:generic_string -> export_arn:arn -> unit -> get_execution_request

val make_delete_export_response : ?export_arn:arn -> unit -> delete_export_response
val make_delete_export_request : export_arn:arn -> unit -> delete_export_request
val make_create_export_response : ?export_arn:arn -> unit -> create_export_response

val make_create_export_request :
  ?resource_tags:resource_tag_list -> export_:export_ -> unit -> create_export_request
(** {1:operations Operations} *)

module CreateExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_export_request ->
    ( create_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_export_request ->
    ( create_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a data export and specifies the data query, the delivery preference, and any optional \
   resource tags.\n\n\
  \ A [DataQuery] consists of both a [QueryStatement] and [TableConfigurations].\n\
  \ \n\
  \  The [QueryStatement] is an SQL statement. Data Exports only supports a limited subset of the \
   SQL syntax. For more information on the SQL syntax that is supported, see \
   {{:https://docs.aws.amazon.com/cur/latest/userguide/de-data-query.html}Data query}. To view the \
   available tables and columns, see the \
   {{:https://docs.aws.amazon.com/cur/latest/userguide/de-table-dictionary.html}Data Exports table \
   dictionary}.\n\
  \  \n\
  \   The [TableConfigurations] is a collection of specified [TableProperties] for the table being \
   queried in the [QueryStatement]. TableProperties are additional configurations you can provide \
   to change the data and schema of a table. Each table can have different TableProperties. \
   However, tables are not required to have any TableProperties. Each table property has a default \
   value that it assumes if not specified. For more information on table configurations, see \
   {{:https://docs.aws.amazon.com/cur/latest/userguide/de-data-query.html}Data query}. To view the \
   table properties available for each table, see the \
   {{:https://docs.aws.amazon.com/cur/latest/userguide/de-table-dictionary.html}Data Exports table \
   dictionary} or use the [ListTables] API to get a response of all tables and their available \
   properties.\n\
  \   "]

module DeleteExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_export_request ->
    ( delete_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_export_request ->
    ( delete_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an existing data export.\n"]

module GetExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_execution_request ->
    ( get_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_execution_request ->
    ( get_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Exports data based on the source data update.\n"]

module GetExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_export_request ->
    ( get_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_export_request ->
    ( get_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Views the definition of an existing data export.\n"]

module GetTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_request ->
    ( get_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_request ->
    ( get_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the metadata for the specified table and table properties. This includes the list of \
   columns in the table schema, their data types, and column descriptions.\n"]

module ListExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_executions_request ->
    ( list_executions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_executions_request ->
    ( list_executions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the historical executions for the export.\n"]

module ListExports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_exports_request ->
    ( list_exports_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_exports_request ->
    ( list_exports_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all data export definitions.\n"]

module ListTables : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tables_request ->
    ( list_tables_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tables_request ->
    ( list_tables_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all available tables in data exports.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List tags associated with an existing data export.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds tags for an existing data export definition.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes tags associated with an existing data export definition.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_export_request ->
    ( update_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_export_request ->
    ( update_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing data export by overwriting all export parameters. All export parameters \
   must be provided in the UpdateExport request.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
