open Types

val make_validation_exception_error :
  ?field_name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  code:validation_exception_error_code ->
  unit ->
  validation_exception_error

val make_update_engagement_context_response :
  engagement_id:engagement_identifier ->
  engagement_arn:engagement_arn ->
  engagement_last_modified_at:date_time ->
  context_id:engagement_context_identifier ->
  unit ->
  update_engagement_context_response

val make_prospecting_insights :
  ?marketplace_engagement_score:engagement_score_level ->
  ?solution_score:Smaws_Lib.Smithy_api.Types.string_ ->
  ?solution_category:Smaws_Lib.Smithy_api.Types.string_ ->
  ?solution_sub_category:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  prospecting_insights

val make_prospecting_result_customer :
  ?account_name:prospecting_account_name ->
  ?geo:prospecting_geo ->
  ?region:prospecting_region ->
  ?sub_region:prospecting_sub_region ->
  ?country:country_code ->
  ?industry:industry ->
  ?sub_industry:prospecting_sub_industry ->
  ?segment:prospecting_segment ->
  ?company_size:prospecting_company_size ->
  ?eligible_programs:eligible_programs_list ->
  ?public_profile_summary:prospecting_public_profile_summary ->
  unit ->
  prospecting_result_customer

val make_prospecting_result_aws :
  ?start_time:date_time ->
  ?end_time:date_time ->
  ?task_id:prospecting_task_identifier ->
  ?task_arn:task_arn ->
  ?task_name:task_name ->
  ?customer:prospecting_result_customer ->
  ?insights:prospecting_insights ->
  unit ->
  prospecting_result_aws

val make_engagement_customer_project_details :
  title:engagement_customer_project_title ->
  business_problem:engagement_customer_business_problem ->
  target_completion_date:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  engagement_customer_project_details

val make_engagement_customer :
  industry:industry ->
  company_name:company_name ->
  website_url:company_website_url ->
  country_code:country_code ->
  unit ->
  engagement_customer

val make_customer_projects_context :
  ?customer:engagement_customer ->
  ?project:engagement_customer_project_details ->
  unit ->
  customer_projects_context

val make_lead_insights :
  ?lead_readiness_score:Smaws_Lib.Smithy_api.Types.string_ -> unit -> lead_insights

val make_lead_contact :
  ?phone:phone_number ->
  business_title:job_title ->
  email:email ->
  first_name:name ->
  last_name:name ->
  unit ->
  lead_contact

val make_lead_interaction :
  ?usecase:engagement_use_case ->
  ?interaction_date:date_time ->
  ?business_problem:engagement_customer_business_problem ->
  source_type:lead_source_type ->
  source_id:lead_source_id ->
  source_name:lead_source_name ->
  customer_action:customer_action ->
  contact:lead_contact ->
  unit ->
  lead_interaction

val make_address_summary :
  ?city:address_part ->
  ?postal_code:address_part ->
  ?state_or_region:address_part ->
  ?country_code:country_code ->
  unit ->
  address_summary

val make_lead_customer :
  ?industry:industry ->
  ?website_url:company_website_url ->
  ?aws_maturity:aws_maturity ->
  ?market_segment:market_segment ->
  company_name:company_name ->
  address:address_summary ->
  unit ->
  lead_customer

val make_update_lead_context :
  ?qualification_status:lead_qualification_status ->
  ?interaction:lead_interaction ->
  ?insights:lead_insights ->
  customer:lead_customer ->
  unit ->
  update_lead_context

val make_update_engagement_context_request :
  catalog:catalog_identifier ->
  engagement_identifier:engagement_arn_or_identifier ->
  context_identifier:engagement_context_identifier ->
  engagement_last_modified_at:date_time ->
  type_:engagement_context_type ->
  payload:update_engagement_context_payload ->
  unit ->
  update_engagement_context_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:taggable_resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_arn:taggable_resource_arn -> tags:tag_list -> unit -> tag_resource_request

val make_put_selling_system_settings_response :
  ?resource_snapshot_job_role_arn:resource_snapshot_job_role_arn ->
  catalog:catalog_identifier ->
  unit ->
  put_selling_system_settings_response

val make_put_selling_system_settings_request :
  ?resource_snapshot_job_role_identifier:resource_snapshot_job_role_identifier ->
  catalog:catalog_identifier ->
  unit ->
  put_selling_system_settings_request

val make_list_tags_for_resource_response : tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_request

val make_get_selling_system_settings_response :
  ?resource_snapshot_job_role_arn:resource_snapshot_job_role_arn ->
  catalog:catalog_identifier ->
  unit ->
  get_selling_system_settings_response

val make_get_selling_system_settings_request :
  catalog:catalog_identifier -> unit -> get_selling_system_settings_request

val make_create_engagement_context_response :
  ?engagement_id:engagement_identifier ->
  ?engagement_arn:engagement_arn ->
  ?engagement_last_modified_at:date_time ->
  ?context_id:engagement_context_identifier ->
  unit ->
  create_engagement_context_response

val make_lead_context :
  ?insights:lead_insights ->
  ?qualification_status:lead_qualification_status ->
  customer:lead_customer ->
  interactions:lead_interaction_list ->
  unit ->
  lead_context

val make_create_engagement_context_request :
  catalog:catalog_identifier ->
  engagement_identifier:engagement_arn_or_identifier ->
  client_token:client_token ->
  type_:engagement_context_type ->
  payload:engagement_context_payload ->
  unit ->
  create_engagement_context_request

