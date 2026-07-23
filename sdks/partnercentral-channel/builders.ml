open Types

let make_validation_exception_field ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~code:(code_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ name = name_; code = code_; message = message_ } : validation_exception_field)

let make_accept_channel_handshake_detail ?id:(id_ : channel_handshake_id option)
    ?arn:(arn_ : arn option) ?status:(status_ : handshake_status option) () =
  ({ id = id_; arn = arn_; status = status_ } : accept_channel_handshake_detail)

let make_accept_channel_handshake_response
    ?channel_handshake_detail:(channel_handshake_detail_ : accept_channel_handshake_detail option)
    () =
  ({ channel_handshake_detail = channel_handshake_detail_ } : accept_channel_handshake_response)

let make_accept_channel_handshake_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : channel_handshake_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : accept_channel_handshake_request)

let make_cancel_channel_handshake_detail ?id:(id_ : channel_handshake_id option)
    ?arn:(arn_ : arn option) ?status:(status_ : handshake_status option) () =
  ({ id = id_; arn = arn_; status = status_ } : cancel_channel_handshake_detail)

let make_cancel_channel_handshake_response
    ?channel_handshake_detail:(channel_handshake_detail_ : cancel_channel_handshake_detail option)
    () =
  ({ channel_handshake_detail = channel_handshake_detail_ } : cancel_channel_handshake_response)

let make_cancel_channel_handshake_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : channel_handshake_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : cancel_channel_handshake_request)

let make_revoke_service_period_payload ?note:(note_ : note option)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier) () =
  ({ program_management_account_identifier = program_management_account_identifier_; note = note_ }
    : revoke_service_period_payload)

let make_start_service_period_payload ?note:(note_ : note option)
    ?minimum_notice_days:(minimum_notice_days_ : minimum_notice_days option)
    ?end_date:(end_date_ : date_time option)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier)
    ~service_period_type:(service_period_type_ : service_period_type) () =
  ({
     program_management_account_identifier = program_management_account_identifier_;
     note = note_;
     service_period_type = service_period_type_;
     minimum_notice_days = minimum_notice_days_;
     end_date = end_date_;
   }
    : start_service_period_payload)

let make_program_management_account_handshake_detail ?program:(program_ : program option) () =
  ({ program = program_ } : program_management_account_handshake_detail)

let make_revoke_service_period_handshake_detail ?note:(note_ : note option)
    ?service_period_type:(service_period_type_ : service_period_type option)
    ?minimum_notice_days:(minimum_notice_days_ : minimum_notice_days option)
    ?start_date:(start_date_ : date_time option) ?end_date:(end_date_ : date_time option) () =
  ({
     note = note_;
     service_period_type = service_period_type_;
     minimum_notice_days = minimum_notice_days_;
     start_date = start_date_;
     end_date = end_date_;
   }
    : revoke_service_period_handshake_detail)

let make_start_service_period_handshake_detail ?note:(note_ : note option)
    ?service_period_type:(service_period_type_ : service_period_type option)
    ?minimum_notice_days:(minimum_notice_days_ : minimum_notice_days option)
    ?start_date:(start_date_ : date_time option) ?end_date:(end_date_ : date_time option) () =
  ({
     note = note_;
     service_period_type = service_period_type_;
     minimum_notice_days = minimum_notice_days_;
     start_date = start_date_;
     end_date = end_date_;
   }
    : start_service_period_handshake_detail)

let make_channel_handshake_summary ?id:(id_ : channel_handshake_id option) ?arn:(arn_ : arn option)
    ?catalog:(catalog_ : catalog option) ?handshake_type:(handshake_type_ : handshake_type option)
    ?owner_account_id:(owner_account_id_ : account_id option)
    ?sender_account_id:(sender_account_id_ : account_id option)
    ?sender_display_name:(sender_display_name_ : partner_profile_display_name option)
    ?receiver_account_id:(receiver_account_id_ : account_id option)
    ?associated_resource_id:(associated_resource_id_ : associated_resource_id option)
    ?detail:(detail_ : handshake_detail option) ?created_at:(created_at_ : date_time option)
    ?updated_at:(updated_at_ : date_time option) ?status:(status_ : handshake_status option) () =
  ({
     id = id_;
     arn = arn_;
     catalog = catalog_;
     handshake_type = handshake_type_;
     owner_account_id = owner_account_id_;
     sender_account_id = sender_account_id_;
     sender_display_name = sender_display_name_;
     receiver_account_id = receiver_account_id_;
     associated_resource_id = associated_resource_id_;
     detail = detail_;
     created_at = created_at_;
     updated_at = updated_at_;
     status = status_;
   }
    : channel_handshake_summary)

