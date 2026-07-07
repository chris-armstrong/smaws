open Types

val make_validation_exception_field :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  code:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_update_relationship_detail :
  ?display_name:relationship_display_name ->
  ?revision:revision ->
  ?id:relationship_id ->
  ?arn:arn ->
  unit ->
  update_relationship_detail

val make_update_relationship_response :
  ?relationship_detail:update_relationship_detail -> unit -> update_relationship_response

val make_resold_enterprise :
  ?charge_account_id:account_id ->
  tam_location:Smaws_Lib.Smithy_api.Types.string_ ->
  coverage:coverage ->
  unit ->
  resold_enterprise

val make_partner_led_support :
  ?provider:provider ->
  tam_location:Smaws_Lib.Smithy_api.Types.string_ ->
  coverage:coverage ->
  unit ->
  partner_led_support

val make_resold_unified_operations :
  ?charge_account_id:account_id ->
  tam_location:Smaws_Lib.Smithy_api.Types.string_ ->
  coverage:coverage ->
  unit ->
  resold_unified_operations

val make_update_relationship_request :
  ?requested_support_plan:support_plan ->
  ?display_name:relationship_display_name ->
  ?revision:revision ->
  program_management_account_identifier:program_management_account_identifier ->
  identifier:relationship_identifier ->
  catalog:catalog ->
  unit ->
  update_relationship_request

val make_update_program_management_account_detail :
  ?display_name:program_management_account_display_name ->
  ?revision:revision ->
  ?arn:arn ->
  ?id:program_management_account_id ->
  unit ->
  update_program_management_account_detail

val make_update_program_management_account_response :
  ?program_management_account_detail:update_program_management_account_detail ->
  unit ->
  update_program_management_account_response

val make_update_program_management_account_request :
  ?display_name:program_management_account_display_name ->
  ?revision:revision ->
  identifier:program_management_account_identifier ->
  catalog:catalog ->
  unit ->
  update_program_management_account_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:taggable_arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:taggable_arn -> unit -> tag_resource_request

val make_start_service_period_type_sort :
  sort_by:start_service_period_type_sort_name ->
  sort_order:sort_order ->
  unit ->
  start_service_period_type_sort

val make_start_service_period_type_filters :
  ?service_period_types:service_period_type_list -> unit -> start_service_period_type_filters

val make_start_service_period_payload :
  ?end_date:date_time ->
  ?minimum_notice_days:minimum_notice_days ->
  ?note:note ->
  service_period_type:service_period_type ->
  program_management_account_identifier:program_management_account_identifier ->
  unit ->
  start_service_period_payload

val make_start_service_period_handshake_detail :
  ?end_date:date_time ->
  ?start_date:date_time ->
  ?minimum_notice_days:minimum_notice_days ->
  ?service_period_type:service_period_type ->
  ?note:note ->
  unit ->
  start_service_period_handshake_detail

val make_revoke_service_period_type_sort :
  sort_by:revoke_service_period_type_sort_name ->
  sort_order:sort_order ->
  unit ->
  revoke_service_period_type_sort

val make_revoke_service_period_type_filters :
  ?service_period_types:service_period_type_list -> unit -> revoke_service_period_type_filters

val make_revoke_service_period_payload :
  ?note:note ->
  program_management_account_identifier:program_management_account_identifier ->
  unit ->
  revoke_service_period_payload

val make_revoke_service_period_handshake_detail :
  ?end_date:date_time ->
  ?start_date:date_time ->
  ?minimum_notice_days:minimum_notice_days ->
  ?service_period_type:service_period_type ->
  ?note:note ->
  unit ->
  revoke_service_period_handshake_detail

val make_relationship_summary :
  ?start_date:date_time ->
  ?updated_at:date_time ->
  ?created_at:date_time ->
  ?sector:sector ->
  ?display_name:relationship_display_name ->
  ?associated_account_id:account_id ->
  ?program_management_account_id:program_management_account_id ->
  ?association_type:association_type ->
  ?catalog:catalog ->
  ?revision:revision ->
  ?id:relationship_id ->
  ?arn:arn ->
  unit ->
  relationship_summary

