open Types

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~report_name:(report_name_ : report_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ report_name = report_name_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~report_name:(report_name_ : report_name) ~tags:(tags_ : tag_list) ()
    =
  ({ report_name = report_name_; tags = tags_ } : tag_resource_request)

let make_put_report_definition_response () = (() : unit)

let make_report_status ?last_delivery:(last_delivery_ : last_delivery option)
    ?last_status:(last_status_ : last_status option) () =
  ({ last_delivery = last_delivery_; last_status = last_status_ } : report_status)

let make_report_definition
    ?additional_artifacts:(additional_artifacts_ : additional_artifact_list option)
    ?refresh_closed_reports:(refresh_closed_reports_ : refresh_closed_reports option)
    ?report_versioning:(report_versioning_ : report_versioning option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?report_status:(report_status_ : report_status option) ~report_name:(report_name_ : report_name)
    ~time_unit:(time_unit_ : time_unit) ~format:(format_ : report_format)
    ~compression:(compression_ : compression_format)
    ~additional_schema_elements:(additional_schema_elements_ : schema_element_list)
    ~s3_bucket:(s3_bucket_ : s3_bucket) ~s3_prefix:(s3_prefix_ : s3_prefix)
    ~s3_region:(s3_region_ : aws_region) () =
  ({
     report_name = report_name_;
     time_unit = time_unit_;
     format = format_;
     compression = compression_;
     additional_schema_elements = additional_schema_elements_;
     s3_bucket = s3_bucket_;
     s3_prefix = s3_prefix_;
     s3_region = s3_region_;
     additional_artifacts = additional_artifacts_;
     refresh_closed_reports = refresh_closed_reports_;
     report_versioning = report_versioning_;
     billing_view_arn = billing_view_arn_;
     report_status = report_status_;
   }
    : report_definition)

let make_put_report_definition_request ?tags:(tags_ : tag_list option)
    ~report_definition:(report_definition_ : report_definition) () =
  ({ report_definition = report_definition_; tags = tags_ } : put_report_definition_request)

let make_modify_report_definition_response () = (() : unit)

let make_modify_report_definition_request ~report_name:(report_name_ : report_name)
    ~report_definition:(report_definition_ : report_definition) () =
  ({ report_name = report_name_; report_definition = report_definition_ }
    : modify_report_definition_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~report_name:(report_name_ : report_name) () =
  ({ report_name = report_name_ } : list_tags_for_resource_request)

let make_describe_report_definitions_response
    ?report_definitions:(report_definitions_ : report_definition_list option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ report_definitions = report_definitions_; next_token = next_token_ }
    : describe_report_definitions_response)

let make_describe_report_definitions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : describe_report_definitions_request)

let make_delete_report_definition_response
    ?response_message:(response_message_ : delete_response_message option) () =
  ({ response_message = response_message_ } : delete_report_definition_response)

let make_delete_report_definition_request ~report_name:(report_name_ : report_name) () =
  ({ report_name = report_name_ } : delete_report_definition_request)
