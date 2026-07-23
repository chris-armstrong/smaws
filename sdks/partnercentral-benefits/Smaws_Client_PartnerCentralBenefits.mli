(** PartnerCentral Benefits client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_access_details : ?description:Smaws_Lib.Smithy_api.Types.string_ -> unit -> access_details

val make_validation_exception_field :
  ?code:validation_exception_error_code ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_amend_benefit_application_output : unit -> unit

val make_amendment :
  field_path:Smaws_Lib.Smithy_api.Types.string_ ->
  new_value:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  amendment

val make_amend_benefit_application_input :
  catalog:catalog_name ->
  client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  revision:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:benefit_application_identifier ->
  amendment_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  amendments:amendment_list ->
  unit ->
  amend_benefit_application_input

val make_associate_benefit_application_resource_output :
  ?id:benefit_application_id ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?revision:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  associate_benefit_application_resource_output

val make_associate_benefit_application_resource_input :
  catalog:catalog_name ->
  benefit_application_identifier:benefit_application_identifier ->
  resource_arn:arn ->
  unit ->
  associate_benefit_application_resource_input

val make_associated_resource :
  ?resource_type:resource_type ->
  ?resource_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_arn:arn ->
  unit ->
  associated_resource

val make_benefit_allocation_summary :
  ?id:benefit_allocation_id ->
  ?catalog:catalog_name ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:benefit_allocation_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:benefit_allocation_name ->
  ?benefit_id:benefit_id ->
  ?benefit_application_id:benefit_application_id ->
  ?fulfillment_types:fulfillment_types ->
  ?created_at:timestamp ->
  ?expires_at:timestamp ->
  ?applicable_benefit_ids:benefit_ids ->
  unit ->
  benefit_allocation_summary

val make_benefit_application_summary :
  ?catalog:catalog_name ->
  ?name:benefit_application_name ->
  ?id:benefit_application_id ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?benefit_id:benefit_id ->
  ?programs:programs ->
  ?fulfillment_types:fulfillment_types ->
  ?status:benefit_application_status ->
  ?stage:benefit_application_stage ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?benefit_application_details:attributes ->
  ?associated_resources:arns ->
  unit ->
  benefit_application_summary

val make_benefit_summary :
  ?id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?catalog:catalog_name ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?programs:programs ->
  ?fulfillment_types:fulfillment_types ->
  ?status:benefit_status ->
  unit ->
  benefit_summary

val make_cancel_benefit_application_output : unit -> unit

val make_cancel_benefit_application_input :
  ?reason:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_name ->
  client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:benefit_application_identifier ->
  unit ->
  cancel_benefit_application_input

val make_monetary_value :
  amount:Smaws_Lib.Smithy_api.Types.string_ -> currency_code:currency_code -> unit -> monetary_value

val make_issuance_detail :
  ?issuance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?issuance_amount:monetary_value ->
  ?issued_at:timestamp ->
  unit ->
  issuance_detail

val make_consumable_details :
  ?allocated_amount:monetary_value ->
  ?remaining_amount:monetary_value ->
  ?utilized_amount:monetary_value ->
  ?issuance_details:issuance_detail ->
  unit ->
  consumable_details

val make_contact :
  ?email:contact_email ->
  ?first_name:contact_first_name ->
  ?last_name:contact_last_name ->
  ?business_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?phone:contact_phone ->
  unit ->
  contact

val make_create_benefit_application_output :
  ?id:benefit_application_id ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?revision:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_benefit_application_output

val make_file_input :
  ?business_use_case:Smaws_Lib.Smithy_api.Types.string_ -> file_ur_i:file_ur_i -> unit -> file_input

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_benefit_application_input :
  ?name:benefit_application_name ->
  ?description:benefit_application_description ->
  ?fulfillment_types:fulfillment_types ->
  ?benefit_application_details:Smaws_Lib.Smithy_api.Types.document ->
  ?tags:tags ->
  ?associated_resources:arns ->
  ?partner_contacts:contacts ->
  ?file_details:file_input_details ->
  catalog:catalog_name ->
  client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  benefit_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_benefit_application_input

val make_credit_code :
  aws_account_id:Smaws_Lib.Smithy_api.Types.string_ ->
  value:monetary_value ->
  aws_credit_code:Smaws_Lib.Smithy_api.Types.string_ ->
  status:benefit_allocation_status ->
  issued_at:timestamp ->
  expires_at:timestamp ->
  unit ->
  credit_code

val make_credit_details :
  allocated_amount:monetary_value ->
  issued_amount:monetary_value ->
  codes:credit_codes ->
  unit ->
  credit_details

val make_disassociate_benefit_application_resource_output :
  ?id:benefit_application_id ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?revision:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  disassociate_benefit_application_resource_output

val make_disassociate_benefit_application_resource_input :
  catalog:catalog_name ->
  benefit_application_identifier:benefit_application_identifier ->
  resource_arn:arn ->
  unit ->
  disassociate_benefit_application_resource_input

val make_disbursement_details :
  ?disbursed_amount:monetary_value ->
  ?issuance_details:issuance_detail ->
  unit ->
  disbursement_details

val make_file_detail :
  ?business_use_case:Smaws_Lib.Smithy_api.Types.string_ ->
  ?file_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?file_status:Smaws_Lib.Smithy_api.Types.string_ ->
  ?file_status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?file_type:file_type ->
  ?created_by:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:timestamp ->
  file_ur_i:file_ur_i ->
  unit ->
  file_detail

val make_get_benefit_output :
  ?id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?catalog:catalog_name ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?programs:programs ->
  ?fulfillment_types:fulfillment_types ->
  ?benefit_request_schema:Smaws_Lib.Smithy_api.Types.document ->
  ?status:benefit_status ->
  unit ->
  get_benefit_output

val make_get_benefit_input :
  catalog:catalog_name -> identifier:Smaws_Lib.Smithy_api.Types.string_ -> unit -> get_benefit_input

val make_get_benefit_allocation_output :
  ?id:benefit_allocation_id ->
  ?catalog:catalog_name ->
  ?arn:benefit_allocation_arn ->
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:benefit_allocation_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?benefit_application_id:benefit_application_id ->
  ?benefit_id:benefit_id ->
  ?fulfillment_type:fulfillment_type ->
  ?applicable_benefit_ids:benefit_identifiers ->
  ?fulfillment_detail:fulfillment_details ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?starts_at:timestamp ->
  ?expires_at:timestamp ->
  unit ->
  get_benefit_allocation_output

val make_get_benefit_allocation_input :
  catalog:catalog_name ->
  identifier:benefit_allocation_identifier ->
  unit ->
  get_benefit_allocation_input

val make_get_benefit_application_output :
  ?id:benefit_application_id ->
  ?arn:arn ->
  ?catalog:catalog_name ->
  ?benefit_id:benefit_id ->
  ?name:benefit_application_name ->
  ?description:benefit_application_description ->
  ?fulfillment_types:fulfillment_types ->
  ?benefit_application_details:Smaws_Lib.Smithy_api.Types.document ->
  ?programs:programs ->
  ?status:benefit_application_status ->
  ?stage:benefit_application_stage ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason_code:status_reason_code ->
  ?status_reason_codes:status_reason_codes ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?revision:Smaws_Lib.Smithy_api.Types.string_ ->
  ?associated_resources:arns ->
  ?partner_contacts:contacts ->
  ?file_details:file_details ->
  unit ->
  get_benefit_application_output

val make_get_benefit_application_input :
  catalog:catalog_name ->
  identifier:benefit_application_identifier ->
  unit ->
  get_benefit_application_input

val make_list_benefit_allocations_output :
  ?benefit_allocation_summaries:benefit_allocation_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_benefit_allocations_output

val make_list_benefit_allocations_input :
  ?fulfillment_types:fulfillment_types ->
  ?benefit_identifiers:benefit_identifiers ->
  ?benefit_application_identifiers:benefit_application_identifier_list ->
  ?status:benefit_allocation_status_list ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_name ->
  unit ->
  list_benefit_allocations_input

val make_list_benefit_applications_output :
  ?benefit_application_summaries:benefit_application_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_benefit_applications_output

val make_list_benefit_applications_input :
  ?programs:programs ->
  ?fulfillment_types:fulfillment_types ->
  ?benefit_identifiers:benefit_identifiers ->
  ?status:statuses ->
  ?stages:stages ->
  ?associated_resources:associated_resources ->
  ?associated_resource_arns:arns ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_name ->
  unit ->
  list_benefit_applications_input

val make_list_benefits_output :
  ?benefit_summaries:benefit_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_benefits_output

val make_list_benefits_input :
  ?programs:programs ->
  ?fulfillment_types:fulfillment_types ->
  ?status:benefit_statuses ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_name ->
  unit ->
  list_benefits_input

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_request

val make_update_benefit_application_output :
  ?id:benefit_application_id ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?revision:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_benefit_application_output

val make_update_benefit_application_input :
  ?name:benefit_application_name ->
  ?description:benefit_application_description ->
  ?benefit_application_details:Smaws_Lib.Smithy_api.Types.document ->
  ?partner_contacts:contacts ->
  ?file_details:file_input_details ->
  catalog:catalog_name ->
  client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  identifier:benefit_application_identifier ->
  revision:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_benefit_application_input

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:taggable_resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:taggable_resource_arn -> tags:tags -> unit -> tag_resource_request

val make_submit_benefit_application_output : unit -> unit

val make_submit_benefit_application_input :
  catalog:catalog_name ->
  identifier:benefit_application_identifier ->
  unit ->
  submit_benefit_application_input

val make_recall_benefit_application_output : unit -> unit

val make_recall_benefit_application_input :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_name ->
  identifier:benefit_application_identifier ->
  reason:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recall_benefit_application_input
(** {1:operations Operations} *)

module RecallBenefitApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    recall_benefit_application_input ->
    ( recall_benefit_application_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    recall_benefit_application_input ->
    ( recall_benefit_application_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Recalls a submitted benefit application, returning it to draft status for further modifications.\n"]

module SubmitBenefitApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    submit_benefit_application_input ->
    ( submit_benefit_application_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    submit_benefit_application_input ->
    ( submit_benefit_application_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Submits a benefit application for review and processing by AWS.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds or updates tags for a specified resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes specified tags from a resource.\n"]

module UpdateBenefitApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_benefit_application_input ->
    ( update_benefit_application_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_benefit_application_input ->
    ( update_benefit_application_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing benefit application with new information while maintaining revision control.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves all tags associated with a specific resource.\n"]

module ListBenefits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_benefits_input ->
    ( list_benefits_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_benefits_input ->
    ( list_benefits_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a paginated list of available benefits based on specified filter criteria.\n"]

module ListBenefitApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_benefit_applications_input ->
    ( list_benefit_applications_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_benefit_applications_input ->
    ( list_benefit_applications_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a paginated list of benefit applications based on specified filter criteria.\n"]

module ListBenefitAllocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_benefit_allocations_input ->
    ( list_benefit_allocations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_benefit_allocations_input ->
    ( list_benefit_allocations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a paginated list of benefit allocations based on specified filter criteria.\n"]

module GetBenefitApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_benefit_application_input ->
    ( get_benefit_application_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_benefit_application_input ->
    ( get_benefit_application_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves detailed information about a specific benefit application.\n"]

module GetBenefitAllocation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_benefit_allocation_input ->
    ( get_benefit_allocation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_benefit_allocation_input ->
    ( get_benefit_allocation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a specific benefit allocation that has been granted to a \
   partner.\n"]

module GetBenefit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_benefit_input ->
    ( get_benefit_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_benefit_input ->
    ( get_benefit_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a specific benefit available in the partner catalog.\n"]

module DisassociateBenefitApplicationResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_benefit_application_resource_input ->
    ( disassociate_benefit_application_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_benefit_application_resource_input ->
    ( disassociate_benefit_application_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the association between an AWS resource and a benefit application.\n"]

module CreateBenefitApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_benefit_application_input ->
    ( create_benefit_application_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_benefit_application_input ->
    ( create_benefit_application_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new benefit application for a partner to request access to AWS benefits and programs.\n"]

module CancelBenefitApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_benefit_application_input ->
    ( cancel_benefit_application_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_benefit_application_input ->
    ( cancel_benefit_application_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels a benefit application that is currently in progress, preventing further processing.\n"]

module AssociateBenefitApplicationResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_benefit_application_resource_input ->
    ( associate_benefit_application_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_benefit_application_resource_input ->
    ( associate_benefit_application_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Links an AWS resource to an existing benefit application for tracking and management purposes.\n"]

(** {1:Serialization and Deserialization} *)
module AmendBenefitApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    amend_benefit_application_input ->
    ( amend_benefit_application_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    amend_benefit_application_input ->
    ( amend_benefit_application_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing benefit application by applying amendments to specific fields while \
   maintaining revision control.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