val make_relationship_detail :
  ?start_date:date_time ->
  ?updated_at:date_time ->
  ?created_at:date_time ->
  ?sector:sector ->
  ?resale_account_model:resale_account_model ->
  ?display_name:relationship_display_name ->
  ?associated_account_id:account_id ->
  ?program_management_account_id:program_management_account_id ->
  ?association_type:association_type ->
  ?catalog:catalog ->
  ?revision:revision ->
  ?id:relationship_id ->
  ?arn:arn ->
  unit ->
  relationship_detail

val make_reject_channel_handshake_detail :
  ?status:handshake_status ->
  ?arn:arn ->
  ?id:channel_handshake_id ->
  unit ->
  reject_channel_handshake_detail

val make_reject_channel_handshake_response :
  ?channel_handshake_detail:reject_channel_handshake_detail ->
  unit ->
  reject_channel_handshake_response

val make_reject_channel_handshake_request :
  identifier:channel_handshake_identifier ->
  catalog:catalog ->
  unit ->
  reject_channel_handshake_request

val make_program_management_account_type_sort :
  sort_by:program_management_account_type_sort_name ->
  sort_order:sort_order ->
  unit ->
  program_management_account_type_sort

val make_program_management_account_type_filters :
  ?programs:program_list -> unit -> program_management_account_type_filters

val make_program_management_account_summary :
  ?status:program_management_account_status ->
  ?start_date:date_time ->
  ?updated_at:date_time ->
  ?created_at:date_time ->
  ?arn:arn ->
  ?account_id:account_id ->
  ?display_name:program_management_account_display_name ->
  ?program:program ->
  ?catalog:catalog ->
  ?revision:revision ->
  ?id:program_management_account_id ->
  unit ->
  program_management_account_summary

val make_program_management_account_handshake_detail :
  ?program:program -> unit -> program_management_account_handshake_detail

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_arn -> unit -> list_tags_for_resource_request

val make_list_relationships_sort_base :
  sort_by:list_relationships_sort_name ->
  sort_order:sort_order ->
  unit ->
  list_relationships_sort_base

val make_list_relationships_response :
  ?next_token:next_token -> ?items:relationship_summaries -> unit -> list_relationships_response

val make_list_relationships_request :
  ?next_token:next_token ->
  ?sort:list_relationships_sort_base ->
  ?program_management_account_identifiers:program_management_account_identifier_list ->
  ?display_names:relationship_display_name_list ->
  ?association_types:association_type_list ->
  ?associated_account_ids:account_id_list ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  catalog:catalog ->
  unit ->
  list_relationships_request

val make_list_program_management_accounts_sort_base :
  sort_by:list_program_management_accounts_sort_name ->
  sort_order:sort_order ->
  unit ->
  list_program_management_accounts_sort_base

val make_list_program_management_accounts_response :
  ?next_token:next_token ->
  ?items:program_management_account_summaries ->
  unit ->
  list_program_management_accounts_response

val make_list_program_management_accounts_request :
  ?next_token:next_token ->
  ?sort:list_program_management_accounts_sort_base ->
  ?statuses:program_management_account_status_list ->
  ?account_ids:account_id_list ->
  ?programs:program_list ->
  ?display_names:program_management_account_display_name_list ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  catalog:catalog ->
  unit ->
  list_program_management_accounts_request

val make_channel_handshake_summary :
  ?status:handshake_status ->
  ?updated_at:date_time ->
  ?created_at:date_time ->
  ?detail:handshake_detail ->
  ?associated_resource_id:associated_resource_id ->
  ?receiver_account_id:account_id ->
  ?sender_display_name:partner_profile_display_name ->
  ?sender_account_id:account_id ->
  ?owner_account_id:account_id ->
  ?handshake_type:handshake_type ->
  ?catalog:catalog ->
  ?arn:arn ->
  ?id:channel_handshake_id ->
  unit ->
  channel_handshake_summary

val make_list_channel_handshakes_response :
  ?next_token:next_token ->
  ?items:channel_handshake_summaries ->
  unit ->
  list_channel_handshakes_response

