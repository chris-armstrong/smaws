type nonrec validation_exception_field = {
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the field that failed validation.\n"]
  code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The validation error code for the field.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A descriptive message about the validation error.\n"]
}
[@@ocaml.doc "Information about a field that failed validation.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | REQUEST_VALIDATION_FAILED [@ocaml.doc ""]
  | BUSINESS_VALIDATION_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the validation error.\n"]
  reason : validation_exception_reason; [@ocaml.doc "The reason for the validation failure.\n"]
  field_list : validation_exception_field_list option;
      [@ocaml.doc "A list of fields that failed validation.\n"]
}
[@@ocaml.doc "The request failed validation due to invalid input parameters.\n"]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the throttling error.\n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service code associated with the throttling error.\n"]
  quota_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The quota code associated with the throttling error.\n"]
}
[@@ocaml.doc "The request was throttled due to too many requests being sent in a short period.\n"]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the resource not found error.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The identifier of the resource that was not found.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The type of the resource that was not found.\n"]
}
[@@ocaml.doc "The specified resource was not found.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the internal server error.\n"]
}
[@@ocaml.doc "An internal server error occurred while processing the request.\n"]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the access denial.\n"]
  reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason for the access denial.\n"]
}
[@@ocaml.doc "The request was denied due to insufficient permissions.\n"]

type nonrec handshake_status =
  | PENDING [@ocaml.doc ""]
  | ACCEPTED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec channel_handshake_id = string [@@ocaml.doc ""]

type nonrec accept_channel_handshake_detail = {
  id : channel_handshake_id option;
      [@ocaml.doc "The unique identifier of the accepted handshake.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the accepted handshake.\n"]
  status : handshake_status option; [@ocaml.doc "The current status of the accepted handshake.\n"]
}
[@@ocaml.doc "Contains details about an accepted channel handshake.\n"]

type nonrec accept_channel_handshake_response = {
  channel_handshake_detail : accept_channel_handshake_detail option;
      [@ocaml.doc "Details of the accepted channel handshake.\n"]
}
[@@ocaml.doc ""]

type nonrec channel_handshake_identifier = string [@@ocaml.doc ""]

type nonrec catalog = string [@@ocaml.doc ""]

