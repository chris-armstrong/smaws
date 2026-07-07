open Types

let word_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let error_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let error_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let validation_exception_to_query path (x : validation_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
    ]

let update_timestamp_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let policy_document_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let u_int_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let option_state_to_query path (x : option_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | FailedToValidate -> "FailedToValidate"
    | Active -> "Active"
    | Processing -> "Processing"
    | RequiresIndexDocuments -> "RequiresIndexDocuments")

let boolean__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let option_status_to_query path (x : option_status) =
  List.concat
    [
      (match x.pending_deletion with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "PendingDeletion" ]) v);
      option_state_to_query (List.append path [ "State" ]) x.state;
      (match x.update_version with
      | None -> []
      | Some v -> u_int_value_to_query (List.append path [ "UpdateVersion" ]) v);
      update_timestamp_to_query (List.append path [ "UpdateDate" ]) x.update_date;
      update_timestamp_to_query (List.append path [ "CreationDate" ]) x.creation_date;
    ]

let access_policies_status_to_query path (x : access_policies_status) =
  List.concat
    [
      option_status_to_query (List.append path [ "Status" ]) x.status;
      policy_document_to_query (List.append path [ "Options" ]) x.options;
    ]

let update_service_access_policies_response_to_query path
    (x : update_service_access_policies_response) =
  List.concat
    [ access_policies_status_to_query (List.append path [ "AccessPolicies" ]) x.access_policies ]

let domain_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_service_access_policies_request_to_query path
    (x : update_service_access_policies_request) =
  List.concat
    [
      policy_document_to_query (List.append path [ "AccessPolicies" ]) x.access_policies;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let resource_not_found_exception_to_query path (x : resource_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
    ]

let limit_exceeded_exception_to_query path (x : limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
    ]

let invalid_type_exception_to_query path (x : invalid_type_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
    ]

let internal_exception_to_query path (x : internal_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
    ]

let base_exception_to_query path (x : base_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
    ]

let partition_instance_type_to_query path (x : partition_instance_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Search_previousgeneration_2xlarge -> "search.previousgeneration.2xlarge"
    | Search_previousgeneration_xlarge -> "search.previousgeneration.xlarge"
    | Search_previousgeneration_large -> "search.previousgeneration.large"
    | Search_previousgeneration_small -> "search.previousgeneration.small"
    | Search_2xlarge -> "search.2xlarge"
    | Search_xlarge -> "search.xlarge"
    | Search_large -> "search.large"
    | Search_medium -> "search.medium"
    | Search_small -> "search.small"
    | Search_m3_2xlarge -> "search.m3.2xlarge"
    | Search_m3_xlarge -> "search.m3.xlarge"
    | Search_m3_large -> "search.m3.large"
    | Search_m3_medium -> "search.m3.medium"
    | Search_m2_2xlarge -> "search.m2.2xlarge"
    | Search_m2_xlarge -> "search.m2.xlarge"
    | Search_m1_large -> "search.m1.large"
    | Search_m1_small -> "search.m1.small")

let scaling_parameters_to_query path (x : scaling_parameters) =
  List.concat
    [
      (match x.desired_partition_count with
      | None -> []
      | Some v -> u_int_value_to_query (List.append path [ "DesiredPartitionCount" ]) v);
      (match x.desired_replication_count with
      | None -> []
      | Some v -> u_int_value_to_query (List.append path [ "DesiredReplicationCount" ]) v);
      (match x.desired_instance_type with
      | None -> []
      | Some v -> partition_instance_type_to_query (List.append path [ "DesiredInstanceType" ]) v);
    ]

let scaling_parameters_status_to_query path (x : scaling_parameters_status) =
  List.concat
    [
      option_status_to_query (List.append path [ "Status" ]) x.status;
      scaling_parameters_to_query (List.append path [ "Options" ]) x.options;
    ]

let update_scaling_parameters_response_to_query path (x : update_scaling_parameters_response) =
  List.concat
    [
      scaling_parameters_status_to_query
        (List.append path [ "ScalingParameters" ])
        x.scaling_parameters;
    ]

let update_scaling_parameters_request_to_query path (x : update_scaling_parameters_request) =
  List.concat
    [
      scaling_parameters_to_query (List.append path [ "ScalingParameters" ]) x.scaling_parameters;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let tls_security_policy_to_query path (x : tls_security_policy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | POLICY_MIN_TLS_1_2_2019_07 -> "Policy-Min-TLS-1-2-2019-07"
    | POLICY_MIN_TLS_1_0_2019_07 -> "Policy-Min-TLS-1-0-2019-07")

let domain_endpoint_options_to_query path (x : domain_endpoint_options) =
  List.concat
    [
      (match x.tls_security_policy with
      | None -> []
      | Some v -> tls_security_policy_to_query (List.append path [ "TLSSecurityPolicy" ]) v);
      (match x.enforce_http_s with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "EnforceHTTPS" ]) v);
    ]

