open Types

let make_compliance_details ?noncompliant_keys:(noncompliant_keys_ : tag_key_list option)
    ?keys_with_noncompliant_values:(keys_with_noncompliant_values_ : tag_key_list option)
    ?missing_tag_keys:(missing_tag_keys_ : tag_key_list option)
    ?compliance_status:(compliance_status_ : compliance_status option) () =
  ({
     noncompliant_keys = noncompliant_keys_;
     keys_with_noncompliant_values = keys_with_noncompliant_values_;
     missing_tag_keys = missing_tag_keys_;
     compliance_status = compliance_status_;
   }
    : compliance_details)

let make_describe_report_creation_output ?status:(status_ : status option)
    ?s3_location:(s3_location_ : s3_location option) ?start_date:(start_date_ : start_date option)
    ?error_message:(error_message_ : error_message option) () =
  ({
     status = status_;
     s3_location = s3_location_;
     start_date = start_date_;
     error_message = error_message_;
   }
    : describe_report_creation_output)

let make_describe_report_creation_input () = (() : unit)

let make_failure_info ?status_code:(status_code_ : status_code option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ status_code = status_code_; error_code = error_code_; error_message = error_message_ }
    : failure_info)

let make_summary ?last_updated:(last_updated_ : last_updated option)
    ?target_id:(target_id_ : target_id option)
    ?target_id_type:(target_id_type_ : target_id_type option) ?region:(region_ : region option)
    ?resource_type:(resource_type_ : amazon_resource_type option)
    ?non_compliant_resources:(non_compliant_resources_ : non_compliant_resources option) () =
  ({
     last_updated = last_updated_;
     target_id = target_id_;
     target_id_type = target_id_type_;
     region = region_;
     resource_type = resource_type_;
     non_compliant_resources = non_compliant_resources_;
   }
    : summary)

let make_get_compliance_summary_output ?summary_list:(summary_list_ : summary_list option)
    ?pagination_token:(pagination_token_ : pagination_token option) () =
  ({ summary_list = summary_list_; pagination_token = pagination_token_ }
    : get_compliance_summary_output)

let make_get_compliance_summary_input
    ?target_id_filters:(target_id_filters_ : target_id_filter_list option)
    ?region_filters:(region_filters_ : region_filter_list option)
    ?resource_type_filters:(resource_type_filters_ : resource_type_filter_list option)
    ?tag_key_filters:(tag_key_filters_ : tag_key_filter_list option)
    ?group_by:(group_by_ : group_by option)
    ?max_results:(max_results_ : max_results_get_compliance_summary option)
    ?pagination_token:(pagination_token_ : pagination_token option) () =
  ({
     target_id_filters = target_id_filters_;
     region_filters = region_filters_;
     resource_type_filters = resource_type_filters_;
     tag_key_filters = tag_key_filters_;
     group_by = group_by_;
     max_results = max_results_;
     pagination_token = pagination_token_;
   }
    : get_compliance_summary_input)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_resource_tag_mapping ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?tags:(tags_ : tag_list option)
    ?compliance_details:(compliance_details_ : compliance_details option) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_; compliance_details = compliance_details_ }
    : resource_tag_mapping)

let make_get_resources_output ?pagination_token:(pagination_token_ : pagination_token option)
    ?resource_tag_mapping_list:(resource_tag_mapping_list_ : resource_tag_mapping_list option) () =
  ({ pagination_token = pagination_token_; resource_tag_mapping_list = resource_tag_mapping_list_ }
    : get_resources_output)

let make_tag_filter ?key:(key_ : tag_key option) ?values:(values_ : tag_value_list option) () =
  ({ key = key_; values = values_ } : tag_filter)

let make_get_resources_input ?pagination_token:(pagination_token_ : pagination_token option)
    ?tag_filters:(tag_filters_ : tag_filter_list option)
    ?resources_per_page:(resources_per_page_ : resources_per_page option)
    ?tags_per_page:(tags_per_page_ : tags_per_page option)
    ?resource_type_filters:(resource_type_filters_ : resource_type_filter_list option)
    ?include_compliance_details:(include_compliance_details_ : include_compliance_details option)
    ?exclude_compliant_resources:(exclude_compliant_resources_ : exclude_compliant_resources option)
    ?resource_arn_list:(resource_arn_list_ : resource_arn_list_for_get option) () =
  ({
     pagination_token = pagination_token_;
     tag_filters = tag_filters_;
     resources_per_page = resources_per_page_;
     tags_per_page = tags_per_page_;
     resource_type_filters = resource_type_filters_;
     include_compliance_details = include_compliance_details_;
     exclude_compliant_resources = exclude_compliant_resources_;
     resource_arn_list = resource_arn_list_;
   }
    : get_resources_input)

let make_get_tag_keys_output ?pagination_token:(pagination_token_ : pagination_token option)
    ?tag_keys:(tag_keys_ : tag_key_list option) () =
  ({ pagination_token = pagination_token_; tag_keys = tag_keys_ } : get_tag_keys_output)

let make_get_tag_keys_input ?pagination_token:(pagination_token_ : pagination_token option) () =
  ({ pagination_token = pagination_token_ } : get_tag_keys_input)

let make_get_tag_values_output ?pagination_token:(pagination_token_ : pagination_token option)
    ?tag_values:(tag_values_ : tag_values_output_list option) () =
  ({ pagination_token = pagination_token_; tag_values = tag_values_ } : get_tag_values_output)

let make_get_tag_values_input ?pagination_token:(pagination_token_ : pagination_token option)
    ~key:(key_ : tag_key) () =
  ({ pagination_token = pagination_token_; key = key_ } : get_tag_values_input)

let make_required_tag ?resource_type:(resource_type_ : resource_type option)
    ?cloud_formation_resource_types:
      (cloud_formation_resource_types_ : cloud_formation_resource_types option)
    ?reporting_tag_keys:(reporting_tag_keys_ : reporting_tag_keys option) () =
  ({
     resource_type = resource_type_;
     cloud_formation_resource_types = cloud_formation_resource_types_;
     reporting_tag_keys = reporting_tag_keys_;
   }
    : required_tag)

let make_list_required_tags_output
    ?required_tags:(required_tags_ : required_tags_for_list_required_tags option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ required_tags = required_tags_; next_token = next_token_ } : list_required_tags_output)

let make_list_required_tags_input ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results_for_list_required_tags option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_required_tags_input)

let make_untag_resources_output
    ?failed_resources_map:(failed_resources_map_ : failed_resources_map option) () =
  ({ failed_resources_map = failed_resources_map_ } : untag_resources_output)

let make_untag_resources_input
    ~resource_arn_list:(resource_arn_list_ : resource_arn_list_for_tag_untag)
    ~tag_keys:(tag_keys_ : tag_key_list_for_untag) () =
  ({ resource_arn_list = resource_arn_list_; tag_keys = tag_keys_ } : untag_resources_input)

let make_tag_resources_output
    ?failed_resources_map:(failed_resources_map_ : failed_resources_map option) () =
  ({ failed_resources_map = failed_resources_map_ } : tag_resources_output)

let make_tag_resources_input
    ~resource_arn_list:(resource_arn_list_ : resource_arn_list_for_tag_untag)
    ~tags:(tags_ : tag_map) () =
  ({ resource_arn_list = resource_arn_list_; tags = tags_ } : tag_resources_input)

let make_start_report_creation_output () = (() : unit)

let make_start_report_creation_input ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({ s3_bucket = s3_bucket_ } : start_report_creation_input)
