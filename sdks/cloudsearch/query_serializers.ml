open Types

let error_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let error_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let validation_exception_to_query path (x : validation_exception) =
  List.concat
    [
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let resource_not_found_exception_to_query path (x : resource_not_found_exception) =
  List.concat
    [
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let limit_exceeded_exception_to_query path (x : limit_exceeded_exception) =
  List.concat
    [
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_type_exception_to_query path (x : invalid_type_exception) =
  List.concat
    [
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let internal_exception_to_query path (x : internal_exception) =
  List.concat
    [
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let base_exception_to_query path (x : base_exception) =
  List.concat
    [
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let boolean__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let option_state_to_query path (x : option_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | RequiresIndexDocuments -> "RequiresIndexDocuments"
    | Processing -> "Processing"
    | Active -> "Active"
    | FailedToValidate -> "FailedToValidate")

let u_int_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let update_timestamp_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let option_status_to_query path (x : option_status) =
  List.concat
    [
      update_timestamp_to_query (List.append path [ "CreationDate" ]) x.creation_date;
      update_timestamp_to_query (List.append path [ "UpdateDate" ]) x.update_date;
      (match x.update_version with
      | None -> []
      | Some v -> u_int_value_to_query (List.append path [ "UpdateVersion" ]) v);
      option_state_to_query (List.append path [ "State" ]) x.state;
      (match x.pending_deletion with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "PendingDeletion" ]) v);
    ]

let policy_document_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let access_policies_status_to_query path (x : access_policies_status) =
  List.concat
    [
      policy_document_to_query (List.append path [ "Options" ]) x.options;
      option_status_to_query (List.append path [ "Status" ]) x.status;
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
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      policy_document_to_query (List.append path [ "AccessPolicies" ]) x.access_policies;
    ]

let partition_instance_type_to_query path (x : partition_instance_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Search_m1_small -> "search.m1.small"
    | Search_m1_large -> "search.m1.large"
    | Search_m2_xlarge -> "search.m2.xlarge"
    | Search_m2_2xlarge -> "search.m2.2xlarge"
    | Search_m3_medium -> "search.m3.medium"
    | Search_m3_large -> "search.m3.large"
    | Search_m3_xlarge -> "search.m3.xlarge"
    | Search_m3_2xlarge -> "search.m3.2xlarge"
    | Search_small -> "search.small"
    | Search_medium -> "search.medium"
    | Search_large -> "search.large"
    | Search_xlarge -> "search.xlarge"
    | Search_2xlarge -> "search.2xlarge"
    | Search_previousgeneration_small -> "search.previousgeneration.small"
    | Search_previousgeneration_large -> "search.previousgeneration.large"
    | Search_previousgeneration_xlarge -> "search.previousgeneration.xlarge"
    | Search_previousgeneration_2xlarge -> "search.previousgeneration.2xlarge")

let scaling_parameters_to_query path (x : scaling_parameters) =
  List.concat
    [
      (match x.desired_instance_type with
      | None -> []
      | Some v -> partition_instance_type_to_query (List.append path [ "DesiredInstanceType" ]) v);
      (match x.desired_replication_count with
      | None -> []
      | Some v -> u_int_value_to_query (List.append path [ "DesiredReplicationCount" ]) v);
      (match x.desired_partition_count with
      | None -> []
      | Some v -> u_int_value_to_query (List.append path [ "DesiredPartitionCount" ]) v);
    ]

let scaling_parameters_status_to_query path (x : scaling_parameters_status) =
  List.concat
    [
      scaling_parameters_to_query (List.append path [ "Options" ]) x.options;
      option_status_to_query (List.append path [ "Status" ]) x.status;
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
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      scaling_parameters_to_query (List.append path [ "ScalingParameters" ]) x.scaling_parameters;
    ]

let disabled_operation_exception_to_query path (x : disabled_operation_exception) =
  List.concat
    [
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
    ]

let tls_security_policy_to_query path (x : tls_security_policy) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | POLICY_MIN_TLS_1_0_2019_07 -> "Policy-Min-TLS-1-0-2019-07"
    | POLICY_MIN_TLS_1_2_2019_07 -> "Policy-Min-TLS-1-2-2019-07")

let domain_endpoint_options_to_query path (x : domain_endpoint_options) =
  List.concat
    [
      (match x.enforce_http_s with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "EnforceHTTPS" ]) v);
      (match x.tls_security_policy with
      | None -> []
      | Some v -> tls_security_policy_to_query (List.append path [ "TLSSecurityPolicy" ]) v);
    ]

let domain_endpoint_options_status_to_query path (x : domain_endpoint_options_status) =
  List.concat
    [
      domain_endpoint_options_to_query (List.append path [ "Options" ]) x.options;
      option_status_to_query (List.append path [ "Status" ]) x.status;
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
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      domain_endpoint_options_to_query
        (List.append path [ "DomainEndpointOptions" ])
        x.domain_endpoint_options;
    ]

let multi_a_z_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let availability_options_status_to_query path (x : availability_options_status) =
  List.concat
    [
      multi_a_z_to_query (List.append path [ "Options" ]) x.options;
      option_status_to_query (List.append path [ "Status" ]) x.status;
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
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      boolean__to_query (List.append path [ "MultiAZ" ]) x.multi_a_z;
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

let field_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

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

let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let suggester_fuzzy_matching_to_query path (x : suggester_fuzzy_matching) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with None_ -> "none" | Low -> "low" | High -> "high")

let document_suggester_options_to_query path (x : document_suggester_options) =
  List.concat
    [
      field_name_to_query (List.append path [ "SourceField" ]) x.source_field;
      (match x.fuzzy_matching with
      | None -> []
      | Some v -> suggester_fuzzy_matching_to_query (List.append path [ "FuzzyMatching" ]) v);
      (match x.sort_expression with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SortExpression" ]) v);
    ]

let standard_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let suggester_to_query path (x : suggester) =
  List.concat
    [
      standard_name_to_query (List.append path [ "SuggesterName" ]) x.suggester_name;
      document_suggester_options_to_query
        (List.append path [ "DocumentSuggesterOptions" ])
        x.document_suggester_options;
    ]

let suggester_status_to_query path (x : suggester_status) =
  List.concat
    [
      suggester_to_query (List.append path [ "Options" ]) x.options;
      option_status_to_query (List.append path [ "Status" ]) x.status;
    ]

let suggester_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" suggester_status_to_query path xs

let describe_suggesters_response_to_query path (x : describe_suggesters_response) =
  List.concat [ suggester_status_list_to_query (List.append path [ "Suggesters" ]) x.suggesters ]

let standard_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" standard_name_to_query path xs

let describe_suggesters_request_to_query path (x : describe_suggesters_request) =
  List.concat
    [
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      (match x.suggester_names with
      | None -> []
      | Some v -> standard_name_list_to_query (List.append path [ "SuggesterNames" ]) v);
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
    ]

let describe_service_access_policies_response_to_query path
    (x : describe_service_access_policies_response) =
  List.concat
    [ access_policies_status_to_query (List.append path [ "AccessPolicies" ]) x.access_policies ]

let describe_service_access_policies_request_to_query path
    (x : describe_service_access_policies_request) =
  List.concat
    [
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
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

let field_name_comma_list_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let field_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let date_array_options_to_query path (x : date_array_options) =
  List.concat
    [
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.source_fields with
      | None -> []
      | Some v -> field_name_comma_list_to_query (List.append path [ "SourceFields" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
    ]

let word_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let text_array_options_to_query path (x : text_array_options) =
  List.concat
    [
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.source_fields with
      | None -> []
      | Some v -> field_name_comma_list_to_query (List.append path [ "SourceFields" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.highlight_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "HighlightEnabled" ]) v);
      (match x.analysis_scheme with
      | None -> []
      | Some v -> word_to_query (List.append path [ "AnalysisScheme" ]) v);
    ]

let literal_array_options_to_query path (x : literal_array_options) =
  List.concat
    [
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.source_fields with
      | None -> []
      | Some v -> field_name_comma_list_to_query (List.append path [ "SourceFields" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
    ]

let double_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let double_array_options_to_query path (x : double_array_options) =
  List.concat
    [
      (match x.default_value with
      | None -> []
      | Some v -> double_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.source_fields with
      | None -> []
      | Some v -> field_name_comma_list_to_query (List.append path [ "SourceFields" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
    ]

let long_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let int_array_options_to_query path (x : int_array_options) =
  List.concat
    [
      (match x.default_value with
      | None -> []
      | Some v -> long_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.source_fields with
      | None -> []
      | Some v -> field_name_comma_list_to_query (List.append path [ "SourceFields" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
    ]

let lat_lon_options_to_query path (x : lat_lon_options) =
  List.concat
    [
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
    ]

let date_options_to_query path (x : date_options) =
  List.concat
    [
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
    ]

let text_options_to_query path (x : text_options) =
  List.concat
    [
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
      (match x.highlight_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "HighlightEnabled" ]) v);
      (match x.analysis_scheme with
      | None -> []
      | Some v -> word_to_query (List.append path [ "AnalysisScheme" ]) v);
    ]

let literal_options_to_query path (x : literal_options) =
  List.concat
    [
      (match x.default_value with
      | None -> []
      | Some v -> field_value_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
    ]

let double_options_to_query path (x : double_options) =
  List.concat
    [
      (match x.default_value with
      | None -> []
      | Some v -> double_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
    ]

let int_options_to_query path (x : int_options) =
  List.concat
    [
      (match x.default_value with
      | None -> []
      | Some v -> long_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.source_field with
      | None -> []
      | Some v -> field_name_to_query (List.append path [ "SourceField" ]) v);
      (match x.facet_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "FacetEnabled" ]) v);
      (match x.search_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SearchEnabled" ]) v);
      (match x.return_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnEnabled" ]) v);
      (match x.sort_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SortEnabled" ]) v);
    ]

let index_field_type_to_query path (x : index_field_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Int -> "int"
    | Double -> "double"
    | Literal -> "literal"
    | Text -> "text"
    | Date -> "date"
    | Latlon -> "latlon"
    | Int_array -> "int-array"
    | Double_array -> "double-array"
    | Literal_array -> "literal-array"
    | Text_array -> "text-array"
    | Date_array -> "date-array")

let dynamic_field_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let index_field_to_query path (x : index_field) =
  List.concat
    [
      dynamic_field_name_to_query (List.append path [ "IndexFieldName" ]) x.index_field_name;
      index_field_type_to_query (List.append path [ "IndexFieldType" ]) x.index_field_type;
      (match x.int_options with
      | None -> []
      | Some v -> int_options_to_query (List.append path [ "IntOptions" ]) v);
      (match x.double_options with
      | None -> []
      | Some v -> double_options_to_query (List.append path [ "DoubleOptions" ]) v);
      (match x.literal_options with
      | None -> []
      | Some v -> literal_options_to_query (List.append path [ "LiteralOptions" ]) v);
      (match x.text_options with
      | None -> []
      | Some v -> text_options_to_query (List.append path [ "TextOptions" ]) v);
      (match x.date_options with
      | None -> []
      | Some v -> date_options_to_query (List.append path [ "DateOptions" ]) v);
      (match x.lat_lon_options with
      | None -> []
      | Some v -> lat_lon_options_to_query (List.append path [ "LatLonOptions" ]) v);
      (match x.int_array_options with
      | None -> []
      | Some v -> int_array_options_to_query (List.append path [ "IntArrayOptions" ]) v);
      (match x.double_array_options with
      | None -> []
      | Some v -> double_array_options_to_query (List.append path [ "DoubleArrayOptions" ]) v);
      (match x.literal_array_options with
      | None -> []
      | Some v -> literal_array_options_to_query (List.append path [ "LiteralArrayOptions" ]) v);
      (match x.text_array_options with
      | None -> []
      | Some v -> text_array_options_to_query (List.append path [ "TextArrayOptions" ]) v);
      (match x.date_array_options with
      | None -> []
      | Some v -> date_array_options_to_query (List.append path [ "DateArrayOptions" ]) v);
    ]

let index_field_status_to_query path (x : index_field_status) =
  List.concat
    [
      index_field_to_query (List.append path [ "Options" ]) x.options;
      option_status_to_query (List.append path [ "Status" ]) x.status;
    ]

let index_field_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" index_field_status_to_query path xs

let describe_index_fields_response_to_query path (x : describe_index_fields_response) =
  List.concat
    [ index_field_status_list_to_query (List.append path [ "IndexFields" ]) x.index_fields ]

let dynamic_field_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" dynamic_field_name_to_query path xs

let describe_index_fields_request_to_query path (x : describe_index_fields_request) =
  List.concat
    [
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      (match x.field_names with
      | None -> []
      | Some v -> dynamic_field_name_list_to_query (List.append path [ "FieldNames" ]) v);
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
    ]

let expression_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let expression_to_query path (x : expression) =
  List.concat
    [
      standard_name_to_query (List.append path [ "ExpressionName" ]) x.expression_name;
      expression_value_to_query (List.append path [ "ExpressionValue" ]) x.expression_value;
    ]

let expression_status_to_query path (x : expression_status) =
  List.concat
    [
      expression_to_query (List.append path [ "Options" ]) x.options;
      option_status_to_query (List.append path [ "Status" ]) x.status;
    ]

let expression_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" expression_status_to_query path xs

let describe_expressions_response_to_query path (x : describe_expressions_response) =
  List.concat [ expression_status_list_to_query (List.append path [ "Expressions" ]) x.expressions ]

let describe_expressions_request_to_query path (x : describe_expressions_request) =
  List.concat
    [
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      (match x.expression_names with
      | None -> []
      | Some v -> standard_name_list_to_query (List.append path [ "ExpressionNames" ]) v);
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
    ]

let maximum_partition_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let maximum_replication_count_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let limits_to_query path (x : limits) =
  List.concat
    [
      maximum_replication_count_to_query
        (List.append path [ "MaximumReplicationCount" ])
        x.maximum_replication_count;
      maximum_partition_count_to_query
        (List.append path [ "MaximumPartitionCount" ])
        x.maximum_partition_count;
    ]

let instance_count_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let partition_count_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let search_instance_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_url_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_endpoint_to_query path (x : service_endpoint) =
  List.concat
    [
      (match x.endpoint with
      | None -> []
      | Some v -> service_url_to_query (List.append path [ "Endpoint" ]) v);
    ]

let ar_n_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let domain_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let domain_status_to_query path (x : domain_status) =
  List.concat
    [
      domain_id_to_query (List.append path [ "DomainId" ]) x.domain_id;
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      (match x.ar_n with None -> [] | Some v -> ar_n_to_query (List.append path [ "ARN" ]) v);
      (match x.created with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Created" ]) v);
      (match x.deleted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deleted" ]) v);
      (match x.doc_service with
      | None -> []
      | Some v -> service_endpoint_to_query (List.append path [ "DocService" ]) v);
      (match x.search_service with
      | None -> []
      | Some v -> service_endpoint_to_query (List.append path [ "SearchService" ]) v);
      boolean__to_query (List.append path [ "RequiresIndexDocuments" ]) x.requires_index_documents;
      (match x.processing with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Processing" ]) v);
      (match x.search_instance_type with
      | None -> []
      | Some v -> search_instance_type_to_query (List.append path [ "SearchInstanceType" ]) v);
      (match x.search_partition_count with
      | None -> []
      | Some v -> partition_count_to_query (List.append path [ "SearchPartitionCount" ]) v);
      (match x.search_instance_count with
      | None -> []
      | Some v -> instance_count_to_query (List.append path [ "SearchInstanceCount" ]) v);
      (match x.limits with
      | None -> []
      | Some v -> limits_to_query (List.append path [ "Limits" ]) v);
    ]

let domain_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" domain_status_to_query path xs

let describe_domains_response_to_query path (x : describe_domains_response) =
  List.concat
    [ domain_status_list_to_query (List.append path [ "DomainStatusList" ]) x.domain_status_list ]

let domain_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" domain_name_to_query path xs

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
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
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
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
    ]

let algorithmic_stemming_to_query path (x : algorithmic_stemming) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with None_ -> "none" | Minimal -> "minimal" | Light -> "light" | Full -> "full")

let analysis_options_to_query path (x : analysis_options) =
  List.concat
    [
      (match x.synonyms with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Synonyms" ]) v);
      (match x.stopwords with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Stopwords" ]) v);
      (match x.stemming_dictionary with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StemmingDictionary" ]) v);
      (match x.japanese_tokenization_dictionary with
      | None -> []
      | Some v -> string__to_query (List.append path [ "JapaneseTokenizationDictionary" ]) v);
      (match x.algorithmic_stemming with
      | None -> []
      | Some v -> algorithmic_stemming_to_query (List.append path [ "AlgorithmicStemming" ]) v);
    ]

let analysis_scheme_language_to_query path (x : analysis_scheme_language) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Ar -> "ar"
    | Bg -> "bg"
    | Ca -> "ca"
    | Cs -> "cs"
    | Da -> "da"
    | De -> "de"
    | El -> "el"
    | En -> "en"
    | Es -> "es"
    | Eu -> "eu"
    | Fa -> "fa"
    | Fi -> "fi"
    | Fr -> "fr"
    | Ga -> "ga"
    | Gl -> "gl"
    | He -> "he"
    | Hi -> "hi"
    | Hu -> "hu"
    | Hy -> "hy"
    | Id -> "id"
    | It -> "it"
    | Ja -> "ja"
    | Ko -> "ko"
    | Lv -> "lv"
    | Mul -> "mul"
    | Nl -> "nl"
    | No -> "no"
    | Pt -> "pt"
    | Ro -> "ro"
    | Ru -> "ru"
    | Sv -> "sv"
    | Th -> "th"
    | Tr -> "tr"
    | Zh_Hans -> "zh-Hans"
    | Zh_Hant -> "zh-Hant")

let analysis_scheme_to_query path (x : analysis_scheme) =
  List.concat
    [
      standard_name_to_query (List.append path [ "AnalysisSchemeName" ]) x.analysis_scheme_name;
      analysis_scheme_language_to_query
        (List.append path [ "AnalysisSchemeLanguage" ])
        x.analysis_scheme_language;
      (match x.analysis_options with
      | None -> []
      | Some v -> analysis_options_to_query (List.append path [ "AnalysisOptions" ]) v);
    ]

let analysis_scheme_status_to_query path (x : analysis_scheme_status) =
  List.concat
    [
      analysis_scheme_to_query (List.append path [ "Options" ]) x.options;
      option_status_to_query (List.append path [ "Status" ]) x.status;
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
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      (match x.analysis_scheme_names with
      | None -> []
      | Some v -> standard_name_list_to_query (List.append path [ "AnalysisSchemeNames" ]) v);
      (match x.deployed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Deployed" ]) v);
    ]

let delete_suggester_response_to_query path (x : delete_suggester_response) =
  List.concat [ suggester_status_to_query (List.append path [ "Suggester" ]) x.suggester ]

let delete_suggester_request_to_query path (x : delete_suggester_request) =
  List.concat
    [
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      standard_name_to_query (List.append path [ "SuggesterName" ]) x.suggester_name;
    ]

let delete_index_field_response_to_query path (x : delete_index_field_response) =
  List.concat [ index_field_status_to_query (List.append path [ "IndexField" ]) x.index_field ]

let delete_index_field_request_to_query path (x : delete_index_field_request) =
  List.concat
    [
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      dynamic_field_name_to_query (List.append path [ "IndexFieldName" ]) x.index_field_name;
    ]

let delete_expression_response_to_query path (x : delete_expression_response) =
  List.concat [ expression_status_to_query (List.append path [ "Expression" ]) x.expression ]

let delete_expression_request_to_query path (x : delete_expression_request) =
  List.concat
    [
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      standard_name_to_query (List.append path [ "ExpressionName" ]) x.expression_name;
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
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      standard_name_to_query (List.append path [ "AnalysisSchemeName" ]) x.analysis_scheme_name;
    ]

let define_suggester_response_to_query path (x : define_suggester_response) =
  List.concat [ suggester_status_to_query (List.append path [ "Suggester" ]) x.suggester ]

let define_suggester_request_to_query path (x : define_suggester_request) =
  List.concat
    [
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      suggester_to_query (List.append path [ "Suggester" ]) x.suggester;
    ]

let define_index_field_response_to_query path (x : define_index_field_response) =
  List.concat [ index_field_status_to_query (List.append path [ "IndexField" ]) x.index_field ]

let define_index_field_request_to_query path (x : define_index_field_request) =
  List.concat
    [
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      index_field_to_query (List.append path [ "IndexField" ]) x.index_field;
    ]

let define_expression_response_to_query path (x : define_expression_response) =
  List.concat [ expression_status_to_query (List.append path [ "Expression" ]) x.expression ]

let define_expression_request_to_query path (x : define_expression_request) =
  List.concat
    [
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      expression_to_query (List.append path [ "Expression" ]) x.expression;
    ]

let define_analysis_scheme_response_to_query path (x : define_analysis_scheme_response) =
  List.concat
    [ analysis_scheme_status_to_query (List.append path [ "AnalysisScheme" ]) x.analysis_scheme ]

let define_analysis_scheme_request_to_query path (x : define_analysis_scheme_request) =
  List.concat
    [
      domain_name_to_query (List.append path [ "DomainName" ]) x.domain_name;
      analysis_scheme_to_query (List.append path [ "AnalysisScheme" ]) x.analysis_scheme;
    ]

let resource_already_exists_exception_to_query path (x : resource_already_exists_exception) =
  List.concat
    [
      (match x.code with
      | None -> []
      | Some v -> error_code_to_query (List.append path [ "Code" ]) v);
      (match x.message with
      | None -> []
      | Some v -> error_message_to_query (List.append path [ "Message" ]) v);
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