val make_accept_engagement_invitation_request :
  catalog:catalog_identifier ->
  identifier:engagement_invitation_arn_or_identifier ->
  unit ->
  accept_engagement_invitation_request

val make_address :
  ?city:address_part ->
  ?postal_code:address_part ->
  ?state_or_region:address_part ->
  ?country_code:country_code ->
  ?street_address:address_part ->
  unit ->
  address

val make_account :
  ?industry:industry ->
  ?other_industry:Smaws_Lib.Smithy_api.Types.string_ ->
  ?website_url:website_url ->
  ?aws_account_id:aws_account ->
  ?address:address ->
  ?duns:duns_number ->
  company_name:name ->
  unit ->
  account

val make_account_receiver : ?alias:alias -> aws_account_id:aws_account -> unit -> account_receiver

val make_account_summary :
  ?industry:industry ->
  ?other_industry:Smaws_Lib.Smithy_api.Types.string_ ->
  ?website_url:website_url ->
  ?address:address_summary ->
  company_name:name ->
  unit ->
  account_summary

val make_assignee_contact :
  ?phone:phone_number ->
  email:email ->
  first_name:name ->
  last_name:name ->
  business_title:job_title ->
  unit ->
  assignee_contact

val make_assign_opportunity_request :
  catalog:catalog_identifier ->
  identifier:opportunity_identifier ->
  assignee:assignee_contact ->
  unit ->
  assign_opportunity_request

val make_associate_opportunity_request :
  catalog:catalog_identifier ->
  opportunity_identifier:opportunity_identifier ->
  related_entity_type:related_entity_type ->
  related_entity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  associate_opportunity_request

val make_contact :
  ?email:email ->
  ?first_name:name ->
  ?last_name:name ->
  ?business_title:job_title ->
  ?phone:phone_number ->
  unit ->
  contact

val make_aws_opportunity_customer :
  ?contacts:customer_contacts_list -> unit -> aws_opportunity_customer

val make_recommendation :
  ?attributes:recommendation_attribute_map ->
  type_:Smaws_Lib.Smithy_api.Types.string_ ->
  details:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recommendation

val make_opportunity_quality :
  ?score:Smaws_Lib.Smithy_api.Types.integer ->
  ?trend:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  opportunity_quality

val make_aws_product_optimization :
  description:Smaws_Lib.Smithy_api.Types.string_ ->
  savings_amount:monetary_amount ->
  unit ->
  aws_product_optimization

val make_aws_product_details :
  ?service_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?amount:monetary_amount ->
  ?optimized_amount:monetary_amount ->
  ?potential_savings_amount:monetary_amount ->
  product_code:Smaws_Lib.Smithy_api.Types.string_ ->
  categories:string_list ->
  optimizations:aws_product_optimizations_list ->
  unit ->
  aws_product_details

val make_aws_product_insights :
  ?total_amount:monetary_amount ->
  ?total_optimized_amount:monetary_amount ->
  ?total_potential_savings_amount:monetary_amount ->
  currency_code:currency_code ->
  frequency:payment_frequency ->
  total_amount_by_category:amount_map ->
  aws_products:aws_products_list ->
  unit ->
  aws_product_insights

val make_aws_products_spend_insights_by_source :
  ?partner:aws_product_insights ->
  ?aw_s:aws_product_insights ->
  unit ->
  aws_products_spend_insights_by_source

val make_aws_opportunity_insights :
  ?next_best_actions:Smaws_Lib.Smithy_api.Types.string_ ->
  ?engagement_score:engagement_score ->
  ?aws_products_spend_insights_by_source:aws_products_spend_insights_by_source ->
  ?opportunity_quality:opportunity_quality ->
  ?recommendations:recommendation_list ->
  unit ->
  aws_opportunity_insights

val make_profile_next_steps_history :
  value:Smaws_Lib.Smithy_api.Types.string_ -> time:date_time -> unit -> profile_next_steps_history

val make_aws_opportunity_life_cycle :
  ?target_close_date:date ->
  ?closed_lost_reason:aws_closed_lost_reason ->
  ?stage:aws_opportunity_stage ->
  ?next_steps:pii_string ->
  ?next_steps_history:profile_next_steps_histories ->
  unit ->
  aws_opportunity_life_cycle

val make_expected_customer_spend :
  ?amount:amount ->
  ?estimation_url:estimation_url ->
  currency_code:currency_code ->
  frequency:payment_frequency ->
  target_company:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  expected_customer_spend

val make_aws_opportunity_project :
  ?expected_customer_spend:expected_customer_spend_list ->
  ?aws_partition:aws_partition ->
  unit ->
  aws_opportunity_project

val make_aws_opportunity_related_entities :
  ?aws_products:aws_product_identifiers ->
  ?solutions:solution_identifiers ->
  ?aws_marketplace_solutions:aws_marketplace_solution_identifiers ->
  ?aws_marketplace_products:aws_marketplace_product_identifiers ->
  unit ->
  aws_opportunity_related_entities

val make_aws_team_member :
  ?email:email ->
  ?first_name:name ->
  ?last_name:name ->
  ?business_title:aws_member_business_title ->
  unit ->
  aws_team_member

