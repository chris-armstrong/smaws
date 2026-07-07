open Types

val make_validation_exception_field :
  ?code:validation_exception_error_code ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_update_benefit_application_output :
  ?revision:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:benefit_application_id ->
  unit ->
  update_benefit_application_output

val make_contact :
  ?phone:contact_phone ->
  ?business_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?last_name:contact_last_name ->
  ?first_name:contact_first_name ->
  ?email:contact_email ->
  unit ->
  contact

val make_file_input :
  ?business_use_case:Smaws_Lib.Smithy_api.Types.string_ -> file_ur_i:file_ur_i -> unit -> file_input

val make_update_benefit_application_input :
  ?file_details:file_input_details ->
  ?partner_contacts:contacts ->
  ?benefit_application_details:Smaws_Lib.Smithy_api.Types.document ->
  ?description:benefit_application_description ->
  ?name:benefit_application_name ->
  revision:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:benefit_application_identifier ->
  client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_name ->
  unit ->
  update_benefit_application_input

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:taggable_resource_arn -> unit -> untag_resource_request

val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tags -> resource_arn:taggable_resource_arn -> unit -> tag_resource_request

val make_submit_benefit_application_output : unit -> unit

val make_submit_benefit_application_input :
  identifier:benefit_application_identifier ->
  catalog:catalog_name ->
  unit ->
  submit_benefit_application_input

val make_recall_benefit_application_output : unit -> unit

val make_recall_benefit_application_input :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  reason:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:benefit_application_identifier ->
  catalog:catalog_name ->
  unit ->
  recall_benefit_application_input

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_request

val make_benefit_summary :
  ?status:benefit_status ->
  ?fulfillment_types:fulfillment_types ->
  ?programs:programs ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?catalog:catalog_name ->
  ?id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  benefit_summary

val make_list_benefits_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?benefit_summaries:benefit_summaries ->
  unit ->
  list_benefits_output

val make_list_benefits_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?status:benefit_statuses ->
  ?fulfillment_types:fulfillment_types ->
  ?programs:programs ->
  catalog:catalog_name ->
  unit ->
  list_benefits_input

val make_benefit_application_summary :
  ?associated_resources:arns ->
  ?benefit_application_details:attributes ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?stage:benefit_application_stage ->
  ?status:benefit_application_status ->
  ?fulfillment_types:fulfillment_types ->
  ?programs:programs ->
  ?benefit_id:benefit_id ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:benefit_application_id ->
  ?name:benefit_application_name ->
  ?catalog:catalog_name ->
  unit ->
  benefit_application_summary

val make_list_benefit_applications_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?benefit_application_summaries:benefit_application_summaries ->
  unit ->
  list_benefit_applications_output

val make_associated_resource :
  ?resource_arn:arn ->
  ?resource_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_type:resource_type ->
  unit ->
  associated_resource

val make_list_benefit_applications_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?associated_resource_arns:arns ->
  ?associated_resources:associated_resources ->
  ?stages:stages ->
  ?status:statuses ->
  ?benefit_identifiers:benefit_identifiers ->
  ?fulfillment_types:fulfillment_types ->
  ?programs:programs ->
  catalog:catalog_name ->
  unit ->
  list_benefit_applications_input

val make_benefit_allocation_summary :
  ?applicable_benefit_ids:benefit_ids ->
  ?expires_at:timestamp ->
  ?created_at:timestamp ->
  ?fulfillment_types:fulfillment_types ->
  ?benefit_application_id:benefit_application_id ->
  ?benefit_id:benefit_id ->
  ?name:benefit_allocation_name ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:benefit_allocation_status ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?catalog:catalog_name ->
  ?id:benefit_allocation_id ->
  unit ->
  benefit_allocation_summary

val make_list_benefit_allocations_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?benefit_allocation_summaries:benefit_allocation_summaries ->
  unit ->
  list_benefit_allocations_output

val make_list_benefit_allocations_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?status:benefit_allocation_status_list ->
  ?benefit_application_identifiers:benefit_application_identifier_list ->
  ?benefit_identifiers:benefit_identifiers ->
  ?fulfillment_types:fulfillment_types ->
  catalog:catalog_name ->
  unit ->
  list_benefit_allocations_input

val make_file_detail :
  ?created_at:timestamp ->
  ?created_by:Smaws_Lib.Smithy_api.Types.string_ ->
  ?file_type:file_type ->
  ?file_status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?file_status:Smaws_Lib.Smithy_api.Types.string_ ->
  ?file_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?business_use_case:Smaws_Lib.Smithy_api.Types.string_ ->
  file_ur_i:file_ur_i ->
  unit ->
  file_detail

