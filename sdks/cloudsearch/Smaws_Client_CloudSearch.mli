(** CloudSearch client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_option_status :
  ?update_version:u_int_value ->
  ?pending_deletion:boolean_ ->
  creation_date:update_timestamp ->
  update_date:update_timestamp ->
  state:option_state ->
  unit ->
  option_status

val make_access_policies_status :
  options:policy_document -> status:option_status -> unit -> access_policies_status

val make_update_service_access_policies_response :
  access_policies:access_policies_status -> unit -> update_service_access_policies_response

val make_update_service_access_policies_request :
  domain_name:domain_name ->
  access_policies:policy_document ->
  unit ->
  update_service_access_policies_request

val make_scaling_parameters :
  ?desired_instance_type:partition_instance_type ->
  ?desired_replication_count:u_int_value ->
  ?desired_partition_count:u_int_value ->
  unit ->
  scaling_parameters

val make_scaling_parameters_status :
  options:scaling_parameters -> status:option_status -> unit -> scaling_parameters_status

val make_update_scaling_parameters_response :
  scaling_parameters:scaling_parameters_status -> unit -> update_scaling_parameters_response

val make_update_scaling_parameters_request :
  domain_name:domain_name ->
  scaling_parameters:scaling_parameters ->
  unit ->
  update_scaling_parameters_request

val make_domain_endpoint_options :
  ?enforce_http_s:boolean_ ->
  ?tls_security_policy:tls_security_policy ->
  unit ->
  domain_endpoint_options

val make_domain_endpoint_options_status :
  options:domain_endpoint_options -> status:option_status -> unit -> domain_endpoint_options_status

val make_update_domain_endpoint_options_response :
  ?domain_endpoint_options:domain_endpoint_options_status ->
  unit ->
  update_domain_endpoint_options_response

val make_update_domain_endpoint_options_request :
  domain_name:domain_name ->
  domain_endpoint_options:domain_endpoint_options ->
  unit ->
  update_domain_endpoint_options_request

val make_availability_options_status :
  options:multi_a_z -> status:option_status -> unit -> availability_options_status

val make_update_availability_options_response :
  ?availability_options:availability_options_status -> unit -> update_availability_options_response

val make_update_availability_options_request :
  domain_name:domain_name -> multi_a_z:boolean_ -> unit -> update_availability_options_request

val make_list_domain_names_response :
  ?domain_names:domain_name_map -> unit -> list_domain_names_response

val make_index_documents_response : ?field_names:field_name_list -> unit -> index_documents_response
val make_index_documents_request : domain_name:domain_name -> unit -> index_documents_request

val make_document_suggester_options :
  ?fuzzy_matching:suggester_fuzzy_matching ->
  ?sort_expression:string_ ->
  source_field:field_name ->
  unit ->
  document_suggester_options

val make_suggester :
  suggester_name:standard_name ->
  document_suggester_options:document_suggester_options ->
  unit ->
  suggester

val make_suggester_status : options:suggester -> status:option_status -> unit -> suggester_status

val make_describe_suggesters_response :
  suggesters:suggester_status_list -> unit -> describe_suggesters_response

val make_describe_suggesters_request :
  ?suggester_names:standard_name_list ->
  ?deployed:boolean_ ->
  domain_name:domain_name ->
  unit ->
  describe_suggesters_request

val make_describe_service_access_policies_response :
  access_policies:access_policies_status -> unit -> describe_service_access_policies_response

val make_describe_service_access_policies_request :
  ?deployed:boolean_ -> domain_name:domain_name -> unit -> describe_service_access_policies_request

val make_describe_scaling_parameters_response :
  scaling_parameters:scaling_parameters_status -> unit -> describe_scaling_parameters_response

val make_describe_scaling_parameters_request :
  domain_name:domain_name -> unit -> describe_scaling_parameters_request

val make_date_array_options :
  ?default_value:field_value ->
  ?source_fields:field_name_comma_list ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  unit ->
  date_array_options

val make_text_array_options :
  ?default_value:field_value ->
  ?source_fields:field_name_comma_list ->
  ?return_enabled:boolean_ ->
  ?highlight_enabled:boolean_ ->
  ?analysis_scheme:word ->
  unit ->
  text_array_options

val make_literal_array_options :
  ?default_value:field_value ->
  ?source_fields:field_name_comma_list ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  unit ->
  literal_array_options

val make_double_array_options :
  ?default_value:double ->
  ?source_fields:field_name_comma_list ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  unit ->
  double_array_options

val make_int_array_options :
  ?default_value:long ->
  ?source_fields:field_name_comma_list ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  unit ->
  int_array_options

val make_lat_lon_options :
  ?default_value:field_value ->
  ?source_field:field_name ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  unit ->
  lat_lon_options

val make_date_options :
  ?default_value:field_value ->
  ?source_field:field_name ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  unit ->
  date_options

val make_text_options :
  ?default_value:field_value ->
  ?source_field:field_name ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  ?highlight_enabled:boolean_ ->
  ?analysis_scheme:word ->
  unit ->
  text_options

val make_literal_options :
  ?default_value:field_value ->
  ?source_field:field_name ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  unit ->
  literal_options

val make_double_options :
  ?default_value:double ->
  ?source_field:field_name ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  unit ->
  double_options

val make_int_options :
  ?default_value:long ->
  ?source_field:field_name ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  unit ->
  int_options

val make_index_field :
  ?int_options:int_options ->
  ?double_options:double_options ->
  ?literal_options:literal_options ->
  ?text_options:text_options ->
  ?date_options:date_options ->
  ?lat_lon_options:lat_lon_options ->
  ?int_array_options:int_array_options ->
  ?double_array_options:double_array_options ->
  ?literal_array_options:literal_array_options ->
  ?text_array_options:text_array_options ->
  ?date_array_options:date_array_options ->
  index_field_name:dynamic_field_name ->
  index_field_type:index_field_type ->
  unit ->
  index_field

val make_index_field_status :
  options:index_field -> status:option_status -> unit -> index_field_status

val make_describe_index_fields_response :
  index_fields:index_field_status_list -> unit -> describe_index_fields_response

val make_describe_index_fields_request :
  ?field_names:dynamic_field_name_list ->
  ?deployed:boolean_ ->
  domain_name:domain_name ->
  unit ->
  describe_index_fields_request

val make_expression :
  expression_name:standard_name -> expression_value:expression_value -> unit -> expression

val make_expression_status : options:expression -> status:option_status -> unit -> expression_status

val make_describe_expressions_response :
  expressions:expression_status_list -> unit -> describe_expressions_response

val make_describe_expressions_request :
  ?expression_names:standard_name_list ->
  ?deployed:boolean_ ->
  domain_name:domain_name ->
  unit ->
  describe_expressions_request

val make_limits :
  maximum_replication_count:maximum_replication_count ->
  maximum_partition_count:maximum_partition_count ->
  unit ->
  limits

val make_service_endpoint : ?endpoint:service_url -> unit -> service_endpoint

val make_domain_status :
  ?ar_n:ar_n ->
  ?created:boolean_ ->
  ?deleted:boolean_ ->
  ?doc_service:service_endpoint ->
  ?search_service:service_endpoint ->
  ?processing:boolean_ ->
  ?search_instance_type:search_instance_type ->
  ?search_partition_count:partition_count ->
  ?search_instance_count:instance_count ->
  ?limits:limits ->
  domain_id:domain_id ->
  domain_name:domain_name ->
  requires_index_documents:boolean_ ->
  unit ->
  domain_status

val make_describe_domains_response :
  domain_status_list:domain_status_list -> unit -> describe_domains_response

val make_describe_domains_request :
  ?domain_names:domain_name_list -> unit -> describe_domains_request

val make_describe_domain_endpoint_options_response :
  ?domain_endpoint_options:domain_endpoint_options_status ->
  unit ->
  describe_domain_endpoint_options_response

val make_describe_domain_endpoint_options_request :
  ?deployed:boolean_ -> domain_name:domain_name -> unit -> describe_domain_endpoint_options_request

val make_describe_availability_options_response :
  ?availability_options:availability_options_status ->
  unit ->
  describe_availability_options_response

val make_describe_availability_options_request :
  ?deployed:boolean_ -> domain_name:domain_name -> unit -> describe_availability_options_request

val make_analysis_options :
  ?synonyms:string_ ->
  ?stopwords:string_ ->
  ?stemming_dictionary:string_ ->
  ?japanese_tokenization_dictionary:string_ ->
  ?algorithmic_stemming:algorithmic_stemming ->
  unit ->
  analysis_options

val make_analysis_scheme :
  ?analysis_options:analysis_options ->
  analysis_scheme_name:standard_name ->
  analysis_scheme_language:analysis_scheme_language ->
  unit ->
  analysis_scheme

val make_analysis_scheme_status :
  options:analysis_scheme -> status:option_status -> unit -> analysis_scheme_status

val make_describe_analysis_schemes_response :
  analysis_schemes:analysis_scheme_status_list -> unit -> describe_analysis_schemes_response

val make_describe_analysis_schemes_request :
  ?analysis_scheme_names:standard_name_list ->
  ?deployed:boolean_ ->
  domain_name:domain_name ->
  unit ->
  describe_analysis_schemes_request

val make_delete_suggester_response : suggester:suggester_status -> unit -> delete_suggester_response

val make_delete_suggester_request :
  domain_name:domain_name -> suggester_name:standard_name -> unit -> delete_suggester_request

val make_delete_index_field_response :
  index_field:index_field_status -> unit -> delete_index_field_response

val make_delete_index_field_request :
  domain_name:domain_name ->
  index_field_name:dynamic_field_name ->
  unit ->
  delete_index_field_request

val make_delete_expression_response :
  expression:expression_status -> unit -> delete_expression_response

val make_delete_expression_request :
  domain_name:domain_name -> expression_name:standard_name -> unit -> delete_expression_request

val make_delete_domain_response : ?domain_status:domain_status -> unit -> delete_domain_response
val make_delete_domain_request : domain_name:domain_name -> unit -> delete_domain_request

val make_delete_analysis_scheme_response :
  analysis_scheme:analysis_scheme_status -> unit -> delete_analysis_scheme_response

val make_delete_analysis_scheme_request :
  domain_name:domain_name ->
  analysis_scheme_name:standard_name ->
  unit ->
  delete_analysis_scheme_request

val make_define_suggester_response : suggester:suggester_status -> unit -> define_suggester_response

val make_define_suggester_request :
  domain_name:domain_name -> suggester:suggester -> unit -> define_suggester_request

val make_define_index_field_response :
  index_field:index_field_status -> unit -> define_index_field_response

val make_define_index_field_request :
  domain_name:domain_name -> index_field:index_field -> unit -> define_index_field_request

val make_define_expression_response :
  expression:expression_status -> unit -> define_expression_response

val make_define_expression_request :
  domain_name:domain_name -> expression:expression -> unit -> define_expression_request

val make_define_analysis_scheme_response :
  analysis_scheme:analysis_scheme_status -> unit -> define_analysis_scheme_response

val make_define_analysis_scheme_request :
  domain_name:domain_name ->
  analysis_scheme:analysis_scheme ->
  unit ->
  define_analysis_scheme_request

val make_create_domain_response : ?domain_status:domain_status -> unit -> create_domain_response
val make_create_domain_request : domain_name:domain_name -> unit -> create_domain_request

val make_build_suggesters_response :
  ?field_names:field_name_list -> unit -> build_suggesters_response

val make_build_suggesters_request : domain_name:domain_name -> unit -> build_suggesters_request
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