val make_aws_opportunity_summary_full_view :
  ?related_opportunity_id:opportunity_identifier ->
  ?origin:opportunity_origin ->
  ?involvement_type:sales_involvement_type ->
  ?visibility:visibility ->
  ?life_cycle:aws_opportunity_life_cycle ->
  ?opportunity_team:aws_opportunity_team_members_list ->
  ?insights:aws_opportunity_insights ->
  ?involvement_type_change_reason:involvement_type_change_reason ->
  ?related_entity_ids:aws_opportunity_related_entities ->
  ?customer:aws_opportunity_customer ->
  ?project:aws_opportunity_project ->
  ?cosell_motion:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  aws_opportunity_summary_full_view

val make_aws_submission :
  ?visibility:visibility -> involvement_type:sales_involvement_type -> unit -> aws_submission

val make_create_engagement_response :
  ?id:engagement_identifier ->
  ?arn:engagement_arn ->
  ?modified_at:date_time ->
  unit ->
  create_engagement_response

val make_engagement_context_details :
  ?id:engagement_context_identifier ->
  ?payload:engagement_context_payload ->
  type_:engagement_context_type ->
  unit ->
  engagement_context_details

val make_create_engagement_request :
  ?contexts:engagement_contexts ->
  catalog:catalog_identifier ->
  client_token:client_token ->
  title:engagement_title ->
  description:engagement_description ->
  unit ->
  create_engagement_request

val make_create_engagement_invitation_response :
  id:engagement_invitation_identifier ->
  arn:engagement_invitation_arn ->
  unit ->
  create_engagement_invitation_response

val make_lead_invitation_interaction :
  ?usecase:engagement_use_case ->
  source_type:lead_source_type ->
  source_id:lead_source_id ->
  source_name:lead_source_name ->
  contact_business_title:job_title ->
  unit ->
  lead_invitation_interaction

val make_lead_invitation_customer :
  ?industry:industry ->
  ?website_url:company_website_url ->
  ?aws_maturity:aws_maturity ->
  ?market_segment:market_segment ->
  company_name:company_name ->
  country_code:country_code ->
  unit ->
  lead_invitation_customer

val make_lead_invitation_payload :
  customer:lead_invitation_customer ->
  interaction:lead_invitation_interaction ->
  unit ->
  lead_invitation_payload

val make_project_details :
  business_problem:engagement_customer_business_problem ->
  title:Smaws_Lib.Smithy_api.Types.string_ ->
  target_completion_date:date ->
  expected_customer_spend:expected_customer_spend_list ->
  unit ->
  project_details

val make_sender_contact :
  ?first_name:name ->
  ?last_name:name ->
  ?business_title:job_title ->
  ?phone:phone_number ->
  email:sender_contact_email ->
  unit ->
  sender_contact

val make_opportunity_invitation_payload :
  ?sender_contacts:sender_contact_list ->
  receiver_responsibilities:receiver_responsibility_list ->
  customer:engagement_customer ->
  project:project_details ->
  unit ->
  opportunity_invitation_payload

val make_invitation :
  message:invitation_message -> receiver:receiver -> payload:payload -> unit -> invitation

val make_create_engagement_invitation_request :
  catalog:catalog_identifier ->
  client_token:client_token ->
  engagement_identifier:engagement_identifier ->
  invitation:invitation ->
  unit ->
  create_engagement_invitation_request

val make_create_opportunity_response :
  ?partner_opportunity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  ?last_modified_date:date_time ->
  id:opportunity_identifier ->
  unit ->
  create_opportunity_response

val make_next_steps_history :
  value:Smaws_Lib.Smithy_api.Types.string_ -> time:date_time -> unit -> next_steps_history

val make_life_cycle :
  ?stage:stage ->
  ?closed_lost_reason:closed_lost_reason ->
  ?next_steps:pii_string ->
  ?target_close_date:date ->
  ?review_status:review_status ->
  ?review_comments:Smaws_Lib.Smithy_api.Types.string_ ->
  ?review_status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?next_steps_history:next_steps_histories ->
  unit ->
  life_cycle

val make_monetary_value :
  amount:Smaws_Lib.Smithy_api.Types.string_ -> currency_code:currency_code -> unit -> monetary_value

val make_software_revenue :
  ?delivery_model:revenue_model ->
  ?value:monetary_value ->
  ?effective_date:date ->
  ?expiration_date:date ->
  unit ->
  software_revenue

val make_marketing :
  ?campaign_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source:marketing_source ->
  ?use_cases:use_cases ->
  ?channels:channels ->
  ?aws_funding_used:aws_funding_used ->
  unit ->
  marketing

val make_expected_contract_duration :
  term:expected_contract_duration_term ->
  value:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  expected_contract_duration

val make_project :
  ?delivery_models:delivery_models ->
  ?expected_customer_spend:expected_customer_spend_list ->
  ?expected_contract_duration:expected_contract_duration ->
  ?title:pii_string ->
  ?apn_programs:apn_programs ->
  ?customer_business_problem:pii_string ->
  ?customer_use_case:Smaws_Lib.Smithy_api.Types.string_ ->
  ?related_opportunity_identifier:opportunity_identifier ->
  ?sales_activities:sales_activities ->
  ?competitor_name:competitor_name ->
  ?other_competitor_names:Smaws_Lib.Smithy_api.Types.string_ ->
  ?other_solution_description:pii_string ->
  ?additional_comments:Smaws_Lib.Smithy_api.Types.string_ ->
  ?aws_partition:aws_partition ->
  unit ->
  project