type nonrec accept_channel_handshake_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the handshake request.\n"]
  identifier : channel_handshake_identifier;
      [@ocaml.doc "The unique identifier of the channel handshake to accept.\n"]
}
[@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec account_id_list = account_id list [@@ocaml.doc ""]

type nonrec associated_resource_id = string [@@ocaml.doc ""]

type nonrec associated_resource_identifier = string [@@ocaml.doc ""]

type nonrec associated_resource_identifier_list = associated_resource_identifier list
[@@ocaml.doc ""]

type nonrec association_type =
  | DOWNSTREAM_SELLER [@ocaml.doc ""]
  | END_CUSTOMER [@ocaml.doc ""]
  | INTERNAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec association_type_list = association_type list [@@ocaml.doc ""]

type nonrec cancel_channel_handshake_detail = {
  id : channel_handshake_id option;
      [@ocaml.doc "The unique identifier of the canceled handshake.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the canceled handshake.\n"]
  status : handshake_status option; [@ocaml.doc "The current status of the canceled handshake.\n"]
}
[@@ocaml.doc "Contains details about a canceled channel handshake.\n"]

type nonrec cancel_channel_handshake_response = {
  channel_handshake_detail : cancel_channel_handshake_detail option;
      [@ocaml.doc "Details of the canceled channel handshake.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_channel_handshake_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the handshake request.\n"]
  identifier : channel_handshake_identifier;
      [@ocaml.doc "The unique identifier of the channel handshake to cancel.\n"]
}
[@@ocaml.doc ""]

type nonrec note = string [@@ocaml.doc ""]

type nonrec program_management_account_identifier = string [@@ocaml.doc ""]

type nonrec revoke_service_period_payload = {
  program_management_account_identifier : program_management_account_identifier;
      [@ocaml.doc "The identifier of the program management account.\n"]
  note : note option; [@ocaml.doc "A note explaining the reason for revoking the service period.\n"]
}
[@@ocaml.doc "Payload for revoke service period handshake requests.\n"]

type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec minimum_notice_days = string [@@ocaml.doc ""]

type nonrec service_period_type =
  | MINIMUM_NOTICE_PERIOD [@ocaml.doc ""]
  | FIXED_COMMITMENT_PERIOD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec start_service_period_payload = {
  program_management_account_identifier : program_management_account_identifier;
      [@ocaml.doc "The identifier of the program management account.\n"]
  note : note option;
      [@ocaml.doc "A note providing additional information about the service period.\n"]
  service_period_type : service_period_type;
      [@ocaml.doc "The type of service period being started.\n"]
  minimum_notice_days : minimum_notice_days option;
      [@ocaml.doc "The minimum number of days notice required for changes.\n"]
  end_date : date_time option; [@ocaml.doc "The end date of the service period.\n"]
}
[@@ocaml.doc "Payload for start service period handshake requests.\n"]

type nonrec channel_handshake_payload =
  | StartServicePeriodPayload of start_service_period_payload
      [@ocaml.doc "Payload for starting a service period handshake.\n"]
  | RevokeServicePeriodPayload of revoke_service_period_payload
      [@ocaml.doc "Payload for revoking a service period handshake.\n"]
[@@ocaml.doc "Contains the payload data for different types of channel handshakes.\n"]

type nonrec channel_handshake_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec program =
  | SOLUTION_PROVIDER [@ocaml.doc ""]
  | DISTRIBUTION [@ocaml.doc ""]
  | DISTRIBUTION_SELLER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec program_management_account_handshake_detail = {
  program : program option; [@ocaml.doc "The program associated with the handshake.\n"]
}
[@@ocaml.doc "Details specific to program management account handshakes.\n"]

type nonrec revoke_service_period_handshake_detail = {
  note : note option; [@ocaml.doc "A note explaining the reason for revoking the service period.\n"]
  service_period_type : service_period_type option;
      [@ocaml.doc "The type of service period being revoked.\n"]
  minimum_notice_days : minimum_notice_days option;
      [@ocaml.doc "The minimum number of days notice required for revocation.\n"]
  start_date : date_time option;
      [@ocaml.doc "The start date of the service period being revoked.\n"]
  end_date : date_time option; [@ocaml.doc "The end date of the service period being revoked.\n"]
}
[@@ocaml.doc "Details specific to revoke service period handshakes.\n"]

type nonrec start_service_period_handshake_detail = {
  note : note option;
      [@ocaml.doc "A note providing additional information about the service period.\n"]
  service_period_type : service_period_type option;
      [@ocaml.doc "The type of service period being started.\n"]
  minimum_notice_days : minimum_notice_days option;
      [@ocaml.doc "The minimum number of days notice required for changes.\n"]
  start_date : date_time option; [@ocaml.doc "The start date of the service period.\n"]
  end_date : date_time option; [@ocaml.doc "The end date of the service period.\n"]
}
[@@ocaml.doc "Details specific to start service period handshakes.\n"]

type nonrec handshake_detail =
  | StartServicePeriodHandshakeDetail of start_service_period_handshake_detail
      [@ocaml.doc "Details for a start service period handshake.\n"]
  | RevokeServicePeriodHandshakeDetail of revoke_service_period_handshake_detail
      [@ocaml.doc "Details for a revoke service period handshake.\n"]
  | ProgramManagementAccountHandshakeDetail of program_management_account_handshake_detail
      [@ocaml.doc "Details for a program management account handshake.\n"]
[@@ocaml.doc "Contains detailed information about different types of handshakes.\n"]

type nonrec partner_profile_display_name = string [@@ocaml.doc ""]

type nonrec handshake_type =
  | START_SERVICE_PERIOD [@ocaml.doc ""]
  | REVOKE_SERVICE_PERIOD [@ocaml.doc ""]
  | PROGRAM_MANAGEMENT_ACCOUNT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec channel_handshake_summary = {
  id : channel_handshake_id option; [@ocaml.doc "The unique identifier of the handshake.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the handshake.\n"]
  catalog : catalog option; [@ocaml.doc "The catalog identifier associated with the handshake.\n"]
  handshake_type : handshake_type option; [@ocaml.doc "The type of the handshake.\n"]
  owner_account_id : account_id option; [@ocaml.doc "The AWS account ID of the handshake owner.\n"]
  sender_account_id : account_id option;
      [@ocaml.doc "The AWS account ID of the handshake sender.\n"]
  sender_display_name : partner_profile_display_name option;
      [@ocaml.doc "The display name of the handshake sender.\n"]
  receiver_account_id : account_id option;
      [@ocaml.doc "The AWS account ID of the handshake receiver.\n"]
  associated_resource_id : associated_resource_id option;
      [@ocaml.doc "The identifier of the resource associated with the handshake.\n"]
  detail : handshake_detail option; [@ocaml.doc "Detailed information about the handshake.\n"]
  created_at : date_time option; [@ocaml.doc "The timestamp when the handshake was created.\n"]
  updated_at : date_time option; [@ocaml.doc "The timestamp when the handshake was last updated.\n"]
  status : handshake_status option; [@ocaml.doc "The current status of the handshake.\n"]
}
[@@ocaml.doc "Summary information about a channel handshake.\n"]

type nonrec channel_handshake_summaries = channel_handshake_summary list [@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec conflict_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "A message describing the conflict.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier of the resource that caused the conflict.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The type of the resource that caused the conflict.\n"]
}
[@@ocaml.doc
  "The request could not be completed due to a conflict with the current state of the resource.\n"]

