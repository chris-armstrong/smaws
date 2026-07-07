open Types

let make_validation_exception_error
    ?field_name:(field_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~code:(code_ : validation_exception_error_code)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ code = code_; message = message_; field_name = field_name_ } : validation_exception_error)

let make_update_opportunity_response ~last_modified_date:(last_modified_date_ : date_time)
    ~id:(id_ : opportunity_identifier) () =
  ({ last_modified_date = last_modified_date_; id = id_ } : update_opportunity_response)

let make_address ?street_address:(street_address_ : address_part option)
    ?country_code:(country_code_ : country_code option)
    ?state_or_region:(state_or_region_ : address_part option)
    ?postal_code:(postal_code_ : address_part option) ?city:(city_ : address_part option) () =
  ({
     street_address = street_address_;
     country_code = country_code_;
     state_or_region = state_or_region_;
     postal_code = postal_code_;
     city = city_;
   }
    : address)

let make_account ?duns:(duns_ : duns_number option) ?address:(address_ : address option)
    ?aws_account_id:(aws_account_id_ : aws_account option)
    ?website_url:(website_url_ : website_url option)
    ?other_industry:(other_industry_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?industry:(industry_ : industry option) ~company_name:(company_name_ : name) () =
  ({
     duns = duns_;
     address = address_;
     aws_account_id = aws_account_id_;
     website_url = website_url_;
     company_name = company_name_;
     other_industry = other_industry_;
     industry = industry_;
   }
    : account)

let make_contact ?phone:(phone_ : phone_number option)
    ?business_title:(business_title_ : job_title option) ?last_name:(last_name_ : name option)
    ?first_name:(first_name_ : name option) ?email:(email_ : email option) () =
  ({
     phone = phone_;
     business_title = business_title_;
     last_name = last_name_;
     first_name = first_name_;
     email = email_;
   }
    : contact)

let make_customer ?contacts:(contacts_ : customer_contacts_list option)
    ?account:(account_ : account option) () =
  ({ contacts = contacts_; account = account_ } : customer)

let make_expected_customer_spend ?estimation_url:(estimation_url_ : estimation_url option)
    ?amount:(amount_ : amount option)
    ~target_company:(target_company_ : Smaws_Lib.Smithy_api.Types.string_)
    ~frequency:(frequency_ : payment_frequency) ~currency_code:(currency_code_ : currency_code) () =
  ({
     estimation_url = estimation_url_;
     target_company = target_company_;
     frequency = frequency_;
     currency_code = currency_code_;
     amount = amount_;
   }
    : expected_customer_spend)

let make_expected_contract_duration ~value:(value_ : Smaws_Lib.Smithy_api.Types.string_)
    ~term:(term_ : expected_contract_duration_term) () =
  ({ value = value_; term = term_ } : expected_contract_duration)

let make_project ?aws_partition:(aws_partition_ : aws_partition option)
    ?additional_comments:(additional_comments_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?other_solution_description:(other_solution_description_ : pii_string option)
    ?other_competitor_names:(other_competitor_names_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?competitor_name:(competitor_name_ : competitor_name option)
    ?sales_activities:(sales_activities_ : sales_activities option)
    ?related_opportunity_identifier:
      (related_opportunity_identifier_ : opportunity_identifier option)
    ?customer_use_case:(customer_use_case_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?customer_business_problem:(customer_business_problem_ : pii_string option)
    ?apn_programs:(apn_programs_ : apn_programs option) ?title:(title_ : pii_string option)
    ?expected_contract_duration:(expected_contract_duration_ : expected_contract_duration option)
    ?expected_customer_spend:(expected_customer_spend_ : expected_customer_spend_list option)
    ?delivery_models:(delivery_models_ : delivery_models option) () =
  ({
     aws_partition = aws_partition_;
     additional_comments = additional_comments_;
     other_solution_description = other_solution_description_;
     other_competitor_names = other_competitor_names_;
     competitor_name = competitor_name_;
     sales_activities = sales_activities_;
     related_opportunity_identifier = related_opportunity_identifier_;
     customer_use_case = customer_use_case_;
     customer_business_problem = customer_business_problem_;
     apn_programs = apn_programs_;
     title = title_;
     expected_contract_duration = expected_contract_duration_;
     expected_customer_spend = expected_customer_spend_;
     delivery_models = delivery_models_;
   }
    : project)

let make_marketing ?aws_funding_used:(aws_funding_used_ : aws_funding_used option)
    ?channels:(channels_ : channels option) ?use_cases:(use_cases_ : use_cases option)
    ?source:(source_ : marketing_source option)
    ?campaign_name:(campaign_name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     aws_funding_used = aws_funding_used_;
     channels = channels_;
     use_cases = use_cases_;
     source = source_;
     campaign_name = campaign_name_;
   }
    : marketing)

let make_monetary_value ~currency_code:(currency_code_ : currency_code)
    ~amount:(amount_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ currency_code = currency_code_; amount = amount_ } : monetary_value)

let make_software_revenue ?expiration_date:(expiration_date_ : date option)
    ?effective_date:(effective_date_ : date option) ?value:(value_ : monetary_value option)
    ?delivery_model:(delivery_model_ : revenue_model option) () =
  ({
     expiration_date = expiration_date_;
     effective_date = effective_date_;
     value = value_;
     delivery_model = delivery_model_;
   }
    : software_revenue)

let make_next_steps_history ~time:(time_ : date_time)
    ~value:(value_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ time = time_; value = value_ } : next_steps_history)

let make_life_cycle ?next_steps_history:(next_steps_history_ : next_steps_histories option)
    ?review_status_reason:(review_status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?review_comments:(review_comments_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?review_status:(review_status_ : review_status option)
    ?target_close_date:(target_close_date_ : date option)
    ?next_steps:(next_steps_ : pii_string option)
    ?closed_lost_reason:(closed_lost_reason_ : closed_lost_reason option)
    ?stage:(stage_ : stage option) () =
  ({
     next_steps_history = next_steps_history_;
     review_status_reason = review_status_reason_;
     review_comments = review_comments_;
     review_status = review_status_;
     target_close_date = target_close_date_;
     next_steps = next_steps_;
     closed_lost_reason = closed_lost_reason_;
     stage = stage_;
   }
    : life_cycle)

let make_update_opportunity_request ?life_cycle:(life_cycle_ : life_cycle option)
    ?software_revenue:(software_revenue_ : software_revenue option)
    ?marketing:(marketing_ : marketing option)
    ?opportunity_type:(opportunity_type_ : opportunity_type option)
    ?project:(project_ : project option) ?customer:(customer_ : customer option)
    ?partner_opportunity_identifier:
      (partner_opportunity_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?national_security:(national_security_ : national_security option)
    ?primary_needs_from_aws:(primary_needs_from_aws_ : primary_needs_from_aws option)
    ~identifier:(identifier_ : opportunity_identifier)
    ~last_modified_date:(last_modified_date_ : date_time) ~catalog:(catalog_ : catalog_identifier)
    () =
  ({
     life_cycle = life_cycle_;
     identifier = identifier_;
     last_modified_date = last_modified_date_;
     software_revenue = software_revenue_;
     marketing = marketing_;
     opportunity_type = opportunity_type_;
     project = project_;
     customer = customer_;
     partner_opportunity_identifier = partner_opportunity_identifier_;
     national_security = national_security_;
     primary_needs_from_aws = primary_needs_from_aws_;
     catalog = catalog_;
   }
    : update_opportunity_request)

let make_address_summary ?country_code:(country_code_ : country_code option)
    ?state_or_region:(state_or_region_ : address_part option)
    ?postal_code:(postal_code_ : address_part option) ?city:(city_ : address_part option) () =
  ({
     country_code = country_code_;
     state_or_region = state_or_region_;
     postal_code = postal_code_;
     city = city_;
   }
    : address_summary)

let make_lead_customer ?market_segment:(market_segment_ : market_segment option)
    ?aws_maturity:(aws_maturity_ : aws_maturity option)
    ?website_url:(website_url_ : company_website_url option) ?industry:(industry_ : industry option)
    ~address:(address_ : address_summary) ~company_name:(company_name_ : company_name) () =
  ({
     market_segment = market_segment_;
     aws_maturity = aws_maturity_;
     address = address_;
     website_url = website_url_;
     company_name = company_name_;
     industry = industry_;
   }
    : lead_customer)

let make_lead_contact ?phone:(phone_ : phone_number option) ~last_name:(last_name_ : name)
    ~first_name:(first_name_ : name) ~email:(email_ : email)
    ~business_title:(business_title_ : job_title) () =
  ({
     phone = phone_;
     last_name = last_name_;
     first_name = first_name_;
     email = email_;
     business_title = business_title_;
   }
    : lead_contact)

let make_lead_interaction
    ?business_problem:(business_problem_ : engagement_customer_business_problem option)
    ?interaction_date:(interaction_date_ : date_time option)
    ?usecase:(usecase_ : engagement_use_case option) ~contact:(contact_ : lead_contact)
    ~customer_action:(customer_action_ : customer_action)
    ~source_name:(source_name_ : lead_source_name) ~source_id:(source_id_ : lead_source_id)
    ~source_type:(source_type_ : lead_source_type) () =
  ({
     contact = contact_;
     business_problem = business_problem_;
     customer_action = customer_action_;
     interaction_date = interaction_date_;
     usecase = usecase_;
     source_name = source_name_;
     source_id = source_id_;
     source_type = source_type_;
   }
    : lead_interaction)

let make_lead_insights
    ?lead_readiness_score:(lead_readiness_score_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ lead_readiness_score = lead_readiness_score_ } : lead_insights)

let make_update_lead_context ?insights:(insights_ : lead_insights option)
    ?interaction:(interaction_ : lead_interaction option)
    ?qualification_status:(qualification_status_ : lead_qualification_status option)
    ~customer:(customer_ : lead_customer) () =
  ({
     insights = insights_;
     interaction = interaction_;
     customer = customer_;
     qualification_status = qualification_status_;
   }
    : update_lead_context)

let make_update_engagement_context_response
    ~context_id:(context_id_ : engagement_context_identifier)
    ~engagement_last_modified_at:(engagement_last_modified_at_ : date_time)
    ~engagement_arn:(engagement_arn_ : engagement_arn)
    ~engagement_id:(engagement_id_ : engagement_identifier) () =
  ({
     context_id = context_id_;
     engagement_last_modified_at = engagement_last_modified_at_;
     engagement_arn = engagement_arn_;
     engagement_id = engagement_id_;
   }
    : update_engagement_context_response)

let make_engagement_customer ~country_code:(country_code_ : country_code)
    ~website_url:(website_url_ : company_website_url) ~company_name:(company_name_ : company_name)
    ~industry:(industry_ : industry) () =
  ({
     country_code = country_code_;
     website_url = website_url_;
     company_name = company_name_;
     industry = industry_;
   }
    : engagement_customer)

let make_engagement_customer_project_details
    ~target_completion_date:(target_completion_date_ : Smaws_Lib.Smithy_api.Types.string_)
    ~business_problem:(business_problem_ : engagement_customer_business_problem)
    ~title:(title_ : engagement_customer_project_title) () =
  ({
     target_completion_date = target_completion_date_;
     business_problem = business_problem_;
     title = title_;
   }
    : engagement_customer_project_details)

let make_customer_projects_context ?project:(project_ : engagement_customer_project_details option)
    ?customer:(customer_ : engagement_customer option) () =
  ({ project = project_; customer = customer_ } : customer_projects_context)

let make_prospecting_result_customer
    ?public_profile_summary:(public_profile_summary_ : prospecting_public_profile_summary option)
    ?eligible_programs:(eligible_programs_ : eligible_programs_list option)
    ?company_size:(company_size_ : prospecting_company_size option)
    ?segment:(segment_ : prospecting_segment option)
    ?sub_industry:(sub_industry_ : prospecting_sub_industry option)
    ?industry:(industry_ : industry option) ?country:(country_ : country_code option)
    ?sub_region:(sub_region_ : prospecting_sub_region option)
    ?region:(region_ : prospecting_region option) ?geo:(geo_ : prospecting_geo option)
    ?account_name:(account_name_ : prospecting_account_name option) () =
  ({
     public_profile_summary = public_profile_summary_;
     eligible_programs = eligible_programs_;
     company_size = company_size_;
     segment = segment_;
     sub_industry = sub_industry_;
     industry = industry_;
     country = country_;
     sub_region = sub_region_;
     region = region_;
     geo = geo_;
     account_name = account_name_;
   }
    : prospecting_result_customer)

let make_prospecting_insights
    ?solution_sub_category:(solution_sub_category_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?solution_category:(solution_category_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?solution_score:(solution_score_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?marketplace_engagement_score:(marketplace_engagement_score_ : engagement_score_level option) ()
    =
  ({
     solution_sub_category = solution_sub_category_;
     solution_category = solution_category_;
     solution_score = solution_score_;
     marketplace_engagement_score = marketplace_engagement_score_;
   }
    : prospecting_insights)

let make_prospecting_result_aws ?insights:(insights_ : prospecting_insights option)
    ?customer:(customer_ : prospecting_result_customer option)
    ?task_name:(task_name_ : task_name option) ?task_arn:(task_arn_ : task_arn option)
    ?task_id:(task_id_ : prospecting_task_identifier option)
    ?end_time:(end_time_ : date_time option) ?start_time:(start_time_ : date_time option) () =
  ({
     insights = insights_;
     customer = customer_;
     task_name = task_name_;
     task_arn = task_arn_;
     task_id = task_id_;
     end_time = end_time_;
     start_time = start_time_;
   }
    : prospecting_result_aws)

let make_update_engagement_context_request ~payload:(payload_ : update_engagement_context_payload)
    ~type_:(type__ : engagement_context_type)
    ~engagement_last_modified_at:(engagement_last_modified_at_ : date_time)
    ~context_identifier:(context_identifier_ : engagement_context_identifier)
    ~engagement_identifier:(engagement_identifier_ : engagement_arn_or_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     payload = payload_;
     type_ = type__;
     engagement_last_modified_at = engagement_last_modified_at_;
     context_identifier = context_identifier_;
     engagement_identifier = engagement_identifier_;
     catalog = catalog_;
   }
    : update_engagement_context_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_target_close_date_filter
    ?before_target_close_date:(before_target_close_date_ : date option)
    ?after_target_close_date:(after_target_close_date_ : date option) () =
  ({
     before_target_close_date = before_target_close_date_;
     after_target_close_date = after_target_close_date_;
   }
    : target_close_date_filter)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_submit_opportunity_request ?visibility:(visibility_ : visibility option)
    ~involvement_type:(involvement_type_ : sales_involvement_type)
    ~identifier:(identifier_ : opportunity_identifier) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     visibility = visibility_;
     involvement_type = involvement_type_;
     identifier = identifier_;
     catalog = catalog_;
   }
    : submit_opportunity_request)

let make_stop_resource_snapshot_job_request
    ~resource_snapshot_job_identifier:
      (resource_snapshot_job_identifier_ : resource_snapshot_job_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ resource_snapshot_job_identifier = resource_snapshot_job_identifier_; catalog = catalog_ }
    : stop_resource_snapshot_job_request)

let make_start_resource_snapshot_job_request
    ~resource_snapshot_job_identifier:
      (resource_snapshot_job_identifier_ : resource_snapshot_job_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ resource_snapshot_job_identifier = resource_snapshot_job_identifier_; catalog = catalog_ }
    : start_resource_snapshot_job_request)

let make_start_prospecting_from_engagement_task_response
    ?task_arn:(task_arn_ : prospecting_task_arn option)
    ?task_id:(task_id_ : prospecting_task_identifier option)
    ?reason_code:(reason_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~task_status:(task_status_ : prospecting_task_status) ~start_time:(start_time_ : date_time)
    ~task_name:(task_name_ : task_name) ~identifiers:(identifiers_ : engagement_identifier_list) ()
    =
  ({
     task_status = task_status_;
     task_arn = task_arn_;
     task_id = task_id_;
     start_time = start_time_;
     reason_code = reason_code_;
     message = message_;
     task_name = task_name_;
     identifiers = identifiers_;
   }
    : start_prospecting_from_engagement_task_response)

let make_start_prospecting_from_engagement_task_request ~client_token:(client_token_ : client_token)
    ~task_name:(task_name_ : task_name) ~identifiers:(identifiers_ : engagement_identifier_list)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     client_token = client_token_;
     task_name = task_name_;
     identifiers = identifiers_;
     catalog = catalog_;
   }
    : start_prospecting_from_engagement_task_request)

let make_start_opportunity_from_engagement_task_response
    ?context_id:(context_id_ : context_identifier option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?reason_code:(reason_code_ : reason_code option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_status:(task_status_ : task_status option) ?start_time:(start_time_ : date_time option)
    ?task_arn:(task_arn_ : task_arn option) ?task_id:(task_id_ : task_identifier option) () =
  ({
     context_id = context_id_;
     engagement_id = engagement_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     opportunity_id = opportunity_id_;
     reason_code = reason_code_;
     message = message_;
     task_status = task_status_;
     start_time = start_time_;
     task_arn = task_arn_;
     task_id = task_id_;
   }
    : start_opportunity_from_engagement_task_response)

let make_start_opportunity_from_engagement_task_request ?tags:(tags_ : tag_list option)
    ~context_identifier:(context_identifier_ : context_identifier)
    ~identifier:(identifier_ : engagement_arn_or_identifier)
    ~client_token:(client_token_ : client_token) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     tags = tags_;
     context_identifier = context_identifier_;
     identifier = identifier_;
     client_token = client_token_;
     catalog = catalog_;
   }
    : start_opportunity_from_engagement_task_request)

let make_start_engagement_from_opportunity_task_response
    ?engagement_invitation_id:(engagement_invitation_id_ : engagement_invitation_identifier option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?reason_code:(reason_code_ : reason_code option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_status:(task_status_ : task_status option) ?start_time:(start_time_ : date_time option)
    ?task_arn:(task_arn_ : task_arn option) ?task_id:(task_id_ : task_identifier option) () =
  ({
     engagement_invitation_id = engagement_invitation_id_;
     engagement_id = engagement_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     opportunity_id = opportunity_id_;
     reason_code = reason_code_;
     message = message_;
     task_status = task_status_;
     start_time = start_time_;
     task_arn = task_arn_;
     task_id = task_id_;
   }
    : start_engagement_from_opportunity_task_response)

let make_aws_submission ?visibility:(visibility_ : visibility option)
    ~involvement_type:(involvement_type_ : sales_involvement_type) () =
  ({ visibility = visibility_; involvement_type = involvement_type_ } : aws_submission)

let make_start_engagement_from_opportunity_task_request ?tags:(tags_ : tag_list option)
    ~aws_submission:(aws_submission_ : aws_submission)
    ~identifier:(identifier_ : opportunity_identifier) ~client_token:(client_token_ : client_token)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     tags = tags_;
     aws_submission = aws_submission_;
     identifier = identifier_;
     client_token = client_token_;
     catalog = catalog_;
   }
    : start_engagement_from_opportunity_task_request)

let make_start_engagement_by_accepting_invitation_task_response
    ?engagement_invitation_id:(engagement_invitation_id_ : engagement_invitation_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?reason_code:(reason_code_ : reason_code option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_status:(task_status_ : task_status option) ?start_time:(start_time_ : date_time option)
    ?task_arn:(task_arn_ : task_arn option) ?task_id:(task_id_ : task_identifier option) () =
  ({
     engagement_invitation_id = engagement_invitation_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     opportunity_id = opportunity_id_;
     reason_code = reason_code_;
     message = message_;
     task_status = task_status_;
     start_time = start_time_;
     task_arn = task_arn_;
     task_id = task_id_;
   }
    : start_engagement_by_accepting_invitation_task_response)

let make_start_engagement_by_accepting_invitation_task_request ?tags:(tags_ : tag_list option)
    ~identifier:(identifier_ : engagement_invitation_arn_or_identifier)
    ~client_token:(client_token_ : client_token) ~catalog:(catalog_ : catalog_identifier) () =
  ({ tags = tags_; identifier = identifier_; client_token = client_token_; catalog = catalog_ }
    : start_engagement_by_accepting_invitation_task_request)

let make_sort_object ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_by option) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : sort_object)

let make_solution_sort ~sort_by:(sort_by_ : solution_sort_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : solution_sort)

let make_solution_base
    ?aws_marketplace_solution_arn:
      (aws_marketplace_solution_arn_ : aws_marketplace_solution_arn option)
    ?arn:(arn_ : solution_arn option) ~created_date:(created_date_ : date_time)
    ~category:(category_ : Smaws_Lib.Smithy_api.Types.string_) ~status:(status_ : solution_status)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) ~id:(id_ : solution_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     aws_marketplace_solution_arn = aws_marketplace_solution_arn_;
     created_date = created_date_;
     category = category_;
     status = status_;
     name = name_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : solution_base)