let domain_endpoint_options_status_to_query path (x : domain_endpoint_options_status) =
  List.concat
    [
      option_status_to_query (List.append path [ "Status" ]) x.status;
      domain_endpoint_options_to_query (List.append path [ "Options" ]) x.options;
    ]

let update_domain_endpoint_options_response_to_query path
    (x : update_domain_endpoint_options_response) =
  List.concat
    [
      (match x.domain_endpoint_options with
      | None -> []
      | Some v ->
          domain_endpoint_options_status_to_query (List.append path [ "DomainEndpointOptions" ]) v);
    ]

let update_domain_endpoint_options_request_to_query path
    (x : update_domain_endpoint_options_request) =
  List.concat
    [
      domain_endpoint_options_to_query
        (List.append path [ "DomainEndpointOptions" ])
        x.domain_endpoint_options;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let disabled_operation_exception_to_query path (x : disabled_operation_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
    ]

let multi_a_z_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let availability_options_status_to_query path (x : availability_options_status) =
  List.concat
    [
      option_status_to_query (List.append path [ "Status" ]) x.status;
      multi_a_z_to_query (List.append path [ "Options" ]) x.options;
    ]

let update_availability_options_response_to_query path (x : update_availability_options_response) =
  List.concat
    [
      (match x.availability_options with
      | None -> []
      | Some v ->
          availability_options_status_to_query (List.append path [ "AvailabilityOptions" ]) v);
    ]

let update_availability_options_request_to_query path (x : update_availability_options_request) =
  List.concat
    [
      boolean__to_query (List.append path [ "MultiAZ" ]) x.multi_a_z;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let field_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let field_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let text_options_to_query path (x : text_options) =
  List.concat
    [
      (match x.analysis_scheme with
      | None -> []
      | Some v -> word_to_query (List.append path [ "AnalysisScheme" ]) v);
      (match x.highlight_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "HighlightEnabled" ]) v);
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
    ]

