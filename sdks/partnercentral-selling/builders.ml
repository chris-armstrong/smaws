open Types

let make_validation_exception_error
    ?field_name:(field_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~code:(code_ : validation_exception_error_code) () =
  ({ field_name = field_name_; message = message_; code = code_ } : validation_exception_error)

let make_update_engagement_context_response ~engagement_id:(engagement_id_ : engagement_identifier)
    ~engagement_arn:(engagement_arn_ : engagement_arn)
    ~engagement_last_modified_at:(engagement_last_modified_at_ : date_time)
    ~context_id:(context_id_ : engagement_context_identifier) () =
  ({
     engagement_id = engagement_id_;
     engagement_arn = engagement_arn_;
     engagement_last_modified_at = engagement_last_modified_at_;
     context_id = context_id_;
   }
    : update_engagement_context_response)

let make_prospecting_insights
    ?marketplace_engagement_score:(marketplace_engagement_score_ : engagement_score_level option)
    ?solution_score:(solution_score_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?solution_category:(solution_category_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?solution_sub_category:(solution_sub_category_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     marketplace_engagement_score = marketplace_engagement_score_;
     solution_score = solution_score_;
     solution_category = solution_category_;
     solution_sub_category = solution_sub_category_;
   }
    : prospecting_insights)

let make_prospecting_result_customer ?account_name:(account_name_ : prospecting_account_name option)
    ?geo:(geo_ : prospecting_geo option) ?region:(region_ : prospecting_region option)
    ?sub_region:(sub_region_ : prospecting_sub_region option)
    ?country:(country_ : country_code option) ?industry:(industry_ : industry option)
    ?sub_industry:(sub_industry_ : prospecting_sub_industry option)
    ?segment:(segment_ : prospecting_segment option)
    ?company_size:(company_size_ : prospecting_company_size option)
    ?eligible_programs:(eligible_programs_ : eligible_programs_list option)
    ?public_profile_summary:(public_profile_summary_ : prospecting_public_profile_summary option) ()
    =
  ({
     account_name = account_name_;
     geo = geo_;
     region = region_;
     sub_region = sub_region_;
     country = country_;
     industry = industry_;
     sub_industry = sub_industry_;
     segment = segment_;
     company_size = company_size_;
     eligible_programs = eligible_programs_;
     public_profile_summary = public_profile_summary_;
   }
    : prospecting_result_customer)

let make_prospecting_result_aws ?start_time:(start_time_ : date_time option)
    ?end_time:(end_time_ : date_time option)
    ?task_id:(task_id_ : prospecting_task_identifier option) ?task_arn:(task_arn_ : task_arn option)
    ?task_name:(task_name_ : task_name option)
    ?customer:(customer_ : prospecting_result_customer option)
    ?insights:(insights_ : prospecting_insights option) () =
  ({
     start_time = start_time_;
     end_time = end_time_;
     task_id = task_id_;
     task_arn = task_arn_;
     task_name = task_name_;
     customer = customer_;
     insights = insights_;
   }
    : prospecting_result_aws)

let make_engagement_customer_project_details ~title:(title_ : engagement_customer_project_title)
    ~business_problem:(business_problem_ : engagement_customer_business_problem)
    ~target_completion_date:(target_completion_date_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     title = title_;
     business_problem = business_problem_;
     target_completion_date = target_completion_date_;
   }
    : engagement_customer_project_details)

let make_engagement_customer ~industry:(industry_ : industry)
    ~company_name:(company_name_ : company_name) ~website_url:(website_url_ : company_website_url)
    ~country_code:(country_code_ : country_code) () =
  ({
     industry = industry_;
     company_name = company_name_;
     website_url = website_url_;
     country_code = country_code_;
   }
    : engagement_customer)

let make_customer_projects_context ?customer:(customer_ : engagement_customer option)
    ?project:(project_ : engagement_customer_project_details option) () =
  ({ customer = customer_; project = project_ } : customer_projects_context)

let make_lead_insights
    ?lead_readiness_score:(lead_readiness_score_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ lead_readiness_score = lead_readiness_score_ } : lead_insights)

let make_lead_contact ?phone:(phone_ : phone_number option)
    ~business_title:(business_title_ : job_title) ~email:(email_ : email)
    ~first_name:(first_name_ : name) ~last_name:(last_name_ : name) () =
  ({
     business_title = business_title_;
     email = email_;
     first_name = first_name_;
     last_name = last_name_;
     phone = phone_;
   }
    : lead_contact)

let make_lead_interaction ?usecase:(usecase_ : engagement_use_case option)
    ?interaction_date:(interaction_date_ : date_time option)
    ?business_problem:(business_problem_ : engagement_customer_business_problem option)
    ~source_type:(source_type_ : lead_source_type) ~source_id:(source_id_ : lead_source_id)
    ~source_name:(source_name_ : lead_source_name)
    ~customer_action:(customer_action_ : customer_action) ~contact:(contact_ : lead_contact) () =
  ({
     source_type = source_type_;
     source_id = source_id_;
     source_name = source_name_;
     usecase = usecase_;
     interaction_date = interaction_date_;
     customer_action = customer_action_;
     business_problem = business_problem_;
     contact = contact_;
   }
    : lead_interaction)

let make_address_summary ?city:(city_ : address_part option)
    ?postal_code:(postal_code_ : address_part option)
    ?state_or_region:(state_or_region_ : address_part option)
    ?country_code:(country_code_ : country_code option) () =
  ({
     city = city_;
     postal_code = postal_code_;
     state_or_region = state_or_region_;
     country_code = country_code_;
   }
    : address_summary)

let make_lead_customer ?industry:(industry_ : industry option)
    ?website_url:(website_url_ : company_website_url option)
    ?aws_maturity:(aws_maturity_ : aws_maturity option)
    ?market_segment:(market_segment_ : market_segment option)
    ~company_name:(company_name_ : company_name) ~address:(address_ : address_summary) () =
  ({
     industry = industry_;
     company_name = company_name_;
     website_url = website_url_;
     address = address_;
     aws_maturity = aws_maturity_;
     market_segment = market_segment_;
   }
    : lead_customer)

let make_update_lead_context
    ?qualification_status:(qualification_status_ : lead_qualification_status option)
    ?interaction:(interaction_ : lead_interaction option)
    ?insights:(insights_ : lead_insights option) ~customer:(customer_ : lead_customer) () =
  ({
     qualification_status = qualification_status_;
     customer = customer_;
     interaction = interaction_;
     insights = insights_;
   }
    : update_lead_context)

let make_update_engagement_context_request ~catalog:(catalog_ : catalog_identifier)
    ~engagement_identifier:(engagement_identifier_ : engagement_arn_or_identifier)
    ~context_identifier:(context_identifier_ : engagement_context_identifier)
    ~engagement_last_modified_at:(engagement_last_modified_at_ : date_time)
    ~type_:(type__ : engagement_context_type)
    ~payload:(payload_ : update_engagement_context_payload) () =
  ({
     catalog = catalog_;
     engagement_identifier = engagement_identifier_;
     context_identifier = context_identifier_;
     engagement_last_modified_at = engagement_last_modified_at_;
     type_ = type__;
     payload = payload_;
   }
    : update_engagement_context_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_put_selling_system_settings_response
    ?resource_snapshot_job_role_arn:
      (resource_snapshot_job_role_arn_ : resource_snapshot_job_role_arn option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ catalog = catalog_; resource_snapshot_job_role_arn = resource_snapshot_job_role_arn_ }
    : put_selling_system_settings_response)

let make_put_selling_system_settings_request
    ?resource_snapshot_job_role_identifier:
      (resource_snapshot_job_role_identifier_ : resource_snapshot_job_role_identifier option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     resource_snapshot_job_role_identifier = resource_snapshot_job_role_identifier_;
   }
    : put_selling_system_settings_request)

