open Types

let make_validation_exception_field ?code:(code_ : validation_exception_error_code option)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ code = code_; message = message_; name = name_ } : validation_exception_field)

let make_update_benefit_application_output
    ?revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?id:(id_ : benefit_application_id option) () =
  ({ revision = revision_; arn = arn_; id = id_ } : update_benefit_application_output)

let make_contact ?phone:(phone_ : contact_phone option)
    ?business_title:(business_title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?last_name:(last_name_ : contact_last_name option)
    ?first_name:(first_name_ : contact_first_name option) ?email:(email_ : contact_email option) ()
    =
  ({
     phone = phone_;
     business_title = business_title_;
     last_name = last_name_;
     first_name = first_name_;
     email = email_;
   }
    : contact)

let make_file_input
    ?business_use_case:(business_use_case_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~file_ur_i:(file_ur_i_ : file_ur_i) () =
  ({ business_use_case = business_use_case_; file_ur_i = file_ur_i_ } : file_input)

let make_update_benefit_application_input ?file_details:(file_details_ : file_input_details option)
    ?partner_contacts:(partner_contacts_ : contacts option)
    ?benefit_application_details:
      (benefit_application_details_ : Smaws_Lib.Smithy_api.Types.document option)
    ?description:(description_ : benefit_application_description option)
    ?name:(name_ : benefit_application_name option)
    ~revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_)
    ~identifier:(identifier_ : benefit_application_identifier)
    ~client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_)
    ~catalog:(catalog_ : catalog_name) () =
  ({
     file_details = file_details_;
     partner_contacts = partner_contacts_;
     benefit_application_details = benefit_application_details_;
     revision = revision_;
     identifier = identifier_;
     description = description_;
     name = name_;
     client_token = client_token_;
     catalog = catalog_;
   }
    : update_benefit_application_input)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tags)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_submit_benefit_application_output () = (() : unit)

let make_submit_benefit_application_input ~identifier:(identifier_ : benefit_application_identifier)
    ~catalog:(catalog_ : catalog_name) () =
  ({ identifier = identifier_; catalog = catalog_ } : submit_benefit_application_input)

let make_recall_benefit_application_output () = (() : unit)