let make_create_channel_handshake_detail ?id:(id_ : channel_handshake_id option)
    ?arn:(arn_ : arn option) () =
  ({ id = id_; arn = arn_ } : create_channel_handshake_detail)

let make_create_channel_handshake_response
    ?channel_handshake_detail:(channel_handshake_detail_ : create_channel_handshake_detail option)
    () =
  ({ channel_handshake_detail = channel_handshake_detail_ } : create_channel_handshake_response)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_channel_handshake_request ?payload:(payload_ : channel_handshake_payload option)
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tag_list option)
    ~handshake_type:(handshake_type_ : handshake_type) ~catalog:(catalog_ : catalog)
    ~associated_resource_identifier:
      (associated_resource_identifier_ : associated_resource_identifier) () =
  ({
     handshake_type = handshake_type_;
     catalog = catalog_;
     associated_resource_identifier = associated_resource_identifier_;
     payload = payload_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_channel_handshake_request)

let make_create_program_management_account_detail ?id:(id_ : program_management_account_id option)
    ?arn:(arn_ : arn option) () =
  ({ id = id_; arn = arn_ } : create_program_management_account_detail)

let make_create_program_management_account_response
    ?program_management_account_detail:
      (program_management_account_detail_ : create_program_management_account_detail option) () =
  ({ program_management_account_detail = program_management_account_detail_ }
    : create_program_management_account_response)

let make_create_program_management_account_request
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tag_list option)
    ~catalog:(catalog_ : catalog) ~program:(program_ : program)
    ~display_name:(display_name_ : program_management_account_display_name)
    ~account_id:(account_id_ : account_id) () =
  ({
     catalog = catalog_;
     program = program_;
     display_name = display_name_;
     account_id = account_id_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_program_management_account_request)

let make_create_relationship_detail ?arn:(arn_ : arn option) ?id:(id_ : relationship_id option) () =
  ({ arn = arn_; id = id_ } : create_relationship_detail)

let make_create_relationship_response
    ?relationship_detail:(relationship_detail_ : create_relationship_detail option) () =
  ({ relationship_detail = relationship_detail_ } : create_relationship_response)

let make_resold_unified_operations ?charge_account_id:(charge_account_id_ : account_id option)
    ~coverage:(coverage_ : coverage)
    ~tam_location:(tam_location_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ coverage = coverage_; tam_location = tam_location_; charge_account_id = charge_account_id_ }
    : resold_unified_operations)

let make_partner_led_support ?provider:(provider_ : provider option)
    ~coverage:(coverage_ : coverage)
    ~tam_location:(tam_location_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ coverage = coverage_; provider = provider_; tam_location = tam_location_ }
    : partner_led_support)

let make_resold_enterprise ?charge_account_id:(charge_account_id_ : account_id option)
    ~coverage:(coverage_ : coverage)
    ~tam_location:(tam_location_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ coverage = coverage_; tam_location = tam_location_; charge_account_id = charge_account_id_ }
    : resold_enterprise)

let make_create_relationship_request
    ?resale_account_model:(resale_account_model_ : resale_account_model option)
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tag_list option)
    ?requested_support_plan:(requested_support_plan_ : support_plan option)
    ~catalog:(catalog_ : catalog) ~association_type:(association_type_ : association_type)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier)
    ~associated_account_id:(associated_account_id_ : account_id)
    ~display_name:(display_name_ : relationship_display_name) ~sector:(sector_ : sector) () =
  ({
     catalog = catalog_;
     association_type = association_type_;
     program_management_account_identifier = program_management_account_identifier_;
     associated_account_id = associated_account_id_;
     display_name = display_name_;
     resale_account_model = resale_account_model_;
     sector = sector_;
     client_token = client_token_;
     tags = tags_;
     requested_support_plan = requested_support_plan_;
   }
    : create_relationship_request)