val make_customer : ?account:account -> ?contacts:customer_contacts_list -> unit -> customer

val make_create_opportunity_request :
  ?primary_needs_from_aws:primary_needs_from_aws ->
  ?national_security:national_security ->
  ?partner_opportunity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  ?customer:customer ->
  ?project:project ->
  ?opportunity_type:opportunity_type ->
  ?marketing:marketing ->
  ?software_revenue:software_revenue ->
  ?life_cycle:life_cycle ->
  ?origin:opportunity_origin ->
  ?opportunity_team:partner_opportunity_team_members_list ->
  ?tags:tag_list ->
  catalog:catalog_identifier ->
  client_token:client_token ->
  unit ->
  create_opportunity_request

val make_create_resource_snapshot_response :
  ?arn:resource_arn ->
  ?revision:resource_snapshot_revision ->
  unit ->
  create_resource_snapshot_response

val make_create_resource_snapshot_request :
  catalog:catalog_identifier ->
  engagement_identifier:engagement_identifier ->
  resource_type:resource_type ->
  resource_identifier:resource_identifier ->
  resource_snapshot_template_identifier:resource_template_name ->
  client_token:client_token ->
  unit ->
  create_resource_snapshot_request

val make_create_resource_snapshot_job_response :
  ?id:resource_snapshot_job_identifier ->
  ?arn:resource_snapshot_job_arn ->
  unit ->
  create_resource_snapshot_job_response

val make_create_resource_snapshot_job_request :
  ?tags:tag_list ->
  catalog:catalog_identifier ->
  client_token:client_token ->
  engagement_identifier:engagement_identifier ->
  resource_type:resource_type ->
  resource_identifier:resource_identifier ->
  resource_snapshot_template_identifier:resource_template_name ->
  unit ->
  create_resource_snapshot_job_request

val make_created_date_filter :
  ?after_created_date:date_time -> ?before_created_date:date_time -> unit -> created_date_filter

val make_customer_summary : ?account:account_summary -> unit -> customer_summary

val make_delete_resource_snapshot_job_request :
  catalog:catalog_identifier ->
  resource_snapshot_job_identifier:resource_snapshot_job_identifier ->
  unit ->
  delete_resource_snapshot_job_request

val make_disassociate_opportunity_request :
  catalog:catalog_identifier ->
  opportunity_identifier:opportunity_identifier ->
  related_entity_type:related_entity_type ->
  related_entity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  disassociate_opportunity_request

val make_engagement_invitation_summary :
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payload_type:engagement_invitation_payload_type ->
  ?engagement_id:engagement_identifier ->
  ?engagement_title:engagement_title ->
  ?status:invitation_status ->
  ?invitation_date:date_time ->
  ?expiration_date:date_time ->
  ?sender_aws_account_id:aws_account ->
  ?sender_company_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?receiver:receiver ->
  ?participant_type:participant_type ->
  id:engagement_invitation_arn_or_identifier ->
  catalog:catalog_identifier ->
  unit ->
  engagement_invitation_summary

val make_engagement_member :
  ?company_name:member_company_name ->
  ?website_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_id:aws_account ->
  unit ->
  engagement_member

val make_engagement_member_summary :
  ?company_name:member_company_name ->
  ?website_url:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  engagement_member_summary

val make_engagement_resource_association_summary :
  ?engagement_id:engagement_identifier ->
  ?resource_type:resource_type ->
  ?resource_id:resource_identifier ->
  ?created_by:aws_account ->
  catalog:catalog_identifier ->
  unit ->
  engagement_resource_association_summary

val make_engagement_sort :
  sort_order:sort_order -> sort_by:engagement_sort_name -> unit -> engagement_sort

val make_engagement_summary :
  ?arn:engagement_arn ->
  ?id:engagement_identifier ->
  ?title:engagement_title ->
  ?created_at:date_time ->
  ?created_by:aws_account ->
  ?member_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?modified_at:date_time ->
  ?modified_by:aws_account ->
  ?context_types:engagement_context_type_list ->
  unit ->
  engagement_summary

val make_get_aws_opportunity_summary_response :
  ?related_opportunity_id:opportunity_identifier ->
  ?origin:opportunity_origin ->
  ?involvement_type:sales_involvement_type ->
  ?visibility:visibility ->
  ?life_cycle:aws_opportunity_life_cycle ->
  ?opportunity_team:aws_opportunity_team_members_list ->
  ?insights:aws_opportunity_insights ->
  ?involvement_type_change_reason:involvement_type_change_reason ->
  ?related_entity_ids:aws_opportunity_related_entities ->
  ?customer:aws_opportunity_customer ->
  ?project:aws_opportunity_project ->
  ?cosell_motion:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_identifier ->
  unit ->
  get_aws_opportunity_summary_response

val make_get_aws_opportunity_summary_request :
  catalog:catalog_identifier ->
  related_opportunity_identifier:opportunity_identifier ->
  unit ->
  get_aws_opportunity_summary_request

val make_get_engagement_response :
  ?id:engagement_identifier ->
  ?arn:engagement_arn ->
  ?title:engagement_title ->
  ?description:engagement_description ->
  ?created_at:date_time ->
  ?created_by:aws_account ->
  ?member_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?modified_at:date_time ->
  ?modified_by:aws_account ->
  ?contexts:engagement_contexts ->
  unit ->
  get_engagement_response

