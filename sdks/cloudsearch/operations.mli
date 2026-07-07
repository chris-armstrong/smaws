open Types

module BuildSuggesters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    build_suggesters_request ->
    ( build_suggesters_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    build_suggesters_request ->
    ( build_suggesters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Indexes the search suggestions. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html#configuring-suggesters}Configuring \
   Suggesters} in the {i Amazon CloudSearch Developer Guide}.\n"]

module CreateDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_domain_request ->
    ( create_domain_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_domain_request ->
    ( create_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new search domain. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/creating-domains.html}Creating \
   a Search Domain} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DefineAnalysisScheme : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    define_analysis_scheme_request ->
    ( define_analysis_scheme_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    define_analysis_scheme_request ->
    ( define_analysis_scheme_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures an analysis scheme that can be applied to a [text] or [text-array] field to define \
   language-specific text processing options. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html}Configuring \
   Analysis Schemes} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DefineExpression : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    define_expression_request ->
    ( define_expression_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    define_expression_request ->
    ( define_expression_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures an \n\
   {[\n\
   [Expression]\n\
   ]}\n\
  \ for the search domain. Used to create new expressions and modify existing ones. If the \
   expression exists, the new configuration replaces the old one. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html}Configuring \
   Expressions} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DefineIndexField : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    define_index_field_request ->
    ( define_index_field_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    define_index_field_request ->
    ( define_index_field_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures an \n\
   {[\n\
   [IndexField]\n\
   ]}\n\
  \ for the search domain. Used to create new fields and modify existing ones. You must specify \
   the name of the domain you are configuring and an index field configuration. The index field \
   configuration specifies a unique name, the index field type, and the options you want to \
   configure for the field. The options you can specify depend on the \n\
   {[\n\
   [IndexFieldType]\n\
   ]}\n\
   . If the field exists, the new configuration replaces the old one. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html}Configuring \
   Index Fields} in the {i Amazon CloudSearch Developer Guide}. \n"]

module DefineSuggester : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    define_suggester_request ->
    ( define_suggester_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    define_suggester_request ->
    ( define_suggester_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures a suggester for a domain. A suggester enables you to display possible matches before \
   users finish typing their queries. When you configure a suggester, you must specify the name of \
   the text field you want to search for possible matches and a unique name for the suggester. For \
   more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html}Getting \
   Search Suggestions} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DeleteAnalysisScheme : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_analysis_scheme_request ->
    ( delete_analysis_scheme_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_analysis_scheme_request ->
    ( delete_analysis_scheme_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an analysis scheme. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html}Configuring \
   Analysis Schemes} in the {i Amazon CloudSearch Developer Guide}. \n"]

module DeleteDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_domain_request ->
    ( delete_domain_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_domain_request ->
    ( delete_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Permanently deletes a search domain and all of its data. Once a domain has been deleted, it \
   cannot be recovered. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/deleting-domains.html}Deleting \
   a Search Domain} in the {i Amazon CloudSearch Developer Guide}. \n"]

module DeleteExpression : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_expression_request ->
    ( delete_expression_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_expression_request ->
    ( delete_expression_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes an \n\
   {[\n\
   [Expression]\n\
   ]}\n\
  \ from the search domain. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html}Configuring \
   Expressions} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DeleteIndexField : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_index_field_request ->
    ( delete_index_field_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_index_field_request ->
    ( delete_index_field_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes an \n\
   {[\n\
   [IndexField]\n\
   ]}\n\
  \ from the search domain. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html}Configuring \
   Index Fields} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DeleteSuggester : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_suggester_request ->
    ( delete_suggester_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_suggester_request ->
    ( delete_suggester_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a suggester. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html}Getting \
   Search Suggestions} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DescribeAnalysisSchemes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_analysis_schemes_request ->
    ( describe_analysis_schemes_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_analysis_schemes_request ->
    ( describe_analysis_schemes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the analysis schemes configured for a domain. An analysis scheme defines language-specific \
   text processing options for a [text] field. Can be limited to specific analysis schemes by \
   name. By default, shows all analysis schemes and includes any pending changes to the \
   configuration. Set the [Deployed] option to [true] to show the active configuration and exclude \
   pending changes. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html}Configuring \
   Analysis Schemes} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DescribeAvailabilityOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `DisabledOperationException of disabled_operation_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_availability_options_request ->
    ( describe_availability_options_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `DisabledOperationException of disabled_operation_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_availability_options_request ->
    ( describe_availability_options_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `DisabledOperationException of disabled_operation_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the availability options configured for a domain. By default, shows the configuration with \
   any pending changes. Set the [Deployed] option to [true] to show the active configuration and \
   exclude pending changes. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html}Configuring \
   Availability Options} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DescribeDomainEndpointOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `DisabledOperationException of disabled_operation_exception
    | `InternalException of internal_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_domain_endpoint_options_request ->
    ( describe_domain_endpoint_options_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `DisabledOperationException of disabled_operation_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_domain_endpoint_options_request ->
    ( describe_domain_endpoint_options_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `DisabledOperationException of disabled_operation_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the domain's endpoint options, specifically whether all requests to the domain must \
   arrive over HTTPS. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-domain-endpoint-options.html}Configuring \
   Domain Endpoint Options} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DescribeDomains : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_domains_request ->
    ( describe_domains_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_domains_request ->
    ( describe_domains_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the search domains owned by this account. Can be limited to specific \
   domains. Shows all domains by default. To get the number of searchable documents in a domain, \
   use the console or submit a [matchall] request to your domain's search endpoint: \
   [q=matchall&q.parser=structured&size=0]. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html}Getting \
   Information about a Search Domain} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DescribeExpressions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_expressions_request ->
    ( describe_expressions_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_expressions_request ->
    ( describe_expressions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the expressions configured for the search domain. Can be limited to specific expressions \
   by name. By default, shows all expressions and includes any pending changes to the \
   configuration. Set the [Deployed] option to [true] to show the active configuration and exclude \
   pending changes. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html}Configuring \
   Expressions} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DescribeIndexFields : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_index_fields_request ->
    ( describe_index_fields_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_index_fields_request ->
    ( describe_index_fields_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the index fields configured for the search domain. Can be limited to \
   specific fields by name. By default, shows all fields and includes any pending changes to the \
   configuration. Set the [Deployed] option to [true] to show the active configuration and exclude \
   pending changes. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html}Getting \
   Domain Information} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DescribeScalingParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_parameters_request ->
    ( describe_scaling_parameters_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_parameters_request ->
    ( describe_scaling_parameters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the scaling parameters configured for a domain. A domain's scaling parameters specify the \
   desired search instance type and replication count. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html}Configuring \
   Scaling Options} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DescribeServiceAccessPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_service_access_policies_request ->
    ( describe_service_access_policies_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_service_access_policies_request ->
    ( describe_service_access_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the access policies that control access to the domain's document and \
   search endpoints. By default, shows the configuration with any pending changes. Set the \
   [Deployed] option to [true] to show the active configuration and exclude pending changes. For \
   more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html}Configuring \
   Access for a Search Domain} in the {i Amazon CloudSearch Developer Guide}.\n"]

module DescribeSuggesters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_suggesters_request ->
    ( describe_suggesters_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_suggesters_request ->
    ( describe_suggesters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the suggesters configured for a domain. A suggester enables you to display possible \
   matches before users finish typing their queries. Can be limited to specific suggesters by \
   name. By default, shows all suggesters and includes any pending changes to the configuration. \
   Set the [Deployed] option to [true] to show the active configuration and exclude pending \
   changes. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html}Getting \
   Search Suggestions} in the {i Amazon CloudSearch Developer Guide}.\n"]

module IndexDocuments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    index_documents_request ->
    ( index_documents_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    index_documents_request ->
    ( index_documents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Tells the search domain to start indexing its documents using the latest indexing options. This \
   operation must be invoked to activate options whose [OptionStatus] is [RequiresIndexDocuments].\n"]

module ListDomainNames : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `BaseException of base_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( list_domain_names_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `BaseException of base_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( list_domain_names_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `BaseException of base_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all search domains owned by an account.\n"]

module UpdateAvailabilityOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `DisabledOperationException of disabled_operation_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_availability_options_request ->
    ( update_availability_options_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `DisabledOperationException of disabled_operation_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_availability_options_request ->
    ( update_availability_options_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `DisabledOperationException of disabled_operation_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures the availability options for a domain. Enabling the Multi-AZ option expands an \
   Amazon CloudSearch domain to an additional Availability Zone in the same Region to increase \
   fault tolerance in the event of a service disruption. Changes to the Multi-AZ option can take \
   about half an hour to become active. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html}Configuring \
   Availability Options} in the {i Amazon CloudSearch Developer Guide}.\n"]

module UpdateDomainEndpointOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `DisabledOperationException of disabled_operation_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_domain_endpoint_options_request ->
    ( update_domain_endpoint_options_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `DisabledOperationException of disabled_operation_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_domain_endpoint_options_request ->
    ( update_domain_endpoint_options_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `DisabledOperationException of disabled_operation_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the domain's endpoint options, specifically whether all requests to the domain must \
   arrive over HTTPS. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-domain-endpoint-options.html}Configuring \
   Domain Endpoint Options} in the {i Amazon CloudSearch Developer Guide}.\n"]

module UpdateScalingParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_scaling_parameters_request ->
    ( update_scaling_parameters_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_scaling_parameters_request ->
    ( update_scaling_parameters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures scaling parameters for a domain. A domain's scaling parameters specify the desired \
   search instance type and replication count. Amazon CloudSearch will still automatically scale \
   your domain based on the volume of data and traffic, but not below the desired instance type \
   and replication count. If the Multi-AZ option is enabled, these values control the resources \
   used per Availability Zone. For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html}Configuring \
   Scaling Options} in the {i Amazon CloudSearch Developer Guide}. \n"]

module UpdateServiceAccessPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BaseException of base_exception
    | `InternalException of internal_exception
    | `InvalidTypeException of invalid_type_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_access_policies_request ->
    ( update_service_access_policies_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_service_access_policies_request ->
    ( update_service_access_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BaseException of base_exception
      | `InternalException of internal_exception
      | `InvalidTypeException of invalid_type_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures the access rules that control access to the domain's document and search endpoints. \
   For more information, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html} \
   Configuring Access for an Amazon CloudSearch Domain}.\n"]