let make_sender_contact ?phone:(phone_ : phone_number option)
    ?business_title:(business_title_ : job_title option) ?last_name:(last_name_ : name option)
    ?first_name:(first_name_ : name option) ~email:(email_ : sender_contact_email) () =
  ({
     phone = phone_;
     business_title = business_title_;
     last_name = last_name_;
     first_name = first_name_;
     email = email_;
   }
    : sender_contact)

let make_resource_snapshot_summary ?created_by:(created_by_ : aws_account option)
    ?resource_snapshot_template_name:
      (resource_snapshot_template_name_ : resource_template_name option)
    ?resource_id:(resource_id_ : resource_identifier option)
    ?resource_type:(resource_type_ : resource_type option)
    ?revision:(revision_ : resource_snapshot_revision option)
    ?arn:(arn_ : resource_snapshot_arn option) () =
  ({
     created_by = created_by_;
     resource_snapshot_template_name = resource_snapshot_template_name_;
     resource_id = resource_id_;
     resource_type = resource_type_;
     revision = revision_;
     arn = arn_;
   }
    : resource_snapshot_summary)

let make_life_cycle_for_view ?next_steps:(next_steps_ : pii_string option)
    ?stage:(stage_ : stage option) ?review_status:(review_status_ : review_status option)
    ?target_close_date:(target_close_date_ : date option) () =
  ({
     next_steps = next_steps_;
     stage = stage_;
     review_status = review_status_;
     target_close_date = target_close_date_;
   }
    : life_cycle_for_view)