val make_get_engagement_request :
  catalog:catalog_identifier ->
  identifier:engagement_arn_or_identifier ->
  unit ->
  get_engagement_request

val make_get_engagement_invitation_response :
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payload_type:engagement_invitation_payload_type ->
  ?engagement_id:engagement_identifier ->
  ?engagement_title:engagement_title ->
  ?status:invitation_status ->
  ?invitation_date:date_time ->
  ?expiration_date:date_time ->
  ?sender_aws_account_id:aws_account ->
  ?sender_company_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?receiver:receiver ->
  ?rejection_reason:rejection_reason_string ->
  ?payload:payload ->
  ?invitation_message:invitation_message ->
  ?engagement_description:engagement_description ->
  ?existing_members:engagement_member_summaries ->
  id:engagement_invitation_arn_or_identifier ->
  catalog:catalog_identifier ->
  unit ->
  get_engagement_invitation_response

val make_get_engagement_invitation_request :
  catalog:catalog_identifier ->
  identifier:engagement_invitation_arn_or_identifier ->
  unit ->
  get_engagement_invitation_request

val make_related_entity_identifiers :
  ?aws_marketplace_offers:aws_marketplace_offer_identifiers ->
  ?aws_marketplace_offer_sets:aws_marketplace_offer_set_identifiers ->
  ?solutions:solution_identifiers ->
  ?aws_products:aws_product_identifiers ->
  ?aws_marketplace_solutions:aws_marketplace_solution_identifiers ->
  ?aws_marketplace_products:aws_marketplace_product_identifiers ->
  unit ->
  related_entity_identifiers

val make_get_opportunity_response :
  ?primary_needs_from_aws:primary_needs_from_aws ->
  ?national_security:national_security ->
  ?partner_opportunity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  ?customer:customer ->
  ?project:project ->
  ?opportunity_type:opportunity_type ->
  ?marketing:marketing ->
  ?software_revenue:software_revenue ->
  ?arn:opportunity_arn ->
  ?life_cycle:life_cycle ->
  ?opportunity_team:partner_opportunity_team_members_list ->
  catalog:catalog_identifier ->
  id:opportunity_identifier ->
  last_modified_date:date_time ->
  created_date:date_time ->
  related_entity_identifiers:related_entity_identifiers ->
  unit ->
  get_opportunity_response

val make_get_opportunity_request :
  catalog:catalog_identifier -> identifier:opportunity_identifier -> unit -> get_opportunity_request

val make_get_prospecting_from_engagement_task_response :
  ?end_time:date_time ->
  task_id:prospecting_task_identifier ->
  task_arn:prospecting_task_arn ->
  task_name:task_name ->
  start_time:date_time ->
  engagements:engagement_prospecting_result_list ->
  unit ->
  get_prospecting_from_engagement_task_response

val make_get_prospecting_from_engagement_task_request :
  catalog:catalog_identifier ->
  task_identifier:prospecting_task_identifier ->
  unit ->
  get_prospecting_from_engagement_task_request

val make_project_view :
  ?delivery_models:delivery_models ->
  ?expected_customer_spend:expected_customer_spend_list ->
  ?expected_contract_duration:expected_contract_duration ->
  ?customer_use_case:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sales_activities:sales_activities ->
  ?other_solution_description:pii_string ->
  unit ->
  project_view

val make_life_cycle_for_view :
  ?target_close_date:date ->
  ?review_status:review_status ->
  ?stage:stage ->
  ?next_steps:pii_string ->
  unit ->
  life_cycle_for_view

val make_opportunity_summary_view :
  ?opportunity_type:opportunity_type ->
  ?lifecycle:life_cycle_for_view ->
  ?opportunity_team:partner_opportunity_team_members_list ->
  ?primary_needs_from_aws:primary_needs_from_aws ->
  ?customer:customer ->
  ?project:project_view ->
  ?related_entity_identifiers:related_entity_identifiers ->
  unit ->
  opportunity_summary_view

val make_get_resource_snapshot_response :
  ?arn:resource_arn ->
  ?created_by:aws_account ->
  ?created_at:date_time ->
  ?engagement_id:engagement_identifier ->
  ?resource_type:resource_type ->
  ?resource_id:resource_identifier ->
  ?resource_snapshot_template_name:resource_template_name ->
  ?revision:resource_snapshot_revision ->
  ?payload:resource_snapshot_payload ->
  ?target_member_accounts:aws_account_id_or_alias_list ->
  catalog:catalog_identifier ->
  unit ->
  get_resource_snapshot_response

val make_get_resource_snapshot_request :
  ?revision:resource_snapshot_revision ->
  catalog:catalog_identifier ->
  engagement_identifier:engagement_identifier ->
  resource_type:resource_type ->
  resource_identifier:resource_identifier ->
  resource_snapshot_template_identifier:resource_template_name ->
  unit ->
  get_resource_snapshot_request

val make_get_resource_snapshot_job_response :
  ?id:resource_snapshot_job_identifier ->
  ?arn:resource_snapshot_job_arn ->
  ?engagement_id:engagement_identifier ->
  ?resource_type:resource_type ->
  ?resource_id:resource_identifier ->
  ?resource_arn:resource_arn ->
  ?resource_snapshot_template_name:resource_template_name ->
  ?created_at:date_time ->
  ?status:resource_snapshot_job_status ->
  ?last_successful_execution_date:date_time ->
  ?last_failure:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_identifier ->
  unit ->
  get_resource_snapshot_job_response