type nonrec coverage =
  | ENTIRE_ORGANIZATION [@ocaml.doc ""]
  | MANAGEMENT_ACCOUNT_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the service quota exceeded error.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier of the resource that would exceed the quota.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The type of the resource that would exceed the quota.\n"]
  quota_code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The code identifying the specific quota that would be exceeded.\n"]
}
[@@ocaml.doc "The request would exceed a service quota limit.\n"]

type nonrec create_channel_handshake_detail = {
  id : channel_handshake_id option; [@ocaml.doc "The unique identifier of the created handshake.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the created handshake.\n"]
}
[@@ocaml.doc "Contains details about a newly created channel handshake.\n"]

type nonrec create_channel_handshake_response = {
  channel_handshake_detail : create_channel_handshake_detail option;
      [@ocaml.doc "Details of the created channel handshake.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key of the tag.\n"]
  value : tag_value; [@ocaml.doc "The value of the tag.\n"]
}
[@@ocaml.doc "A key-value pair that can be associated with a resource.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec create_channel_handshake_request = {
  handshake_type : handshake_type;
      [@ocaml.doc
        "The type of handshake to create (e.g., start service period, revoke service period).\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the handshake request.\n"]
  associated_resource_identifier : associated_resource_identifier;
      [@ocaml.doc "The identifier of the resource associated with this handshake.\n"]
  payload : channel_handshake_payload option;
      [@ocaml.doc "The payload containing specific details for the handshake type.\n"]
  client_token : client_token option;
      [@ocaml.doc "A unique, case-sensitive identifier to ensure idempotency of the request.\n"]
  tags : tag_list option; [@ocaml.doc "Key-value pairs to associate with the channel handshake.\n"]
}
[@@ocaml.doc ""]

type nonrec program_management_account_id = string [@@ocaml.doc ""]

type nonrec create_program_management_account_detail = {
  id : program_management_account_id option;
      [@ocaml.doc "The unique identifier of the created program management account.\n"]
  arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the created program management account.\n"]
}
[@@ocaml.doc "Contains details about a newly created program management account.\n"]

type nonrec create_program_management_account_response = {
  program_management_account_detail : create_program_management_account_detail option;
      [@ocaml.doc "Details of the created program management account.\n"]
}
[@@ocaml.doc ""]

type nonrec program_management_account_display_name = string [@@ocaml.doc ""]