val make_get_benefit_application_output :
  ?file_details:file_details ->
  ?partner_contacts:contacts ->
  ?associated_resources:arns ->
  ?revision:Smaws_Lib.Smithy_api.Types.string_ ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?status_reason_codes:status_reason_codes ->
  ?status_reason_code:status_reason_code ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?stage:benefit_application_stage ->
  ?status:benefit_application_status ->
  ?programs:programs ->
  ?benefit_application_details:Smaws_Lib.Smithy_api.Types.document ->
  ?fulfillment_types:fulfillment_types ->
  ?description:benefit_application_description ->
  ?name:benefit_application_name ->
  ?benefit_id:benefit_id ->
  ?catalog:catalog_name ->
  ?arn:arn ->
  ?id:benefit_application_id ->
  unit ->
  get_benefit_application_output

val make_get_benefit_application_input :
  identifier:benefit_application_identifier ->
  catalog:catalog_name ->
  unit ->
  get_benefit_application_input

val make_monetary_value :
  currency_code:currency_code -> amount:Smaws_Lib.Smithy_api.Types.string_ -> unit -> monetary_value

val make_issuance_detail :
  ?issued_at:timestamp ->
  ?issuance_amount:monetary_value ->
  ?issuance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  issuance_detail

val make_disbursement_details :
  ?issuance_details:issuance_detail ->
  ?disbursed_amount:monetary_value ->
  unit ->
  disbursement_details

val make_consumable_details :
  ?issuance_details:issuance_detail ->
  ?utilized_amount:monetary_value ->
  ?remaining_amount:monetary_value ->
  ?allocated_amount:monetary_value ->
  unit ->
  consumable_details

val make_credit_code :
  expires_at:timestamp ->
  issued_at:timestamp ->
  status:benefit_allocation_status ->
  aws_credit_code:Smaws_Lib.Smithy_api.Types.string_ ->
  value:monetary_value ->
  aws_account_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  credit_code

val make_credit_details :
  codes:credit_codes ->
  issued_amount:monetary_value ->
  allocated_amount:monetary_value ->
  unit ->
  credit_details

val make_access_details : ?description:Smaws_Lib.Smithy_api.Types.string_ -> unit -> access_details

val make_get_benefit_allocation_output :
  ?expires_at:timestamp ->
  ?starts_at:timestamp ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?fulfillment_detail:fulfillment_details ->
  ?applicable_benefit_ids:benefit_identifiers ->
  ?fulfillment_type:fulfillment_type ->
  ?benefit_id:benefit_id ->
  ?benefit_application_id:benefit_application_id ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:benefit_allocation_status ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:benefit_allocation_arn ->
  ?catalog:catalog_name ->
  ?id:benefit_allocation_id ->
  unit ->
  get_benefit_allocation_output

val make_get_benefit_allocation_input :
  identifier:benefit_allocation_identifier ->
  catalog:catalog_name ->
  unit ->
  get_benefit_allocation_input

val make_get_benefit_output :
  ?status:benefit_status ->
  ?benefit_request_schema:Smaws_Lib.Smithy_api.Types.document ->
  ?fulfillment_types:fulfillment_types ->
  ?programs:programs ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?catalog:catalog_name ->
  ?id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  get_benefit_output

val make_get_benefit_input :
  identifier:Smaws_Lib.Smithy_api.Types.string_ -> catalog:catalog_name -> unit -> get_benefit_input

val make_disassociate_benefit_application_resource_output :
  ?revision:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:benefit_application_id ->
  unit ->
  disassociate_benefit_application_resource_output

val make_disassociate_benefit_application_resource_input :
  resource_arn:arn ->
  benefit_application_identifier:benefit_application_identifier ->
  catalog:catalog_name ->
  unit ->
  disassociate_benefit_application_resource_input

val make_create_benefit_application_output :
  ?revision:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:benefit_application_id ->
  unit ->
  create_benefit_application_output

val make_create_benefit_application_input :
  ?file_details:file_input_details ->
  ?partner_contacts:contacts ->
  ?associated_resources:arns ->
  ?tags:tags ->
  ?benefit_application_details:Smaws_Lib.Smithy_api.Types.document ->
  ?fulfillment_types:fulfillment_types ->
  ?description:benefit_application_description ->
  ?name:benefit_application_name ->
  benefit_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_name ->
  unit ->
  create_benefit_application_input

val make_cancel_benefit_application_output : unit -> unit

val make_cancel_benefit_application_input :
  ?reason:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:benefit_application_identifier ->
  client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_name ->
  unit ->
  cancel_benefit_application_input

val make_associate_benefit_application_resource_output :
  ?revision:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:benefit_application_id ->
  unit ->
  associate_benefit_application_resource_output

val make_associate_benefit_application_resource_input :
  resource_arn:arn ->
  benefit_application_identifier:benefit_application_identifier ->
  catalog:catalog_name ->
  unit ->
  associate_benefit_application_resource_input

val make_amend_benefit_application_output : unit -> unit

val make_amendment :
  new_value:Smaws_Lib.Smithy_api.Types.string_ ->
  field_path:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  amendment

val make_amend_benefit_application_input :
  amendments:amendment_list ->
  amendment_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:benefit_application_identifier ->
  revision:Smaws_Lib.Smithy_api.Types.string_ ->
  client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_name ->
  unit ->
  amend_benefit_application_input