let make_project_view ?other_solution_description:(other_solution_description_ : pii_string option)
    ?sales_activities:(sales_activities_ : sales_activities option)
    ?customer_use_case:(customer_use_case_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?expected_contract_duration:(expected_contract_duration_ : expected_contract_duration option)
    ?expected_customer_spend:(expected_customer_spend_ : expected_customer_spend_list option)
    ?delivery_models:(delivery_models_ : delivery_models option) () =
  ({
     other_solution_description = other_solution_description_;
     sales_activities = sales_activities_;
     customer_use_case = customer_use_case_;
     expected_contract_duration = expected_contract_duration_;
     expected_customer_spend = expected_customer_spend_;
     delivery_models = delivery_models_;
   }
    : project_view)

let make_related_entity_identifiers
    ?aws_marketplace_products:
      (aws_marketplace_products_ : aws_marketplace_product_identifiers option)
    ?aws_marketplace_solutions:
      (aws_marketplace_solutions_ : aws_marketplace_solution_identifiers option)
    ?aws_products:(aws_products_ : aws_product_identifiers option)
    ?solutions:(solutions_ : solution_identifiers option)
    ?aws_marketplace_offer_sets:
      (aws_marketplace_offer_sets_ : aws_marketplace_offer_set_identifiers option)
    ?aws_marketplace_offers:(aws_marketplace_offers_ : aws_marketplace_offer_identifiers option) ()
    =
  ({
     aws_marketplace_products = aws_marketplace_products_;
     aws_marketplace_solutions = aws_marketplace_solutions_;
     aws_products = aws_products_;
     solutions = solutions_;
     aws_marketplace_offer_sets = aws_marketplace_offer_sets_;
     aws_marketplace_offers = aws_marketplace_offers_;
   }
    : related_entity_identifiers)

let make_opportunity_summary_view
    ?related_entity_identifiers:(related_entity_identifiers_ : related_entity_identifiers option)
    ?project:(project_ : project_view option) ?customer:(customer_ : customer option)
    ?primary_needs_from_aws:(primary_needs_from_aws_ : primary_needs_from_aws option)
    ?opportunity_team:(opportunity_team_ : partner_opportunity_team_members_list option)
    ?lifecycle:(lifecycle_ : life_cycle_for_view option)
    ?opportunity_type:(opportunity_type_ : opportunity_type option) () =
  ({
     related_entity_identifiers = related_entity_identifiers_;
     project = project_;
     customer = customer_;
     primary_needs_from_aws = primary_needs_from_aws_;
     opportunity_team = opportunity_team_;
     lifecycle = lifecycle_;
     opportunity_type = opportunity_type_;
   }
    : opportunity_summary_view)

let make_profile_next_steps_history ~time:(time_ : date_time)
    ~value:(value_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ time = time_; value = value_ } : profile_next_steps_history)

let make_aws_opportunity_life_cycle
    ?next_steps_history:(next_steps_history_ : profile_next_steps_histories option)
    ?next_steps:(next_steps_ : pii_string option) ?stage:(stage_ : aws_opportunity_stage option)
    ?closed_lost_reason:(closed_lost_reason_ : aws_closed_lost_reason option)
    ?target_close_date:(target_close_date_ : date option) () =
  ({
     next_steps_history = next_steps_history_;
     next_steps = next_steps_;
     stage = stage_;
     closed_lost_reason = closed_lost_reason_;
     target_close_date = target_close_date_;
   }
    : aws_opportunity_life_cycle)

let make_aws_team_member ?business_title:(business_title_ : aws_member_business_title option)
    ?last_name:(last_name_ : name option) ?first_name:(first_name_ : name option)
    ?email:(email_ : email option) () =
  ({
     business_title = business_title_;
     last_name = last_name_;
     first_name = first_name_;
     email = email_;
   }
    : aws_team_member)

let make_aws_product_optimization ~savings_amount:(savings_amount_ : monetary_amount)
    ~description:(description_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ savings_amount = savings_amount_; description = description_ } : aws_product_optimization)

let make_aws_product_details
    ?potential_savings_amount:(potential_savings_amount_ : monetary_amount option)
    ?optimized_amount:(optimized_amount_ : monetary_amount option)
    ?amount:(amount_ : monetary_amount option)
    ?service_code:(service_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~optimizations:(optimizations_ : aws_product_optimizations_list)
    ~categories:(categories_ : string_list)
    ~product_code:(product_code_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     optimizations = optimizations_;
     potential_savings_amount = potential_savings_amount_;
     optimized_amount = optimized_amount_;
     amount = amount_;
     categories = categories_;
     service_code = service_code_;
     product_code = product_code_;
   }
    : aws_product_details)

let make_aws_product_insights
    ?total_potential_savings_amount:(total_potential_savings_amount_ : monetary_amount option)
    ?total_optimized_amount:(total_optimized_amount_ : monetary_amount option)
    ?total_amount:(total_amount_ : monetary_amount option)
    ~aws_products:(aws_products_ : aws_products_list)
    ~total_amount_by_category:(total_amount_by_category_ : amount_map)
    ~frequency:(frequency_ : payment_frequency) ~currency_code:(currency_code_ : currency_code) () =
  ({
     aws_products = aws_products_;
     total_amount_by_category = total_amount_by_category_;
     total_potential_savings_amount = total_potential_savings_amount_;
     total_optimized_amount = total_optimized_amount_;
     total_amount = total_amount_;
     frequency = frequency_;
     currency_code = currency_code_;
   }
    : aws_product_insights)

let make_aws_products_spend_insights_by_source ?aw_s:(aw_s_ : aws_product_insights option)
    ?partner:(partner_ : aws_product_insights option) () =
  ({ aw_s = aw_s_; partner = partner_ } : aws_products_spend_insights_by_source)

let make_opportunity_quality ?trend:(trend_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?score:(score_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ trend = trend_; score = score_ } : opportunity_quality)

