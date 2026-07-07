open Types

let make_validation_exception_field ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~code:(code_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; code = code_; name = name_ } : validation_exception_field)

let make_update_relationship_detail ?display_name:(display_name_ : relationship_display_name option)
    ?revision:(revision_ : revision option) ?id:(id_ : relationship_id option)
    ?arn:(arn_ : arn option) () =
  ({ display_name = display_name_; revision = revision_; id = id_; arn = arn_ }
    : update_relationship_detail)

let make_update_relationship_response
    ?relationship_detail:(relationship_detail_ : update_relationship_detail option) () =
  ({ relationship_detail = relationship_detail_ } : update_relationship_response)

let make_resold_enterprise ?charge_account_id:(charge_account_id_ : account_id option)
    ~tam_location:(tam_location_ : Smaws_Lib.Smithy_api.Types.string_)
    ~coverage:(coverage_ : coverage) () =
  ({ charge_account_id = charge_account_id_; tam_location = tam_location_; coverage = coverage_ }
    : resold_enterprise)

let make_partner_led_support ?provider:(provider_ : provider option)
    ~tam_location:(tam_location_ : Smaws_Lib.Smithy_api.Types.string_)
    ~coverage:(coverage_ : coverage) () =
  ({ tam_location = tam_location_; provider = provider_; coverage = coverage_ }
    : partner_led_support)

let make_resold_unified_operations ?charge_account_id:(charge_account_id_ : account_id option)
    ~tam_location:(tam_location_ : Smaws_Lib.Smithy_api.Types.string_)
    ~coverage:(coverage_ : coverage) () =
  ({ charge_account_id = charge_account_id_; tam_location = tam_location_; coverage = coverage_ }
    : resold_unified_operations)

let make_update_relationship_request
    ?requested_support_plan:(requested_support_plan_ : support_plan option)
    ?display_name:(display_name_ : relationship_display_name option)
    ?revision:(revision_ : revision option)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier)
    ~identifier:(identifier_ : relationship_identifier) ~catalog:(catalog_ : catalog) () =
  ({
     requested_support_plan = requested_support_plan_;
     display_name = display_name_;
     revision = revision_;
     program_management_account_identifier = program_management_account_identifier_;
     identifier = identifier_;
     catalog = catalog_;
   }
    : update_relationship_request)

let make_update_program_management_account_detail
    ?display_name:(display_name_ : program_management_account_display_name option)
    ?revision:(revision_ : revision option) ?arn:(arn_ : arn option)
    ?id:(id_ : program_management_account_id option) () =
  ({ display_name = display_name_; revision = revision_; arn = arn_; id = id_ }
    : update_program_management_account_detail)

let make_update_program_management_account_response
    ?program_management_account_detail:
      (program_management_account_detail_ : update_program_management_account_detail option) () =
  ({ program_management_account_detail = program_management_account_detail_ }
    : update_program_management_account_response)

let make_update_program_management_account_request
    ?display_name:(display_name_ : program_management_account_display_name option)
    ?revision:(revision_ : revision option)
    ~identifier:(identifier_ : program_management_account_identifier) ~catalog:(catalog_ : catalog)
    () =
  ({
     display_name = display_name_;
     revision = revision_;
     identifier = identifier_;
     catalog = catalog_;
   }
    : update_program_management_account_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : taggable_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : taggable_arn)
    () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_start_service_period_type_sort ~sort_by:(sort_by_ : start_service_period_type_sort_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : start_service_period_type_sort)

let make_start_service_period_type_filters
    ?service_period_types:(service_period_types_ : service_period_type_list option) () =
  ({ service_period_types = service_period_types_ } : start_service_period_type_filters)

let make_start_service_period_payload ?end_date:(end_date_ : date_time option)
    ?minimum_notice_days:(minimum_notice_days_ : minimum_notice_days option)
    ?note:(note_ : note option) ~service_period_type:(service_period_type_ : service_period_type)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier) () =
  ({
     end_date = end_date_;
     minimum_notice_days = minimum_notice_days_;
     service_period_type = service_period_type_;
     note = note_;
     program_management_account_identifier = program_management_account_identifier_;
   }
    : start_service_period_payload)