let make_delete_program_management_account_response () = (() : unit)

let make_delete_program_management_account_request
    ?client_token:(client_token_ : client_token option) ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : program_management_account_identifier) () =
  ({ catalog = catalog_; identifier = identifier_; client_token = client_token_ }
    : delete_program_management_account_request)

let make_delete_relationship_response () = (() : unit)

let make_delete_relationship_request ?client_token:(client_token_ : client_token option)
    ~catalog:(catalog_ : catalog) ~identifier:(identifier_ : relationship_identifier)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier) () =
  ({
     catalog = catalog_;
     identifier = identifier_;
     program_management_account_identifier = program_management_account_identifier_;
     client_token = client_token_;
   }
    : delete_relationship_request)

let make_relationship_detail ?arn:(arn_ : arn option) ?id:(id_ : relationship_id option)
    ?revision:(revision_ : revision option) ?catalog:(catalog_ : catalog option)
    ?association_type:(association_type_ : association_type option)
    ?program_management_account_id:
      (program_management_account_id_ : program_management_account_id option)
    ?associated_account_id:(associated_account_id_ : account_id option)
    ?display_name:(display_name_ : relationship_display_name option)
    ?resale_account_model:(resale_account_model_ : resale_account_model option)
    ?sector:(sector_ : sector option) ?created_at:(created_at_ : date_time option)
    ?updated_at:(updated_at_ : date_time option) ?start_date:(start_date_ : date_time option) () =
  ({
     arn = arn_;
     id = id_;
     revision = revision_;
     catalog = catalog_;
     association_type = association_type_;
     program_management_account_id = program_management_account_id_;
     associated_account_id = associated_account_id_;
     display_name = display_name_;
     resale_account_model = resale_account_model_;
     sector = sector_;
     created_at = created_at_;
     updated_at = updated_at_;
     start_date = start_date_;
   }
    : relationship_detail)

let make_get_relationship_response
    ?relationship_detail:(relationship_detail_ : relationship_detail option) () =
  ({ relationship_detail = relationship_detail_ } : get_relationship_response)

let make_get_relationship_request ~catalog:(catalog_ : catalog)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier)
    ~identifier:(identifier_ : relationship_identifier) () =
  ({
     catalog = catalog_;
     program_management_account_identifier = program_management_account_identifier_;
     identifier = identifier_;
   }
    : get_relationship_request)

let make_list_channel_handshakes_response ?items:(items_ : channel_handshake_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ items = items_; next_token = next_token_ } : list_channel_handshakes_response)

let make_program_management_account_type_sort ~sort_order:(sort_order_ : sort_order)
    ~sort_by:(sort_by_ : program_management_account_type_sort_name) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : program_management_account_type_sort)

let make_revoke_service_period_type_sort ~sort_order:(sort_order_ : sort_order)
    ~sort_by:(sort_by_ : revoke_service_period_type_sort_name) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : revoke_service_period_type_sort)

let make_start_service_period_type_sort ~sort_order:(sort_order_ : sort_order)
    ~sort_by:(sort_by_ : start_service_period_type_sort_name) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : start_service_period_type_sort)

let make_program_management_account_type_filters ?programs:(programs_ : program_list option) () =
  ({ programs = programs_ } : program_management_account_type_filters)

let make_revoke_service_period_type_filters
    ?service_period_types:(service_period_types_ : service_period_type_list option) () =
  ({ service_period_types = service_period_types_ } : revoke_service_period_type_filters)

let make_start_service_period_type_filters
    ?service_period_types:(service_period_types_ : service_period_type_list option) () =
  ({ service_period_types = service_period_types_ } : start_service_period_type_filters)

