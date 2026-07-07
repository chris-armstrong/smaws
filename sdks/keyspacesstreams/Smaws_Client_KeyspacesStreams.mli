(** KeyspacesStreams client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_stream :
  stream_label:Smaws_Lib.Smithy_api.Types.string_ ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  stream_arn:stream_arn ->
  unit ->
  stream

val make_shard_filter : ?shard_id:shard_id -> ?type_:shard_filter_type -> unit -> shard_filter

val make_sequence_number_range :
  ?ending_sequence_number:sequence_number ->
  ?starting_sequence_number:sequence_number ->
  unit ->
  sequence_number_range

val make_shard :
  ?parent_shard_ids:shard_id_list ->
  ?sequence_number_range:sequence_number_range ->
  ?shard_id:shard_id ->
  unit ->
  shard

val make_keyspaces_metadata :
  ?write_time:Smaws_Lib.Smithy_api.Types.string_ ->
  ?expiration_time:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  keyspaces_metadata

val make_keyspaces_cell :
  ?metadata:keyspaces_metadata -> ?value:keyspaces_cell_value -> unit -> keyspaces_cell

val make_keyspaces_cell_map_definition :
  ?metadata:keyspaces_metadata ->
  ?value:keyspaces_cell_value ->
  ?key:keyspaces_cell_value ->
  unit ->
  keyspaces_cell_map_definition

val make_keyspaces_row :
  ?row_metadata:keyspaces_metadata ->
  ?static_cells:keyspaces_cells ->
  ?value_cells:keyspaces_cells ->
  unit ->
  keyspaces_row

val make_record :
  ?sequence_number:sequence_number ->
  ?old_image:keyspaces_row ->
  ?new_image:keyspaces_row ->
  ?clustering_keys:keyspaces_keys_map ->
  ?partition_keys:keyspaces_keys_map ->
  ?origin:origin_type ->
  ?created_at:date ->
  ?event_version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  record

val make_list_streams_output :
  ?next_token:stream_arn_token -> ?streams:stream_list -> unit -> list_streams_output

val make_list_streams_input :
  ?next_token:stream_arn_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?table_name:table_name ->
  ?keyspace_name:keyspace_name ->
  unit ->
  list_streams_input

val make_get_stream_output :
  ?next_token:shard_id_token ->
  ?shards:shard_description_list ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  creation_request_date_time:date ->
  stream_view_type:stream_view_type ->
  stream_status:stream_status ->
  stream_label:Smaws_Lib.Smithy_api.Types.string_ ->
  stream_arn:stream_arn ->
  unit ->
  get_stream_output

val make_get_stream_input :
  ?next_token:shard_id_token ->
  ?shard_filter:shard_filter ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  stream_arn:stream_arn ->
  unit ->
  get_stream_input

val make_get_shard_iterator_output :
  ?shard_iterator:shard_iterator -> unit -> get_shard_iterator_output

val make_get_shard_iterator_input :
  ?sequence_number:sequence_number ->
  shard_iterator_type:shard_iterator_type ->
  shard_id:shard_id ->
  stream_arn:stream_arn ->
  unit ->
  get_shard_iterator_input

val make_iterator_description : ?iterator_position:iterator_position -> unit -> iterator_description

val make_get_records_output :
  ?iterator_description:iterator_description ->
  ?next_shard_iterator:shard_iterator ->
  ?change_records:record_list ->
  unit ->
  get_records_output

val make_get_records_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  shard_iterator:shard_iterator ->
  unit ->
  get_records_input
(** {1:operations Operations} *)

module GetRecords : sig
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
    get_records_input ->
    ( get_records_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_records_input ->
    ( get_records_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves data records from a specified shard in an Amazon Keyspaces data stream. This \
   operation returns a collection of data records from the shard, including the primary key \
   columns and information about modifications made to the captured table data. Each record \
   represents a single data modification in the Amazon Keyspaces table and includes metadata about \
   when the change occurred.\n"]

module GetShardIterator : sig
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
    get_shard_iterator_input ->
    ( get_shard_iterator_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_shard_iterator_input ->
    ( get_shard_iterator_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a shard iterator that serves as a bookmark for reading data from a specific position in \
   an Amazon Keyspaces data stream's shard. The shard iterator specifies the shard position from \
   which to start reading data records sequentially. You can specify whether to begin reading at \
   the latest record, the oldest record, or at a particular sequence number within the shard.\n"]

module GetStream : sig
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
    get_stream_input ->
    ( get_stream_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_stream_input ->
    ( get_stream_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed information about a specific data capture stream for an Amazon Keyspaces \
   table. The information includes the stream's Amazon Resource Name (ARN), creation time, current \
   status, retention period, shard composition, and associated table details. This operation helps \
   you monitor and manage the configuration of your Amazon Keyspaces data streams.\n"]

(** {1:Serialization and Deserialization} *)
module ListStreams : sig
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
    list_streams_input ->
    ( list_streams_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_streams_input ->
    ( list_streams_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all data capture streams associated with your Amazon Keyspaces account or for \
   a specific keyspace or table. The response includes information such as stream ARNs, table \
   associations, creation timestamps, and current status. This operation helps you discover and \
   manage all active data streams in your Amazon Keyspaces environment.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