let make_recommendation ?attributes:(attributes_ : recommendation_attribute_map option)
    ~details:(details_ : Smaws_Lib.Smithy_api.Types.string_)
    ~type_:(type__ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ attributes = attributes_; details = details_; type_ = type__ } : recommendation)

let make_aws_opportunity_insights ?recommendations:(recommendations_ : recommendation_list option)
    ?opportunity_quality:(opportunity_quality_ : opportunity_quality option)
    ?aws_products_spend_insights_by_source:
      (aws_products_spend_insights_by_source_ : aws_products_spend_insights_by_source option)
    ?engagement_score:(engagement_score_ : engagement_score option)
    ?next_best_actions:(next_best_actions_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     recommendations = recommendations_;
     opportunity_quality = opportunity_quality_;
     aws_products_spend_insights_by_source = aws_products_spend_insights_by_source_;
     engagement_score = engagement_score_;
     next_best_actions = next_best_actions_;
   }
    : aws_opportunity_insights)

let make_aws_opportunity_related_entities
    ?aws_marketplace_products:
      (aws_marketplace_products_ : aws_marketplace_product_identifiers option)
    ?aws_marketplace_solutions:
      (aws_marketplace_solutions_ : aws_marketplace_solution_identifiers option)
    ?solutions:(solutions_ : solution_identifiers option)
    ?aws_products:(aws_products_ : aws_product_identifiers option) () =
  ({
     aws_marketplace_products = aws_marketplace_products_;
     aws_marketplace_solutions = aws_marketplace_solutions_;
     solutions = solutions_;
     aws_products = aws_products_;
   }
    : aws_opportunity_related_entities)

let make_aws_opportunity_customer ?contacts:(contacts_ : customer_contacts_list option) () =
  ({ contacts = contacts_ } : aws_opportunity_customer)

let make_aws_opportunity_project ?aws_partition:(aws_partition_ : aws_partition option)
    ?expected_customer_spend:(expected_customer_spend_ : expected_customer_spend_list option) () =
  ({ aws_partition = aws_partition_; expected_customer_spend = expected_customer_spend_ }
    : aws_opportunity_project)

let make_aws_opportunity_summary_full_view
    ?cosell_motion:(cosell_motion_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?project:(project_ : aws_opportunity_project option)
    ?customer:(customer_ : aws_opportunity_customer option)
    ?related_entity_ids:(related_entity_ids_ : aws_opportunity_related_entities option)
    ?involvement_type_change_reason:
      (involvement_type_change_reason_ : involvement_type_change_reason option)
    ?insights:(insights_ : aws_opportunity_insights option)
    ?opportunity_team:(opportunity_team_ : aws_opportunity_team_members_list option)
    ?life_cycle:(life_cycle_ : aws_opportunity_life_cycle option)
    ?visibility:(visibility_ : visibility option)
    ?involvement_type:(involvement_type_ : sales_involvement_type option)
    ?origin:(origin_ : opportunity_origin option)
    ?related_opportunity_id:(related_opportunity_id_ : opportunity_identifier option) () =
  ({
     cosell_motion = cosell_motion_;
     project = project_;
     customer = customer_;
     related_entity_ids = related_entity_ids_;
     involvement_type_change_reason = involvement_type_change_reason_;
     insights = insights_;
     opportunity_team = opportunity_team_;
     life_cycle = life_cycle_;
     visibility = visibility_;
     involvement_type = involvement_type_;
     origin = origin_;
     related_opportunity_id = related_opportunity_id_;
   }
    : aws_opportunity_summary_full_view)

let make_resource_snapshot_job_summary ?status:(status_ : resource_snapshot_job_status option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?arn:(arn_ : resource_snapshot_job_arn option)
    ?id:(id_ : resource_snapshot_job_identifier option) () =
  ({ status = status_; engagement_id = engagement_id_; arn = arn_; id = id_ }
    : resource_snapshot_job_summary)

let make_reject_engagement_invitation_request
    ?rejection_reason:(rejection_reason_ : rejection_reason_string option)
    ~identifier:(identifier_ : engagement_invitation_arn_or_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ rejection_reason = rejection_reason_; identifier = identifier_; catalog = catalog_ }
    : reject_engagement_invitation_request)

let make_account_receiver ?alias:(alias_ : alias option)
    ~aws_account_id:(aws_account_id_ : aws_account) () =
  ({ aws_account_id = aws_account_id_; alias = alias_ } : account_receiver)

let make_put_selling_system_settings_response
    ?resource_snapshot_job_role_arn:
      (resource_snapshot_job_role_arn_ : resource_snapshot_job_role_arn option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ resource_snapshot_job_role_arn = resource_snapshot_job_role_arn_; catalog = catalog_ }
    : put_selling_system_settings_response)

let make_put_selling_system_settings_request
    ?resource_snapshot_job_role_identifier:
      (resource_snapshot_job_role_identifier_ : resource_snapshot_job_role_identifier option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     resource_snapshot_job_role_identifier = resource_snapshot_job_role_identifier_;
     catalog = catalog_;
   }
    : put_selling_system_settings_request)