val make_get_resource_snapshot_job_request :
  catalog:catalog_identifier ->
  resource_snapshot_job_identifier:resource_snapshot_job_identifier ->
  unit ->
  get_resource_snapshot_job_request

val make_last_modified_date :
  ?after_last_modified_date:date_time ->
  ?before_last_modified_date:date_time ->
  unit ->
  last_modified_date

val make_life_cycle_summary :
  ?stage:stage ->
  ?closed_lost_reason:closed_lost_reason ->
  ?next_steps:pii_string ->
  ?target_close_date:date ->
  ?review_status:review_status ->
  ?review_comments:Smaws_Lib.Smithy_api.Types.string_ ->
  ?review_status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  life_cycle_summary

val make_list_engagement_by_accepting_invitation_task_summary :
  ?task_id:task_identifier ->
  ?task_arn:task_arn ->
  ?start_time:date_time ->
  ?task_status:task_status ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reason_code:reason_code ->
  ?opportunity_id:opportunity_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?engagement_invitation_id:engagement_invitation_identifier ->
  unit ->
  list_engagement_by_accepting_invitation_task_summary

val make_list_engagement_by_accepting_invitation_tasks_response :
  ?task_summaries:list_engagement_by_accepting_invitation_task_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_engagement_by_accepting_invitation_tasks_response

val make_list_tasks_sort_base :
  sort_order:sort_order -> sort_by:list_tasks_sort_name -> unit -> list_tasks_sort_base

val make_list_engagement_by_accepting_invitation_tasks_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sort:list_tasks_sort_base ->
  ?task_status:task_statuses ->
  ?opportunity_identifier:opportunity_identifiers ->
  ?engagement_invitation_identifier:engagement_invitation_identifiers ->
  ?task_identifier:task_identifiers ->
  catalog:catalog_identifier ->
  unit ->
  list_engagement_by_accepting_invitation_tasks_request

val make_list_engagement_from_opportunity_task_summary :
  ?task_id:task_identifier ->
  ?task_arn:task_arn ->
  ?start_time:date_time ->
  ?task_status:task_status ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reason_code:reason_code ->
  ?opportunity_id:opportunity_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?engagement_id:engagement_identifier ->
  ?engagement_invitation_id:engagement_invitation_identifier ->
  unit ->
  list_engagement_from_opportunity_task_summary

val make_list_engagement_from_opportunity_tasks_response :
  ?task_summaries:list_engagement_from_opportunity_task_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_engagement_from_opportunity_tasks_response

val make_list_engagement_from_opportunity_tasks_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sort:list_tasks_sort_base ->
  ?task_status:task_statuses ->
  ?task_identifier:task_identifiers ->
  ?opportunity_identifier:opportunity_identifiers ->
  ?engagement_identifier:engagement_identifiers ->
  catalog:catalog_identifier ->
  unit ->
  list_engagement_from_opportunity_tasks_request

val make_list_engagement_invitations_response :
  ?engagement_invitation_summaries:engagement_invitation_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_engagement_invitations_response

val make_opportunity_engagement_invitation_sort :
  sort_order:sort_order ->
  sort_by:opportunity_engagement_invitation_sort_name ->
  unit ->
  opportunity_engagement_invitation_sort

val make_list_engagement_invitations_request :
  ?max_results:page_size ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sort:opportunity_engagement_invitation_sort ->
  ?payload_type:engagement_invitations_payload_type ->
  ?status:invitation_status_list ->
  ?engagement_identifier:engagement_identifiers ->
  ?sender_aws_account_id:aws_account_id_or_alias_list ->
  catalog:catalog_identifier ->
  participant_type:participant_type ->
  unit ->
  list_engagement_invitations_request

val make_list_engagement_members_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  engagement_member_list:engagement_members ->
  unit ->
  list_engagement_members_response

val make_list_engagement_members_request :
  ?max_results:member_page_size ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_identifier ->
  identifier:engagement_arn_or_identifier ->
  unit ->
  list_engagement_members_request

val make_list_engagement_resource_associations_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  engagement_resource_association_summaries:engagement_resource_association_summary_list ->
  unit ->
  list_engagement_resource_associations_response

val make_list_engagement_resource_associations_request :
  ?max_results:page_size ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?engagement_identifier:engagement_identifier ->
  ?resource_type:resource_type ->
  ?resource_identifier:resource_identifier ->
  ?created_by:aws_account ->
  catalog:catalog_identifier ->
  unit ->
  list_engagement_resource_associations_request

val make_list_engagements_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  engagement_summary_list:engagement_summary_list ->
  unit ->
  list_engagements_response

val make_list_engagements_request :
  ?created_by:aws_account_list ->
  ?exclude_created_by:aws_account_list ->
  ?context_types:engagement_context_type_list ->
  ?exclude_context_types:engagement_context_type_list ->
  ?sort:engagement_sort ->
  ?max_results:engagement_page_size ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?engagement_identifier:engagement_identifiers ->
  catalog:catalog_identifier ->
  unit ->
  list_engagements_request