let make_start_service_period_handshake_detail ?end_date:(end_date_ : date_time option)
    ?start_date:(start_date_ : date_time option)
    ?minimum_notice_days:(minimum_notice_days_ : minimum_notice_days option)
    ?service_period_type:(service_period_type_ : service_period_type option)
    ?note:(note_ : note option) () =
  ({
     end_date = end_date_;
     start_date = start_date_;
     minimum_notice_days = minimum_notice_days_;
     service_period_type = service_period_type_;
     note = note_;
   }
    : start_service_period_handshake_detail)

let make_revoke_service_period_type_sort ~sort_by:(sort_by_ : revoke_service_period_type_sort_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : revoke_service_period_type_sort)

let make_revoke_service_period_type_filters
    ?service_period_types:(service_period_types_ : service_period_type_list option) () =
  ({ service_period_types = service_period_types_ } : revoke_service_period_type_filters)

let make_revoke_service_period_payload ?note:(note_ : note option)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier) () =
  ({ note = note_; program_management_account_identifier = program_management_account_identifier_ }
    : revoke_service_period_payload)

let make_revoke_service_period_handshake_detail ?end_date:(end_date_ : date_time option)
    ?start_date:(start_date_ : date_time option)
    ?minimum_notice_days:(minimum_notice_days_ : minimum_notice_days option)
    ?service_period_type:(service_period_type_ : service_period_type option)
    ?note:(note_ : note option) () =
  ({
     end_date = end_date_;
     start_date = start_date_;
     minimum_notice_days = minimum_notice_days_;
     service_period_type = service_period_type_;
     note = note_;
   }
    : revoke_service_period_handshake_detail)

let make_relationship_summary ?start_date:(start_date_ : date_time option)
    ?updated_at:(updated_at_ : date_time option) ?created_at:(created_at_ : date_time option)
    ?sector:(sector_ : sector option)
    ?display_name:(display_name_ : relationship_display_name option)
    ?associated_account_id:(associated_account_id_ : account_id option)
    ?program_management_account_id:
      (program_management_account_id_ : program_management_account_id option)
    ?association_type:(association_type_ : association_type option)
    ?catalog:(catalog_ : catalog option) ?revision:(revision_ : revision option)
    ?id:(id_ : relationship_id option) ?arn:(arn_ : arn option) () =
  ({
     start_date = start_date_;
     updated_at = updated_at_;
     created_at = created_at_;
     sector = sector_;
     display_name = display_name_;
     associated_account_id = associated_account_id_;
     program_management_account_id = program_management_account_id_;
     association_type = association_type_;
     catalog = catalog_;
     revision = revision_;
     id = id_;
     arn = arn_;
   }
    : relationship_summary)

let make_relationship_detail ?start_date:(start_date_ : date_time option)
    ?updated_at:(updated_at_ : date_time option) ?created_at:(created_at_ : date_time option)
    ?sector:(sector_ : sector option)
    ?resale_account_model:(resale_account_model_ : resale_account_model option)
    ?display_name:(display_name_ : relationship_display_name option)
    ?associated_account_id:(associated_account_id_ : account_id option)
    ?program_management_account_id:
      (program_management_account_id_ : program_management_account_id option)
    ?association_type:(association_type_ : association_type option)
    ?catalog:(catalog_ : catalog option) ?revision:(revision_ : revision option)
    ?id:(id_ : relationship_id option) ?arn:(arn_ : arn option) () =
  ({
     start_date = start_date_;
     updated_at = updated_at_;
     created_at = created_at_;
     sector = sector_;
     resale_account_model = resale_account_model_;
     display_name = display_name_;
     associated_account_id = associated_account_id_;
     program_management_account_id = program_management_account_id_;
     association_type = association_type_;
     catalog = catalog_;
     revision = revision_;
     id = id_;
     arn = arn_;
   }
    : relationship_detail)

let make_reject_channel_handshake_detail ?status:(status_ : handshake_status option)
    ?arn:(arn_ : arn option) ?id:(id_ : channel_handshake_id option) () =
  ({ status = status_; arn = arn_; id = id_ } : reject_channel_handshake_detail)