let make_prospecting_task_summary ?end_time:(end_time_ : date_time option)
    ~failed_engagement_count:(failed_engagement_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~completed_engagement_count:(completed_engagement_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~total_engagement_count:(total_engagement_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~start_time:(start_time_ : date_time) ~task_name:(task_name_ : task_name)
    ~task_arn:(task_arn_ : prospecting_task_arn) ~task_id:(task_id_ : prospecting_task_identifier)
    () =
  ({
     failed_engagement_count = failed_engagement_count_;
     completed_engagement_count = completed_engagement_count_;
     total_engagement_count = total_engagement_count_;
     end_time = end_time_;
     start_time = start_time_;
     task_name = task_name_;
     task_arn = task_arn_;
     task_id = task_id_;
   }
    : prospecting_task_summary)

let make_prospecting_from_engagement_task_sort
    ~sort_by:(sort_by_ : prospecting_from_engagement_task_sort_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : prospecting_from_engagement_task_sort)

let make_project_summary
    ?expected_contract_duration:(expected_contract_duration_ : expected_contract_duration option)
    ?expected_customer_spend:(expected_customer_spend_ : expected_customer_spend_list option)
    ?delivery_models:(delivery_models_ : delivery_models option) () =
  ({
     expected_contract_duration = expected_contract_duration_;
     expected_customer_spend = expected_customer_spend_;
     delivery_models = delivery_models_;
   }
    : project_summary)

let make_project_details
    ~expected_customer_spend:(expected_customer_spend_ : expected_customer_spend_list)
    ~target_completion_date:(target_completion_date_ : date)
    ~title:(title_ : Smaws_Lib.Smithy_api.Types.string_)
    ~business_problem:(business_problem_ : engagement_customer_business_problem) () =
  ({
     expected_customer_spend = expected_customer_spend_;
     target_completion_date = target_completion_date_;
     title = title_;
     business_problem = business_problem_;
   }
    : project_details)

let make_opportunity_invitation_payload
    ?sender_contacts:(sender_contacts_ : sender_contact_list option)
    ~project:(project_ : project_details) ~customer:(customer_ : engagement_customer)
    ~receiver_responsibilities:(receiver_responsibilities_ : receiver_responsibility_list) () =
  ({
     project = project_;
     customer = customer_;
     receiver_responsibilities = receiver_responsibilities_;
     sender_contacts = sender_contacts_;
   }
    : opportunity_invitation_payload)

let make_lead_invitation_customer ?market_segment:(market_segment_ : market_segment option)
    ?aws_maturity:(aws_maturity_ : aws_maturity option)
    ?website_url:(website_url_ : company_website_url option) ?industry:(industry_ : industry option)
    ~country_code:(country_code_ : country_code) ~company_name:(company_name_ : company_name) () =
  ({
     market_segment = market_segment_;
     aws_maturity = aws_maturity_;
     country_code = country_code_;
     website_url = website_url_;
     company_name = company_name_;
     industry = industry_;
   }
    : lead_invitation_customer)

let make_lead_invitation_interaction ?usecase:(usecase_ : engagement_use_case option)
    ~contact_business_title:(contact_business_title_ : job_title)
    ~source_name:(source_name_ : lead_source_name) ~source_id:(source_id_ : lead_source_id)
    ~source_type:(source_type_ : lead_source_type) () =
  ({
     contact_business_title = contact_business_title_;
     usecase = usecase_;
     source_name = source_name_;
     source_id = source_id_;
     source_type = source_type_;
   }
    : lead_invitation_interaction)

let make_lead_invitation_payload ~interaction:(interaction_ : lead_invitation_interaction)
    ~customer:(customer_ : lead_invitation_customer) () =
  ({ interaction = interaction_; customer = customer_ } : lead_invitation_payload)

let make_life_cycle_summary
    ?review_status_reason:(review_status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?review_comments:(review_comments_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?review_status:(review_status_ : review_status option)
    ?target_close_date:(target_close_date_ : date option)
    ?next_steps:(next_steps_ : pii_string option)
    ?closed_lost_reason:(closed_lost_reason_ : closed_lost_reason option)
    ?stage:(stage_ : stage option) () =
  ({
     review_status_reason = review_status_reason_;
     review_comments = review_comments_;
     review_status = review_status_;
     target_close_date = target_close_date_;
     next_steps = next_steps_;
     closed_lost_reason = closed_lost_reason_;
     stage = stage_;
   }
    : life_cycle_summary)

let make_account_summary ?address:(address_ : address_summary option)
    ?website_url:(website_url_ : website_url option)
    ?other_industry:(other_industry_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?industry:(industry_ : industry option) ~company_name:(company_name_ : name) () =
  ({
     address = address_;
     website_url = website_url_;
     company_name = company_name_;
     other_industry = other_industry_;
     industry = industry_;
   }
    : account_summary)

let make_customer_summary ?account:(account_ : account_summary option) () =
  ({ account = account_ } : customer_summary)

let make_opportunity_summary ?project:(project_ : project_summary option)
    ?customer:(customer_ : customer_summary option)
    ?life_cycle:(life_cycle_ : life_cycle_summary option)
    ?created_date:(created_date_ : date_time option)
    ?last_modified_date:(last_modified_date_ : date_time option)
    ?opportunity_type:(opportunity_type_ : opportunity_type option)
    ?partner_opportunity_identifier:
      (partner_opportunity_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : opportunity_arn option) ?id:(id_ : opportunity_identifier option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     project = project_;
     customer = customer_;
     life_cycle = life_cycle_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
     opportunity_type = opportunity_type_;
     partner_opportunity_identifier = partner_opportunity_identifier_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : opportunity_summary)

let make_opportunity_sort ~sort_by:(sort_by_ : opportunity_sort_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : opportunity_sort)

let make_opportunity_engagement_invitation_sort
    ~sort_by:(sort_by_ : opportunity_engagement_invitation_sort_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : opportunity_engagement_invitation_sort)

let make_list_tasks_sort_base ~sort_by:(sort_by_ : list_tasks_sort_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : list_tasks_sort_base)

let make_list_tags_for_resource_response ~tags:(tags_ : tag_list) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_solutions_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~solution_summaries:(solution_summaries_ : solution_list) () =
  ({ next_token = next_token_; solution_summaries = solution_summaries_ } : list_solutions_response)

let make_list_solutions_request
    ?aws_marketplace_solution_arn:
      (aws_marketplace_solution_arn_ : aws_marketplace_solution_arn_list option)
    ?category:(category_ : string_list option)
    ?identifier:(identifier_ : solution_identifiers option) ?status:(status_ : filter_status option)
    ?sort:(sort_ : solution_sort option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : page_size option) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     aws_marketplace_solution_arn = aws_marketplace_solution_arn_;
     category = category_;
     identifier = identifier_;
     status = status_;
     sort = sort_;
     next_token = next_token_;
     max_results = max_results_;
     catalog = catalog_;
   }
    : list_solutions_request)

let make_list_resource_snapshots_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~resource_snapshot_summaries:(resource_snapshot_summaries_ : resource_snapshot_summary_list) ()
    =
  ({ next_token = next_token_; resource_snapshot_summaries = resource_snapshot_summaries_ }
    : list_resource_snapshots_response)

let make_list_resource_snapshots_request ?created_by:(created_by_ : aws_account option)
    ?resource_snapshot_template_identifier:
      (resource_snapshot_template_identifier_ : resource_template_name option)
    ?resource_identifier:(resource_identifier_ : resource_identifier option)
    ?resource_type:(resource_type_ : resource_type option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : page_size option)
    ~engagement_identifier:(engagement_identifier_ : engagement_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     created_by = created_by_;
     resource_snapshot_template_identifier = resource_snapshot_template_identifier_;
     resource_identifier = resource_identifier_;
     resource_type = resource_type_;
     engagement_identifier = engagement_identifier_;
     next_token = next_token_;
     max_results = max_results_;
     catalog = catalog_;
   }
    : list_resource_snapshots_request)

let make_list_resource_snapshot_jobs_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~resource_snapshot_job_summaries:
      (resource_snapshot_job_summaries_ : resource_snapshot_job_summary_list) () =
  ({ next_token = next_token_; resource_snapshot_job_summaries = resource_snapshot_job_summaries_ }
    : list_resource_snapshot_jobs_response)

let make_list_resource_snapshot_jobs_request ?sort:(sort_ : sort_object option)
    ?status:(status_ : resource_snapshot_job_status option)
    ?engagement_identifier:(engagement_identifier_ : engagement_identifier option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : page_size option) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     sort = sort_;
     status = status_;
     engagement_identifier = engagement_identifier_;
     next_token = next_token_;
     max_results = max_results_;
     catalog = catalog_;
   }
    : list_resource_snapshot_jobs_request)

let make_list_prospecting_from_engagement_tasks_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~task_summaries:(task_summaries_ : prospecting_task_summary_list) () =
  ({ task_summaries = task_summaries_; next_token = next_token_ }
    : list_prospecting_from_engagement_tasks_response)

let make_list_prospecting_from_engagement_tasks_request
    ?sort:(sort_ : prospecting_from_engagement_task_sort option)
    ?start_before:(start_before_ : date_time option) ?start_after:(start_after_ : date_time option)
    ?task_name:(task_name_ : task_name_list option)
    ?task_identifier:(task_identifier_ : task_identifier_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : page_size option) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     sort = sort_;
     start_before = start_before_;
     start_after = start_after_;
     task_name = task_name_;
     task_identifier = task_identifier_;
     next_token = next_token_;
     max_results = max_results_;
     catalog = catalog_;
   }
    : list_prospecting_from_engagement_tasks_request)

let make_list_opportunity_from_engagement_task_summary
    ?context_id:(context_id_ : context_identifier option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?reason_code:(reason_code_ : reason_code option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_status:(task_status_ : task_status option) ?start_time:(start_time_ : date_time option)
    ?task_arn:(task_arn_ : task_arn option) ?task_id:(task_id_ : task_identifier option) () =
  ({
     context_id = context_id_;
     engagement_id = engagement_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     opportunity_id = opportunity_id_;
     reason_code = reason_code_;
     message = message_;
     task_status = task_status_;
     start_time = start_time_;
     task_arn = task_arn_;
     task_id = task_id_;
   }
    : list_opportunity_from_engagement_task_summary)

let make_list_opportunity_from_engagement_tasks_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_summaries:(task_summaries_ : list_opportunity_from_engagement_task_summaries option) () =
  ({ next_token = next_token_; task_summaries = task_summaries_ }
    : list_opportunity_from_engagement_tasks_response)

let make_list_opportunity_from_engagement_tasks_request
    ?context_identifier:(context_identifier_ : context_identifiers option)
    ?engagement_identifier:(engagement_identifier_ : engagement_identifiers option)
    ?opportunity_identifier:(opportunity_identifier_ : opportunity_identifiers option)
    ?task_identifier:(task_identifier_ : task_identifiers option)
    ?task_status:(task_status_ : task_statuses option) ?sort:(sort_ : list_tasks_sort_base option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     context_identifier = context_identifier_;
     engagement_identifier = engagement_identifier_;
     opportunity_identifier = opportunity_identifier_;
     task_identifier = task_identifier_;
     task_status = task_status_;
     catalog = catalog_;
     sort = sort_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_opportunity_from_engagement_tasks_request)

let make_list_opportunities_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~opportunity_summaries:(opportunity_summaries_ : opportunity_summaries) () =
  ({ next_token = next_token_; opportunity_summaries = opportunity_summaries_ }
    : list_opportunities_response)

let make_last_modified_date
    ?before_last_modified_date:(before_last_modified_date_ : date_time option)
    ?after_last_modified_date:(after_last_modified_date_ : date_time option) () =
  ({
     before_last_modified_date = before_last_modified_date_;
     after_last_modified_date = after_last_modified_date_;
   }
    : last_modified_date)

let make_created_date_filter ?before_created_date:(before_created_date_ : date_time option)
    ?after_created_date:(after_created_date_ : date_time option) () =
  ({ before_created_date = before_created_date_; after_created_date = after_created_date_ }
    : created_date_filter)

let make_list_opportunities_request
    ?target_close_date:(target_close_date_ : target_close_date_filter option)
    ?created_date:(created_date_ : created_date_filter option)
    ?customer_company_name:(customer_company_name_ : string_list option)
    ?life_cycle_review_status:(life_cycle_review_status_ : filter_life_cycle_review_status option)
    ?life_cycle_stage:(life_cycle_stage_ : filter_life_cycle_stage option)
    ?identifier:(identifier_ : filter_identifier option)
    ?last_modified_date:(last_modified_date_ : last_modified_date option)
    ?sort:(sort_ : opportunity_sort option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : page_size option) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     target_close_date = target_close_date_;
     created_date = created_date_;
     customer_company_name = customer_company_name_;
     life_cycle_review_status = life_cycle_review_status_;
     life_cycle_stage = life_cycle_stage_;
     identifier = identifier_;
     last_modified_date = last_modified_date_;
     sort = sort_;
     next_token = next_token_;
     max_results = max_results_;
     catalog = catalog_;
   }
    : list_opportunities_request)

let make_engagement_summary ?context_types:(context_types_ : engagement_context_type_list option)
    ?modified_by:(modified_by_ : aws_account option) ?modified_at:(modified_at_ : date_time option)
    ?member_count:(member_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?created_by:(created_by_ : aws_account option) ?created_at:(created_at_ : date_time option)
    ?title:(title_ : engagement_title option) ?id:(id_ : engagement_identifier option)
    ?arn:(arn_ : engagement_arn option) () =
  ({
     context_types = context_types_;
     modified_by = modified_by_;
     modified_at = modified_at_;
     member_count = member_count_;
     created_by = created_by_;
     created_at = created_at_;
     title = title_;
     id = id_;
     arn = arn_;
   }
    : engagement_summary)

let make_list_engagements_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~engagement_summary_list:(engagement_summary_list_ : engagement_summary_list) () =
  ({ next_token = next_token_; engagement_summary_list = engagement_summary_list_ }
    : list_engagements_response)

let make_engagement_sort ~sort_by:(sort_by_ : engagement_sort_name)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : engagement_sort)