type nonrec create_program_management_account_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the program management account.\n"]
  program : program; [@ocaml.doc "The program type for the management account.\n"]
  display_name : program_management_account_display_name;
      [@ocaml.doc "A human-readable name for the program management account.\n"]
  account_id : account_id;
      [@ocaml.doc "The AWS account ID to associate with the program management account.\n"]
  client_token : client_token option;
      [@ocaml.doc "A unique, case-sensitive identifier to ensure idempotency of the request.\n"]
  tags : tag_list option;
      [@ocaml.doc "Key-value pairs to associate with the program management account.\n"]
}
[@@ocaml.doc ""]

type nonrec relationship_id = string [@@ocaml.doc ""]

type nonrec create_relationship_detail = {
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the created relationship.\n"]
  id : relationship_id option; [@ocaml.doc "The unique identifier of the created relationship.\n"]
}
[@@ocaml.doc "Contains details about a newly created relationship.\n"]

type nonrec create_relationship_response = {
  relationship_detail : create_relationship_detail option;
      [@ocaml.doc "Details of the created relationship.\n"]
}
[@@ocaml.doc ""]

type nonrec resold_unified_operations = {
  coverage : coverage; [@ocaml.doc "The coverage level for resold unified operations support.\n"]
  tam_location : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The location of the Technical Account Manager (TAM).\n"]
  charge_account_id : account_id option;
      [@ocaml.doc "The AWS account ID to charge for the support plan.\n"]
}
[@@ocaml.doc "Configuration for resold unified operations support plans.\n"]

type nonrec provider = DISTRIBUTOR [@ocaml.doc ""] | DISTRIBUTION_SELLER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec partner_led_support = {
  coverage : coverage; [@ocaml.doc "The coverage level for partner-led support.\n"]
  provider : provider option; [@ocaml.doc "The provider of the partner-led support.\n"]
  tam_location : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The location of the Technical Account Manager (TAM).\n"]
}
[@@ocaml.doc "Configuration for partner-led support plans.\n"]

type nonrec resold_enterprise = {
  coverage : coverage; [@ocaml.doc "The coverage level for resold enterprise support.\n"]
  tam_location : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The location of the Technical Account Manager (TAM).\n"]
  charge_account_id : account_id option;
      [@ocaml.doc "The AWS account ID to charge for the support plan.\n"]
}
[@@ocaml.doc "Configuration for resold enterprise support plans.\n"]

type nonrec support_plan =
  | ResoldEnterprise of resold_enterprise
      [@ocaml.doc "Configuration for resold enterprise support plans.\n"]
  | PartnerLedSupport of partner_led_support
      [@ocaml.doc "Configuration for partner-led support plans.\n"]
  | ResoldUnifiedOperations of resold_unified_operations
      [@ocaml.doc "Configuration for resold unified operations support plans.\n"]
[@@ocaml.doc "Configuration for different types of support plans.\n"]

type nonrec sector =
  | COMMERCIAL [@ocaml.doc ""]
  | GOVERNMENT [@ocaml.doc ""]
  | GOVERNMENT_EXCEPTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resale_account_model =
  | DISTRIBUTOR [@ocaml.doc ""]
  | END_CUSTOMER [@ocaml.doc ""]
  | SOLUTION_PROVIDER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec relationship_display_name = string [@@ocaml.doc ""]

