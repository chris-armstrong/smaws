type nonrec error_message = string [@@ocaml.doc ""]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec validation_exception = {
  code : error_code option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was rejected because it has invalid parameters.\n"]

type nonrec resource_not_found_exception = {
  code : error_code option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because it attempted to reference a resource that does not exist.\n"]

type nonrec limit_exceeded_exception = {
  code : error_code option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was rejected because a resource limit has already been met.\n"]

type nonrec invalid_type_exception = {
  code : error_code option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was rejected because it specified an invalid type definition.\n"]

type nonrec internal_exception = {
  code : error_code option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "An internal error occurred while processing the request. If this problem persists, report an \
   issue from the {{:http://status.aws.amazon.com/}Service Health Dashboard}.\n"]

type nonrec base_exception = {
  code : error_code option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "An error occurred while processing the request.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec option_state =
  | RequiresIndexDocuments [@ocaml.doc ""]
  | Processing [@ocaml.doc ""]
  | Active [@ocaml.doc ""]
  | FailedToValidate [@ocaml.doc ""]
[@@ocaml.doc
  "The state of processing a change to an option. One of:\n\n\
  \ {ul\n\
  \       {- RequiresIndexDocuments: The option's latest value will not be deployed until \
   [IndexDocuments] has been called and indexing is complete.}\n\
  \       {- Processing: The option's latest value is in the process of being activated.}\n\
  \       {- Active: The option's latest value is fully deployed. }\n\
  \       {- FailedToValidate: The option value is not compatible with the domain's data and \
   cannot be used to index the data. You must either modify the option value or update or remove \
   the incompatible documents.}\n\
  \       }\n\
  \  "]

type nonrec u_int_value = int [@@ocaml.doc ""]

type nonrec update_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec option_status = {
  creation_date : update_timestamp; [@ocaml.doc "A timestamp for when this option was created.\n"]
  update_date : update_timestamp;
      [@ocaml.doc "A timestamp for when this option was last updated.\n"]
  update_version : u_int_value option;
      [@ocaml.doc "A unique integer that indicates when this option was last updated.\n"]
  state : option_state;
      [@ocaml.doc
        "The state of processing a change to an option. Possible values:\n\n\
         {ul\n\
        \      {- [RequiresIndexDocuments]: the option's latest value will not be deployed until \
         [IndexDocuments] has been called and indexing is complete.}\n\
        \      {- [Processing]: the option's latest value is in the process of being activated. }\n\
        \      {- [Active]: the option's latest value is completely deployed.}\n\
        \      {- [FailedToValidate]: the option value is not compatible with the domain's data \
         and cannot be used to index the data. You must either modify the option value or update \
         or remove the incompatible documents.}\n\
        \      }\n\
        \  "]
  pending_deletion : boolean_ option;
      [@ocaml.doc "Indicates that the option will be deleted once processing is complete.\n"]
}
[@@ocaml.doc "The status of domain configuration option.\n"]

type nonrec policy_document = string [@@ocaml.doc ""]

type nonrec access_policies_status = {
  options : policy_document; [@ocaml.doc ""]
  status : option_status; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The configured access rules for the domain's document and search endpoints, and the current \
   status of those rules.\n"]

type nonrec update_service_access_policies_response = {
  access_policies : access_policies_status;
      [@ocaml.doc "The access rules configured for the domain.\n"]
}
[@@ocaml.doc
  "The result of an [UpdateServiceAccessPolicies] request. Contains the new access policies.\n"]

type nonrec domain_name = string [@@ocaml.doc ""]

type nonrec update_service_access_policies_request = {
  domain_name : domain_name; [@ocaml.doc ""]
  access_policies : policy_document;
      [@ocaml.doc
        "The access rules you want to configure. These rules replace any existing rules. \n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [UpdateServiceAccessPolicies]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and the access rules you want \
   to configure.\n"]

type nonrec partition_instance_type =
  | Search_m1_small [@ocaml.doc ""]
  | Search_m1_large [@ocaml.doc ""]
  | Search_m2_xlarge [@ocaml.doc ""]
  | Search_m2_2xlarge [@ocaml.doc ""]
  | Search_m3_medium [@ocaml.doc ""]
  | Search_m3_large [@ocaml.doc ""]
  | Search_m3_xlarge [@ocaml.doc ""]
  | Search_m3_2xlarge [@ocaml.doc ""]
  | Search_small [@ocaml.doc ""]
  | Search_medium [@ocaml.doc ""]
  | Search_large [@ocaml.doc ""]
  | Search_xlarge [@ocaml.doc ""]
  | Search_2xlarge [@ocaml.doc ""]
  | Search_previousgeneration_small [@ocaml.doc ""]
  | Search_previousgeneration_large [@ocaml.doc ""]
  | Search_previousgeneration_xlarge [@ocaml.doc ""]
  | Search_previousgeneration_2xlarge [@ocaml.doc ""]
[@@ocaml.doc
  "The instance type (such as [search.m1.small]) on which an index partition is hosted.\n"]

type nonrec scaling_parameters = {
  desired_instance_type : partition_instance_type option;
      [@ocaml.doc
        "The instance type that you want to preconfigure for your domain. For example, \
         [search.m1.small].\n"]
  desired_replication_count : u_int_value option;
      [@ocaml.doc "The number of replicas you want to preconfigure for each index partition.\n"]
  desired_partition_count : u_int_value option;
      [@ocaml.doc
        "The number of partitions you want to preconfigure for your domain. Only valid when you \
         select [m2.2xlarge] as the desired instance type.\n"]
}
[@@ocaml.doc "The desired instance type and desired number of replicas of each index partition.\n"]

type nonrec scaling_parameters_status = {
  options : scaling_parameters; [@ocaml.doc ""]
  status : option_status; [@ocaml.doc ""]
}
[@@ocaml.doc "The status and configuration of a search domain's scaling parameters. \n"]

type nonrec update_scaling_parameters_response = {
  scaling_parameters : scaling_parameters_status; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The result of a [UpdateScalingParameters] request. Contains the status of the newly-configured \
   scaling parameters.\n"]

type nonrec update_scaling_parameters_request = {
  domain_name : domain_name; [@ocaml.doc ""]
  scaling_parameters : scaling_parameters; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [UpdateScalingParameters]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and the scaling parameters you \
   want to configure.\n"]

type nonrec disabled_operation_exception = {
  code : error_code option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was rejected because it attempted an operation which is not enabled.\n"]

type nonrec tls_security_policy =
  | POLICY_MIN_TLS_1_0_2019_07 [@ocaml.doc ""]
  | POLICY_MIN_TLS_1_2_2019_07 [@ocaml.doc ""]
[@@ocaml.doc "The minimum required TLS version.\n"]

type nonrec domain_endpoint_options = {
  enforce_http_s : boolean_ option; [@ocaml.doc "Whether the domain is HTTPS only enabled.\n"]
  tls_security_policy : tls_security_policy option; [@ocaml.doc "The minimum required TLS version\n"]
}
[@@ocaml.doc "The domain's endpoint options.\n"]

type nonrec domain_endpoint_options_status = {
  options : domain_endpoint_options;
      [@ocaml.doc "The domain endpoint options configured for the domain.\n"]
  status : option_status; [@ocaml.doc "The status of the configured domain endpoint options.\n"]
}
[@@ocaml.doc "The configuration and status of the domain's endpoint options.\n"]

type nonrec update_domain_endpoint_options_response = {
  domain_endpoint_options : domain_endpoint_options_status option;
      [@ocaml.doc "The newly-configured domain endpoint options.\n"]
}
[@@ocaml.doc
  "The result of a [UpdateDomainEndpointOptions] request. Contains the configuration and status of \
   the domain's endpoint options. \n"]

type nonrec update_domain_endpoint_options_request = {
  domain_name : domain_name; [@ocaml.doc "A string that represents the name of a domain.\n"]
  domain_endpoint_options : domain_endpoint_options;
      [@ocaml.doc
        "Whether to require that all requests to the domain arrive over HTTPS. We recommend \
         Policy-Min-TLS-1-2-2019-07 for TLSSecurityPolicy. For compatibility with older clients, \
         the default is Policy-Min-TLS-1-0-2019-07. \n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [UpdateDomainEndpointOptions]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and the domain endpoint options.\n"]

type nonrec multi_a_z = bool [@@ocaml.doc ""]

type nonrec availability_options_status = {
  options : multi_a_z; [@ocaml.doc "The availability options configured for the domain.\n"]
  status : option_status; [@ocaml.doc ""]
}
[@@ocaml.doc "The status and configuration of the domain's availability options.\n"]

type nonrec update_availability_options_response = {
  availability_options : availability_options_status option;
      [@ocaml.doc
        "The newly-configured availability options. Indicates whether Multi-AZ is enabled for the \
         domain. \n"]
}
[@@ocaml.doc
  "The result of a [UpdateAvailabilityOptions] request. Contains the status of the domain's \
   availability options. \n"]

type nonrec update_availability_options_request = {
  domain_name : domain_name; [@ocaml.doc ""]
  multi_a_z : boolean_;
      [@ocaml.doc
        "You expand an existing search domain to a second Availability Zone by setting the \
         Multi-AZ option to true. Similarly, you can turn off the Multi-AZ option to downgrade the \
         domain to a single Availability Zone by setting the Multi-AZ option to [false]. \n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [UpdateAvailabilityOptions]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and the Multi-AZ availability \
   option.\n"]

type nonrec api_version = string [@@ocaml.doc ""]

type nonrec domain_name_map = (domain_name * api_version) list
[@@ocaml.doc "A collection of domain names.\n"]

type nonrec list_domain_names_response = {
  domain_names : domain_name_map option;
      [@ocaml.doc "The names of the search domains owned by an account.\n"]
}
[@@ocaml.doc
  "The result of a [ListDomainNames] request. Contains a list of the domains owned by an account.\n"]

type nonrec field_name = string [@@ocaml.doc ""]

type nonrec field_name_list = field_name list [@@ocaml.doc ""]

type nonrec index_documents_response = {
  field_names : field_name_list option;
      [@ocaml.doc "The names of the fields that are currently being indexed.\n"]
}
[@@ocaml.doc
  "The result of an [IndexDocuments] request. Contains the status of the indexing operation, \
   including the fields being indexed.\n"]

type nonrec index_documents_request = { domain_name : domain_name [@ocaml.doc ""] }
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [IndexDocuments]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to re-index.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec suggester_fuzzy_matching =
  | None_ [@ocaml.doc ""]
  | Low [@ocaml.doc ""]
  | High [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec document_suggester_options = {
  source_field : field_name;
      [@ocaml.doc "The name of the index field you want to use for suggestions. \n"]
  fuzzy_matching : suggester_fuzzy_matching option;
      [@ocaml.doc
        "The level of fuzziness allowed when suggesting matches for a string: [none], [low], or \
         [high]. With none, the specified string is treated as an exact prefix. With low, \
         suggestions must differ from the specified string by no more than one character. With \
         high, suggestions can differ by up to two characters. The default is none. \n"]
  sort_expression : string_ option;
      [@ocaml.doc
        "An expression that computes a score for each suggestion to control how they are sorted. \
         The scores are rounded to the nearest integer, with a floor of 0 and a ceiling of 2^31-1. \
         A document's relevance score is not computed for suggestions, so sort expressions cannot \
         reference the [_score] value. To sort suggestions using a numeric field or existing \
         expression, simply specify the name of the field or expression. If no expression is \
         configured for the suggester, the suggestions are sorted with the closest matches listed \
         first.\n"]
}
[@@ocaml.doc "Options for a search suggester.\n"]

type nonrec standard_name = string [@@ocaml.doc ""]

type nonrec suggester = {
  suggester_name : standard_name; [@ocaml.doc ""]
  document_suggester_options : document_suggester_options; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Configuration information for a search suggester. Each suggester has a unique name and \
   specifies the text field you want to use for suggestions. The following options can be \
   configured for a suggester: [FuzzyMatching], [SortExpression]. \n"]

type nonrec suggester_status = {
  options : suggester; [@ocaml.doc ""]
  status : option_status; [@ocaml.doc ""]
}
[@@ocaml.doc "The value of a [Suggester] and its current status.\n"]

type nonrec suggester_status_list = suggester_status list [@@ocaml.doc ""]

type nonrec describe_suggesters_response = {
  suggesters : suggester_status_list;
      [@ocaml.doc "The suggesters configured for the domain specified in the request.\n"]
}
[@@ocaml.doc "The result of a [DescribeSuggesters] request.\n"]

type nonrec standard_name_list = standard_name list [@@ocaml.doc ""]

type nonrec describe_suggesters_request = {
  domain_name : domain_name; [@ocaml.doc "The name of the domain you want to describe.\n"]
  suggester_names : standard_name_list option; [@ocaml.doc "The suggesters you want to describe.\n"]
  deployed : boolean_ option;
      [@ocaml.doc
        "Whether to display the deployed configuration ([true]) or include any pending changes \
         ([false]). Defaults to [false].\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DescribeSuggester]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to describe. To restrict the response to \
   particular suggesters, specify the names of the suggesters you want to describe. To show the \
   active configuration and exclude any pending changes, set the [Deployed] option to [true].\n"]

type nonrec describe_service_access_policies_response = {
  access_policies : access_policies_status;
      [@ocaml.doc "The access rules configured for the domain specified in the request.\n"]
}
[@@ocaml.doc "The result of a [DescribeServiceAccessPolicies] request.\n"]

type nonrec describe_service_access_policies_request = {
  domain_name : domain_name; [@ocaml.doc "The name of the domain you want to describe.\n"]
  deployed : boolean_ option;
      [@ocaml.doc
        "Whether to display the deployed configuration ([true]) or include any pending changes \
         ([false]). Defaults to [false].\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DescribeServiceAccessPolicies]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to describe. To show the active \
   configuration and exclude any pending changes, set the [Deployed] option to [true].\n"]

type nonrec describe_scaling_parameters_response = {
  scaling_parameters : scaling_parameters_status; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The result of a [DescribeScalingParameters] request. Contains the scaling parameters configured \
   for the domain specified in the request.\n"]

type nonrec describe_scaling_parameters_request = { domain_name : domain_name [@ocaml.doc ""] }
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DescribeScalingParameters]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to describe. \n"]

type nonrec field_name_comma_list = string [@@ocaml.doc ""]

type nonrec field_value = string [@@ocaml.doc ""]

type nonrec date_array_options = {
  default_value : field_value option;
      [@ocaml.doc "A value to use for the field if the field isn't specified for a document."]
  source_fields : field_name_comma_list option;
      [@ocaml.doc "A list of source fields to map to the field. \n"]
  facet_enabled : boolean_ option;
      [@ocaml.doc "Whether facet information can be returned for the field.\n"]
  search_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field are searchable.\n"]
  return_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field can be returned in the search results.\n"]
}
[@@ocaml.doc
  "Options for a field that contains an array of dates. Present if [IndexFieldType] specifies the \
   field is of type [date-array]. All options are enabled by default.\n"]

type nonrec word = string [@@ocaml.doc ""]

type nonrec text_array_options = {
  default_value : field_value option;
      [@ocaml.doc "A value to use for the field if the field isn't specified for a document."]
  source_fields : field_name_comma_list option;
      [@ocaml.doc "A list of source fields to map to the field. \n"]
  return_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field can be returned in the search results.\n"]
  highlight_enabled : boolean_ option;
      [@ocaml.doc "Whether highlights can be returned for the field.\n"]
  analysis_scheme : word option;
      [@ocaml.doc "The name of an analysis scheme for a [text-array] field.\n"]
}
[@@ocaml.doc
  "Options for a field that contains an array of text strings. Present if [IndexFieldType] \
   specifies the field is of type [text-array]. A [text-array] field is always searchable. All \
   options are enabled by default.\n"]

type nonrec literal_array_options = {
  default_value : field_value option;
      [@ocaml.doc "A value to use for the field if the field isn't specified for a document."]
  source_fields : field_name_comma_list option;
      [@ocaml.doc "A list of source fields to map to the field. \n"]
  facet_enabled : boolean_ option;
      [@ocaml.doc "Whether facet information can be returned for the field.\n"]
  search_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field are searchable.\n"]
  return_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field can be returned in the search results.\n"]
}
[@@ocaml.doc
  "Options for a field that contains an array of literal strings. Present if [IndexFieldType] \
   specifies the field is of type [literal-array]. All options are enabled by default.\n"]

type nonrec double = float [@@ocaml.doc ""]

type nonrec double_array_options = {
  default_value : double option;
      [@ocaml.doc "A value to use for the field if the field isn't specified for a document."]
  source_fields : field_name_comma_list option;
      [@ocaml.doc "A list of source fields to map to the field. \n"]
  facet_enabled : boolean_ option;
      [@ocaml.doc "Whether facet information can be returned for the field.\n"]
  search_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field are searchable.\n"]
  return_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field can be returned in the search results.\n"]
}
[@@ocaml.doc
  "Options for a field that contains an array of double-precision 64-bit floating point values. \
   Present if [IndexFieldType] specifies the field is of type [double-array]. All options are \
   enabled by default.\n"]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec int_array_options = {
  default_value : long option;
      [@ocaml.doc "A value to use for the field if the field isn't specified for a document."]
  source_fields : field_name_comma_list option;
      [@ocaml.doc "A list of source fields to map to the field. \n"]
  facet_enabled : boolean_ option;
      [@ocaml.doc "Whether facet information can be returned for the field.\n"]
  search_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field are searchable.\n"]
  return_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field can be returned in the search results.\n"]
}
[@@ocaml.doc
  "Options for a field that contains an array of 64-bit signed integers. Present if \
   [IndexFieldType] specifies the field is of type [int-array]. All options are enabled by default.\n"]

type nonrec lat_lon_options = {
  default_value : field_value option;
      [@ocaml.doc "A value to use for the field if the field isn't specified for a document."]
  source_field : field_name option; [@ocaml.doc ""]
  facet_enabled : boolean_ option;
      [@ocaml.doc "Whether facet information can be returned for the field.\n"]
  search_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field are searchable.\n"]
  return_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field can be returned in the search results.\n"]
  sort_enabled : boolean_ option;
      [@ocaml.doc "Whether the field can be used to sort the search results.\n"]
}
[@@ocaml.doc
  "Options for a latlon field. A latlon field contains a location stored as a latitude and \
   longitude value pair. Present if [IndexFieldType] specifies the field is of type [latlon]. All \
   options are enabled by default.\n"]

type nonrec date_options = {
  default_value : field_value option;
      [@ocaml.doc "A value to use for the field if the field isn't specified for a document."]
  source_field : field_name option; [@ocaml.doc ""]
  facet_enabled : boolean_ option;
      [@ocaml.doc "Whether facet information can be returned for the field.\n"]
  search_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field are searchable.\n"]
  return_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field can be returned in the search results.\n"]
  sort_enabled : boolean_ option;
      [@ocaml.doc "Whether the field can be used to sort the search results.\n"]
}
[@@ocaml.doc
  "Options for a date field. Dates and times are specified in UTC (Coordinated Universal Time) \
   according to IETF RFC3339: yyyy-mm-ddT00:00:00Z. Present if [IndexFieldType] specifies the \
   field is of type [date]. All options are enabled by default.\n"]

type nonrec text_options = {
  default_value : field_value option;
      [@ocaml.doc "A value to use for the field if the field isn't specified for a document."]
  source_field : field_name option; [@ocaml.doc ""]
  return_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field can be returned in the search results.\n"]
  sort_enabled : boolean_ option;
      [@ocaml.doc "Whether the field can be used to sort the search results.\n"]
  highlight_enabled : boolean_ option;
      [@ocaml.doc "Whether highlights can be returned for the field.\n"]
  analysis_scheme : word option; [@ocaml.doc "The name of an analysis scheme for a [text] field.\n"]
}
[@@ocaml.doc
  "Options for text field. Present if [IndexFieldType] specifies the field is of type [text]. A \
   [text] field is always searchable. All options are enabled by default.\n"]

type nonrec literal_options = {
  default_value : field_value option;
      [@ocaml.doc "A value to use for the field if the field isn't specified for a document."]
  source_field : field_name option; [@ocaml.doc ""]
  facet_enabled : boolean_ option;
      [@ocaml.doc "Whether facet information can be returned for the field.\n"]
  search_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field are searchable.\n"]
  return_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field can be returned in the search results.\n"]
  sort_enabled : boolean_ option;
      [@ocaml.doc "Whether the field can be used to sort the search results.\n"]
}
[@@ocaml.doc
  "Options for literal field. Present if [IndexFieldType] specifies the field is of type \
   [literal]. All options are enabled by default.\n"]

type nonrec double_options = {
  default_value : double option;
      [@ocaml.doc
        "A value to use for the field if the field isn't specified for a document. This can be \
         important if you are using the field in an expression and that field is not present in \
         every document.\n"]
  source_field : field_name option;
      [@ocaml.doc "The name of the source field to map to the field. \n"]
  facet_enabled : boolean_ option;
      [@ocaml.doc "Whether facet information can be returned for the field.\n"]
  search_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field are searchable.\n"]
  return_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field can be returned in the search results.\n"]
  sort_enabled : boolean_ option;
      [@ocaml.doc "Whether the field can be used to sort the search results.\n"]
}
[@@ocaml.doc
  "Options for a double-precision 64-bit floating point field. Present if [IndexFieldType] \
   specifies the field is of type [double]. All options are enabled by default.\n"]

type nonrec int_options = {
  default_value : long option;
      [@ocaml.doc
        "A value to use for the field if the field isn't specified for a document. This can be \
         important if you are using the field in an expression and that field is not present in \
         every document."]
  source_field : field_name option;
      [@ocaml.doc "The name of the source field to map to the field. \n"]
  facet_enabled : boolean_ option;
      [@ocaml.doc "Whether facet information can be returned for the field.\n"]
  search_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field are searchable.\n"]
  return_enabled : boolean_ option;
      [@ocaml.doc "Whether the contents of the field can be returned in the search results.\n"]
  sort_enabled : boolean_ option;
      [@ocaml.doc "Whether the field can be used to sort the search results.\n"]
}
[@@ocaml.doc
  "Options for a 64-bit signed integer field. Present if [IndexFieldType] specifies the field is \
   of type [int]. All options are enabled by default.\n"]

type nonrec index_field_type =
  | Int [@ocaml.doc ""]
  | Double [@ocaml.doc ""]
  | Literal [@ocaml.doc ""]
  | Text [@ocaml.doc ""]
  | Date [@ocaml.doc ""]
  | Latlon [@ocaml.doc ""]
  | Int_array [@ocaml.doc ""]
  | Double_array [@ocaml.doc ""]
  | Literal_array [@ocaml.doc ""]
  | Text_array [@ocaml.doc ""]
  | Date_array [@ocaml.doc ""]
[@@ocaml.doc
  "The type of field. The valid options for a field depend on the field type. For more information \
   about the supported field types, see \
   {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html}Configuring \
   Index Fields} in the {i Amazon CloudSearch Developer Guide}.\n"]

type nonrec dynamic_field_name = string [@@ocaml.doc ""]

type nonrec index_field = {
  index_field_name : dynamic_field_name;
      [@ocaml.doc
        "A string that represents the name of an index field. CloudSearch supports regular index \
         fields as well as dynamic fields. A dynamic field's name defines a pattern that begins or \
         ends with a wildcard. Any document fields that don't map to a regular index field but do \
         match a dynamic field's pattern are configured with the dynamic field's indexing options. \
         \n\n\
        \ Regular field names begin with a letter and can contain the following characters: a-z \
         (lowercase), 0-9, and _ (underscore). Dynamic field names must begin or end with a \
         wildcard (*). The wildcard can also be the only character in a dynamic field name. \
         Multiple wildcards, and wildcards embedded within a string are not supported. \n\
        \ \n\
        \  The name [score] is reserved and cannot be used as a field name. To reference a \
         document's ID, you can use the name [_id]. \n\
        \  "]
  index_field_type : index_field_type; [@ocaml.doc ""]
  int_options : int_options option; [@ocaml.doc ""]
  double_options : double_options option; [@ocaml.doc ""]
  literal_options : literal_options option; [@ocaml.doc ""]
  text_options : text_options option; [@ocaml.doc ""]
  date_options : date_options option; [@ocaml.doc ""]
  lat_lon_options : lat_lon_options option; [@ocaml.doc ""]
  int_array_options : int_array_options option; [@ocaml.doc ""]
  double_array_options : double_array_options option; [@ocaml.doc ""]
  literal_array_options : literal_array_options option; [@ocaml.doc ""]
  text_array_options : text_array_options option; [@ocaml.doc ""]
  date_array_options : date_array_options option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Configuration information for a field in the index, including its name, type, and options. The \
   supported options depend on the \n\
   {[\n\
   [IndexFieldType]\n\
   ]}\n\
   .\n"]

type nonrec index_field_status = {
  options : index_field; [@ocaml.doc ""]
  status : option_status; [@ocaml.doc ""]
}
[@@ocaml.doc "The value of an [IndexField] and its current status.\n"]

type nonrec index_field_status_list = index_field_status list [@@ocaml.doc ""]

type nonrec describe_index_fields_response = {
  index_fields : index_field_status_list;
      [@ocaml.doc "The index fields configured for the domain.\n"]
}
[@@ocaml.doc
  "The result of a [DescribeIndexFields] request. Contains the index fields configured for the \
   domain specified in the request.\n"]

type nonrec dynamic_field_name_list = dynamic_field_name list [@@ocaml.doc ""]

type nonrec describe_index_fields_request = {
  domain_name : domain_name; [@ocaml.doc "The name of the domain you want to describe.\n"]
  field_names : dynamic_field_name_list option;
      [@ocaml.doc
        "A list of the index fields you want to describe. If not specified, information is \
         returned for all configured index fields.\n"]
  deployed : boolean_ option;
      [@ocaml.doc
        "Whether to display the deployed configuration ([true]) or include any pending changes \
         ([false]). Defaults to [false].\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DescribeIndexFields]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to describe. To restrict the response to \
   particular index fields, specify the names of the index fields you want to describe. To show \
   the active configuration and exclude any pending changes, set the [Deployed] option to [true].\n"]

type nonrec expression_value = string [@@ocaml.doc ""]

type nonrec expression = {
  expression_name : standard_name; [@ocaml.doc ""]
  expression_value : expression_value; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A named expression that can be evaluated at search time. Can be used to sort the search \
   results, define other expressions, or return computed information in the search results. \n"]

type nonrec expression_status = {
  options : expression;
      [@ocaml.doc
        "The expression that is evaluated for sorting while processing a search request.\n"]
  status : option_status; [@ocaml.doc ""]
}
[@@ocaml.doc "The value of an [Expression] and its current status.\n"]

type nonrec expression_status_list = expression_status list [@@ocaml.doc ""]

type nonrec describe_expressions_response = {
  expressions : expression_status_list; [@ocaml.doc "The expressions configured for the domain.\n"]
}
[@@ocaml.doc
  "The result of a [DescribeExpressions] request. Contains the expressions configured for the \
   domain specified in the request.\n"]

type nonrec describe_expressions_request = {
  domain_name : domain_name; [@ocaml.doc "The name of the domain you want to describe.\n"]
  expression_names : standard_name_list option;
      [@ocaml.doc
        "Limits the \n\
         {[\n\
         [DescribeExpressions]\n\
         ]}\n\
        \ response to the specified expressions. If not specified, all expressions are shown.\n"]
  deployed : boolean_ option;
      [@ocaml.doc
        "Whether to display the deployed configuration ([true]) or include any pending changes \
         ([false]). Defaults to [false].\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DescribeDomains]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to describe. To restrict the response to \
   particular expressions, specify the names of the expressions you want to describe. To show the \
   active configuration and exclude any pending changes, set the [Deployed] option to [true].\n"]

type nonrec maximum_partition_count = int [@@ocaml.doc ""]

type nonrec maximum_replication_count = int [@@ocaml.doc ""]

type nonrec limits = {
  maximum_replication_count : maximum_replication_count; [@ocaml.doc ""]
  maximum_partition_count : maximum_partition_count; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec instance_count = int [@@ocaml.doc ""]

type nonrec partition_count = int [@@ocaml.doc ""]

type nonrec search_instance_type = string [@@ocaml.doc ""]

type nonrec service_url = string [@@ocaml.doc ""]

type nonrec service_endpoint = { endpoint : service_url option [@ocaml.doc ""] }
[@@ocaml.doc "The endpoint to which service requests can be submitted.\n"]

type nonrec ar_n = string [@@ocaml.doc ""]

type nonrec domain_id = string [@@ocaml.doc ""]

type nonrec domain_status = {
  domain_id : domain_id; [@ocaml.doc ""]
  domain_name : domain_name; [@ocaml.doc ""]
  ar_n : ar_n option; [@ocaml.doc ""]
  created : boolean_ option;
      [@ocaml.doc
        "True if the search domain is created. It can take several minutes to initialize a domain \
         when [CreateDomain] is called. Newly created search domains are returned from \
         [DescribeDomains] with a false value for Created until domain creation is complete.\n"]
  deleted : boolean_ option;
      [@ocaml.doc
        "True if the search domain has been deleted. The system must clean up resources dedicated \
         to the search domain when [DeleteDomain] is called. Newly deleted search domains are \
         returned from [DescribeDomains] with a true value for IsDeleted for several minutes until \
         resource cleanup is complete.\n"]
  doc_service : service_endpoint option;
      [@ocaml.doc "The service endpoint for updating documents in a search domain.\n"]
  search_service : service_endpoint option;
      [@ocaml.doc "The service endpoint for requesting search results from a search domain.\n"]
  requires_index_documents : boolean_;
      [@ocaml.doc
        "True if [IndexDocuments] needs to be called to activate the current domain configuration.\n"]
  processing : boolean_ option;
      [@ocaml.doc
        "True if processing is being done to activate the current domain configuration.\n"]
  search_instance_type : search_instance_type option;
      [@ocaml.doc "The instance type that is being used to process search requests.\n"]
  search_partition_count : partition_count option;
      [@ocaml.doc "The number of partitions across which the search index is spread.\n"]
  search_instance_count : instance_count option;
      [@ocaml.doc "The number of search instances that are available to process search requests.\n"]
  limits : limits option; [@ocaml.doc ""]
}
[@@ocaml.doc "The current status of the search domain.\n"]

type nonrec domain_status_list = domain_status list [@@ocaml.doc ""]

type nonrec describe_domains_response = { domain_status_list : domain_status_list [@ocaml.doc ""] }
[@@ocaml.doc
  "The result of a [DescribeDomains] request. Contains the status of the domains specified in the \
   request or all domains owned by the account.\n"]

type nonrec domain_name_list = domain_name list [@@ocaml.doc ""]

type nonrec describe_domains_request = {
  domain_names : domain_name_list option;
      [@ocaml.doc "The names of the domains you want to include in the response.\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DescribeDomains]\n\
   ]}\n\
  \ operation. By default shows the status of all domains. To restrict the response to particular \
   domains, specify the names of the domains you want to describe.\n"]

type nonrec describe_domain_endpoint_options_response = {
  domain_endpoint_options : domain_endpoint_options_status option;
      [@ocaml.doc "The status and configuration of a search domain's endpoint options.\n"]
}
[@@ocaml.doc
  "The result of a [DescribeDomainEndpointOptions] request. Contains the status and configuration \
   of a search domain's endpoint options. \n"]

type nonrec describe_domain_endpoint_options_request = {
  domain_name : domain_name; [@ocaml.doc "A string that represents the name of a domain.\n"]
  deployed : boolean_ option;
      [@ocaml.doc
        "Whether to retrieve the latest configuration (which might be in a Processing state) or \
         the current, active configuration. Defaults to [false].\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DescribeDomainEndpointOptions]\n\
   ]}\n\
  \ operation. Specify the name of the domain you want to describe. To show the active \
   configuration and exclude any pending changes, set the Deployed option to [true].\n"]

type nonrec describe_availability_options_response = {
  availability_options : availability_options_status option;
      [@ocaml.doc
        "The availability options configured for the domain. Indicates whether Multi-AZ is enabled \
         for the domain. \n"]
}
[@@ocaml.doc
  "The result of a [DescribeAvailabilityOptions] request. Indicates whether or not the Multi-AZ \
   option is enabled for the domain specified in the request. \n"]

type nonrec describe_availability_options_request = {
  domain_name : domain_name; [@ocaml.doc "The name of the domain you want to describe.\n"]
  deployed : boolean_ option;
      [@ocaml.doc
        "Whether to display the deployed configuration ([true]) or include any pending changes \
         ([false]). Defaults to [false].\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DescribeAvailabilityOptions]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to describe. To show the active \
   configuration and exclude any pending changes, set the Deployed option to [true].\n"]

type nonrec algorithmic_stemming =
  | None_ [@ocaml.doc ""]
  | Minimal [@ocaml.doc ""]
  | Light [@ocaml.doc ""]
  | Full [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec analysis_options = {
  synonyms : string_ option;
      [@ocaml.doc
        "A JSON object that defines synonym groups and aliases. A synonym group is an array of \
         arrays, where each sub-array is a group of terms where each term in the group is \
         considered a synonym of every other term in the group. The aliases value is an object \
         that contains a collection of string:value pairs where the string specifies a term and \
         the array of values specifies each of the aliases for that term. An alias is considered a \
         synonym of the specified term, but the term is not considered a synonym of the alias. For \
         more information about specifying synonyms, see \
         {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html#synonyms}Synonyms} \
         in the {i Amazon CloudSearch Developer Guide}.\n"]
  stopwords : string_ option;
      [@ocaml.doc
        "A JSON array of terms to ignore during indexing and searching. For example, [\\[\"a\", \
         \"an\", \"the\", \"of\"\\]]. The stopwords dictionary must explicitly list each word you \
         want to ignore. Wildcards and regular expressions are not supported. \n"]
  stemming_dictionary : string_ option;
      [@ocaml.doc
        "A JSON object that contains a collection of string:value pairs that each map a term to \
         its stem. For example, [{\"term1\": \"stem1\", \"term2\": \"stem2\", \"term3\": \
         \"stem3\"}]. The stemming dictionary is applied in addition to any algorithmic stemming. \
         This enables you to override the results of the algorithmic stemming to correct specific \
         cases of overstemming or understemming. The maximum size of a stemming dictionary is 500 \
         KB.\n"]
  japanese_tokenization_dictionary : string_ option;
      [@ocaml.doc
        "A JSON array that contains a collection of terms, tokens, readings and part of speech for \
         Japanese Tokenizaiton. The Japanese tokenization dictionary enables you to override the \
         default tokenization for selected terms. This is only valid for Japanese language fields.\n"]
  algorithmic_stemming : algorithmic_stemming option;
      [@ocaml.doc
        "The level of algorithmic stemming to perform: [none], [minimal], [light], or [full]. The \
         available levels vary depending on the language. For more information, see \
         {{:http://docs.aws.amazon.com/cloudsearch/latest/developerguide/text-processing.html#text-processing-settings}Language \
         Specific Text Processing Settings} in the {i Amazon CloudSearch Developer Guide} \n"]
}
[@@ocaml.doc
  "Synonyms, stopwords, and stemming options for an analysis scheme. Includes tokenization \
   dictionary for Japanese.\n"]

type nonrec analysis_scheme_language =
  | Ar [@ocaml.doc ""]
  | Bg [@ocaml.doc ""]
  | Ca [@ocaml.doc ""]
  | Cs [@ocaml.doc ""]
  | Da [@ocaml.doc ""]
  | De [@ocaml.doc ""]
  | El [@ocaml.doc ""]
  | En [@ocaml.doc ""]
  | Es [@ocaml.doc ""]
  | Eu [@ocaml.doc ""]
  | Fa [@ocaml.doc ""]
  | Fi [@ocaml.doc ""]
  | Fr [@ocaml.doc ""]
  | Ga [@ocaml.doc ""]
  | Gl [@ocaml.doc ""]
  | He [@ocaml.doc ""]
  | Hi [@ocaml.doc ""]
  | Hu [@ocaml.doc ""]
  | Hy [@ocaml.doc ""]
  | Id [@ocaml.doc ""]
  | It [@ocaml.doc ""]
  | Ja [@ocaml.doc ""]
  | Ko [@ocaml.doc ""]
  | Lv [@ocaml.doc ""]
  | Mul [@ocaml.doc ""]
  | Nl [@ocaml.doc ""]
  | No [@ocaml.doc ""]
  | Pt [@ocaml.doc ""]
  | Ro [@ocaml.doc ""]
  | Ru [@ocaml.doc ""]
  | Sv [@ocaml.doc ""]
  | Th [@ocaml.doc ""]
  | Tr [@ocaml.doc ""]
  | Zh_Hans [@ocaml.doc ""]
  | Zh_Hant [@ocaml.doc ""]
[@@ocaml.doc
  "An {{:http://tools.ietf.org/html/rfc4646}IETF RFC 4646} language code or [mul] for multiple \
   languages.\n"]

type nonrec analysis_scheme = {
  analysis_scheme_name : standard_name; [@ocaml.doc ""]
  analysis_scheme_language : analysis_scheme_language; [@ocaml.doc ""]
  analysis_options : analysis_options option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Configuration information for an analysis scheme. Each analysis scheme has a unique name and \
   specifies the language of the text to be processed. The following options can be configured for \
   an analysis scheme: [Synonyms], [Stopwords], [StemmingDictionary], \
   [JapaneseTokenizationDictionary] and [AlgorithmicStemming].\n"]

type nonrec analysis_scheme_status = {
  options : analysis_scheme; [@ocaml.doc ""]
  status : option_status; [@ocaml.doc ""]
}
[@@ocaml.doc "The status and configuration of an [AnalysisScheme].\n"]

type nonrec analysis_scheme_status_list = analysis_scheme_status list [@@ocaml.doc ""]

type nonrec describe_analysis_schemes_response = {
  analysis_schemes : analysis_scheme_status_list; [@ocaml.doc "The analysis scheme descriptions.\n"]
}
[@@ocaml.doc
  "The result of a [DescribeAnalysisSchemes] request. Contains the analysis schemes configured for \
   the domain specified in the request.\n"]

type nonrec describe_analysis_schemes_request = {
  domain_name : domain_name; [@ocaml.doc "The name of the domain you want to describe.\n"]
  analysis_scheme_names : standard_name_list option;
      [@ocaml.doc "The analysis schemes you want to describe.\n"]
  deployed : boolean_ option;
      [@ocaml.doc
        "Whether to display the deployed configuration ([true]) or include any pending changes \
         ([false]). Defaults to [false].\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DescribeAnalysisSchemes]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to describe. To limit the response to \
   particular analysis schemes, specify the names of the analysis schemes you want to describe. To \
   show the active configuration and exclude any pending changes, set the [Deployed] option to \
   [true]. \n"]

type nonrec delete_suggester_response = {
  suggester : suggester_status; [@ocaml.doc "The status of the suggester being deleted.\n"]
}
[@@ocaml.doc
  "The result of a [DeleteSuggester] request. Contains the status of the deleted suggester.\n"]

type nonrec delete_suggester_request = {
  domain_name : domain_name; [@ocaml.doc ""]
  suggester_name : standard_name;
      [@ocaml.doc "Specifies the name of the suggester you want to delete.\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DeleteSuggester]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and name of the suggester you \
   want to delete.\n"]

type nonrec delete_index_field_response = {
  index_field : index_field_status; [@ocaml.doc "The status of the index field being deleted.\n"]
}
[@@ocaml.doc "The result of a \n{[\n[DeleteIndexField]\n]}\n request.\n"]

type nonrec delete_index_field_request = {
  domain_name : domain_name; [@ocaml.doc ""]
  index_field_name : dynamic_field_name;
      [@ocaml.doc
        "The name of the index field your want to remove from the domain's indexing options.\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DeleteIndexField]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and the name of the index field \
   you want to delete.\n"]

type nonrec delete_expression_response = {
  expression : expression_status; [@ocaml.doc "The status of the expression being deleted.\n"]
}
[@@ocaml.doc
  "The result of a \n\
   {[\n\
   [DeleteExpression]\n\
   ]}\n\
  \ request. Specifies the expression being deleted.\n"]

type nonrec delete_expression_request = {
  domain_name : domain_name; [@ocaml.doc ""]
  expression_name : standard_name;
      [@ocaml.doc "The name of the \n{[\n[Expression]\n]}\n to delete.\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DeleteExpression]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and the name of the expression \
   you want to delete.\n"]

type nonrec delete_domain_response = { domain_status : domain_status option [@ocaml.doc ""] }
[@@ocaml.doc
  "The result of a [DeleteDomain] request. Contains the status of a newly deleted domain, or no \
   status if the domain has already been completely deleted.\n"]

type nonrec delete_domain_request = {
  domain_name : domain_name; [@ocaml.doc "The name of the domain you want to permanently delete.\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DeleteDomain]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to delete.\n"]

type nonrec delete_analysis_scheme_response = {
  analysis_scheme : analysis_scheme_status;
      [@ocaml.doc "The status of the analysis scheme being deleted.\n"]
}
[@@ocaml.doc
  "The result of a [DeleteAnalysisScheme] request. Contains the status of the deleted analysis \
   scheme.\n"]

type nonrec delete_analysis_scheme_request = {
  domain_name : domain_name; [@ocaml.doc ""]
  analysis_scheme_name : standard_name;
      [@ocaml.doc "The name of the analysis scheme you want to delete.\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DeleteAnalysisScheme]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and the analysis scheme you \
   want to delete. \n"]

type nonrec define_suggester_response = { suggester : suggester_status [@ocaml.doc ""] }
[@@ocaml.doc
  "The result of a [DefineSuggester] request. Contains the status of the newly-configured suggester.\n"]

type nonrec define_suggester_request = {
  domain_name : domain_name; [@ocaml.doc ""]
  suggester : suggester; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DefineSuggester]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and the suggester configuration.\n"]

type nonrec define_index_field_response = { index_field : index_field_status [@ocaml.doc ""] }
[@@ocaml.doc
  "The result of a \n\
   {[\n\
   [DefineIndexField]\n\
   ]}\n\
  \ request. Contains the status of the newly-configured index field.\n"]

type nonrec define_index_field_request = {
  domain_name : domain_name; [@ocaml.doc ""]
  index_field : index_field;
      [@ocaml.doc "The index field and field options you want to configure. \n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DefineIndexField]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and the index field \
   configuration.\n"]

type nonrec define_expression_response = { expression : expression_status [@ocaml.doc ""] }
[@@ocaml.doc
  "The result of a [DefineExpression] request. Contains the status of the newly-configured \
   expression.\n"]

type nonrec define_expression_request = {
  domain_name : domain_name; [@ocaml.doc ""]
  expression : expression; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DefineExpression]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and the expression you want to \
   configure.\n"]

type nonrec define_analysis_scheme_response = {
  analysis_scheme : analysis_scheme_status; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The result of a \n\
   {[\n\
   [DefineAnalysisScheme]\n\
   ]}\n\
  \ request. Contains the status of the newly-configured analysis scheme.\n"]

type nonrec define_analysis_scheme_request = {
  domain_name : domain_name; [@ocaml.doc ""]
  analysis_scheme : analysis_scheme; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [DefineAnalysisScheme]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update and the analysis scheme \
   configuration.\n"]

type nonrec resource_already_exists_exception = {
  code : error_code option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because it attempted to create a resource that already exists.\n"]

type nonrec create_domain_response = { domain_status : domain_status option [@ocaml.doc ""] }
[@@ocaml.doc
  "The result of a [CreateDomainRequest]. Contains the status of a newly created domain.\n"]

type nonrec create_domain_request = {
  domain_name : domain_name;
      [@ocaml.doc
        "A name for the domain you are creating. Allowed characters are a-z (lower-case letters), \
         0-9, and hyphen (-). Domain names must start with a letter or number and be at least 3 \
         and no more than 28 characters long.\n"]
}
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [CreateDomain]\n\
   ]}\n\
  \ operation. Specifies a name for the new search domain.\n"]

type nonrec build_suggesters_response = { field_names : field_name_list option [@ocaml.doc ""] }
[@@ocaml.doc
  "The result of a [BuildSuggester] request. Contains a list of the fields used for suggestions.\n"]

type nonrec build_suggesters_request = { domain_name : domain_name [@ocaml.doc ""] }
[@@ocaml.doc
  "Container for the parameters to the \n\
   {[\n\
   [BuildSuggester]\n\
   ]}\n\
  \ operation. Specifies the name of the domain you want to update.\n"]