let make_list_engagements_request
    ?engagement_identifier:(engagement_identifier_ : engagement_identifiers option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : engagement_page_size option) ?sort:(sort_ : engagement_sort option)
    ?exclude_context_types:(exclude_context_types_ : engagement_context_type_list option)
    ?context_types:(context_types_ : engagement_context_type_list option)
    ?exclude_created_by:(exclude_created_by_ : aws_account_list option)
    ?created_by:(created_by_ : aws_account_list option) ~catalog:(catalog_ : catalog_identifier) ()
    =
  ({
     engagement_identifier = engagement_identifier_;
     next_token = next_token_;
     max_results = max_results_;
     sort = sort_;
     exclude_context_types = exclude_context_types_;
     context_types = context_types_;
     exclude_created_by = exclude_created_by_;
     created_by = created_by_;
     catalog = catalog_;
   }
    : list_engagements_request)

let make_engagement_resource_association_summary ?created_by:(created_by_ : aws_account option)
    ?resource_id:(resource_id_ : resource_identifier option)
    ?resource_type:(resource_type_ : resource_type option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     created_by = created_by_;
     resource_id = resource_id_;
     resource_type = resource_type_;
     engagement_id = engagement_id_;
     catalog = catalog_;
   }
    : engagement_resource_association_summary)

let make_list_engagement_resource_associations_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~engagement_resource_association_summaries:
      (engagement_resource_association_summaries_ : engagement_resource_association_summary_list) ()
    =
  ({
     next_token = next_token_;
     engagement_resource_association_summaries = engagement_resource_association_summaries_;
   }
    : list_engagement_resource_associations_response)

let make_list_engagement_resource_associations_request
    ?created_by:(created_by_ : aws_account option)
    ?resource_identifier:(resource_identifier_ : resource_identifier option)
    ?resource_type:(resource_type_ : resource_type option)
    ?engagement_identifier:(engagement_identifier_ : engagement_identifier option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : page_size option) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     created_by = created_by_;
     resource_identifier = resource_identifier_;
     resource_type = resource_type_;
     engagement_identifier = engagement_identifier_;
     next_token = next_token_;
     max_results = max_results_;
     catalog = catalog_;
   }
    : list_engagement_resource_associations_request)

let make_engagement_member ?account_id:(account_id_ : aws_account option)
    ?website_url:(website_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?company_name:(company_name_ : member_company_name option) () =
  ({ account_id = account_id_; website_url = website_url_; company_name = company_name_ }
    : engagement_member)

let make_list_engagement_members_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~engagement_member_list:(engagement_member_list_ : engagement_members) () =
  ({ next_token = next_token_; engagement_member_list = engagement_member_list_ }
    : list_engagement_members_response)

let make_list_engagement_members_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : member_page_size option)
    ~identifier:(identifier_ : engagement_arn_or_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     identifier = identifier_;
     catalog = catalog_;
   }
    : list_engagement_members_request)

let make_engagement_invitation_summary
    ?participant_type:(participant_type_ : participant_type option)
    ?receiver:(receiver_ : receiver option)
    ?sender_company_name:(sender_company_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sender_aws_account_id:(sender_aws_account_id_ : aws_account option)
    ?expiration_date:(expiration_date_ : date_time option)
    ?invitation_date:(invitation_date_ : date_time option)
    ?status:(status_ : invitation_status option)
    ?engagement_title:(engagement_title_ : engagement_title option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?payload_type:(payload_type_ : engagement_invitation_payload_type option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option) ~catalog:(catalog_ : catalog_identifier)
    ~id:(id_ : engagement_invitation_arn_or_identifier) () =
  ({
     participant_type = participant_type_;
     catalog = catalog_;
     receiver = receiver_;
     sender_company_name = sender_company_name_;
     sender_aws_account_id = sender_aws_account_id_;
     expiration_date = expiration_date_;
     invitation_date = invitation_date_;
     status = status_;
     engagement_title = engagement_title_;
     engagement_id = engagement_id_;
     id = id_;
     payload_type = payload_type_;
     arn = arn_;
   }
    : engagement_invitation_summary)

let make_list_engagement_invitations_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?engagement_invitation_summaries:
      (engagement_invitation_summaries_ : engagement_invitation_summaries option) () =
  ({ next_token = next_token_; engagement_invitation_summaries = engagement_invitation_summaries_ }
    : list_engagement_invitations_response)

let make_list_engagement_invitations_request
    ?sender_aws_account_id:(sender_aws_account_id_ : aws_account_id_or_alias_list option)
    ?engagement_identifier:(engagement_identifier_ : engagement_identifiers option)
    ?status:(status_ : invitation_status_list option)
    ?payload_type:(payload_type_ : engagement_invitations_payload_type option)
    ?sort:(sort_ : opportunity_engagement_invitation_sort option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : page_size option)
    ~participant_type:(participant_type_ : participant_type)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     sender_aws_account_id = sender_aws_account_id_;
     engagement_identifier = engagement_identifier_;
     status = status_;
     participant_type = participant_type_;
     payload_type = payload_type_;
     sort = sort_;
     next_token = next_token_;
     max_results = max_results_;
     catalog = catalog_;
   }
    : list_engagement_invitations_request)