let make_list_tags_for_resource_response ~tags:(tags_ : tag_list) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_get_selling_system_settings_response
    ?resource_snapshot_job_role_arn:
      (resource_snapshot_job_role_arn_ : resource_snapshot_job_role_arn option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({ catalog = catalog_; resource_snapshot_job_role_arn = resource_snapshot_job_role_arn_ }
    : get_selling_system_settings_response)

let make_get_selling_system_settings_request ~catalog:(catalog_ : catalog_identifier) () =
  ({ catalog = catalog_ } : get_selling_system_settings_request)

let make_create_engagement_context_response
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?engagement_arn:(engagement_arn_ : engagement_arn option)
    ?engagement_last_modified_at:(engagement_last_modified_at_ : date_time option)
    ?context_id:(context_id_ : engagement_context_identifier option) () =
  ({
     engagement_id = engagement_id_;
     engagement_arn = engagement_arn_;
     engagement_last_modified_at = engagement_last_modified_at_;
     context_id = context_id_;
   }
    : create_engagement_context_response)

let make_lead_context ?insights:(insights_ : lead_insights option)
    ?qualification_status:(qualification_status_ : lead_qualification_status option)
    ~customer:(customer_ : lead_customer) ~interactions:(interactions_ : lead_interaction_list) () =
  ({
     insights = insights_;
     qualification_status = qualification_status_;
     customer = customer_;
     interactions = interactions_;
   }
    : lead_context)

let make_create_engagement_context_request ~catalog:(catalog_ : catalog_identifier)
    ~engagement_identifier:(engagement_identifier_ : engagement_arn_or_identifier)
    ~client_token:(client_token_ : client_token) ~type_:(type__ : engagement_context_type)
    ~payload:(payload_ : engagement_context_payload) () =
  ({
     catalog = catalog_;
     engagement_identifier = engagement_identifier_;
     client_token = client_token_;
     type_ = type__;
     payload = payload_;
   }
    : create_engagement_context_request)

let make_accept_engagement_invitation_request ~catalog:(catalog_ : catalog_identifier)
    ~identifier:(identifier_ : engagement_invitation_arn_or_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : accept_engagement_invitation_request)

let make_address ?city:(city_ : address_part option)
    ?postal_code:(postal_code_ : address_part option)
    ?state_or_region:(state_or_region_ : address_part option)
    ?country_code:(country_code_ : country_code option)
    ?street_address:(street_address_ : address_part option) () =
  ({
     city = city_;
     postal_code = postal_code_;
     state_or_region = state_or_region_;
     country_code = country_code_;
     street_address = street_address_;
   }
    : address)

let make_account ?industry:(industry_ : industry option)
    ?other_industry:(other_industry_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?website_url:(website_url_ : website_url option)
    ?aws_account_id:(aws_account_id_ : aws_account option) ?address:(address_ : address option)
    ?duns:(duns_ : duns_number option) ~company_name:(company_name_ : name) () =
  ({
     industry = industry_;
     other_industry = other_industry_;
     company_name = company_name_;
     website_url = website_url_;
     aws_account_id = aws_account_id_;
     address = address_;
     duns = duns_;
   }
    : account)

let make_account_receiver ?alias:(alias_ : alias option)
    ~aws_account_id:(aws_account_id_ : aws_account) () =
  ({ alias = alias_; aws_account_id = aws_account_id_ } : account_receiver)

let make_account_summary ?industry:(industry_ : industry option)
    ?other_industry:(other_industry_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?website_url:(website_url_ : website_url option) ?address:(address_ : address_summary option)
    ~company_name:(company_name_ : name) () =
  ({
     industry = industry_;
     other_industry = other_industry_;
     company_name = company_name_;
     website_url = website_url_;
     address = address_;
   }
    : account_summary)

let make_assignee_contact ?phone:(phone_ : phone_number option) ~email:(email_ : email)
    ~first_name:(first_name_ : name) ~last_name:(last_name_ : name)
    ~business_title:(business_title_ : job_title) () =
  ({
     email = email_;
     first_name = first_name_;
     last_name = last_name_;
     phone = phone_;
     business_title = business_title_;
   }
    : assignee_contact)

let make_assign_opportunity_request ~catalog:(catalog_ : catalog_identifier)
    ~identifier:(identifier_ : opportunity_identifier) ~assignee:(assignee_ : assignee_contact) () =
  ({ catalog = catalog_; identifier = identifier_; assignee = assignee_ }
    : assign_opportunity_request)

let make_associate_opportunity_request ~catalog:(catalog_ : catalog_identifier)
    ~opportunity_identifier:(opportunity_identifier_ : opportunity_identifier)
    ~related_entity_type:(related_entity_type_ : related_entity_type)
    ~related_entity_identifier:(related_entity_identifier_ : Smaws_Lib.Smithy_api.Types.string_) ()
    =
  ({
     catalog = catalog_;
     opportunity_identifier = opportunity_identifier_;
     related_entity_type = related_entity_type_;
     related_entity_identifier = related_entity_identifier_;
   }
    : associate_opportunity_request)

let make_contact ?email:(email_ : email option) ?first_name:(first_name_ : name option)
    ?last_name:(last_name_ : name option) ?business_title:(business_title_ : job_title option)
    ?phone:(phone_ : phone_number option) () =
  ({
     email = email_;
     first_name = first_name_;
     last_name = last_name_;
     business_title = business_title_;
     phone = phone_;
   }
    : contact)

let make_aws_opportunity_customer ?contacts:(contacts_ : customer_contacts_list option) () =
  ({ contacts = contacts_ } : aws_opportunity_customer)

let make_recommendation ?attributes:(attributes_ : recommendation_attribute_map option)
    ~type_:(type__ : Smaws_Lib.Smithy_api.Types.string_)
    ~details:(details_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ type_ = type__; details = details_; attributes = attributes_ } : recommendation)

let make_opportunity_quality ?score:(score_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?trend:(trend_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ score = score_; trend = trend_ } : opportunity_quality)

let make_aws_product_optimization ~description:(description_ : Smaws_Lib.Smithy_api.Types.string_)
    ~savings_amount:(savings_amount_ : monetary_amount) () =
  ({ description = description_; savings_amount = savings_amount_ } : aws_product_optimization)

let make_aws_product_details
    ?service_code:(service_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?amount:(amount_ : monetary_amount option)
    ?optimized_amount:(optimized_amount_ : monetary_amount option)
    ?potential_savings_amount:(potential_savings_amount_ : monetary_amount option)
    ~product_code:(product_code_ : Smaws_Lib.Smithy_api.Types.string_)
    ~categories:(categories_ : string_list)
    ~optimizations:(optimizations_ : aws_product_optimizations_list) () =
  ({
     product_code = product_code_;
     service_code = service_code_;
     categories = categories_;
     amount = amount_;
     optimized_amount = optimized_amount_;
     potential_savings_amount = potential_savings_amount_;
     optimizations = optimizations_;
   }
    : aws_product_details)

let make_aws_product_insights ?total_amount:(total_amount_ : monetary_amount option)
    ?total_optimized_amount:(total_optimized_amount_ : monetary_amount option)
    ?total_potential_savings_amount:(total_potential_savings_amount_ : monetary_amount option)
    ~currency_code:(currency_code_ : currency_code) ~frequency:(frequency_ : payment_frequency)
    ~total_amount_by_category:(total_amount_by_category_ : amount_map)
    ~aws_products:(aws_products_ : aws_products_list) () =
  ({
     currency_code = currency_code_;
     frequency = frequency_;
     total_amount = total_amount_;
     total_optimized_amount = total_optimized_amount_;
     total_potential_savings_amount = total_potential_savings_amount_;
     total_amount_by_category = total_amount_by_category_;
     aws_products = aws_products_;
   }
    : aws_product_insights)

let make_aws_products_spend_insights_by_source ?partner:(partner_ : aws_product_insights option)
    ?aw_s:(aw_s_ : aws_product_insights option) () =
  ({ partner = partner_; aw_s = aw_s_ } : aws_products_spend_insights_by_source)

let make_aws_opportunity_insights
    ?next_best_actions:(next_best_actions_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?engagement_score:(engagement_score_ : engagement_score option)
    ?aws_products_spend_insights_by_source:
      (aws_products_spend_insights_by_source_ : aws_products_spend_insights_by_source option)
    ?opportunity_quality:(opportunity_quality_ : opportunity_quality option)
    ?recommendations:(recommendations_ : recommendation_list option) () =
  ({
     next_best_actions = next_best_actions_;
     engagement_score = engagement_score_;
     aws_products_spend_insights_by_source = aws_products_spend_insights_by_source_;
     opportunity_quality = opportunity_quality_;
     recommendations = recommendations_;
   }
    : aws_opportunity_insights)

let make_profile_next_steps_history ~value:(value_ : Smaws_Lib.Smithy_api.Types.string_)
    ~time:(time_ : date_time) () =
  ({ value = value_; time = time_ } : profile_next_steps_history)

let make_aws_opportunity_life_cycle ?target_close_date:(target_close_date_ : date option)
    ?closed_lost_reason:(closed_lost_reason_ : aws_closed_lost_reason option)
    ?stage:(stage_ : aws_opportunity_stage option) ?next_steps:(next_steps_ : pii_string option)
    ?next_steps_history:(next_steps_history_ : profile_next_steps_histories option) () =
  ({
     target_close_date = target_close_date_;
     closed_lost_reason = closed_lost_reason_;
     stage = stage_;
     next_steps = next_steps_;
     next_steps_history = next_steps_history_;
   }
    : aws_opportunity_life_cycle)

let make_expected_customer_spend ?amount:(amount_ : amount option)
    ?estimation_url:(estimation_url_ : estimation_url option)
    ~currency_code:(currency_code_ : currency_code) ~frequency:(frequency_ : payment_frequency)
    ~target_company:(target_company_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     amount = amount_;
     currency_code = currency_code_;
     frequency = frequency_;
     target_company = target_company_;
     estimation_url = estimation_url_;
   }
    : expected_customer_spend)

let make_aws_opportunity_project
    ?expected_customer_spend:(expected_customer_spend_ : expected_customer_spend_list option)
    ?aws_partition:(aws_partition_ : aws_partition option) () =
  ({ expected_customer_spend = expected_customer_spend_; aws_partition = aws_partition_ }
    : aws_opportunity_project)

let make_aws_opportunity_related_entities
    ?aws_products:(aws_products_ : aws_product_identifiers option)
    ?solutions:(solutions_ : solution_identifiers option)
    ?aws_marketplace_solutions:
      (aws_marketplace_solutions_ : aws_marketplace_solution_identifiers option)
    ?aws_marketplace_products:
      (aws_marketplace_products_ : aws_marketplace_product_identifiers option) () =
  ({
     aws_products = aws_products_;
     solutions = solutions_;
     aws_marketplace_solutions = aws_marketplace_solutions_;
     aws_marketplace_products = aws_marketplace_products_;
   }
    : aws_opportunity_related_entities)

let make_aws_team_member ?email:(email_ : email option) ?first_name:(first_name_ : name option)
    ?last_name:(last_name_ : name option)
    ?business_title:(business_title_ : aws_member_business_title option) () =
  ({
     email = email_;
     first_name = first_name_;
     last_name = last_name_;
     business_title = business_title_;
   }
    : aws_team_member)

let make_aws_opportunity_summary_full_view
    ?related_opportunity_id:(related_opportunity_id_ : opportunity_identifier option)
    ?origin:(origin_ : opportunity_origin option)
    ?involvement_type:(involvement_type_ : sales_involvement_type option)
    ?visibility:(visibility_ : visibility option)
    ?life_cycle:(life_cycle_ : aws_opportunity_life_cycle option)
    ?opportunity_team:(opportunity_team_ : aws_opportunity_team_members_list option)
    ?insights:(insights_ : aws_opportunity_insights option)
    ?involvement_type_change_reason:
      (involvement_type_change_reason_ : involvement_type_change_reason option)
    ?related_entity_ids:(related_entity_ids_ : aws_opportunity_related_entities option)
    ?customer:(customer_ : aws_opportunity_customer option)
    ?project:(project_ : aws_opportunity_project option)
    ?cosell_motion:(cosell_motion_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     related_opportunity_id = related_opportunity_id_;
     origin = origin_;
     involvement_type = involvement_type_;
     visibility = visibility_;
     life_cycle = life_cycle_;
     opportunity_team = opportunity_team_;
     insights = insights_;
     involvement_type_change_reason = involvement_type_change_reason_;
     related_entity_ids = related_entity_ids_;
     customer = customer_;
     project = project_;
     cosell_motion = cosell_motion_;
   }
    : aws_opportunity_summary_full_view)

let make_aws_submission ?visibility:(visibility_ : visibility option)
    ~involvement_type:(involvement_type_ : sales_involvement_type) () =
  ({ involvement_type = involvement_type_; visibility = visibility_ } : aws_submission)

let make_create_engagement_response ?id:(id_ : engagement_identifier option)
    ?arn:(arn_ : engagement_arn option) ?modified_at:(modified_at_ : date_time option) () =
  ({ id = id_; arn = arn_; modified_at = modified_at_ } : create_engagement_response)

let make_engagement_context_details ?id:(id_ : engagement_context_identifier option)
    ?payload:(payload_ : engagement_context_payload option)
    ~type_:(type__ : engagement_context_type) () =
  ({ id = id_; type_ = type__; payload = payload_ } : engagement_context_details)

let make_create_engagement_request ?contexts:(contexts_ : engagement_contexts option)
    ~catalog:(catalog_ : catalog_identifier) ~client_token:(client_token_ : client_token)
    ~title:(title_ : engagement_title) ~description:(description_ : engagement_description) () =
  ({
     catalog = catalog_;
     client_token = client_token_;
     title = title_;
     description = description_;
     contexts = contexts_;
   }
    : create_engagement_request)

let make_create_engagement_invitation_response ~id:(id_ : engagement_invitation_identifier)
    ~arn:(arn_ : engagement_invitation_arn) () =
  ({ id = id_; arn = arn_ } : create_engagement_invitation_response)

let make_lead_invitation_interaction ?usecase:(usecase_ : engagement_use_case option)
    ~source_type:(source_type_ : lead_source_type) ~source_id:(source_id_ : lead_source_id)
    ~source_name:(source_name_ : lead_source_name)
    ~contact_business_title:(contact_business_title_ : job_title) () =
  ({
     source_type = source_type_;
     source_id = source_id_;
     source_name = source_name_;
     usecase = usecase_;
     contact_business_title = contact_business_title_;
   }
    : lead_invitation_interaction)

let make_lead_invitation_customer ?industry:(industry_ : industry option)
    ?website_url:(website_url_ : company_website_url option)
    ?aws_maturity:(aws_maturity_ : aws_maturity option)
    ?market_segment:(market_segment_ : market_segment option)
    ~company_name:(company_name_ : company_name) ~country_code:(country_code_ : country_code) () =
  ({
     industry = industry_;
     company_name = company_name_;
     website_url = website_url_;
     country_code = country_code_;
     aws_maturity = aws_maturity_;
     market_segment = market_segment_;
   }
    : lead_invitation_customer)

let make_lead_invitation_payload ~customer:(customer_ : lead_invitation_customer)
    ~interaction:(interaction_ : lead_invitation_interaction) () =
  ({ customer = customer_; interaction = interaction_ } : lead_invitation_payload)

let make_project_details
    ~business_problem:(business_problem_ : engagement_customer_business_problem)
    ~title:(title_ : Smaws_Lib.Smithy_api.Types.string_)
    ~target_completion_date:(target_completion_date_ : date)
    ~expected_customer_spend:(expected_customer_spend_ : expected_customer_spend_list) () =
  ({
     business_problem = business_problem_;
     title = title_;
     target_completion_date = target_completion_date_;
     expected_customer_spend = expected_customer_spend_;
   }
    : project_details)

let make_sender_contact ?first_name:(first_name_ : name option)
    ?last_name:(last_name_ : name option) ?business_title:(business_title_ : job_title option)
    ?phone:(phone_ : phone_number option) ~email:(email_ : sender_contact_email) () =
  ({
     email = email_;
     first_name = first_name_;
     last_name = last_name_;
     business_title = business_title_;
     phone = phone_;
   }
    : sender_contact)

let make_opportunity_invitation_payload
    ?sender_contacts:(sender_contacts_ : sender_contact_list option)
    ~receiver_responsibilities:(receiver_responsibilities_ : receiver_responsibility_list)
    ~customer:(customer_ : engagement_customer) ~project:(project_ : project_details) () =
  ({
     sender_contacts = sender_contacts_;
     receiver_responsibilities = receiver_responsibilities_;
     customer = customer_;
     project = project_;
   }
    : opportunity_invitation_payload)

let make_invitation ~message:(message_ : invitation_message) ~receiver:(receiver_ : receiver)
    ~payload:(payload_ : payload) () =
  ({ message = message_; receiver = receiver_; payload = payload_ } : invitation)

let make_create_engagement_invitation_request ~catalog:(catalog_ : catalog_identifier)
    ~client_token:(client_token_ : client_token)
    ~engagement_identifier:(engagement_identifier_ : engagement_identifier)
    ~invitation:(invitation_ : invitation) () =
  ({
     catalog = catalog_;
     client_token = client_token_;
     engagement_identifier = engagement_identifier_;
     invitation = invitation_;
   }
    : create_engagement_invitation_request)

let make_create_opportunity_response
    ?partner_opportunity_identifier:
      (partner_opportunity_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?last_modified_date:(last_modified_date_ : date_time option) ~id:(id_ : opportunity_identifier)
    () =
  ({
     id = id_;
     partner_opportunity_identifier = partner_opportunity_identifier_;
     last_modified_date = last_modified_date_;
   }
    : create_opportunity_response)

let make_next_steps_history ~value:(value_ : Smaws_Lib.Smithy_api.Types.string_)
    ~time:(time_ : date_time) () =
  ({ value = value_; time = time_ } : next_steps_history)

let make_life_cycle ?stage:(stage_ : stage option)
    ?closed_lost_reason:(closed_lost_reason_ : closed_lost_reason option)
    ?next_steps:(next_steps_ : pii_string option)
    ?target_close_date:(target_close_date_ : date option)
    ?review_status:(review_status_ : review_status option)
    ?review_comments:(review_comments_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?review_status_reason:(review_status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?next_steps_history:(next_steps_history_ : next_steps_histories option) () =
  ({
     stage = stage_;
     closed_lost_reason = closed_lost_reason_;
     next_steps = next_steps_;
     target_close_date = target_close_date_;
     review_status = review_status_;
     review_comments = review_comments_;
     review_status_reason = review_status_reason_;
     next_steps_history = next_steps_history_;
   }
    : life_cycle)

let make_monetary_value ~amount:(amount_ : Smaws_Lib.Smithy_api.Types.string_)
    ~currency_code:(currency_code_ : currency_code) () =
  ({ amount = amount_; currency_code = currency_code_ } : monetary_value)

let make_software_revenue ?delivery_model:(delivery_model_ : revenue_model option)
    ?value:(value_ : monetary_value option) ?effective_date:(effective_date_ : date option)
    ?expiration_date:(expiration_date_ : date option) () =
  ({
     delivery_model = delivery_model_;
     value = value_;
     effective_date = effective_date_;
     expiration_date = expiration_date_;
   }
    : software_revenue)

let make_marketing ?campaign_name:(campaign_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source:(source_ : marketing_source option) ?use_cases:(use_cases_ : use_cases option)
    ?channels:(channels_ : channels option)
    ?aws_funding_used:(aws_funding_used_ : aws_funding_used option) () =
  ({
     campaign_name = campaign_name_;
     source = source_;
     use_cases = use_cases_;
     channels = channels_;
     aws_funding_used = aws_funding_used_;
   }
    : marketing)

let make_expected_contract_duration ~term:(term_ : expected_contract_duration_term)
    ~value:(value_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ term = term_; value = value_ } : expected_contract_duration)

let make_project ?delivery_models:(delivery_models_ : delivery_models option)
    ?expected_customer_spend:(expected_customer_spend_ : expected_customer_spend_list option)
    ?expected_contract_duration:(expected_contract_duration_ : expected_contract_duration option)
    ?title:(title_ : pii_string option) ?apn_programs:(apn_programs_ : apn_programs option)
    ?customer_business_problem:(customer_business_problem_ : pii_string option)
    ?customer_use_case:(customer_use_case_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?related_opportunity_identifier:
      (related_opportunity_identifier_ : opportunity_identifier option)
    ?sales_activities:(sales_activities_ : sales_activities option)
    ?competitor_name:(competitor_name_ : competitor_name option)
    ?other_competitor_names:(other_competitor_names_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?other_solution_description:(other_solution_description_ : pii_string option)
    ?additional_comments:(additional_comments_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?aws_partition:(aws_partition_ : aws_partition option) () =
  ({
     delivery_models = delivery_models_;
     expected_customer_spend = expected_customer_spend_;
     expected_contract_duration = expected_contract_duration_;
     title = title_;
     apn_programs = apn_programs_;
     customer_business_problem = customer_business_problem_;
     customer_use_case = customer_use_case_;
     related_opportunity_identifier = related_opportunity_identifier_;
     sales_activities = sales_activities_;
     competitor_name = competitor_name_;
     other_competitor_names = other_competitor_names_;
     other_solution_description = other_solution_description_;
     additional_comments = additional_comments_;
     aws_partition = aws_partition_;
   }
    : project)

let make_customer ?account:(account_ : account option)
    ?contacts:(contacts_ : customer_contacts_list option) () =
  ({ account = account_; contacts = contacts_ } : customer)

let make_create_opportunity_request
    ?primary_needs_from_aws:(primary_needs_from_aws_ : primary_needs_from_aws option)
    ?national_security:(national_security_ : national_security option)
    ?partner_opportunity_identifier:
      (partner_opportunity_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?customer:(customer_ : customer option) ?project:(project_ : project option)
    ?opportunity_type:(opportunity_type_ : opportunity_type option)
    ?marketing:(marketing_ : marketing option)
    ?software_revenue:(software_revenue_ : software_revenue option)
    ?life_cycle:(life_cycle_ : life_cycle option) ?origin:(origin_ : opportunity_origin option)
    ?opportunity_team:(opportunity_team_ : partner_opportunity_team_members_list option)
    ?tags:(tags_ : tag_list option) ~catalog:(catalog_ : catalog_identifier)
    ~client_token:(client_token_ : client_token) () =
  ({
     catalog = catalog_;
     primary_needs_from_aws = primary_needs_from_aws_;
     national_security = national_security_;
     partner_opportunity_identifier = partner_opportunity_identifier_;
     customer = customer_;
     project = project_;
     opportunity_type = opportunity_type_;
     marketing = marketing_;
     software_revenue = software_revenue_;
     client_token = client_token_;
     life_cycle = life_cycle_;
     origin = origin_;
     opportunity_team = opportunity_team_;
     tags = tags_;
   }
    : create_opportunity_request)

let make_create_resource_snapshot_response ?arn:(arn_ : resource_arn option)
    ?revision:(revision_ : resource_snapshot_revision option) () =
  ({ arn = arn_; revision = revision_ } : create_resource_snapshot_response)

let make_create_resource_snapshot_request ~catalog:(catalog_ : catalog_identifier)
    ~engagement_identifier:(engagement_identifier_ : engagement_identifier)
    ~resource_type:(resource_type_ : resource_type)
    ~resource_identifier:(resource_identifier_ : resource_identifier)
    ~resource_snapshot_template_identifier:
      (resource_snapshot_template_identifier_ : resource_template_name)
    ~client_token:(client_token_ : client_token) () =
  ({
     catalog = catalog_;
     engagement_identifier = engagement_identifier_;
     resource_type = resource_type_;
     resource_identifier = resource_identifier_;
     resource_snapshot_template_identifier = resource_snapshot_template_identifier_;
     client_token = client_token_;
   }
    : create_resource_snapshot_request)

let make_create_resource_snapshot_job_response ?id:(id_ : resource_snapshot_job_identifier option)
    ?arn:(arn_ : resource_snapshot_job_arn option) () =
  ({ id = id_; arn = arn_ } : create_resource_snapshot_job_response)

let make_create_resource_snapshot_job_request ?tags:(tags_ : tag_list option)
    ~catalog:(catalog_ : catalog_identifier) ~client_token:(client_token_ : client_token)
    ~engagement_identifier:(engagement_identifier_ : engagement_identifier)
    ~resource_type:(resource_type_ : resource_type)
    ~resource_identifier:(resource_identifier_ : resource_identifier)
    ~resource_snapshot_template_identifier:
      (resource_snapshot_template_identifier_ : resource_template_name) () =
  ({
     catalog = catalog_;
     client_token = client_token_;
     engagement_identifier = engagement_identifier_;
     resource_type = resource_type_;
     resource_identifier = resource_identifier_;
     resource_snapshot_template_identifier = resource_snapshot_template_identifier_;
     tags = tags_;
   }
    : create_resource_snapshot_job_request)

let make_created_date_filter ?after_created_date:(after_created_date_ : date_time option)
    ?before_created_date:(before_created_date_ : date_time option) () =
  ({ after_created_date = after_created_date_; before_created_date = before_created_date_ }
    : created_date_filter)

let make_customer_summary ?account:(account_ : account_summary option) () =
  ({ account = account_ } : customer_summary)

let make_delete_resource_snapshot_job_request ~catalog:(catalog_ : catalog_identifier)
    ~resource_snapshot_job_identifier:
      (resource_snapshot_job_identifier_ : resource_snapshot_job_identifier) () =
  ({ catalog = catalog_; resource_snapshot_job_identifier = resource_snapshot_job_identifier_ }
    : delete_resource_snapshot_job_request)

let make_disassociate_opportunity_request ~catalog:(catalog_ : catalog_identifier)
    ~opportunity_identifier:(opportunity_identifier_ : opportunity_identifier)
    ~related_entity_type:(related_entity_type_ : related_entity_type)
    ~related_entity_identifier:(related_entity_identifier_ : Smaws_Lib.Smithy_api.Types.string_) ()
    =
  ({
     catalog = catalog_;
     opportunity_identifier = opportunity_identifier_;
     related_entity_type = related_entity_type_;
     related_entity_identifier = related_entity_identifier_;
   }
    : disassociate_opportunity_request)

let make_engagement_invitation_summary ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payload_type:(payload_type_ : engagement_invitation_payload_type option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?engagement_title:(engagement_title_ : engagement_title option)
    ?status:(status_ : invitation_status option)
    ?invitation_date:(invitation_date_ : date_time option)
    ?expiration_date:(expiration_date_ : date_time option)
    ?sender_aws_account_id:(sender_aws_account_id_ : aws_account option)
    ?sender_company_name:(sender_company_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?receiver:(receiver_ : receiver option)
    ?participant_type:(participant_type_ : participant_type option)
    ~id:(id_ : engagement_invitation_arn_or_identifier) ~catalog:(catalog_ : catalog_identifier) ()
    =
  ({
     arn = arn_;
     payload_type = payload_type_;
     id = id_;
     engagement_id = engagement_id_;
     engagement_title = engagement_title_;
     status = status_;
     invitation_date = invitation_date_;
     expiration_date = expiration_date_;
     sender_aws_account_id = sender_aws_account_id_;
     sender_company_name = sender_company_name_;
     receiver = receiver_;
     catalog = catalog_;
     participant_type = participant_type_;
   }
    : engagement_invitation_summary)

let make_engagement_member ?company_name:(company_name_ : member_company_name option)
    ?website_url:(website_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_id:(account_id_ : aws_account option) () =
  ({ company_name = company_name_; website_url = website_url_; account_id = account_id_ }
    : engagement_member)

let make_engagement_member_summary ?company_name:(company_name_ : member_company_name option)
    ?website_url:(website_url_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ company_name = company_name_; website_url = website_url_ } : engagement_member_summary)

let make_engagement_resource_association_summary
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?resource_type:(resource_type_ : resource_type option)
    ?resource_id:(resource_id_ : resource_identifier option)
    ?created_by:(created_by_ : aws_account option) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     engagement_id = engagement_id_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     created_by = created_by_;
   }
    : engagement_resource_association_summary)

let make_engagement_sort ~sort_order:(sort_order_ : sort_order)
    ~sort_by:(sort_by_ : engagement_sort_name) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : engagement_sort)

let make_engagement_summary ?arn:(arn_ : engagement_arn option)
    ?id:(id_ : engagement_identifier option) ?title:(title_ : engagement_title option)
    ?created_at:(created_at_ : date_time option) ?created_by:(created_by_ : aws_account option)
    ?member_count:(member_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?modified_at:(modified_at_ : date_time option) ?modified_by:(modified_by_ : aws_account option)
    ?context_types:(context_types_ : engagement_context_type_list option) () =
  ({
     arn = arn_;
     id = id_;
     title = title_;
     created_at = created_at_;
     created_by = created_by_;
     member_count = member_count_;
     modified_at = modified_at_;
     modified_by = modified_by_;
     context_types = context_types_;
   }
    : engagement_summary)

let make_get_aws_opportunity_summary_response
    ?related_opportunity_id:(related_opportunity_id_ : opportunity_identifier option)
    ?origin:(origin_ : opportunity_origin option)
    ?involvement_type:(involvement_type_ : sales_involvement_type option)
    ?visibility:(visibility_ : visibility option)
    ?life_cycle:(life_cycle_ : aws_opportunity_life_cycle option)
    ?opportunity_team:(opportunity_team_ : aws_opportunity_team_members_list option)
    ?insights:(insights_ : aws_opportunity_insights option)
    ?involvement_type_change_reason:
      (involvement_type_change_reason_ : involvement_type_change_reason option)
    ?related_entity_ids:(related_entity_ids_ : aws_opportunity_related_entities option)
    ?customer:(customer_ : aws_opportunity_customer option)
    ?project:(project_ : aws_opportunity_project option)
    ?cosell_motion:(cosell_motion_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     related_opportunity_id = related_opportunity_id_;
     origin = origin_;
     involvement_type = involvement_type_;
     visibility = visibility_;
     life_cycle = life_cycle_;
     opportunity_team = opportunity_team_;
     insights = insights_;
     involvement_type_change_reason = involvement_type_change_reason_;
     related_entity_ids = related_entity_ids_;
     customer = customer_;
     project = project_;
     cosell_motion = cosell_motion_;
     catalog = catalog_;
   }
    : get_aws_opportunity_summary_response)

let make_get_aws_opportunity_summary_request ~catalog:(catalog_ : catalog_identifier)
    ~related_opportunity_identifier:(related_opportunity_identifier_ : opportunity_identifier) () =
  ({ catalog = catalog_; related_opportunity_identifier = related_opportunity_identifier_ }
    : get_aws_opportunity_summary_request)

let make_get_engagement_response ?id:(id_ : engagement_identifier option)
    ?arn:(arn_ : engagement_arn option) ?title:(title_ : engagement_title option)
    ?description:(description_ : engagement_description option)
    ?created_at:(created_at_ : date_time option) ?created_by:(created_by_ : aws_account option)
    ?member_count:(member_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?modified_at:(modified_at_ : date_time option) ?modified_by:(modified_by_ : aws_account option)
    ?contexts:(contexts_ : engagement_contexts option) () =
  ({
     id = id_;
     arn = arn_;
     title = title_;
     description = description_;
     created_at = created_at_;
     created_by = created_by_;
     member_count = member_count_;
     modified_at = modified_at_;
     modified_by = modified_by_;
     contexts = contexts_;
   }
    : get_engagement_response)

let make_get_engagement_request ~catalog:(catalog_ : catalog_identifier)
    ~identifier:(identifier_ : engagement_arn_or_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_engagement_request)

let make_get_engagement_invitation_response ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payload_type:(payload_type_ : engagement_invitation_payload_type option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?engagement_title:(engagement_title_ : engagement_title option)
    ?status:(status_ : invitation_status option)
    ?invitation_date:(invitation_date_ : date_time option)
    ?expiration_date:(expiration_date_ : date_time option)
    ?sender_aws_account_id:(sender_aws_account_id_ : aws_account option)
    ?sender_company_name:(sender_company_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?receiver:(receiver_ : receiver option)
    ?rejection_reason:(rejection_reason_ : rejection_reason_string option)
    ?payload:(payload_ : payload option)
    ?invitation_message:(invitation_message_ : invitation_message option)
    ?engagement_description:(engagement_description_ : engagement_description option)
    ?existing_members:(existing_members_ : engagement_member_summaries option)
    ~id:(id_ : engagement_invitation_arn_or_identifier) ~catalog:(catalog_ : catalog_identifier) ()
    =
  ({
     arn = arn_;
     payload_type = payload_type_;
     id = id_;
     engagement_id = engagement_id_;
     engagement_title = engagement_title_;
     status = status_;
     invitation_date = invitation_date_;
     expiration_date = expiration_date_;
     sender_aws_account_id = sender_aws_account_id_;
     sender_company_name = sender_company_name_;
     receiver = receiver_;
     catalog = catalog_;
     rejection_reason = rejection_reason_;
     payload = payload_;
     invitation_message = invitation_message_;
     engagement_description = engagement_description_;
     existing_members = existing_members_;
   }
    : get_engagement_invitation_response)

let make_get_engagement_invitation_request ~catalog:(catalog_ : catalog_identifier)
    ~identifier:(identifier_ : engagement_invitation_arn_or_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_engagement_invitation_request)

let make_related_entity_identifiers
    ?aws_marketplace_offers:(aws_marketplace_offers_ : aws_marketplace_offer_identifiers option)
    ?aws_marketplace_offer_sets:
      (aws_marketplace_offer_sets_ : aws_marketplace_offer_set_identifiers option)
    ?solutions:(solutions_ : solution_identifiers option)
    ?aws_products:(aws_products_ : aws_product_identifiers option)
    ?aws_marketplace_solutions:
      (aws_marketplace_solutions_ : aws_marketplace_solution_identifiers option)
    ?aws_marketplace_products:
      (aws_marketplace_products_ : aws_marketplace_product_identifiers option) () =
  ({
     aws_marketplace_offers = aws_marketplace_offers_;
     aws_marketplace_offer_sets = aws_marketplace_offer_sets_;
     solutions = solutions_;
     aws_products = aws_products_;
     aws_marketplace_solutions = aws_marketplace_solutions_;
     aws_marketplace_products = aws_marketplace_products_;
   }
    : related_entity_identifiers)

let make_get_opportunity_response
    ?primary_needs_from_aws:(primary_needs_from_aws_ : primary_needs_from_aws option)
    ?national_security:(national_security_ : national_security option)
    ?partner_opportunity_identifier:
      (partner_opportunity_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?customer:(customer_ : customer option) ?project:(project_ : project option)
    ?opportunity_type:(opportunity_type_ : opportunity_type option)
    ?marketing:(marketing_ : marketing option)
    ?software_revenue:(software_revenue_ : software_revenue option)
    ?arn:(arn_ : opportunity_arn option) ?life_cycle:(life_cycle_ : life_cycle option)
    ?opportunity_team:(opportunity_team_ : partner_opportunity_team_members_list option)
    ~catalog:(catalog_ : catalog_identifier) ~id:(id_ : opportunity_identifier)
    ~last_modified_date:(last_modified_date_ : date_time) ~created_date:(created_date_ : date_time)
    ~related_entity_identifiers:(related_entity_identifiers_ : related_entity_identifiers) () =
  ({
     catalog = catalog_;
     primary_needs_from_aws = primary_needs_from_aws_;
     national_security = national_security_;
     partner_opportunity_identifier = partner_opportunity_identifier_;
     customer = customer_;
     project = project_;
     opportunity_type = opportunity_type_;
     marketing = marketing_;
     software_revenue = software_revenue_;
     id = id_;
     arn = arn_;
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     related_entity_identifiers = related_entity_identifiers_;
     life_cycle = life_cycle_;
     opportunity_team = opportunity_team_;
   }
    : get_opportunity_response)

let make_get_opportunity_request ~catalog:(catalog_ : catalog_identifier)
    ~identifier:(identifier_ : opportunity_identifier) () =
  ({ catalog = catalog_; identifier = identifier_ } : get_opportunity_request)

let make_get_prospecting_from_engagement_task_response ?end_time:(end_time_ : date_time option)
    ~task_id:(task_id_ : prospecting_task_identifier) ~task_arn:(task_arn_ : prospecting_task_arn)
    ~task_name:(task_name_ : task_name) ~start_time:(start_time_ : date_time)
    ~engagements:(engagements_ : engagement_prospecting_result_list) () =
  ({
     task_id = task_id_;
     task_arn = task_arn_;
     task_name = task_name_;
     start_time = start_time_;
     end_time = end_time_;
     engagements = engagements_;
   }
    : get_prospecting_from_engagement_task_response)

let make_get_prospecting_from_engagement_task_request ~catalog:(catalog_ : catalog_identifier)
    ~task_identifier:(task_identifier_ : prospecting_task_identifier) () =
  ({ catalog = catalog_; task_identifier = task_identifier_ }
    : get_prospecting_from_engagement_task_request)

let make_project_view ?delivery_models:(delivery_models_ : delivery_models option)
    ?expected_customer_spend:(expected_customer_spend_ : expected_customer_spend_list option)
    ?expected_contract_duration:(expected_contract_duration_ : expected_contract_duration option)
    ?customer_use_case:(customer_use_case_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sales_activities:(sales_activities_ : sales_activities option)
    ?other_solution_description:(other_solution_description_ : pii_string option) () =
  ({
     delivery_models = delivery_models_;
     expected_customer_spend = expected_customer_spend_;
     expected_contract_duration = expected_contract_duration_;
     customer_use_case = customer_use_case_;
     sales_activities = sales_activities_;
     other_solution_description = other_solution_description_;
   }
    : project_view)

let make_life_cycle_for_view ?target_close_date:(target_close_date_ : date option)
    ?review_status:(review_status_ : review_status option) ?stage:(stage_ : stage option)
    ?next_steps:(next_steps_ : pii_string option) () =
  ({
     target_close_date = target_close_date_;
     review_status = review_status_;
     stage = stage_;
     next_steps = next_steps_;
   }
    : life_cycle_for_view)

let make_opportunity_summary_view ?opportunity_type:(opportunity_type_ : opportunity_type option)
    ?lifecycle:(lifecycle_ : life_cycle_for_view option)
    ?opportunity_team:(opportunity_team_ : partner_opportunity_team_members_list option)
    ?primary_needs_from_aws:(primary_needs_from_aws_ : primary_needs_from_aws option)
    ?customer:(customer_ : customer option) ?project:(project_ : project_view option)
    ?related_entity_identifiers:(related_entity_identifiers_ : related_entity_identifiers option) ()
    =
  ({
     opportunity_type = opportunity_type_;
     lifecycle = lifecycle_;
     opportunity_team = opportunity_team_;
     primary_needs_from_aws = primary_needs_from_aws_;
     customer = customer_;
     project = project_;
     related_entity_identifiers = related_entity_identifiers_;
   }
    : opportunity_summary_view)

let make_get_resource_snapshot_response ?arn:(arn_ : resource_arn option)
    ?created_by:(created_by_ : aws_account option) ?created_at:(created_at_ : date_time option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?resource_type:(resource_type_ : resource_type option)
    ?resource_id:(resource_id_ : resource_identifier option)
    ?resource_snapshot_template_name:
      (resource_snapshot_template_name_ : resource_template_name option)
    ?revision:(revision_ : resource_snapshot_revision option)
    ?payload:(payload_ : resource_snapshot_payload option)
    ?target_member_accounts:(target_member_accounts_ : aws_account_id_or_alias_list option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     arn = arn_;
     created_by = created_by_;
     created_at = created_at_;
     engagement_id = engagement_id_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     resource_snapshot_template_name = resource_snapshot_template_name_;
     revision = revision_;
     payload = payload_;
     target_member_accounts = target_member_accounts_;
   }
    : get_resource_snapshot_response)

let make_get_resource_snapshot_request ?revision:(revision_ : resource_snapshot_revision option)
    ~catalog:(catalog_ : catalog_identifier)
    ~engagement_identifier:(engagement_identifier_ : engagement_identifier)
    ~resource_type:(resource_type_ : resource_type)
    ~resource_identifier:(resource_identifier_ : resource_identifier)
    ~resource_snapshot_template_identifier:
      (resource_snapshot_template_identifier_ : resource_template_name) () =
  ({
     catalog = catalog_;
     engagement_identifier = engagement_identifier_;
     resource_type = resource_type_;
     resource_identifier = resource_identifier_;
     resource_snapshot_template_identifier = resource_snapshot_template_identifier_;
     revision = revision_;
   }
    : get_resource_snapshot_request)

let make_get_resource_snapshot_job_response ?id:(id_ : resource_snapshot_job_identifier option)
    ?arn:(arn_ : resource_snapshot_job_arn option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?resource_type:(resource_type_ : resource_type option)
    ?resource_id:(resource_id_ : resource_identifier option)
    ?resource_arn:(resource_arn_ : resource_arn option)
    ?resource_snapshot_template_name:
      (resource_snapshot_template_name_ : resource_template_name option)
    ?created_at:(created_at_ : date_time option)
    ?status:(status_ : resource_snapshot_job_status option)
    ?last_successful_execution_date:(last_successful_execution_date_ : date_time option)
    ?last_failure:(last_failure_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     engagement_id = engagement_id_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     resource_arn = resource_arn_;
     resource_snapshot_template_name = resource_snapshot_template_name_;
     created_at = created_at_;
     status = status_;
     last_successful_execution_date = last_successful_execution_date_;
     last_failure = last_failure_;
   }
    : get_resource_snapshot_job_response)

let make_get_resource_snapshot_job_request ~catalog:(catalog_ : catalog_identifier)
    ~resource_snapshot_job_identifier:
      (resource_snapshot_job_identifier_ : resource_snapshot_job_identifier) () =
  ({ catalog = catalog_; resource_snapshot_job_identifier = resource_snapshot_job_identifier_ }
    : get_resource_snapshot_job_request)

let make_last_modified_date ?after_last_modified_date:(after_last_modified_date_ : date_time option)
    ?before_last_modified_date:(before_last_modified_date_ : date_time option) () =
  ({
     after_last_modified_date = after_last_modified_date_;
     before_last_modified_date = before_last_modified_date_;
   }
    : last_modified_date)

let make_life_cycle_summary ?stage:(stage_ : stage option)
    ?closed_lost_reason:(closed_lost_reason_ : closed_lost_reason option)
    ?next_steps:(next_steps_ : pii_string option)
    ?target_close_date:(target_close_date_ : date option)
    ?review_status:(review_status_ : review_status option)
    ?review_comments:(review_comments_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?review_status_reason:(review_status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     stage = stage_;
     closed_lost_reason = closed_lost_reason_;
     next_steps = next_steps_;
     target_close_date = target_close_date_;
     review_status = review_status_;
     review_comments = review_comments_;
     review_status_reason = review_status_reason_;
   }
    : life_cycle_summary)

let make_list_engagement_by_accepting_invitation_task_summary
    ?task_id:(task_id_ : task_identifier option) ?task_arn:(task_arn_ : task_arn option)
    ?start_time:(start_time_ : date_time option) ?task_status:(task_status_ : task_status option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reason_code:(reason_code_ : reason_code option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?engagement_invitation_id:(engagement_invitation_id_ : engagement_invitation_identifier option)
    () =
  ({
     task_id = task_id_;
     task_arn = task_arn_;
     start_time = start_time_;
     task_status = task_status_;
     message = message_;
     reason_code = reason_code_;
     opportunity_id = opportunity_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     engagement_invitation_id = engagement_invitation_id_;
   }
    : list_engagement_by_accepting_invitation_task_summary)

let make_list_engagement_by_accepting_invitation_tasks_response
    ?task_summaries:
      (task_summaries_ : list_engagement_by_accepting_invitation_task_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ task_summaries = task_summaries_; next_token = next_token_ }
    : list_engagement_by_accepting_invitation_tasks_response)

let make_list_tasks_sort_base ~sort_order:(sort_order_ : sort_order)
    ~sort_by:(sort_by_ : list_tasks_sort_name) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : list_tasks_sort_base)

let make_list_engagement_by_accepting_invitation_tasks_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sort:(sort_ : list_tasks_sort_base option) ?task_status:(task_status_ : task_statuses option)
    ?opportunity_identifier:(opportunity_identifier_ : opportunity_identifiers option)
    ?engagement_invitation_identifier:
      (engagement_invitation_identifier_ : engagement_invitation_identifiers option)
    ?task_identifier:(task_identifier_ : task_identifiers option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort = sort_;
     catalog = catalog_;
     task_status = task_status_;
     opportunity_identifier = opportunity_identifier_;
     engagement_invitation_identifier = engagement_invitation_identifier_;
     task_identifier = task_identifier_;
   }
    : list_engagement_by_accepting_invitation_tasks_request)

let make_list_engagement_from_opportunity_task_summary ?task_id:(task_id_ : task_identifier option)
    ?task_arn:(task_arn_ : task_arn option) ?start_time:(start_time_ : date_time option)
    ?task_status:(task_status_ : task_status option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reason_code:(reason_code_ : reason_code option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?engagement_invitation_id:(engagement_invitation_id_ : engagement_invitation_identifier option)
    () =
  ({
     task_id = task_id_;
     task_arn = task_arn_;
     start_time = start_time_;
     task_status = task_status_;
     message = message_;
     reason_code = reason_code_;
     opportunity_id = opportunity_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     engagement_id = engagement_id_;
     engagement_invitation_id = engagement_invitation_id_;
   }
    : list_engagement_from_opportunity_task_summary)

let make_list_engagement_from_opportunity_tasks_response
    ?task_summaries:(task_summaries_ : list_engagement_from_opportunity_task_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ task_summaries = task_summaries_; next_token = next_token_ }
    : list_engagement_from_opportunity_tasks_response)

let make_list_engagement_from_opportunity_tasks_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sort:(sort_ : list_tasks_sort_base option) ?task_status:(task_status_ : task_statuses option)
    ?task_identifier:(task_identifier_ : task_identifiers option)
    ?opportunity_identifier:(opportunity_identifier_ : opportunity_identifiers option)
    ?engagement_identifier:(engagement_identifier_ : engagement_identifiers option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort = sort_;
     catalog = catalog_;
     task_status = task_status_;
     task_identifier = task_identifier_;
     opportunity_identifier = opportunity_identifier_;
     engagement_identifier = engagement_identifier_;
   }
    : list_engagement_from_opportunity_tasks_request)

let make_list_engagement_invitations_response
    ?engagement_invitation_summaries:
      (engagement_invitation_summaries_ : engagement_invitation_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ engagement_invitation_summaries = engagement_invitation_summaries_; next_token = next_token_ }
    : list_engagement_invitations_response)

let make_opportunity_engagement_invitation_sort ~sort_order:(sort_order_ : sort_order)
    ~sort_by:(sort_by_ : opportunity_engagement_invitation_sort_name) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : opportunity_engagement_invitation_sort)

let make_list_engagement_invitations_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sort:(sort_ : opportunity_engagement_invitation_sort option)
    ?payload_type:(payload_type_ : engagement_invitations_payload_type option)
    ?status:(status_ : invitation_status_list option)
    ?engagement_identifier:(engagement_identifier_ : engagement_identifiers option)
    ?sender_aws_account_id:(sender_aws_account_id_ : aws_account_id_or_alias_list option)
    ~catalog:(catalog_ : catalog_identifier)
    ~participant_type:(participant_type_ : participant_type) () =
  ({
     catalog = catalog_;
     max_results = max_results_;
     next_token = next_token_;
     sort = sort_;
     payload_type = payload_type_;
     participant_type = participant_type_;
     status = status_;
     engagement_identifier = engagement_identifier_;
     sender_aws_account_id = sender_aws_account_id_;
   }
    : list_engagement_invitations_request)

let make_list_engagement_members_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~engagement_member_list:(engagement_member_list_ : engagement_members) () =
  ({ engagement_member_list = engagement_member_list_; next_token = next_token_ }
    : list_engagement_members_response)

let make_list_engagement_members_request ?max_results:(max_results_ : member_page_size option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~catalog:(catalog_ : catalog_identifier)
    ~identifier:(identifier_ : engagement_arn_or_identifier) () =
  ({
     catalog = catalog_;
     identifier = identifier_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_engagement_members_request)

let make_list_engagement_resource_associations_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~engagement_resource_association_summaries:
      (engagement_resource_association_summaries_ : engagement_resource_association_summary_list) ()
    =
  ({
     engagement_resource_association_summaries = engagement_resource_association_summaries_;
     next_token = next_token_;
   }
    : list_engagement_resource_associations_response)

let make_list_engagement_resource_associations_request
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?engagement_identifier:(engagement_identifier_ : engagement_identifier option)
    ?resource_type:(resource_type_ : resource_type option)
    ?resource_identifier:(resource_identifier_ : resource_identifier option)
    ?created_by:(created_by_ : aws_account option) ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     max_results = max_results_;
     next_token = next_token_;
     engagement_identifier = engagement_identifier_;
     resource_type = resource_type_;
     resource_identifier = resource_identifier_;
     created_by = created_by_;
   }
    : list_engagement_resource_associations_request)

let make_list_engagements_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~engagement_summary_list:(engagement_summary_list_ : engagement_summary_list) () =
  ({ engagement_summary_list = engagement_summary_list_; next_token = next_token_ }
    : list_engagements_response)

let make_list_engagements_request ?created_by:(created_by_ : aws_account_list option)
    ?exclude_created_by:(exclude_created_by_ : aws_account_list option)
    ?context_types:(context_types_ : engagement_context_type_list option)
    ?exclude_context_types:(exclude_context_types_ : engagement_context_type_list option)
    ?sort:(sort_ : engagement_sort option) ?max_results:(max_results_ : engagement_page_size option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?engagement_identifier:(engagement_identifier_ : engagement_identifiers option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     created_by = created_by_;
     exclude_created_by = exclude_created_by_;
     context_types = context_types_;
     exclude_context_types = exclude_context_types_;
     sort = sort_;
     max_results = max_results_;
     next_token = next_token_;
     engagement_identifier = engagement_identifier_;
   }
    : list_engagements_request)

let make_project_summary ?delivery_models:(delivery_models_ : delivery_models option)
    ?expected_customer_spend:(expected_customer_spend_ : expected_customer_spend_list option)
    ?expected_contract_duration:(expected_contract_duration_ : expected_contract_duration option) ()
    =
  ({
     delivery_models = delivery_models_;
     expected_customer_spend = expected_customer_spend_;
     expected_contract_duration = expected_contract_duration_;
   }
    : project_summary)

let make_opportunity_summary ?id:(id_ : opportunity_identifier option)
    ?arn:(arn_ : opportunity_arn option)
    ?partner_opportunity_identifier:
      (partner_opportunity_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?opportunity_type:(opportunity_type_ : opportunity_type option)
    ?last_modified_date:(last_modified_date_ : date_time option)
    ?created_date:(created_date_ : date_time option)
    ?life_cycle:(life_cycle_ : life_cycle_summary option)
    ?customer:(customer_ : customer_summary option) ?project:(project_ : project_summary option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     partner_opportunity_identifier = partner_opportunity_identifier_;
     opportunity_type = opportunity_type_;
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     life_cycle = life_cycle_;
     customer = customer_;
     project = project_;
   }
    : opportunity_summary)

let make_list_opportunities_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~opportunity_summaries:(opportunity_summaries_ : opportunity_summaries) () =
  ({ opportunity_summaries = opportunity_summaries_; next_token = next_token_ }
    : list_opportunities_response)

let make_target_close_date_filter ?after_target_close_date:(after_target_close_date_ : date option)
    ?before_target_close_date:(before_target_close_date_ : date option) () =
  ({
     after_target_close_date = after_target_close_date_;
     before_target_close_date = before_target_close_date_;
   }
    : target_close_date_filter)

let make_opportunity_sort ~sort_order:(sort_order_ : sort_order)
    ~sort_by:(sort_by_ : opportunity_sort_name) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : opportunity_sort)

let make_list_opportunities_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sort:(sort_ : opportunity_sort option)
    ?last_modified_date:(last_modified_date_ : last_modified_date option)
    ?identifier:(identifier_ : filter_identifier option)
    ?life_cycle_stage:(life_cycle_stage_ : filter_life_cycle_stage option)
    ?life_cycle_review_status:(life_cycle_review_status_ : filter_life_cycle_review_status option)
    ?customer_company_name:(customer_company_name_ : string_list option)
    ?created_date:(created_date_ : created_date_filter option)
    ?target_close_date:(target_close_date_ : target_close_date_filter option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     max_results = max_results_;
     next_token = next_token_;
     sort = sort_;
     last_modified_date = last_modified_date_;
     identifier = identifier_;
     life_cycle_stage = life_cycle_stage_;
     life_cycle_review_status = life_cycle_review_status_;
     customer_company_name = customer_company_name_;
     created_date = created_date_;
     target_close_date = target_close_date_;
   }
    : list_opportunities_request)

let make_list_opportunity_from_engagement_task_summary ?task_id:(task_id_ : task_identifier option)
    ?task_arn:(task_arn_ : task_arn option) ?start_time:(start_time_ : date_time option)
    ?task_status:(task_status_ : task_status option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reason_code:(reason_code_ : reason_code option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?context_id:(context_id_ : context_identifier option) () =
  ({
     task_id = task_id_;
     task_arn = task_arn_;
     start_time = start_time_;
     task_status = task_status_;
     message = message_;
     reason_code = reason_code_;
     opportunity_id = opportunity_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     engagement_id = engagement_id_;
     context_id = context_id_;
   }
    : list_opportunity_from_engagement_task_summary)

let make_list_opportunity_from_engagement_tasks_response
    ?task_summaries:(task_summaries_ : list_opportunity_from_engagement_task_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ task_summaries = task_summaries_; next_token = next_token_ }
    : list_opportunity_from_engagement_tasks_response)

let make_list_opportunity_from_engagement_tasks_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sort:(sort_ : list_tasks_sort_base option) ?task_status:(task_status_ : task_statuses option)
    ?task_identifier:(task_identifier_ : task_identifiers option)
    ?opportunity_identifier:(opportunity_identifier_ : opportunity_identifiers option)
    ?engagement_identifier:(engagement_identifier_ : engagement_identifiers option)
    ?context_identifier:(context_identifier_ : context_identifiers option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort = sort_;
     catalog = catalog_;
     task_status = task_status_;
     task_identifier = task_identifier_;
     opportunity_identifier = opportunity_identifier_;
     engagement_identifier = engagement_identifier_;
     context_identifier = context_identifier_;
   }
    : list_opportunity_from_engagement_tasks_request)

let make_prospecting_task_summary ?end_time:(end_time_ : date_time option)
    ~task_id:(task_id_ : prospecting_task_identifier) ~task_arn:(task_arn_ : prospecting_task_arn)
    ~task_name:(task_name_ : task_name) ~start_time:(start_time_ : date_time)
    ~total_engagement_count:(total_engagement_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~completed_engagement_count:(completed_engagement_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~failed_engagement_count:(failed_engagement_count_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({
     task_id = task_id_;
     task_arn = task_arn_;
     task_name = task_name_;
     start_time = start_time_;
     end_time = end_time_;
     total_engagement_count = total_engagement_count_;
     completed_engagement_count = completed_engagement_count_;
     failed_engagement_count = failed_engagement_count_;
   }
    : prospecting_task_summary)

let make_list_prospecting_from_engagement_tasks_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~task_summaries:(task_summaries_ : prospecting_task_summary_list) () =
  ({ next_token = next_token_; task_summaries = task_summaries_ }
    : list_prospecting_from_engagement_tasks_response)

let make_prospecting_from_engagement_task_sort ~sort_order:(sort_order_ : sort_order)
    ~sort_by:(sort_by_ : prospecting_from_engagement_task_sort_name) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : prospecting_from_engagement_task_sort)

let make_list_prospecting_from_engagement_tasks_request
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_identifier:(task_identifier_ : task_identifier_list option)
    ?task_name:(task_name_ : task_name_list option) ?start_after:(start_after_ : date_time option)
    ?start_before:(start_before_ : date_time option)
    ?sort:(sort_ : prospecting_from_engagement_task_sort option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     max_results = max_results_;
     next_token = next_token_;
     task_identifier = task_identifier_;
     task_name = task_name_;
     start_after = start_after_;
     start_before = start_before_;
     sort = sort_;
   }
    : list_prospecting_from_engagement_tasks_request)

let make_resource_snapshot_job_summary ?id:(id_ : resource_snapshot_job_identifier option)
    ?arn:(arn_ : resource_snapshot_job_arn option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?status:(status_ : resource_snapshot_job_status option) () =
  ({ id = id_; arn = arn_; engagement_id = engagement_id_; status = status_ }
    : resource_snapshot_job_summary)

let make_list_resource_snapshot_jobs_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~resource_snapshot_job_summaries:
      (resource_snapshot_job_summaries_ : resource_snapshot_job_summary_list) () =
  ({ resource_snapshot_job_summaries = resource_snapshot_job_summaries_; next_token = next_token_ }
    : list_resource_snapshot_jobs_response)

let make_sort_object ?sort_by:(sort_by_ : sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({ sort_by = sort_by_; sort_order = sort_order_ } : sort_object)

let make_list_resource_snapshot_jobs_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?engagement_identifier:(engagement_identifier_ : engagement_identifier option)
    ?status:(status_ : resource_snapshot_job_status option) ?sort:(sort_ : sort_object option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     max_results = max_results_;
     next_token = next_token_;
     engagement_identifier = engagement_identifier_;
     status = status_;
     sort = sort_;
   }
    : list_resource_snapshot_jobs_request)

let make_resource_snapshot_summary ?arn:(arn_ : resource_snapshot_arn option)
    ?revision:(revision_ : resource_snapshot_revision option)
    ?resource_type:(resource_type_ : resource_type option)
    ?resource_id:(resource_id_ : resource_identifier option)
    ?resource_snapshot_template_name:
      (resource_snapshot_template_name_ : resource_template_name option)
    ?created_by:(created_by_ : aws_account option) () =
  ({
     arn = arn_;
     revision = revision_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     resource_snapshot_template_name = resource_snapshot_template_name_;
     created_by = created_by_;
   }
    : resource_snapshot_summary)

let make_list_resource_snapshots_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~resource_snapshot_summaries:(resource_snapshot_summaries_ : resource_snapshot_summary_list) ()
    =
  ({ resource_snapshot_summaries = resource_snapshot_summaries_; next_token = next_token_ }
    : list_resource_snapshots_response)

let make_list_resource_snapshots_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_type:(resource_type_ : resource_type option)
    ?resource_identifier:(resource_identifier_ : resource_identifier option)
    ?resource_snapshot_template_identifier:
      (resource_snapshot_template_identifier_ : resource_template_name option)
    ?created_by:(created_by_ : aws_account option) ~catalog:(catalog_ : catalog_identifier)
    ~engagement_identifier:(engagement_identifier_ : engagement_identifier) () =
  ({
     catalog = catalog_;
     max_results = max_results_;
     next_token = next_token_;
     engagement_identifier = engagement_identifier_;
     resource_type = resource_type_;
     resource_identifier = resource_identifier_;
     resource_snapshot_template_identifier = resource_snapshot_template_identifier_;
     created_by = created_by_;
   }
    : list_resource_snapshots_request)

let make_solution_base ?arn:(arn_ : solution_arn option)
    ?aws_marketplace_solution_arn:
      (aws_marketplace_solution_arn_ : aws_marketplace_solution_arn option)
    ~catalog:(catalog_ : catalog_identifier) ~id:(id_ : solution_identifier)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) ~status:(status_ : solution_status)
    ~category:(category_ : Smaws_Lib.Smithy_api.Types.string_)
    ~created_date:(created_date_ : date_time) () =
  ({
     catalog = catalog_;
     id = id_;
     arn = arn_;
     name = name_;
     status = status_;
     category = category_;
     created_date = created_date_;
     aws_marketplace_solution_arn = aws_marketplace_solution_arn_;
   }
    : solution_base)

let make_list_solutions_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~solution_summaries:(solution_summaries_ : solution_list) () =
  ({ solution_summaries = solution_summaries_; next_token = next_token_ } : list_solutions_response)

let make_solution_sort ~sort_order:(sort_order_ : sort_order)
    ~sort_by:(sort_by_ : solution_sort_name) () =
  ({ sort_order = sort_order_; sort_by = sort_by_ } : solution_sort)

let make_list_solutions_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sort:(sort_ : solution_sort option) ?status:(status_ : filter_status option)
    ?identifier:(identifier_ : solution_identifiers option)
    ?category:(category_ : string_list option)
    ?aws_marketplace_solution_arn:
      (aws_marketplace_solution_arn_ : aws_marketplace_solution_arn_list option)
    ~catalog:(catalog_ : catalog_identifier) () =
  ({
     catalog = catalog_;
     max_results = max_results_;
     next_token = next_token_;
     sort = sort_;
     status = status_;
     identifier = identifier_;
     category = category_;
     aws_marketplace_solution_arn = aws_marketplace_solution_arn_;
   }
    : list_solutions_request)

let make_reject_engagement_invitation_request
    ?rejection_reason:(rejection_reason_ : rejection_reason_string option)
    ~catalog:(catalog_ : catalog_identifier)
    ~identifier:(identifier_ : engagement_invitation_arn_or_identifier) () =
  ({ catalog = catalog_; identifier = identifier_; rejection_reason = rejection_reason_ }
    : reject_engagement_invitation_request)

let make_start_engagement_by_accepting_invitation_task_response
    ?task_id:(task_id_ : task_identifier option) ?task_arn:(task_arn_ : task_arn option)
    ?start_time:(start_time_ : date_time option) ?task_status:(task_status_ : task_status option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reason_code:(reason_code_ : reason_code option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?engagement_invitation_id:(engagement_invitation_id_ : engagement_invitation_identifier option)
    () =
  ({
     task_id = task_id_;
     task_arn = task_arn_;
     start_time = start_time_;
     task_status = task_status_;
     message = message_;
     reason_code = reason_code_;
     opportunity_id = opportunity_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     engagement_invitation_id = engagement_invitation_id_;
   }
    : start_engagement_by_accepting_invitation_task_response)

let make_start_engagement_by_accepting_invitation_task_request ?tags:(tags_ : tag_list option)
    ~catalog:(catalog_ : catalog_identifier) ~client_token:(client_token_ : client_token)
    ~identifier:(identifier_ : engagement_invitation_arn_or_identifier) () =
  ({ catalog = catalog_; client_token = client_token_; identifier = identifier_; tags = tags_ }
    : start_engagement_by_accepting_invitation_task_request)

let make_start_engagement_from_opportunity_task_response
    ?task_id:(task_id_ : task_identifier option) ?task_arn:(task_arn_ : task_arn option)
    ?start_time:(start_time_ : date_time option) ?task_status:(task_status_ : task_status option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reason_code:(reason_code_ : reason_code option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?engagement_invitation_id:(engagement_invitation_id_ : engagement_invitation_identifier option)
    () =
  ({
     task_id = task_id_;
     task_arn = task_arn_;
     start_time = start_time_;
     task_status = task_status_;
     message = message_;
     reason_code = reason_code_;
     opportunity_id = opportunity_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     engagement_id = engagement_id_;
     engagement_invitation_id = engagement_invitation_id_;
   }
    : start_engagement_from_opportunity_task_response)

let make_start_engagement_from_opportunity_task_request ?tags:(tags_ : tag_list option)
    ~catalog:(catalog_ : catalog_identifier) ~client_token:(client_token_ : client_token)
    ~identifier:(identifier_ : opportunity_identifier)
    ~aws_submission:(aws_submission_ : aws_submission) () =
  ({
     catalog = catalog_;
     client_token = client_token_;
     identifier = identifier_;
     aws_submission = aws_submission_;
     tags = tags_;
   }
    : start_engagement_from_opportunity_task_request)

let make_start_opportunity_from_engagement_task_response
    ?task_id:(task_id_ : task_identifier option) ?task_arn:(task_arn_ : task_arn option)
    ?start_time:(start_time_ : date_time option) ?task_status:(task_status_ : task_status option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reason_code:(reason_code_ : reason_code option)
    ?opportunity_id:(opportunity_id_ : opportunity_identifier option)
    ?resource_snapshot_job_id:(resource_snapshot_job_id_ : resource_snapshot_job_identifier option)
    ?engagement_id:(engagement_id_ : engagement_identifier option)
    ?context_id:(context_id_ : context_identifier option) () =
  ({
     task_id = task_id_;
     task_arn = task_arn_;
     start_time = start_time_;
     task_status = task_status_;
     message = message_;
     reason_code = reason_code_;
     opportunity_id = opportunity_id_;
     resource_snapshot_job_id = resource_snapshot_job_id_;
     engagement_id = engagement_id_;
     context_id = context_id_;
   }
    : start_opportunity_from_engagement_task_response)

let make_start_opportunity_from_engagement_task_request ?tags:(tags_ : tag_list option)
    ~catalog:(catalog_ : catalog_identifier) ~client_token:(client_token_ : client_token)
    ~identifier:(identifier_ : engagement_arn_or_identifier)
    ~context_identifier:(context_identifier_ : context_identifier) () =
  ({
     catalog = catalog_;
     client_token = client_token_;
     identifier = identifier_;
     context_identifier = context_identifier_;
     tags = tags_;
   }
    : start_opportunity_from_engagement_task_request)

let make_start_prospecting_from_engagement_task_response
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reason_code:(reason_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_id:(task_id_ : prospecting_task_identifier option)
    ?task_arn:(task_arn_ : prospecting_task_arn option)
    ~identifiers:(identifiers_ : engagement_identifier_list) ~task_name:(task_name_ : task_name)
    ~start_time:(start_time_ : date_time) ~task_status:(task_status_ : prospecting_task_status) () =
  ({
     identifiers = identifiers_;
     task_name = task_name_;
     message = message_;
     reason_code = reason_code_;
     start_time = start_time_;
     task_id = task_id_;
     task_arn = task_arn_;
     task_status = task_status_;
   }
    : start_prospecting_from_engagement_task_response)

let make_start_prospecting_from_engagement_task_request ~catalog:(catalog_ : catalog_identifier)
    ~identifiers:(identifiers_ : engagement_identifier_list) ~task_name:(task_name_ : task_name)
    ~client_token:(client_token_ : client_token) () =
  ({
     catalog = catalog_;
     identifiers = identifiers_;
     task_name = task_name_;
     client_token = client_token_;
   }
    : start_prospecting_from_engagement_task_request)

let make_start_resource_snapshot_job_request ~catalog:(catalog_ : catalog_identifier)
    ~resource_snapshot_job_identifier:
      (resource_snapshot_job_identifier_ : resource_snapshot_job_identifier) () =
  ({ catalog = catalog_; resource_snapshot_job_identifier = resource_snapshot_job_identifier_ }
    : start_resource_snapshot_job_request)

let make_stop_resource_snapshot_job_request ~catalog:(catalog_ : catalog_identifier)
    ~resource_snapshot_job_identifier:
      (resource_snapshot_job_identifier_ : resource_snapshot_job_identifier) () =
  ({ catalog = catalog_; resource_snapshot_job_identifier = resource_snapshot_job_identifier_ }
    : stop_resource_snapshot_job_request)

let make_submit_opportunity_request ?visibility:(visibility_ : visibility option)
    ~catalog:(catalog_ : catalog_identifier) ~identifier:(identifier_ : opportunity_identifier)
    ~involvement_type:(involvement_type_ : sales_involvement_type) () =
  ({
     catalog = catalog_;
     identifier = identifier_;
     involvement_type = involvement_type_;
     visibility = visibility_;
   }
    : submit_opportunity_request)

let make_update_opportunity_response ~id:(id_ : opportunity_identifier)
    ~last_modified_date:(last_modified_date_ : date_time) () =
  ({ id = id_; last_modified_date = last_modified_date_ } : update_opportunity_response)

let make_update_opportunity_request
    ?primary_needs_from_aws:(primary_needs_from_aws_ : primary_needs_from_aws option)
    ?national_security:(national_security_ : national_security option)
    ?partner_opportunity_identifier:
      (partner_opportunity_identifier_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?customer:(customer_ : customer option) ?project:(project_ : project option)
    ?opportunity_type:(opportunity_type_ : opportunity_type option)
    ?marketing:(marketing_ : marketing option)
    ?software_revenue:(software_revenue_ : software_revenue option)
    ?life_cycle:(life_cycle_ : life_cycle option) ~catalog:(catalog_ : catalog_identifier)
    ~last_modified_date:(last_modified_date_ : date_time)
    ~identifier:(identifier_ : opportunity_identifier) () =
  ({
     catalog = catalog_;
     primary_needs_from_aws = primary_needs_from_aws_;
     national_security = national_security_;
     partner_opportunity_identifier = partner_opportunity_identifier_;
     customer = customer_;
     project = project_;
     opportunity_type = opportunity_type_;
     marketing = marketing_;
     software_revenue = software_revenue_;
     last_modified_date = last_modified_date_;
     identifier = identifier_;
     life_cycle = life_cycle_;
   }
    : update_opportunity_request)
