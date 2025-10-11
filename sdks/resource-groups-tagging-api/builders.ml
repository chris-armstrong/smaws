open Types

let make_failure_info ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option) ?status_code:(status_code_ : status_code option)
    () =
  ({ error_message = error_message_; error_code = error_code_; status_code = status_code_ }
    : failure_info)

let make_untag_resources_output
    ?failed_resources_map:(failed_resources_map_ : failed_resources_map option) () =
  ({ failed_resources_map = failed_resources_map_ } : untag_resources_output)

let make_untag_resources_input ~tag_keys:(tag_keys_ : tag_key_list_for_untag)
    ~resource_arn_list:(resource_arn_list_ : resource_arn_list_for_tag_untag) () =
  ({ tag_keys = tag_keys_; resource_arn_list = resource_arn_list_ } : untag_resources_input)

let make_tag_resources_output
    ?failed_resources_map:(failed_resources_map_ : failed_resources_map option) () =
  ({ failed_resources_map = failed_resources_map_ } : tag_resources_output)

let make_tag_resources_input ~tags:(tags_ : tag_map)
    ~resource_arn_list:(resource_arn_list_ : resource_arn_list_for_tag_untag) () =
  ({ tags = tags_; resource_arn_list = resource_arn_list_ } : tag_resources_input)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_filter ?values:(values_ : tag_value_list option) ?key:(key_ : tag_key option) () =
  ({ values = values_; key = key_ } : tag_filter)

let make_summary
    ?non_compliant_resources:(non_compliant_resources_ : non_compliant_resources option)
    ?resource_type:(resource_type_ : amazon_resource_type option) ?region:(region_ : region option)
    ?target_id_type:(target_id_type_ : target_id_type option)
    ?target_id:(target_id_ : target_id option) ?last_updated:(last_updated_ : last_updated option)
    () =
  ({
     non_compliant_resources = non_compliant_resources_;
     resource_type = resource_type_;
     region = region_;
     target_id_type = target_id_type_;
     target_id = target_id_;
     last_updated = last_updated_;
   }
    : summary)

let make_start_report_creation_output () = (() : unit)

let make_start_report_creation_input ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({ s3_bucket = s3_bucket_ } : start_report_creation_input)

let make_compliance_details ?compliance_status:(compliance_status_ : compliance_status option)
    ?keys_with_noncompliant_values:(keys_with_noncompliant_values_ : tag_key_list option)
    ?noncompliant_keys:(noncompliant_keys_ : tag_key_list option) () =
  ({
     compliance_status = compliance_status_;
     keys_with_noncompliant_values = keys_with_noncompliant_values_;
     noncompliant_keys = noncompliant_keys_;
   }
    : compliance_details)

let make_resource_tag_mapping ?compliance_details:(compliance_details_ : compliance_details option)
    ?tags:(tags_ : tag_list option) ?resource_ar_n:(resource_ar_n_ : resource_ar_n option) () =
  ({ compliance_details = compliance_details_; tags = tags_; resource_ar_n = resource_ar_n_ }
    : resource_tag_mapping)

let make_get_tag_values_output ?tag_values:(tag_values_ : tag_values_output_list option)
    ?pagination_token:(pagination_token_ : pagination_token option) () =
  ({ tag_values = tag_values_; pagination_token = pagination_token_ } : get_tag_values_output)

let make_get_tag_values_input ?pagination_token:(pagination_token_ : pagination_token option)
    ~key:(key_ : tag_key) () =
  ({ key = key_; pagination_token = pagination_token_ } : get_tag_values_input)

let make_get_tag_keys_output ?tag_keys:(tag_keys_ : tag_key_list option)
    ?pagination_token:(pagination_token_ : pagination_token option) () =
  ({ tag_keys = tag_keys_; pagination_token = pagination_token_ } : get_tag_keys_output)

let make_get_tag_keys_input ?pagination_token:(pagination_token_ : pagination_token option) () =
  ({ pagination_token = pagination_token_ } : get_tag_keys_input)

let make_get_resources_output
    ?resource_tag_mapping_list:(resource_tag_mapping_list_ : resource_tag_mapping_list option)
    ?pagination_token:(pagination_token_ : pagination_token option) () =
  ({ resource_tag_mapping_list = resource_tag_mapping_list_; pagination_token = pagination_token_ }
    : get_resources_output)

let make_get_resources_input
    ?resource_arn_list:(resource_arn_list_ : resource_arn_list_for_get option)
    ?exclude_compliant_resources:(exclude_compliant_resources_ : exclude_compliant_resources option)
    ?include_compliance_details:(include_compliance_details_ : include_compliance_details option)
    ?resource_type_filters:(resource_type_filters_ : resource_type_filter_list option)
    ?tags_per_page:(tags_per_page_ : tags_per_page option)
    ?resources_per_page:(resources_per_page_ : resources_per_page option)
    ?tag_filters:(tag_filters_ : tag_filter_list option)
    ?pagination_token:(pagination_token_ : pagination_token option) () =
  ({
     resource_arn_list = resource_arn_list_;
     exclude_compliant_resources = exclude_compliant_resources_;
     include_compliance_details = include_compliance_details_;
     resource_type_filters = resource_type_filters_;
     tags_per_page = tags_per_page_;
     resources_per_page = resources_per_page_;
     tag_filters = tag_filters_;
     pagination_token = pagination_token_;
   }
    : get_resources_input)

let make_get_compliance_summary_output
    ?pagination_token:(pagination_token_ : pagination_token option)
    ?summary_list:(summary_list_ : summary_list option) () =
  ({ pagination_token = pagination_token_; summary_list = summary_list_ }
    : get_compliance_summary_output)

let make_get_compliance_summary_input
    ?pagination_token:(pagination_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results_get_compliance_summary option)
    ?group_by:(group_by_ : group_by option)
    ?tag_key_filters:(tag_key_filters_ : tag_key_filter_list option)
    ?resource_type_filters:(resource_type_filters_ : resource_type_filter_list option)
    ?region_filters:(region_filters_ : region_filter_list option)
    ?target_id_filters:(target_id_filters_ : target_id_filter_list option) () =
  ({
     pagination_token = pagination_token_;
     max_results = max_results_;
     group_by = group_by_;
     tag_key_filters = tag_key_filters_;
     resource_type_filters = resource_type_filters_;
     region_filters = region_filters_;
     target_id_filters = target_id_filters_;
   }
    : get_compliance_summary_input)

let make_describe_report_creation_output ?error_message:(error_message_ : error_message option)
    ?start_date:(start_date_ : start_date option) ?s3_location:(s3_location_ : s3_location option)
    ?status:(status_ : status option) () =
  ({
     error_message = error_message_;
     start_date = start_date_;
     s3_location = s3_location_;
     status = status_;
   }
    : describe_report_creation_output)

let make_describe_report_creation_input () = (() : unit)