let make_list_channel_handshakes_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?statuses:(statuses_ : handshake_status_list option)
    ?associated_resource_identifiers:
      (associated_resource_identifiers_ : associated_resource_identifier_list option)
    ?handshake_type_filters:(handshake_type_filters_ : list_channel_handshakes_type_filters option)
    ?handshake_type_sort:(handshake_type_sort_ : list_channel_handshakes_type_sort option)
    ?next_token:(next_token_ : next_token option) ~handshake_type:(handshake_type_ : handshake_type)
    ~catalog:(catalog_ : catalog) ~participant_type:(participant_type_ : participant_type) () =
  ({
     handshake_type = handshake_type_;
     catalog = catalog_;
     participant_type = participant_type_;
     max_results = max_results_;
     statuses = statuses_;
     associated_resource_identifiers = associated_resource_identifiers_;
     handshake_type_filters = handshake_type_filters_;
     handshake_type_sort = handshake_type_sort_;
     next_token = next_token_;
   }
    : list_channel_handshakes_request)

let make_program_management_account_summary ?id:(id_ : program_management_account_id option)
    ?revision:(revision_ : revision option) ?catalog:(catalog_ : catalog option)
    ?program:(program_ : program option)
    ?display_name:(display_name_ : program_management_account_display_name option)
    ?account_id:(account_id_ : account_id option) ?arn:(arn_ : arn option)
    ?created_at:(created_at_ : date_time option) ?updated_at:(updated_at_ : date_time option)
    ?start_date:(start_date_ : date_time option)
    ?status:(status_ : program_management_account_status option) () =
  ({
     id = id_;
     revision = revision_;
     catalog = catalog_;
     program = program_;
     display_name = display_name_;
     account_id = account_id_;
     arn = arn_;
     created_at = created_at_;
     updated_at = updated_at_;
     start_date = start_date_;
     status = status_;
   }
    : program_management_account_summary)

let make_list_program_management_accounts_response
    ?items:(items_ : program_management_account_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ items = items_; next_token = next_token_ } : list_program_management_accounts_response)

let make_list_program_management_accounts_sort_base ~sort_order:(sort_order_ : sort_order)
    ~sort_by:(sort_by_ : list_program_management_accounts_sort_name) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : list_program_management_accounts_sort_base)

let make_list_program_management_accounts_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?display_names:(display_names_ : program_management_account_display_name_list option)
    ?programs:(programs_ : program_list option) ?account_ids:(account_ids_ : account_id_list option)
    ?statuses:(statuses_ : program_management_account_status_list option)
    ?sort:(sort_ : list_program_management_accounts_sort_base option)
    ?next_token:(next_token_ : next_token option) ~catalog:(catalog_ : catalog) () =
  ({
     catalog = catalog_;
     max_results = max_results_;
     display_names = display_names_;
     programs = programs_;
     account_ids = account_ids_;
     statuses = statuses_;
     sort = sort_;
     next_token = next_token_;
   }
    : list_program_management_accounts_request)

let make_relationship_summary ?arn:(arn_ : arn option) ?id:(id_ : relationship_id option)
    ?revision:(revision_ : revision option) ?catalog:(catalog_ : catalog option)
    ?association_type:(association_type_ : association_type option)
    ?program_management_account_id:
      (program_management_account_id_ : program_management_account_id option)
    ?associated_account_id:(associated_account_id_ : account_id option)
    ?display_name:(display_name_ : relationship_display_name option)
    ?sector:(sector_ : sector option) ?created_at:(created_at_ : date_time option)
    ?updated_at:(updated_at_ : date_time option) ?start_date:(start_date_ : date_time option) () =
  ({
     arn = arn_;
     id = id_;
     revision = revision_;
     catalog = catalog_;
     association_type = association_type_;
     program_management_account_id = program_management_account_id_;
     associated_account_id = associated_account_id_;
     display_name = display_name_;
     sector = sector_;
     created_at = created_at_;
     updated_at = updated_at_;
     start_date = start_date_;
   }
    : relationship_summary)