let field_name_comma_list_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let text_array_options_to_query path (x : text_array_options) =
  List.concat
    [
      (match x.analysis_scheme with
      | None -> []
      | Some v -> word_to_query (List.append path [ "AnalysisScheme" ]) v);
      (match x.highlight_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "HighlightEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.source_fields with
      | None -> []
      | Some v -> field_name_comma_list_to_query (List.append path [ "SourceFields" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
    ]

let standard_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let suggester_fuzzy_matching_to_query path (x : suggester_fuzzy_matching) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with High -> "high" | Low -> "low" | None_ -> "none")

let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let document_suggester_options_to_query path (x : document_suggester_options) =
  List.concat
    [
      (match x.sort_expression with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SortExpression" ]) v);
      (match x.fuzzy_matching with
      | None -> []
      | Some v -> suggester_fuzzy_matching_to_query (List.append path [ "FuzzyMatching" ]) v);
      field_name_to_query (List.append path [ "SourceField" ]) x.source_field;
    ]

let suggester_to_query path (x : suggester) =
  List.concat
    [
      document_suggester_options_to_query
        (List.append path [ "DocumentSuggesterOptions" ])
        x.document_suggester_options;
      standard_name_to_query (List.append path [ "SuggesterName" ]) x.suggester_name;
    ]

let suggester_status_to_query path (x : suggester_status) =
  List.concat
    [
      option_status_to_query (List.append path [ "Status" ]) x.status;
      suggester_to_query (List.append path [ "Options" ]) x.options;
    ]

let suggester_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" suggester_status_to_query path xs

let standard_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" standard_name_to_query path xs

let service_url_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_endpoint_to_query path (x : service_endpoint) =
  List.concat
    [
      (match x.endpoint with
      | None -> []
      | Some v -> service_url_to_query (List.append path [ "Endpoint" ]) v);
    ]

let search_instance_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_already_exists_exception_to_query path (x : resource_already_exists_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
    ]

let partition_count_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let maximum_replication_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let maximum_partition_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let long_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let literal_options_to_query path (x : literal_options) =
  List.concat
    [
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
    ]

let literal_array_options_to_query path (x : literal_array_options) =
  List.concat
    [
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.source_fields with
      | None -> []
      | Some v -> field_name_comma_list_to_query (List.append path [ "SourceFields" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
    ]

let api_version_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let domain_name_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" domain_name_to_query
    api_version_to_query path pairs

let list_domain_names_response_to_query path (x : list_domain_names_response) =
  List.concat
    [
      (match x.domain_names with
      | None -> []
      | Some v -> domain_name_map_to_query (List.append path [ "DomainNames" ]) v);
    ]

let limits_to_query path (x : limits) =
  List.concat
    [
      maximum_partition_count_to_query
        (List.append path [ "MaximumPartitionCount" ])
        x.maximum_partition_count;
      maximum_replication_count_to_query
        (List.append path [ "MaximumReplicationCount" ])
        x.maximum_replication_count;
    ]

let lat_lon_options_to_query path (x : lat_lon_options) =
  List.concat
    [
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
    ]

let int_options_to_query path (x : int_options) =
  List.concat
    [
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> long_to_query (List.append path [ "DefaultValue" ]) v);
    ]

let int_array_options_to_query path (x : int_array_options) =
  List.concat
    [
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.source_fields with
      | None -> []
      | Some v -> field_name_comma_list_to_query (List.append path [ "SourceFields" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> long_to_query (List.append path [ "DefaultValue" ]) v);
    ]

let instance_count_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let index_field_type_to_query path (x : index_field_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Date_array -> "date-array"
    | Text_array -> "text-array"
    | Literal_array -> "literal-array"
    | Double_array -> "double-array"
    | Int_array -> "int-array"
    | Latlon -> "latlon"
    | Date -> "date"
    | Text -> "text"
    | Literal -> "literal"
    | Double -> "double"
    | Int -> "int")

let dynamic_field_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let double_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let double_options_to_query path (x : double_options) =
  List.concat
    [
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> double_to_query (List.append path [ "DefaultValue" ]) v);
    ]

let date_options_to_query path (x : date_options) =
  List.concat
    [
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
    ]

let double_array_options_to_query path (x : double_array_options) =
  List.concat
    [
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.source_fields with
      | None -> []
      | Some v -> field_name_comma_list_to_query (List.append path [ "SourceFields" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> double_to_query (List.append path [ "DefaultValue" ]) v);
    ]

let date_array_options_to_query path (x : date_array_options) =
  List.concat
    [
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.source_fields with
      | None -> []
      | Some v -> field_name_comma_list_to_query (List.append path [ "SourceFields" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
    ]

let index_field_to_query path (x : index_field) =
  List.concat
    [
      (match x.date_array_options with
      | None -> []
      | Some v -> date_array_options_to_query (List.append path [ "DateArrayOptions" ]) v);
      (match x.text_array_options with
      | None -> []
      | Some v -> text_array_options_to_query (List.append path [ "TextArrayOptions" ]) v);
      (match x.literal_array_options with
      | None -> []
      | Some v -> literal_array_options_to_query (List.append path [ "LiteralArrayOptions" ]) v);
      (match x.double_array_options with
      | None -> []
      | Some v -> double_array_options_to_query (List.append path [ "DoubleArrayOptions" ]) v);
      (match x.int_array_options with
      | None -> []
      | Some v -> int_array_options_to_query (List.append path [ "IntArrayOptions" ]) v);
      (match x.lat_lon_options with
      | None -> []
      | Some v -> lat_lon_options_to_query (List.append path [ "LatLonOptions" ]) v);
      (match x.date_options with
      | None -> []
      | Some v -> date_options_to_query (List.append path [ "DateOptions" ]) v);
      (match x.text_options with
      | None -> []
      | Some v -> text_options_to_query (List.append path [ "TextOptions" ]) v);
      (match x.literal_options with
      | None -> []
      | Some v -> literal_options_to_query (List.append path [ "LiteralOptions" ]) v);
      (match x.double_options with
      | None -> []
      | Some v -> double_options_to_query (List.append path [ "DoubleOptions" ]) v);
      (match x.int_options with
      | None -> []
      | Some v -> int_options_to_query (List.append path [ "IntOptions" ]) v);
      index_field_type_to_query (List.append path [ "IndexFieldType" ]) x.index_field_type;
      dynamic_field_name_to_query (List.append path [ "IndexFieldName" ]) x.index_field_name;
    ]

let index_field_status_to_query path (x : index_field_status) =
  List.concat
    [
      option_status_to_query (List.append path [ "Status" ]) x.status;
      index_field_to_query (List.append path [ "Options" ]) x.options;
    ]

let index_field_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" index_field_status_to_query path xs

let field_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" field_name_to_query path xs

let index_documents_response_to_query path (x : index_documents_response) =
  List.concat
    [
      (match x.field_names with
      | None -> []
      | Some v -> field_name_list_to_query (List.append path [ "FieldNames" ]) v);
    ]

let index_documents_request_to_query path (x : index_documents_request) =
  List.concat [ domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name ]

let expression_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let expression_to_query path (x : expression) =
  List.concat
    [
      expression_value_to_query (List.append path [ "ExpressionValue" ]) x.expression_value;
      standard_name_to_query (List.append path [ "ExpressionName" ]) x.expression_name;
    ]

let expression_status_to_query path (x : expression_status) =
  List.concat
    [
      option_status_to_query (List.append path [ "Status" ]) x.status;
      expression_to_query (List.append path [ "Options" ]) x.options;
    ]

let expression_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" expression_status_to_query path xs

let dynamic_field_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" dynamic_field_name_to_query path xs

let domain_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let ar_n_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let domain_status_to_query path (x : domain_status) =
  List.concat
    [
      (match x.limits with
      | None -> []
      | Some v -> limits_to_query (List.append path [ "Limits" ]) v);
      (match x.search_instance_count with
      | None -> []
      | Some v -> instance_count_to_query (List.append path [ "SearchInstanceCount" ]) v);
      (match x.search_partition_count with
      | None -> []
      | Some v -> partition_count_to_query (List.append path [ "SearchPartitionCount" ]) v);
      (match x.search_instance_type with
      | None -> []
      | Some v -> search_instance_type_to_query (List.append path [ "SearchInstanceType" ]) v);
      (match x.processing with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Processing" ]) v);
      boolean__to_query (List.append path [ "RequiresIndexDocuments" ]) x.requires_index_documents;
      (match x.search_service with
      | None -> []
      | Some v -> service_endpoint_to_query (List.append path [ "SearchService" ]) v);
      (match x.doc_service with
      | None -> []
      | Some v -> service_endpoint_to_query (List.append path [ "DocService" ]) v);
      (match x.deleted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deleted" ]) v);
      (match x.created with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Created" ]) v);
      (match x.ar_n with None -> [] | Some v -> ar_n_to_query (List.append path [ "ARN" ]) v);
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      domain_id_to_query (List.append path [ "DomainId" ]) x.domain_id;
    ]

let domain_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" domain_status_to_query path xs

let domain_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" domain_name_to_query path xs

let describe_suggesters_response_to_query path (x : describe_suggesters_response) =
  List.concat [ suggester_status_list_to_query (List.append path [ "Suggesters" ]) x.suggesters ]

let describe_suggesters_request_to_query path (x : describe_suggesters_request) =
  List.concat
    [
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
      (match x.suggester_names with
      | None -> []
      | Some v -> standard_name_list_to_query (List.append path [ "SuggesterNames" ]) v);
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let describe_service_access_policies_response_to_query path
    (x : describe_service_access_policies_response) =
  List.concat
    [ access_policies_status_to_query (List.append path [ "AccessPolicies" ]) x.access_policies ]

let describe_service_access_policies_request_to_query path
    (x : describe_service_access_policies_request) =
  List.concat
    [
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let describe_scaling_parameters_response_to_query path (x : describe_scaling_parameters_response) =
  List.concat
    [
      scaling_parameters_status_to_query
        (List.append path [ "ScalingParameters" ])
        x.scaling_parameters;
    ]

let describe_scaling_parameters_request_to_query path (x : describe_scaling_parameters_request) =
  List.concat [ domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name ]

let describe_index_fields_response_to_query path (x : describe_index_fields_response) =
  List.concat
    [ index_field_status_list_to_query (List.append path [ "IndexFields" ]) x.index_fields ]

let describe_index_fields_request_to_query path (x : describe_index_fields_request) =
  List.concat
    [
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
      (match x.field_names with
      | None -> []
      | Some v -> dynamic_field_name_list_to_query (List.append path [ "FieldNames" ]) v);
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let describe_expressions_response_to_query path (x : describe_expressions_response) =
  List.concat [ expression_status_list_to_query (List.append path [ "Expressions" ]) x.expressions ]

let describe_expressions_request_to_query path (x : describe_expressions_request) =
  List.concat
    [
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
      (match x.expression_names with
      | None -> []
      | Some v -> standard_name_list_to_query (List.append path [ "ExpressionNames" ]) v);
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let describe_domains_response_to_query path (x : describe_domains_response) =
  List.concat
    [ domain_status_list_to_query (List.append path [ "DomainStatusList" ]) x.domain_status_list ]

let describe_domains_request_to_query path (x : describe_domains_request) =
  List.concat
    [
      (match x.domain_names with
      | None -> []
      | Some v -> domain_name_list_to_query (List.append path [ "DomainNames" ]) v);
    ]

let describe_domain_endpoint_options_response_to_query path
    (x : describe_domain_endpoint_options_response) =
  List.concat
    [
      (match x.domain_endpoint_options with
      | None -> []
      | Some v ->
          domain_endpoint_options_status_to_query (List.append path [ "DomainEndpointOptions" ]) v);
    ]

let describe_domain_endpoint_options_request_to_query path
    (x : describe_domain_endpoint_options_request) =
  List.concat
    [
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let describe_availability_options_response_to_query path
    (x : describe_availability_options_response) =
  List.concat
    [
      (match x.availability_options with
      | None -> []
      | Some v ->
          availability_options_status_to_query (List.append path [ "AvailabilityOptions" ]) v);
    ]

let describe_availability_options_request_to_query path (x : describe_availability_options_request)
    =
  List.concat
    [
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let analysis_scheme_language_to_query path (x : analysis_scheme_language) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Zh_Hant -> "zh-Hant"
    | Zh_Hans -> "zh-Hans"
    | Tr -> "tr"
    | Th -> "th"
    | Sv -> "sv"
    | Ru -> "ru"
    | Ro -> "ro"
    | Pt -> "pt"
    | No -> "no"
    | Nl -> "nl"
    | Mul -> "mul"
    | Lv -> "lv"
    | Ko -> "ko"
    | Ja -> "ja"
    | It -> "it"
    | Id -> "id"
    | Hy -> "hy"
    | Hu -> "hu"
    | Hi -> "hi"
    | He -> "he"
    | Gl -> "gl"
    | Ga -> "ga"
    | Fr -> "fr"
    | Fi -> "fi"
    | Fa -> "fa"
    | Eu -> "eu"
    | Es -> "es"
    | En -> "en"
    | El -> "el"
    | De -> "de"
    | Da -> "da"
    | Cs -> "cs"
    | Ca -> "ca"
    | Bg -> "bg"
    | Ar -> "ar")

let algorithmic_stemming_to_query path (x : algorithmic_stemming) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Full -> "full" | Light -> "light" | Minimal -> "minimal" | None_ -> "none")

let analysis_options_to_query path (x : analysis_options) =
  List.concat
    [
      (match x.algorithmic_stemming with
      | None -> []
      | Some v -> algorithmic_stemming_to_query (List.append path [ "AlgorithmicStemming" ]) v);
      (match x.japanese_tokenization_dictionary with
      | None -> []
      | Some v -> string__to_query (List.append path [ "JapaneseTokenizationDictionary" ]) v);
      (match x.stemming_dictionary with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StemmingDictionary" ]) v);
      (match x.stopwords with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Stopwords" ]) v);
      (match x.synonyms with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Synonyms" ]) v);
    ]

let analysis_scheme_to_query path (x : analysis_scheme) =
  List.concat
    [
      (match x.analysis_options with
      | None -> []
      | Some v -> analysis_options_to_query (List.append path [ "AnalysisOptions" ]) v);
      analysis_scheme_language_to_query
        (List.append path [ "AnalysisSchemeLanguage" ])
        x.analysis_scheme_language;
      standard_name_to_query (List.append path [ "AnalysisSchemeName" ]) x.analysis_scheme_name;
    ]

let analysis_scheme_status_to_query path (x : analysis_scheme_status) =
  List.concat
    [
      option_status_to_query (List.append path [ "Status" ]) x.status;
      analysis_scheme_to_query (List.append path [ "Options" ]) x.options;
    ]

let analysis_scheme_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" analysis_scheme_status_to_query path
    xs

let describe_analysis_schemes_response_to_query path (x : describe_analysis_schemes_response) =
  List.concat
    [
      analysis_scheme_status_list_to_query
        (List.append path [ "AnalysisSchemes" ])
        x.analysis_schemes;
    ]

let describe_analysis_schemes_request_to_query path (x : describe_analysis_schemes_request) =
  List.concat
    [
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
      (match x.analysis_scheme_names with
      | None -> []
      | Some v -> standard_name_list_to_query (List.append path [ "AnalysisSchemeNames" ]) v);
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let delete_suggester_response_to_query path (x : delete_suggester_response) =
  List.concat [ suggester_status_to_query (List.append path [ "Suggester" ]) x.suggester ]

let delete_suggester_request_to_query path (x : delete_suggester_request) =
  List.concat
    [
      standard_name_to_query (List.append path [ "SuggesterName" ]) x.suggester_name;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let delete_index_field_response_to_query path (x : delete_index_field_response) =
  List.concat [ index_field_status_to_query (List.append path [ "IndexField" ]) x.index_field ]

let delete_index_field_request_to_query path (x : delete_index_field_request) =
  List.concat
    [
      dynamic_field_name_to_query (List.append path [ "IndexFieldName" ]) x.index_field_name;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let delete_expression_response_to_query path (x : delete_expression_response) =
  List.concat [ expression_status_to_query (List.append path [ "Expression" ]) x.expression ]

let delete_expression_request_to_query path (x : delete_expression_request) =
  List.concat
    [
      standard_name_to_query (List.append path [ "ExpressionName" ]) x.expression_name;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let delete_domain_response_to_query path (x : delete_domain_response) =
  List.concat
    [
      (match x.domain_status with
      | None -> []
      | Some v -> domain_status_to_query (List.append path [ "DomainStatus" ]) v);
    ]

let delete_domain_request_to_query path (x : delete_domain_request) =
  List.concat [ domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name ]

let delete_analysis_scheme_response_to_query path (x : delete_analysis_scheme_response) =
  List.concat
    [ analysis_scheme_status_to_query (List.append path [ "AnalysisScheme" ]) x.analysis_scheme ]

let delete_analysis_scheme_request_to_query path (x : delete_analysis_scheme_request) =
  List.concat
    [
      standard_name_to_query (List.append path [ "AnalysisSchemeName" ]) x.analysis_scheme_name;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let define_suggester_response_to_query path (x : define_suggester_response) =
  List.concat [ suggester_status_to_query (List.append path [ "Suggester" ]) x.suggester ]

let define_suggester_request_to_query path (x : define_suggester_request) =
  List.concat
    [
      suggester_to_query (List.append path [ "Suggester" ]) x.suggester;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let define_index_field_response_to_query path (x : define_index_field_response) =
  List.concat [ index_field_status_to_query (List.append path [ "IndexField" ]) x.index_field ]

let define_index_field_request_to_query path (x : define_index_field_request) =
  List.concat
    [
      index_field_to_query (List.append path [ "IndexField" ]) x.index_field;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let define_expression_response_to_query path (x : define_expression_response) =
  List.concat [ expression_status_to_query (List.append path [ "Expression" ]) x.expression ]

let define_expression_request_to_query path (x : define_expression_request) =
  List.concat
    [
      expression_to_query (List.append path [ "Expression" ]) x.expression;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let define_analysis_scheme_response_to_query path (x : define_analysis_scheme_response) =
  List.concat
    [ analysis_scheme_status_to_query (List.append path [ "AnalysisScheme" ]) x.analysis_scheme ]

let define_analysis_scheme_request_to_query path (x : define_analysis_scheme_request) =
  List.concat
    [
      analysis_scheme_to_query (List.append path [ "AnalysisScheme" ]) x.analysis_scheme;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
    ]

let create_domain_response_to_query path (x : create_domain_response) =
  List.concat
    [
      (match x.domain_status with
      | None -> []
      | Some v -> domain_status_to_query (List.append path [ "DomainStatus" ]) v);
    ]

let create_domain_request_to_query path (x : create_domain_request) =
  List.concat [ domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name ]

let build_suggesters_response_to_query path (x : build_suggesters_response) =
  List.concat
    [
      (match x.field_names with
      | None -> []
      | Some v -> field_name_list_to_query (List.append path [ "FieldNames" ]) v);
    ]

let build_suggesters_request_to_query path (x : build_suggesters_request) =
  List.concat [ domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name ]