let make_reject_channel_handshake_response
    ?channel_handshake_detail:(channel_handshake_detail_ : reject_channel_handshake_detail option)
    () =
  ({ channel_handshake_detail = channel_handshake_detail_ } : reject_channel_handshake_response)

let make_reject_channel_handshake_request ~identifier:(identifier_ : channel_handshake_identifier)
    ~catalog:(catalog_ : catalog) () =
  ({ identifier = identifier_; catalog = catalog_ } : reject_channel_handshake_request)

let make_program_management_account_type_sort
    ~sort_by:(sort_by_ : program_management_account_type_sort_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : program_management_account_type_sort)

let make_program_management_account_type_filters ?programs:(programs_ : program_list option) () =
  ({ programs = programs_ } : program_management_account_type_filters)

let make_program_management_account_summary
    ?status:(status_ : program_management_account_status option)
    ?start_date:(start_date_ : date_time option) ?updated_at:(updated_at_ : date_time option)
    ?created_at:(created_at_ : date_time option) ?arn:(arn_ : arn option)
    ?account_id:(account_id_ : account_id option)
    ?display_name:(display_name_ : program_management_account_display_name option)
    ?program:(program_ : program option) ?catalog:(catalog_ : catalog option)
    ?revision:(revision_ : revision option) ?id:(id_ : program_management_account_id option) () =
  ({
     status = status_;
     start_date = start_date_;
     updated_at = updated_at_;
     created_at = created_at_;
     arn = arn_;
     account_id = account_id_;
     display_name = display_name_;
     program = program_;
     catalog = catalog_;
     revision = revision_;
     id = id_;
   }
    : program_management_account_summary)

let make_program_management_account_handshake_detail ?program:(program_ : program option) () =
  ({ program = program_ } : program_management_account_handshake_detail)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_relationships_sort_base ~sort_by:(sort_by_ : list_relationships_sort_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : list_relationships_sort_base)

let make_list_relationships_response ?next_token:(next_token_ : next_token option)
    ?items:(items_ : relationship_summaries option) () =
  ({ next_token = next_token_; items = items_ } : list_relationships_response)

