open Types

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~report_name:(report_name_ : report_name) () =
  ({ tag_keys = tag_keys_; report_name = report_name_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~report_name:(report_name_ : report_name) ()
    =
  ({ tags = tags_; report_name = report_name_ } : tag_resource_request)

let make_report_status ?last_status:(last_status_ : last_status option)
    ?last_delivery:(last_delivery_ : last_delivery option) () =
  ({ last_status = last_status_; last_delivery = last_delivery_ } : report_status)

let make_report_definition ?report_status:(report_status_ : report_status option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?report_versioning:(report_versioning_ : report_versioning option)
    ?refresh_closed_reports:(refresh_closed_reports_ : refresh_closed_reports option)
    ?additional_artifacts:(additional_artifacts_ : additional_artifact_list option)
    ~s3_region:(s3_region_ : aws_region) ~s3_prefix:(s3_prefix_ : s3_prefix)
    ~s3_bucket:(s3_bucket_ : s3_bucket)
    ~additional_schema_elements:(additional_schema_elements_ : schema_element_list)
    ~compression:(compression_ : compression_format) ~format:(format_ : report_format)
    ~time_unit:(time_unit_ : time_unit) ~report_name:(report_name_ : report_name) () =
  ({
     report_status = report_status_;
     billing_view_arn = billing_view_arn_;
     report_versioning = report_versioning_;
     refresh_closed_reports = refresh_closed_reports_;
     additional_artifacts = additional_artifacts_;
     s3_region = s3_region_;
     s3_prefix = s3_prefix_;
     s3_bucket = s3_bucket_;
     additional_schema_elements = additional_schema_elements_;
     compression = compression_;
     format = format_;
     time_unit = time_unit_;
     report_name = report_name_;
   }
    : report_definition)

let make_put_report_definition_response () = (() : unit)

let make_put_report_definition_request ?tags:(tags_ : tag_list option)
    ~report_definition:(report_definition_ : report_definition) () =
  ({ tags = tags_; report_definition = report_definition_ } : put_report_definition_request)

let make_modify_report_definition_response () = (() : unit)

let make_modify_report_definition_request
    ~report_definition:(report_definition_ : report_definition)
    ~report_name:(report_name_ : report_name) () =
  ({ report_definition = report_definition_; report_name = report_name_ }
    : modify_report_definition_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~report_name:(report_name_ : report_name) () =
  ({ report_name = report_name_ } : list_tags_for_resource_request)

let make_describe_report_definitions_response ?next_token:(next_token_ : generic_string option)
    ?report_definitions:(report_definitions_ : report_definition_list option) () =
  ({ next_token = next_token_; report_definitions = report_definitions_ }
    : describe_report_definitions_response)

let make_describe_report_definitions_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : describe_report_definitions_request)

let make_delete_report_definition_response
    ?response_message:(response_message_ : delete_response_message option) () =
  ({ response_message = response_message_ } : delete_report_definition_response)

let make_delete_report_definition_request ~report_name:(report_name_ : report_name) () =
  ({ report_name = report_name_ } : delete_report_definition_request)
