(** PartnerCentral Selling client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validation_exception_error :
  ?field_name:Smaws_Lib.Smithy_api.Types.string_ ->
  code:validation_exception_error_code ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_error

val make_update_opportunity_response :
  last_modified_date:date_time -> id:opportunity_identifier -> unit -> update_opportunity_response

val make_address :
  ?street_address:address_part ->
  ?country_code:country_code ->
  ?state_or_region:address_part ->
  ?postal_code:address_part ->
  ?city:address_part ->
  unit ->
  address

val make_account :
  ?duns:duns_number ->
  ?address:address ->
  ?aws_account_id:aws_account ->
  ?website_url:website_url ->
  ?other_industry:Smaws_Lib.Smithy_api.Types.string_ ->
  ?industry:industry ->
  company_name:name ->
  unit ->
  account

val make_contact :
  ?phone:phone_number ->
  ?business_title:job_title ->
  ?last_name:name ->
  ?first_name:name ->
  ?email:email ->
  unit ->
  contact

val make_customer : ?contacts:customer_contacts_list -> ?account:account -> unit -> customer

val make_expected_customer_spend :
  ?estimation_url:estimation_url ->
  ?amount:amount ->
  target_company:Smaws_Lib.Smithy_api.Types.string_ ->
  frequency:payment_frequency ->
  currency_code:currency_code ->
  unit ->
  expected_customer_spend

val make_expected_contract_duration :
  value:Smaws_Lib.Smithy_api.Types.string_ ->
  term:expected_contract_duration_term ->
  unit ->
  expected_contract_duration

val make_project :
  ?aws_partition:aws_partition ->
  ?additional_comments:Smaws_Lib.Smithy_api.Types.string_ ->
  ?other_solution_description:pii_string ->
  ?other_competitor_names:Smaws_Lib.Smithy_api.Types.string_ ->
  ?competitor_name:competitor_name ->
  ?sales_activities:sales_activities ->
  ?related_opportunity_identifier:opportunity_identifier ->
  ?customer_use_case:Smaws_Lib.Smithy_api.Types.string_ ->
  ?customer_business_problem:pii_string ->
  ?apn_programs:apn_programs ->
  ?title:pii_string ->
  ?expected_contract_duration:expected_contract_duration ->
  ?expected_customer_spend:expected_customer_spend_list ->
  ?delivery_models:delivery_models ->
  unit ->
  project

val make_marketing :
  ?aws_funding_used:aws_funding_used ->
  ?channels:channels ->
  ?use_cases:use_cases ->
  ?source:marketing_source ->
  ?campaign_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  marketing

val make_monetary_value :
  currency_code:currency_code -> amount:Smaws_Lib.Smithy_api.Types.string_ -> unit -> monetary_value

val make_software_revenue :
  ?expiration_date:date ->
  ?effective_date:date ->
  ?value:monetary_value ->
  ?delivery_model:revenue_model ->
  unit ->
  software_revenue

val make_next_steps_history :
  time:date_time -> value:Smaws_Lib.Smithy_api.Types.string_ -> unit -> next_steps_history

val make_life_cycle :
  ?next_steps_history:next_steps_histories ->
  ?review_status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?review_comments:Smaws_Lib.Smithy_api.Types.string_ ->
  ?review_status:review_status ->
  ?target_close_date:date ->
  ?next_steps:pii_string ->
  ?closed_lost_reason:closed_lost_reason ->
  ?stage:stage ->
  unit ->
  life_cycle

val make_update_opportunity_request :
  ?life_cycle:life_cycle ->
  ?software_revenue:software_revenue ->
  ?marketing:marketing ->
  ?opportunity_type:opportunity_type ->
  ?project:project ->
  ?customer:customer ->
  ?partner_opportunity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  ?national_security:national_security ->
  ?primary_needs_from_aws:primary_needs_from_aws ->
  identifier:opportunity_identifier ->
  last_modified_date:date_time ->
  catalog:catalog_identifier ->
  unit ->
  update_opportunity_request

val make_address_summary :
  ?country_code:country_code ->
  ?state_or_region:address_part ->
  ?postal_code:address_part ->
  ?city:address_part ->
  unit ->
  address_summary

val make_lead_customer :
  ?market_segment:market_segment ->
  ?aws_maturity:aws_maturity ->
  ?website_url:company_website_url ->
  ?industry:industry ->
  address:address_summary ->
  company_name:company_name ->
  unit ->
  lead_customer

val make_lead_contact :
  ?phone:phone_number ->
  last_name:name ->
  first_name:name ->
  email:email ->
  business_title:job_title ->
  unit ->
  lead_contact

val make_lead_interaction :
  ?business_problem:engagement_customer_business_problem ->
  ?interaction_date:date_time ->
  ?usecase:engagement_use_case ->
  contact:lead_contact ->
  customer_action:customer_action ->
  source_name:lead_source_name ->
  source_id:lead_source_id ->
  source_type:lead_source_type ->
  unit ->
  lead_interaction

val make_lead_insights :
  ?lead_readiness_score:Smaws_Lib.Smithy_api.Types.string_ -> unit -> lead_insights

val make_update_lead_context :
  ?insights:lead_insights ->
  ?interaction:lead_interaction ->
  ?qualification_status:lead_qualification_status ->
  customer:lead_customer ->
  unit ->
  update_lead_context

val make_update_engagement_context_response :
  context_id:engagement_context_identifier ->
  engagement_last_modified_at:date_time ->
  engagement_arn:engagement_arn ->
  engagement_id:engagement_identifier ->
  unit ->
  update_engagement_context_response

val make_engagement_customer :
  country_code:country_code ->
  website_url:company_website_url ->
  company_name:company_name ->
  industry:industry ->
  unit ->
  engagement_customer

val make_engagement_customer_project_details :
  target_completion_date:Smaws_Lib.Smithy_api.Types.string_ ->
  business_problem:engagement_customer_business_problem ->
  title:engagement_customer_project_title ->
  unit ->
  engagement_customer_project_details

val make_customer_projects_context :
  ?project:engagement_customer_project_details ->
  ?customer:engagement_customer ->
  unit ->
  customer_projects_context

val make_prospecting_result_customer :
  ?public_profile_summary:prospecting_public_profile_summary ->
  ?eligible_programs:eligible_programs_list ->
  ?company_size:prospecting_company_size ->
  ?segment:prospecting_segment ->
  ?sub_industry:prospecting_sub_industry ->
  ?industry:industry ->
  ?country:country_code ->
  ?sub_region:prospecting_sub_region ->
  ?region:prospecting_region ->
  ?geo:prospecting_geo ->
  ?account_name:prospecting_account_name ->
  unit ->
  prospecting_result_customer

val make_prospecting_insights :
  ?solution_sub_category:Smaws_Lib.Smithy_api.Types.string_ ->
  ?solution_category:Smaws_Lib.Smithy_api.Types.string_ ->
  ?solution_score:Smaws_Lib.Smithy_api.Types.string_ ->
  ?marketplace_engagement_score:engagement_score_level ->
  unit ->
  prospecting_insights

val make_prospecting_result_aws :
  ?insights:prospecting_insights ->
  ?customer:prospecting_result_customer ->
  ?task_name:task_name ->
  ?task_arn:task_arn ->
  ?task_id:prospecting_task_identifier ->
  ?end_time:date_time ->
  ?start_time:date_time ->
  unit ->
  prospecting_result_aws

val make_update_engagement_context_request :
  payload:update_engagement_context_payload ->
  type_:engagement_context_type ->
  engagement_last_modified_at:date_time ->
  context_identifier:engagement_context_identifier ->
  engagement_identifier:engagement_arn_or_identifier ->
  catalog:catalog_identifier ->
  unit ->
  update_engagement_context_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:taggable_resource_arn -> unit -> untag_resource_request

val make_target_close_date_filter :
  ?before_target_close_date:date ->
  ?after_target_close_date:date ->
  unit ->
  target_close_date_filter

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:taggable_resource_arn -> unit -> tag_resource_request

val make_submit_opportunity_request :
  ?visibility:visibility ->
  involvement_type:sales_involvement_type ->
  identifier:opportunity_identifier ->
  catalog:catalog_identifier ->
  unit ->
  submit_opportunity_request

val make_stop_resource_snapshot_job_request :
  resource_snapshot_job_identifier:resource_snapshot_job_identifier ->
  catalog:catalog_identifier ->
  unit ->
  stop_resource_snapshot_job_request

val make_start_resource_snapshot_job_request :
  resource_snapshot_job_identifier:resource_snapshot_job_identifier ->
  catalog:catalog_identifier ->
  unit ->
  start_resource_snapshot_job_request

val make_start_prospecting_from_engagement_task_response :
  ?task_arn:prospecting_task_arn ->
  ?task_id:prospecting_task_identifier ->
  ?reason_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  task_status:prospecting_task_status ->
  start_time:date_time ->
  task_name:task_name ->
  identifiers:engagement_identifier_list ->
  unit ->
  start_prospecting_from_engagement_task_response

val make_start_prospecting_from_engagement_task_request :
  client_token:client_token ->
  task_name:task_name ->
  identifiers:engagement_identifier_list ->
  catalog:catalog_identifier ->
  unit ->
  start_prospecting_from_engagement_task_request

val make_start_opportunity_from_engagement_task_response :
  ?context_id:context_identifier ->
  ?engagement_id:engagement_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?opportunity_id:opportunity_identifier ->
  ?reason_code:reason_code ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_status:task_status ->
  ?start_time:date_time ->
  ?task_arn:task_arn ->
  ?task_id:task_identifier ->
  unit ->
  start_opportunity_from_engagement_task_response

val make_start_opportunity_from_engagement_task_request :
  ?tags:tag_list ->
  context_identifier:context_identifier ->
  identifier:engagement_arn_or_identifier ->
  client_token:client_token ->
  catalog:catalog_identifier ->
  unit ->
  start_opportunity_from_engagement_task_request

val make_start_engagement_from_opportunity_task_response :
  ?engagement_invitation_id:engagement_invitation_identifier ->
  ?engagement_id:engagement_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?opportunity_id:opportunity_identifier ->
  ?reason_code:reason_code ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_status:task_status ->
  ?start_time:date_time ->
  ?task_arn:task_arn ->
  ?task_id:task_identifier ->
  unit ->
  start_engagement_from_opportunity_task_response

val make_aws_submission :
  ?visibility:visibility -> involvement_type:sales_involvement_type -> unit -> aws_submission

val make_start_engagement_from_opportunity_task_request :
  ?tags:tag_list ->
  aws_submission:aws_submission ->
  identifier:opportunity_identifier ->
  client_token:client_token ->
  catalog:catalog_identifier ->
  unit ->
  start_engagement_from_opportunity_task_request

val make_start_engagement_by_accepting_invitation_task_response :
  ?engagement_invitation_id:engagement_invitation_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?opportunity_id:opportunity_identifier ->
  ?reason_code:reason_code ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_status:task_status ->
  ?start_time:date_time ->
  ?task_arn:task_arn ->
  ?task_id:task_identifier ->
  unit ->
  start_engagement_by_accepting_invitation_task_response

val make_start_engagement_by_accepting_invitation_task_request :
  ?tags:tag_list ->
  identifier:engagement_invitation_arn_or_identifier ->
  client_token:client_token ->
  catalog:catalog_identifier ->
  unit ->
  start_engagement_by_accepting_invitation_task_request

val make_sort_object : ?sort_order:sort_order -> ?sort_by:sort_by -> unit -> sort_object

val make_solution_sort :
  sort_by:solution_sort_name -> sort_order:sort_order -> unit -> solution_sort

val make_solution_base :
  ?aws_marketplace_solution_arn:aws_marketplace_solution_arn ->
  ?arn:solution_arn ->
  created_date:date_time ->
  category:Smaws_Lib.Smithy_api.Types.string_ ->
  status:solution_status ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  id:solution_identifier ->
  catalog:catalog_identifier ->
  unit ->
  solution_base

val make_sender_contact :
  ?phone:phone_number ->
  ?business_title:job_title ->
  ?last_name:name ->
  ?first_name:name ->
  email:sender_contact_email ->
  unit ->
  sender_contact

val make_resource_snapshot_summary :
  ?created_by:aws_account ->
  ?resource_snapshot_template_name:resource_template_name ->
  ?resource_id:resource_identifier ->
  ?resource_type:resource_type ->
  ?revision:resource_snapshot_revision ->
  ?arn:resource_snapshot_arn ->
  unit ->
  resource_snapshot_summary

val make_life_cycle_for_view :
  ?next_steps:pii_string ->
  ?stage:stage ->
  ?review_status:review_status ->
  ?target_close_date:date ->
  unit ->
  life_cycle_for_view

val make_project_view :
  ?other_solution_description:pii_string ->
  ?sales_activities:sales_activities ->
  ?customer_use_case:Smaws_Lib.Smithy_api.Types.string_ ->
  ?expected_contract_duration:expected_contract_duration ->
  ?expected_customer_spend:expected_customer_spend_list ->
  ?delivery_models:delivery_models ->
  unit ->
  project_view

val make_related_entity_identifiers :
  ?aws_marketplace_products:aws_marketplace_product_identifiers ->
  ?aws_marketplace_solutions:aws_marketplace_solution_identifiers ->
  ?aws_products:aws_product_identifiers ->
  ?solutions:solution_identifiers ->
  ?aws_marketplace_offer_sets:aws_marketplace_offer_set_identifiers ->
  ?aws_marketplace_offers:aws_marketplace_offer_identifiers ->
  unit ->
  related_entity_identifiers

val make_opportunity_summary_view :
  ?related_entity_identifiers:related_entity_identifiers ->
  ?project:project_view ->
  ?customer:customer ->
  ?primary_needs_from_aws:primary_needs_from_aws ->
  ?opportunity_team:partner_opportunity_team_members_list ->
  ?lifecycle:life_cycle_for_view ->
  ?opportunity_type:opportunity_type ->
  unit ->
  opportunity_summary_view

val make_profile_next_steps_history :
  time:date_time -> value:Smaws_Lib.Smithy_api.Types.string_ -> unit -> profile_next_steps_history

val make_aws_opportunity_life_cycle :
  ?next_steps_history:profile_next_steps_histories ->
  ?next_steps:pii_string ->
  ?stage:aws_opportunity_stage ->
  ?closed_lost_reason:aws_closed_lost_reason ->
  ?target_close_date:date ->
  unit ->
  aws_opportunity_life_cycle

val make_aws_team_member :
  ?business_title:aws_member_business_title ->
  ?last_name:name ->
  ?first_name:name ->
  ?email:email ->
  unit ->
  aws_team_member

val make_aws_product_optimization :
  savings_amount:monetary_amount ->
  description:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  aws_product_optimization

val make_aws_product_details :
  ?potential_savings_amount:monetary_amount ->
  ?optimized_amount:monetary_amount ->
  ?amount:monetary_amount ->
  ?service_code:Smaws_Lib.Smithy_api.Types.string_ ->
  optimizations:aws_product_optimizations_list ->
  categories:string_list ->
  product_code:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  aws_product_details

val make_aws_product_insights :
  ?total_potential_savings_amount:monetary_amount ->
  ?total_optimized_amount:monetary_amount ->
  ?total_amount:monetary_amount ->
  aws_products:aws_products_list ->
  total_amount_by_category:amount_map ->
  frequency:payment_frequency ->
  currency_code:currency_code ->
  unit ->
  aws_product_insights

val make_aws_products_spend_insights_by_source :
  ?aw_s:aws_product_insights ->
  ?partner:aws_product_insights ->
  unit ->
  aws_products_spend_insights_by_source

val make_opportunity_quality :
  ?trend:Smaws_Lib.Smithy_api.Types.string_ ->
  ?score:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  opportunity_quality

val make_recommendation :
  ?attributes:recommendation_attribute_map ->
  details:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recommendation

val make_aws_opportunity_insights :
  ?recommendations:recommendation_list ->
  ?opportunity_quality:opportunity_quality ->
  ?aws_products_spend_insights_by_source:aws_products_spend_insights_by_source ->
  ?engagement_score:engagement_score ->
  ?next_best_actions:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  aws_opportunity_insights

val make_aws_opportunity_related_entities :
  ?aws_marketplace_products:aws_marketplace_product_identifiers ->
  ?aws_marketplace_solutions:aws_marketplace_solution_identifiers ->
  ?solutions:solution_identifiers ->
  ?aws_products:aws_product_identifiers ->
  unit ->
  aws_opportunity_related_entities

val make_aws_opportunity_customer :
  ?contacts:customer_contacts_list -> unit -> aws_opportunity_customer

val make_aws_opportunity_project :
  ?aws_partition:aws_partition ->
  ?expected_customer_spend:expected_customer_spend_list ->
  unit ->
  aws_opportunity_project

val make_aws_opportunity_summary_full_view :
  ?cosell_motion:Smaws_Lib.Smithy_api.Types.string_ ->
  ?project:aws_opportunity_project ->
  ?customer:aws_opportunity_customer ->
  ?related_entity_ids:aws_opportunity_related_entities ->
  ?involvement_type_change_reason:involvement_type_change_reason ->
  ?insights:aws_opportunity_insights ->
  ?opportunity_team:aws_opportunity_team_members_list ->
  ?life_cycle:aws_opportunity_life_cycle ->
  ?visibility:visibility ->
  ?involvement_type:sales_involvement_type ->
  ?origin:opportunity_origin ->
  ?related_opportunity_id:opportunity_identifier ->
  unit ->
  aws_opportunity_summary_full_view

val make_resource_snapshot_job_summary :
  ?status:resource_snapshot_job_status ->
  ?engagement_id:engagement_identifier ->
  ?arn:resource_snapshot_job_arn ->
  ?id:resource_snapshot_job_identifier ->
  unit ->
  resource_snapshot_job_summary

val make_reject_engagement_invitation_request :
  ?rejection_reason:rejection_reason_string ->
  identifier:engagement_invitation_arn_or_identifier ->
  catalog:catalog_identifier ->
  unit ->
  reject_engagement_invitation_request

val make_account_receiver : ?alias:alias -> aws_account_id:aws_account -> unit -> account_receiver

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

val make_prospecting_task_summary :
  ?end_time:date_time ->
  failed_engagement_count:Smaws_Lib.Smithy_api.Types.integer ->
  completed_engagement_count:Smaws_Lib.Smithy_api.Types.integer ->
  total_engagement_count:Smaws_Lib.Smithy_api.Types.integer ->
  start_time:date_time ->
  task_name:task_name ->
  task_arn:prospecting_task_arn ->
  task_id:prospecting_task_identifier ->
  unit ->
  prospecting_task_summary

val make_prospecting_from_engagement_task_sort :
  sort_by:prospecting_from_engagement_task_sort_name ->
  sort_order:sort_order ->
  unit ->
  prospecting_from_engagement_task_sort

val make_project_summary :
  ?expected_contract_duration:expected_contract_duration ->
  ?expected_customer_spend:expected_customer_spend_list ->
  ?delivery_models:delivery_models ->
  unit ->
  project_summary

val make_project_details :
  expected_customer_spend:expected_customer_spend_list ->
  target_completion_date:date ->
  title:Smaws_Lib.Smithy_api.Types.string_ ->
  business_problem:engagement_customer_business_problem ->
  unit ->
  project_details

val make_opportunity_invitation_payload :
  ?sender_contacts:sender_contact_list ->
  project:project_details ->
  customer:engagement_customer ->
  receiver_responsibilities:receiver_responsibility_list ->
  unit ->
  opportunity_invitation_payload

val make_lead_invitation_customer :
  ?market_segment:market_segment ->
  ?aws_maturity:aws_maturity ->
  ?website_url:company_website_url ->
  ?industry:industry ->
  country_code:country_code ->
  company_name:company_name ->
  unit ->
  lead_invitation_customer

val make_lead_invitation_interaction :
  ?usecase:engagement_use_case ->
  contact_business_title:job_title ->
  source_name:lead_source_name ->
  source_id:lead_source_id ->
  source_type:lead_source_type ->
  unit ->
  lead_invitation_interaction

val make_lead_invitation_payload :
  interaction:lead_invitation_interaction ->
  customer:lead_invitation_customer ->
  unit ->
  lead_invitation_payload

val make_life_cycle_summary :
  ?review_status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?review_comments:Smaws_Lib.Smithy_api.Types.string_ ->
  ?review_status:review_status ->
  ?target_close_date:date ->
  ?next_steps:pii_string ->
  ?closed_lost_reason:closed_lost_reason ->
  ?stage:stage ->
  unit ->
  life_cycle_summary

val make_account_summary :
  ?address:address_summary ->
  ?website_url:website_url ->
  ?other_industry:Smaws_Lib.Smithy_api.Types.string_ ->
  ?industry:industry ->
  company_name:name ->
  unit ->
  account_summary

val make_customer_summary : ?account:account_summary -> unit -> customer_summary

val make_opportunity_summary :
  ?project:project_summary ->
  ?customer:customer_summary ->
  ?life_cycle:life_cycle_summary ->
  ?created_date:date_time ->
  ?last_modified_date:date_time ->
  ?opportunity_type:opportunity_type ->
  ?partner_opportunity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:opportunity_arn ->
  ?id:opportunity_identifier ->
  catalog:catalog_identifier ->
  unit ->
  opportunity_summary

val make_opportunity_sort :
  sort_by:opportunity_sort_name -> sort_order:sort_order -> unit -> opportunity_sort

val make_opportunity_engagement_invitation_sort :
  sort_by:opportunity_engagement_invitation_sort_name ->
  sort_order:sort_order ->
  unit ->
  opportunity_engagement_invitation_sort

val make_list_tasks_sort_base :
  sort_by:list_tasks_sort_name -> sort_order:sort_order -> unit -> list_tasks_sort_base

val make_list_tags_for_resource_response : tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_request

val make_list_solutions_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  solution_summaries:solution_list ->
  unit ->
  list_solutions_response

val make_list_solutions_request :
  ?aws_marketplace_solution_arn:aws_marketplace_solution_arn_list ->
  ?category:string_list ->
  ?identifier:solution_identifiers ->
  ?status:filter_status ->
  ?sort:solution_sort ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:page_size ->
  catalog:catalog_identifier ->
  unit ->
  list_solutions_request

val make_list_resource_snapshots_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_snapshot_summaries:resource_snapshot_summary_list ->
  unit ->
  list_resource_snapshots_response

val make_list_resource_snapshots_request :
  ?created_by:aws_account ->
  ?resource_snapshot_template_identifier:resource_template_name ->
  ?resource_identifier:resource_identifier ->
  ?resource_type:resource_type ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:page_size ->
  engagement_identifier:engagement_identifier ->
  catalog:catalog_identifier ->
  unit ->
  list_resource_snapshots_request

val make_list_resource_snapshot_jobs_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_snapshot_job_summaries:resource_snapshot_job_summary_list ->
  unit ->
  list_resource_snapshot_jobs_response

val make_list_resource_snapshot_jobs_request :
  ?sort:sort_object ->
  ?status:resource_snapshot_job_status ->
  ?engagement_identifier:engagement_identifier ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:page_size ->
  catalog:catalog_identifier ->
  unit ->
  list_resource_snapshot_jobs_request

val make_list_prospecting_from_engagement_tasks_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  task_summaries:prospecting_task_summary_list ->
  unit ->
  list_prospecting_from_engagement_tasks_response

val make_list_prospecting_from_engagement_tasks_request :
  ?sort:prospecting_from_engagement_task_sort ->
  ?start_before:date_time ->
  ?start_after:date_time ->
  ?task_name:task_name_list ->
  ?task_identifier:task_identifier_list ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:page_size ->
  catalog:catalog_identifier ->
  unit ->
  list_prospecting_from_engagement_tasks_request

val make_list_opportunity_from_engagement_task_summary :
  ?context_id:context_identifier ->
  ?engagement_id:engagement_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?opportunity_id:opportunity_identifier ->
  ?reason_code:reason_code ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_status:task_status ->
  ?start_time:date_time ->
  ?task_arn:task_arn ->
  ?task_id:task_identifier ->
  unit ->
  list_opportunity_from_engagement_task_summary

val make_list_opportunity_from_engagement_tasks_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_summaries:list_opportunity_from_engagement_task_summaries ->
  unit ->
  list_opportunity_from_engagement_tasks_response

val make_list_opportunity_from_engagement_tasks_request :
  ?context_identifier:context_identifiers ->
  ?engagement_identifier:engagement_identifiers ->
  ?opportunity_identifier:opportunity_identifiers ->
  ?task_identifier:task_identifiers ->
  ?task_status:task_statuses ->
  ?sort:list_tasks_sort_base ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  catalog:catalog_identifier ->
  unit ->
  list_opportunity_from_engagement_tasks_request

val make_list_opportunities_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  opportunity_summaries:opportunity_summaries ->
  unit ->
  list_opportunities_response

val make_last_modified_date :
  ?before_last_modified_date:date_time ->
  ?after_last_modified_date:date_time ->
  unit ->
  last_modified_date

val make_created_date_filter :
  ?before_created_date:date_time -> ?after_created_date:date_time -> unit -> created_date_filter

val make_list_opportunities_request :
  ?target_close_date:target_close_date_filter ->
  ?created_date:created_date_filter ->
  ?customer_company_name:string_list ->
  ?life_cycle_review_status:filter_life_cycle_review_status ->
  ?life_cycle_stage:filter_life_cycle_stage ->
  ?identifier:filter_identifier ->
  ?last_modified_date:last_modified_date ->
  ?sort:opportunity_sort ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:page_size ->
  catalog:catalog_identifier ->
  unit ->
  list_opportunities_request

val make_engagement_summary :
  ?context_types:engagement_context_type_list ->
  ?modified_by:aws_account ->
  ?modified_at:date_time ->
  ?member_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?created_by:aws_account ->
  ?created_at:date_time ->
  ?title:engagement_title ->
  ?id:engagement_identifier ->
  ?arn:engagement_arn ->
  unit ->
  engagement_summary

val make_list_engagements_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  engagement_summary_list:engagement_summary_list ->
  unit ->
  list_engagements_response

val make_engagement_sort :
  sort_by:engagement_sort_name -> sort_order:sort_order -> unit -> engagement_sort

val make_list_engagements_request :
  ?engagement_identifier:engagement_identifiers ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:engagement_page_size ->
  ?sort:engagement_sort ->
  ?exclude_context_types:engagement_context_type_list ->
  ?context_types:engagement_context_type_list ->
  ?exclude_created_by:aws_account_list ->
  ?created_by:aws_account_list ->
  catalog:catalog_identifier ->
  unit ->
  list_engagements_request

val make_engagement_resource_association_summary :
  ?created_by:aws_account ->
  ?resource_id:resource_identifier ->
  ?resource_type:resource_type ->
  ?engagement_id:engagement_identifier ->
  catalog:catalog_identifier ->
  unit ->
  engagement_resource_association_summary

val make_list_engagement_resource_associations_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  engagement_resource_association_summaries:engagement_resource_association_summary_list ->
  unit ->
  list_engagement_resource_associations_response

val make_list_engagement_resource_associations_request :
  ?created_by:aws_account ->
  ?resource_identifier:resource_identifier ->
  ?resource_type:resource_type ->
  ?engagement_identifier:engagement_identifier ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:page_size ->
  catalog:catalog_identifier ->
  unit ->
  list_engagement_resource_associations_request

val make_engagement_member :
  ?account_id:aws_account ->
  ?website_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?company_name:member_company_name ->
  unit ->
  engagement_member

val make_list_engagement_members_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  engagement_member_list:engagement_members ->
  unit ->
  list_engagement_members_response

val make_list_engagement_members_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:member_page_size ->
  identifier:engagement_arn_or_identifier ->
  catalog:catalog_identifier ->
  unit ->
  list_engagement_members_request

val make_engagement_invitation_summary :
  ?participant_type:participant_type ->
  ?receiver:receiver ->
  ?sender_company_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sender_aws_account_id:aws_account ->
  ?expiration_date:date_time ->
  ?invitation_date:date_time ->
  ?status:invitation_status ->
  ?engagement_title:engagement_title ->
  ?engagement_id:engagement_identifier ->
  ?payload_type:engagement_invitation_payload_type ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_identifier ->
  id:engagement_invitation_arn_or_identifier ->
  unit ->
  engagement_invitation_summary

val make_list_engagement_invitations_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?engagement_invitation_summaries:engagement_invitation_summaries ->
  unit ->
  list_engagement_invitations_response

val make_list_engagement_invitations_request :
  ?sender_aws_account_id:aws_account_id_or_alias_list ->
  ?engagement_identifier:engagement_identifiers ->
  ?status:invitation_status_list ->
  ?payload_type:engagement_invitations_payload_type ->
  ?sort:opportunity_engagement_invitation_sort ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:page_size ->
  participant_type:participant_type ->
  catalog:catalog_identifier ->
  unit ->
  list_engagement_invitations_request

val make_list_engagement_from_opportunity_task_summary :
  ?engagement_invitation_id:engagement_invitation_identifier ->
  ?engagement_id:engagement_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?opportunity_id:opportunity_identifier ->
  ?reason_code:reason_code ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_status:task_status ->
  ?start_time:date_time ->
  ?task_arn:task_arn ->
  ?task_id:task_identifier ->
  unit ->
  list_engagement_from_opportunity_task_summary

val make_list_engagement_from_opportunity_tasks_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_summaries:list_engagement_from_opportunity_task_summaries ->
  unit ->
  list_engagement_from_opportunity_tasks_response

val make_list_engagement_from_opportunity_tasks_request :
  ?engagement_identifier:engagement_identifiers ->
  ?opportunity_identifier:opportunity_identifiers ->
  ?task_identifier:task_identifiers ->
  ?task_status:task_statuses ->
  ?sort:list_tasks_sort_base ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  catalog:catalog_identifier ->
  unit ->
  list_engagement_from_opportunity_tasks_request

val make_list_engagement_by_accepting_invitation_task_summary :
  ?engagement_invitation_id:engagement_invitation_identifier ->
  ?resource_snapshot_job_id:resource_snapshot_job_identifier ->
  ?opportunity_id:opportunity_identifier ->
  ?reason_code:reason_code ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_status:task_status ->
  ?start_time:date_time ->
  ?task_arn:task_arn ->
  ?task_id:task_identifier ->
  unit ->
  list_engagement_by_accepting_invitation_task_summary

val make_list_engagement_by_accepting_invitation_tasks_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?task_summaries:list_engagement_by_accepting_invitation_task_summaries ->
  unit ->
  list_engagement_by_accepting_invitation_tasks_response

val make_list_engagement_by_accepting_invitation_tasks_request :
  ?task_identifier:task_identifiers ->
  ?engagement_invitation_identifier:engagement_invitation_identifiers ->
  ?opportunity_identifier:opportunity_identifiers ->
  ?task_status:task_statuses ->
  ?sort:list_tasks_sort_base ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  catalog:catalog_identifier ->
  unit ->
  list_engagement_by_accepting_invitation_tasks_request

val make_lead_context :
  ?qualification_status:lead_qualification_status ->
  ?insights:lead_insights ->
  interactions:lead_interaction_list ->
  customer:lead_customer ->
  unit ->
  lead_context

val make_invitation :
  payload:payload -> receiver:receiver -> message:invitation_message -> unit -> invitation

val make_get_selling_system_settings_response :
  ?resource_snapshot_job_role_arn:resource_snapshot_job_role_arn ->
  catalog:catalog_identifier ->
  unit ->
  get_selling_system_settings_response

val make_get_selling_system_settings_request :
  catalog:catalog_identifier -> unit -> get_selling_system_settings_request

val make_get_resource_snapshot_response :
  ?target_member_accounts:aws_account_id_or_alias_list ->
  ?payload:resource_snapshot_payload ->
  ?revision:resource_snapshot_revision ->
  ?resource_snapshot_template_name:resource_template_name ->
  ?resource_id:resource_identifier ->
  ?resource_type:resource_type ->
  ?engagement_id:engagement_identifier ->
  ?created_at:date_time ->
  ?created_by:aws_account ->
  ?arn:resource_arn ->
  catalog:catalog_identifier ->
  unit ->
  get_resource_snapshot_response

val make_get_resource_snapshot_request :
  ?revision:resource_snapshot_revision ->
  resource_snapshot_template_identifier:resource_template_name ->
  resource_identifier:resource_identifier ->
  resource_type:resource_type ->
  engagement_identifier:engagement_identifier ->
  catalog:catalog_identifier ->
  unit ->
  get_resource_snapshot_request

val make_get_resource_snapshot_job_response :
  ?last_failure:Smaws_Lib.Smithy_api.Types.string_ ->
  ?last_successful_execution_date:date_time ->
  ?status:resource_snapshot_job_status ->
  ?created_at:date_time ->
  ?resource_snapshot_template_name:resource_template_name ->
  ?resource_arn:resource_arn ->
  ?resource_id:resource_identifier ->
  ?resource_type:resource_type ->
  ?engagement_id:engagement_identifier ->
  ?arn:resource_snapshot_job_arn ->
  ?id:resource_snapshot_job_identifier ->
  catalog:catalog_identifier ->
  unit ->
  get_resource_snapshot_job_response

val make_get_resource_snapshot_job_request :
  resource_snapshot_job_identifier:resource_snapshot_job_identifier ->
  catalog:catalog_identifier ->
  unit ->
  get_resource_snapshot_job_request

val make_get_prospecting_from_engagement_task_response :
  ?end_time:date_time ->
  engagements:engagement_prospecting_result_list ->
  start_time:date_time ->
  task_name:task_name ->
  task_arn:prospecting_task_arn ->
  task_id:prospecting_task_identifier ->
  unit ->
  get_prospecting_from_engagement_task_response

val make_get_prospecting_from_engagement_task_request :
  task_identifier:prospecting_task_identifier ->
  catalog:catalog_identifier ->
  unit ->
  get_prospecting_from_engagement_task_request

val make_get_opportunity_response :
  ?opportunity_team:partner_opportunity_team_members_list ->
  ?life_cycle:life_cycle ->
  ?arn:opportunity_arn ->
  ?software_revenue:software_revenue ->
  ?marketing:marketing ->
  ?opportunity_type:opportunity_type ->
  ?project:project ->
  ?customer:customer ->
  ?partner_opportunity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  ?national_security:national_security ->
  ?primary_needs_from_aws:primary_needs_from_aws ->
  related_entity_identifiers:related_entity_identifiers ->
  created_date:date_time ->
  last_modified_date:date_time ->
  id:opportunity_identifier ->
  catalog:catalog_identifier ->
  unit ->
  get_opportunity_response

val make_get_opportunity_request :
  identifier:opportunity_identifier -> catalog:catalog_identifier -> unit -> get_opportunity_request

val make_engagement_context_details :
  ?payload:engagement_context_payload ->
  ?id:engagement_context_identifier ->
  type_:engagement_context_type ->
  unit ->
  engagement_context_details

val make_get_engagement_response :
  ?contexts:engagement_contexts ->
  ?modified_by:aws_account ->
  ?modified_at:date_time ->
  ?member_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?created_by:aws_account ->
  ?created_at:date_time ->
  ?description:engagement_description ->
  ?title:engagement_title ->
  ?arn:engagement_arn ->
  ?id:engagement_identifier ->
  unit ->
  get_engagement_response

val make_get_engagement_request :
  identifier:engagement_arn_or_identifier ->
  catalog:catalog_identifier ->
  unit ->
  get_engagement_request

val make_engagement_member_summary :
  ?website_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?company_name:member_company_name ->
  unit ->
  engagement_member_summary

val make_get_engagement_invitation_response :
  ?existing_members:engagement_member_summaries ->
  ?engagement_description:engagement_description ->
  ?invitation_message:invitation_message ->
  ?payload:payload ->
  ?rejection_reason:rejection_reason_string ->
  ?receiver:receiver ->
  ?sender_company_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sender_aws_account_id:aws_account ->
  ?expiration_date:date_time ->
  ?invitation_date:date_time ->
  ?status:invitation_status ->
  ?engagement_title:engagement_title ->
  ?engagement_id:engagement_identifier ->
  ?payload_type:engagement_invitation_payload_type ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  catalog:catalog_identifier ->
  id:engagement_invitation_arn_or_identifier ->
  unit ->
  get_engagement_invitation_response

val make_get_engagement_invitation_request :
  identifier:engagement_invitation_arn_or_identifier ->
  catalog:catalog_identifier ->
  unit ->
  get_engagement_invitation_request

val make_get_aws_opportunity_summary_response :
  ?cosell_motion:Smaws_Lib.Smithy_api.Types.string_ ->
  ?project:aws_opportunity_project ->
  ?customer:aws_opportunity_customer ->
  ?related_entity_ids:aws_opportunity_related_entities ->
  ?involvement_type_change_reason:involvement_type_change_reason ->
  ?insights:aws_opportunity_insights ->
  ?opportunity_team:aws_opportunity_team_members_list ->
  ?life_cycle:aws_opportunity_life_cycle ->
  ?visibility:visibility ->
  ?involvement_type:sales_involvement_type ->
  ?origin:opportunity_origin ->
  ?related_opportunity_id:opportunity_identifier ->
  catalog:catalog_identifier ->
  unit ->
  get_aws_opportunity_summary_response

val make_get_aws_opportunity_summary_request :
  related_opportunity_identifier:opportunity_identifier ->
  catalog:catalog_identifier ->
  unit ->
  get_aws_opportunity_summary_request

val make_disassociate_opportunity_request :
  related_entity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  related_entity_type:related_entity_type ->
  opportunity_identifier:opportunity_identifier ->
  catalog:catalog_identifier ->
  unit ->
  disassociate_opportunity_request

val make_delete_resource_snapshot_job_request :
  resource_snapshot_job_identifier:resource_snapshot_job_identifier ->
  catalog:catalog_identifier ->
  unit ->
  delete_resource_snapshot_job_request

val make_create_resource_snapshot_response :
  ?revision:resource_snapshot_revision ->
  ?arn:resource_arn ->
  unit ->
  create_resource_snapshot_response

val make_create_resource_snapshot_request :
  client_token:client_token ->
  resource_snapshot_template_identifier:resource_template_name ->
  resource_identifier:resource_identifier ->
  resource_type:resource_type ->
  engagement_identifier:engagement_identifier ->
  catalog:catalog_identifier ->
  unit ->
  create_resource_snapshot_request

val make_create_resource_snapshot_job_response :
  ?arn:resource_snapshot_job_arn ->
  ?id:resource_snapshot_job_identifier ->
  unit ->
  create_resource_snapshot_job_response

val make_create_resource_snapshot_job_request :
  ?tags:tag_list ->
  resource_snapshot_template_identifier:resource_template_name ->
  resource_identifier:resource_identifier ->
  resource_type:resource_type ->
  engagement_identifier:engagement_identifier ->
  client_token:client_token ->
  catalog:catalog_identifier ->
  unit ->
  create_resource_snapshot_job_request

val make_create_opportunity_response :
  ?last_modified_date:date_time ->
  ?partner_opportunity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  id:opportunity_identifier ->
  unit ->
  create_opportunity_response

val make_create_opportunity_request :
  ?tags:tag_list ->
  ?opportunity_team:partner_opportunity_team_members_list ->
  ?origin:opportunity_origin ->
  ?life_cycle:life_cycle ->
  ?software_revenue:software_revenue ->
  ?marketing:marketing ->
  ?opportunity_type:opportunity_type ->
  ?project:project ->
  ?customer:customer ->
  ?partner_opportunity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  ?national_security:national_security ->
  ?primary_needs_from_aws:primary_needs_from_aws ->
  client_token:client_token ->
  catalog:catalog_identifier ->
  unit ->
  create_opportunity_request

val make_create_engagement_response :
  ?modified_at:date_time ->
  ?arn:engagement_arn ->
  ?id:engagement_identifier ->
  unit ->
  create_engagement_response

val make_create_engagement_request :
  ?contexts:engagement_contexts ->
  description:engagement_description ->
  title:engagement_title ->
  client_token:client_token ->
  catalog:catalog_identifier ->
  unit ->
  create_engagement_request

val make_create_engagement_invitation_response :
  arn:engagement_invitation_arn ->
  id:engagement_invitation_identifier ->
  unit ->
  create_engagement_invitation_response

val make_create_engagement_invitation_request :
  invitation:invitation ->
  engagement_identifier:engagement_identifier ->
  client_token:client_token ->
  catalog:catalog_identifier ->
  unit ->
  create_engagement_invitation_request

val make_create_engagement_context_response :
  ?context_id:engagement_context_identifier ->
  ?engagement_last_modified_at:date_time ->
  ?engagement_arn:engagement_arn ->
  ?engagement_id:engagement_identifier ->
  unit ->
  create_engagement_context_response

val make_create_engagement_context_request :
  payload:engagement_context_payload ->
  type_:engagement_context_type ->
  client_token:client_token ->
  engagement_identifier:engagement_arn_or_identifier ->
  catalog:catalog_identifier ->
  unit ->
  create_engagement_context_request

val make_associate_opportunity_request :
  related_entity_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  related_entity_type:related_entity_type ->
  opportunity_identifier:opportunity_identifier ->
  catalog:catalog_identifier ->
  unit ->
  associate_opportunity_request

val make_assignee_contact :
  ?phone:phone_number ->
  business_title:job_title ->
  last_name:name ->
  first_name:name ->
  email:email ->
  unit ->
  assignee_contact

val make_assign_opportunity_request :
  assignee:assignee_contact ->
  identifier:opportunity_identifier ->
  catalog:catalog_identifier ->
  unit ->
  assign_opportunity_request

val make_accept_engagement_invitation_request :
  identifier:engagement_invitation_arn_or_identifier ->
  catalog:catalog_identifier ->
  unit ->
  accept_engagement_invitation_request
(** {1:operations Operations} *)

module AcceptEngagementInvitation : sig
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
    accept_engagement_invitation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    accept_engagement_invitation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
  "Use the [AcceptEngagementInvitation] action to accept an engagement invitation shared by AWS. \
   Accepting the invitation indicates your willingness to participate in the engagement, granting \
   you access to all engagement-related data.\n"]