let make_list_relationships_response ?items:(items_ : relationship_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ items = items_; next_token = next_token_ } : list_relationships_response)

let make_list_relationships_sort_base ~sort_order:(sort_order_ : sort_order)
    ~sort_by:(sort_by_ : list_relationships_sort_name) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : list_relationships_sort_base)

let make_list_relationships_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?associated_account_ids:(associated_account_ids_ : account_id_list option)
    ?association_types:(association_types_ : association_type_list option)
    ?display_names:(display_names_ : relationship_display_name_list option)
    ?program_management_account_identifiers:
      (program_management_account_identifiers_ : program_management_account_identifier_list option)
    ?sort:(sort_ : list_relationships_sort_base option)
    ?next_token:(next_token_ : next_token option) ~catalog:(catalog_ : catalog) () =
  ({
     catalog = catalog_;
     max_results = max_results_;
     associated_account_ids = associated_account_ids_;
     association_types = association_types_;
     display_names = display_names_;
     program_management_account_identifiers = program_management_account_identifiers_;
     sort = sort_;
     next_token = next_token_;
   }
    : list_relationships_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : taggable_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : taggable_arn) ~tags:(tags_ : tag_list)
    () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_reject_channel_handshake_detail ?id:(id_ : channel_handshake_id option)
    ?arn:(arn_ : arn option) ?status:(status_ : handshake_status option) () =
  ({ id = id_; arn = arn_; status = status_ } : reject_channel_handshake_detail)

let make_reject_channel_handshake_response
    ?channel_handshake_detail:(channel_handshake_detail_ : reject_channel_handshake_detail option)
    () =
  ({ channel_handshake_detail = channel_handshake_detail_ } : reject_channel_handshake_response)

let make_reject_channel_handshake_request ~catalog:(catalog_ : catalog)
    ~identifier:(identifier_ : channel_handshake_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : reject_channel_handshake_request)

let make_update_program_management_account_detail ?id:(id_ : program_management_account_id option)
    ?arn:(arn_ : arn option) ?revision:(revision_ : revision option)
    ?display_name:(display_name_ : program_management_account_display_name option) () =
  ({ id = id_; arn = arn_; revision = revision_; display_name = display_name_ }
    : update_program_management_account_detail)

let make_update_program_management_account_response
    ?program_management_account_detail:
      (program_management_account_detail_ : update_program_management_account_detail option) () =
  ({ program_management_account_detail = program_management_account_detail_ }
    : update_program_management_account_response)

let make_update_program_management_account_request ?revision:(revision_ : revision option)
    ?display_name:(display_name_ : program_management_account_display_name option)
    ~catalog:(catalog_ : catalog) ~identifier:(identifier_ : program_management_account_identifier)
    () =
  ({
     catalog = catalog_;
     identifier = identifier_;
     revision = revision_;
     display_name = display_name_;
   }
    : update_program_management_account_request)

let make_update_relationship_detail ?arn:(arn_ : arn option) ?id:(id_ : relationship_id option)
    ?revision:(revision_ : revision option)
    ?display_name:(display_name_ : relationship_display_name option) () =
  ({ arn = arn_; id = id_; revision = revision_; display_name = display_name_ }
    : update_relationship_detail)

let make_update_relationship_response
    ?relationship_detail:(relationship_detail_ : update_relationship_detail option) () =
  ({ relationship_detail = relationship_detail_ } : update_relationship_response)

let make_update_relationship_request ?revision:(revision_ : revision option)
    ?display_name:(display_name_ : relationship_display_name option)
    ?requested_support_plan:(requested_support_plan_ : support_plan option)
    ~catalog:(catalog_ : catalog) ~identifier:(identifier_ : relationship_identifier)
    ~program_management_account_identifier:
      (program_management_account_identifier_ : program_management_account_identifier) () =
  ({
     catalog = catalog_;
     identifier = identifier_;
     program_management_account_identifier = program_management_account_identifier_;
     revision = revision_;
     display_name = display_name_;
     requested_support_plan = requested_support_plan_;
   }
    : update_relationship_request)