let make_list_relationships_request ?next_token:(next_token_ : next_token option)
    ?sort:(sort_ : list_relationships_sort_base option)
    ?program_management_account_identifiers:
      (program_management_account_identifiers_ : program_management_account_identifier_list option)
    ?display_names:(display_names_ : relationship_display_name_list option)
    ?association_types:(association_types_ : association_type_list option)
    ?associated_account_ids:(associated_account_ids_ : account_id_list option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~catalog:(catalog_ : catalog) () =
  ({
     next_token = next_token_;
     sort = sort_;
     program_management_account_identifiers = program_management_account_identifiers_;
     display_names = display_names_;
     association_types = association_types_;
     associated_account_ids = associated_account_ids_;
     max_results = max_results_;
     catalog = catalog_;
   }
    : list_relationships_request)

let make_list_program_management_accounts_sort_base
    ~sort_by:(sort_by_ : list_program_management_accounts_sort_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : list_program_management_accounts_sort_base)

let make_list_program_management_accounts_response ?next_token:(next_token_ : next_token option)
    ?items:(items_ : program_management_account_summaries option) () =
  ({ next_token = next_token_; items = items_ } : list_program_management_accounts_response)

let make_list_program_management_accounts_request ?next_token:(next_token_ : next_token option)
    ?sort:(sort_ : list_program_management_accounts_sort_base option)
    ?statuses:(statuses_ : program_management_account_status_list option)
    ?account_ids:(account_ids_ : account_id_list option) ?programs:(programs_ : program_list option)
    ?display_names:(display_names_ : program_management_account_display_name_list option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~catalog:(catalog_ : catalog) () =
  ({
     next_token = next_token_;
     sort = sort_;
     statuses = statuses_;
     account_ids = account_ids_;
     programs = programs_;
     display_names = display_names_;
     max_results = max_results_;
     catalog = catalog_;
   }
    : list_program_management_accounts_request)

let make_channel_handshake_summary ?status:(status_ : handshake_status option)
    ?updated_at:(updated_at_ : date_time option) ?created_at:(created_at_ : date_time option)
    ?detail:(detail_ : handshake_detail option)
    ?associated_resource_id:(associated_resource_id_ : associated_resource_id option)
    ?receiver_account_id:(receiver_account_id_ : account_id option)
    ?sender_display_name:(sender_display_name_ : partner_profile_display_name option)
    ?sender_account_id:(sender_account_id_ : account_id option)
    ?owner_account_id:(owner_account_id_ : account_id option)
    ?handshake_type:(handshake_type_ : handshake_type option) ?catalog:(catalog_ : catalog option)
    ?arn:(arn_ : arn option) ?id:(id_ : channel_handshake_id option) () =
  ({
     status = status_;
     updated_at = updated_at_;
     created_at = created_at_;
     detail = detail_;
     associated_resource_id = associated_resource_id_;
     receiver_account_id = receiver_account_id_;
     sender_display_name = sender_display_name_;
     sender_account_id = sender_account_id_;
     owner_account_id = owner_account_id_;
     handshake_type = handshake_type_;
     catalog = catalog_;
     arn = arn_;
     id = id_;
   }
    : channel_handshake_summary)

let make_list_channel_handshakes_response ?next_token:(next_token_ : next_token option)
    ?items:(items_ : channel_handshake_summaries option) () =
  ({ next_token = next_token_; items = items_ } : list_channel_handshakes_response)

let make_list_channel_handshakes_request ?next_token:(next_token_ : next_token option)
    ?handshake_type_sort:(handshake_type_sort_ : list_channel_handshakes_type_sort option)
    ?handshake_type_filters:(handshake_type_filters_ : list_channel_handshakes_type_filters option)
    ?associated_resource_identifiers:
      (associated_resource_identifiers_ : associated_resource_identifier_list option)
    ?statuses:(statuses_ : handshake_status_list option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~participant_type:(participant_type_ : participant_type) ~catalog:(catalog_ : catalog)
    ~handshake_type:(handshake_type_ : handshake_type) () =
  ({
     next_token = next_token_;
     handshake_type_sort = handshake_type_sort_;
     handshake_type_filters = handshake_type_filters_;
     associated_resource_identifiers = associated_resource_identifiers_;
     statuses = statuses_;
     max_results = max_results_;
     participant_type = participant_type_;
     catalog = catalog_;
     handshake_type = handshake_type_;
   }
    : list_channel_handshakes_request)

let make_get_relationship_response
    ?relationship_detail:(relationship_detail_ : relationship_detail option) () =
  ({ relationship_detail = relationship_detail_ } : get_relationship_response)

let make_get_relationship_request ~identifier:(identifier_ : relationship_identifier)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier)
    ~catalog:(catalog_ : catalog) () =
  ({
     identifier = identifier_;
     program_management_account_identifier = program_management_account_identifier_;
     catalog = catalog_;
   }
    : get_relationship_request)

let make_delete_relationship_response () = (() : unit)

let make_delete_relationship_request ?client_token:(client_token_ : client_token option)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier)
    ~identifier:(identifier_ : relationship_identifier) ~catalog:(catalog_ : catalog) () =
  ({
     client_token = client_token_;
     program_management_account_identifier = program_management_account_identifier_;
     identifier = identifier_;
     catalog = catalog_;
   }
    : delete_relationship_request)

let make_delete_program_management_account_response () = (() : unit)

let make_delete_program_management_account_request
    ?client_token:(client_token_ : client_token option)
    ~identifier:(identifier_ : program_management_account_identifier) ~catalog:(catalog_ : catalog)
    () =
  ({ client_token = client_token_; identifier = identifier_; catalog = catalog_ }
    : delete_program_management_account_request)

let make_create_relationship_detail ?id:(id_ : relationship_id option) ?arn:(arn_ : arn option) () =
  ({ id = id_; arn = arn_ } : create_relationship_detail)

let make_create_relationship_response
    ?relationship_detail:(relationship_detail_ : create_relationship_detail option) () =
  ({ relationship_detail = relationship_detail_ } : create_relationship_response)

let make_create_relationship_request
    ?requested_support_plan:(requested_support_plan_ : support_plan option)
    ?tags:(tags_ : tag_list option) ?client_token:(client_token_ : client_token option)
    ?resale_account_model:(resale_account_model_ : resale_account_model option)
    ~sector:(sector_ : sector) ~display_name:(display_name_ : relationship_display_name)
    ~associated_account_id:(associated_account_id_ : account_id)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier)
    ~association_type:(association_type_ : association_type) ~catalog:(catalog_ : catalog) () =
  ({
     requested_support_plan = requested_support_plan_;
     tags = tags_;
     client_token = client_token_;
     sector = sector_;
     resale_account_model = resale_account_model_;
     display_name = display_name_;
     associated_account_id = associated_account_id_;
     program_management_account_identifier = program_management_account_identifier_;
     association_type = association_type_;
     catalog = catalog_;
   }
    : create_relationship_request)

