open Types

let make_access_details ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ description = description_ } : access_details)

let make_validation_exception_field ?code:(code_ : validation_exception_error_code option)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ name = name_; message = message_; code = code_ } : validation_exception_field)

let make_amend_benefit_application_output () = (() : unit)

let make_amendment ~field_path:(field_path_ : Smaws_Lib.Smithy_api.Types.string_)
    ~new_value:(new_value_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ field_path = field_path_; new_value = new_value_ } : amendment)

let make_amend_benefit_application_input ~catalog:(catalog_ : catalog_name)
    ~client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_)
    ~revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_)
    ~identifier:(identifier_ : benefit_application_identifier)
    ~amendment_reason:(amendment_reason_ : Smaws_Lib.Smithy_api.Types.string_)
    ~amendments:(amendments_ : amendment_list) () =
  ({
     catalog = catalog_;
     client_token = client_token_;
     revision = revision_;
     identifier = identifier_;
     amendment_reason = amendment_reason_;
     amendments = amendments_;
   }
    : amend_benefit_application_input)

let make_associate_benefit_application_resource_output ?id:(id_ : benefit_application_id option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ id = id_; arn = arn_; revision = revision_ } : associate_benefit_application_resource_output)

let make_associate_benefit_application_resource_input ~catalog:(catalog_ : catalog_name)
    ~benefit_application_identifier:
      (benefit_application_identifier_ : benefit_application_identifier)
    ~resource_arn:(resource_arn_ : arn) () =
  ({
     catalog = catalog_;
     benefit_application_identifier = benefit_application_identifier_;
     resource_arn = resource_arn_;
   }
    : associate_benefit_application_resource_input)