let make_list_engagement_from_opportunity_task_summary
    ?engagement_invitation_id:(engagement_invitation_id_ : engagement_invitation_identifier option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?reason_code:(reason_code_ : reason_code option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_status:(task_status_ : task_status option) ?start_time:(start_time_ : date_time option)
    ?task_arn:(task_arn_ : task_arn option) ?task_id:(task_id_ : task_identifier option) () =
  ({
     engagement_invitation_id = engagement_invitation_id_;
     engagement_id = engagement_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     opportunity_id = opportunity_id_;
     reason_code = reason_code_;
     message = message_;
     task_status = task_status_;
     start_time = start_time_;
     task_arn = task_arn_;
     task_id = task_id_;
   }
    : list_engagement_from_opportunity_task_summary)

let make_list_engagement_from_opportunity_tasks_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_summaries:(task_summaries_ : list_engagement_from_opportunity_task_summaries option) () =
  ({ next_token = next_token_; task_summaries = task_summaries_ }
    : list_engagement_from_opportunity_tasks_response)

let make_list_engagement_from_opportunity_tasks_request
    ?engagement_identifier:(engagement_identifier_ : engagement_identifiers option)
    ?opportunity_identifier:(opportunity_identifier_ : opportunity_identifiers option)
    ?task_identifier:(task_identifier_ : task_identifiers option)
    ?task_status:(task_status_ : task_statuses option) ?sort:(sort_ : list_tasks_sort_base option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     engagement_identifier = engagement_identifier_;
     opportunity_identifier = opportunity_identifier_;
     task_identifier = task_identifier_;
     task_status = task_status_;
     catalog = catalog_;
     sort = sort_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_engagement_from_opportunity_tasks_request)

let make_list_engagement_by_accepting_invitation_task_summary
    ?engagement_invitation_id:(engagement_invitation_id_ : engagement_invitation_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?reason_code:(reason_code_ : reason_code option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_status:(task_status_ : task_status option) ?start_time:(start_time_ : date_time option)
    ?task_arn:(task_arn_ : task_arn option) ?task_id:(task_id_ : task_identifier option) () =
  ({
     engagement_invitation_id = engagement_invitation_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     opportunity_id = opportunity_id_;
     reason_code = reason_code_;
     message = message_;
     task_status = task_status_;
     start_time = start_time_;
     task_arn = task_arn_;
     task_id = task_id_;
   }
    : list_engagement_by_accepting_invitation_task_summary)

let make_list_engagement_by_accepting_invitation_tasks_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_summaries:
      (task_summaries_ : list_engagement_by_accepting_invitation_task_summaries option) () =
  ({ next_token = next_token_; task_summaries = task_summaries_ }
    : list_engagement_by_accepting_invitation_tasks_response)

let make_list_engagement_by_accepting_invitation_tasks_request
    ?task_identifier:(task_identifier_ : task_identifiers option)
    ?engagement_invitation_identifier:
      (engagement_invitation_identifier_ : engagement_invitation_identifiers option)
    ?opportunity_identifier:(opportunity_identifier_ : opportunity_identifiers option)
    ?task_status:(task_status_ : task_statuses option) ?sort:(sort_ : list_tasks_sort_base option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     task_identifier = task_identifier_;
     engagement_invitation_identifier = engagement_invitation_identifier_;
     opportunity_identifier = opportunity_identifier_;
     task_status = task_status_;
     catalog = catalog_;
     sort = sort_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_engagement_by_accepting_invitation_tasks_request)

let make_lead_context
    ?qualification_status:(qualification_status_ : lead_qualification_status option)
    ?insights:(insights_ : lead_insights option)
    ~interactions:(interactions_ : lead_interaction_list) ~customer:(customer_ : lead_customer) () =
  ({
     interactions = interactions_;
     customer = customer_;
     qualification_status = qualification_status_;
     insights = insights_;
   }
    : lead_context)

let make_invitation ~payload:(payload_ : payload) ~receiver:(receiver_ : receiver)
    ~message:(message_ : invitation_message) () =
  ({ payload = payload_; receiver = receiver_; message = message_ } : invitation)

let make_get_selling_system_settings_response
    ?resource_snapshot_job_role_arn:
      (resource_snapshot_job_role_arn_ : resource_snapshot_job_role_arn option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ resource_snapshot_job_role_arn = resource_snapshot_job_role_arn_; catalog = catalog_ }
    : get_selling_system_settings_response)

let make_get_selling_system_settings_request ~catalog:(catalog_ : catalog_identifier) () =
  ({ catalog = catalog_ } : get_selling_system_settings_request)

let make_get_resource_snapshot_response
    ?target_member_accounts:(target_member_accounts_ : aws_account_id_or_alias_list option)
    ?payload:(payload_ : resource_snapshot_payload option)
    ?revision:(revision_ : resource_snapshot_revision option)
    ?resource_snapshot_template_name:
      (resource_snapshot_template_name_ : resource_template_name option)
    ?resource_id:(resource_id_ : resource_identifier option)
    ?resource_type:(resource_type_ : resource_type option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?created_at:(created_at_ : date_time option) ?created_by:(created_by_ : aws_account option)
    ?arn:(arn_ : resource_arn option) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     target_member_accounts = target_member_accounts_;
     payload = payload_;
     revision = revision_;
     resource_snapshot_template_name = resource_snapshot_template_name_;
     resource_id = resource_id_;
     resource_type = resource_type_;
     engagement_id = engagement_id_;
     created_at = created_at_;
     created_by = created_by_;
     arn = arn_;
     catalog = catalog_;
   }
    : get_resource_snapshot_response)

let make_get_resource_snapshot_request ?revision:(revision_ : resource_snapshot_revision option)
    ~resource_snapshot_template_identifier:
      (resource_snapshot_template_identifier_ : resource_template_name)
    ~resource_identifier:(resource_identifier_ : resource_identifier)
    ~resource_type:(resource_type_ : resource_type)
    ~engagement_identifier:(engagement_identifier_ : engagement_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     revision = revision_;
     resource_snapshot_template_identifier = resource_snapshot_template_identifier_;
     resource_identifier = resource_identifier_;
     resource_type = resource_type_;
     engagement_identifier = engagement_identifier_;
     catalog = catalog_;
   }
    : get_resource_snapshot_request)

let make_get_resource_snapshot_job_response
    ?last_failure:(last_failure_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?last_successful_execution_date:(last_successful_execution_date_ : date_time option)
    ?status:(status_ : resource_snapshot_job_status option)
    ?created_at:(created_at_ : date_time option)
    ?resource_snapshot_template_name:
      (resource_snapshot_template_name_ : resource_template_name option)
    ?resource_arn:(resource_arn_ : resource_arn option)
    ?resource_id:(resource_id_ : resource_identifier option)
    ?resource_type:(resource_type_ : resource_type option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?arn:(arn_ : resource_snapshot_job_arn option)
    ?id:(id_ : resource_snapshot_job_identifier option) ~catalog:(catalog_ : catalog_identifier) ()
    =
  ({
     last_failure = last_failure_;
     last_successful_execution_date = last_successful_execution_date_;
     status = status_;
     created_at = created_at_;
     resource_snapshot_template_name = resource_snapshot_template_name_;
     resource_arn = resource_arn_;
     resource_id = resource_id_;
     resource_type = resource_type_;
     engagement_id = engagement_id_;
     arn = arn_;
     id = id_;
     catalog = catalog_;
   }
    : get_resource_snapshot_job_response)

let make_get_resource_snapshot_job_request
    ~resource_snapshot_job_identifier:
      (resource_snapshot_job_identifier_ : resource_snapshot_job_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ resource_snapshot_job_identifier = resource_snapshot_job_identifier_; catalog = catalog_ }
    : get_resource_snapshot_job_request)

let make_get_prospecting_from_engagement_task_response ?end_time:(end_time_ : date_time option)
    ~engagements:(engagements_ : engagement_prospecting_result_list)
    ~start_time:(start_time_ : date_time) ~task_name:(task_name_ : task_name)
    ~task_arn:(task_arn_ : prospecting_task_arn) ~task_id:(task_id_ : prospecting_task_identifier)
    () =
  ({
     engagements = engagements_;
     end_time = end_time_;
     start_time = start_time_;
     task_name = task_name_;
     task_arn = task_arn_;
     task_id = task_id_;
   }
    : get_prospecting_from_engagement_task_response)

let make_get_prospecting_from_engagement_task_request
    ~task_identifier:(task_identifier_ : prospecting_task_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ task_identifier = task_identifier_; catalog = catalog_ }
    : get_prospecting_from_engagement_task_request)

let make_get_opportunity_response
    ?opportunity_team:(opportunity_team_ : partner_opportunity_team_members_list option)
    ?life_cycle:(life_cycle_ : life_cycle option) ?arn:(arn_ : opportunity_arn option)
    ?software_revenue:(software_revenue_ : software_revenue option)
    ?marketing:(marketing_ : marketing option)
    ?opportunity_type:(opportunity_type_ : opportunity_type option)
    ?project:(project_ : project option) ?customer:(customer_ : customer option)
    ?partner_opportunity_identifier:
      (partner_opportunity_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?national_security:(national_security_ : national_security option)
    ?primary_needs_from_aws:(primary_needs_from_aws_ : primary_needs_from_aws option)
    ~related_entity_identifiers:(related_entity_identifiers_ : related_entity_identifiers)
    ~created_date:(created_date_ : date_time) ~last_modified_date:(last_modified_date_ : date_time)
    ~id:(id_ : opportunity_identifier) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     opportunity_team = opportunity_team_;
     life_cycle = life_cycle_;
     related_entity_identifiers = related_entity_identifiers_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
     arn = arn_;
     id = id_;
     software_revenue = software_revenue_;
     marketing = marketing_;
     opportunity_type = opportunity_type_;
     project = project_;
     customer = customer_;
     partner_opportunity_identifier = partner_opportunity_identifier_;
     national_security = national_security_;
     primary_needs_from_aws = primary_needs_from_aws_;
     catalog = catalog_;
   }
    : get_opportunity_response)

let make_get_opportunity_request ~identifier:(identifier_ : opportunity_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_opportunity_request)

let make_engagement_context_details ?payload:(payload_ : engagement_context_payload option)
    ?id:(id_ : engagement_context_identifier option) ~type_:(type__ : engagement_context_type) () =
  ({ payload = payload_; type_ = type__; id = id_ } : engagement_context_details)

let make_get_engagement_response ?contexts:(contexts_ : engagement_contexts option)
    ?modified_by:(modified_by_ : aws_account option) ?modified_at:(modified_at_ : date_time option)
    ?member_count:(member_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?created_by:(created_by_ : aws_account option) ?created_at:(created_at_ : date_time option)
    ?description:(description_ : engagement_description option)
    ?title:(title_ : engagement_title option) ?arn:(arn_ : engagement_arn option)
    ?id:(id_ : engagement_identifier option) () =
  ({
     contexts = contexts_;
     modified_by = modified_by_;
     modified_at = modified_at_;
     member_count = member_count_;
     created_by = created_by_;
     created_at = created_at_;
     description = description_;
     title = title_;
     arn = arn_;
     id = id_;
   }
    : get_engagement_response)

let make_get_engagement_request ~identifier:(identifier_ : engagement_arn_or_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_engagement_request)

let make_engagement_member_summary
    ?website_url:(website_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?company_name:(company_name_ : member_company_name option) () =
  ({ website_url = website_url_; company_name = company_name_ } : engagement_member_summary)

let make_get_engagement_invitation_response
    ?existing_members:(existing_members_ : engagement_member_summaries option)
    ?engagement_description:(engagement_description_ : engagement_description option)
    ?invitation_message:(invitation_message_ : invitation_message option)
    ?payload:(payload_ : payload option)
    ?rejection_reason:(rejection_reason_ : rejection_reason_string option)
    ?receiver:(receiver_ : receiver option)
    ?sender_company_name:(sender_company_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sender_aws_account_id:(sender_aws_account_id_ : aws_account option)
    ?expiration_date:(expiration_date_ : date_time option)
    ?invitation_date:(invitation_date_ : date_time option)
    ?status:(status_ : invitation_status option)
    ?engagement_title:(engagement_title_ : engagement_title option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?payload_type:(payload_type_ : engagement_invitation_payload_type option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option) ~catalog:(catalog_ : catalog_identifier)
    ~id:(id_ : engagement_invitation_arn_or_identifier) () =
  ({
     existing_members = existing_members_;
     engagement_description = engagement_description_;
     invitation_message = invitation_message_;
     payload = payload_;
     rejection_reason = rejection_reason_;
     catalog = catalog_;
     receiver = receiver_;
     sender_company_name = sender_company_name_;
     sender_aws_account_id = sender_aws_account_id_;
     expiration_date = expiration_date_;
     invitation_date = invitation_date_;
     status = status_;
     engagement_title = engagement_title_;
     engagement_id = engagement_id_;
     id = id_;
     payload_type = payload_type_;
     arn = arn_;
   }
    : get_engagement_invitation_response)

let make_get_engagement_invitation_request
    ~identifier:(identifier_ : engagement_invitation_arn_or_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ identifier = identifier_; catalog = catalog_ } : get_engagement_invitation_request)

let make_get_aws_opportunity_summary_response
    ?cosell_motion:(cosell_motion_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?project:(project_ : aws_opportunity_project option)
    ?customer:(customer_ : aws_opportunity_customer option)
    ?related_entity_ids:(related_entity_ids_ : aws_opportunity_related_entities option)
    ?involvement_type_change_reason:
      (involvement_type_change_reason_ : involvement_type_change_reason option)
    ?insights:(insights_ : aws_opportunity_insights option)
    ?opportunity_team:(opportunity_team_ : aws_opportunity_team_members_list option)
    ?life_cycle:(life_cycle_ : aws_opportunity_life_cycle option)
    ?visibility:(visibility_ : visibility option)
    ?involvement_type:(involvement_type_ : sales_involvement_type option)
    ?origin:(origin_ : opportunity_origin option)
    ?related_opportunity_id:(related_opportunity_id_ : opportunity_identifier option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     cosell_motion = cosell_motion_;
     project = project_;
     customer = customer_;
     related_entity_ids = related_entity_ids_;
     involvement_type_change_reason = involvement_type_change_reason_;
     insights = insights_;
     opportunity_team = opportunity_team_;
     life_cycle = life_cycle_;
     visibility = visibility_;
     involvement_type = involvement_type_;
     origin = origin_;
     related_opportunity_id = related_opportunity_id_;
   }
    : get_aws_opportunity_summary_response)

let make_get_aws_opportunity_summary_request
    ~related_opportunity_identifier:(related_opportunity_identifier_ : opportunity_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ related_opportunity_identifier = related_opportunity_identifier_; catalog = catalog_ }
    : get_aws_opportunity_summary_request)

let make_disassociate_opportunity_request
    ~related_entity_identifier:(related_entity_identifier_ : Smaws_Lib.Smithy_api.Types.string_)
    ~related_entity_type:(related_entity_type_ : related_entity_type)
    ~opportunity_identifier:(opportunity_identifier_ : opportunity_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     related_entity_identifier = related_entity_identifier_;
     related_entity_type = related_entity_type_;
     opportunity_identifier = opportunity_identifier_;
     catalog = catalog_;
   }
    : disassociate_opportunity_request)

let make_delete_resource_snapshot_job_request
    ~resource_snapshot_job_identifier:
      (resource_snapshot_job_identifier_ : resource_snapshot_job_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ resource_snapshot_job_identifier = resource_snapshot_job_identifier_; catalog = catalog_ }
    : delete_resource_snapshot_job_request)