module AssignOpportunity : sig
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
    assign_opportunity_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    assign_opportunity_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
  "Enables you to reassign an existing [Opportunity] to another user within your Partner Central \
   account. The specified user receives the opportunity, and it appears on their Partner Central \
   dashboard, allowing them to take necessary actions or proceed with the opportunity.\n\n\
  \ This is useful for distributing opportunities to the appropriate team members or departments \
   within your organization, ensuring that each opportunity is handled by the right person. By \
   default, the opportunity owner is the one who creates it. Currently, there's no API to \
   enumerate the list of available users.\n\
  \ "]

module AssociateOpportunity : sig
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
    associate_opportunity_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_opportunity_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
  "Enables you to create a formal association between an [Opportunity] and various related \
   entities, enriching the context and details of the opportunity for better collaboration and \
   decision making. You can associate an opportunity with the following entity types:\n\n\
  \ {ul\n\
  \       {-  Partner Solution: A software product or consulting practice created and delivered by \
   Partners. Partner Solutions help customers address business challenges using Amazon Web \
   Services services.\n\
  \           \n\
  \            }\n\
  \       {-  Amazon Web Services Products: Amazon Web Services offers many products and services \
   that provide scalable, reliable, and cost-effective infrastructure solutions. For the latest \
   list of Amazon Web Services products, see \
   {{:https://github.com/aws-samples/partner-crm-integration-samples/blob/main/resources/aws_products.json}Amazon \
   Web Services products}.\n\
  \           \n\
  \            }\n\
  \       {-  Amazon Web Services Marketplace private offer: Allows Amazon Web Services \
   Marketplace sellers to extend custom pricing and terms to individual Amazon Web Services \
   customers. Sellers can negotiate custom prices, payment schedules, and end user license terms \
   through private offers, enabling Amazon Web Services customers to acquire software solutions \
   tailored to their specific needs. For more information, see \
   {{:https://docs.aws.amazon.com/marketplace/latest/buyerguide/buyer-private-offers.html}Private \
   offers in Amazon Web Services Marketplace}.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   To obtain identifiers for these entities, use the following methods:\n\
  \   \n\
  \    {ul\n\
  \          {-  Solution: Use the [ListSolutions] operation.\n\
  \              \n\
  \               }\n\
  \          {-  AWS Products: For the latest list of Amazon Web Services products, see \
   {{:https://github.com/aws-samples/partner-crm-integration-samples/blob/main/resources/aws_products.json}Amazon \
   Web Services products}.\n\
  \              \n\
  \               }\n\
  \          {-  Amazon Web Services Marketplace private offer: Use the \
   {{:https://docs.aws.amazon.com/marketplace/latest/APIReference/catalog-apis.html}Using the \
   Amazon Web Services Marketplace Catalog API} to list entities. Specifically, use the \
   [ListEntities] operation to retrieve a list of private offers. The request returns the details \
   of available private offers. For more information, see \
   {{:https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/API_ListEntities.html}ListEntities}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module CreateEngagement : sig
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
    create_engagement_request ->
    ( create_engagement_response,
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
    create_engagement_request ->
    ( create_engagement_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "The [CreateEngagement] action allows you to create an [Engagement], which serves as a \
   collaborative space between different parties such as AWS Partners and AWS Sellers. This action \
   automatically adds the caller's AWS account as an active member of the newly created \
   [Engagement].\n"]

module CreateEngagementContext : sig
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
    create_engagement_context_request ->
    ( create_engagement_context_response,
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
    create_engagement_context_request ->
    ( create_engagement_context_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Creates a new context within an existing engagement. This action allows you to add contextual \
   information such as customer projects or documents to an engagement, providing additional \
   details that help facilitate collaboration between engagement members.\n"]

module CreateEngagementInvitation : sig
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
    create_engagement_invitation_request ->
    ( create_engagement_invitation_response,
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
    create_engagement_invitation_request ->
    ( create_engagement_invitation_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  " This action creates an invitation from a sender to a single receiver to join an engagement. \n"]

module CreateOpportunity : sig
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
    create_opportunity_request ->
    ( create_opportunity_response,
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
    create_opportunity_request ->
    ( create_opportunity_response Smaws_Lib.Response.t,
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
  "Creates an [Opportunity] record in Partner Central. Use this operation to create a potential \
   business opportunity for submission to Amazon Web Services. Creating an opportunity sets \
   [Lifecycle.ReviewStatus] to [Pending Submission].\n\n\
  \ To submit an opportunity, follow these steps:\n\
  \ \n\
  \  {ol\n\
  \        {-  To create the opportunity, use [CreateOpportunity].\n\
  \            \n\
  \             }\n\
  \        {-  To associate a solution with the opportunity, use [AssociateOpportunity].\n\
  \            \n\
  \             }\n\
  \        {-  To start the engagement with AWS, use [StartEngagementFromOpportunity].\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   After submission, you can't edit the opportunity until the review is complete. But \
   opportunities in the [Pending Submission] state must have complete details. You can update the \
   opportunity while it's in the [Pending Submission] state.\n\
  \   \n\
  \    There's a set of mandatory fields to create opportunities, but consider providing optional \
   fields to enrich the opportunity record.\n\
  \    "]

module CreateResourceSnapshot : sig
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
    create_resource_snapshot_request ->
    ( create_resource_snapshot_response,
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
    create_resource_snapshot_request ->
    ( create_resource_snapshot_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  " This action allows you to create an immutable snapshot of a specific resource, such as an \
   opportunity, within the context of an engagement. The snapshot captures a subset of the \
   resource's data based on the schema defined by the provided template.\n"]

module CreateResourceSnapshotJob : sig
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
    create_resource_snapshot_job_request ->
    ( create_resource_snapshot_job_response,
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
    create_resource_snapshot_job_request ->
    ( create_resource_snapshot_job_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Use this action to create a job to generate a snapshot of the specified resource within an \
   engagement. It initiates an asynchronous process to create a resource snapshot. The job creates \
   a new snapshot only if the resource state has changed, adhering to the same access control and \
   immutability rules as direct snapshot creation.\n"]

module DeleteResourceSnapshotJob : sig
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
    delete_resource_snapshot_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    delete_resource_snapshot_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
  " Use this action to deletes a previously created resource snapshot job. The job must be in a \
   stopped state before it can be deleted. \n"]

module DisassociateOpportunity : sig
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
    disassociate_opportunity_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_opportunity_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
  "Allows you to remove an existing association between an [Opportunity] and related entities, \
   such as a Partner Solution, Amazon Web Services product, or an Amazon Web Services Marketplace \
   offer. This operation is the counterpart to [AssociateOpportunity], and it provides flexibility \
   to manage associations as business needs change.\n\n\
  \ Use this operation to update the associations of an [Opportunity] due to changes in the \
   related entities, or if an association was made in error. Ensuring accurate associations helps \
   maintain clarity and accuracy to track and manage business opportunities. When you replace an \
   entity, first attach the new entity and then disassociate the one to be removed, especially if \
   it's the last remaining entity that's required.\n\
  \ "]

module GetAwsOpportunitySummary : sig
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
    get_aws_opportunity_summary_request ->
    ( get_aws_opportunity_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_aws_opportunity_summary_request ->
    ( get_aws_opportunity_summary_response Smaws_Lib.Response.t,
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
  "Retrieves a summary of an AWS Opportunity. This summary includes high-level details about the \
   opportunity sourced from AWS, such as lifecycle information, customer details, and involvement \
   type. It is useful for tracking updates on the AWS opportunity corresponding to an opportunity \
   in the partner's account.\n"]

module GetEngagement : sig
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
    get_engagement_request ->
    ( get_engagement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_engagement_request ->
    ( get_engagement_response Smaws_Lib.Response.t,
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
  "Use this action to retrieve the engagement record for a given [EngagementIdentifier].\n"]

module GetEngagementInvitation : sig
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
    get_engagement_invitation_request ->
    ( get_engagement_invitation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_engagement_invitation_request ->
    ( get_engagement_invitation_response Smaws_Lib.Response.t,
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
  "Retrieves the details of an engagement invitation shared by AWS with a partner. The information \
   includes aspects such as customer, project details, and lifecycle information. To connect an \
   engagement invitation with an opportunity, match the invitation\226\128\153s \
   [Payload.Project.Title] with opportunity [Project.Title].\n"]

module GetOpportunity : sig
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
    get_opportunity_request ->
    ( get_opportunity_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_opportunity_request ->
    ( get_opportunity_response Smaws_Lib.Response.t,
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
  "Fetches the [Opportunity] record from Partner Central by a given [Identifier].\n\n\
  \ Use the [ListOpportunities] action or the event notification (from Amazon EventBridge) to \
   obtain this identifier.\n\
  \ "]

module GetProspectingFromEngagementTask : sig
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
    get_prospecting_from_engagement_task_request ->
    ( get_prospecting_from_engagement_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_prospecting_from_engagement_task_request ->
    ( get_prospecting_from_engagement_task_response Smaws_Lib.Response.t,
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
  "Retrieves the details and current status of a prospecting task previously started with \
   [StartProspectingFromEngagementTask] to enable polling for completion and access to \
   per-engagement processing results.\n"]

module GetResourceSnapshot : sig
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
    get_resource_snapshot_request ->
    ( get_resource_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_snapshot_request ->
    ( get_resource_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Use this action to retrieve a specific snapshot record.\n"]

module GetResourceSnapshotJob : sig
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
    get_resource_snapshot_job_request ->
    ( get_resource_snapshot_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_snapshot_job_request ->
    ( get_resource_snapshot_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Use this action to retrieves information about a specific resource snapshot job.\n"]

module GetSellingSystemSettings : sig
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
    get_selling_system_settings_request ->
    ( get_selling_system_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_selling_system_settings_request ->
    ( get_selling_system_settings_response Smaws_Lib.Response.t,
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
  "Retrieves the currently set system settings, which include the IAM Role used for resource \
   snapshot jobs.\n"]

module ListEngagementByAcceptingInvitationTasks : sig
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
    list_engagement_by_accepting_invitation_tasks_request ->
    ( list_engagement_by_accepting_invitation_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_engagement_by_accepting_invitation_tasks_request ->
    ( list_engagement_by_accepting_invitation_tasks_response Smaws_Lib.Response.t,
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
  " Lists all in-progress, completed, or failed StartEngagementByAcceptingInvitationTask tasks \
   that were initiated by the caller's account. \n"]

module ListEngagementFromOpportunityTasks : sig
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
    list_engagement_from_opportunity_tasks_request ->
    ( list_engagement_from_opportunity_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_engagement_from_opportunity_tasks_request ->
    ( list_engagement_from_opportunity_tasks_response Smaws_Lib.Response.t,
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
  " Lists all in-progress, completed, or failed [EngagementFromOpportunity] tasks that were \
   initiated by the caller's account. \n"]

module ListEngagementInvitations : sig
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
    list_engagement_invitations_request ->
    ( list_engagement_invitations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_engagement_invitations_request ->
    ( list_engagement_invitations_response Smaws_Lib.Response.t,
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
  "Retrieves a list of engagement invitations sent to the partner. This allows partners to view \
   all pending or past engagement invitations, helping them track opportunities shared by AWS.\n"]

module ListEngagementMembers : sig
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
    list_engagement_members_request ->
    ( list_engagement_members_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_engagement_members_request ->
    ( list_engagement_members_response Smaws_Lib.Response.t,
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
  "Retrieves the details of member partners in an Engagement. This operation can only be invoked \
   by members of the Engagement. The [ListEngagementMembers] operation allows you to fetch \
   information about the members of a specific Engagement. This action is restricted to members of \
   the Engagement being queried. \n"]

module ListEngagementResourceAssociations : sig
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
    list_engagement_resource_associations_request ->
    ( list_engagement_resource_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_engagement_resource_associations_request ->
    ( list_engagement_resource_associations_response Smaws_Lib.Response.t,
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
  "Lists the associations between resources and engagements where the caller is a member and has \
   at least one snapshot in the engagement.\n"]

module ListEngagements : sig
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
    list_engagements_request ->
    ( list_engagements_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_engagements_request ->
    ( list_engagements_response Smaws_Lib.Response.t,
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
  "This action allows users to retrieve a list of Engagement records from Partner Central. This \
   action can be used to manage and track various engagements across different stages of the \
   partner selling process. \n"]

module ListOpportunities : sig
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
    list_opportunities_request ->
    ( list_opportunities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_opportunities_request ->
    ( list_opportunities_response Smaws_Lib.Response.t,
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
  "This request accepts a list of filters that retrieve opportunity subsets as well as sort \
   options. This feature is available to partners from \
   {{:https://partnercentral.awspartner.com/}Partner Central} using the [ListOpportunities] API \
   action.\n\n\
  \ To synchronize your system with Amazon Web Services, list only the opportunities that were \
   newly created or updated. We recommend you rely on events emitted by the service into your \
   Amazon Web Services account\226\128\153s Amazon EventBridge default event bus. You can also use \
   the [ListOpportunities] action.\n\
  \ \n\
  \  We recommend the following approach:\n\
  \  \n\
  \   {ol\n\
  \         {-  Find the latest [LastModifiedDate] that you stored, and only use the values that \
   came from Amazon Web Services. Don\226\128\153t use values generated by your system.\n\
  \             \n\
  \              }\n\
  \         {-  When you send a [ListOpportunities] request, submit the date in ISO 8601 format in \
   the [AfterLastModifiedDate] filter.\n\
  \             \n\
  \              }\n\
  \         {-  Amazon Web Services only returns opportunities created or updated on or after that \
   date and time. Use [NextToken] to iterate over all pages.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module ListOpportunityFromEngagementTasks : sig
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
    list_opportunity_from_engagement_tasks_request ->
    ( list_opportunity_from_engagement_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_opportunity_from_engagement_tasks_request ->
    ( list_opportunity_from_engagement_tasks_response Smaws_Lib.Response.t,
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
  "Lists all in-progress, completed, or failed opportunity creation tasks from engagements that \
   were initiated by the caller's account.\n"]

module ListProspectingFromEngagementTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_prospecting_from_engagement_tasks_request ->
    ( list_prospecting_from_engagement_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_prospecting_from_engagement_tasks_request ->
    ( list_prospecting_from_engagement_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all prospecting tasks initiated by the caller's account. Supports optional filters by \
   task identifier, task name, or start time range. Results can be sorted using configurable \
   options. The response is paginated. Use the [NextToken] value from each response to retrieve \
   subsequent pages.\n"]

module ListResourceSnapshotJobs : sig
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
    list_resource_snapshot_jobs_request ->
    ( list_resource_snapshot_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_snapshot_jobs_request ->
    ( list_resource_snapshot_jobs_response Smaws_Lib.Response.t,
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
  " Lists resource snapshot jobs owned by the customer. This operation supports various filtering \
   scenarios, including listing all jobs owned by the caller, jobs for a specific engagement, jobs \
   with a specific status, or any combination of these filters. \n"]

module ListResourceSnapshots : sig
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
    list_resource_snapshots_request ->
    ( list_resource_snapshots_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_snapshots_request ->
    ( list_resource_snapshots_response Smaws_Lib.Response.t,
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
  "Retrieves a list of resource view snapshots based on specified criteria. This operation \
   supports various use cases, including: \n\n\
  \ {ul\n\
  \       {-  Fetching all snapshots associated with an engagement.\n\
  \           \n\
  \            }\n\
  \       {-  Retrieving snapshots of a specific resource type within an engagement.\n\
  \           \n\
  \            }\n\
  \       {-  Obtaining snapshots for a particular resource using a specified template.\n\
  \           \n\
  \            }\n\
  \       {-  Accessing the latest snapshot of a resource within an engagement.\n\
  \           \n\
  \            }\n\
  \       {-  Filtering snapshots by resource owner.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module ListSolutions : sig
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
    list_solutions_request ->
    ( list_solutions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_solutions_request ->
    ( list_solutions_response Smaws_Lib.Response.t,
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
  "Retrieves a list of Partner Solutions that the partner registered on Partner Central. This API \
   is used to generate a list of solutions that an end user selects from for association with an \
   opportunity.\n"]

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
[@@ocaml.doc "Returns a list of tags for a resource.\n"]

module PutSellingSystemSettings : sig
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
    put_selling_system_settings_request ->
    ( put_selling_system_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_selling_system_settings_request ->
    ( put_selling_system_settings_response Smaws_Lib.Response.t,
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
  "Updates the currently set system settings, which include the IAM Role used for resource \
   snapshot jobs.\n"]

module RejectEngagementInvitation : sig
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
    reject_engagement_invitation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    reject_engagement_invitation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
  "This action rejects an [EngagementInvitation] that AWS shared. Rejecting an invitation \
   indicates that the partner doesn't want to pursue the opportunity, and all related data will \
   become inaccessible thereafter.\n"]

module StartEngagementByAcceptingInvitationTask : sig
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
    start_engagement_by_accepting_invitation_task_request ->
    ( start_engagement_by_accepting_invitation_task_response,
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
    start_engagement_by_accepting_invitation_task_request ->
    ( start_engagement_by_accepting_invitation_task_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "This action starts the engagement by accepting an [EngagementInvitation]. The task is \
   asynchronous and involves the following steps: accepting the invitation, creating an \
   opportunity in the partner\226\128\153s account from the AWS opportunity, and copying details \
   for tracking. When completed, an [Opportunity Created] event is generated, indicating that the \
   opportunity has been successfully created in the partner's account.\n"]

module StartEngagementFromOpportunityTask : sig
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
    start_engagement_from_opportunity_task_request ->
    ( start_engagement_from_opportunity_task_response,
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
    start_engagement_from_opportunity_task_request ->
    ( start_engagement_from_opportunity_task_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Similar to [StartEngagementByAcceptingInvitationTask], this action is asynchronous and performs \
   multiple steps before completion. This action orchestrates a comprehensive workflow that \
   combines multiple API operations into a single task to create and initiate an engagement from \
   an existing opportunity. It automatically executes a sequence of operations including \
   [GetOpportunity], [CreateEngagement] (if it doesn't exist), [CreateResourceSnapshot], \
   [CreateResourceSnapshotJob], [CreateEngagementInvitation] (if not already invited/accepted), \
   and [SubmitOpportunity]. \n"]

module StartOpportunityFromEngagementTask : sig
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
    start_opportunity_from_engagement_task_request ->
    ( start_opportunity_from_engagement_task_response,
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
    start_opportunity_from_engagement_task_request ->
    ( start_opportunity_from_engagement_task_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "This action creates an opportunity from an existing engagement context. The task is \
   asynchronous and orchestrates the process of converting engagement contextual information into \
   a structured opportunity record within the partner's account.\n"]

module StartProspectingFromEngagementTask : sig
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
    start_prospecting_from_engagement_task_request ->
    ( start_prospecting_from_engagement_task_response,
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
    start_prospecting_from_engagement_task_request ->
    ( start_prospecting_from_engagement_task_response Smaws_Lib.Response.t,
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
  "Starts a task to convert one or more engagement contexts into new prospecting leads. The task \
   runs asynchronously. To poll for status, use [GetProspectingFromEngagementTask], or use \
   [ListProspectingFromEngagementTasks] to monitor multiple tasks.\n"]

module StartResourceSnapshotJob : sig
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
    start_resource_snapshot_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_resource_snapshot_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a resource snapshot job that has been previously created.\n"]

module StopResourceSnapshotJob : sig
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
    stop_resource_snapshot_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_resource_snapshot_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a resource snapshot job. The job must be started prior to being stopped.\n"]

module SubmitOpportunity : sig
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
    submit_opportunity_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    submit_opportunity_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
  "Use this action to submit an Opportunity that was previously created by partner for AWS review. \
   After you perform this action, the Opportunity becomes non-editable until it is reviewed by AWS \
   and has [ LifeCycle.ReviewStatus ] as either [Approved] or [Action Required]. \n"]

module TagResource : sig
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
    tag_resource_request ->
    ( tag_resource_response,
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
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Assigns one or more tags (key-value pairs) to the specified resource.\n"]

module UntagResource : sig
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
    untag_resource_request ->
    ( untag_resource_response,
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
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Removes a tag or tags from a resource.\n"]

module UpdateEngagementContext : sig
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
    update_engagement_context_request ->
    ( update_engagement_context_response,
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
    update_engagement_context_request ->
    ( update_engagement_context_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Updates the context information for an existing engagement with new or modified data.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateOpportunity : sig
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
    update_opportunity_request ->
    ( update_opportunity_response,
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
    update_opportunity_request ->
    ( update_opportunity_response Smaws_Lib.Response.t,
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
  "Updates the [Opportunity] record identified by a given [Identifier]. This operation allows you \
   to modify the details of an existing opportunity to reflect the latest information and \
   progress. Use this action to keep the opportunity record up-to-date and accurate.\n\n\
  \ When you perform updates, include the entire payload with each request. If any field is \
   omitted, the API assumes that the field is set to [null]. The best practice is to always \
   perform a [GetOpportunity] to retrieve the latest values, then send the complete payload with \
   the updated values to be changed.\n\
  \ "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