val make_project_summary :
  ?delivery_models:delivery_models ->
  ?expected_customer_spend:expected_customer_spend_list ->
  ?expected_contract_duration:expected_contract_duration ->
  unit ->
  project_summary

val make_opportunity_summary :
  ?id:opportunity_identifier ->
  ?arn:opportunity_arn ->
  ?partner_opportunity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  ?opportunity_type:opportunity_type ->
  ?last_modified_date:date_time ->
  ?created_date:date_time ->
  ?life_cycle:life_cycle_summary ->
  ?customer:customer_summary ->
  ?project:project_summary ->
  catalog:catalog_identifier ->
  unit ->
  opportunity_summary

val make_list_opportunities_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  opportunity_summaries:opportunity_summaries ->
  unit ->
  list_opportunities_response

val make_target_close_date_filter :
  ?after_target_close_date:date ->
  ?before_target_close_date:date ->
  unit ->
  target_close_date_filter

val make_opportunity_sort :
  sort_order:sort_order -> sort_by:opportunity_sort_name -> unit -> opportunity_sort

val make_list_opportunities_request :
  ?max_results:page_size ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sort:opportunity_sort ->
  ?last_modified_date:last_modified_date ->
  ?identifier:filter_identifier ->
  ?life_cycle_stage:filter_life_cycle_stage ->
  ?life_cycle_review_status:filter_life_cycle_review_status ->
  ?customer_company_name:string_list ->
  ?created_date:created_date_filter ->
  ?target_close_date:target_close_date_filter ->
  catalog:catalog_identifier ->
  unit ->
  list_opportunities_request

val make_list_opportunity_from_engagement_task_summary :
  ?task_id:task_identifier ->
  ?task_arn:task_arn ->
  ?start_time:date_time ->
  ?task_status:task_status ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reason_code:reason_code ->
  ?opportunity_id:opportunity_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?engagement_id:engagement_identifier ->
  ?context_id:context_identifier ->
  unit ->
  list_opportunity_from_engagement_task_summary

val make_list_opportunity_from_engagement_tasks_response :
  ?task_summaries:list_opportunity_from_engagement_task_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_opportunity_from_engagement_tasks_response

val make_list_opportunity_from_engagement_tasks_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sort:list_tasks_sort_base ->
  ?task_status:task_statuses ->
  ?task_identifier:task_identifiers ->
  ?opportunity_identifier:opportunity_identifiers ->
  ?engagement_identifier:engagement_identifiers ->
  ?context_identifier:context_identifiers ->
  catalog:catalog_identifier ->
  unit ->
  list_opportunity_from_engagement_tasks_request

val make_prospecting_task_summary :
  ?end_time:date_time ->
  task_id:prospecting_task_identifier ->
  task_arn:prospecting_task_arn ->
  task_name:task_name ->
  start_time:date_time ->
  total_engagement_count:Smaws_Lib.Smithy_api.Types.integer ->
  completed_engagement_count:Smaws_Lib.Smithy_api.Types.integer ->
  failed_engagement_count:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  prospecting_task_summary

val make_list_prospecting_from_engagement_tasks_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  task_summaries:prospecting_task_summary_list ->
  unit ->
  list_prospecting_from_engagement_tasks_response

val make_prospecting_from_engagement_task_sort :
  sort_order:sort_order ->
  sort_by:prospecting_from_engagement_task_sort_name ->
  unit ->
  prospecting_from_engagement_task_sort

val make_list_prospecting_from_engagement_tasks_request :
  ?max_results:page_size ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_identifier:task_identifier_list ->
  ?task_name:task_name_list ->
  ?start_after:date_time ->
  ?start_before:date_time ->
  ?sort:prospecting_from_engagement_task_sort ->
  catalog:catalog_identifier ->
  unit ->
  list_prospecting_from_engagement_tasks_request

val make_resource_snapshot_job_summary :
  ?id:resource_snapshot_job_identifier ->
  ?arn:resource_snapshot_job_arn ->
  ?engagement_id:engagement_identifier ->
  ?status:resource_snapshot_job_status ->
  unit ->
  resource_snapshot_job_summary

val make_list_resource_snapshot_jobs_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_snapshot_job_summaries:resource_snapshot_job_summary_list ->
  unit ->
  list_resource_snapshot_jobs_response

val make_sort_object : ?sort_by:sort_by -> ?sort_order:sort_order -> unit -> sort_object

val make_list_resource_snapshot_jobs_request :
  ?max_results:page_size ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?engagement_identifier:engagement_identifier ->
  ?status:resource_snapshot_job_status ->
  ?sort:sort_object ->
  catalog:catalog_identifier ->
  unit ->
  list_resource_snapshot_jobs_request

val make_resource_snapshot_summary :
  ?arn:resource_snapshot_arn ->
  ?revision:resource_snapshot_revision ->
  ?resource_type:resource_type ->
  ?resource_id:resource_identifier ->
  ?resource_snapshot_template_name:resource_template_name ->
  ?created_by:aws_account ->
  unit ->
  resource_snapshot_summary

val make_list_resource_snapshots_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_snapshot_summaries:resource_snapshot_summary_list ->
  unit ->
  list_resource_snapshots_response

val make_list_resource_snapshots_request :
  ?max_results:page_size ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_type:resource_type ->
  ?resource_identifier:resource_identifier ->
  ?resource_snapshot_template_identifier:resource_template_name ->
  ?created_by:aws_account ->
  catalog:catalog_identifier ->
  engagement_identifier:engagement_identifier ->
  unit ->
  list_resource_snapshots_request