let make_create_resource_snapshot_response ?revision:(revision_ : resource_snapshot_revision option)
    ?arn:(arn_ : resource_arn option) () =
  ({ revision = revision_; arn = arn_ } : create_resource_snapshot_response)

let make_create_resource_snapshot_request ~client_token:(client_token_ : client_token)
    ~resource_snapshot_template_identifier:
      (resource_snapshot_template_identifier_ : resource_template_name)
    ~resource_identifier:(resource_identifier_ : resource_identifier)
    ~resource_type:(resource_type_ : resource_type)
    ~engagement_identifier:(engagement_identifier_ : engagement_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     client_token = client_token_;
     resource_snapshot_template_identifier = resource_snapshot_template_identifier_;
     resource_identifier = resource_identifier_;
     resource_type = resource_type_;
     engagement_identifier = engagement_identifier_;
     catalog = catalog_;
   }
    : create_resource_snapshot_request)

let make_create_resource_snapshot_job_response ?arn:(arn_ : resource_snapshot_job_arn option)
    ?id:(id_ : resource_snapshot_job_identifier option) () =
  ({ arn = arn_; id = id_ } : create_resource_snapshot_job_response)

let make_create_resource_snapshot_job_request ?tags:(tags_ : tag_list option)
    ~resource_snapshot_template_identifier:
      (resource_snapshot_template_identifier_ : resource_template_name)
    ~resource_identifier:(resource_identifier_ : resource_identifier)
    ~resource_type:(resource_type_ : resource_type)
    ~engagement_identifier:(engagement_identifier_ : engagement_identifier)
    ~client_token:(client_token_ : client_token) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     tags = tags_;
     resource_snapshot_template_identifier = resource_snapshot_template_identifier_;
     resource_identifier = resource_identifier_;
     resource_type = resource_type_;
     engagement_identifier = engagement_identifier_;
     client_token = client_token_;
     catalog = catalog_;
   }
    : create_resource_snapshot_job_request)

let make_create_opportunity_response ?last_modified_date:(last_modified_date_ : date_time option)
    ?partner_opportunity_identifier:
      (partner_opportunity_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~id:(id_ : opportunity_identifier) () =
  ({
     last_modified_date = last_modified_date_;
     partner_opportunity_identifier = partner_opportunity_identifier_;
     id = id_;
   }
    : create_opportunity_response)

let make_create_opportunity_request ?tags:(tags_ : tag_list option)
    ?opportunity_team:(opportunity_team_ : partner_opportunity_team_members_list option)
    ?origin:(origin_ : opportunity_origin option) ?life_cycle:(life_cycle_ : life_cycle option)
    ?software_revenue:(software_revenue_ : software_revenue option)
    ?marketing:(marketing_ : marketing option)
    ?opportunity_type:(opportunity_type_ : opportunity_type option)
    ?project:(project_ : project option) ?customer:(customer_ : customer option)
    ?partner_opportunity_identifier:
      (partner_opportunity_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?national_security:(national_security_ : national_security option)
    ?primary_needs_from_aws:(primary_needs_from_aws_ : primary_needs_from_aws option)
    ~client_token:(client_token_ : client_token) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     tags = tags_;
     opportunity_team = opportunity_team_;
     origin = origin_;
     life_cycle = life_cycle_;
     client_token = client_token_;
     software_revenue = software_revenue_;
     marketing = marketing_;
     opportunity_type = opportunity_type_;
     project = project_;
     customer = customer_;
     partner_opportunity_identifier = partner_opportunity_identifier_;
     national_security = national_security_;
     primary_needs_from_aws = primary_needs_from_aws_;
     catalog = catalog_;
   }
    : create_opportunity_request)

let make_create_engagement_response ?modified_at:(modified_at_ : date_time option)
    ?arn:(arn_ : engagement_arn option) ?id:(id_ : engagement_identifier option) () =
  ({ modified_at = modified_at_; arn = arn_; id = id_ } : create_engagement_response)

let make_create_engagement_request ?contexts:(contexts_ : engagement_contexts option)
    ~description:(description_ : engagement_description) ~title:(title_ : engagement_title)
    ~client_token:(client_token_ : client_token) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     contexts = contexts_;
     description = description_;
     title = title_;
     client_token = client_token_;
     catalog = catalog_;
   }
    : create_engagement_request)

let make_create_engagement_invitation_response ~arn:(arn_ : engagement_invitation_arn)
    ~id:(id_ : engagement_invitation_identifier) () =
  ({ arn = arn_; id = id_ } : create_engagement_invitation_response)

let make_create_engagement_invitation_request ~invitation:(invitation_ : invitation)
    ~engagement_identifier:(engagement_identifier_ : engagement_identifier)
    ~client_token:(client_token_ : client_token) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     invitation = invitation_;
     engagement_identifier = engagement_identifier_;
     client_token = client_token_;
     catalog = catalog_;
   }
    : create_engagement_invitation_request)

let make_create_engagement_context_response
    ?context_id:(context_id_ : engagement_context_identifier option)
    ?engagement_last_modified_at:(engagement_last_modified_at_ : date_time option)
    ?engagement_arn:(engagement_arn_ : engagement_arn option)
    ?engagement_id:(engagement_id_ : engagement_identifier option) () =
  ({
     context_id = context_id_;
     engagement_last_modified_at = engagement_last_modified_at_;
     engagement_arn = engagement_arn_;
     engagement_id = engagement_id_;
   }
    : create_engagement_context_response)

let make_create_engagement_context_request ~payload:(payload_ : engagement_context_payload)
    ~type_:(type__ : engagement_context_type) ~client_token:(client_token_ : client_token)
    ~engagement_identifier:(engagement_identifier_ : engagement_arn_or_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     payload = payload_;
     type_ = type__;
     client_token = client_token_;
     engagement_identifier = engagement_identifier_;
     catalog = catalog_;
   }
    : create_engagement_context_request)

let make_associate_opportunity_request
    ~related_entity_identifier:(related_entity_identifier_ : Smaws_Lib.Smithy_api.Types.string_)
    ~related_entity_type:(related_entity_type_ : related_entity_type)
    ~opportunity_identifier:(opportunity_identifier_ : opportunity_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     related_entity_identifier = related_entity_identifier_;
     related_entity_type = related_entity_type_;
     opportunity_identifier = opportunity_identifier_;
     catalog = catalog_;
   }
    : associate_opportunity_request)

let make_assignee_contact ?phone:(phone_ : phone_number option)
    ~business_title:(business_title_ : job_title) ~last_name:(last_name_ : name)
    ~first_name:(first_name_ : name) ~email:(email_ : email) () =
  ({
     business_title = business_title_;
     phone = phone_;
     last_name = last_name_;
     first_name = first_name_;
     email = email_;
   }
    : assignee_contact)

let make_assign_opportunity_request ~assignee:(assignee_ : assignee_contact)
    ~identifier:(identifier_ : opportunity_identifier) ~catalog:(catalog_ : catalog_identifier) () =
  ({ assignee = assignee_; identifier = identifier_; catalog = catalog_ }
    : assign_opportunity_request)

let make_accept_engagement_invitation_request
    ~identifier:(identifier_ : engagement_invitation_arn_or_identifier)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ identifier = identifier_; catalog = catalog_ } : accept_engagement_invitation_request)
