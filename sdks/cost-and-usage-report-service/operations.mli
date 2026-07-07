open Types

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