let make_associated_resource ?resource_type:(resource_type_ : resource_type option)
    ?resource_identifier:(resource_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_arn:(resource_arn_ : arn option) () =
  ({
     resource_type = resource_type_;
     resource_identifier = resource_identifier_;
     resource_arn = resource_arn_;
   }
    : associated_resource)

let make_benefit_allocation_summary ?id:(id_ : benefit_allocation_id option)
    ?catalog:(catalog_ : catalog_name option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : benefit_allocation_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : benefit_allocation_name option) ?benefit_id:(benefit_id_ : benefit_id option)
    ?benefit_application_id:(benefit_application_id_ : benefit_application_id option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?created_at:(created_at_ : timestamp option) ?expires_at:(expires_at_ : timestamp option)
    ?applicable_benefit_ids:(applicable_benefit_ids_ : benefit_ids option) () =
  ({
     id = id_;
     catalog = catalog_;
     arn = arn_;
     status = status_;
     status_reason = status_reason_;
     name = name_;
     benefit_id = benefit_id_;
     benefit_application_id = benefit_application_id_;
     fulfillment_types = fulfillment_types_;
     created_at = created_at_;
     expires_at = expires_at_;
     applicable_benefit_ids = applicable_benefit_ids_;
   }
    : benefit_allocation_summary)

let make_benefit_application_summary ?catalog:(catalog_ : catalog_name option)
    ?name:(name_ : benefit_application_name option) ?id:(id_ : benefit_application_id option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?benefit_id:(benefit_id_ : benefit_id option) ?programs:(programs_ : programs option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?status:(status_ : benefit_application_status option)
    ?stage:(stage_ : benefit_application_stage option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option)
    ?benefit_application_details:(benefit_application_details_ : attributes option)
    ?associated_resources:(associated_resources_ : arns option) () =
  ({
     catalog = catalog_;
     name = name_;
     id = id_;
     arn = arn_;
     benefit_id = benefit_id_;
     programs = programs_;
     fulfillment_types = fulfillment_types_;
     status = status_;
     stage = stage_;
     created_at = created_at_;
     updated_at = updated_at_;
     benefit_application_details = benefit_application_details_;
     associated_resources = associated_resources_;
   }
    : benefit_application_summary)

let make_benefit_summary ?id:(id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?catalog:(catalog_ : catalog_name option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?programs:(programs_ : programs option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?status:(status_ : benefit_status option) () =
  ({
     id = id_;
     catalog = catalog_;
     arn = arn_;
     name = name_;
     description = description_;
     programs = programs_;
     fulfillment_types = fulfillment_types_;
     status = status_;
   }
    : benefit_summary)

let make_cancel_benefit_application_output () = (() : unit)

let make_cancel_benefit_application_input
    ?reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_ option) ~catalog:(catalog_ : catalog_name)
    ~client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_)
    ~identifier:(identifier_ : benefit_application_identifier) () =
  ({ catalog = catalog_; client_token = client_token_; identifier = identifier_; reason = reason_ }
    : cancel_benefit_application_input)

let make_monetary_value ~amount:(amount_ : Smaws_Lib.Smithy_api.Types.string_)
    ~currency_code:(currency_code_ : currency_code) () =
  ({ amount = amount_; currency_code = currency_code_ } : monetary_value)

let make_issuance_detail ?issuance_id:(issuance_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?issuance_amount:(issuance_amount_ : monetary_value option)
    ?issued_at:(issued_at_ : timestamp option) () =
  ({ issuance_id = issuance_id_; issuance_amount = issuance_amount_; issued_at = issued_at_ }
    : issuance_detail)

let make_consumable_details ?allocated_amount:(allocated_amount_ : monetary_value option)
    ?remaining_amount:(remaining_amount_ : monetary_value option)
    ?utilized_amount:(utilized_amount_ : monetary_value option)
    ?issuance_details:(issuance_details_ : issuance_detail option) () =
  ({
     allocated_amount = allocated_amount_;
     remaining_amount = remaining_amount_;
     utilized_amount = utilized_amount_;
     issuance_details = issuance_details_;
   }
    : consumable_details)

let make_contact ?email:(email_ : contact_email option)
    ?first_name:(first_name_ : contact_first_name option)
    ?last_name:(last_name_ : contact_last_name option)
    ?business_title:(business_title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?phone:(phone_ : contact_phone option) () =
  ({
     email = email_;
     first_name = first_name_;
     last_name = last_name_;
     business_title = business_title_;
     phone = phone_;
   }
    : contact)

let make_create_benefit_application_output ?id:(id_ : benefit_application_id option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ id = id_; arn = arn_; revision = revision_ } : create_benefit_application_output)

let make_file_input
    ?business_use_case:(business_use_case_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~file_ur_i:(file_ur_i_ : file_ur_i) () =
  ({ file_ur_i = file_ur_i_; business_use_case = business_use_case_ } : file_input)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_benefit_application_input ?name:(name_ : benefit_application_name option)
    ?description:(description_ : benefit_application_description option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?benefit_application_details:
      (benefit_application_details_ : Smaws_Lib.Smithy_api.Types.document option)
    ?tags:(tags_ : tags option) ?associated_resources:(associated_resources_ : arns option)
    ?partner_contacts:(partner_contacts_ : contacts option)
    ?file_details:(file_details_ : file_input_details option) ~catalog:(catalog_ : catalog_name)
    ~client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_)
    ~benefit_identifier:(benefit_identifier_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     catalog = catalog_;
     client_token = client_token_;
     name = name_;
     description = description_;
     benefit_identifier = benefit_identifier_;
     fulfillment_types = fulfillment_types_;
     benefit_application_details = benefit_application_details_;
     tags = tags_;
     associated_resources = associated_resources_;
     partner_contacts = partner_contacts_;
     file_details = file_details_;
   }
    : create_benefit_application_input)

let make_credit_code ~aws_account_id:(aws_account_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~value:(value_ : monetary_value)
    ~aws_credit_code:(aws_credit_code_ : Smaws_Lib.Smithy_api.Types.string_)
    ~status:(status_ : benefit_allocation_status) ~issued_at:(issued_at_ : timestamp)
    ~expires_at:(expires_at_ : timestamp) () =
  ({
     aws_account_id = aws_account_id_;
     value = value_;
     aws_credit_code = aws_credit_code_;
     status = status_;
     issued_at = issued_at_;
     expires_at = expires_at_;
   }
    : credit_code)

let make_credit_details ~allocated_amount:(allocated_amount_ : monetary_value)
    ~issued_amount:(issued_amount_ : monetary_value) ~codes:(codes_ : credit_codes) () =
  ({ allocated_amount = allocated_amount_; issued_amount = issued_amount_; codes = codes_ }
    : credit_details)

let make_disassociate_benefit_application_resource_output ?id:(id_ : benefit_application_id option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ id = id_; arn = arn_; revision = revision_ }
    : disassociate_benefit_application_resource_output)

let make_disassociate_benefit_application_resource_input ~catalog:(catalog_ : catalog_name)
    ~benefit_application_identifier:
      (benefit_application_identifier_ : benefit_application_identifier)
    ~resource_arn:(resource_arn_ : arn) () =
  ({
     catalog = catalog_;
     benefit_application_identifier = benefit_application_identifier_;
     resource_arn = resource_arn_;
   }
    : disassociate_benefit_application_resource_input)

let make_disbursement_details ?disbursed_amount:(disbursed_amount_ : monetary_value option)
    ?issuance_details:(issuance_details_ : issuance_detail option) () =
  ({ disbursed_amount = disbursed_amount_; issuance_details = issuance_details_ }
    : disbursement_details)

let make_file_detail
    ?business_use_case:(business_use_case_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?file_name:(file_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?file_status:(file_status_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?file_status_reason:(file_status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?file_type:(file_type_ : file_type option)
    ?created_by:(created_by_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : timestamp option) ~file_ur_i:(file_ur_i_ : file_ur_i) () =
  ({
     file_ur_i = file_ur_i_;
     business_use_case = business_use_case_;
     file_name = file_name_;
     file_status = file_status_;
     file_status_reason = file_status_reason_;
     file_type = file_type_;
     created_by = created_by_;
     created_at = created_at_;
   }
    : file_detail)

let make_get_benefit_output ?id:(id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?catalog:(catalog_ : catalog_name option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?programs:(programs_ : programs option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?benefit_request_schema:(benefit_request_schema_ : Smaws_Lib.Smithy_api.Types.document option)
    ?status:(status_ : benefit_status option) () =
  ({
     id = id_;
     catalog = catalog_;
     arn = arn_;
     name = name_;
     description = description_;
     programs = programs_;
     fulfillment_types = fulfillment_types_;
     benefit_request_schema = benefit_request_schema_;
     status = status_;
   }
    : get_benefit_output)

let make_get_benefit_input ~catalog:(catalog_ : catalog_name)
    ~identifier:(identifier_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_benefit_input)

let make_get_benefit_allocation_output ?id:(id_ : benefit_allocation_id option)
    ?catalog:(catalog_ : catalog_name option) ?arn:(arn_ : benefit_allocation_arn option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : benefit_allocation_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?benefit_application_id:(benefit_application_id_ : benefit_application_id option)
    ?benefit_id:(benefit_id_ : benefit_id option)
    ?fulfillment_type:(fulfillment_type_ : fulfillment_type option)
    ?applicable_benefit_ids:(applicable_benefit_ids_ : benefit_identifiers option)
    ?fulfillment_detail:(fulfillment_detail_ : fulfillment_details option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?starts_at:(starts_at_ : timestamp option) ?expires_at:(expires_at_ : timestamp option) () =
  ({
     id = id_;
     catalog = catalog_;
     arn = arn_;
     name = name_;
     description = description_;
     status = status_;
     status_reason = status_reason_;
     benefit_application_id = benefit_application_id_;
     benefit_id = benefit_id_;
     fulfillment_type = fulfillment_type_;
     applicable_benefit_ids = applicable_benefit_ids_;
     fulfillment_detail = fulfillment_detail_;
     created_at = created_at_;
     updated_at = updated_at_;
     starts_at = starts_at_;
     expires_at = expires_at_;
   }
    : get_benefit_allocation_output)

let make_get_benefit_allocation_input ~catalog:(catalog_ : catalog_name)
    ~identifier:(identifier_ : benefit_allocation_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_benefit_allocation_input)

let make_get_benefit_application_output ?id:(id_ : benefit_application_id option)
    ?arn:(arn_ : arn option) ?catalog:(catalog_ : catalog_name option)
    ?benefit_id:(benefit_id_ : benefit_id option) ?name:(name_ : benefit_application_name option)
    ?description:(description_ : benefit_application_description option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?benefit_application_details:
      (benefit_application_details_ : Smaws_Lib.Smithy_api.Types.document option)
    ?programs:(programs_ : programs option) ?status:(status_ : benefit_application_status option)
    ?stage:(stage_ : benefit_application_stage option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason_code:(status_reason_code_ : status_reason_code option)
    ?status_reason_codes:(status_reason_codes_ : status_reason_codes option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?associated_resources:(associated_resources_ : arns option)
    ?partner_contacts:(partner_contacts_ : contacts option)
    ?file_details:(file_details_ : file_details option) () =
  ({
     id = id_;
     arn = arn_;
     catalog = catalog_;
     benefit_id = benefit_id_;
     name = name_;
     description = description_;
     fulfillment_types = fulfillment_types_;
     benefit_application_details = benefit_application_details_;
     programs = programs_;
     status = status_;
     stage = stage_;
     status_reason = status_reason_;
     status_reason_code = status_reason_code_;
     status_reason_codes = status_reason_codes_;
     created_at = created_at_;
     updated_at = updated_at_;
     revision = revision_;
     associated_resources = associated_resources_;
     partner_contacts = partner_contacts_;
     file_details = file_details_;
   }
    : get_benefit_application_output)

let make_get_benefit_application_input ~catalog:(catalog_ : catalog_name)
    ~identifier:(identifier_ : benefit_application_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_benefit_application_input)

let make_list_benefit_allocations_output
    ?benefit_allocation_summaries:
      (benefit_allocation_summaries_ : benefit_allocation_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ benefit_allocation_summaries = benefit_allocation_summaries_; next_token = next_token_ }
    : list_benefit_allocations_output)

let make_list_benefit_allocations_input
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?benefit_identifiers:(benefit_identifiers_ : benefit_identifiers option)
    ?benefit_application_identifiers:
      (benefit_application_identifiers_ : benefit_application_identifier_list option)
    ?status:(status_ : benefit_allocation_status_list option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~catalog:(catalog_ : catalog_name) () =
  ({
     catalog = catalog_;
     fulfillment_types = fulfillment_types_;
     benefit_identifiers = benefit_identifiers_;
     benefit_application_identifiers = benefit_application_identifiers_;
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_benefit_allocations_input)

let make_list_benefit_applications_output
    ?benefit_application_summaries:
      (benefit_application_summaries_ : benefit_application_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ benefit_application_summaries = benefit_application_summaries_; next_token = next_token_ }
    : list_benefit_applications_output)

let make_list_benefit_applications_input ?programs:(programs_ : programs option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?benefit_identifiers:(benefit_identifiers_ : benefit_identifiers option)
    ?status:(status_ : statuses option) ?stages:(stages_ : stages option)
    ?associated_resources:(associated_resources_ : associated_resources option)
    ?associated_resource_arns:(associated_resource_arns_ : arns option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~catalog:(catalog_ : catalog_name) () =
  ({
     catalog = catalog_;
     programs = programs_;
     fulfillment_types = fulfillment_types_;
     benefit_identifiers = benefit_identifiers_;
     status = status_;
     stages = stages_;
     associated_resources = associated_resources_;
     associated_resource_arns = associated_resource_arns_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_benefit_applications_input)

let make_list_benefits_output ?benefit_summaries:(benefit_summaries_ : benefit_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ benefit_summaries = benefit_summaries_; next_token = next_token_ } : list_benefits_output)

let make_list_benefits_input ?programs:(programs_ : programs option)
    ?fulfillment_types:(fulfillment_types_ : fulfillment_types option)
    ?status:(status_ : benefit_statuses option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~catalog:(catalog_ : catalog_name) () =
  ({
     catalog = catalog_;
     programs = programs_;
     fulfillment_types = fulfillment_types_;
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_benefits_input)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_update_benefit_application_output ?id:(id_ : benefit_application_id option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ id = id_; arn = arn_; revision = revision_ } : update_benefit_application_output)

let make_update_benefit_application_input ?name:(name_ : benefit_application_name option)
    ?description:(description_ : benefit_application_description option)
    ?benefit_application_details:
      (benefit_application_details_ : Smaws_Lib.Smithy_api.Types.document option)
    ?partner_contacts:(partner_contacts_ : contacts option)
    ?file_details:(file_details_ : file_input_details option) ~catalog:(catalog_ : catalog_name)
    ~client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_)
    ~identifier:(identifier_ : benefit_application_identifier)
    ~revision:(revision_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     catalog = catalog_;
     client_token = client_token_;
     name = name_;
     description = description_;
     identifier = identifier_;
     revision = revision_;
     benefit_application_details = benefit_application_details_;
     partner_contacts = partner_contacts_;
     file_details = file_details_;
   }
    : update_benefit_application_input)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~tags:(tags_ : tags) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_submit_benefit_application_output () = (() : unit)

let make_submit_benefit_application_input ~catalog:(catalog_ : catalog_name)
    ~identifier:(identifier_ : benefit_application_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : submit_benefit_application_input)

let make_recall_benefit_application_output () = (() : unit)

let make_recall_benefit_application_input
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~catalog:(catalog_ : catalog_name) ~identifier:(identifier_ : benefit_application_identifier)
    ~reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ catalog = catalog_; client_token = client_token_; identifier = identifier_; reason = reason_ }
    : recall_benefit_application_input)