val make_solution_base :
  ?arn:solution_arn ->
  ?aws_marketplace_solution_arn:aws_marketplace_solution_arn ->
  catalog:catalog_identifier ->
  id:solution_identifier ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  status:solution_status ->
  category:Smaws_Lib.Smithy_api.Types.string_ ->
  created_date:date_time ->
  unit ->
  solution_base

val make_list_solutions_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  solution_summaries:solution_list ->
  unit ->
  list_solutions_response

val make_solution_sort :
  sort_order:sort_order -> sort_by:solution_sort_name -> unit -> solution_sort

val make_list_solutions_request :
  ?max_results:page_size ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sort:solution_sort ->
  ?status:filter_status ->
  ?identifier:solution_identifiers ->
  ?category:string_list ->
  ?aws_marketplace_solution_arn:aws_marketplace_solution_arn_list ->
  catalog:catalog_identifier ->
  unit ->
  list_solutions_request

val make_reject_engagement_invitation_request :
  ?rejection_reason:rejection_reason_string ->
  catalog:catalog_identifier ->
  identifier:engagement_invitation_arn_or_identifier ->
  unit ->
  reject_engagement_invitation_request

val make_start_engagement_by_accepting_invitation_task_response :
  ?task_id:task_identifier ->
  ?task_arn:task_arn ->
  ?start_time:date_time ->
  ?task_status:task_status ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reason_code:reason_code ->
  ?opportunity_id:opportunity_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?engagement_invitation_id:engagement_invitation_identifier ->
  unit ->
  start_engagement_by_accepting_invitation_task_response

val make_start_engagement_by_accepting_invitation_task_request :
  ?tags:tag_list ->
  catalog:catalog_identifier ->
  client_token:client_token ->
  identifier:engagement_invitation_arn_or_identifier ->
  unit ->
  start_engagement_by_accepting_invitation_task_request

val make_start_engagement_from_opportunity_task_response :
  ?task_id:task_identifier ->
  ?task_arn:task_arn ->
  ?start_time:date_time ->
  ?task_status:task_status ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reason_code:reason_code ->
  ?opportunity_id:opportunity_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?engagement_id:engagement_identifier ->
  ?engagement_invitation_id:engagement_invitation_identifier ->
  unit ->
  start_engagement_from_opportunity_task_response

val make_start_engagement_from_opportunity_task_request :
  ?tags:tag_list ->
  catalog:catalog_identifier ->
  client_token:client_token ->
  identifier:opportunity_identifier ->
  aws_submission:aws_submission ->
  unit ->
  start_engagement_from_opportunity_task_request

val make_start_opportunity_from_engagement_task_response :
  ?task_id:task_identifier ->
  ?task_arn:task_arn ->
  ?start_time:date_time ->
  ?task_status:task_status ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reason_code:reason_code ->
  ?opportunity_id:opportunity_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?engagement_id:engagement_identifier ->
  ?context_id:context_identifier ->
  unit ->
  start_opportunity_from_engagement_task_response

val make_start_opportunity_from_engagement_task_request :
  ?tags:tag_list ->
  catalog:catalog_identifier ->
  client_token:client_token ->
  identifier:engagement_arn_or_identifier ->
  context_identifier:context_identifier ->
  unit ->
  start_opportunity_from_engagement_task_request

val make_start_prospecting_from_engagement_task_response :
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reason_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_id:prospecting_task_identifier ->
  ?task_arn:prospecting_task_arn ->
  identifiers:engagement_identifier_list ->
  task_name:task_name ->
  start_time:date_time ->
  task_status:prospecting_task_status ->
  unit ->
  start_prospecting_from_engagement_task_response

val make_start_prospecting_from_engagement_task_request :
  catalog:catalog_identifier ->
  identifiers:engagement_identifier_list ->
  task_name:task_name ->
  client_token:client_token ->
  unit ->
  start_prospecting_from_engagement_task_request

val make_start_resource_snapshot_job_request :
  catalog:catalog_identifier ->
  resource_snapshot_job_identifier:resource_snapshot_job_identifier ->
  unit ->
  start_resource_snapshot_job_request

val make_stop_resource_snapshot_job_request :
  catalog:catalog_identifier ->
  resource_snapshot_job_identifier:resource_snapshot_job_identifier ->
  unit ->
  stop_resource_snapshot_job_request

val make_submit_opportunity_request :
  ?visibility:visibility ->
  catalog:catalog_identifier ->
  identifier:opportunity_identifier ->
  involvement_type:sales_involvement_type ->
  unit ->
  submit_opportunity_request

val make_update_opportunity_response :
  id:opportunity_identifier -> last_modified_date:date_time -> unit -> update_opportunity_response

val make_update_opportunity_request :
  ?primary_needs_from_aws:primary_needs_from_aws ->
  ?national_security:national_security ->
  ?partner_opportunity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  ?customer:customer ->
  ?project:project ->
  ?opportunity_type:opportunity_type ->
  ?marketing:marketing ->
  ?software_revenue:software_revenue ->
  ?life_cycle:life_cycle ->
  catalog:catalog_identifier ->
  last_modified_date:date_time ->
  identifier:opportunity_identifier ->
  unit ->
  update_opportunity_request