type nonrec create_relationship_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the relationship.\n"]
  association_type : association_type;
      [@ocaml.doc "The type of association for the relationship (e.g., reseller, distributor).\n"]
  program_management_account_identifier : program_management_account_identifier;
      [@ocaml.doc "The identifier of the program management account for this relationship.\n"]
  associated_account_id : account_id;
      [@ocaml.doc "The AWS account ID to associate in this relationship.\n"]
  display_name : relationship_display_name;
      [@ocaml.doc "A human-readable name for the relationship.\n"]
  resale_account_model : resale_account_model option;
      [@ocaml.doc "The resale account model for the relationship.\n"]
  sector : sector; [@ocaml.doc "The business sector for the relationship.\n"]
  client_token : client_token option;
      [@ocaml.doc "A unique, case-sensitive identifier to ensure idempotency of the request.\n"]
  tags : tag_list option; [@ocaml.doc "Key-value pairs to associate with the relationship.\n"]
  requested_support_plan : support_plan option;
      [@ocaml.doc "The support plan requested for this relationship.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_program_management_account_response = unit [@@ocaml.doc ""]

type nonrec delete_program_management_account_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the program management account.\n"]
  identifier : program_management_account_identifier;
      [@ocaml.doc "The unique identifier of the program management account to delete.\n"]
  client_token : client_token option;
      [@ocaml.doc "A unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_relationship_response = unit [@@ocaml.doc ""]

type nonrec relationship_identifier = string [@@ocaml.doc ""]

type nonrec delete_relationship_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the relationship.\n"]
  identifier : relationship_identifier;
      [@ocaml.doc "The unique identifier of the relationship to delete.\n"]
  program_management_account_identifier : program_management_account_identifier;
      [@ocaml.doc
        "The identifier of the program management account associated with the relationship.\n"]
  client_token : client_token option;
      [@ocaml.doc "A unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec revision = string [@@ocaml.doc ""]

type nonrec relationship_detail = {
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the relationship.\n"]
  id : relationship_id option; [@ocaml.doc "The unique identifier of the relationship.\n"]
  revision : revision option; [@ocaml.doc "The current revision number of the relationship.\n"]
  catalog : catalog option;
      [@ocaml.doc "The catalog identifier associated with the relationship.\n"]
  association_type : association_type option;
      [@ocaml.doc "The type of association for the relationship.\n"]
  program_management_account_id : program_management_account_id option;
      [@ocaml.doc "The identifier of the program management account.\n"]
  associated_account_id : account_id option;
      [@ocaml.doc "The AWS account ID associated in this relationship.\n"]
  display_name : relationship_display_name option;
      [@ocaml.doc "The display name of the relationship.\n"]
  resale_account_model : resale_account_model option;
      [@ocaml.doc "The resale account model for the relationship.\n"]
  sector : sector option; [@ocaml.doc "The business sector for the relationship.\n"]
  created_at : date_time option; [@ocaml.doc "The timestamp when the relationship was created.\n"]
  updated_at : date_time option;
      [@ocaml.doc "The timestamp when the relationship was last updated.\n"]
  start_date : date_time option; [@ocaml.doc "The start date of the relationship.\n"]
}
[@@ocaml.doc "Detailed information about a partner relationship.\n"]

type nonrec get_relationship_response = {
  relationship_detail : relationship_detail option;
      [@ocaml.doc "Details of the requested relationship.\n"]
}
[@@ocaml.doc ""]

type nonrec get_relationship_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the relationship.\n"]
  program_management_account_identifier : program_management_account_identifier;
      [@ocaml.doc
        "The identifier of the program management account associated with the relationship.\n"]
  identifier : relationship_identifier;
      [@ocaml.doc "The unique identifier of the relationship to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec handshake_status_list = handshake_status list [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_channel_handshakes_response = {
  items : channel_handshake_summaries option;
      [@ocaml.doc "List of channel handshakes matching the criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc "Token for retrieving the next page of results, if available.\n"]
}
[@@ocaml.doc ""]

type nonrec program_management_account_type_sort_name = UPDATED_AT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sort_order = ASCENDING [@ocaml.doc ""] | DESCENDING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec program_management_account_type_sort = {
  sort_order : sort_order; [@ocaml.doc "The sort order (ascending or descending).\n"]
  sort_by : program_management_account_type_sort_name; [@ocaml.doc "The field to sort by.\n"]
}
[@@ocaml.doc "Type-specific sorting options for program management accounts.\n"]

type nonrec revoke_service_period_type_sort_name = UPDATED_AT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec revoke_service_period_type_sort = {
  sort_order : sort_order; [@ocaml.doc "The sort order (ascending or descending).\n"]
  sort_by : revoke_service_period_type_sort_name; [@ocaml.doc "The field to sort by.\n"]
}
[@@ocaml.doc "Sorting options specific to revoke service period handshakes.\n"]

type nonrec start_service_period_type_sort_name = UPDATED_AT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec start_service_period_type_sort = {
  sort_order : sort_order; [@ocaml.doc "The sort order (ascending or descending).\n"]
  sort_by : start_service_period_type_sort_name; [@ocaml.doc "The field to sort by.\n"]
}
[@@ocaml.doc "Sorting options specific to start service period handshakes.\n"]

type nonrec list_channel_handshakes_type_sort =
  | StartServicePeriodTypeSort of start_service_period_type_sort
      [@ocaml.doc "Sorting options specific to start service period handshakes.\n"]
  | RevokeServicePeriodTypeSort of revoke_service_period_type_sort
      [@ocaml.doc "Sorting options specific to revoke service period handshakes.\n"]
  | ProgramManagementAccountTypeSort of program_management_account_type_sort
      [@ocaml.doc "Sorting options specific to program management account handshakes.\n"]
[@@ocaml.doc "Type-specific sorting options for listing channel handshakes.\n"]

type nonrec program_list = program list [@@ocaml.doc ""]

type nonrec program_management_account_type_filters = {
  programs : program_list option; [@ocaml.doc "Filter by program types.\n"]
}
[@@ocaml.doc "Type-specific filters for program management accounts.\n"]

type nonrec service_period_type_list = service_period_type list [@@ocaml.doc ""]

type nonrec revoke_service_period_type_filters = {
  service_period_types : service_period_type_list option;
      [@ocaml.doc "Filter by service period types.\n"]
}
[@@ocaml.doc "Filters specific to revoke service period handshakes.\n"]

type nonrec start_service_period_type_filters = {
  service_period_types : service_period_type_list option;
      [@ocaml.doc "Filter by service period types.\n"]
}
[@@ocaml.doc "Filters specific to start service period handshakes.\n"]

type nonrec list_channel_handshakes_type_filters =
  | StartServicePeriodTypeFilters of start_service_period_type_filters
      [@ocaml.doc "Filters specific to start service period handshakes.\n"]
  | RevokeServicePeriodTypeFilters of revoke_service_period_type_filters
      [@ocaml.doc "Filters specific to revoke service period handshakes.\n"]
  | ProgramManagementAccountTypeFilters of program_management_account_type_filters
      [@ocaml.doc "Filters specific to program management account handshakes.\n"]
[@@ocaml.doc "Type-specific filters for listing channel handshakes.\n"]

type nonrec participant_type = SENDER [@ocaml.doc ""] | RECEIVER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_channel_handshakes_request = {
  handshake_type : handshake_type; [@ocaml.doc "Filter results by handshake type.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier to filter handshakes.\n"]
  participant_type : participant_type;
      [@ocaml.doc "Filter by participant type (sender or receiver).\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
  statuses : handshake_status_list option; [@ocaml.doc "Filter results by handshake status.\n"]
  associated_resource_identifiers : associated_resource_identifier_list option;
      [@ocaml.doc "Filter by associated resource identifiers.\n"]
  handshake_type_filters : list_channel_handshakes_type_filters option;
      [@ocaml.doc "Type-specific filters for handshakes.\n"]
  handshake_type_sort : list_channel_handshakes_type_sort option;
      [@ocaml.doc "Type-specific sorting options for handshakes.\n"]
  next_token : next_token option; [@ocaml.doc "Token for retrieving the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec program_management_account_status =
  | PENDING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec program_management_account_summary = {
  id : program_management_account_id option;
      [@ocaml.doc "The unique identifier of the program management account.\n"]
  revision : revision option;
      [@ocaml.doc "The current revision number of the program management account.\n"]
  catalog : catalog option; [@ocaml.doc "The catalog identifier associated with the account.\n"]
  program : program option; [@ocaml.doc "The program type for the management account.\n"]
  display_name : program_management_account_display_name option;
      [@ocaml.doc "The display name of the program management account.\n"]
  account_id : account_id option;
      [@ocaml.doc "The AWS account ID associated with the program management account.\n"]
  arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the program management account.\n"]
  created_at : date_time option; [@ocaml.doc "The timestamp when the account was created.\n"]
  updated_at : date_time option; [@ocaml.doc "The timestamp when the account was last updated.\n"]
  start_date : date_time option; [@ocaml.doc "The start date of the program management account.\n"]
  status : program_management_account_status option;
      [@ocaml.doc "The current status of the program management account.\n"]
}
[@@ocaml.doc "Summary information about a program management account.\n"]

type nonrec program_management_account_summaries = program_management_account_summary list
[@@ocaml.doc ""]

type nonrec list_program_management_accounts_response = {
  items : program_management_account_summaries option;
      [@ocaml.doc "List of program management accounts matching the criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc "Token for retrieving the next page of results, if available.\n"]
}
[@@ocaml.doc ""]

type nonrec list_program_management_accounts_sort_name = UPDATED_AT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_program_management_accounts_sort_base = {
  sort_order : sort_order; [@ocaml.doc "The sort order (ascending or descending).\n"]
  sort_by : list_program_management_accounts_sort_name; [@ocaml.doc "The field to sort by.\n"]
}
[@@ocaml.doc "Base sorting configuration for program management accounts.\n"]

type nonrec program_management_account_status_list = program_management_account_status list
[@@ocaml.doc ""]

type nonrec program_management_account_display_name_list =
  program_management_account_display_name list
[@@ocaml.doc ""]

type nonrec list_program_management_accounts_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier to filter accounts.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
  display_names : program_management_account_display_name_list option;
      [@ocaml.doc "Filter by display names.\n"]
  programs : program_list option; [@ocaml.doc "Filter by program types.\n"]
  account_ids : account_id_list option; [@ocaml.doc "Filter by AWS account IDs.\n"]
  statuses : program_management_account_status_list option;
      [@ocaml.doc "Filter by program management account statuses.\n"]
  sort : list_program_management_accounts_sort_base option;
      [@ocaml.doc "Sorting options for the results.\n"]
  next_token : next_token option; [@ocaml.doc "Token for retrieving the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec relationship_summary = {
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the relationship.\n"]
  id : relationship_id option; [@ocaml.doc "The unique identifier of the relationship.\n"]
  revision : revision option; [@ocaml.doc "The current revision number of the relationship.\n"]
  catalog : catalog option;
      [@ocaml.doc "The catalog identifier associated with the relationship.\n"]
  association_type : association_type option;
      [@ocaml.doc "The type of association for the relationship.\n"]
  program_management_account_id : program_management_account_id option;
      [@ocaml.doc "The identifier of the program management account.\n"]
  associated_account_id : account_id option;
      [@ocaml.doc "The AWS account ID associated in this relationship.\n"]
  display_name : relationship_display_name option;
      [@ocaml.doc "The display name of the relationship.\n"]
  sector : sector option; [@ocaml.doc "The business sector for the relationship.\n"]
  created_at : date_time option; [@ocaml.doc "The timestamp when the relationship was created.\n"]
  updated_at : date_time option;
      [@ocaml.doc "The timestamp when the relationship was last updated.\n"]
  start_date : date_time option; [@ocaml.doc "The start date of the relationship.\n"]
}
[@@ocaml.doc "Summary information about a partner relationship.\n"]

type nonrec relationship_summaries = relationship_summary list [@@ocaml.doc ""]

type nonrec list_relationships_response = {
  items : relationship_summaries option;
      [@ocaml.doc "List of relationships matching the criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc "Token for retrieving the next page of results, if available.\n"]
}
[@@ocaml.doc ""]

type nonrec list_relationships_sort_name = UPDATED_AT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_relationships_sort_base = {
  sort_order : sort_order; [@ocaml.doc "The sort order (ascending or descending).\n"]
  sort_by : list_relationships_sort_name; [@ocaml.doc "The field to sort by.\n"]
}
[@@ocaml.doc "Base sorting configuration for relationships.\n"]

type nonrec program_management_account_identifier_list = program_management_account_identifier list
[@@ocaml.doc ""]

type nonrec relationship_display_name_list = relationship_display_name list [@@ocaml.doc ""]

type nonrec list_relationships_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier to filter relationships.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
  associated_account_ids : account_id_list option;
      [@ocaml.doc "Filter by associated AWS account IDs.\n"]
  association_types : association_type_list option; [@ocaml.doc "Filter by association types.\n"]
  display_names : relationship_display_name_list option; [@ocaml.doc "Filter by display names.\n"]
  program_management_account_identifiers : program_management_account_identifier_list option;
      [@ocaml.doc "Filter by program management account identifiers.\n"]
  sort : list_relationships_sort_base option; [@ocaml.doc "Sorting options for the results.\n"]
  next_token : next_token option; [@ocaml.doc "Token for retrieving the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "Key-value pairs associated with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec taggable_arn = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : taggable_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to list tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : taggable_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to remove tags from.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The keys of the tags to remove from the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : taggable_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to tag.\n"]
  tags : tag_list; [@ocaml.doc "Key-value pairs to associate with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec program_management_account_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec reject_channel_handshake_detail = {
  id : channel_handshake_id option;
      [@ocaml.doc "The unique identifier of the rejected handshake.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the rejected handshake.\n"]
  status : handshake_status option; [@ocaml.doc "The current status of the rejected handshake.\n"]
}
[@@ocaml.doc "Contains details about a rejected channel handshake.\n"]

type nonrec reject_channel_handshake_response = {
  channel_handshake_detail : reject_channel_handshake_detail option;
      [@ocaml.doc "Details of the rejected channel handshake.\n"]
}
[@@ocaml.doc ""]

type nonrec reject_channel_handshake_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the handshake request.\n"]
  identifier : channel_handshake_identifier;
      [@ocaml.doc "The unique identifier of the channel handshake to reject.\n"]
}
[@@ocaml.doc ""]

type nonrec relationship_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec update_program_management_account_detail = {
  id : program_management_account_id option;
      [@ocaml.doc "The unique identifier of the updated program management account.\n"]
  arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated program management account.\n"]
  revision : revision option;
      [@ocaml.doc "The new revision number of the program management account.\n"]
  display_name : program_management_account_display_name option;
      [@ocaml.doc "The updated display name of the program management account.\n"]
}
[@@ocaml.doc "Contains details about an updated program management account.\n"]

type nonrec update_program_management_account_response = {
  program_management_account_detail : update_program_management_account_detail option;
      [@ocaml.doc "Details of the updated program management account.\n"]
}
[@@ocaml.doc ""]

type nonrec update_program_management_account_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the program management account.\n"]
  identifier : program_management_account_identifier;
      [@ocaml.doc "The unique identifier of the program management account to update.\n"]
  revision : revision option;
      [@ocaml.doc "The current revision number of the program management account.\n"]
  display_name : program_management_account_display_name option;
      [@ocaml.doc "The new display name for the program management account.\n"]
}
[@@ocaml.doc ""]

type nonrec update_relationship_detail = {
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the updated relationship.\n"]
  id : relationship_id option; [@ocaml.doc "The unique identifier of the updated relationship.\n"]
  revision : revision option; [@ocaml.doc "The new revision number of the relationship.\n"]
  display_name : relationship_display_name option;
      [@ocaml.doc "The updated display name of the relationship.\n"]
}
[@@ocaml.doc "Contains details about an updated relationship.\n"]

type nonrec update_relationship_response = {
  relationship_detail : update_relationship_detail option;
      [@ocaml.doc "Details of the updated relationship.\n"]
}
[@@ocaml.doc ""]

type nonrec update_relationship_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the relationship.\n"]
  identifier : relationship_identifier;
      [@ocaml.doc "The unique identifier of the relationship to update.\n"]
  program_management_account_identifier : program_management_account_identifier;
      [@ocaml.doc
        "The identifier of the program management account associated with the relationship.\n"]
  revision : revision option; [@ocaml.doc "The current revision number of the relationship.\n"]
  display_name : relationship_display_name option;
      [@ocaml.doc "The new display name for the relationship.\n"]
  requested_support_plan : support_plan option;
      [@ocaml.doc "The updated support plan for the relationship.\n"]
}
[@@ocaml.doc ""]