let make_recall_benefit_application_input
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_)
    ~identifier:(identifier_ : benefit_application_identifier) ~catalog:(catalog_ : catalog_name) ()
    =
  ({ reason = reason_; identifier = identifier_; client_token = client_token_; catalog = catalog_ }
    : recall_benefit_application_input)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_benefit_summary ?status:(status_ : benefit_status option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?programs:(programs_ : programs option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?catalog:(catalog_ : catalog_name option) ?id:(id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    () =
  ({
     status = status_;
     fulfillment_types = fulfillment_types_;
     programs = programs_;
     description = description_;
     name = name_;
     arn = arn_;
     catalog = catalog_;
     id = id_;
   }
    : benefit_summary)

let make_list_benefits_output ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?benefit_summaries:(benefit_summaries_ : benefit_summaries option) () =
  ({ next_token = next_token_; benefit_summaries = benefit_summaries_ } : list_benefits_output)

let make_list_benefits_input ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?status:(status_ : benefit_statuses option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?programs:(programs_ : programs option) ~catalog:(catalog_ : catalog_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
     fulfillment_types = fulfillment_types_;
     programs = programs_;
     catalog = catalog_;
   }
    : list_benefits_input)

let make_benefit_application_summary ?associated_resources:(associated_resources_ : arns option)
    ?benefit_application_details:(benefit_application_details_ : attributes option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?stage:(stage_ : benefit_application_stage option)
    ?status:(status_ : benefit_application_status option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?programs:(programs_ : programs option) ?benefit_id:(benefit_id_ : benefit_id option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?id:(id_ : benefit_application_id option) ?name:(name_ : benefit_application_name option)
    ?catalog:(catalog_ : catalog_name option) () =
  ({
     associated_resources = associated_resources_;
     benefit_application_details = benefit_application_details_;
     updated_at = updated_at_;
     created_at = created_at_;
     stage = stage_;
     status = status_;
     fulfillment_types = fulfillment_types_;
     programs = programs_;
     benefit_id = benefit_id_;
     arn = arn_;
     id = id_;
     name = name_;
     catalog = catalog_;
   }
    : benefit_application_summary)

let make_list_benefit_applications_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?benefit_application_summaries:
      (benefit_application_summaries_ : benefit_application_summaries option) () =
  ({ next_token = next_token_; benefit_application_summaries = benefit_application_summaries_ }
    : list_benefit_applications_output)

let make_associated_resource ?resource_arn:(resource_arn_ : arn option)
    ?resource_identifier:(resource_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_type:(resource_type_ : resource_type option) () =
  ({
     resource_arn = resource_arn_;
     resource_identifier = resource_identifier_;
     resource_type = resource_type_;
   }
    : associated_resource)

let make_list_benefit_applications_input
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?associated_resource_arns:(associated_resource_arns_ : arns option)
    ?associated_resources:(associated_resources_ : associated_resources option)
    ?stages:(stages_ : stages option) ?status:(status_ : statuses option)
    ?benefit_identifiers:(benefit_identifiers_ : benefit_identifiers option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?programs:(programs_ : programs option) ~catalog:(catalog_ : catalog_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     associated_resource_arns = associated_resource_arns_;
     associated_resources = associated_resources_;
     stages = stages_;
     status = status_;
     benefit_identifiers = benefit_identifiers_;
     fulfillment_types = fulfillment_types_;
     programs = programs_;
     catalog = catalog_;
   }
    : list_benefit_applications_input)

let make_benefit_allocation_summary
    ?applicable_benefit_ids:(applicable_benefit_ids_ : benefit_ids option)
    ?expires_at:(expires_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?benefit_application_id:(benefit_application_id_ : benefit_application_id option)
    ?benefit_id:(benefit_id_ : benefit_id option) ?name:(name_ : benefit_allocation_name option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : benefit_allocation_status option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?catalog:(catalog_ : catalog_name option) ?id:(id_ : benefit_allocation_id option) () =
  ({
     applicable_benefit_ids = applicable_benefit_ids_;
     expires_at = expires_at_;
     created_at = created_at_;
     fulfillment_types = fulfillment_types_;
     benefit_application_id = benefit_application_id_;
     benefit_id = benefit_id_;
     name = name_;
     status_reason = status_reason_;
     status = status_;
     arn = arn_;
     catalog = catalog_;
     id = id_;
   }
    : benefit_allocation_summary)

let make_list_benefit_allocations_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?benefit_allocation_summaries:
      (benefit_allocation_summaries_ : benefit_allocation_summaries option) () =
  ({ next_token = next_token_; benefit_allocation_summaries = benefit_allocation_summaries_ }
    : list_benefit_allocations_output)

let make_list_benefit_allocations_input
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?status:(status_ : benefit_allocation_status_list option)
    ?benefit_application_identifiers:
      (benefit_application_identifiers_ : benefit_application_identifier_list option)
    ?benefit_identifiers:(benefit_identifiers_ : benefit_identifiers option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ~catalog:(catalog_ : catalog_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
     benefit_application_identifiers = benefit_application_identifiers_;
     benefit_identifiers = benefit_identifiers_;
     fulfillment_types = fulfillment_types_;
     catalog = catalog_;
   }
    : list_benefit_allocations_input)

let make_file_detail ?created_at:(created_at_ : timestamp option)
    ?created_by:(created_by_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?file_type:(file_type_ : file_type option)
    ?file_status_reason:(file_status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?file_status:(file_status_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?file_name:(file_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?business_use_case:(business_use_case_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~file_ur_i:(file_ur_i_ : file_ur_i) () =
  ({
     created_at = created_at_;
     created_by = created_by_;
     file_type = file_type_;
     file_status_reason = file_status_reason_;
     file_status = file_status_;
     file_name = file_name_;
     business_use_case = business_use_case_;
     file_ur_i = file_ur_i_;
   }
    : file_detail)

let make_get_benefit_application_output ?file_details:(file_details_ : file_details option)
    ?partner_contacts:(partner_contacts_ : contacts option)
    ?associated_resources:(associated_resources_ : arns option)
    ?revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?status_reason_codes:(status_reason_codes_ : status_reason_codes option)
    ?status_reason_code:(status_reason_code_ : status_reason_code option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?stage:(stage_ : benefit_application_stage option)
    ?status:(status_ : benefit_application_status option) ?programs:(programs_ : programs option)
    ?benefit_application_details:
      (benefit_application_details_ : Smaws_Lib.Smithy_api.Types.document option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?description:(description_ : benefit_application_description option)
    ?name:(name_ : benefit_application_name option) ?benefit_id:(benefit_id_ : benefit_id option)
    ?catalog:(catalog_ : catalog_name option) ?arn:(arn_ : arn option)
    ?id:(id_ : benefit_application_id option) () =
  ({
     file_details = file_details_;
     partner_contacts = partner_contacts_;
     associated_resources = associated_resources_;
     revision = revision_;
     updated_at = updated_at_;
     created_at = created_at_;
     status_reason_codes = status_reason_codes_;
     status_reason_code = status_reason_code_;
     status_reason = status_reason_;
     stage = stage_;
     status = status_;
     programs = programs_;
     benefit_application_details = benefit_application_details_;
     fulfillment_types = fulfillment_types_;
     description = description_;
     name = name_;
     benefit_id = benefit_id_;
     catalog = catalog_;
     arn = arn_;
     id = id_;
   }
    : get_benefit_application_output)

let make_get_benefit_application_input ~identifier:(identifier_ : benefit_application_identifier)
    ~catalog:(catalog_ : catalog_name) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_benefit_application_input)

let make_monetary_value ~currency_code:(currency_code_ : currency_code)
    ~amount:(amount_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ currency_code = currency_code_; amount = amount_ } : monetary_value)

let make_issuance_detail ?issued_at:(issued_at_ : timestamp option)
    ?issuance_amount:(issuance_amount_ : monetary_value option)
    ?issuance_id:(issuance_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ issued_at = issued_at_; issuance_amount = issuance_amount_; issuance_id = issuance_id_ }
    : issuance_detail)

let make_disbursement_details ?issuance_details:(issuance_details_ : issuance_detail option)
    ?disbursed_amount:(disbursed_amount_ : monetary_value option) () =
  ({ issuance_details = issuance_details_; disbursed_amount = disbursed_amount_ }
    : disbursement_details)

let make_consumable_details ?issuance_details:(issuance_details_ : issuance_detail option)
    ?utilized_amount:(utilized_amount_ : monetary_value option)
    ?remaining_amount:(remaining_amount_ : monetary_value option)
    ?allocated_amount:(allocated_amount_ : monetary_value option) () =
  ({
     issuance_details = issuance_details_;
     utilized_amount = utilized_amount_;
     remaining_amount = remaining_amount_;
     allocated_amount = allocated_amount_;
   }
    : consumable_details)

let make_credit_code ~expires_at:(expires_at_ : timestamp) ~issued_at:(issued_at_ : timestamp)
    ~status:(status_ : benefit_allocation_status)
    ~aws_credit_code:(aws_credit_code_ : Smaws_Lib.Smithy_api.Types.string_)
    ~value:(value_ : monetary_value)
    ~aws_account_id:(aws_account_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     expires_at = expires_at_;
     issued_at = issued_at_;
     status = status_;
     aws_credit_code = aws_credit_code_;
     value = value_;
     aws_account_id = aws_account_id_;
   }
    : credit_code)

let make_credit_details ~codes:(codes_ : credit_codes)
    ~issued_amount:(issued_amount_ : monetary_value)
    ~allocated_amount:(allocated_amount_ : monetary_value) () =
  ({ codes = codes_; issued_amount = issued_amount_; allocated_amount = allocated_amount_ }
    : credit_details)

let make_access_details ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ description = description_ } : access_details)

let make_get_benefit_allocation_output ?expires_at:(expires_at_ : timestamp option)
    ?starts_at:(starts_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?fulfillment_detail:(fulfillment_detail_ : fulfillment_details option)
    ?applicable_benefit_ids:(applicable_benefit_ids_ : benefit_identifiers option)
    ?fulfillment_type:(fulfillment_type_ : fulfillment_type option)
    ?benefit_id:(benefit_id_ : benefit_id option)
    ?benefit_application_id:(benefit_application_id_ : benefit_application_id option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : benefit_allocation_status option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : benefit_allocation_arn option) ?catalog:(catalog_ : catalog_name option)
    ?id:(id_ : benefit_allocation_id option) () =
  ({
     expires_at = expires_at_;
     starts_at = starts_at_;
     updated_at = updated_at_;
     created_at = created_at_;
     fulfillment_detail = fulfillment_detail_;
     applicable_benefit_ids = applicable_benefit_ids_;
     fulfillment_type = fulfillment_type_;
     benefit_id = benefit_id_;
     benefit_application_id = benefit_application_id_;
     status_reason = status_reason_;
     status = status_;
     description = description_;
     name = name_;
     arn = arn_;
     catalog = catalog_;
     id = id_;
   }
    : get_benefit_allocation_output)

let make_get_benefit_allocation_input ~identifier:(identifier_ : benefit_allocation_identifier)
    ~catalog:(catalog_ : catalog_name) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_benefit_allocation_input)

let make_get_benefit_output ?status:(status_ : benefit_status option)
    ?benefit_request_schema:(benefit_request_schema_ : Smaws_Lib.Smithy_api.Types.document option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?programs:(programs_ : programs option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?catalog:(catalog_ : catalog_name option) ?id:(id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    () =
  ({
     status = status_;
     benefit_request_schema = benefit_request_schema_;
     fulfillment_types = fulfillment_types_;
     programs = programs_;
     description = description_;
     name = name_;
     arn = arn_;
     catalog = catalog_;
     id = id_;
   }
    : get_benefit_output)

let make_get_benefit_input ~identifier:(identifier_ : Smaws_Lib.Smithy_api.Types.string_)
    ~catalog:(catalog_ : catalog_name) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_benefit_input)

let make_disassociate_benefit_application_resource_output
    ?revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?id:(id_ : benefit_application_id option) () =
  ({ revision = revision_; arn = arn_; id = id_ }
    : disassociate_benefit_application_resource_output)

let make_disassociate_benefit_application_resource_input ~resource_arn:(resource_arn_ : arn)
    ~benefit_application_identifier:
      (benefit_application_identifier_ : benefit_application_identifier)
    ~catalog:(catalog_ : catalog_name) () =
  ({
     resource_arn = resource_arn_;
     benefit_application_identifier = benefit_application_identifier_;
     catalog = catalog_;
   }
    : disassociate_benefit_application_resource_input)

let make_create_benefit_application_output
    ?revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?id:(id_ : benefit_application_id option) () =
  ({ revision = revision_; arn = arn_; id = id_ } : create_benefit_application_output)

let make_create_benefit_application_input ?file_details:(file_details_ : file_input_details option)
    ?partner_contacts:(partner_contacts_ : contacts option)
    ?associated_resources:(associated_resources_ : arns option) ?tags:(tags_ : tags option)
    ?benefit_application_details:
      (benefit_application_details_ : Smaws_Lib.Smithy_api.Types.document option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?description:(description_ : benefit_application_description option)
    ?name:(name_ : benefit_application_name option)
    ~benefit_identifier:(benefit_identifier_ : Smaws_Lib.Smithy_api.Types.string_)
    ~client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_)
    ~catalog:(catalog_ : catalog_name) () =
  ({
     file_details = file_details_;
     partner_contacts = partner_contacts_;
     associated_resources = associated_resources_;
     tags = tags_;
     benefit_application_details = benefit_application_details_;
     fulfillment_types = fulfillment_types_;
     benefit_identifier = benefit_identifier_;
     description = description_;
     name = name_;
     client_token = client_token_;
     catalog = catalog_;
   }
    : create_benefit_application_input)

let make_cancel_benefit_application_output () = (() : unit)

let make_cancel_benefit_application_input
    ?reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~identifier:(identifier_ : benefit_application_identifier)
    ~client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_)
    ~catalog:(catalog_ : catalog_name) () =
  ({ reason = reason_; identifier = identifier_; client_token = client_token_; catalog = catalog_ }
    : cancel_benefit_application_input)

let make_associate_benefit_application_resource_output
    ?revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?id:(id_ : benefit_application_id option) () =
  ({ revision = revision_; arn = arn_; id = id_ } : associate_benefit_application_resource_output)

let make_associate_benefit_application_resource_input ~resource_arn:(resource_arn_ : arn)
    ~benefit_application_identifier:
      (benefit_application_identifier_ : benefit_application_identifier)
    ~catalog:(catalog_ : catalog_name) () =
  ({
     resource_arn = resource_arn_;
     benefit_application_identifier = benefit_application_identifier_;
     catalog = catalog_;
   }
    : associate_benefit_application_resource_input)

let make_amend_benefit_application_output () = (() : unit)

let make_amendment ~new_value:(new_value_ : Smaws_Lib.Smithy_api.Types.string_)
    ~field_path:(field_path_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ new_value = new_value_; field_path = field_path_ } : amendment)

let make_amend_benefit_application_input ~amendments:(amendments_ : amendment_list)
    ~amendment_reason:(amendment_reason_ : Smaws_Lib.Smithy_api.Types.string_)
    ~identifier:(identifier_ : benefit_application_identifier)
    ~revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_)
    ~client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_)
    ~catalog:(catalog_ : catalog_name) () =
  ({
     amendments = amendments_;
     amendment_reason = amendment_reason_;
     identifier = identifier_;
     revision = revision_;
     client_token = client_token_;
     catalog = catalog_;
   }
    : amend_benefit_application_input)