val make_list_channel_handshakes_request :
  ?next_token:next_token ->
  ?handshake_type_sort:list_channel_handshakes_type_sort ->
  ?handshake_type_filters:list_channel_handshakes_type_filters ->
  ?associated_resource_identifiers:associated_resource_identifier_list ->
  ?statuses:handshake_status_list ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  participant_type:participant_type ->
  catalog:catalog ->
  handshake_type:handshake_type ->
  unit ->
  list_channel_handshakes_request

val make_get_relationship_response :
  ?relationship_detail:relationship_detail -> unit -> get_relationship_response

val make_get_relationship_request :
  identifier:relationship_identifier ->
  program_management_account_identifier:program_management_account_identifier ->
  catalog:catalog ->
  unit ->
  get_relationship_request

val make_delete_relationship_response : unit -> unit

val make_delete_relationship_request :
  ?client_token:client_token ->
  program_management_account_identifier:program_management_account_identifier ->
  identifier:relationship_identifier ->
  catalog:catalog ->
  unit ->
  delete_relationship_request

val make_delete_program_management_account_response : unit -> unit

val make_delete_program_management_account_request :
  ?client_token:client_token ->
  identifier:program_management_account_identifier ->
  catalog:catalog ->
  unit ->
  delete_program_management_account_request

val make_create_relationship_detail :
  ?id:relationship_id -> ?arn:arn -> unit -> create_relationship_detail

val make_create_relationship_response :
  ?relationship_detail:create_relationship_detail -> unit -> create_relationship_response

val make_create_relationship_request :
  ?requested_support_plan:support_plan ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  ?resale_account_model:resale_account_model ->
  sector:sector ->
  display_name:relationship_display_name ->
  associated_account_id:account_id ->
  program_management_account_identifier:program_management_account_identifier ->
  association_type:association_type ->
  catalog:catalog ->
  unit ->
  create_relationship_request

val make_create_program_management_account_detail :
  ?arn:arn -> ?id:program_management_account_id -> unit -> create_program_management_account_detail

val make_create_program_management_account_response :
  ?program_management_account_detail:create_program_management_account_detail ->
  unit ->
  create_program_management_account_response

val make_create_program_management_account_request :
  ?tags:tag_list ->
  ?client_token:client_token ->
  account_id:account_id ->
  display_name:program_management_account_display_name ->
  program:program ->
  catalog:catalog ->
  unit ->
  create_program_management_account_request

val make_create_channel_handshake_detail :
  ?arn:arn -> ?id:channel_handshake_id -> unit -> create_channel_handshake_detail

val make_create_channel_handshake_response :
  ?channel_handshake_detail:create_channel_handshake_detail ->
  unit ->
  create_channel_handshake_response

val make_create_channel_handshake_request :
  ?tags:tag_list ->
  ?client_token:client_token ->
  ?payload:channel_handshake_payload ->
  associated_resource_identifier:associated_resource_identifier ->
  catalog:catalog ->
  handshake_type:handshake_type ->
  unit ->
  create_channel_handshake_request

val make_cancel_channel_handshake_detail :
  ?status:handshake_status ->
  ?arn:arn ->
  ?id:channel_handshake_id ->
  unit ->
  cancel_channel_handshake_detail

val make_cancel_channel_handshake_response :
  ?channel_handshake_detail:cancel_channel_handshake_detail ->
  unit ->
  cancel_channel_handshake_response

val make_cancel_channel_handshake_request :
  identifier:channel_handshake_identifier ->
  catalog:catalog ->
  unit ->
  cancel_channel_handshake_request

val make_accept_channel_handshake_detail :
  ?status:handshake_status ->
  ?arn:arn ->
  ?id:channel_handshake_id ->
  unit ->
  accept_channel_handshake_detail

val make_accept_channel_handshake_response :
  ?channel_handshake_detail:accept_channel_handshake_detail ->
  unit ->
  accept_channel_handshake_response

val make_accept_channel_handshake_request :
  identifier:channel_handshake_identifier ->
  catalog:catalog ->
  unit ->
  accept_channel_handshake_request