let make_create_program_management_account_detail ?arn:(arn_ : arn option)
    ?id:(id_ : program_management_account_id option) () =
  ({ arn = arn_; id = id_ } : create_program_management_account_detail)

let make_create_program_management_account_response
    ?program_management_account_detail:
      (program_management_account_detail_ : create_program_management_account_detail option) () =
  ({ program_management_account_detail = program_management_account_detail_ }
    : create_program_management_account_response)

let make_create_program_management_account_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option) ~account_id:(account_id_ : account_id)
    ~display_name:(display_name_ : program_management_account_display_name)
    ~program:(program_ : program) ~catalog:(catalog_ : catalog) () =
  ({
     tags = tags_;
     client_token = client_token_;
     account_id = account_id_;
     display_name = display_name_;
     program = program_;
     catalog = catalog_;
   }
    : create_program_management_account_request)

let make_create_channel_handshake_detail ?arn:(arn_ : arn option)
    ?id:(id_ : channel_handshake_id option) () =
  ({ arn = arn_; id = id_ } : create_channel_handshake_detail)

let make_create_channel_handshake_response
    ?channel_handshake_detail:(channel_handshake_detail_ : create_channel_handshake_detail option)
    () =
  ({ channel_handshake_detail = channel_handshake_detail_ } : create_channel_handshake_response)

let make_create_channel_handshake_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option)
    ?payload:(payload_ : channel_handshake_payload option)
    ~associated_resource_identifier:
      (associated_resource_identifier_ : associated_resource_identifier)
    ~catalog:(catalog_ : catalog) ~handshake_type:(handshake_type_ : handshake_type) () =
  ({
     tags = tags_;
     client_token = client_token_;
     payload = payload_;
     associated_resource_identifier = associated_resource_identifier_;
     catalog = catalog_;
     handshake_type = handshake_type_;
   }
    : create_channel_handshake_request)

let make_cancel_channel_handshake_detail ?status:(status_ : handshake_status option)
    ?arn:(arn_ : arn option) ?id:(id_ : channel_handshake_id option) () =
  ({ status = status_; arn = arn_; id = id_ } : cancel_channel_handshake_detail)

let make_cancel_channel_handshake_response
    ?channel_handshake_detail:(channel_handshake_detail_ : cancel_channel_handshake_detail option)
    () =
  ({ channel_handshake_detail = channel_handshake_detail_ } : cancel_channel_handshake_response)

let make_cancel_channel_handshake_request ~identifier:(identifier_ : channel_handshake_identifier)
    ~catalog:(catalog_ : catalog) () =
  ({ identifier = identifier_; catalog = catalog_ } : cancel_channel_handshake_request)

let make_accept_channel_handshake_detail ?status:(status_ : handshake_status option)
    ?arn:(arn_ : arn option) ?id:(id_ : channel_handshake_id option) () =
  ({ status = status_; arn = arn_; id = id_ } : accept_channel_handshake_detail)

let make_accept_channel_handshake_response
    ?channel_handshake_detail:(channel_handshake_detail_ : accept_channel_handshake_detail option)
    () =
  ({ channel_handshake_detail = channel_handshake_detail_ } : accept_channel_handshake_response)

let make_accept_channel_handshake_request ~identifier:(identifier_ : channel_handshake_identifier)
    ~catalog:(catalog_ : catalog) () =
  ({ identifier = identifier_; catalog = catalog_ } : accept_channel_handshake_request)
