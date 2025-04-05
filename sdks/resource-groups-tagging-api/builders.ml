open Smaws_Lib
open Types
let make_failure_info ?error_message:(error_message_ : string option) 
  ?error_code:(error_code_ : error_code option) 
  ?status_code:(status_code_ : int option)  () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     status_code = status_code_
   } : failure_info)
let make_untag_resources_output
  ?failed_resources_map:(failed_resources_map_ : failed_resources_map option)
   () =
  ({ failed_resources_map = failed_resources_map_ } : untag_resources_output)
let make_untag_resources_input ~tag_keys:(tag_keys_ : string list) 
  ~resource_arn_list:(resource_arn_list_ : string list)  () =
  ({ tag_keys = tag_keys_; resource_arn_list = resource_arn_list_ } : 
  untag_resources_input)
let make_tag_resources_output
  ?failed_resources_map:(failed_resources_map_ : failed_resources_map option)
   () =
  ({ failed_resources_map = failed_resources_map_ } : tag_resources_output)
let make_tag_resources_input ~tags:(tags_ : tag_map) 
  ~resource_arn_list:(resource_arn_list_ : string list)  () =
  ({ tags = tags_; resource_arn_list = resource_arn_list_ } : tag_resources_input)
let make_tag ~value:(value_ : string)  ~key:(key_ : string)  () =
  ({ value = value_; key = key_ } : tag)
let make_tag_filter ?values:(values_ : string list option) 
  ?key:(key_ : string option)  () =
  ({ values = values_; key = key_ } : tag_filter)
let make_summary
  ?non_compliant_resources:(non_compliant_resources_ : int option) 
  ?resource_type:(resource_type_ : string option) 
  ?region:(region_ : string option) 
  ?target_id_type:(target_id_type_ : target_id_type option) 
  ?target_id:(target_id_ : string option) 
  ?last_updated:(last_updated_ : string option)  () =
  ({
     non_compliant_resources = non_compliant_resources_;
     resource_type = resource_type_;
     region = region_;
     target_id_type = target_id_type_;
     target_id = target_id_;
     last_updated = last_updated_
   } : summary)
let make_start_report_creation_output () =
  (() : start_report_creation_output)
let make_start_report_creation_input ~s3_bucket:(s3_bucket_ : string)  () =
  ({ s3_bucket = s3_bucket_ } : start_report_creation_input)
let make_compliance_details
  ?compliance_status:(compliance_status_ : bool option) 
  ?keys_with_noncompliant_values:(keys_with_noncompliant_values_ :
                                   string list option)
   ?noncompliant_keys:(noncompliant_keys_ : string list option)  () =
  ({
     compliance_status = compliance_status_;
     keys_with_noncompliant_values = keys_with_noncompliant_values_;
     noncompliant_keys = noncompliant_keys_
   } : compliance_details)
let make_resource_tag_mapping
  ?compliance_details:(compliance_details_ : compliance_details option) 
  ?tags:(tags_ : tag list option) 
  ?resource_ar_n:(resource_ar_n_ : string option)  () =
  ({
     compliance_details = compliance_details_;
     tags = tags_;
     resource_ar_n = resource_ar_n_
   } : resource_tag_mapping)
let make_get_tag_values_output ?tag_values:(tag_values_ : string list option)
   ?pagination_token:(pagination_token_ : string option)  () =
  ({ tag_values = tag_values_; pagination_token = pagination_token_ } : 
  get_tag_values_output)
let make_get_tag_values_input
  ?pagination_token:(pagination_token_ : string option)  ~key:(key_ : string)
   () =
  ({ key = key_; pagination_token = pagination_token_ } : get_tag_values_input)
let make_get_tag_keys_output ?tag_keys:(tag_keys_ : string list option) 
  ?pagination_token:(pagination_token_ : string option)  () =
  ({ tag_keys = tag_keys_; pagination_token = pagination_token_ } : get_tag_keys_output)
let make_get_tag_keys_input
  ?pagination_token:(pagination_token_ : string option)  () =
  ({ pagination_token = pagination_token_ } : get_tag_keys_input)
let make_get_resources_output
  ?resource_tag_mapping_list:(resource_tag_mapping_list_ :
                               resource_tag_mapping list option)
   ?pagination_token:(pagination_token_ : string option)  () =
  ({
     resource_tag_mapping_list = resource_tag_mapping_list_;
     pagination_token = pagination_token_
   } : get_resources_output)
let make_get_resources_input
  ?resource_arn_list:(resource_arn_list_ : string list option) 
  ?exclude_compliant_resources:(exclude_compliant_resources_ : bool option) 
  ?include_compliance_details:(include_compliance_details_ : bool option) 
  ?resource_type_filters:(resource_type_filters_ : string list option) 
  ?tags_per_page:(tags_per_page_ : int option) 
  ?resources_per_page:(resources_per_page_ : int option) 
  ?tag_filters:(tag_filters_ : tag_filter list option) 
  ?pagination_token:(pagination_token_ : string option)  () =
  ({
     resource_arn_list = resource_arn_list_;
     exclude_compliant_resources = exclude_compliant_resources_;
     include_compliance_details = include_compliance_details_;
     resource_type_filters = resource_type_filters_;
     tags_per_page = tags_per_page_;
     resources_per_page = resources_per_page_;
     tag_filters = tag_filters_;
     pagination_token = pagination_token_
   } : get_resources_input)
let make_get_compliance_summary_output
  ?pagination_token:(pagination_token_ : string option) 
  ?summary_list:(summary_list_ : summary list option)  () =
  ({ pagination_token = pagination_token_; summary_list = summary_list_ } : 
  get_compliance_summary_output)
let make_get_compliance_summary_input
  ?pagination_token:(pagination_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?group_by:(group_by_ : group_by_attribute list option) 
  ?tag_key_filters:(tag_key_filters_ : string list option) 
  ?resource_type_filters:(resource_type_filters_ : string list option) 
  ?region_filters:(region_filters_ : string list option) 
  ?target_id_filters:(target_id_filters_ : string list option)  () =
  ({
     pagination_token = pagination_token_;
     max_results = max_results_;
     group_by = group_by_;
     tag_key_filters = tag_key_filters_;
     resource_type_filters = resource_type_filters_;
     region_filters = region_filters_;
     target_id_filters = target_id_filters_
   } : get_compliance_summary_input)
let make_describe_report_creation_output
  ?error_message:(error_message_ : string option) 
  ?start_date:(start_date_ : string option) 
  ?s3_location:(s3_location_ : string option) 
  ?status:(status_ : string option)  () =
  ({
     error_message = error_message_;
     start_date = start_date_;
     s3_location = s3_location_;
     status = status_
   } : describe_report_creation_output)
let make_describe_report_creation_input () =
  (() : describe_report_creation_input)