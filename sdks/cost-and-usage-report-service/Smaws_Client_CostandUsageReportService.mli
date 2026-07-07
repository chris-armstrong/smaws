(** Cost and Usage Report Service client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> report_name:report_name -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> report_name:report_name -> unit -> tag_resource_request

val make_report_status :
  ?last_status:last_status -> ?last_delivery:last_delivery -> unit -> report_status

val make_report_definition :
  ?report_status:report_status ->
  ?billing_view_arn:billing_view_arn ->
  ?report_versioning:report_versioning ->
  ?refresh_closed_reports:refresh_closed_reports ->
  ?additional_artifacts:additional_artifact_list ->
  s3_region:aws_region ->
  s3_prefix:s3_prefix ->
  s3_bucket:s3_bucket ->
  additional_schema_elements:schema_element_list ->
  compression:compression_format ->
  format:report_format ->
  time_unit:time_unit ->
  report_name:report_name ->
  unit ->
  report_definition

val make_put_report_definition_response : unit -> unit

val make_put_report_definition_request :
  ?tags:tag_list -> report_definition:report_definition -> unit -> put_report_definition_request

val make_modify_report_definition_response : unit -> unit

val make_modify_report_definition_request :
  report_definition:report_definition ->
  report_name:report_name ->
  unit ->
  modify_report_definition_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  report_name:report_name -> unit -> list_tags_for_resource_request

val make_describe_report_definitions_response :
  ?next_token:generic_string ->
  ?report_definitions:report_definition_list ->
  unit ->
  describe_report_definitions_response

val make_describe_report_definitions_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  unit ->
  describe_report_definitions_request

val make_delete_report_definition_response :
  ?response_message:delete_response_message -> unit -> delete_report_definition_response

val make_delete_report_definition_request :
  report_name:report_name -> unit -> delete_report_definition_request
(** {1:operations Operations} *)

module DeleteReportDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_report_definition_request ->
    ( delete_report_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_report_definition_request ->
    ( delete_report_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified report. Any tags associated with the report are also deleted.\n"]

module DescribeReportDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_report_definitions_request ->
    ( describe_report_definitions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_report_definitions_request ->
    ( describe_report_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the Amazon Web Services Cost and Usage Report available to this account.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the tags associated with the specified report definition.\n"]

module ModifyReportDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_report_definition_request ->
    ( modify_report_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_report_definition_request ->
    ( modify_report_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Allows you to programmatically update your report preferences.\n"]

module PutReportDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateReportNameException of duplicate_report_name_exception
    | `InternalErrorException of internal_error_exception
    | `ReportLimitReachedException of report_limit_reached_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_report_definition_request ->
    ( put_report_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateReportNameException of duplicate_report_name_exception
      | `InternalErrorException of internal_error_exception
      | `ReportLimitReachedException of report_limit_reached_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_report_definition_request ->
    ( put_report_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateReportNameException of duplicate_report_name_exception
      | `InternalErrorException of internal_error_exception
      | `ReportLimitReachedException of report_limit_reached_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new report using the description that you provide.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates a set of tags with a report definition.\n"]

(** {1:Serialization and Deserialization} *)
module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalErrorException of internal_error_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalErrorException of internal_error_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates a set of tags from a report definition.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
